import { useState, useEffect, useMemo } from 'react'
import { ChevronDown, ChevronRight, Eye, EyeOff, MoreHorizontal, Pencil, Trash2, TrendingUp, ArrowUp, ArrowDown } from 'lucide-react'
import type { Lane } from '@/types/timeline'
import {
  DropdownMenu,
  DropdownMenuTrigger,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuSeparator,
} from '@/components/ui/dropdown-menu'
import { useSizeConfig } from '@/contexts/UiSizeContext'
import { useTranslateLaneName } from '@/i18n'

export interface PersonaSidebarSection {
  personaId: string
  name: string
  initials: string
  birthYear: number
  deathYear?: number | null
  laneRowData: { name: string; hasOverlaps: boolean; rowCount: number }[]
}

export interface OverlaySidebarSection {
  timelineId: string
  name: string
  label: string   // emoji or 2-char abbreviation
  color: string
  laneRowData: { name: string; hasOverlaps: boolean; rowCount: number }[]
}

interface LaneSidebarProps {
  lanes: Lane[]
  hiddenLanes: Lane[]
  laneHeights: number[]
  lanePersonaLabels: Map<string, { initials: string; name: string; personaId: string; hasOverlaps: boolean; rowCount: number }[]>
  laneOverlayLabels?: Map<string, { label: string; name: string; timelineId: string; hasOverlaps: boolean; rowCount: number }[]>
  laneHasOverlaps: Map<string, boolean>
  expandedLanes: Set<string>
  expandedPersonaRows: Set<string>
  expandedOverlayRows: Set<string>
  expandedSeparatePersonaLanes: Set<string>
  expandedSeparateOverlayLanes: Set<string>
  separatePersonaSections?: PersonaSidebarSection[]
  separateOverlaySections?: OverlaySidebarSection[]
  onToggleExpand: (id: string) => void
  onTogglePersonaExpand: (laneId: string, personaId: string) => void
  onToggleOverlayExpand: (laneId: string, timelineId: string) => void
  onToggleSeparatePersonaLane: (personaId: string, laneName: string) => void
  onToggleSeparateOverlayLane: (timelineId: string, laneName: string) => void
  onToggleVisibility: (id: string) => void
  onMoveLane: (id: string, direction: 'up' | 'down') => void
  onEditLane: (lane: Lane) => void
  onDeleteLane: (lane: Lane) => void
  totalAssetsHeight?: number
  timelineName?: string
}

export function LaneSidebar({
  lanes,
  hiddenLanes,
  laneHeights,
  lanePersonaLabels,
  laneOverlayLabels,
  laneHasOverlaps,
  expandedLanes,
  expandedPersonaRows,
  expandedOverlayRows,
  expandedSeparatePersonaLanes,
  expandedSeparateOverlayLanes,
  separatePersonaSections = [],
  separateOverlaySections = [],
  onToggleExpand,
  onTogglePersonaExpand,
  onToggleOverlayExpand,
  onToggleSeparatePersonaLane,
  onToggleSeparateOverlayLane,
  onToggleVisibility,
  onMoveLane,
  onEditLane,
  onDeleteLane,
  totalAssetsHeight,
  timelineName,
}: LaneSidebarProps) {
  const [showHidden, setShowHidden] = useState(false)
  const { sc } = useSizeConfig()
  const translateLaneName = useTranslateLaneName()
  const { BASE_LANE_HEIGHT, PERSONA_SUB_ROW_HEIGHT, SIDEBAR_WIDTH, HEADER_HEIGHT, SIDEBAR_FONT, ICON_SIZE } = sc

  // Compress sidebar on narrow viewports so more horizontal space goes to the timeline
  const [viewportWidth, setViewportWidth] = useState(() => window.innerWidth)
  useEffect(() => {
    const update = () => setViewportWidth(window.innerWidth)
    window.addEventListener('resize', update)
    return () => window.removeEventListener('resize', update)
  }, [])
  const W = Math.min(SIDEBAR_WIDTH, Math.max(72, Math.round(viewportWidth * 0.28)))

  const iconPad = Math.round(ICON_SIZE / 12)

  // Full sorted lane order (visible + hidden) for move-up/down boundary checks
  const sortedAllLanes = useMemo(
    () => [...lanes, ...hiddenLanes].sort((a, b) => a.order - b.order),
    [lanes, hiddenLanes],
  )

  return (
    <div className="bg-background" style={{ minWidth: W, width: W }}>
      {/* A1 cell — timeline name */}
      <div
        className="border-b bg-background flex items-end overflow-hidden"
        style={{ height: HEADER_HEIGHT, paddingLeft: Math.round(W * 0.08), paddingRight: Math.round(W * 0.04), paddingBottom: Math.round(SIDEBAR_FONT * 0.3) }}
      >
        {timelineName && (
          <span
            className="font-bold truncate text-foreground"
            style={{ fontSize: SIDEBAR_FONT }}
          >
            {timelineName}
          </span>
        )}
      </div>

      {lanes.map((lane, i) => {
        const height = laneHeights[i] ?? BASE_LANE_HEIGHT
        const personaLabels = lanePersonaLabels.get(lane.name) ?? []
        return (
          <div
            key={lane.id}
            className="border-b border-border/30 group"
            style={{ height, paddingLeft: Math.round(W * 0.04), paddingRight: Math.round(W * 0.04) }}
          >
            {/* Main lane label row */}
            <div className="relative flex items-center" style={{ height: BASE_LANE_HEIGHT, paddingLeft: Math.round(W * 0.04) }}>
              {/* Expand chevron — left side, compact */}
              {laneHasOverlaps.get(lane.id) && (
                <button
                  onClick={() => onToggleExpand(lane.id)}
                  className="shrink-0 text-muted-foreground/50 hover:text-foreground transition-colors"
                  style={{ padding: iconPad, marginRight: Math.round(W * 0.02) }}
                  title={expandedLanes.has(lane.id) ? 'Collapse rows' : 'Expand overlapping events'}
                >
                  {expandedLanes.has(lane.id)
                    ? <ChevronDown size={Math.round(ICON_SIZE * 0.75)} />
                    : <ChevronRight size={Math.round(ICON_SIZE * 0.75)} />}
                </button>
              )}

              {/* Text: fades out on the right */}
              <span
                className="font-medium flex-1 min-w-0 whitespace-nowrap overflow-hidden"
                style={{
                  fontSize: SIDEBAR_FONT,
                  opacity: lane.visible ? 1 : 0.4,
                  maskImage: 'linear-gradient(to right, black 55%, transparent 90%)',
                  WebkitMaskImage: 'linear-gradient(to right, black 55%, transparent 90%)',
                }}
              >
                {lane.emoji && <span className="mr-1">{lane.emoji}</span>}{translateLaneName(lane.name)}
              </span>

              {/* Action buttons — absolute overlay on hover, no layout cost when hidden */}
              <div
                className="absolute inset-y-0 right-0 flex items-center opacity-0 group-hover:opacity-100 pointer-events-none group-hover:pointer-events-auto transition-opacity"
                style={{
                  paddingRight: Math.round(W * 0.02),
                  paddingLeft: ICON_SIZE * 2,
                  background: `linear-gradient(to right, transparent, hsl(var(--background)) ${ICON_SIZE * 2}px)`,
                }}
              >
                <button
                  onClick={() => onToggleVisibility(lane.id)}
                  className="text-muted-foreground hover:text-foreground transition-colors"
                  style={{ padding: iconPad }}
                >
                  {lane.visible ? <Eye size={ICON_SIZE} /> : <EyeOff size={ICON_SIZE} />}
                </button>
                <DropdownMenu>
                  <DropdownMenuTrigger asChild>
                    <button
                      className="text-muted-foreground hover:text-foreground transition-colors"
                      style={{ padding: iconPad }}
                    >
                      <MoreHorizontal size={ICON_SIZE} />
                    </button>
                  </DropdownMenuTrigger>
                  <DropdownMenuContent align="start" sideOffset={4}>
                    <DropdownMenuItem onClick={() => onEditLane(lane)}>
                      <Pencil className="h-4 w-4 mr-2" />
                      Edit Lane
                    </DropdownMenuItem>
                    <DropdownMenuSeparator />
                    <DropdownMenuItem
                      onClick={() => onMoveLane(lane.id, 'up')}
                      disabled={sortedAllLanes[0]?.id === lane.id}
                    >
                      <ArrowUp className="h-4 w-4 mr-2" />
                      Move Up
                    </DropdownMenuItem>
                    <DropdownMenuItem
                      onClick={() => onMoveLane(lane.id, 'down')}
                      disabled={sortedAllLanes[sortedAllLanes.length - 1]?.id === lane.id}
                    >
                      <ArrowDown className="h-4 w-4 mr-2" />
                      Move Down
                    </DropdownMenuItem>
                    <DropdownMenuSeparator />
                    <DropdownMenuItem
                      className="text-destructive focus:text-destructive"
                      onClick={() => onDeleteLane(lane)}
                    >
                      <Trash2 className="h-4 w-4 mr-2" />
                      Delete Lane
                    </DropdownMenuItem>
                  </DropdownMenuContent>
                </DropdownMenu>
              </div>
            </div>

            {/* Persona sub-row labels */}
            {personaLabels.map((pl, j) => {
              const isPersonaExpanded = expandedPersonaRows.has(`${lane.id}:${pl.personaId}`)
              const rowH = pl.rowCount * PERSONA_SUB_ROW_HEIGHT
              const topPad = Math.round((PERSONA_SUB_ROW_HEIGHT - SIDEBAR_FONT * 1.4) / 2)
              return (
                <div
                  key={j}
                  className="flex items-start text-muted-foreground"
                  style={{
                    height: rowH,
                    paddingLeft: pl.hasOverlaps ? Math.round(W * 0.04) : Math.round(W * 0.08),
                    paddingTop: topPad,
                    gap: Math.round(ICON_SIZE / 6),
                  }}
                >
                  {pl.hasOverlaps && (
                    <button
                      onClick={() => onTogglePersonaExpand(lane.id, pl.personaId)}
                      className="text-muted-foreground hover:text-foreground shrink-0 transition-colors"
                      style={{ padding: iconPad }}
                      title={isPersonaExpanded ? 'Collapse rows' : 'Expand overlapping events'}
                    >
                      {isPersonaExpanded
                        ? <ChevronDown size={ICON_SIZE} />
                        : <ChevronRight size={ICON_SIZE} />}
                    </button>
                  )}
                  <span className="truncate" style={{ fontSize: SIDEBAR_FONT }}>
                    {translateLaneName(pl.name)}
                  </span>
                </div>
              )
            })}

            {/* Overlay sub-row labels */}
            {(laneOverlayLabels?.get(lane.name) ?? []).map((ol, j) => {
              const isOverlayExpanded = expandedOverlayRows.has(`${lane.id}:${ol.timelineId}`)
              const rowH = ol.rowCount * PERSONA_SUB_ROW_HEIGHT
              const topPad = Math.round((PERSONA_SUB_ROW_HEIGHT - SIDEBAR_FONT * 1.4) / 2)
              return (
                <div
                  key={`ov-${j}`}
                  className="flex items-start text-muted-foreground"
                  style={{
                    height: rowH,
                    paddingLeft: ol.hasOverlaps ? Math.round(W * 0.04) : Math.round(W * 0.08),
                    paddingTop: topPad,
                    gap: Math.round(ICON_SIZE / 6),
                  }}
                >
                  {ol.hasOverlaps && (
                    <button
                      onClick={() => onToggleOverlayExpand(lane.id, ol.timelineId)}
                      className="text-muted-foreground hover:text-foreground shrink-0 transition-colors"
                      style={{ padding: iconPad }}
                      title={isOverlayExpanded ? 'Collapse rows' : 'Expand overlapping events'}
                    >
                      {isOverlayExpanded
                        ? <ChevronDown size={ICON_SIZE} />
                        : <ChevronRight size={ICON_SIZE} />}
                    </button>
                  )}
                  <span className="truncate" style={{ fontSize: SIDEBAR_FONT }}>
                    {translateLaneName(ol.name)}
                  </span>
                </div>
              )
            })}
          </div>
        )
      })}

      {/* Total Assets summary row */}
      {totalAssetsHeight != null && totalAssetsHeight > 0 && (
        <div
          className="border-b border-border/30 flex items-center bg-muted/10"
          style={{
            height: totalAssetsHeight,
            paddingLeft: Math.round(W * 0.04),
            paddingRight: Math.round(W * 0.04),
            gap: Math.round(ICON_SIZE / 4),
          }}
        >
          <TrendingUp size={ICON_SIZE} className="shrink-0 text-teal-500" />
          <span className="font-medium truncate flex-1 text-teal-600" style={{ fontSize: SIDEBAR_FONT }}>
            Total Wealth
          </span>
        </div>
      )}

      {/* Separate persona sections */}
      {separatePersonaSections.map(section => (
        <div key={section.personaId}>
          {/* Persona header row */}
          <div
            className="border-t-2 border-border/60 flex items-center bg-muted/40"
            style={{
              height: PERSONA_SUB_ROW_HEIGHT,
              paddingLeft: Math.round(W * 0.04),
              paddingRight: Math.round(W * 0.04),
              gap: Math.round(ICON_SIZE / 6),
            }}
          >
            <span className="font-semibold text-muted-foreground truncate" style={{ fontSize: SIDEBAR_FONT }}>
              {section.name}
            </span>
            <span
              className="text-muted-foreground/60 shrink-0 hidden xl:inline"
              style={{ fontSize: Math.round(SIDEBAR_FONT * 0.75) }}
            >
              {section.birthYear}–{section.deathYear ?? 'present'}
            </span>
          </div>
          {/* One label row per lane */}
          {section.laneRowData.map(row => {
            const sepKey = `${section.personaId}:${row.name}`
            const isRowExpanded = expandedSeparatePersonaLanes.has(sepKey)
            return (
              <div
                key={row.name}
                className="border-b border-border/30 flex items-start text-muted-foreground bg-muted/20"
                style={{
                  height: row.rowCount * BASE_LANE_HEIGHT,
                  paddingLeft: row.hasOverlaps ? Math.round(W * 0.04) : Math.round(W * 0.08),
                  paddingRight: Math.round(W * 0.04),
                  paddingTop: Math.round((BASE_LANE_HEIGHT - SIDEBAR_FONT * 1.4) / 2),
                  gap: Math.round(ICON_SIZE / 4),
                }}
              >
                {row.hasOverlaps && (
                  <button
                    onClick={() => onToggleSeparatePersonaLane(section.personaId, row.name)}
                    className="text-muted-foreground hover:text-foreground shrink-0 transition-colors"
                    style={{ padding: iconPad }}
                    title={isRowExpanded ? 'Collapse rows' : 'Expand overlapping events'}
                  >
                    {isRowExpanded ? <ChevronDown size={ICON_SIZE} /> : <ChevronRight size={ICON_SIZE} />}
                  </button>
                )}
                <span className="truncate" style={{ fontSize: SIDEBAR_FONT }}>{translateLaneName(row.name)}</span>
              </div>
            )
          })}
        </div>
      ))}

      {/* Separate overlay timeline sections */}
      {separateOverlaySections.map(section => (
        <div key={section.timelineId}>
          <div
            className="border-t-2 border-border/60 flex items-center bg-muted/40"
            style={{
              height: PERSONA_SUB_ROW_HEIGHT,
              paddingLeft: Math.round(W * 0.04),
              paddingRight: Math.round(W * 0.04),
              gap: Math.round(ICON_SIZE / 6),
            }}
          >
            <span className="font-semibold text-muted-foreground truncate" style={{ fontSize: SIDEBAR_FONT }}>
              {section.name}
            </span>
          </div>
          {section.laneRowData.map(row => {
            const sepKey = `${section.timelineId}:${row.name}`
            const isRowExpanded = expandedSeparateOverlayLanes.has(sepKey)
            return (
              <div
                key={row.name}
                className="border-b border-border/30 flex items-start text-muted-foreground bg-muted/20"
                style={{
                  height: row.rowCount * BASE_LANE_HEIGHT,
                  paddingLeft: row.hasOverlaps ? Math.round(W * 0.04) : Math.round(W * 0.08),
                  paddingRight: Math.round(W * 0.04),
                  paddingTop: Math.round((BASE_LANE_HEIGHT - SIDEBAR_FONT * 1.4) / 2),
                  gap: Math.round(ICON_SIZE / 4),
                }}
              >
                {row.hasOverlaps && (
                  <button
                    onClick={() => onToggleSeparateOverlayLane(section.timelineId, row.name)}
                    className="text-muted-foreground hover:text-foreground shrink-0 transition-colors"
                    style={{ padding: iconPad }}
                    title={isRowExpanded ? 'Collapse rows' : 'Expand overlapping events'}
                  >
                    {isRowExpanded ? <ChevronDown size={ICON_SIZE} /> : <ChevronRight size={ICON_SIZE} />}
                  </button>
                )}
                <span className="truncate" style={{ fontSize: SIDEBAR_FONT }}>{translateLaneName(row.name)}</span>
              </div>
            )
          })}
        </div>
      ))}

      {/* Hidden lanes recovery section — list floats above the button via absolute positioning */}
      {hiddenLanes.length > 0 && (
        <div className="border-t border-border/50 relative">
          <button
            onClick={() => setShowHidden(!showHidden)}
            className="flex items-center w-full text-muted-foreground hover:text-foreground hover:bg-muted/50 transition-colors"
            style={{
              gap: Math.round(ICON_SIZE / 6),
              padding: `${Math.round(SIDEBAR_FONT * 0.4)}px ${Math.round(W * 0.04)}px`,
              fontSize: SIDEBAR_FONT,
            }}
          >
            <ChevronRight
              size={ICON_SIZE}
              className="shrink-0 transition-transform"
              style={{ transform: showHidden ? 'rotate(90deg)' : undefined }}
            />
            <EyeOff size={ICON_SIZE} className="shrink-0" />
            <span>Hidden ({hiddenLanes.length})</span>
          </button>
          {showHidden && (
            <div
              className="absolute w-full bg-background border border-border/50 rounded-t shadow-md z-10"
              style={{ bottom: '100%' }}
            >
              {hiddenLanes.map(lane => (
                <div
                  key={lane.id}
                  className="flex items-center group/hidden"
                  style={{
                    gap: Math.round(ICON_SIZE / 6),
                    padding: `${Math.round(SIDEBAR_FONT * 0.25)}px ${Math.round(W * 0.04)}px`,
                  }}
                >
                  <span
                    className="text-muted-foreground flex-1 min-w-0 whitespace-nowrap overflow-hidden"
                    style={{
                      fontSize: SIDEBAR_FONT,
                      maskImage: 'linear-gradient(to right, black 55%, transparent 90%)',
                      WebkitMaskImage: 'linear-gradient(to right, black 55%, transparent 90%)',
                    }}
                  >
                    {lane.emoji && <span className="mr-1">{lane.emoji}</span>}{translateLaneName(lane.name)}
                  </span>
                  <button
                    onClick={() => onToggleVisibility(lane.id)}
                    className="text-muted-foreground hover:text-foreground opacity-0 group-hover/hidden:opacity-100 transition-opacity"
                    style={{ padding: iconPad }}
                  >
                    <Eye size={ICON_SIZE} />
                  </button>
                </div>
              ))}
            </div>
          )}
        </div>
      )}
    </div>
  )
}
