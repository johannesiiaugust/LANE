import { useState, useCallback, useEffect, useMemo } from 'react'
import type { Lane, TimelineEvent } from '@/types/timeline'
import type { DbTimeline } from '@/types/database'
import { DEMO_LANES, buildDemoEvents } from '@/data/demoData'
import { useTranslation } from '@/i18n/context'
import {
  TIMELINE_YEAR_MIN,
  TIMELINE_YEAR_MAX,
  MIN_PIXELS_PER_YEAR,
} from '@/lib/constants'

const STORAGE_KEY = 'timeline_demo_v3'

interface DemoTimelineMeta {
  name: string
  color: string
  start_year: number | null
  end_year: number | null
  emoji: string
}

interface DemoState {
  lanes: Lane[]
  meta?: DemoTimelineMeta
  events?: TimelineEvent[]
  userOwnStory?: boolean
}

const DEFAULT_META: DemoTimelineMeta = {
  name: "My Life",
  color: '#6366f1',
  start_year: 1980,
  end_year: null,
  emoji: '👤',
}

function loadSavedState(): DemoState | null {
  try {
    const raw = localStorage.getItem(STORAGE_KEY)
    if (raw) {
      const parsed = JSON.parse(raw) as DemoState
      if (Array.isArray(parsed.lanes)) {
        return {
          lanes: parsed.lanes,
          meta: parsed.meta,
          events: Array.isArray(parsed.events) ? parsed.events : undefined,
          userOwnStory: parsed.userOwnStory === true,
        }
      }
    }
  } catch {
    // ignore
  }
  return null
}

function saveState(state: DemoState) {
  try {
    localStorage.setItem(STORAGE_KEY, JSON.stringify({ lanes: state.lanes, meta: state.meta, events: state.events, userOwnStory: state.userOwnStory }))
  } catch {
    // ignore
  }
}

export function useDemoTimeline() {
  const { t } = useTranslation()
  const translatedEvents = useMemo(() => buildDemoEvents(t), [t])
  const savedState = useMemo(() => loadSavedState(), [])
  const [lanes, setLanes] = useState<Lane[]>(savedState?.lanes ?? DEMO_LANES)
  const [events, setEvents] = useState<TimelineEvent[]>(savedState?.events ?? translatedEvents)
  const [meta, setMeta] = useState<DemoTimelineMeta>(savedState?.meta ?? DEFAULT_META)
  const [userOwnStory] = useState(savedState?.userOwnStory ?? false)

  // On language change, refresh base demo events but preserve user-added ones (non demo-evt-* IDs).
  // Skip if the user has started their own story — keep only their events.
  useEffect(() => {
    if (userOwnStory) return
    setEvents(prev => {
      const userAdded = prev.filter(e => !e.id.startsWith('demo-evt-'))
      return [...translatedEvents, ...userAdded]
    })
  }, [translatedEvents, userOwnStory])
  const [pixelsPerYear, setPixelsPerYear] = useState(MIN_PIXELS_PER_YEAR)

  const demoTimeline: DbTimeline = {
    id: 'demo',
    user_id: '',
    name: meta.name,
    start_year: meta.start_year,
    end_year: meta.end_year,
    color: meta.color,
    emoji: meta.emoji,
    visibility: 'public',
    created_at: '',
    updated_at: '',
  }

  const yearStart = TIMELINE_YEAR_MIN
  const yearEnd = TIMELINE_YEAR_MAX

  // Persist lanes, events, meta and userOwnStory to localStorage
  useEffect(() => {
    saveState({ lanes, meta, events, userOwnStory })
  }, [lanes, meta, events, userOwnStory])

  const allYears = events.flatMap(e =>
    e.endYear != null ? [e.startYear, e.endYear] : [e.startYear],
  )
  const dataYearMin = allYears.length > 0 ? Math.floor(Math.min(...allYears)) - 2 : 1990
  const dataYearMax = allYears.length > 0 ? Math.ceil(Math.max(...allYears)) + 2 : 2026

  // ---- Event CRUD ----

  const addEvent = useCallback(async (event: Omit<TimelineEvent, 'id'>): Promise<TimelineEvent | null> => {
    const newEvent: TimelineEvent = { ...event, id: crypto.randomUUID() }
    setEvents(prev => [...prev, newEvent])
    return newEvent
  }, [])

  const updateEvent = useCallback(async (id: string, updates: Partial<Omit<TimelineEvent, 'id'>>): Promise<void> => {
    setEvents(prev => prev.map(e => (e.id === id ? { ...e, ...updates } : e)))
  }, [])

  const deleteEvent = useCallback(async (id: string): Promise<void> => {
    setEvents(prev => prev.filter(e => e.id !== id))
  }, [])

  // ---- Lane CRUD ----

  const addLane = useCallback(async (lane: Omit<Lane, 'id' | 'order' | 'isDefault'>): Promise<Lane | null> => {
    const newLane: Lane = {
      ...lane,
      id: crypto.randomUUID(),
      isDefault: false,
      order: 0, // will be set below
    }
    setLanes(prev => {
      const maxOrder = prev.length > 0 ? Math.max(...prev.map(l => l.order)) : -1
      return [...prev, { ...newLane, order: maxOrder + 1 }]
    })
    return newLane
  }, [])

  const updateLane = useCallback(async (id: string, updates: Partial<Omit<Lane, 'id' | 'isDefault'>>): Promise<void> => {
    setLanes(prev => prev.map(l => (l.id === id ? { ...l, ...updates } : l)))
  }, [])

  const deleteLane = useCallback(async (id: string): Promise<void> => {
    setLanes(prev => prev.filter(l => l.id !== id))
    setEvents(prev => prev.filter(e => e.laneId !== id))
  }, [])

  const moveLane = useCallback(async (id: string, direction: 'up' | 'down'): Promise<void> => {
    setLanes(prev => {
      const sorted = [...prev].sort((a, b) => a.order - b.order)
      const idx = sorted.findIndex(l => l.id === id)
      if (idx < 0) return prev
      const swapIdx = direction === 'up' ? idx - 1 : idx + 1
      if (swapIdx < 0 || swapIdx >= sorted.length) return prev
      const orderA = sorted[swapIdx].order
      const orderB = sorted[idx].order
      return prev.map(l => {
        if (l.id === sorted[idx].id) return { ...l, order: orderA }
        if (l.id === sorted[swapIdx].id) return { ...l, order: orderB }
        return l
      }).sort((a, b) => a.order - b.order)
    })
  }, [])

  const toggleLaneVisibility = useCallback(async (id: string): Promise<void> => {
    setLanes(prev => prev.map(l => (l.id === id ? { ...l, visible: !l.visible } : l)))
  }, [])

  // ---- Timeline management (noops for demo) ----

  const selectTimeline = useCallback((_id: string) => {}, [])
  const createTimeline = useCallback(async (_name?: string, _emoji?: string, _color?: string, _withDefaultLanes?: boolean): Promise<string | null> => null, [])
  const copyTimelineData = useCallback(async (_sourceId: string, _destId: string, _options: { laneIds?: string[]; eventFilter?: 'all' | 'past_current' | 'none'; perLaneEventFilter?: Record<string, 'all' | 'past_current' | 'none'> }): Promise<boolean> => false, [])
  const updateTimeline = useCallback(async (_id: string, updates: { name?: string; start_year?: number | null; end_year?: number | null; color?: string | null; emoji?: string | null }): Promise<boolean> => {
    setMeta(prev => ({
      ...prev,
      ...(updates.name !== undefined ? { name: updates.name } : {}),
      ...(updates.color !== undefined ? { color: updates.color ?? prev.color } : {}),
      ...(updates.emoji !== undefined ? { emoji: updates.emoji ?? prev.emoji } : {}),
      ...(updates.start_year !== undefined ? { start_year: updates.start_year } : {}),
      ...(updates.end_year !== undefined ? { end_year: updates.end_year } : {}),
    }))
    return true
  }, [])
  const renameTimeline = useCallback(async (_id: string, _name: string): Promise<boolean> => true, [])
  const deleteTimeline = useCallback(async (_id: string): Promise<boolean> => false, [])
  const clearFirstLogin = useCallback(() => {}, [])

  return {
    // Timeline list management
    timelines: [demoTimeline],
    selectedTimelineId: 'demo' as string | null,
    selectTimeline,
    createTimeline,
    copyTimelineData,
    updateTimeline,
    renameTimeline,
    deleteTimeline,
    timelinesLoading: false,
    isFirstLogin: false,
    clearFirstLogin,

    // Active timeline data
    lanes,
    events,
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
    refreshTimeline: () => {},
    dataLoading: false,
  }
}
