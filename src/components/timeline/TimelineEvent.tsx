import { useState, useMemo, useRef } from 'react'
import type { TimelineEvent as TEvent } from '@/types/timeline'
import { computeValueAtYear, generateSparklineSeries, formatValue } from '@/lib/valueCompute'
import { useSizeConfig } from '@/contexts/UiSizeContext'
import { EventContextMenu } from './EventContextMenu'

export interface TimelineEventProps {
  event: TEvent
  yearStart: number
  pixelsPerYear: number
  laneColor: string
  onClick: (event: TEvent, element: HTMLElement, clientX: number, clientY: number) => void
  currentYear: number
  topOffset?: number
  stackDepth?: number
  scrollLeft?: number
  // drag-drop
  isDragging?: boolean
  onMoveStart?: (event: TEvent, clientX: number, clientY: number, origin: 'longpress' | 'contextmenu') => void
  onExtendStart?: (event: TEvent, direction: 'forward' | 'backward', clientX: number) => void
}

interface TooltipState { clientX: number; clientY: number; value: number }
interface HoverPos { clientX: number; clientY: number }

const STACK_PX = 3  // px shift per depth level

export function TimelineEventBar({
  event, yearStart, pixelsPerYear, laneColor, onClick, currentYear, topOffset = 0, stackDepth, scrollLeft = 0,
  isDragging, onMoveStart, onExtendStart,
}: TimelineEventProps) {
  const { sc } = useSizeConfig()
  const { BASE_LANE_HEIGHT, BAR_HEIGHT, DOT_SIZE, EVENT_FONT, EVENT_LINE_HEIGHT } = sc
  const color = event.color || laneColor
  const left = (event.startYear - yearStart) * pixelsPerYear

  const stackOff = stackDepth !== undefined ? Math.min(stackDepth, 4) * STACK_PX : 0
  const stackZ   = stackDepth !== undefined ? 20 - Math.min(stackDepth, 10) : undefined

  const isPast = event.type === 'point'
    ? event.startYear < currentYear
    : (event.endYear ?? event.startYear) < currentYear

  const pastStyle = isPast ? { opacity: 0.35, filter: 'saturate(0.5)' } : undefined
  const draggingStyle: React.CSSProperties | undefined = isDragging ? { opacity: 0.25, pointerEvents: 'none' } : undefined

  const hasValue = !!event.valueProjection
  const hasImage = !!event.metadata?.image_url
  const [tooltip, setTooltip] = useState<TooltipState | null>(null)
  const [imageHover, setImageHover] = useState<HoverPos | null>(null)
  const [ctxMenu, setCtxMenu] = useState<{ x: number; y: number } | null>(null)
  const [isGrabbing, setIsGrabbing] = useState(false)

  const holdTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null)
  const modeRef = useRef<'idle' | 'pending' | 'grabbed'>('idle')
  const downPosRef = useRef({ x: 0, y: 0 })

  // Build sparkline series — use fade extents when present
  const sparklineSeries = useMemo(() => {
    if (!hasValue || event.type !== 'range' || !event.valueProjection) return []
    const seriesStart = event.fadeInYear ?? event.startYear
    const seriesEnd = event.fadeOutYear ?? event.endYear ?? currentYear
    return generateSparklineSeries(seriesStart, seriesEnd, event.valueProjection, currentYear)
  }, [hasValue, event.startYear, event.endYear, event.fadeInYear, event.fadeOutYear, event.valueProjection, event.type, currentYear])

  function clearHold() {
    if (holdTimerRef.current) { clearTimeout(holdTimerRef.current); holdTimerRef.current = null }
  }

  function handleMouseDown(e: React.MouseEvent<HTMLDivElement>) {
    if (e.button !== 0 || !onMoveStart) return
    e.stopPropagation()
    e.preventDefault()
    modeRef.current = 'pending'
    downPosRef.current = { x: e.clientX, y: e.clientY }
    setIsGrabbing(true)
    holdTimerRef.current = setTimeout(() => {
      modeRef.current = 'grabbed'
      setIsGrabbing(false)
      onMoveStart(event, downPosRef.current.x, downPosRef.current.y, 'longpress')
    }, 1000)
  }

  function handleMouseUp(e: React.MouseEvent<HTMLDivElement>) {
    if (modeRef.current === 'pending') {
      clearHold()
      modeRef.current = 'idle'
      setIsGrabbing(false)
      onClick(event, e.currentTarget, e.clientX, e.clientY)
    }
  }

  function handleMouseLeave() {
    if (modeRef.current === 'pending') {
      clearHold()
      modeRef.current = 'idle'
      setIsGrabbing(false)
    }
  }

  function handleContextMenu(e: React.MouseEvent) {
    e.preventDefault()
    e.stopPropagation()
    setCtxMenu({ x: e.clientX, y: e.clientY })
  }

  function handleMouseMove(e: React.MouseEvent<HTMLDivElement>) {
    if (!hasValue || !event.valueProjection) return
    const rect = e.currentTarget.getBoundingClientRect()
    const relX = e.clientX - rect.left
    // Bar may start from fadeInYear; use the bar's actual left year as origin
    const barOriginYear = event.fadeInYear != null && event.fadeInYear < event.startYear ? event.fadeInYear : event.startYear
    const hoverYear = barOriginYear + relX / pixelsPerYear
    const val = computeValueAtYear(hoverYear, event.startYear, event.valueProjection)
    setTooltip({ clientX: e.clientX, clientY: e.clientY, value: val })
  }

  const grabRing = isGrabbing ? 'ring-2 ring-primary scale-105' : ''

  // shared interaction props for every event element
  const interactionProps = onMoveStart ? {
    onMouseDown: handleMouseDown,
    onMouseUp: handleMouseUp,
    onMouseLeave: handleMouseLeave,
    onContextMenu: handleContextMenu,
  } : {
    onClick: (e: React.MouseEvent<HTMLDivElement>) => onClick(event, e.currentTarget, e.clientX, e.clientY),
    onContextMenu: handleContextMenu,
  }

  const contextMenu = ctxMenu ? (
    <EventContextMenu
      x={ctxMenu.x} y={ctxMenu.y}
      onClose={() => setCtxMenu(null)}
      onMove={() => {
        const pos = ctxMenu; setCtxMenu(null)
        onMoveStart?.(event, pos.x, pos.y, 'contextmenu')
      }}
      onExtendForward={() => {
        const pos = ctxMenu; setCtxMenu(null)
        onExtendStart?.(event, 'forward', pos.x)
      }}
      onExtendBackward={() => {
        const pos = ctxMenu; setCtxMenu(null)
        onExtendStart?.(event, 'backward', pos.x)
      }}
    />
  ) : null

  if (event.type === 'point') {
    const top = (BASE_LANE_HEIGHT - DOT_SIZE) / 2 + topOffset
    const hasPointValue = event.pointValue != null

    if (event.emoji) {
      return (
        <>
          <div
            className={`absolute flex items-center justify-center cursor-pointer hover:scale-110 transition-transform select-none ${grabRing}`}
            style={{ left: left - DOT_SIZE / 2, top, width: DOT_SIZE, height: DOT_SIZE, fontSize: DOT_SIZE - 2, lineHeight: 1, ...pastStyle, ...draggingStyle }}
            {...interactionProps}
            onMouseEnter={hasPointValue ? e => setTooltip({ clientX: e.clientX, clientY: e.clientY, value: event.pointValue! }) : undefined}
            onMouseMove={e => {
              if (hasPointValue) setTooltip({ clientX: e.clientX, clientY: e.clientY, value: event.pointValue! })
              if (hasImage) setImageHover({ clientX: e.clientX, clientY: e.clientY })
            }}
            onMouseLeave={() => { handleMouseLeave(); setTooltip(null); setImageHover(null) }}
          >
            {event.emoji}
          </div>
          {tooltip && <ValueTooltip title={event.title} tooltip={tooltip} />}
          {imageHover && event.metadata?.image_url && <ImageHoverThumbnail imageUrl={event.metadata.image_url} pos={imageHover} />}
          {contextMenu}
        </>
      )
    }

    return (
      <>
        <div
          className={`absolute rounded-full cursor-pointer transition-all select-none hover:scale-125 hover:shadow-lg ${grabRing}`}
          style={{ left: left - DOT_SIZE / 2, top, width: DOT_SIZE, height: DOT_SIZE, backgroundColor: color, opacity: 0.88, boxShadow: '0 2px 4px rgba(0,0,0,0.3), inset 0 1px 0 rgba(255,255,255,0.35)', ...pastStyle, ...draggingStyle }}
          {...interactionProps}
          onMouseEnter={e => {
            if (hasPointValue) setTooltip({ clientX: e.clientX, clientY: e.clientY, value: event.pointValue! })
            if (hasImage) setImageHover({ clientX: e.clientX, clientY: e.clientY })
          }}
          onMouseMove={e => {
            if (hasPointValue) setTooltip({ clientX: e.clientX, clientY: e.clientY, value: event.pointValue! })
            if (hasImage) setImageHover({ clientX: e.clientX, clientY: e.clientY })
          }}
          onMouseLeave={() => { handleMouseLeave(); setTooltip(null); setImageHover(null) }}
        />
        {tooltip && <ValueTooltip title={event.title} tooltip={tooltip} />}
        {imageHover && event.metadata?.image_url && <ImageHoverThumbnail imageUrl={event.metadata.image_url} pos={imageHover} />}
        {contextMenu}
      </>
    )
  }

  // Fade extents
  const hasFadeIn  = event.fadeInYear  != null && event.fadeInYear  < event.startYear
  const hasFadeOut = event.fadeOutYear != null && event.fadeOutYear > (event.endYear ?? event.startYear)

  // Geometry
  const mainBarLeft  = (event.startYear - yearStart) * pixelsPerYear
  const mainBarWidth = ((event.endYear ?? event.startYear + 1) - event.startYear) * pixelsPerYear
  const fadeInTailWidth  = hasFadeIn  ? (event.startYear - event.fadeInYear!)  * pixelsPerYear : 0
  const fadeOutTailWidth = hasFadeOut ? (event.fadeOutYear! - (event.endYear ?? event.startYear)) * pixelsPerYear : 0
  const barStartYear = hasFadeIn  ? event.fadeInYear!  : event.startYear
  const barEndYear   = hasFadeOut ? event.fadeOutYear! : (event.endYear ?? event.startYear + 1)
  const barLeft  = (barStartYear - yearStart) * pixelsPerYear
  const barWidth = (barEndYear - barStartYear) * pixelsPerYear

  // Sparkline gradient percentages (relative to full bar span)
  const totalFadeYears = barEndYear - barStartYear
  const fadeInPct  = hasFadeIn  ? ((event.startYear - barStartYear) / totalFadeYears) * 100 : 0
  const fadeOutPct = hasFadeOut ? (((event.endYear ?? event.startYear) - barStartYear) / totalFadeYears) * 100 : 100

  const top = (BASE_LANE_HEIGHT - BAR_HEIGHT) / 2 + topOffset + stackOff
  const h   = BAR_HEIGHT

  // Rounded corners only on the non-tail side
  const roundedClass = hasFadeIn && hasFadeOut ? '' : hasFadeIn ? 'rounded-r-lg' : hasFadeOut ? 'rounded-l-lg' : 'rounded-lg'

  // Sticky label stays inside the solid core
  const textLeft = Math.max(4, scrollLeft - mainBarLeft + sc.SIDEBAR_WIDTH + 4)

  // Sparkline — coordinates relative to barStartYear (full span incl. tails)
  let sparklinePath: string | null = null
  let projectionPath: string | null = null
  let sparklineFill: string | null = null
  if (sparklineSeries.length >= 2) {
    const values = sparklineSeries.map(p => p.value)
    const minV = Math.min(...values)
    const maxV = Math.max(...values)
    const range = maxV - minV || 1
    const pad = 2
    const chartH = h - pad * 2
    const bottomY = (h - pad).toFixed(1)
    const toXY = (p: { year: number; value: number }) => {
      const x = (p.year - barStartYear) * pixelsPerYear
      const y = pad + chartH - chartH * (p.value - minV) / range
      return `${x.toFixed(1)},${y.toFixed(1)}`
    }
    const splitIdx = sparklineSeries.findIndex(p => p.projected)
    const histPts = splitIdx >= 0 ? sparklineSeries.slice(0, splitIdx + 1) : sparklineSeries
    const projPts = splitIdx >= 0 ? sparklineSeries.slice(splitIdx) : []
    if (histPts.length >= 2) sparklinePath = histPts.map(toXY).join(' ')
    if (projPts.length >= 2) projectionPath = projPts.map(toXY).join(' ')
    const allPts = sparklineSeries.map(toXY)
    const firstX = ((sparklineSeries[0].year - barStartYear) * pixelsPerYear).toFixed(1)
    const lastX  = ((sparklineSeries[sparklineSeries.length - 1].year - barStartYear) * pixelsPerYear).toFixed(1)
    sparklineFill = `${firstX},${bottomY} ${allPts.join(' ')} ${lastX},${bottomY}`
  }

  const label = event.emoji ? `${event.emoji} ${event.title}` : event.title

  // SVG bezier paths for fade tails.
  // Full-height base on the bar side, tapering to a center point at the tip.
  // The linear-gradient fill handles color→transparent; the tapered shape naturally
  // keeps the center most opaque and lets top/bottom edges fade away first.
  const OVERLAP = 2   // px: solid bar extends this many px into each tail to kill sub-pixel gaps
  const fiW = Math.max(fadeInTailWidth, 1)
  const foW = Math.max(fadeOutTailWidth, 1)
  // Control points pulled to 65% width so the shape stays wide longer before tapering
  const fadeInPath  = `M${fiW},0 C${fiW*0.65},0 0,${h*0.25} 0,${h/2} C0,${h*0.75} ${fiW*0.65},${h} ${fiW},${h} Z`

  // Positions relative to the wrapper (wrapper starts at barLeft)
  const fadeInRelLeft  = 0
  const mainRelLeft    = hasFadeIn ? fadeInTailWidth : 0
  // Solid bar overlaps 1px into each tail to eliminate sub-pixel seam on hover
  const solidLeft  = mainRelLeft  - (hasFadeIn  ? OVERLAP : 0)
  const solidWidth = mainBarWidth + (hasFadeIn  ? OVERLAP : 0) + (hasFadeOut ? OVERLAP : 0)
  const fadeOutRelLeft = mainRelLeft + mainBarWidth - OVERLAP  // tail starts OVERLAP px inside the bar

  return (
    <>
      {/*
        Outer wrapper spans the full bar + tails.
        All hover / grab transforms are applied here so tails move with the bar.
      */}
      <div
        className={`absolute cursor-pointer transition-all select-none hover:scale-[1.04] hover:-translate-y-px hover:shadow-lg hover:z-50 ${grabRing}`}
        style={{ left: barLeft, top, width: Math.max(barWidth, 4), height: h, opacity: 0.88, zIndex: stackZ, ...pastStyle, ...draggingStyle }}
        title={event.title}
        {...interactionProps}
        onMouseMove={e => {
          if (hasValue) handleMouseMove(e)
          if (hasImage) setImageHover({ clientX: e.clientX, clientY: e.clientY })
        }}
        onMouseLeave={() => { handleMouseLeave(); setTooltip(null); setImageHover(null) }}
      >

        {/* ── Fade-in tail (SVG bezier, points left) ── */}
        {hasFadeIn && (
          <svg
            className="absolute pointer-events-none"
            style={{ left: fadeInRelLeft, top: 0, width: fiW, height: h, overflow: 'visible' }}
          >
            <defs>
              {/* Horizontal colour fade: full at base (right), transparent at tip (left) */}
              <linearGradient id={`fi-${event.id}`} x1="1" x2="0" y1="0" y2="0">
                <stop offset="0%"   stopColor={color} stopOpacity={1} />
                <stop offset="100%" stopColor={color} stopOpacity={0} />
              </linearGradient>
              {/* Vertical sheen matching the solid bar's top highlight */}
              <linearGradient id={`fi-sh-${event.id}`} x1="0" x2="0" y1="0" y2="1">
                <stop offset="0%"   stopColor="white" stopOpacity={0.22} />
                <stop offset="55%"  stopColor="white" stopOpacity={0} />
              </linearGradient>
              {/* Slight edge blur filter */}
              <filter id={`fi-bl-${event.id}`} x="-5%" y="-10%" width="110%" height="120%">
                <feGaussianBlur stdDeviation="1.2" />
              </filter>
            </defs>
            {/* Colour fill (blurred for soft edges) */}
            <path d={fadeInPath} fill={`url(#fi-${event.id})`} filter={`url(#fi-bl-${event.id})`} />
            {/* Sheen overlay (no blur — stays crisp to match the bar) */}
            <path d={fadeInPath} fill={`url(#fi-sh-${event.id})`} />
          </svg>
        )}

        {/* ── Solid main bar (drawn after tails so it renders on top, hiding the OVERLAP seam) ── */}
        <div
          className={`absolute overflow-hidden ${roundedClass}`}
          style={{ left: solidLeft, top: 0, width: Math.max(solidWidth, 4), height: h, backgroundColor: color, boxShadow: '0 2px 5px rgba(0,0,0,0.25), inset 0 1px 0 rgba(255,255,255,0.25)' }}
        >
          {/* 3D sheen */}
          <div className="absolute inset-0 pointer-events-none" style={{ background: 'linear-gradient(to bottom, rgba(255,255,255,0.22) 0%, rgba(255,255,255,0) 55%)' }} />
          {/* Sparkline — inline when no fades */}
          {!(hasFadeIn || hasFadeOut) && sparklineSeries.length >= 2 && (
            <svg className="absolute inset-0 pointer-events-none" style={{ width: '100%', height: '100%', overflow: 'hidden' }} preserveAspectRatio="none">
              {sparklineFill && <polygon points={sparklineFill} fill="rgba(255,255,255,0.13)" />}
              {sparklinePath && <polyline points={sparklinePath} fill="none" stroke="rgba(255,255,255,0.95)" strokeWidth={2} strokeLinejoin="round" />}
              {projectionPath && <polyline points={projectionPath} fill="none" stroke="rgba(255,255,255,0.6)" strokeWidth={1.5} strokeDasharray="3 2" strokeLinejoin="round" />}
            </svg>
          )}
          {/* Label — offset by OVERLAP so it stays in the visible solid region */}
          {mainBarWidth > EVENT_FONT * 2 && (
            <span className="absolute text-white font-medium whitespace-nowrap drop-shadow-[0_0_2px_rgba(0,0,0,0.6)]" style={{ left: textLeft + (hasFadeIn ? OVERLAP : 0), fontSize: EVENT_FONT, lineHeight: `${EVENT_LINE_HEIGHT}px` }}>
              {label}
            </span>
          )}
        </div>

        {/* ── Fade-out tail (SVG bezier, points right) ── */}
        {hasFadeOut && (
          <svg
            className="absolute pointer-events-none"
            style={{ left: fadeOutRelLeft, top: 0, width: foW + OVERLAP, height: h, overflow: 'visible' }}
          >
            <defs>
              {/* Horizontal colour fade: full at base (left, offset by OVERLAP), transparent at tip (right) */}
              <linearGradient id={`fo-${event.id}`} x1="0" x2="1" y1="0" y2="0">
                <stop offset={`${(OVERLAP / (foW + OVERLAP) * 100).toFixed(1)}%`} stopColor={color} stopOpacity={1} />
                <stop offset="100%" stopColor={color} stopOpacity={0} />
              </linearGradient>
              {/* Vertical sheen */}
              <linearGradient id={`fo-sh-${event.id}`} x1="0" x2="0" y1="0" y2="1">
                <stop offset="0%"   stopColor="white" stopOpacity={0.22} />
                <stop offset="55%"  stopColor="white" stopOpacity={0} />
              </linearGradient>
              {/* Edge blur */}
              <filter id={`fo-bl-${event.id}`} x="-5%" y="-10%" width="110%" height="120%">
                <feGaussianBlur stdDeviation="1.2" />
              </filter>
            </defs>
            {/* Colour fill shifted right by OVERLAP so the full-colour base aligns with bar edge */}
            <path d={`M${OVERLAP},0 C${OVERLAP + foW*0.35},0 ${OVERLAP+foW},${h*0.25} ${OVERLAP+foW},${h/2} C${OVERLAP+foW},${h*0.75} ${OVERLAP+foW*0.35},${h} ${OVERLAP},${h} Z`}
              fill={`url(#fo-${event.id})`} filter={`url(#fo-bl-${event.id})`} />
            <path d={`M${OVERLAP},0 C${OVERLAP + foW*0.35},0 ${OVERLAP+foW},${h*0.25} ${OVERLAP+foW},${h/2} C${OVERLAP+foW},${h*0.75} ${OVERLAP+foW*0.35},${h} ${OVERLAP},${h} Z`}
              fill={`url(#fo-sh-${event.id})`} />
          </svg>
        )}

        {/* ── Full-span sparkline when fades are active ── */}
        {(hasFadeIn || hasFadeOut) && sparklineSeries.length >= 2 && (
          <svg
            className="absolute pointer-events-none"
            style={{ left: 0, top: 0, width: barWidth, height: h, overflow: 'visible', zIndex: 1 }}
            preserveAspectRatio="none"
          >
            <defs>
              <linearGradient id={`sf-${event.id}`} x1="0" x2="1" y1="0" y2="0">
                <stop offset="0%"   stopColor="rgba(255,255,255,0.95)" stopOpacity={hasFadeIn  ? 0 : 1} />
                {hasFadeIn  && <stop offset={`${fadeInPct.toFixed(1)}%`}  stopColor="rgba(255,255,255,0.95)" stopOpacity={1} />}
                {hasFadeOut && <stop offset={`${fadeOutPct.toFixed(1)}%`} stopColor="rgba(255,255,255,0.95)" stopOpacity={1} />}
                <stop offset="100%" stopColor="rgba(255,255,255,0.95)" stopOpacity={hasFadeOut ? 0 : 1} />
              </linearGradient>
              <linearGradient id={`sfp-${event.id}`} x1="0" x2="1" y1="0" y2="0">
                <stop offset="0%"   stopColor="rgba(255,255,255,0.6)" stopOpacity={hasFadeIn  ? 0 : 1} />
                {hasFadeIn  && <stop offset={`${fadeInPct.toFixed(1)}%`}  stopColor="rgba(255,255,255,0.6)" stopOpacity={1} />}
                {hasFadeOut && <stop offset={`${fadeOutPct.toFixed(1)}%`} stopColor="rgba(255,255,255,0.6)" stopOpacity={1} />}
                <stop offset="100%" stopColor="rgba(255,255,255,0.6)" stopOpacity={hasFadeOut ? 0 : 1} />
              </linearGradient>
            </defs>
            {sparklineFill    && <polygon  points={sparklineFill}    fill="rgba(255,255,255,0.08)" />}
            {sparklinePath    && <polyline points={sparklinePath}    fill="none" stroke={`url(#sf-${event.id})`}  strokeWidth={2}   strokeLinejoin="round" />}
            {projectionPath   && <polyline points={projectionPath}   fill="none" stroke={`url(#sfp-${event.id})`} strokeWidth={1.5} strokeDasharray="3 2" strokeLinejoin="round" />}
          </svg>
        )}

      </div>
      {tooltip && <ValueTooltip title={event.title} tooltip={tooltip} />}
      {imageHover && event.metadata?.image_url && <ImageHoverThumbnail imageUrl={event.metadata.image_url} pos={imageHover} />}
      {contextMenu}
    </>
  )
}

function ValueTooltip({ title, tooltip }: { title: string; tooltip: TooltipState }) {
  return (
    <div className="fixed z-50 pointer-events-none rounded bg-black/80 text-white text-xs px-2 py-1 whitespace-nowrap" style={{ left: tooltip.clientX + 14, top: tooltip.clientY - 36 }}>
      <span className="opacity-70">{title}: </span>
      <span className="font-semibold">{formatValue(tooltip.value)}</span>
    </div>
  )
}

const THUMB_SIZE = 96

function ImageHoverThumbnail({ imageUrl, pos }: { imageUrl: string; pos: HoverPos }) {
  return (
    <div
      className="fixed z-50 pointer-events-none rounded-md overflow-hidden shadow-xl border border-white/20"
      style={{
        width: THUMB_SIZE,
        height: THUMB_SIZE,
        left: pos.clientX - THUMB_SIZE - 10,
        top: pos.clientY + 10,
      }}
    >
      <img src={imageUrl} alt="" className="w-full h-full object-cover" />
    </div>
  )
}
