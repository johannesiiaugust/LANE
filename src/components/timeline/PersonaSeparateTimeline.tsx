import { useMemo } from 'react'
import type { DbPersona, AlignedPersonaEvent } from '@/types/database'
import { PersonaEventBar } from './PersonaEventBar'
import { useSizeConfig } from '@/contexts/UiSizeContext'
import { getZoomMode, getYearInterval } from '@/lib/constants'

interface PersonaSeparateTimelineProps {
  persona: DbPersona
  events: AlignedPersonaEvent[]
  laneNames: string[]   // stable ordered lane names, provided by parent
  yearStart: number
  yearEnd: number
  pixelsPerYear: number
  laneColorMap: Map<string, string>
  currentYear: number
  laneRowCounts?: Map<string, number>                    // lane name -> num rows
  laneEventRowMaps?: Map<string, Map<string, number>>    // lane name -> event id -> row
  scrollLeft?: number
  viewportWidth?: number
  sidebarWidth?: number
}

export function PersonaSeparateTimeline({
  persona,
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
  sidebarWidth,
}: PersonaSeparateTimelineProps) {
  const { sc } = useSizeConfig()
  const { BASE_LANE_HEIGHT, PERSONA_SUB_ROW_HEIGHT, MIN_TICK_PX, TICK_FONT } = sc
  const width = (yearEnd - yearStart) * pixelsPerYear

  // Total height of this section for the lifespan overlay
  const sectionHeight = useMemo(() => {
    const lanesH = laneNames.reduce((sum, n) => sum + (laneRowCounts?.get(n) ?? 1) * BASE_LANE_HEIGHT, 0)
    return PERSONA_SUB_ROW_HEIGHT + lanesH
  }, [laneNames, laneRowCounts, BASE_LANE_HEIGHT, PERSONA_SUB_ROW_HEIGHT])

  // Lifespan overlay (grey), adjusted for alignment offset
  const lifeSpanOverlay = useMemo(() => {
    const c = '#6b7280'
    const solid = c + '1a'  // ~10% opacity
    const fade  = c + '00'
    // Derive offset from events (0 if not aligned or no events)
    const yearOffset = events.length > 0 ? events[0].display_start_year - events[0].start_year : 0
    const birthPx = (persona.birth_year + yearOffset - yearStart) * pixelsPerYear
    if (persona.death_year != null) {
      const endPx = (persona.death_year + yearOffset - yearStart) * pixelsPerYear
      return (
        <div className="absolute top-0 bottom-0 pointer-events-none" style={{
          left: Math.max(0, birthPx),
          width: Math.max(0, endPx - Math.max(0, birthPx)),
          backgroundColor: solid,
        }} />
      )
    } else {
      const solidPx = (persona.birth_year + yearOffset + 85 - yearStart) * pixelsPerYear
      const fadePx  = (persona.birth_year + yearOffset + 100 - yearStart) * pixelsPerYear
      const left = Math.max(0, birthPx)
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
  }, [events, persona.birth_year, persona.death_year, yearStart, pixelsPerYear])

  // Year offset: how much persona events are shifted relative to their actual years
  const yearOffset = events.length > 0 ? events[0].display_start_year - events[0].start_year : 0

  // Year ticks for the persona heading row — same positions as main header but labels offset
  const yearTicks = useMemo(() => {
    const mode = getZoomMode(pixelsPerYear)
    if (mode !== 'year') return []  // only show year-level ticks in the sub-row (space is limited)
    const bufferPx = viewportWidth * 2
    const visStart = yearStart + Math.max(0, scrollLeft - bufferPx) / pixelsPerYear
    const visEnd = yearStart + (scrollLeft + viewportWidth + bufferPx) / pixelsPerYear
    const interval = getYearInterval(pixelsPerYear)
    const first = Math.ceil(visStart / interval) * interval
    const ticks: { key: number; left: number; label: string }[] = []
    for (let y = first; y <= Math.min(visEnd, yearEnd); y += interval) {
      const left = (y - yearStart) * pixelsPerYear
      const personaYear = Math.round(y - yearOffset)
      ticks.push({ key: y, left, label: String(personaYear) })
    }
    // Deduplicate ticks that are too close together
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
      {/* Persona header row — year ticks showing persona's own calendar years */}
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

      {/* Lane rows — event bars only, no in-flow or sticky labels inside */}
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
              <PersonaEventBar
                key={e.id}
                event={e}
                yearStart={yearStart}
                pixelsPerYear={pixelsPerYear}
                laneColor={laneColor}
                currentYear={currentYear}
                rowTopOffset={eventRowMap ? (eventRowMap.get(e.id) ?? 0) * BASE_LANE_HEIGHT : undefined}
                scrollLeft={scrollLeft}
                sidebarWidth={sidebarWidth}
              />
            ))}
          </div>
        )
      })}
    </div>
  )
}
