import { useState, useEffect, useCallback, useMemo, useRef } from 'react'
import type { Lane, TimelineEvent } from '@/types/timeline'
import {
  fetchLanes,
  fetchEvents,
  fetchEventsWindowed,
  insertLane,
  updateLaneDb,
  deleteLaneDb,
  insertEvent,
  updateEventDb,
  deleteEventDb,
  mapDbLane,
  mapDbEvent,
  fracYearToDbTime,
} from '@/lib/api'
import {
  DEFAULT_PIXELS_PER_YEAR,
  TIMELINE_YEAR_MIN,
  TIMELINE_YEAR_MAX,
  resolveEventLinks,
  getCurrentYearFraction,
} from '@/lib/constants'
import { pushEvent } from '@/lib/analytics'

// ── Windowed-fetch configuration ─────────────────────────────────────────────
// Fetch this many extra years beyond the visible range on each side so panning
// doesn't immediately trigger a new request.
const PRELOAD_BUFFER_YEARS = 20

// Half-width of the initial fetch window, centred on today.  120 years covers
// almost every personal life timeline on first load.
const INITIAL_WINDOW_HALF = 60

// Don't bother expanding the fetched range unless the new target extends it by
// at least this many years (avoids micro-fetches during tiny pans).
const MIN_EXPAND_THRESHOLD = 5

export function useSupabaseTimeline(timelineId: string | null) {
  const [lanes, setLanes] = useState<Lane[]>([])
  const [events, setEvents] = useState<TimelineEvent[]>([])
  const [pixelsPerYear, setPixelsPerYear] = useState(DEFAULT_PIXELS_PER_YEAR)
  const [loading, setLoading] = useState(false)
  const [refreshKey, setRefreshKey] = useState(0)

  // Fixed full range for the timeline canvas
  const yearStart = TIMELINE_YEAR_MIN
  const yearEnd = TIMELINE_YEAR_MAX

  // Tracks what year range has been fetched for the current timeline.
  // Stored as a ref to avoid causing re-renders on update.
  const fetchedRangeRef = useRef<{ start: number; end: number } | null>(null)

  // Lets expandWindow detect a mid-flight timeline switch and discard stale results.
  const activeTimelineIdRef = useRef<string | null>(null)

  // Debounce timer for notifyVisibleWindow — cancelled on timeline switch.
  const windowCheckTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null)

  // Resolve dependency links (e.g. "start 2 years after event X")
  const resolvedEvents = useMemo(() => resolveEventLinks(events), [events])

  // Compute data range from events (for scroll-to-center)
  const allYears = resolvedEvents.flatMap(e =>
    e.endYear != null ? [e.startYear, e.endYear] : [e.startYear],
  )
  const dataYearMin = allYears.length > 0 ? Math.floor(Math.min(...allYears)) - 2 : 1990
  const dataYearMax = allYears.length > 0 ? Math.ceil(Math.max(...allYears)) + 2 : 2026

  // Initial load: fetch an INITIAL_WINDOW_HALF-year window centred on today.
  // On refreshTimeline() the same currently-fetched window is re-fetched.
  useEffect(() => {
    // Cancel any pending window-expansion debounce from the previous timeline.
    if (windowCheckTimerRef.current) {
      clearTimeout(windowCheckTimerRef.current)
      windowCheckTimerRef.current = null
    }

    if (!timelineId) {
      setLanes([])
      setEvents([])
      fetchedRangeRef.current = null
      activeTimelineIdRef.current = null
      return
    }

    activeTimelineIdRef.current = timelineId
    let cancelled = false
    setLoading(true)

    const now = getCurrentYearFraction()
    // On a plain refresh (same timelineId), re-use the existing fetched range so
    // we don't lose events the user has scrolled to.  On a timeline switch (new
    // timelineId), fetchedRangeRef was already reset to null by the previous
    // cleanup, so we fall through to the initial window.
    const prevRange = fetchedRangeRef.current
    const fetchStart = prevRange ? prevRange.start : now - INITIAL_WINDOW_HALF
    const fetchEnd   = prevRange ? prevRange.end   : now + INITIAL_WINDOW_HALF

    // Clear before async work so any concurrent notifyVisibleWindow calls don't
    // try to expand a range that is mid-flight.
    fetchedRangeRef.current = null

    async function load() {
      const [dbLanes, dbEvents] = await Promise.all([
        fetchLanes(timelineId!),
        fetchEventsWindowed(timelineId!, fetchStart, fetchEnd),
      ])
      if (cancelled) return
      setLanes(dbLanes.map(mapDbLane))
      setEvents(dbEvents.map(mapDbEvent))
      fetchedRangeRef.current = { start: fetchStart, end: fetchEnd }
      setLoading(false)
    }

    load()
    return () => {
      cancelled = true
      // Reset fetched range so the next effect (new timeline) always starts fresh.
      fetchedRangeRef.current = null
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [timelineId, refreshKey])

  /**
   * Incrementally expand the fetched range to cover [targetStart, targetEnd].
   * Fetches only the slices that haven't been loaded yet, then merges them into
   * the existing events state (dedup by id).
   */
  const expandWindow = useCallback(async (targetStart: number, targetEnd: number) => {
    if (!timelineId) return
    const fetched = fetchedRangeRef.current

    // Determine how far we actually need to extend on each side.
    const needLeft  = !fetched || targetStart < fetched.start - MIN_EXPAND_THRESHOLD
    const needRight = !fetched || targetEnd   > fetched.end   + MIN_EXPAND_THRESHOLD
    if (!needLeft && !needRight) return

    // Compute the new slices to fetch (avoid re-fetching the already-covered middle).
    const slices: Array<[number, number]> = []
    if (needLeft)  slices.push([targetStart, fetched ? fetched.start : targetEnd])
    if (needRight) slices.push([fetched ? fetched.end : targetStart, targetEnd])

    const newFetchedStart = Math.min(targetStart, fetched?.start ?? targetStart)
    const newFetchedEnd   = Math.max(targetEnd,   fetched?.end   ?? targetEnd)

    // Fetch all new slices in parallel.
    const results = await Promise.all(
      slices.map(([s, e]) => fetchEventsWindowed(timelineId, s, e)),
    )

    // Guard: discard results if the timeline changed while we were fetching.
    if (timelineId !== activeTimelineIdRef.current) return

    const newMapped = results.flat().map(mapDbEvent)

    // Merge: add only genuinely new events (dedup by id).
    setEvents(prev => {
      const existingIds = new Set(prev.map(e => e.id))
      const toAdd = newMapped.filter(e => !existingIds.has(e.id))
      if (toAdd.length === 0) return prev  // no change — avoid re-render
      return [...prev, ...toAdd]
    })

    fetchedRangeRef.current = { start: newFetchedStart, end: newFetchedEnd }
  }, [timelineId])

  /**
   * Called by TimelineContainer whenever the visible year range changes
   * (scroll, zoom, resize).  Debounced to 400 ms to avoid fetching on every
   * animation frame during a pan.
   *
   * The hook fetches the visible range plus PRELOAD_BUFFER_YEARS on each side
   * so panning doesn't trigger an immediate new request.
   */
  const notifyVisibleWindow = useCallback((visStart: number, visEnd: number) => {
    if (windowCheckTimerRef.current) clearTimeout(windowCheckTimerRef.current)
    windowCheckTimerRef.current = setTimeout(() => {
      expandWindow(visStart - PRELOAD_BUFFER_YEARS, visEnd + PRELOAD_BUFFER_YEARS)
    }, 400)
  }, [expandWindow])

  // ---- Event CRUD ----

  const addEvent = useCallback(
    async (event: Omit<TimelineEvent, 'id'>) => {
      if (!timelineId) return null
      // Optimistic: add with temp id
      const tempId = `temp-${Date.now()}`
      const optimistic: TimelineEvent = { ...event, id: tempId }
      setEvents(prev => [...prev, optimistic])

      const dbRow = await insertEvent(timelineId, {
        lane_id: event.laneId,
        title: event.title,
        description: event.description,
        start_time: fracYearToDbTime(event.startYear),
        end_time: event.endYear != null ? fracYearToDbTime(event.endYear) : null,
        fade_in_time: event.fadeInYear != null ? fracYearToDbTime(event.fadeInYear) : null,
        fade_out_time: event.fadeOutYear != null ? fracYearToDbTime(event.fadeOutYear) : null,
        color: event.color,
        emoji: event.emoji,
        point_value: event.pointValue,
        value_projection: event.valueProjection,
        visibility: event.visibility ?? 'public',
        link: event.link ?? null,
        url: event.url ?? null,
        location: event.location ?? null,
        rating: event.rating ?? null,
        source: event.source ?? null,
        metadata: event.metadata ?? null,
      })

      if (dbRow) {
        const mapped = mapDbEvent(dbRow)
        setEvents(prev => prev.map(e => (e.id === tempId ? mapped : e)))
        pushEvent('click', window.location.pathname, 'add_event', { type: event.type, source: event.source ?? null, lane_id: event.laneId })
        return mapped
      } else {
        // Rollback
        setEvents(prev => prev.filter(e => e.id !== tempId))
        return null
      }
    },
    [timelineId],
  )

  const updateEvent = useCallback(
    async (id: string, updates: Partial<Omit<TimelineEvent, 'id'>>) => {
      // Optimistic update
      setEvents(prev => prev.map(e => (e.id === id ? { ...e, ...updates } : e)))

      const dbUpdates: Record<string, unknown> = {}
      if (updates.laneId !== undefined) dbUpdates.lane_id = updates.laneId
      if (updates.title !== undefined) dbUpdates.title = updates.title
      if (updates.description !== undefined) dbUpdates.description = updates.description
      if (updates.startYear !== undefined) dbUpdates.start_time = fracYearToDbTime(updates.startYear)
      if ('endYear' in updates) dbUpdates.end_time = updates.endYear != null ? fracYearToDbTime(updates.endYear) : null
      if ('fadeInYear' in updates) dbUpdates.fade_in_time = updates.fadeInYear != null ? fracYearToDbTime(updates.fadeInYear) : null
      if ('fadeOutYear' in updates) dbUpdates.fade_out_time = updates.fadeOutYear != null ? fracYearToDbTime(updates.fadeOutYear) : null
      if ('color' in updates) dbUpdates.color = updates.color ?? null
      if ('emoji' in updates) dbUpdates.emoji = updates.emoji ?? null
      if ('pointValue' in updates) dbUpdates.point_value = updates.pointValue ?? null
      if ('valueProjection' in updates) dbUpdates.value_projection = updates.valueProjection ?? null
      if (updates.visibility !== undefined) dbUpdates.visibility = updates.visibility
      if ('link' in updates) dbUpdates.link = updates.link ?? null
      if ('url' in updates) dbUpdates.url = updates.url ?? null
      if ('location' in updates) dbUpdates.location = updates.location ?? null
      if ('rating' in updates) dbUpdates.rating = updates.rating ?? null
      if ('source' in updates) dbUpdates.source = updates.source ?? null
      if ('metadata' in updates) dbUpdates.metadata = updates.metadata ?? null

      const ok = await updateEventDb(id, dbUpdates as Parameters<typeof updateEventDb>[1])
      if (ok) {
        pushEvent('click', window.location.pathname, 'edit_event')
      } else {
        // Rollback: re-fetch the currently cached window (not the full timeline)
        if (timelineId) {
          const fetched = fetchedRangeRef.current
          const dbEvents = fetched
            ? await fetchEventsWindowed(timelineId, fetched.start, fetched.end)
            : await fetchEvents(timelineId)
          setEvents(dbEvents.map(mapDbEvent))
        }
      }
    },
    [timelineId],
  )

  const deleteEvent = useCallback(
    async (id: string) => {
      const prev = events
      // Find events that link to this one
      const dependents = events.filter(
        e => e.link?.anchorType === 'event' && e.link?.linkedEventId === id,
      )
      const toDelete = dependents.filter(e => e.link?.onDelete === 'delete')
      const toFreeze = dependents.filter(e => e.link?.onDelete !== 'delete')

      // Optimistic: remove target + dependents-to-delete, strip link from frozen
      setEvents(p =>
        p
          .filter(e => e.id !== id && !toDelete.find(d => d.id === e.id))
          .map(e => toFreeze.find(f => f.id === e.id) ? { ...e, link: undefined } : e),
      )

      const ok = await deleteEventDb(id)
      if (!ok) {
        setEvents(prev)
        return
      }
      pushEvent('click', window.location.pathname, 'delete_event')

      // Cascade deletes + freeze (remove link) in parallel
      await Promise.all([
        ...toDelete.map(d => deleteEventDb(d.id)),
        ...toFreeze.map(f => updateEventDb(f.id, { link: null })),
      ])
    },
    [events],
  )

  // ---- Lane CRUD ----

  const addLane = useCallback(
    async (lane: Omit<Lane, 'id' | 'order' | 'isDefault'>) => {
      if (!timelineId) return null
      const order = lanes.length
      const tempId = `temp-${Date.now()}`
      const optimistic: Lane = { ...lane, id: tempId, isDefault: false, order }
      setLanes(prev => [...prev, optimistic])

      const dbRow = await insertLane(timelineId, {
        name: lane.name,
        color: lane.color,
        visible: lane.visible,
        order,
        emoji: lane.emoji,
        visibility: lane.visibility ?? 'public',
      })

      if (dbRow) {
        const mapped = mapDbLane(dbRow)
        setLanes(prev => prev.map(l => (l.id === tempId ? mapped : l)))
        pushEvent('click', window.location.pathname, 'add_lane', { name: lane.name })
        return mapped
      } else {
        setLanes(prev => prev.filter(l => l.id !== tempId))
        return null
      }
    },
    [timelineId, lanes.length],
  )

  const updateLane = useCallback(
    async (id: string, updates: Partial<Omit<Lane, 'id' | 'isDefault'>>) => {
      setLanes(prev => prev.map(l => (l.id === id ? { ...l, ...updates } : l)))

      const dbUpdates: Record<string, unknown> = {}
      if (updates.name !== undefined) dbUpdates.name = updates.name
      if (updates.color !== undefined) dbUpdates.color = updates.color
      if (updates.visible !== undefined) dbUpdates.visible = updates.visible
      if (updates.order !== undefined) dbUpdates.order = updates.order
      if ('emoji' in updates) dbUpdates.emoji = updates.emoji ?? null
      if (updates.visibility !== undefined) dbUpdates.visibility = updates.visibility

      const ok = await updateLaneDb(id, dbUpdates as Parameters<typeof updateLaneDb>[1])
      if (!ok && timelineId) {
        const dbLanes = await fetchLanes(timelineId)
        setLanes(dbLanes.map(mapDbLane))
      }
    },
    [timelineId],
  )

  const deleteLane = useCallback(
    async (id: string) => {
      const prevLanes = lanes
      const prevEvents = events
      setLanes(p => p.filter(l => l.id !== id))
      setEvents(p => p.filter(e => e.laneId !== id))

      const ok = await deleteLaneDb(id)
      if (ok) {
        pushEvent('click', window.location.pathname, 'delete_lane')
      } else {
        setLanes(prevLanes)
        setEvents(prevEvents)
      }
    },
    [lanes, events],
  )

  const moveLane = useCallback(
    async (id: string, direction: 'up' | 'down') => {
      const sorted = [...lanes].sort((a, b) => a.order - b.order)
      const idx = sorted.findIndex(l => l.id === id)
      if (idx < 0) return
      const swapIdx = direction === 'up' ? idx - 1 : idx + 1
      if (swapIdx < 0 || swapIdx >= sorted.length) return
      const laneA = sorted[idx]
      const laneB = sorted[swapIdx]
      const orderA = laneB.order
      const orderB = laneA.order
      setLanes(prev => prev.map(l => {
        if (l.id === laneA.id) return { ...l, order: orderA }
        if (l.id === laneB.id) return { ...l, order: orderB }
        return l
      }).sort((a, b) => a.order - b.order))
      await Promise.all([
        updateLaneDb(laneA.id, { order: orderA }),
        updateLaneDb(laneB.id, { order: orderB }),
      ])
    },
    [lanes],
  )

  const refreshTimeline = useCallback(() => setRefreshKey(k => k + 1), [])

  const toggleLaneVisibility = useCallback(
    async (id: string) => {
      const lane = lanes.find(l => l.id === id)
      if (!lane) return
      const newVisible = !lane.visible
      setLanes(prev =>
        prev.map(l => (l.id === id ? { ...l, visible: newVisible } : l)),
      )
      await updateLaneDb(id, { visible: newVisible })
    },
    [lanes],
  )

  return {
    lanes,
    events: resolvedEvents,
    rawEvents: events,
    pixelsPerYear,
    setPixelsPerYear,
    yearStart,
    yearEnd,
    dataYearMin,
    dataYearMax,
    addEvent,
    updateEvent,
    deleteEvent,
    addLane,
    updateLane,
    deleteLane,
    moveLane,
    toggleLaneVisibility,
    refreshTimeline,
    loading,
    /** Notify the hook of the current visible year range so it can prefetch
     *  surrounding data.  Call this from TimelineContainer on scroll/zoom. */
    notifyVisibleWindow,
  }
}
