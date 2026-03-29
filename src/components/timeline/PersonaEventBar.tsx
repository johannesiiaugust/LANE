import { useState, useEffect, useRef } from 'react'
import { createPortal } from 'react-dom'
import type { AlignedPersonaEvent } from '@/types/database'
import { useSizeConfig } from '@/contexts/UiSizeContext'
import { registerOverlay, unregisterOverlay } from '@/lib/overlayTooltipState'

interface PersonaEventBarProps {
  event: AlignedPersonaEvent
  yearStart: number
  pixelsPerYear: number
  laneColor: string
  subRowIndex?: number
  /** Pixel offset from top of container for the row this event occupies (separate-mode multi-row) */
  rowTopOffset?: number
  currentYear: number
  scrollLeft?: number
}

const TOOLTIP_MAX_WIDTH = 280
const TOOLTIP_PADDING = 8

export function PersonaEventBar({
  event,
  yearStart,
  pixelsPerYear,
  laneColor,
  subRowIndex,
  rowTopOffset,
  currentYear,
  scrollLeft = 0,
}: PersonaEventBarProps) {
  const { sc } = useSizeConfig()
  const { BASE_LANE_HEIGHT, PERSONA_SUB_ROW_HEIGHT, BAR_HEIGHT, DOT_SIZE, EVENT_FONT, EVENT_LINE_HEIGHT, SIDEBAR_WIDTH } = sc

  const [open, setOpen] = useState(false)
  const [pinned, setPinned] = useState(false)
  const [pos, setPos] = useState({ x: 0, y: 0 })

  // Stable close callback stored in a ref so registerOverlay always gets the same reference
  const closeRef = useRef(() => {
    setPinned(false)
    setOpen(false)
  })

  // Close this tooltip on any click (next click anywhere)
  useEffect(() => {
    if (!pinned) return
    function handleOutside() {
      unregisterOverlay(closeRef.current)
      setPinned(false)
      setOpen(false)
    }
    document.addEventListener('click', handleOutside)
    return () => document.removeEventListener('click', handleOutside)
  }, [pinned])

  const color = event.color || laneColor
  const left = (event.display_start_year - yearStart) * pixelsPerYear

  const isPast = event.type === 'point'
    ? event.display_start_year < currentYear
    : (event.display_end_year ?? event.display_start_year) < currentYear

  const baseOpacity = 0.4
  const pastOpacity = isPast ? 0.2 : baseOpacity
  const pastFilter = isPast ? 'saturate(0.5)' : undefined

  // rowTopOffset: absolute top of this event's row in the container (separate-mode expansion)
  // subRowIndex: row within integrated sub-rows below main lane
  // neither: event sits at top of a BASE_LANE_HEIGHT lane row
  const verticalOffset = rowTopOffset != null
    ? rowTopOffset
    : subRowIndex != null
      ? BASE_LANE_HEIGHT + subRowIndex * PERSONA_SUB_ROW_HEIGHT
      : 0
  const rowHeight = rowTopOffset != null
    ? BASE_LANE_HEIGHT
    : subRowIndex != null ? PERSONA_SUB_ROW_HEIGHT : BASE_LANE_HEIGHT

  function handlePointerEnter(e: React.PointerEvent) {
    if (pinned) return
    setPos({ x: e.clientX, y: e.clientY })
    setOpen(true)
  }

  function handlePointerMove(e: React.PointerEvent) {
    if (pinned) return
    setPos({ x: e.clientX, y: e.clientY })
  }

  function handlePointerLeave() {
    if (pinned) return
    setOpen(false)
  }

  function handleClick(e: React.MouseEvent) {
    e.stopPropagation()
    if (pinned) {
      unregisterOverlay(closeRef.current)
      setPinned(false)
      setOpen(false)
    } else {
      // registerOverlay closes any currently open tooltip before opening this one
      registerOverlay(closeRef.current)
      setPinned(true)
      setPos({ x: e.clientX, y: e.clientY })
      setOpen(true)
    }
  }

  // Clamp tooltip horizontally so it never leaves the viewport
  const tooltipLeft = Math.min(
    Math.max(pos.x - TOOLTIP_MAX_WIDTH / 2, TOOLTIP_PADDING),
    window.innerWidth - TOOLTIP_MAX_WIDTH - TOOLTIP_PADDING
  )

  const tooltip = open ? createPortal(
    <div
      className="fixed z-50 rounded-md bg-primary px-3 py-1.5 shadow-md pointer-events-none"
      style={{
        left: tooltipLeft,
        top: pos.y - TOOLTIP_PADDING,
        transform: 'translateY(-100%)',
        maxWidth: TOOLTIP_MAX_WIDTH,
      }}
    >
      <p className="font-medium text-xs text-primary-foreground">{event.title}</p>
      {event.description && (
        <p className="text-xs text-primary-foreground opacity-85 whitespace-normal">{event.description}</p>
      )}
      <p className="text-xs text-primary-foreground opacity-70">
        {event.type === 'point'
          ? <>Year: {event.start_year}{event.display_start_year !== event.start_year && ` (aligned: ~${Math.round(event.display_start_year)})`}</>
          : <>{event.start_year}–{event.end_year ?? '?'}{event.display_start_year !== event.start_year && <> (aligned: ~{Math.round(event.display_start_year)}–{event.display_end_year != null ? `~${Math.round(event.display_end_year)}` : '?'})</>}</>
        }
      </p>
    </div>,
    document.body
  ) : null

  const pointerHandlers = {
    onPointerEnter: handlePointerEnter,
    onPointerMove: handlePointerMove,
    onPointerLeave: handlePointerLeave,
    onClick: handleClick,
  }

  if (event.type === 'point') {
    const top = verticalOffset + (rowHeight - DOT_SIZE) / 2
    return (
      <>
        <div
          className="absolute rounded-full cursor-pointer transition-all hover:scale-125 hover:shadow-lg"
          style={{
            left: left - DOT_SIZE / 2,
            top,
            width: DOT_SIZE,
            height: DOT_SIZE,
            backgroundColor: color,
            opacity: pastOpacity,
            filter: pastFilter,
            boxShadow: '0 2px 4px rgba(0,0,0,0.25), inset 0 1px 0 rgba(255,255,255,0.3)',
          }}
          {...pointerHandlers}
        />
        {tooltip}
      </>
    )
  }

  const displayEnd = event.display_end_year ?? event.display_start_year + 1
  const width = (displayEnd - event.display_start_year) * pixelsPerYear
  const barHeight = rowHeight < BASE_LANE_HEIGHT ? Math.round(BAR_HEIGHT * 0.75) : BAR_HEIGHT
  const top = verticalOffset + (rowHeight - barHeight) / 2

  // Sticky label: clamp so text stays visible at the left edge of the viewport
  const textLeft = Math.max(4, scrollLeft - left + SIDEBAR_WIDTH + 4)

  return (
    <>
      <div
        className="absolute rounded-lg overflow-hidden cursor-pointer transition-all hover:scale-[1.04] hover:-translate-y-px hover:shadow-lg hover:z-50"
        style={{
          left,
          top,
          width: Math.max(width, 4),
          height: barHeight,
          backgroundColor: color,
          opacity: pastOpacity,
          filter: pastFilter,
          boxShadow: '0 2px 5px rgba(0,0,0,0.2), inset 0 1px 0 rgba(255,255,255,0.2)',
        }}
        {...pointerHandlers}
      >
        {/* 3D sheen */}
        <div className="absolute inset-0 pointer-events-none rounded-lg" style={{ background: 'linear-gradient(to bottom, rgba(255,255,255,0.18) 0%, rgba(255,255,255,0) 55%)' }} />
        {width > EVENT_FONT * 5 && (
          <span
            className="absolute text-white font-bold whitespace-nowrap drop-shadow-[0_1px_3px_rgba(0,0,0,0.7)]"
            style={{ left: textLeft, fontSize: Math.round(EVENT_FONT * 0.9) + 1, lineHeight: `${EVENT_LINE_HEIGHT}px` }}
          >
            {event.title}
          </span>
        )}
      </div>
      {tooltip}
    </>
  )
}
