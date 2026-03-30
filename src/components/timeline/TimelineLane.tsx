import { useRef, useState, useMemo, useEffect } from 'react'
import type { Lane, TimelineEvent } from '@/types/timeline'
import type { AlignedPersonaEvent, OverlayTimelineEvent } from '@/types/database'
import { TimelineEventBar } from './TimelineEvent'
import { PersonaEventBar } from './PersonaEventBar'
import { OverlayEventBar } from './OverlayEventBar'
import { useSizeConfig } from '@/contexts/UiSizeContext'
import { getZoomBand } from '@/lib/constants'

// ── Viewport culling ──────────────────────────────────────────────────────────
/** Extra viewport-widths of buffer on each side of the visible area. */
const CULL_BUFFER_SCREENS = 1
/**
 * Culling recomputes only when scrollLeft moves by at least this many pixels.
 * Prevents per-animation-frame useMemo invalidation during smooth scrolling.
 */
const CULL_SCROLL_BUCKET_PX = 100

// ── Zoom-aware clustering ─────────────────────────────────────────────────────
/** px/year threshold below which clustering is even considered. */
const CLUSTER_PPY_THRESHOLD = 5
/** Events whose screen-space gap is smaller than this (px) are candidates for clustering. */
const CLUSTER_GAP_PX = 20
/** Only form a cluster badge when a group has MORE than this many events — clusters are a
 *  last-resort fallback for unusually dense lanes, not a routine zoom-out summary. */
const CLUSTER_MIN_SIZE = 10

type SingleItem = { kind: 'single'; event: TimelineEvent }
type ClusterItem = { kind: 'cluster'; count: number; startYear: number; endYear: number; color: string }
type RenderItem = SingleItem | ClusterItem

function buildRenderItems(
  events: TimelineEvent[],
  pixelsPerYear: number,
  laneColor: string,
  draggingEventId?: string | null,
): RenderItem[] {
  if (pixelsPerYear >= CLUSTER_PPY_THRESHOLD || events.length === 0) {
    return events.map(e => ({ kind: 'single' as const, event: e }))
  }
  const gapYears = CLUSTER_GAP_PX / pixelsPerYear
  const sorted = [...events].sort((a, b) => a.startYear - b.startYear)
  const items: RenderItem[] = []
  let group: TimelineEvent[] = []
  let groupEnd = -Infinity

  function flushGroup() {
    if (group.length === 0) return
    // Always break clusters that contain the dragged event into singles.
    // Also render as singles unless the group exceeds CLUSTER_MIN_SIZE — clustering
    // is a last-resort fallback for unusually dense lanes, not a default zoom summary.
    const hasDragged = draggingEventId != null && group.some(e => e.id === draggingEventId)
    if (group.length <= CLUSTER_MIN_SIZE || hasDragged) {
      group.forEach(e => items.push({ kind: 'single', event: e }))
    } else {
      items.push({ kind: 'cluster', count: group.length, startYear: group[0].startYear, endYear: groupEnd, color: laneColor })
    }
    group = []
    groupEnd = -Infinity
  }

  for (const ev of sorted) {
    const evEnd = ev.type === 'range' ? (ev.endYear ?? ev.startYear + 1) : ev.startYear
    if (group.length === 0 || ev.startYear <= groupEnd + gapYears) {
      group.push(ev)
      groupEnd = Math.max(groupEnd, evEnd)
    } else {
      flushGroup()
      group = [ev]
      groupEnd = evEnd
    }
  }
  flushGroup()
  return items
}

/** Compact summary bar rendered in place of a dense cluster of events. */
function ClusterBar({
  item, yearStart, pixelsPerYear, baseHeight,
}: {
  item: ClusterItem
  yearStart: number
  pixelsPerYear: number
  baseHeight: number
}) {
  const left = (item.startYear - yearStart) * pixelsPerYear
  const width = Math.max((item.endYear - item.startYear) * pixelsPerYear, 28)
  return (
    <div
      title={`${item.count} events`}
      className="absolute rounded-sm flex items-center justify-center font-bold pointer-events-none select-none"
      style={{
        left,
        width,
        top: 4,
        height: Math.max(baseHeight - 8, 12),
        backgroundColor: item.color,
        opacity: 0.55,
        zIndex: 10,
        fontSize: 11,
        color: '#fff',
      }}
    >
      {item.count}
    </div>
  )
}

/** For collapsed lanes: map event id → how many overlapping events end later (0 = front of stack). */
function computeStackDepths(events: TimelineEvent[]): Map<string, number> {
  const depths = new Map<string, number>()
  for (const ev of events) {
    const evEnd = ev.endYear ?? ev.startYear + 0.5
    let depth = 0
    let hasOverlap = false
    for (const other of events) {
      if (other.id === ev.id) continue
      const otherEnd = other.endYear ?? other.startYear + 0.5
      if (ev.startYear < otherEnd && other.startYear < evEnd) {
        hasOverlap = true
        if (otherEnd > evEnd || (otherEnd === evEnd && other.startYear > ev.startYear)) depth++
      }
    }
    if (hasOverlap) depths.set(ev.id, depth)
  }
  return depths
}

const RANGE_HOLD_MS = 1000  // hold this long without moving to enter range-draw mode
const PAN_THRESHOLD_PX = 4  // move this far within RANGE_HOLD_MS to enter pan mode

type Mode = 'idle' | 'pending' | 'panning' | 'ranging'

interface TimelineLaneProps {
  lane: Lane
  events: TimelineEvent[]
  yearStart: number
  yearEnd: number
  pixelsPerYear: number
  onEventClick: (event: TimelineEvent, element: HTMLElement, clientX: number, clientY: number) => void
  onLaneClick: (laneId: string, year: number) => void
  onLaneDragRange: (laneId: string, startYear: number, endYear: number) => void
  onPan: (deltaX: number) => void
  eventRowMap?: Map<string, number>
  personaEvents: AlignedPersonaEvent[]
  laneHeight: number
  personaSubRowMap: Map<string, number>
  currentYear: number
  scrollLeft: number
  viewportWidth: number
  sidebarWidth?: number
  draggingEventId?: string | null
  onEventMoveStart?: (event: TimelineEvent, clientX: number, clientY: number, origin: 'longpress' | 'contextmenu') => void
  onEventExtendStart?: (event: TimelineEvent, direction: 'forward' | 'backward', clientX: number) => void
  overlayEvents?: OverlayTimelineEvent[]
  overlaySubRowMap?: Map<string, number>                       // timeline_id -> base sub-row offset
  overlayEventRowMaps?: Map<string, Map<string, number>>       // timeline_id -> event_id -> row within group
  overlayBaseOffset?: number                                   // y-offset where overlay rows start
  overlayTimelineInfoMap?: Map<string, { label: string; name: string; color?: string | null }>
  personaEventRowMaps?: Map<string, Map<string, number>>       // persona_id -> event_id -> row within group
}

export function TimelineLane({
  lane,
  events,
  yearStart,
  pixelsPerYear,
  yearEnd,
  onEventClick,
  onLaneClick,
  onLaneDragRange,
  onPan,
  eventRowMap,
  personaEvents,
  laneHeight,
  personaSubRowMap,
  currentYear,
  scrollLeft,
  viewportWidth,
  draggingEventId,
  onEventMoveStart,
  onEventExtendStart,
  overlayEvents = [],
  overlaySubRowMap,
  overlayEventRowMaps,
  overlayBaseOffset = 0,
  overlayTimelineInfoMap,
  personaEventRowMaps,
  sidebarWidth,
}: TimelineLaneProps) {
  const { sc } = useSizeConfig()
  const { BASE_LANE_HEIGHT, PERSONA_SUB_ROW_HEIGHT } = sc
  const effectiveSidebarWidth = sidebarWidth ?? sc.SIDEBAR_WIDTH
  const width = (yearEnd - yearStart) * pixelsPerYear
  const laneRef = useRef<HTMLDivElement>(null)
  const modeRef = useRef<Mode>('idle')
  const startClientXRef = useRef(0)
  const startYearRef = useRef(0)
  const lastClientXRef = useRef(0)
  const rangeTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null)
  const [dragPreview, setDragPreview] = useState<{ left: number; width: number } | null>(null)
  const [isPanning, setIsPanning] = useState(false)

  function clearTimer() {
    if (rangeTimerRef.current) {
      clearTimeout(rangeTimerRef.current)
      rangeTimerRef.current = null
    }
  }

  function handleMouseDown(e: React.MouseEvent<HTMLDivElement>) {
    if (e.target !== e.currentTarget) return
    if (e.button !== 0) return

    const rect = e.currentTarget.getBoundingClientRect()
    modeRef.current = 'pending'
    startClientXRef.current = e.clientX
    lastClientXRef.current = e.clientX
    startYearRef.current = yearStart + (e.clientX - rect.left) / pixelsPerYear

    // Closures capture onPan, onLaneClick, onLaneDragRange, lane, yearStart, pixelsPerYear
    const onMove = (ev: MouseEvent) => {
      const dx = ev.clientX - lastClientXRef.current
      lastClientXRef.current = ev.clientX

      if (modeRef.current === 'pending') {
        if (Math.abs(ev.clientX - startClientXRef.current) > PAN_THRESHOLD_PX) {
          clearTimer()
          modeRef.current = 'panning'
          setIsPanning(true)
          onPan(dx)
        }
      } else if (modeRef.current === 'panning') {
        onPan(dx)
      } else if (modeRef.current === 'ranging') {
        const el = laneRef.current
        if (!el) return
        const r = el.getBoundingClientRect()
        const startPx = startClientXRef.current - r.left
        const nowPx = ev.clientX - r.left
        setDragPreview({ left: Math.min(startPx, nowPx), width: Math.abs(nowPx - startPx) })
      }
    }

    const onUp = (ev: MouseEvent) => {
      window.removeEventListener('mousemove', onMove)
      window.removeEventListener('mouseup', onUp)
      clearTimer()
      const mode = modeRef.current
      modeRef.current = 'idle'

      if (mode === 'pending') {
        // single click — no-op; double-click opens the add-event dialog
      } else if (mode === 'panning') {
        setIsPanning(false)
      } else if (mode === 'ranging') {
        setDragPreview(null)
        const el = laneRef.current
        if (!el) return
        const r = el.getBoundingClientRect()
        const endYear = yearStart + (ev.clientX - r.left) / pixelsPerYear
        const [s, en] = startYearRef.current < endYear
          ? [startYearRef.current, endYear]
          : [endYear, startYearRef.current]
        if (en - s > 0.05) {
          const round = (y: number) => Math.round(y * 10) / 10
          onLaneDragRange(lane.id, round(s), round(en))
        }
      }
    }

    window.addEventListener('mousemove', onMove)
    window.addEventListener('mouseup', onUp)

    // After 1s of staying put, switch to range-draw mode
    rangeTimerRef.current = setTimeout(() => {
      rangeTimerRef.current = null
      if (modeRef.current !== 'pending') return
      modeRef.current = 'ranging'
      const el = laneRef.current
      if (el) {
        const r = el.getBoundingClientRect()
        setDragPreview({ left: startClientXRef.current - r.left, width: 0 })
      }
    }, RANGE_HOLD_MS)
  }

  function handleDoubleClick(e: React.MouseEvent<HTMLDivElement>) {
    if (e.target !== e.currentTarget) return
    const el = laneRef.current
    if (!el) return
    const r = el.getBoundingClientRect()
    const year = Math.round((yearStart + (e.clientX - r.left) / pixelsPerYear) * 2) / 2
    onLaneClick(lane.id, year)
  }

  // Stack depths for collapsed overlapping events (empty map when expanded)
  // NOTE: computed from ALL events so stacking is correct even for culled events
  const stackDepthMap = useMemo(() => {
    if (eventRowMap && eventRowMap.size > 0) return new Map<string, number>()
    return computeStackDepths(events)
  }, [events, eventRowMap])

  // ── Viewport culling ────────────────────────────────────────────────────────
  // Bucket scrollLeft so this memo invalidates at most once per CULL_SCROLL_BUCKET_PX
  // pixels of scrolling — not on every animation frame.
  const scrollBucket = Math.round(scrollLeft / CULL_SCROLL_BUCKET_PX)
  const culledEvents = useMemo(() => {
    if (viewportWidth <= 0 || pixelsPerYear <= 0) return events
    const effectiveScrollLeft = scrollBucket * CULL_SCROLL_BUCKET_PX
    const bufferYears = (CULL_BUFFER_SCREENS * viewportWidth) / pixelsPerYear
    const visStart = yearStart + effectiveScrollLeft / pixelsPerYear
    const cullStart = visStart - bufferYears
    const cullEnd = visStart + viewportWidth / pixelsPerYear + bufferYears
    return events.filter(ev => {
      if (ev.id === draggingEventId) return true // always render dragged event
      const evEnd = ev.type === 'range' ? (ev.endYear ?? ev.startYear + 1) : ev.startYear
      return evEnd >= cullStart && ev.startYear <= cullEnd
    })
  }, [events, yearStart, scrollBucket, viewportWidth, pixelsPerYear, draggingEventId])

  // ── Zoom-aware clustering ───────────────────────────────────────────────────
  const renderItems = useMemo(
    () => buildRenderItems(culledEvents, pixelsPerYear, lane.color, draggingEventId),
    [culledEvents, pixelsPerYear, lane.color, draggingEventId],
  )

  // ── Debug instrumentation ───────────────────────────────────────────────────
  // Enable by running: window.__TIMELINE_PERF_DEBUG = true  in browser console
  useEffect(() => {
    if (typeof window === 'undefined' || !(window as unknown as Record<string, unknown>).__TIMELINE_PERF_DEBUG) return
    const clusters = renderItems.filter(r => r.kind === 'cluster').length
    console.debug(
      `[Timeline perf | lane "${lane.name}"] band=${getZoomBand(pixelsPerYear)} ppy=${pixelsPerYear.toFixed(1)} total=${events.length} rendered=${culledEvents.length} clusters=${clusters}`,
    )
  }, [events.length, culledEvents.length, renderItems, lane.name])

  // ── Render ───────────────────────────────────────────────────────────────
  // Separator is only drawn at the boundary between event rows and persona sub-rows,
  // NOT between stacked event rows. This prevents grey lines inside expanded lanes.
  const numEventRows = eventRowMap && eventRowMap.size > 0
    ? Math.max(...eventRowMap.values()) + 1
    : 1
  const hasPersonaRows = personaEvents.length > 0
  const hasOverlayRows = overlayEvents.length > 0

  return (
    <div
      ref={laneRef}
      data-lane-id={lane.id}
      className={`relative border-b border-border/30 select-none ${isPanning ? 'cursor-grabbing' : 'cursor-crosshair'}`}
      style={{ height: laneHeight, width }}
      onMouseDown={handleMouseDown}
      onDoubleClick={handleDoubleClick}
    >
      {/* Separator at event-rows / sub-rows boundary */}
      {(hasPersonaRows || hasOverlayRows) && (
        <div
          className="absolute left-0 right-0 border-t border-border/20"
          style={{ top: numEventRows * BASE_LANE_HEIGHT }}
        />
      )}

      {/* Range-draw preview */}
      {dragPreview && (
        <div
          className="absolute top-0 pointer-events-none rounded-sm"
          style={{
            left: dragPreview.left,
            width: dragPreview.width,
            height: BASE_LANE_HEIGHT,
            backgroundColor: lane.color,
            opacity: 0.25,
            border: `2px dashed ${lane.color}`,
          }}
        />
      )}

      {renderItems.map(item =>
        item.kind === 'single' ? (
          <TimelineEventBar
            key={item.event.id}
            event={item.event}
            yearStart={yearStart}
            pixelsPerYear={pixelsPerYear}
            laneColor={lane.color}
            onClick={onEventClick}
            currentYear={currentYear}
            topOffset={(eventRowMap?.get(item.event.id) ?? 0) * BASE_LANE_HEIGHT}
            stackDepth={stackDepthMap.get(item.event.id)}
            scrollLeft={scrollLeft}
            sidebarWidth={effectiveSidebarWidth}
            isDragging={draggingEventId === item.event.id}
            onMoveStart={onEventMoveStart}
            onExtendStart={onEventExtendStart}
          />
        ) : (
          <ClusterBar
            key={`cluster-${item.startYear}-${item.count}`}
            item={item}
            yearStart={yearStart}
            pixelsPerYear={pixelsPerYear}
            baseHeight={BASE_LANE_HEIGHT}
          />
        )
      )}
      {personaEvents.map(pe => (
        <PersonaEventBar
          key={pe.id}
          event={pe}
          yearStart={yearStart}
          pixelsPerYear={pixelsPerYear}
          laneColor={lane.color}
          subRowIndex={(personaSubRowMap.get(pe.persona_id) ?? 0) + (personaEventRowMaps?.get(pe.persona_id)?.get(pe.id) ?? 0)}
          currentYear={currentYear}
          scrollLeft={scrollLeft}
          sidebarWidth={effectiveSidebarWidth}
        />
      ))}
      {overlayEvents.map(oe => {
        const baseSubRow = overlaySubRowMap?.get(oe.timeline_id) ?? 0
        const eventRow = overlayEventRowMaps?.get(oe.timeline_id)?.get(oe.id) ?? 0
        const info = overlayTimelineInfoMap?.get(oe.timeline_id)
        return (
          <OverlayEventBar
            key={oe.id}
            event={oe}
            timelineName={info?.name ?? 'Unknown'}
            timelineColor={info?.color}
            yearStart={yearStart}
            pixelsPerYear={pixelsPerYear}
            laneColor={lane.color}
            rowTop={overlayBaseOffset + (baseSubRow + eventRow) * PERSONA_SUB_ROW_HEIGHT}
            rowHeight={PERSONA_SUB_ROW_HEIGHT}
            currentYear={currentYear}
            scrollLeft={scrollLeft}
            sidebarWidth={effectiveSidebarWidth}
          />
        )
      })}
    </div>
  )
}
