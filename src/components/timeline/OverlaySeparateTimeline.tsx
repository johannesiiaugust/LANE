import { useMemo } from 'react'
import type { DbTimeline, OverlayTimelineEvent } from '@/types/database'
import { OverlayEventBar } from './OverlayEventBar'
import { useSizeConfig } from '@/contexts/UiSizeContext'
import { getZoomMode, getYearInterval } from '@/lib/constants'

interface OverlaySeparateTimelineProps {
  timeline: DbTimeline
  events: OverlayTimelineEvent[]
  laneNames: string[]
  yearStart: number
  yearEnd: number
  pixelsPerYear: number
  laneColorMap: Map<string, string>
  currentYear: number
  laneRowCounts?: Map<string, number>                    // lane name -> num rows
  laneEventRowMaps?: Map<string, Map<string, number>>    // lane name -> event id -> row
  scrollLeft?: number
  viewportWidth?: number
}

export function OverlaySeparateTimeline({
  timeline,
  events,
  laneNames,
  yearStart,
  yearEnd,
  pixelsPerYear,
  laneColorMap,
  currentYear,
  laneRowCounts,
  laneEventRowMaps,
  scrollLeft = 0,
  viewportWidth = 1200,
}: OverlaySeparateTimelineProps) {
  const { sc } = useSizeConfig()
  const { BASE_LANE_HEIGHT, PERSONA_SUB_ROW_HEIGHT, MIN_TICK_PX, TICK_FONT } = sc
  const width = (yearEnd - yearStart) * pixelsPerYear

  // Total height of this section for the lifespan overlay
  const sectionHeight = useMemo(() => {
    const lanesH = laneNames.reduce((sum, n) => sum + (laneRowCounts?.get(n) ?? 1) * BASE_LANE_HEIGHT, 0)
    return PERSONA_SUB_ROW_HEIGHT + lanesH
  }, [laneNames, laneRowCounts, BASE_LANE_HEIGHT, PERSONA_SUB_ROW_HEIGHT])

  // Lifespan overlay using timeline's own color, adjusted for alignment offset
  const lifeSpanOverlay = useMemo(() => {
    if (timeline.start_year == null) return null
    const c = timeline.color ?? '#6b7280'
    const solid = c + '1a'  // ~10% opacity
    const fade  = c + '00'
    // Derive offset from events (0 if not aligned or no events)
    const yearOffset = events.length > 0 ? events[0].display_start_year - events[0].start_year : 0
    const startPx = (timeline.start_year + yearOffset - yearStart) * pixelsPerYear
    if (timeline.end_year != null) {
      const endPx = (timeline.end_year + yearOffset - yearStart) * pixelsPerYear
      return (
        <div className="absolute top-0 bottom-0 pointer-events-none" style={{
          left: Math.max(0, startPx),
          width: Math.max(0, endPx - Math.max(0, startPx)),
          backgroundColor: solid,
        }} />
      )
    } else {
      // No end — solid until start+85, fade to start+100
      const solidPx = (timeline.start_year + yearOffset + 85 - yearStart) * pixelsPerYear
      const fadePx  = (timeline.start_year + yearOffset + 100 - yearStart) * pixelsPerYear
      const left = Math.max(0, startPx)
      const w = Math.max(0, fadePx - left)
      const solidStop = Math.max(0, solidPx - left)
      return (
        <div className="absolute top-0 bottom-0 pointer-events-none" style={{
          left,
          width: w,
          background: `linear-gradient(to right, ${solid} 0px, ${solid} ${solidStop}px, ${fade} ${w}px)`,
        }} />
      )
    }
  }, [events, timeline.start_year, timeline.end_year, timeline.color, yearStart, pixelsPerYear])

  // Year offset: how much overlay events are shifted relative to their actual years
  const yearOffset = events.length > 0 ? events[0].display_start_year - events[0].start_year : 0

  // Year ticks for the heading row — labels show the overlay timeline's own calendar years
  const yearTicks = useMemo(() => {
    const mode = getZoomMode(pixelsPerYear)
    if (mode !== 'year') return []
    const bufferPx = viewportWidth * 2
    const visStart = yearStart + Math.max(0, scrollLeft - bufferPx) / pixelsPerYear
    const visEnd = yearStart + (scrollLeft + viewportWidth + bufferPx) / pixelsPerYear
    const interval = getYearInterval(pixelsPerYear)
    const first = Math.ceil(visStart / interval) * interval
    const ticks: { key: number; left: number; label: string }[] = []
    for (let y = first; y <= Math.min(visEnd, yearEnd); y += interval) {
      const left = (y - yearStart) * pixelsPerYear
      const overlayYear = Math.round(y - yearOffset)
      ticks.push({ key: y, left, label: String(overlayYear) })
    }
    const filtered: typeof ticks = []
    for (const tick of ticks) {
      if (filtered.length === 0 || tick.left - filtered[filtered.length - 1].left >= MIN_TICK_PX) {
        filtered.push(tick)
      }
    }
    return filtered
  }, [pixelsPerYear, scrollLeft, viewportWidth, yearStart, yearEnd, yearOffset, MIN_TICK_PX])

  return (
    <div className="relative" style={{ width, height: sectionHeight }}>
      {lifeSpanOverlay}
      {/* Timeline header row — year ticks showing this overlay's own calendar years */}
      <div className="relative border-t-2 border-border/60 bg-muted/30 overflow-hidden" style={{ height: PERSONA_SUB_ROW_HEIGHT }}>
        {yearTicks.map(({ key, left, label }) => (
          <div
            key={key}
            className="absolute top-0 h-full text-muted-foreground/70 select-none"
            style={{ left }}
          >
            <div className="absolute bottom-0 w-px bg-border/50" style={{ height: Math.round(PERSONA_SUB_ROW_HEIGHT / 2) }} />
            <span
              className="absolute -translate-x-1/2 whitespace-nowrap font-medium"
              style={{ top: Math.round(PERSONA_SUB_ROW_HEIGHT * 0.12), fontSize: TICK_FONT * 0.75 }}
            >
              {label}
            </span>
          </div>
        ))}
      </div>

      {/* Lane rows */}
      {laneNames.map(laneName => {
        const laneEvents = events.filter(e => e.lane_name === laneName)
        const laneColor = laneColorMap.get(laneName) ?? '#6b7280'
        const rowCount = laneRowCounts?.get(laneName) ?? 1
        const eventRowMap = laneEventRowMaps?.get(laneName)
        return (
          <div
            key={laneName}
            className="relative border-b border-border/30 bg-muted/20"
            style={{ height: rowCount * BASE_LANE_HEIGHT, width }}
          >
            {laneEvents.map(e => (
              <OverlayEventBar
                key={e.id}
                event={e}
                timelineName={timeline.name}
                timelineColor={timeline.color}
                yearStart={yearStart}
                pixelsPerYear={pixelsPerYear}
                laneColor={laneColor}
                rowTop={eventRowMap ? (eventRowMap.get(e.id) ?? 0) * BASE_LANE_HEIGHT : 0}
                rowHeight={BASE_LANE_HEIGHT}
                currentYear={currentYear}
              />
            ))}
          </div>
        )
      })}
    </div>
  )
}
