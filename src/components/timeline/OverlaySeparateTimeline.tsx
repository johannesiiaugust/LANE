import type { DbTimeline, OverlayTimelineEvent } from '@/types/database'
import { OverlayEventBar } from './OverlayEventBar'
import { useSizeConfig } from '@/contexts/UiSizeContext'

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
}: OverlaySeparateTimelineProps) {
  const { sc } = useSizeConfig()
  const { BASE_LANE_HEIGHT, PERSONA_SUB_ROW_HEIGHT } = sc
  const width = (yearEnd - yearStart) * pixelsPerYear

  return (
    <div style={{ width }}>
      {/* Timeline header row — height spacer; label is in LaneSidebar */}
      <div className="border-t-2 border-border/60 bg-muted/10" style={{ height: PERSONA_SUB_ROW_HEIGHT }} />

      {/* Lane rows */}
      {laneNames.map(laneName => {
        const laneEvents = events.filter(e => e.lane_name === laneName)
        const laneColor = laneColorMap.get(laneName) ?? '#6b7280'
        const rowCount = laneRowCounts?.get(laneName) ?? 1
        const eventRowMap = laneEventRowMaps?.get(laneName)
        return (
          <div
            key={laneName}
            className="relative border-b border-border/30"
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
