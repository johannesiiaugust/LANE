import { useRef, useEffect, useLayoutEffect, useMemo, useCallback, useState, type MutableRefObject } from 'react'
import type { Lane, TimelineEvent } from '@/types/timeline'
import type { DbPersona, DbTimeline, AlignedPersonaEvent, OverlayTimelineEvent } from '@/types/database'
import type { PersonaDisplayMode } from '@/hooks/usePersonas'
import type { OverlayDisplayMode } from '@/hooks/useTimelineOverlays'
import { LaneSidebar, type PersonaSidebarSection, type OverlaySidebarSection } from './LaneSidebar'
import { TimelineHeader } from './TimelineHeader'
import { YearGrid } from './YearGrid'
import { TimelineLane } from './TimelineLane'
import { TimelineEventBar } from './TimelineEvent'
import { TotalAssetsLane } from './TotalAssetsLane'
import { PersonaSeparateTimeline } from './PersonaSeparateTimeline'
import { OverlaySeparateTimeline } from './OverlaySeparateTimeline'
import { getCurrentYearFraction, MIN_PIXELS_PER_YEAR, MAX_PIXELS_PER_YEAR, fracYearToDateLabel } from '@/lib/constants'
import { useSizeConfig, scaleSizeConfig, SIZE_PRESETS } from '@/contexts/UiSizeContext'

// ── Dynamic canvas windowing ──────────────────────────────────────────────────

const MAX_CANVAS_PX = 10_000_000  // safe max element width across browsers

function computeEffWindow(centerYear: number, ppy: number, yrStart: number, yrEnd: number) {
  const totalW = (yrEnd - yrStart) * ppy
  if (totalW <= MAX_CANVAS_PX) return { effStart: yrStart, effEnd: yrEnd }
  let effStart = Math.max(yrStart, centerYear - MAX_CANVAS_PX / (2 * ppy))
  let effEnd = effStart + MAX_CANVAS_PX / ppy
  if (effEnd > yrEnd) {
    effEnd = yrEnd
    effStart = Math.max(yrStart, yrEnd - MAX_CANVAS_PX / ppy)
  }
  return { effStart, effEnd }
}

// ── Overlap detection & row assignment ───────────────────────────────────────

function eventRange(e: TimelineEvent): [number, number] {
  const end = e.type === 'range' && e.endYear != null ? e.endYear : e.startYear + 0.5
  return [e.startYear, end]
}

function hasAnyOverlaps(events: TimelineEvent[]): boolean {
  for (let i = 0; i < events.length; i++) {
    const [as, ae] = eventRange(events[i])
    for (let j = i + 1; j < events.length; j++) {
      const [bs, be] = eventRange(events[j])
      if (as < be && bs < ae) return true
    }
  }
  return false
}

/** Assign events to rows: newest startYear → row 0 (top), older events pushed down. */
function assignEventRows(events: TimelineEvent[]): Map<string, number> {
  const sorted = [...events].sort((a, b) => b.startYear - a.startYear) // newest first
  const rowSlots: Array<[number, number][]> = []
  const assignment = new Map<string, number>()
  for (const event of sorted) {
    const [evS, evE] = eventRange(event)
    let placed = false
    for (let r = 0; r < rowSlots.length; r++) {
      if (rowSlots[r].every(([s, e]) => evE <= s || evS >= e)) {
        rowSlots[r].push([evS, evE])
        assignment.set(event.id, r)
        placed = true
        break
      }
    }
    if (!placed) {
      rowSlots.push([[evS, evE]])
      assignment.set(event.id, rowSlots.length - 1)
    }
  }
  return assignment
}

// ── Generic overlap detection & row assignment for persona / overlay events ──

type GenericEvent = { id: string; display_start_year: number; display_end_year: number | null; type: string }

function hasAnyOverlapsGeneric(events: GenericEvent[]): boolean {
  for (let i = 0; i < events.length; i++) {
    const as = events[i].display_start_year
    const ae = events[i].display_end_year ?? events[i].display_start_year + 0.5
    for (let j = i + 1; j < events.length; j++) {
      const bs = events[j].display_start_year
      const be = events[j].display_end_year ?? events[j].display_start_year + 0.5
      if (as < be && bs < ae) return true
    }
  }
  return false
}

function assignRowsGeneric(events: GenericEvent[]): Map<string, number> {
  const sorted = [...events].sort((a, b) => b.display_start_year - a.display_start_year)
  const rowSlots: Array<[number, number][]> = []
  const assignment = new Map<string, number>()
  for (const event of sorted) {
    const evS = event.display_start_year
    const evE = event.display_end_year ?? event.display_start_year + 0.5
    let placed = false
    for (let r = 0; r < rowSlots.length; r++) {
      if (rowSlots[r].every(([s, e]) => evE <= s || evS >= e)) {
        rowSlots[r].push([evS, evE])
        assignment.set(event.id, r)
        placed = true
        break
      }
    }
    if (!placed) {
      rowSlots.push([[evS, evE]])
      assignment.set(event.id, rowSlots.length - 1)
    }
  }
  return assignment
}

interface TimelineContainerProps {
  lanes: Lane[]
  events: TimelineEvent[]
  yearStart: number
  yearEnd: number
  pixelsPerYear: number
  onToggleVisibility: (id: string) => void
  onMoveLane: (id: string, direction: 'up' | 'down') => void
  onEditLane: (lane: Lane) => void
  onDeleteLane: (lane: Lane) => void
  onZoom: (ppy: number) => void
  onEventClick: (event: TimelineEvent, element: HTMLElement, clientX: number, clientY: number) => void
  onLaneClick: (laneId: string, year: number) => void
  onLaneDragRange: (laneId: string, startYear: number, endYear: number) => void
  onEventDrop: (eventId: string, newLaneId: string, newStartYear: number, newEndYear: number | undefined) => void
  personaEvents: AlignedPersonaEvent[]
  personas: DbPersona[]
  personaDisplayModes: Map<string, PersonaDisplayMode>
  dataYearMin: number
  dataYearMax: number
  scrollToTodayRef?: MutableRefObject<(() => void) | null>
  scrollToEventRef?: MutableRefObject<((event: TimelineEvent) => void) | null>
  lifeSpan?: { birthYear: number; endYear: number | null; color?: string }
  overlayEvents?: OverlayTimelineEvent[]
  overlayDisplayModes?: Map<string, OverlayDisplayMode>
  activeOverlayTimelines?: DbTimeline[]
  onTodayVisibilityChange?: (offScreen: { direction: 'left' | 'right' } | null) => void
}

export function TimelineContainer({
  lanes,
  events,
  yearStart,
  yearEnd,
  pixelsPerYear,
  onZoom,
  onToggleVisibility,
  onMoveLane,
  onEditLane,
  onDeleteLane,
  onEventClick,
  onLaneClick,
  onLaneDragRange,
  onEventDrop,
  personaEvents,
  personas,
  personaDisplayModes,
  dataYearMin,
  dataYearMax,
  scrollToTodayRef,
  scrollToEventRef,
  lifeSpan,
  overlayEvents = [],
  overlayDisplayModes = new Map(),
  activeOverlayTimelines = [],
  onTodayVisibilityChange,
}: TimelineContainerProps) {
  const { sc, size, updateFitScreenConfig } = useSizeConfig()
  const { BASE_LANE_HEIGHT, PERSONA_SUB_ROW_HEIGHT, TOTAL_ASSETS_HEIGHT } = sc
  const containerRef = useRef<HTMLDivElement>(null)
  const scrollRef = useRef<HTMLDivElement>(null)
  const hasScrolledRef = useRef<string | null>(null)
  const cursorLaneRef = useRef<HTMLDivElement>(null)
  const cursorHeaderRef = useRef<HTMLDivElement>(null)
  const cursorPopupRef = useRef<HTMLDivElement>(null)
  const sidebarInnerRef = useRef<HTMLDivElement>(null)

  // Dynamic canvas windowing: when total width exceeds MAX_CANVAS_PX, render only a window
  const [viewCenterYear, setViewCenterYear] = useState(() => getCurrentYearFraction())
  const viewCenterYearRef = useRef(viewCenterYear)

  // Compute the effective year window for this render
  const { effStart: effectiveYearStart, effEnd: effectiveYearEnd } =
    computeEffWindow(viewCenterYear, pixelsPerYear, yearStart, yearEnd)
  const effectiveTotalWidth = (effectiveYearEnd - effectiveYearStart) * pixelsPerYear

  const handlePan = useCallback((dx: number) => {
    if (scrollRef.current) scrollRef.current.scrollLeft -= dx
  }, [])

  // Scroll position tracking for viewport-aware header/grid rendering
  const [scrollLeft, setScrollLeft] = useState(0)
  const [viewportWidth, setViewportWidth] = useState(1200)
  const rafRef = useRef<number | null>(null)
  const zoomRafRef = useRef<number | null>(null)
  const shiftingWindowRef = useRef(false)
  useEffect(() => {
    const el = scrollRef.current
    if (!el) return
    const onScroll = () => {
      if (rafRef.current) cancelAnimationFrame(rafRef.current)
      rafRef.current = requestAnimationFrame(() => {
        const sl = el.scrollLeft
        // Sync sidebar overlay vertical position (always, before any early return)
        if (sidebarInnerRef.current) {
          sidebarInnerRef.current.style.transform = `translateY(-${el.scrollTop}px)`
        }
        const totalW = (yearEnd - yearStart) * ppyRef.current
        // When windowed: shift the effective window if user scrolls near either edge,
        // so they can always reach any event by scrolling (infinite-scroll effect).
        if (totalW > MAX_CANVAS_PX && !shiftingWindowRef.current) {
          const edgeThreshold = MAX_CANVAS_PX * 0.2
          if (sl < edgeThreshold || sl > MAX_CANVAS_PX - edgeThreshold - el.clientWidth) {
            const centerPx = sl + el.clientWidth / 2
            const newCenterYear = yearStartRef.current + centerPx / ppyRef.current
            const { effStart: newEffStart } = computeEffWindow(newCenterYear, ppyRef.current, yearStart, yearEnd)
            if (newEffStart !== yearStartRef.current) {
              shiftingWindowRef.current = true
              yearStartRef.current = newEffStart
              viewCenterYearRef.current = newCenterYear
              pendingScrollRef.current = (newCenterYear - newEffStart) * ppyRef.current - el.clientWidth / 2
              setViewCenterYear(newCenterYear)
              return
            }
          }
        }
        shiftingWindowRef.current = false
        setScrollLeft(sl)
        setViewportWidth(el.clientWidth)
      })
    }
    const ro = new ResizeObserver(() => {
      setScrollLeft(el.scrollLeft)
      setViewportWidth(el.clientWidth)
    })
    el.addEventListener('scroll', onScroll, { passive: true })
    ro.observe(el)
    setScrollLeft(el.scrollLeft)
    setViewportWidth(el.clientWidth)
    return () => {
      el.removeEventListener('scroll', onScroll)
      ro.disconnect()
      if (rafRef.current) cancelAnimationFrame(rafRef.current)
    }
  }, [yearStart, yearEnd])

  // Notify parent when today line goes off-screen left or right
  useEffect(() => {
    if (!onTodayVisibilityChange) return
    const today = getCurrentYearFraction()
    const todayPx = (today - effectiveYearStart) * pixelsPerYear
    const visible = todayPx >= scrollLeft && todayPx <= scrollLeft + viewportWidth
    if (visible) {
      onTodayVisibilityChange(null)
    } else {
      onTodayVisibilityChange({ direction: todayPx < scrollLeft ? 'left' : 'right' })
    }
  }, [scrollLeft, viewportWidth, effectiveYearStart, pixelsPerYear, onTodayVisibilityChange])

  // Cursor position line — updated via direct DOM to avoid re-renders on every mousemove
  useEffect(() => {
    const el = scrollRef.current
    if (!el) return

    const show = (clientX: number, clientY: number) => {
      const rect = el.getBoundingClientRect()
      const viewX = clientX - rect.left          // viewport-relative (for header)
      const contentX = el.scrollLeft + viewX     // content-relative (for lanes)
      if (cursorLaneRef.current) {
        cursorLaneRef.current.style.left = `${contentX}px`
        cursorLaneRef.current.style.display = 'block'
      }
      if (cursorHeaderRef.current) {
        cursorHeaderRef.current.style.left = `${viewX}px`
        cursorHeaderRef.current.style.display = 'block'
      }
      if (cursorPopupRef.current) {
        const year = yearStartRef.current + contentX / ppyRef.current
        cursorPopupRef.current.textContent = fracYearToDateLabel(year)
        cursorPopupRef.current.style.left = `${clientX - 8}px`
        cursorPopupRef.current.style.top = `${clientY - 36}px`
        cursorPopupRef.current.style.display = 'block'
      }
    }

    const hide = () => {
      if (cursorLaneRef.current) cursorLaneRef.current.style.display = 'none'
      if (cursorHeaderRef.current) cursorHeaderRef.current.style.display = 'none'
      if (cursorPopupRef.current) cursorPopupRef.current.style.display = 'none'
    }

    const onMouseMove = (e: MouseEvent) => show(e.clientX, e.clientY)
    const onMouseLeave = () => hide()
    const onTouchMove = (e: TouchEvent) => {
      if (e.touches.length === 1) show(e.touches[0].clientX, e.touches[0].clientY)
    }
    const onTouchEnd = () => hide()

    el.addEventListener('mousemove', onMouseMove)
    el.addEventListener('mouseleave', onMouseLeave)
    el.addEventListener('touchmove', onTouchMove, { passive: true })
    el.addEventListener('touchend', onTouchEnd, { passive: true })
    return () => {
      el.removeEventListener('mousemove', onMouseMove)
      el.removeEventListener('mouseleave', onMouseLeave)
      el.removeEventListener('touchmove', onTouchMove)
      el.removeEventListener('touchend', onTouchEnd)
    }
  }, [])

  // Refs for latest ppy/effectiveYearStart — avoid stale closures in wheel handler
  const ppyRef = useRef(pixelsPerYear)
  const yearStartRef = useRef(effectiveYearStart)
  useEffect(() => { ppyRef.current = pixelsPerYear }, [pixelsPerYear])
  // yearStartRef tracks effectiveYearStart; updated synchronously below + in wheel handler
  yearStartRef.current = effectiveYearStart

  // Pending scroll applied after React re-renders new content width
  const pendingScrollRef = useRef<number | null>(null)
  const prevPpyRef = useRef(pixelsPerYear)

  // Zoom toward center when pixelsPerYear changes from toolbar slider/buttons (not from wheel/pinch,
  // which set pendingScrollRef themselves before triggering a re-render).
  useLayoutEffect(() => {
    const prev = prevPpyRef.current
    prevPpyRef.current = pixelsPerYear
    if (prev === pixelsPerYear || pendingScrollRef.current !== null) return
    const el = scrollRef.current
    if (!el) return
    const centerPx = el.scrollLeft + el.clientWidth / 2
    const centerYear = yearStartRef.current + centerPx / prev
    const { effStart } = computeEffWindow(centerYear, pixelsPerYear, yearStart, yearEnd)
    yearStartRef.current = effStart
    viewCenterYearRef.current = centerYear
    pendingScrollRef.current = Math.max(0, (centerYear - effStart) * pixelsPerYear - el.clientWidth / 2)
  }, [pixelsPerYear, yearStart, yearEnd])

  useLayoutEffect(() => {
    if (pendingScrollRef.current !== null && scrollRef.current) {
      // Force layout recalculation before setting scrollLeft (browser may clamp to old width)
      void scrollRef.current.scrollWidth
      scrollRef.current.scrollLeft = pendingScrollRef.current
      pendingScrollRef.current = null
      shiftingWindowRef.current = false  // allow edge detection again after shift is applied
    }
  }, [pixelsPerYear, viewCenterYear])

  // Register scroll-to-today function for external callers (e.g. Toolbar button)
  useEffect(() => {
    if (!scrollToTodayRef) return
    scrollToTodayRef.current = () => {
      const el = scrollRef.current
      if (!el) return
      const today = getCurrentYearFraction()
      const { effStart } = computeEffWindow(today, pixelsPerYear, yearStart, yearEnd)
      yearStartRef.current = effStart
      viewCenterYearRef.current = today
      pendingScrollRef.current = Math.max(0, (today - effStart) * pixelsPerYear - el.clientWidth / 2)
      setViewCenterYear(today)
    }
  }, [scrollToTodayRef, yearStart, yearEnd, pixelsPerYear])

  // Register scroll-to-event (search navigation): zoom to fit the event + center it
  useEffect(() => {
    if (!scrollToEventRef) return
    scrollToEventRef.current = (event: TimelineEvent) => {
      const el = scrollRef.current
      if (!el) return
      const duration = event.type === 'range' && event.endYear != null
        ? event.endYear - event.startYear : 0
      const usableWidth = Math.max(200, el.clientWidth - sc.SIDEBAR_WIDTH)
      const ONE_WEEK = 1 / 52  // fractional year
      let newPpy: number
      if (duration > 2 * ONE_WEEK) {
        // Range event longer than 2 weeks: fit with 40% padding
        newPpy = usableWidth / (duration * 1.4)
        newPpy = Math.max(MIN_PIXELS_PER_YEAR, Math.min(MAX_PIXELS_PER_YEAR, newPpy))
      } else {
        // Point event or short range: show 1 week on each side (2 weeks total)
        newPpy = Math.min(MAX_PIXELS_PER_YEAR, usableWidth / (2 * ONE_WEEK))
      }
      const centerYear = event.startYear + duration / 2
      const { effStart } = computeEffWindow(centerYear, newPpy, yearStart, yearEnd)
      yearStartRef.current = effStart
      viewCenterYearRef.current = centerYear
      ppyRef.current = newPpy
      pendingScrollRef.current = Math.max(0, (centerYear - effStart) * newPpy - usableWidth / 2)
      setViewCenterYear(centerYear)
      onZoom(newPpy)
    }
  }, [scrollToEventRef, yearStart, yearEnd, sc.SIDEBAR_WIDTH, onZoom])

  // Wheel zoom toward cursor
  useEffect(() => {
    const el = scrollRef.current
    if (!el) return
    const onWheel = (e: WheelEvent) => {
      if (Math.abs(e.deltaX) > Math.abs(e.deltaY)) return
      e.preventDefault()
      const ppy = ppyRef.current
      const rect = el.getBoundingClientRect()
      const mouseX = e.clientX - rect.left
      // Chain pending scroll so rapid wheel events don't drift off-cursor
      const sl = pendingScrollRef.current ?? el.scrollLeft
      const yearAtCursor = yearStartRef.current + (sl + mouseX) / ppy
      let dy = e.deltaY
      if (e.deltaMode === 1) dy *= 32
      if (e.deltaMode === 2) dy *= 300
      const factor = Math.exp(-dy * 0.012)
      const newPpy = Math.max(MIN_PIXELS_PER_YEAR, Math.min(MAX_PIXELS_PER_YEAR, ppy * factor))
      ppyRef.current = newPpy
      // Compute new effective window for the new zoom level
      const { effStart: newEffStart } = computeEffWindow(yearAtCursor, newPpy, yearStart, yearEnd)
      yearStartRef.current = newEffStart
      viewCenterYearRef.current = yearAtCursor
      pendingScrollRef.current = (yearAtCursor - newEffStart) * newPpy - mouseX
      // Throttle React re-renders to one per animation frame
      if (zoomRafRef.current !== null) cancelAnimationFrame(zoomRafRef.current)
      zoomRafRef.current = requestAnimationFrame(() => {
        zoomRafRef.current = null
        setViewCenterYear(viewCenterYearRef.current)
        onZoom(ppyRef.current)
      })
    }
    el.addEventListener('wheel', onWheel, { passive: false })
    return () => {
      el.removeEventListener('wheel', onWheel)
      if (zoomRafRef.current !== null) cancelAnimationFrame(zoomRafRef.current)
    }
  }, [onZoom, yearStart, yearEnd])

  // Touch pinch-to-zoom — mirrors wheel zoom logic but uses finger distance as the scale signal
  useEffect(() => {
    const el = scrollRef.current
    if (!el) return

    let lastDist = 0
    let lastMidX = 0
    let lastMidY = 0

    const touchDist = (t: TouchList) => {
      const dx = t[1].clientX - t[0].clientX
      const dy = t[1].clientY - t[0].clientY
      return Math.sqrt(dx * dx + dy * dy)
    }

    const onTouchStart = (e: TouchEvent) => {
      if (e.touches.length === 2) {
        e.preventDefault() // prevent browser from starting its own scroll/zoom gesture
        lastDist = touchDist(e.touches)
        lastMidX = (e.touches[0].clientX + e.touches[1].clientX) / 2
        lastMidY = (e.touches[0].clientY + e.touches[1].clientY) / 2
      }
    }

    const onTouchMove = (e: TouchEvent) => {
      if (e.touches.length !== 2) return
      e.preventDefault() // block browser page-zoom

      const dist = touchDist(e.touches)
      const midX = (e.touches[0].clientX + e.touches[1].clientX) / 2
      const midY = (e.touches[0].clientY + e.touches[1].clientY) / 2

      if (lastDist === 0) { lastDist = dist; lastMidX = midX; lastMidY = midY; return }

      const factor = dist / lastDist
      const dMidX = midX - lastMidX
      const dMidY = midY - lastMidY
      lastDist = dist; lastMidX = midX; lastMidY = midY

      const rect = el.getBoundingClientRect()
      const touchX = midX - rect.left

      const ppy = ppyRef.current
      // Use pendingScrollRef to avoid stale scrollLeft during rapid events
      const sl = pendingScrollRef.current ?? el.scrollLeft
      const yearAtPinch = yearStartRef.current + (sl + touchX) / ppy
      const newPpy = Math.max(MIN_PIXELS_PER_YEAR, Math.min(MAX_PIXELS_PER_YEAR, ppy * factor))
      ppyRef.current = newPpy

      const { effStart: newEffStart } = computeEffWindow(yearAtPinch, newPpy, yearStart, yearEnd)
      yearStartRef.current = newEffStart
      viewCenterYearRef.current = yearAtPinch
      // Compensate for finger translation (dMidX) so the pinch anchor stays fixed
      pendingScrollRef.current = (yearAtPinch - newEffStart) * newPpy - touchX - dMidX

      // Vertical pan from finger translation
      el.scrollTop -= dMidY

      if (zoomRafRef.current !== null) cancelAnimationFrame(zoomRafRef.current)
      zoomRafRef.current = requestAnimationFrame(() => {
        zoomRafRef.current = null
        setViewCenterYear(viewCenterYearRef.current)
        onZoom(ppyRef.current)
      })
    }

    const onTouchEnd = () => { lastDist = 0; lastMidX = 0; lastMidY = 0 }

    el.addEventListener('touchstart', onTouchStart, { passive: false }) // must be non-passive to call preventDefault
    el.addEventListener('touchmove', onTouchMove, { passive: false })
    el.addEventListener('touchend', onTouchEnd, { passive: true })
    return () => {
      el.removeEventListener('touchstart', onTouchStart)
      el.removeEventListener('touchmove', onTouchMove)
      el.removeEventListener('touchend', onTouchEnd)
    }
  }, [onZoom, yearStart, yearEnd])

  const [expandedLanes, setExpandedLanes] = useState<Set<string>>(new Set())
  const handleToggleExpand = useCallback((laneId: string) => {
    setExpandedLanes(prev => {
      const next = new Set(prev)
      next.has(laneId) ? next.delete(laneId) : next.add(laneId)
      return next
    })
  }, [])

  const [expandedPersonaRows, setExpandedPersonaRows] = useState<Set<string>>(new Set())
  const handleTogglePersonaExpand = useCallback((laneId: string, personaId: string) => {
    setExpandedPersonaRows(prev => {
      const next = new Set(prev)
      const key = `${laneId}:${personaId}`
      next.has(key) ? next.delete(key) : next.add(key)
      return next
    })
  }, [])

  const [expandedOverlayRows, setExpandedOverlayRows] = useState<Set<string>>(new Set())
  const handleToggleOverlayExpand = useCallback((laneId: string, timelineId: string) => {
    setExpandedOverlayRows(prev => {
      const next = new Set(prev)
      const key = `${laneId}:${timelineId}`
      next.has(key) ? next.delete(key) : next.add(key)
      return next
    })
  }, [])

  const [expandedSeparatePersonaLanes, setExpandedSeparatePersonaLanes] = useState<Set<string>>(new Set())
  const handleToggleSeparatePersonaLane = useCallback((personaId: string, laneName: string) => {
    setExpandedSeparatePersonaLanes(prev => {
      const next = new Set(prev)
      const key = `${personaId}:${laneName}`
      next.has(key) ? next.delete(key) : next.add(key)
      return next
    })
  }, [])

  const [expandedSeparateOverlayLanes, setExpandedSeparateOverlayLanes] = useState<Set<string>>(new Set())
  const handleToggleSeparateOverlayLane = useCallback((timelineId: string, laneName: string) => {
    setExpandedSeparateOverlayLanes(prev => {
      const next = new Set(prev)
      const key = `${timelineId}:${laneName}`
      next.has(key) ? next.delete(key) : next.add(key)
      return next
    })
  }, [])

  // ── Drag-drop ─────────────────────────────────────────────────────────────
  interface DragState {
    event: TimelineEvent
    mode: 'move' | 'extend-forward' | 'extend-backward'
    startClientX: number
    currentLaneId: string
    endOn: 'mouseup' | 'click'
  }
  interface DragPreview {
    event: TimelineEvent
    laneId: string
    startYear: number
    endYear: number | undefined
  }

  const dragStateRef = useRef<DragState | null>(null)
  const [dragPreview, setDragPreview] = useState<DragPreview | null>(null)
  const dragPreviewRef = useRef<DragPreview | null>(null)
  const onEventDropRef = useRef(onEventDrop)
  useEffect(() => { onEventDropRef.current = onEventDrop }, [onEventDrop])

  // Suppresses the next onLaneClick (add-event dialog) — set when committing a drag so the
  // mouseup that commits doesn't also open the "add event" dialog.
  const suppressNextLaneClickRef = useRef(false)
  const handleLaneClickInternal = useCallback((laneId: string, year: number) => {
    if (suppressNextLaneClickRef.current) { suppressNextLaneClickRef.current = false; return }
    onLaneClick(laneId, year)
  }, [onLaneClick])

  const handleDragMove = useCallback((e: MouseEvent) => {
    const drag = dragStateRef.current
    if (!drag) return
    const ppy = ppyRef.current

    // Absolute mouse year for extend modes; delta-based for move
    const scrollEl = scrollRef.current
    const rect = scrollEl?.getBoundingClientRect()
    const mouseYear = rect
      ? yearStartRef.current + (scrollEl!.scrollLeft + e.clientX - rect.left) / ppy
      : drag.event.startYear

    // Only allow lane switching in move mode
    let targetLaneId = drag.currentLaneId
    if (drag.mode === 'move') {
      const els = document.elementsFromPoint(e.clientX, e.clientY)
      const laneEl = els.find(el => (el as HTMLElement).getAttribute?.('data-lane-id'))
      targetLaneId = (laneEl as HTMLElement | undefined)?.getAttribute('data-lane-id') ?? drag.currentLaneId
      drag.currentLaneId = targetLaneId
    }

    let newStart: number, newEnd: number | undefined
    if (drag.mode === 'move') {
      const deltaYear = (e.clientX - drag.startClientX) / ppy
      newStart = drag.event.startYear + deltaYear
      newEnd = drag.event.endYear !== undefined ? drag.event.endYear + deltaYear : undefined
    } else if (drag.mode === 'extend-forward') {
      newStart = drag.event.startYear
      newEnd = Math.max(drag.event.startYear + 0.1, mouseYear)
    } else {
      newStart = Math.min((drag.event.endYear ?? drag.event.startYear) - 0.1, mouseYear)
      newEnd = drag.event.endYear
    }

    const preview: DragPreview = { event: drag.event, laneId: targetLaneId, startYear: newStart, endYear: newEnd }
    dragPreviewRef.current = preview
    setDragPreview(preview)
  }, [])

  const handleDragCommit = useCallback(() => {
    const drag = dragStateRef.current
    window.removeEventListener('mousemove', handleDragMove)
    window.removeEventListener('mouseup', handleDragCommit)
    window.removeEventListener('click', handleDragCommit)
    document.getElementById('drag-cursor-style')?.remove()
    // Suppress the lane's add-event dialog that fires on the same mouseup/click
    if (drag) suppressNextLaneClickRef.current = true
    const preview = dragPreviewRef.current
    if (drag && preview) {
      onEventDropRef.current(drag.event.id, preview.laneId, preview.startYear, preview.endYear)
    }
    dragStateRef.current = null
    dragPreviewRef.current = null
    setDragPreview(null)
  }, [handleDragMove])

  const handleDragCancel = useCallback(() => {
    window.removeEventListener('mousemove', handleDragMove)
    window.removeEventListener('mouseup', handleDragCommit)
    window.removeEventListener('click', handleDragCommit)
    document.getElementById('drag-cursor-style')?.remove()
    dragStateRef.current = null
    dragPreviewRef.current = null
    setDragPreview(null)
  }, [handleDragMove, handleDragCommit])

  useEffect(() => {
    const onKey = (e: KeyboardEvent) => { if (e.key === 'Escape' && dragStateRef.current) handleDragCancel() }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [handleDragCancel])

  const handleEventMoveStart = useCallback((event: TimelineEvent, clientX: number, _clientY: number, origin: 'longpress' | 'contextmenu') => {
    const endOn = origin === 'longpress' ? 'mouseup' : 'click'
    dragStateRef.current = { event, mode: 'move', startClientX: clientX, currentLaneId: event.laneId, endOn }
    const preview: DragPreview = { event, laneId: event.laneId, startYear: event.startYear, endYear: event.endYear }
    dragPreviewRef.current = preview
    setDragPreview(preview)
    document.getElementById('drag-cursor-style')?.remove()
    const cursorStyle = document.createElement('style')
    cursorStyle.id = 'drag-cursor-style'
    cursorStyle.textContent = '* { cursor: move !important; }'
    document.head.appendChild(cursorStyle)
    window.addEventListener('mousemove', handleDragMove)
    if (endOn === 'mouseup') {
      window.addEventListener('mouseup', handleDragCommit)
    } else {
      setTimeout(() => window.addEventListener('click', handleDragCommit, { once: true }), 0)
    }
  }, [handleDragMove, handleDragCommit])

  const handleEventExtendStart = useCallback((event: TimelineEvent, direction: 'forward' | 'backward', _clientX: number) => {
    const mode = direction === 'forward' ? 'extend-forward' : 'extend-backward'

    // Anchor year: right edge for forward extend, left edge for backward extend
    const anchorYear = direction === 'forward'
      ? (event.endYear ?? event.startYear)
      : event.startYear

    // Compute anchor's content-space X
    const ppy = ppyRef.current
    const anchorContentX = (anchorYear - yearStartRef.current) * ppy

    // Scroll to bring anchor into view if needed, then derive startClientX from it
    const scrollEl = scrollRef.current
    let startClientX = _clientX
    if (scrollEl) {
      const margin = 60
      const visibleLeft = scrollEl.scrollLeft + sc.SIDEBAR_WIDTH + margin
      const visibleRight = scrollEl.scrollLeft + scrollEl.clientWidth - margin
      if (anchorContentX < visibleLeft || anchorContentX > visibleRight) {
        // Center the anchor in the usable area (right of sidebar)
        const usableCenter = sc.SIDEBAR_WIDTH + (scrollEl.clientWidth - sc.SIDEBAR_WIDTH) / 2
        scrollEl.scrollLeft = Math.max(0, anchorContentX - usableCenter)
      }
      const rect = scrollEl.getBoundingClientRect()
      startClientX = rect.left + anchorContentX - scrollEl.scrollLeft
    }

    dragStateRef.current = { event, mode, startClientX, currentLaneId: event.laneId, endOn: 'click' }
    const preview: DragPreview = { event, laneId: event.laneId, startYear: event.startYear, endYear: event.endYear }
    dragPreviewRef.current = preview
    setDragPreview(preview)
    // Hide cursor entirely during extend mode — ghost shows the preview position
    document.getElementById('drag-cursor-style')?.remove()
    const cursorStyle = document.createElement('style')
    cursorStyle.id = 'drag-cursor-style'
    cursorStyle.textContent = '* { cursor: none !important; }'
    document.head.appendChild(cursorStyle)
    window.addEventListener('mousemove', handleDragMove)
    // Commit on mouseup — works for both quick click and click-hold-drag.
    // setTimeout skips the mouseup from the context menu item click itself.
    setTimeout(() => window.addEventListener('mouseup', handleDragCommit, { once: true }), 0)
  }, [handleDragMove, handleDragCommit, sc.SIDEBAR_WIDTH])

  const visibleLanes = lanes.filter(l => l.visible)
  const hiddenLanes = lanes.filter(l => !l.visible)
  const currentYear = getCurrentYearFraction()
  const hasValueEvents = events.some(e => !!e.valueProjection)

  // Split persona events into integrated (sub-rows in lanes) vs separate (own section below)
  const integratedPersonaEvents = useMemo(
    () => personaEvents.filter(e => (personaDisplayModes.get(e.persona_id) ?? 'integrated') === 'integrated'),
    [personaEvents, personaDisplayModes],
  )

  const separatePersonas = useMemo(() => {
    const ids = new Set(
      personaEvents
        .filter(e => personaDisplayModes.get(e.persona_id) === 'separate')
        .map(e => e.persona_id),
    )
    return personas.filter(p => ids.has(p.id))
  }, [personas, personaEvents, personaDisplayModes])

  const separatePersonaEventsMap = useMemo(() => {
    const m = new Map<string, AlignedPersonaEvent[]>()
    for (const e of personaEvents) {
      if (personaDisplayModes.get(e.persona_id) === 'separate') {
        const list = m.get(e.persona_id) ?? []
        list.push(e)
        m.set(e.persona_id, list)
      }
    }
    return m
  }, [personaEvents, personaDisplayModes])

  // Split overlay events into integrated vs separate
  const integratedOverlayEvents = useMemo(
    () => overlayEvents.filter(e => (overlayDisplayModes.get(e.timeline_id) ?? 'integrated') === 'integrated'),
    [overlayEvents, overlayDisplayModes],
  )

  const separateOverlayTimelines = useMemo(() => {
    const ids = new Set(
      overlayEvents
        .filter(e => overlayDisplayModes.get(e.timeline_id) === 'separate')
        .map(e => e.timeline_id),
    )
    return activeOverlayTimelines.filter(t => ids.has(t.id))
  }, [overlayEvents, overlayDisplayModes, activeOverlayTimelines])

  const separateOverlayEventsMap = useMemo(() => {
    const m = new Map<string, OverlayTimelineEvent[]>()
    for (const e of overlayEvents) {
      if (overlayDisplayModes.get(e.timeline_id) === 'separate') {
        const list = m.get(e.timeline_id) ?? []
        list.push(e)
        m.set(e.timeline_id, list)
      }
    }
    return m
  }, [overlayEvents, overlayDisplayModes])

  // Timeline label helper: emoji or first 2 chars of name
  function getOverlayLabel(t: DbTimeline): string {
    if (t.emoji) return t.emoji
    return t.name.slice(0, 2).toUpperCase()
  }

  // Map of timeline_id -> label info for rendering in lanes
  const overlayTimelineInfoMap = useMemo(() => {
    const m = new Map<string, { label: string; name: string; color?: string | null }>()
    for (const t of activeOverlayTimelines) {
      m.set(t.id, { label: getOverlayLabel(t), name: t.name, color: t.color })
    }
    return m
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [activeOverlayTimelines])

  // Lane name -> color map (for separate persona/overlay timelines)
  const laneColorMap = useMemo(() => {
    const m = new Map<string, string>()
    for (const lane of lanes) m.set(lane.name, lane.color)
    return m
  }, [lanes])

  // Build a unique key for the current data range to detect timeline changes
  const dataKey = `${dataYearMin}-${dataYearMax}`

  // Scroll to today on load / timeline change
  useEffect(() => {
    if (!scrollRef.current) return
    if (hasScrolledRef.current === dataKey) return
    const today = getCurrentYearFraction()
    const { effStart } = computeEffWindow(today, pixelsPerYear, yearStart, yearEnd)
    yearStartRef.current = effStart
    viewCenterYearRef.current = today
    const todayPx = (today - effStart) * pixelsPerYear
    const viewWidth = scrollRef.current.clientWidth
    pendingScrollRef.current = Math.max(0, todayPx - viewWidth / 2)
    setViewCenterYear(today)
    hasScrolledRef.current = dataKey
  }, [dataKey, dataYearMin, dataYearMax, yearStart, yearEnd, pixelsPerYear])

  // Build a map of persona id -> initials + name
  const personaInitialsMap = useMemo(() => {
    const m = new Map<string, string>()
    for (const p of personas) {
      const parts = p.name.split(' ')
      const initials = parts.map(w => w[0]).join('').toUpperCase().slice(0, 2)
      m.set(p.id, initials)
    }
    return m
  }, [personas])

  const personaNameMap = useMemo(() => {
    const m = new Map<string, string>()
    for (const p of personas) {
      m.set(p.id, p.name)
    }
    return m
  }, [personas])

  // Compute per-lane persona/overlay events, sub-row assignments, dynamic heights, and overlap rows
  const laneData = useMemo(() => {
    const result: {
      laneHeight: number
      personaSubRowMap: Map<string, number>
      personaEventRowMaps: Map<string, Map<string, number>>
      lanePersonaLabels: { initials: string; name: string; personaId: string; hasOverlaps: boolean; rowCount: number }[]
      filteredPersonaEvents: AlignedPersonaEvent[]
      hasOverlaps: boolean
      eventRowMap: Map<string, number>
      filteredOverlayEvents: OverlayTimelineEvent[]
      overlaySubRowMap: Map<string, number>
      overlayEventRowMaps: Map<string, Map<string, number>>
      overlayBaseOffset: number
      laneOverlayLabels: { label: string; name: string; timelineId: string; hasOverlaps: boolean; rowCount: number }[]
    }[] = []

    for (const lane of visibleLanes) {
      const lanePersonaEvents = integratedPersonaEvents.filter(pe => pe.lane_name === lane.name)
      const laneEvents = events.filter(e => e.laneId === lane.id)

      // Collect unique persona IDs in this lane, sorted for determinism
      const personaIdsInLane = [...new Set(lanePersonaEvents.map(pe => pe.persona_id))].sort()

      // Per-persona: overlap detection, row assignment, row counts
      const personaHasOverlapsMap = new Map<string, boolean>()
      const personaEventRowMaps = new Map<string, Map<string, number>>()
      const personaRowCounts = new Map<string, number>()
      for (const pid of personaIdsInLane) {
        const pEvents = lanePersonaEvents.filter(e => e.persona_id === pid)
        const pHasOverlaps = hasAnyOverlapsGeneric(pEvents)
        personaHasOverlapsMap.set(pid, pHasOverlaps)
        const pExpanded = pHasOverlaps && expandedPersonaRows.has(`${lane.id}:${pid}`)
        if (pExpanded) {
          const rowMap = assignRowsGeneric(pEvents)
          personaEventRowMaps.set(pid, rowMap)
          personaRowCounts.set(pid, rowMap.size > 0 ? Math.max(...rowMap.values()) + 1 : 1)
        } else {
          personaRowCounts.set(pid, 1)
        }
      }

      // Cumulative base sub-row offsets per persona
      const personaSubRowMap = new Map<string, number>()
      let personaOffset = 0
      for (const pid of personaIdsInLane) {
        personaSubRowMap.set(pid, personaOffset)
        personaOffset += personaRowCounts.get(pid)!
      }
      const totalPersonaRows = personaOffset

      // Build labels for sidebar
      const lanePersonaLabels = personaIdsInLane.map(pid => ({
        initials: personaInitialsMap.get(pid) ?? '??',
        name: personaNameMap.get(pid) ?? 'Unknown',
        personaId: pid,
        hasOverlaps: personaHasOverlapsMap.get(pid) ?? false,
        rowCount: personaRowCounts.get(pid) ?? 1,
      }))

      // Overlap detection & row assignment
      const hasOverlaps = hasAnyOverlaps(laneEvents)
      const isExpanded = hasOverlaps && expandedLanes.has(lane.id)
      const eventRowMap = isExpanded ? assignEventRows(laneEvents) : new Map<string, number>()
      const numEventRows = isExpanded ? (eventRowMap.size > 0 ? Math.max(...eventRowMap.values()) + 1 : 1) : 1

      // Overlay sub-rows
      const laneOverlayEvents = integratedOverlayEvents.filter(e => e.lane_name === lane.name)
      const overlayTimelineIdsInLane = [...new Set(laneOverlayEvents.map(e => e.timeline_id))].sort()

      const overlayHasOverlapsMap = new Map<string, boolean>()
      const overlayEventRowMaps = new Map<string, Map<string, number>>()
      const overlayRowCounts = new Map<string, number>()
      for (const tid of overlayTimelineIdsInLane) {
        const oEvents = laneOverlayEvents.filter(e => e.timeline_id === tid)
        const oHasOverlaps = hasAnyOverlapsGeneric(oEvents)
        overlayHasOverlapsMap.set(tid, oHasOverlaps)
        const oExpanded = oHasOverlaps && expandedOverlayRows.has(`${lane.id}:${tid}`)
        if (oExpanded) {
          const rowMap = assignRowsGeneric(oEvents)
          overlayEventRowMaps.set(tid, rowMap)
          overlayRowCounts.set(tid, rowMap.size > 0 ? Math.max(...rowMap.values()) + 1 : 1)
        } else {
          overlayRowCounts.set(tid, 1)
        }
      }

      const overlaySubRowMap = new Map<string, number>()
      let overlayOffset = 0
      for (const tid of overlayTimelineIdsInLane) {
        overlaySubRowMap.set(tid, overlayOffset)
        overlayOffset += overlayRowCounts.get(tid)!
      }
      const totalOverlayRows = overlayOffset
      const overlayBaseOffset = numEventRows * BASE_LANE_HEIGHT + totalPersonaRows * PERSONA_SUB_ROW_HEIGHT
      const laneOverlayLabels = overlayTimelineIdsInLane.map(id => ({
        label: overlayTimelineInfoMap.get(id)?.label ?? '?',
        name: overlayTimelineInfoMap.get(id)?.name ?? 'Unknown',
        timelineId: id,
        hasOverlaps: overlayHasOverlapsMap.get(id) ?? false,
        rowCount: overlayRowCounts.get(id) ?? 1,
      }))

      result.push({
        laneHeight: numEventRows * BASE_LANE_HEIGHT + totalPersonaRows * PERSONA_SUB_ROW_HEIGHT + totalOverlayRows * PERSONA_SUB_ROW_HEIGHT,
        personaSubRowMap,
        personaEventRowMaps,
        lanePersonaLabels,
        filteredPersonaEvents: lanePersonaEvents,
        hasOverlaps,
        eventRowMap,
        filteredOverlayEvents: laneOverlayEvents,
        overlaySubRowMap,
        overlayEventRowMaps,
        overlayBaseOffset,
        laneOverlayLabels,
      })
    }

    return result
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [visibleLanes, integratedPersonaEvents, personaInitialsMap, personaNameMap, events, expandedLanes, expandedPersonaRows, expandedOverlayRows, BASE_LANE_HEIGHT, PERSONA_SUB_ROW_HEIGHT, integratedOverlayEvents, overlayTimelineInfoMap])

  const laneHeights = laneData.map(d => d.laneHeight)
  const totalHeight = laneHeights.reduce((sum, h) => sum + h, 0) + (hasValueEvents ? TOTAL_ASSETS_HEIGHT : 0)

  // Build sidebar maps: lane name -> persona labels, lane id -> hasOverlaps
  const sidebarPersonaLabels = useMemo(() => {
    const m = new Map<string, { initials: string; name: string; personaId: string; hasOverlaps: boolean; rowCount: number }[]>()
    visibleLanes.forEach((lane, i) => {
      m.set(lane.name, laneData[i].lanePersonaLabels)
    })
    return m
  }, [visibleLanes, laneData])

  const sidebarOverlayLabels = useMemo(() => {
    const m = new Map<string, { label: string; name: string; timelineId: string; hasOverlaps: boolean; rowCount: number }[]>()
    visibleLanes.forEach((lane, i) => {
      m.set(lane.name, laneData[i].laneOverlayLabels)
    })
    return m
  }, [visibleLanes, laneData])

  const laneHasOverlaps = useMemo(() => {
    const m = new Map<string, boolean>()
    visibleLanes.forEach((lane, i) => m.set(lane.id, laneData[i].hasOverlaps))
    return m
  }, [visibleLanes, laneData])

  // Lane names in visible order — used for separate sections
  const visibleLaneNames = useMemo(() => visibleLanes.map(l => l.name), [visibleLanes])

  // Build sidebar sections for separate personas
  // Per-lane overlap data for separate persona sections
  const separatePersonaLaneData = useMemo(() => {
    const result = new Map<string, Map<string, { hasOverlaps: boolean; rowCount: number; eventRowMap: Map<string, number> }>>()
    for (const persona of separatePersonas) {
      const laneMap = new Map<string, { hasOverlaps: boolean; rowCount: number; eventRowMap: Map<string, number> }>()
      const personaEvs = separatePersonaEventsMap.get(persona.id) ?? []
      for (const laneName of visibleLaneNames) {
        const laneEvs = personaEvs.filter(e => e.lane_name === laneName)
        const hasOverlaps = hasAnyOverlapsGeneric(laneEvs)
        const isExpanded = hasOverlaps && expandedSeparatePersonaLanes.has(`${persona.id}:${laneName}`)
        if (isExpanded) {
          const rowMap = assignRowsGeneric(laneEvs)
          laneMap.set(laneName, { hasOverlaps, rowCount: rowMap.size > 0 ? Math.max(...rowMap.values()) + 1 : 1, eventRowMap: rowMap })
        } else {
          laneMap.set(laneName, { hasOverlaps, rowCount: 1, eventRowMap: new Map() })
        }
      }
      result.set(persona.id, laneMap)
    }
    return result
  }, [separatePersonas, separatePersonaEventsMap, visibleLaneNames, expandedSeparatePersonaLanes])

  // Per-lane overlap data for separate overlay sections
  const separateOverlayLaneData = useMemo(() => {
    const result = new Map<string, Map<string, { hasOverlaps: boolean; rowCount: number; eventRowMap: Map<string, number> }>>()
    for (const timeline of separateOverlayTimelines) {
      const laneMap = new Map<string, { hasOverlaps: boolean; rowCount: number; eventRowMap: Map<string, number> }>()
      const timelineEvs = separateOverlayEventsMap.get(timeline.id) ?? []
      for (const laneName of visibleLaneNames) {
        const laneEvs = timelineEvs.filter(e => e.lane_name === laneName)
        const hasOverlaps = hasAnyOverlapsGeneric(laneEvs)
        const isExpanded = hasOverlaps && expandedSeparateOverlayLanes.has(`${timeline.id}:${laneName}`)
        if (isExpanded) {
          const rowMap = assignRowsGeneric(laneEvs)
          laneMap.set(laneName, { hasOverlaps, rowCount: rowMap.size > 0 ? Math.max(...rowMap.values()) + 1 : 1, eventRowMap: rowMap })
        } else {
          laneMap.set(laneName, { hasOverlaps, rowCount: 1, eventRowMap: new Map() })
        }
      }
      result.set(timeline.id, laneMap)
    }
    return result
  }, [separateOverlayTimelines, separateOverlayEventsMap, visibleLaneNames, expandedSeparateOverlayLanes])

  const separatePersonaSections = useMemo<PersonaSidebarSection[]>(() => {
    return separatePersonas.map(p => {
      const parts = p.name.split(' ')
      const initials = parts.map((w: string) => w[0]).join('').toUpperCase().slice(0, 2)
      const laneData = separatePersonaLaneData.get(p.id)
      return {
        personaId: p.id,
        name: p.name,
        initials,
        birthYear: p.birth_year,
        deathYear: p.death_year,
        laneRowData: visibleLaneNames.map(name => ({
          name,
          hasOverlaps: laneData?.get(name)?.hasOverlaps ?? false,
          rowCount: laneData?.get(name)?.rowCount ?? 1,
        })),
      }
    })
  }, [separatePersonas, visibleLaneNames, separatePersonaLaneData])

  // Build sidebar sections for separate overlay timelines
  const separateOverlaySidebarSections = useMemo<OverlaySidebarSection[]>(() => {
    return separateOverlayTimelines.map(t => {
      const laneData = separateOverlayLaneData.get(t.id)
      return {
        timelineId: t.id,
        name: t.name,
        label: getOverlayLabel(t),
        color: t.color ?? '#6b7280',
        laneRowData: visibleLaneNames.map(name => ({
          name,
          hasOverlaps: laneData?.get(name)?.hasOverlaps ?? false,
          rowCount: laneData?.get(name)?.rowCount ?? 1,
        })),
      }
    })
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [separateOverlayTimelines, visibleLaneNames, separateOverlayLaneData])

  // Grand total height includes all section rows for YearGrid coverage
  const personaSectionsTotalHeight = separatePersonaSections.reduce(
    (sum, s) => sum + PERSONA_SUB_ROW_HEIGHT + s.laneRowData.reduce((ls, r) => ls + r.rowCount * BASE_LANE_HEIGHT, 0), 0)
  const overlaySectionsTotalHeight = separateOverlaySidebarSections.reduce(
    (sum, s) => sum + PERSONA_SUB_ROW_HEIGHT + s.laneRowData.reduce((ls, r) => ls + r.rowCount * BASE_LANE_HEIGHT, 0), 0)
  const grandTotalHeight = totalHeight + personaSectionsTotalHeight + overlaySectionsTotalHeight

  // Fit-screen: recompute sizes whenever grandTotalHeight or container height changes.
  // All heights are linear in BASE_LANE_HEIGHT, so K = grandTotalHeight / BASE_LANE_HEIGHT
  // is scale-invariant. We solve: containerHeight = HEADER_HEIGHT + grandTotalHeight
  // ⟹ newBLH = containerHeight / (headerRatio + K).
  const fitRef = useRef({ grandTotalHeight, blh: sc.BASE_LANE_HEIGHT, hr: sc.HEADER_HEIGHT })
  fitRef.current = { grandTotalHeight, blh: sc.BASE_LANE_HEIGHT, hr: sc.HEADER_HEIGHT }

  // Ratio of the hidden-lanes toggle button height to BASE_LANE_HEIGHT (derived from large preset)
  const HIDDEN_BTN_RATIO = (Math.round(SIZE_PRESETS.large.SIDEBAR_FONT * 0.4) * 2 + SIZE_PRESETS.large.ICON_SIZE) / SIZE_PRESETS.large.BASE_LANE_HEIGHT
  const hasHiddenRef = useRef(hiddenLanes.length > 0)
  hasHiddenRef.current = hiddenLanes.length > 0

  const computeFitScreen = useCallback(() => {
    const el = containerRef.current
    if (!el) return
    const containerHeight = el.clientHeight
    if (containerHeight <= 0) return
    const { grandTotalHeight: gh, blh, hr } = fitRef.current
    if (gh <= 0 || blh <= 0) return
    const K = gh / blh
    const headerRatio = hr / blh
    // Reserve space for the hidden-lanes toggle button when there are hidden lanes
    const hiddenRatio = hasHiddenRef.current ? HIDDEN_BTN_RATIO : 0
    const newBLH = containerHeight / (headerRatio + K + hiddenRatio)
    const scale = newBLH / SIZE_PRESETS.large.BASE_LANE_HEIGHT
    updateFitScreenConfig(scaleSizeConfig(SIZE_PRESETS.large, scale))
  }, [updateFitScreenConfig, HIDDEN_BTN_RATIO])

  // Set up ResizeObserver on the container (fires when window/panel resizes)
  useEffect(() => {
    if (size !== 'fitscreen') return
    const el = containerRef.current
    if (!el) return
    const ro = new ResizeObserver(computeFitScreen)
    ro.observe(el)
    computeFitScreen()
    return () => ro.disconnect()
  }, [size, computeFitScreen])

  // Also recompute when lane structure changes (lanes added/removed/persona sections)
  useEffect(() => {
    if (size !== 'fitscreen') return
    computeFitScreen()
  }, [size, grandTotalHeight, hiddenLanes.length, computeFitScreen])

  return (
    <div ref={containerRef} className="relative flex-1 overflow-hidden">
      {/* Floating cursor date popup — fixed so it always appears next to the mouse */}
      <div
        ref={cursorPopupRef}
        className="fixed z-50 pointer-events-none rounded-md border bg-popover text-popover-foreground shadow-sm px-2 py-1 text-xs font-medium whitespace-nowrap"
        style={{ display: 'none', left: 0, top: 0, transform: 'translateX(-100%)' }}
      />

      {/* Lane sidebar overlay — floats above timeline content, scrolls vertically via sidebarInnerRef */}
      <div
        className="absolute top-0 left-0 overflow-hidden pointer-events-none"
        style={{ width: sc.SIDEBAR_WIDTH, height: '100%', zIndex: 30 }}
      >
        <div ref={sidebarInnerRef} className="pointer-events-auto">
          <LaneSidebar
            lanes={visibleLanes}
            hiddenLanes={hiddenLanes}
            laneHeights={laneHeights}
            lanePersonaLabels={sidebarPersonaLabels}
            laneOverlayLabels={sidebarOverlayLabels}
            laneHasOverlaps={laneHasOverlaps}
            expandedLanes={expandedLanes}
            expandedPersonaRows={expandedPersonaRows}
            expandedOverlayRows={expandedOverlayRows}
            expandedSeparatePersonaLanes={expandedSeparatePersonaLanes}
            expandedSeparateOverlayLanes={expandedSeparateOverlayLanes}
            separatePersonaSections={separatePersonaSections}
            separateOverlaySections={separateOverlaySidebarSections}
            onToggleExpand={handleToggleExpand}
            onTogglePersonaExpand={handleTogglePersonaExpand}
            onToggleOverlayExpand={handleToggleOverlayExpand}
            onToggleSeparatePersonaLane={handleToggleSeparatePersonaLane}
            onToggleSeparateOverlayLane={handleToggleSeparateOverlayLane}
            onToggleVisibility={onToggleVisibility}
            onMoveLane={onMoveLane}
            onEditLane={onEditLane}
            onDeleteLane={onDeleteLane}
            totalAssetsHeight={hasValueEvents ? TOTAL_ASSETS_HEIGHT : undefined}
          />
        </div>
      </div>

      <div ref={scrollRef} className="absolute inset-0 overflow-auto">
        <div className="relative" style={{ width: effectiveTotalWidth, minHeight: grandTotalHeight + 24 }}>
          <TimelineHeader yearStart={effectiveYearStart} yearEnd={effectiveYearEnd} pixelsPerYear={pixelsPerYear} currentYear={currentYear} scrollLeft={scrollLeft} viewportWidth={viewportWidth} cursorRef={cursorHeaderRef} lifeSpan={lifeSpan} />
          <div className="relative">
            <YearGrid yearStart={effectiveYearStart} yearEnd={effectiveYearEnd} pixelsPerYear={pixelsPerYear} totalHeight={grandTotalHeight} currentYear={currentYear} scrollLeft={scrollLeft} viewportWidth={viewportWidth} lifeSpan={lifeSpan} />
            {/* Cursor line — positioned in content space, updated via ref */}
            <div
              ref={cursorLaneRef}
              className="absolute top-0 pointer-events-none"
              style={{ display: 'none', left: 0, height: grandTotalHeight, borderLeft: '1px dashed #9ca3af', zIndex: 5 }}
            />
            {visibleLanes.map((lane, i) => (
              <TimelineLane
                key={lane.id}
                lane={lane}
                events={events.filter(e => e.laneId === lane.id)}
                yearStart={effectiveYearStart}
                yearEnd={effectiveYearEnd}
                pixelsPerYear={pixelsPerYear}
                onEventClick={onEventClick}
                onLaneClick={handleLaneClickInternal}
                onLaneDragRange={onLaneDragRange}
                onPan={handlePan}
                eventRowMap={laneData[i].eventRowMap}
                personaEvents={laneData[i].filteredPersonaEvents}
                laneHeight={laneData[i].laneHeight}
                personaSubRowMap={laneData[i].personaSubRowMap}
                currentYear={currentYear}
                scrollLeft={scrollLeft}
                draggingEventId={dragPreview?.event.id}
                onEventMoveStart={handleEventMoveStart}
                onEventExtendStart={handleEventExtendStart}
                overlayEvents={laneData[i].filteredOverlayEvents}
                overlaySubRowMap={laneData[i].overlaySubRowMap}
                overlayEventRowMaps={laneData[i].overlayEventRowMaps}
                overlayBaseOffset={laneData[i].overlayBaseOffset}
                overlayTimelineInfoMap={overlayTimelineInfoMap}
                personaEventRowMaps={laneData[i].personaEventRowMaps}
              />
            ))}
            {hasValueEvents && (
              <TotalAssetsLane
                events={events}
                yearStart={effectiveYearStart}
                yearEnd={effectiveYearEnd}
                pixelsPerYear={pixelsPerYear}
              />
            )}
          </div>
          {/* Separate persona timeline sections */}
          {separatePersonas.map(persona => {
            const pLaneData = separatePersonaLaneData.get(persona.id)
            const laneRowCounts = new Map(visibleLaneNames.map(n => [n, pLaneData?.get(n)?.rowCount ?? 1]))
            const laneEventRowMaps = new Map(visibleLaneNames.map(n => [n, pLaneData?.get(n)?.eventRowMap ?? new Map()]))
            return (
              <PersonaSeparateTimeline
                key={persona.id}
                persona={persona}
                events={separatePersonaEventsMap.get(persona.id) ?? []}
                laneNames={visibleLaneNames}
                yearStart={effectiveYearStart}
                yearEnd={effectiveYearEnd}
                pixelsPerYear={pixelsPerYear}
                laneColorMap={laneColorMap}
                currentYear={currentYear}
                laneRowCounts={laneRowCounts}
                laneEventRowMaps={laneEventRowMaps}
              />
            )
          })}
          {/* Separate overlay timeline sections */}
          {separateOverlayTimelines.map(t => {
            const oLaneData = separateOverlayLaneData.get(t.id)
            const laneRowCounts = new Map(visibleLaneNames.map(n => [n, oLaneData?.get(n)?.rowCount ?? 1]))
            const laneEventRowMaps = new Map(visibleLaneNames.map(n => [n, oLaneData?.get(n)?.eventRowMap ?? new Map()]))
            return (
              <OverlaySeparateTimeline
                key={t.id}
                timeline={t}
                events={separateOverlayEventsMap.get(t.id) ?? []}
                laneNames={visibleLaneNames}
                yearStart={effectiveYearStart}
                yearEnd={effectiveYearEnd}
                pixelsPerYear={pixelsPerYear}
                laneColorMap={laneColorMap}
                currentYear={currentYear}
                laneRowCounts={laneRowCounts}
                laneEventRowMaps={laneEventRowMaps}
              />
            )
          })}
        </div>
      </div>

      {/* Drag ghost */}
      {dragPreview && (() => {
        const scrollEl = scrollRef.current
        if (!scrollEl) return null
        const rect = scrollEl.getBoundingClientRect()
        const ghostLeft = rect.left + (dragPreview.startYear - effectiveYearStart) * pixelsPerYear - scrollEl.scrollLeft
        const targetLaneIdx = visibleLanes.findIndex(l => l.id === dragPreview.laneId)
        let yOffset = sc.HEADER_HEIGHT
        for (let i = 0; i < visibleLanes.length; i++) {
          if (visibleLanes[i].id === dragPreview.laneId) break
          yOffset += laneData[i].laneHeight
        }
        // Account for event row offset within the lane (multi-row expanded lanes)
        const eventRowOffset = (laneData[targetLaneIdx]?.eventRowMap?.get(dragPreview.event.id) ?? 0) * sc.BASE_LANE_HEIGHT
        const ghostTop = rect.top + yOffset + eventRowOffset - scrollEl.scrollTop
        const ghostLane = visibleLanes.find(l => l.id === dragPreview.laneId)
        const ghostEvent = { ...dragPreview.event, startYear: dragPreview.startYear, endYear: dragPreview.endYear, laneId: dragPreview.laneId }
        return (
          <div style={{ position: 'fixed', left: ghostLeft, top: ghostTop, pointerEvents: 'none', zIndex: 60, opacity: 0.85 }}>
            <TimelineEventBar
              event={ghostEvent}
              yearStart={dragPreview.startYear}
              pixelsPerYear={pixelsPerYear}
              laneColor={ghostLane?.color ?? '#3b82f6'}
              onClick={() => {}}
              currentYear={currentYear}
            />
          </div>
        )
      })()}
    </div>
  )
}
