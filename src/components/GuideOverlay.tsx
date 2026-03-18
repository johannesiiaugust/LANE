import { useEffect, useState, useCallback, useRef } from 'react'
import { X, ChevronRight, ChevronLeft } from 'lucide-react'
import { Button } from '@/components/ui/button'

// ─── Step definitions ────────────────────────────────────────────────────────

interface Step {
  target: string           // data-guide="…" on the DOM element
  title: string
  text: string
  side: 'top' | 'bottom' | 'left' | 'right'
  align: 'start' | 'center' | 'end'
  center?: boolean // always center card horizontally near top of screen
}

const STEPS: Step[] = [
  {
    target: 'compare',
    title: 'Compare your life with anyone',
    text: 'Compare yourself with famous people, friends and others.',
    side: 'bottom',
    align: 'start',
  },
  {
    target: 'zoom',
    title: 'Navigate time',
    text: 'Zoom in and out in time — both past and the future.',
    side: 'bottom',
    align: 'end',
  },
  {
    target: 'import',
    title: 'Import from anywhere',
    text: 'Add your life — and your friends\' — from CVs, social networks, calendars and other sources. Simply copy-paste any marked text with our AI.',
    side: 'bottom',
    align: 'end',
    center: true,
  },
  {
    target: 'compare',
    title: 'Manage timelines',
    text: 'Create and modify timelines for family, friends and others to organize and compare.',
    side: 'bottom',
    align: 'start',
  },
  {
    target: 'add-events',
    title: 'Add life events',
    text: 'Add events across all LANEs of life — work, where you lived, pets, health — down to meetings, parties and movies.',
    side: 'bottom',
    align: 'end',
  },
  {
    target: 'overflow-menu',
    title: 'Plan your future with AI',
    text: 'Describe a future you want — our AI gives you concrete ways to reach it.',
    side: 'bottom',
    align: 'end',
  },
]

const PADDING = 8   // px around the spotlight hole
const TIP_W  = 288  // tooltip card width px

// ─── Main component ──────────────────────────────────────────────────────────

interface GuideOverlayProps {
  open: boolean
  onClose: () => void
}

interface TargetRect {
  top: number
  left: number
  width: number
  height: number
}

export function GuideOverlay({ open, onClose }: GuideOverlayProps) {
  const [step, setStep] = useState(0)
  const [rect, setRect] = useState<TargetRect | null>(null)
  const overlayRef = useRef<HTMLDivElement>(null)

  // Measure target element whenever step or open state changes
  const measure = useCallback(() => {
    const s = STEPS[step]
    const el = document.querySelector(`[data-guide="${s.target}"]`)
    if (!el) { setRect(null); return }
    const r = el.getBoundingClientRect()
    setRect({ top: r.top, left: r.left, width: r.width, height: r.height })
  }, [step])

  useEffect(() => {
    if (!open) return
    setStep(0)
  }, [open])

  useEffect(() => {
    if (!open) return
    measure()
    window.addEventListener('resize', measure)
    return () => window.removeEventListener('resize', measure)
  }, [open, measure])

  // Close on Escape
  useEffect(() => {
    if (!open) return
    const handler = (e: KeyboardEvent) => { if (e.key === 'Escape') onClose() }
    window.addEventListener('keydown', handler)
    return () => window.removeEventListener('keydown', handler)
  }, [open, onClose])

  if (!open) return null

  const current = STEPS[step]
  const total   = STEPS.length

  // ── Backdrop click (close when clicking outside spotlight + tooltip) ──────
  const handleBackdropClick = (e: React.MouseEvent<HTMLDivElement>) => {
    if (e.target === overlayRef.current) onClose()
  }

  // ── Spotlight geometry ────────────────────────────────────────────────────
  const hole: TargetRect | null = rect
    ? {
        top:    rect.top    - PADDING,
        left:   rect.left   - PADDING,
        width:  rect.width  + PADDING * 2,
        height: rect.height + PADDING * 2,
      }
    : null

  // ── Tooltip position ──────────────────────────────────────────────────────
  type TooltipPos = { top?: number; bottom?: number; left?: number; right?: number }
  const getTooltipStyle = (): TooltipPos => {
    if (!hole) return { top: '50%' as unknown as number, left: '50%' as unknown as number }

    const gap = 14 // px between spotlight and tooltip

    const vw = window.innerWidth
    const vh = window.innerHeight

    // Center the card horizontally and place it above the year line
    if (current.center) {
      return { top: 70, left: Math.max(12, (vw - TIP_W) / 2) }
    }

    switch (current.side) {
      case 'bottom': {
        const tipTop = hole.top + hole.height + gap
        let tipLeft: number
        if (current.align === 'start') tipLeft = hole.left
        else if (current.align === 'end') tipLeft = hole.left + hole.width - TIP_W
        else tipLeft = hole.left + hole.width / 2 - TIP_W / 2
        // clamp
        tipLeft = Math.max(12, Math.min(vw - TIP_W - 12, tipLeft))
        return { top: tipTop, left: tipLeft }
      }
      case 'top': {
        const tipBottom = vh - hole.top + gap
        let tipLeft: number
        if (current.align === 'start') tipLeft = hole.left
        else if (current.align === 'end') tipLeft = hole.left + hole.width - TIP_W
        else tipLeft = hole.left + hole.width / 2 - TIP_W / 2
        tipLeft = Math.max(12, Math.min(vw - TIP_W - 12, tipLeft))
        return { bottom: tipBottom, left: tipLeft }
      }
      case 'right': {
        const tipLeft = hole.left + hole.width + gap
        const tipTop = hole.top + hole.height / 2 - 60
        return { top: Math.max(12, tipTop), left: tipLeft }
      }
      case 'left': {
        const tipRight = vw - hole.left + gap
        const tipTop = hole.top + hole.height / 2 - 60
        return { top: Math.max(12, tipTop), right: tipRight }
      }
    }
  }

  // ── Arrow style (small caret pointing from tooltip toward target) ─────────
  type ArrowStyle = React.CSSProperties
  const getArrowStyle = (): ArrowStyle => {
    if (!hole) return {}
    if (current.center) return {}
    const base: ArrowStyle = { position: 'absolute', width: 0, height: 0 }
    switch (current.side) {
      case 'bottom': return {
        ...base,
        top: -8,
        borderLeft: '8px solid transparent',
        borderRight: '8px solid transparent',
        borderBottom: '8px solid hsl(var(--background))',
        left: getArrowHorizontalOffset(),
      }
      case 'top': return {
        ...base,
        bottom: -8,
        borderLeft: '8px solid transparent',
        borderRight: '8px solid transparent',
        borderTop: '8px solid hsl(var(--background))',
        left: getArrowHorizontalOffset(),
      }
      case 'right': return {
        ...base,
        left: -8,
        top: 20,
        borderTop: '8px solid transparent',
        borderBottom: '8px solid transparent',
        borderRight: '8px solid hsl(var(--background))',
      }
      case 'left': return {
        ...base,
        right: -8,
        top: 20,
        borderTop: '8px solid transparent',
        borderBottom: '8px solid transparent',
        borderLeft: '8px solid hsl(var(--background))',
      }
    }
  }

  const getArrowHorizontalOffset = (): number => {
    if (!hole) return 20
    const tipStyle = getTooltipStyle()
    const tipLeft = (tipStyle.left as number) ?? 0
    const targetCenterX = hole.left + hole.width / 2
    const arrowX = targetCenterX - tipLeft - 8 // 8 = half arrow width
    return Math.max(12, Math.min(TIP_W - 28, arrowX))
  }

  const tooltipStyle = getTooltipStyle()
  const arrowStyle   = getArrowStyle()

  return (
    <div
      ref={overlayRef}
      className="fixed inset-0 z-[200]"
      onClick={handleBackdropClick}
    >
      {/* ── Dimmed backdrop with spotlight hole ── */}
      {hole && !current.center ? (
        <div
          className="pointer-events-none absolute rounded-md"
          style={{
            top:    hole.top,
            left:   hole.left,
            width:  hole.width,
            height: hole.height,
            boxShadow: '0 0 0 9999px rgba(0,0,0,0.55)',
            borderRadius: 6,
          }}
        />
      ) : (
        // No target found — just a plain dark overlay
        <div className="absolute inset-0 bg-black/55 pointer-events-none" />
      )}

      {/* ── Tooltip card ── */}
      <div
        className="absolute bg-background/95 backdrop-blur-sm border border-border rounded-xl shadow-2xl pointer-events-auto"
        style={{ width: TIP_W, ...tooltipStyle }}
        onClick={e => e.stopPropagation()}
      >
        {/* Arrow caret */}
        <div style={arrowStyle} />

        {/* Header */}
        <div className="flex items-start justify-between px-4 pt-4 pb-2">
          <div className="flex items-center gap-2">
            <span className="text-[10px] font-medium text-muted-foreground uppercase tracking-wider">
              {step + 1} / {total}
            </span>
          </div>
          <button
            onClick={onClose}
            className="text-muted-foreground hover:text-foreground transition-colors -mt-0.5 -mr-1"
          >
            <X className="h-4 w-4" />
          </button>
        </div>

        {/* Body */}
        <div className="px-4 pb-3">
          <p className="font-semibold text-sm mb-1">{current.title}</p>
          <p className="text-sm text-muted-foreground leading-relaxed">{current.text}</p>
        </div>

        {/* Progress dots */}
        <div className="flex justify-center gap-1.5 pb-3">
          {STEPS.map((_, i) => (
            <button
              key={i}
              onClick={() => setStep(i)}
              className={`w-1.5 h-1.5 rounded-full transition-colors ${
                i === step ? 'bg-foreground' : 'bg-muted-foreground/30 hover:bg-muted-foreground/60'
              }`}
            />
          ))}
        </div>

        {/* Navigation */}
        <div className="flex justify-between items-center px-4 pb-4 pt-1 border-t border-border/50">
          <Button
            variant="ghost"
            size="sm"
            onClick={() => setStep(s => Math.max(0, s - 1))}
            disabled={step === 0}
            className="gap-1 text-xs"
          >
            <ChevronLeft className="h-3.5 w-3.5" />
            Back
          </Button>

          {step < total - 1 ? (
            <Button
              size="sm"
              onClick={() => setStep(s => s + 1)}
              className="gap-1 text-xs"
            >
              Next
              <ChevronRight className="h-3.5 w-3.5" />
            </Button>
          ) : (
            <Button size="sm" onClick={onClose} className="text-xs">
              Done
            </Button>
          )}
        </div>
      </div>
    </div>
  )
}
