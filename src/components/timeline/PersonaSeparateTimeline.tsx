import { useMemo } from 'react'
import type { DbPersona, AlignedPersonaEvent } from '@/types/database'
import { PersonaEventBar } from './PersonaEventBar'
import { useSizeConfig } from '@/contexts/UiSizeContext'

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
}: PersonaSeparateTimelineProps) {
  const { sc } = useSizeConfig()
  const { BASE_LANE_HEIGHT, PERSONA_SUB_ROW_HEIGHT } = sc
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

  return (
    <div className="relative" style={{ width, height: sectionHeight }}>
      {lifeSpanOverlay}
      {/* Persona header row — height spacer only; label is rendered in LaneSidebar */}
      <div className="border-t-2 border-border/60 bg-muted/30" style={{ height: PERSONA_SUB_ROW_HEIGHT }} />

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
              />
            ))}
          </div>
        )
      })}
    </div>
  )
}
