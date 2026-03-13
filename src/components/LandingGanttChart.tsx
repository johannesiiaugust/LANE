import { useState, useRef, useEffect, useCallback } from 'react'
import type { LucideIcon } from 'lucide-react'
import { MapPin, Briefcase, GraduationCap, Heart, Landmark, Zap } from 'lucide-react'
import { cn } from '@/lib/utils'

// ── Palette ─────────────────────────────────────────────────────────────────────

const C = {
  yale: '#124e78',
  cream: '#f0f0c9',
  gold: '#f2bb05',
  orange: '#d74e09',
  garnet: '#6e0e0a',
} as const

// ── Data ────────────────────────────────────────────────────────────────────────

interface GanttLane {
  name: string
  icon: LucideIcon
  accentColor: string
}

interface GanttEvent {
  id: string
  laneIndex: number
  title: string
  description: string
  type: 'range' | 'point'
  startYear: number
  endYear?: number
}

const lanes: GanttLane[] = [
  { name: 'Location', icon: MapPin, accentColor: C.orange },
  { name: 'Work', icon: Briefcase, accentColor: C.yale },
  { name: 'Education', icon: GraduationCap, accentColor: C.garnet },
  { name: 'Relationships', icon: Heart, accentColor: C.orange },
  { name: 'Assets', icon: Landmark, accentColor: C.gold },
  { name: 'Activities', icon: Zap, accentColor: C.yale },
]

const events: GanttEvent[] = [
  { id: '1', laneIndex: 0, title: 'Born in Munich', description: 'Childhood in Germany', type: 'range', startYear: 1990, endYear: 2008 },
  { id: '2', laneIndex: 0, title: 'London', description: 'University years', type: 'range', startYear: 2008, endYear: 2012 },
  { id: '3', laneIndex: 0, title: 'San Francisco', description: 'Career move to the Bay Area', type: 'range', startYear: 2012, endYear: 2024 },
  { id: '4', laneIndex: 0, title: 'Austin', description: 'New chapter in Texas', type: 'range', startYear: 2024, endYear: 2035 },
  { id: '5', laneIndex: 1, title: 'Internship', description: 'First industry experience', type: 'range', startYear: 2011, endYear: 2012 },
  { id: '6', laneIndex: 1, title: 'Software Engineer', description: 'Full-time engineering role', type: 'range', startYear: 2012, endYear: 2018 },
  { id: '7', laneIndex: 1, title: 'Staff Engineer', description: 'Senior technical leadership', type: 'range', startYear: 2018, endYear: 2035 },
  { id: '8', laneIndex: 2, title: 'School', description: 'Primary & secondary education', type: 'range', startYear: 1996, endYear: 2008 },
  { id: '9', laneIndex: 2, title: "Bachelor's", description: 'Computer Science at Imperial', type: 'range', startYear: 2008, endYear: 2012 },
  { id: '10', laneIndex: 3, title: 'Met partner', description: 'A chance encounter', type: 'point', startYear: 2015 },
  { id: '11', laneIndex: 3, title: 'Married', description: 'Tied the knot', type: 'point', startYear: 2020 },
  { id: '12', laneIndex: 4, title: 'First apartment', description: 'Bought first property', type: 'range', startYear: 2017, endYear: 2035 },
  { id: '13', laneIndex: 5, title: 'Running', description: 'Marathon training', type: 'range', startYear: 2014, endYear: 2022 },
  { id: '14', laneIndex: 5, title: 'Photography', description: 'Landscape photography hobby', type: 'range', startYear: 2019, endYear: 2035 },
]

const YEAR_START = 1990
const YEAR_END = 2035
const SIDEBAR_W = 140
const LANE_H = 44
const HEADER_H = 32

// ── Component ───────────────────────────────────────────────────────────────────

export function LandingGanttChart({ visible }: { visible?: boolean }) {
  const containerRef = useRef<HTMLDivElement>(null)
  const [width, setWidth] = useState(800)
  const [hoveredId, setHoveredId] = useState<string | null>(null)
  const [tooltip, setTooltip] = useState<{ x: number; y: number; event: GanttEvent } | null>(null)

  // Observe container width
  useEffect(() => {
    const el = containerRef.current
    if (!el) return
    const ro = new ResizeObserver(entries => {
      for (const entry of entries) setWidth(entry.contentRect.width)
    })
    ro.observe(el)
    return () => ro.disconnect()
  }, [])

  const chartWidth = Math.max(width - SIDEBAR_W, 200)
  const pxPerYear = chartWidth / (YEAR_END - YEAR_START)

  const yearToX = useCallback((y: number) => (y - YEAR_START) * pxPerYear, [pxPerYear])

  // Year labels every 5 years
  const yearLabels: number[] = []
  for (let y = YEAR_START; y <= YEAR_END; y += 5) yearLabels.push(y)

  const todayX = yearToX(2026.2)

  return (
    <div
      ref={containerRef}
      className="w-full rounded-xl overflow-hidden shadow-sm"
      style={{ backgroundColor: 'white', border: `1px solid ${C.yale}20` }}
    >
      <div className="overflow-x-auto">
        <div style={{ minWidth: SIDEBAR_W + chartWidth }} className="relative">
          {/* Header row */}
          <div className="flex" style={{ height: HEADER_H }}>
            <div style={{ width: SIDEBAR_W }} className="shrink-0" />
            <div className="relative flex-1">
              {yearLabels.map(y => (
                <span
                  key={y}
                  className="absolute text-[11px] -translate-x-1/2 top-2"
                  style={{ color: `${C.yale}66` }}
                >
                  <span style={{ position: 'absolute', left: yearToX(y), transform: 'translateX(-50%)' }}>
                    {y}
                  </span>
                </span>
              ))}
              {/* Re-render year labels correctly positioned */}
              {yearLabels.map(y => (
                <span
                  key={`l-${y}`}
                  className="absolute text-[11px] -translate-x-1/2 top-2"
                  style={{ left: yearToX(y), color: `${C.yale}66` }}
                >
                  {y}
                </span>
              ))}
            </div>
          </div>

          {/* Lanes */}
          {lanes.map((lane, li) => (
            <div
              key={lane.name}
              className="flex"
              style={{ height: LANE_H, borderTop: `1px solid ${C.yale}10` }}
            >
              {/* Sidebar */}
              <div
                style={{ width: SIDEBAR_W, color: `${C.yale}aa` }}
                className="shrink-0 flex items-center gap-2 px-3 text-sm"
              >
                <lane.icon className="w-4 h-4 shrink-0" strokeWidth={1.5} style={{ color: lane.accentColor }} />
                <span className="hidden sm:inline truncate">{lane.name}</span>
              </div>

              {/* Chart area */}
              <div className="relative flex-1">
                {/* Grid lines */}
                {yearLabels.map(y => (
                  <div
                    key={y}
                    className="absolute top-0 bottom-0"
                    style={{ left: yearToX(y), borderLeft: `1px dashed ${C.yale}10` }}
                  />
                ))}

                {/* Events for this lane */}
                {events
                  .filter(e => e.laneIndex === li)
                  .map((ev, ei) => {
                    const isHovered = hoveredId === ev.id
                    const accent = lane.accentColor

                    if (ev.type === 'point') {
                      return (
                        <div
                          key={ev.id}
                          className={cn(
                            'absolute top-1/2 -translate-y-1/2 -translate-x-1/2 w-3 h-3 rounded-full border-2 transition-all duration-200 cursor-pointer',
                            isHovered ? 'scale-125' : '',
                          )}
                          style={{
                            left: yearToX(ev.startYear),
                            borderColor: isHovered ? accent : `${C.yale}30`,
                            backgroundColor: isHovered ? accent : 'white',
                            transitionDelay: visible ? `${ei * 80 + li * 60}ms` : '0ms',
                            transform: `translateY(-50%) translateX(-50%) ${visible ? 'scale(1)' : 'scale(0)'}`,
                          }}
                          onMouseEnter={e => {
                            setHoveredId(ev.id)
                            const rect = (e.target as HTMLElement).getBoundingClientRect()
                            setTooltip({ x: rect.left + rect.width / 2, y: rect.top, event: ev })
                          }}
                          onMouseLeave={() => { setHoveredId(null); setTooltip(null) }}
                        />
                      )
                    }

                    const left = yearToX(ev.startYear)
                    const w = yearToX(ev.endYear!) - left

                    return (
                      <div
                        key={ev.id}
                        className={cn(
                          'absolute top-1/2 -translate-y-1/2 h-6 rounded-full border flex items-center px-2 overflow-hidden cursor-pointer',
                          'transition-all duration-200',
                        )}
                        style={{
                          left,
                          width: w,
                          borderColor: isHovered ? accent : `${C.yale}30`,
                          backgroundColor: isHovered ? `${accent}18` : 'white',
                          transformOrigin: 'left center',
                          transform: `translateY(-50%) scaleX(${visible ? 1 : 0})`,
                          transitionDelay: visible ? `${ei * 80 + li * 60}ms` : '0ms',
                          transitionDuration: '500ms',
                          transitionTimingFunction: 'cubic-bezier(0.16, 1, 0.3, 1)',
                        }}
                        onMouseEnter={e => {
                          setHoveredId(ev.id)
                          const rect = (e.target as HTMLElement).getBoundingClientRect()
                          setTooltip({ x: rect.left + rect.width / 2, y: rect.top, event: ev })
                        }}
                        onMouseLeave={() => { setHoveredId(null); setTooltip(null) }}
                      >
                        <span
                          className="text-[11px] font-medium truncate transition-colors duration-200"
                          style={{ color: isHovered ? accent : `${C.yale}55` }}
                        >
                          {ev.title}
                        </span>
                      </div>
                    )
                  })}

                {/* Today line */}
                {li === 0 && (
                  <div
                    className="absolute top-0 bottom-0 z-10"
                    style={{ left: todayX, borderLeft: `1px solid ${C.orange}` }}
                  >
                    <span className="absolute -top-5 -translate-x-1/2 text-[10px] font-medium" style={{ color: C.orange }}>today</span>
                  </div>
                )}
                {li > 0 && (
                  <div
                    className="absolute top-0 bottom-0 z-10"
                    style={{ left: todayX, borderLeft: `1px solid ${C.orange}` }}
                  />
                )}
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Tooltip (portal-style, fixed) */}
      {tooltip && (
        <div
          className="fixed z-50 pointer-events-none"
          style={{ left: tooltip.x, top: tooltip.y - 8, transform: 'translate(-50%, -100%)' }}
        >
          <div
            className="text-xs rounded-lg px-3 py-2 shadow-lg whitespace-nowrap"
            style={{ backgroundColor: C.yale, color: C.cream }}
          >
            <div className="font-semibold">{tooltip.event.title}</div>
            <div style={{ color: `${C.cream}cc` }}>{tooltip.event.description}</div>
            <div className="mt-0.5" style={{ color: `${C.cream}99` }}>
              {tooltip.event.startYear}{tooltip.event.endYear ? ` – ${tooltip.event.endYear}` : ''}
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
