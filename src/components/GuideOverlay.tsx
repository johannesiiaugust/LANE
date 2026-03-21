import { useEffect, useState, useCallback, useRef } from 'react'
import { X, ChevronRight, ChevronLeft, Plus, Trash2 } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { DEMO_LANES } from '@/data/demoData'
import type { TimelineEvent } from '@/types/timeline'

// ─── Step definitions ────────────────────────────────────────────────────────

interface Step {
  target: string
  title: string
  text: string
  side: 'top' | 'bottom' | 'left' | 'right'
  align: 'start' | 'center' | 'end'
  isOnboarding?: true   // last step — renders the full-screen form instead
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
    text: 'Zoom in and out in time — slide to your future and past.',
    side: 'bottom',
    align: 'end',
  },
  {
    target: 'compare',
    title: 'Manage timelines',
    text: 'Create and modify timelines for family, friends and others. Import from CVs, social networks, calendars and other sources — simply copy-paste any text with our AI, or by voice.',
    side: 'bottom',
    align: 'start',
  },
  {
    target: 'add-events',
    title: 'Add life events & plan with AI',
    text: 'Add events across all LANEs of life — work, where you lived, health, and more. Then describe a future you want and our AI gives you concrete ways to reach it.',
    side: 'bottom',
    align: 'end',
  },
  {
    target: '__onboarding__',
    title: 'Start with your own story',
    text: '',
    side: 'bottom',
    align: 'center',
    isOnboarding: true,
  },
]

const PADDING = 8
const TIP_W  = 288

// ─── Onboarding form types ───────────────────────────────────────────────────

interface UserEventRow {
  id: string
  laneId: string
  title: string
  fromYear: string
  toYear: string
}

const LANE_OPTIONS = DEMO_LANES.map(l => ({ id: l.id, label: `${l.emoji ?? ''} ${l.name}`.trim() }))

function makeRow(laneId: string): UserEventRow {
  return { id: crypto.randomUUID(), laneId, title: '', fromYear: '', toYear: '' }
}

// ─── Main component ──────────────────────────────────────────────────────────

interface GuideOverlayProps {
  open: boolean
  onClose: () => void
}

interface TargetRect { top: number; left: number; width: number; height: number }

export function GuideOverlay({ open, onClose }: GuideOverlayProps) {
  const [step, setStep] = useState(0)
  const [rect, setRect] = useState<TargetRect | null>(null)
  const overlayRef = useRef<HTMLDivElement>(null)

  // Onboarding form state
  const [birthYear, setBirthYear] = useState('')
  const [rows, setRows] = useState<UserEventRow[]>([
    makeRow('place'),
    makeRow('work'),
  ])

  const measure = useCallback(() => {
    const s = STEPS[step]
    if (s.isOnboarding) { setRect(null); return }
    const el = document.querySelector(`[data-guide="${s.target}"]`)
    if (!el) { setRect(null); return }
    const r = el.getBoundingClientRect()
    setRect({ top: r.top, left: r.left, width: r.width, height: r.height })
  }, [step])

  useEffect(() => { if (!open) return; setStep(0) }, [open])

  useEffect(() => {
    if (!open) return
    measure()
    window.addEventListener('resize', measure)
    return () => window.removeEventListener('resize', measure)
  }, [open, measure])

  useEffect(() => {
    if (!open) return
    const handler = (e: KeyboardEvent) => { if (e.key === 'Escape') onClose() }
    window.addEventListener('keydown', handler)
    return () => window.removeEventListener('keydown', handler)
  }, [open, onClose])

  if (!open) return null

  const current = STEPS[step]
  const total   = STEPS.length

  const handleBackdropClick = (e: React.MouseEvent<HTMLDivElement>) => {
    if (e.target === overlayRef.current) onClose()
  }

  // ── Spotlight geometry ────────────────────────────────────────────────────
  const hole: TargetRect | null = rect ? {
    top:    rect.top    - PADDING,
    left:   rect.left   - PADDING,
    width:  rect.width  + PADDING * 2,
    height: rect.height + PADDING * 2,
  } : null

  // ── Tooltip position ──────────────────────────────────────────────────────
  type TooltipPos = { top?: number; bottom?: number; left?: number; right?: number }
  const getTooltipStyle = (): TooltipPos => {
    if (!hole) return { top: '50%' as unknown as number, left: '50%' as unknown as number }
    const gap = 14
    const vw = window.innerWidth
    const vh = window.innerHeight
    switch (current.side) {
      case 'bottom': {
        const tipTop = hole.top + hole.height + gap
        let tipLeft: number
        if (current.align === 'start') tipLeft = hole.left
        else if (current.align === 'end') tipLeft = hole.left + hole.width - TIP_W
        else tipLeft = hole.left + hole.width / 2 - TIP_W / 2
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
      case 'right': return { top: Math.max(12, hole.top + hole.height / 2 - 60), left: hole.left + hole.width + gap }
      case 'left':  return { top: Math.max(12, hole.top + hole.height / 2 - 60), right: vw - hole.left + gap }
    }
  }

  // ── Arrow style ───────────────────────────────────────────────────────────
  type ArrowStyle = React.CSSProperties
  const getArrowHorizontalOffset = (): number => {
    if (!hole) return 20
    const tipLeft = (getTooltipStyle().left as number) ?? 0
    const targetCenterX = hole.left + hole.width / 2
    return Math.max(12, Math.min(TIP_W - 28, targetCenterX - tipLeft - 8))
  }
  const getArrowStyle = (): ArrowStyle => {
    if (!hole) return {}
    const base: ArrowStyle = { position: 'absolute', width: 0, height: 0 }
    switch (current.side) {
      case 'bottom': return { ...base, top: -8, borderLeft: '8px solid transparent', borderRight: '8px solid transparent', borderBottom: '8px solid hsl(var(--background))', left: getArrowHorizontalOffset() }
      case 'top':    return { ...base, bottom: -8, borderLeft: '8px solid transparent', borderRight: '8px solid transparent', borderTop: '8px solid hsl(var(--background))', left: getArrowHorizontalOffset() }
      case 'right':  return { ...base, left: -8,  top: 20, borderTop: '8px solid transparent', borderBottom: '8px solid transparent', borderRight: '8px solid hsl(var(--background))' }
      case 'left':   return { ...base, right: -8, top: 20, borderTop: '8px solid transparent', borderBottom: '8px solid transparent', borderLeft: '8px solid hsl(var(--background))' }
    }
  }

  // ── Onboarding form helpers ───────────────────────────────────────────────
  function updateRow(id: string, patch: Partial<UserEventRow>) {
    setRows(prev => prev.map(r => r.id === id ? { ...r, ...patch } : r))
  }
  function removeRow(id: string) {
    setRows(prev => prev.filter(r => r.id !== id))
  }

  function handleStartOwn() {
    const events: TimelineEvent[] = rows
      .filter(r => r.title.trim() && r.fromYear.trim())
      .map(r => ({
        id: crypto.randomUUID(),
        laneId: r.laneId,
        title: r.title.trim(),
        description: '',
        type: 'range' as const,
        startYear: parseFloat(r.fromYear),
        endYear: r.toYear.trim() ? parseFloat(r.toYear) : undefined,
      }))

    const by = parseInt(birthYear) || 1990
    const meta = { name: 'My Life', color: '#6366f1', start_year: by - 3, end_year: null, emoji: '👤' }
    try {
      localStorage.setItem('timeline_demo_v3', JSON.stringify({ lanes: DEMO_LANES, events, meta }))
    } catch { /* ignore */ }
    onClose()
    window.location.reload()
  }

  // ── Render: special full-screen onboarding step ───────────────────────────
  if (current.isOnboarding) {
    return (
      <div ref={overlayRef} className="fixed inset-0 z-[200] bg-black/60 backdrop-blur-sm flex items-center justify-center p-4" onClick={handleBackdropClick}>
        <div className="bg-background rounded-2xl shadow-2xl w-full max-w-2xl max-h-[90vh] overflow-y-auto" onClick={e => e.stopPropagation()}>

          {/* Header */}
          <div className="flex items-start justify-between px-6 pt-6 pb-4 border-b">
            <div>
              <div className="text-[10px] font-medium text-muted-foreground uppercase tracking-wider mb-1">{step + 1} / {total}</div>
              <h2 className="text-xl font-semibold">Start with your own story</h2>
              <p className="text-sm text-muted-foreground mt-1">Add a few events and we'll build your personal timeline.</p>
            </div>
            <button onClick={onClose} className="text-muted-foreground hover:text-foreground ml-4 mt-0.5"><X className="h-5 w-5" /></button>
          </div>

          <div className="px-6 py-5 space-y-5">

            {/* Birth year */}
            <div className="flex items-center gap-3">
              <label className="text-sm font-medium shrink-0 w-24">Birth year</label>
              <Input
                type="number"
                value={birthYear}
                onChange={e => setBirthYear(e.target.value)}
                placeholder="e.g. 1990"
                className="w-36 h-9"
                min={1900} max={2020}
              />
            </div>

            {/* Event rows */}
            <div className="space-y-3">
              <p className="text-sm font-medium">Your life events</p>
              {rows.map((row, idx) => (
                <div key={row.id} className="flex flex-wrap gap-2 items-start p-3 rounded-lg border bg-muted/30">
                  {/* Lane selector */}
                  <select
                    value={row.laneId}
                    onChange={e => updateRow(row.id, { laneId: e.target.value })}
                    className="h-8 text-sm border rounded-md px-2 bg-background min-w-[150px]"
                  >
                    {LANE_OPTIONS.map(l => (
                      <option key={l.id} value={l.id}>{l.label}</option>
                    ))}
                  </select>

                  {/* Title */}
                  <Input
                    value={row.title}
                    onChange={e => updateRow(row.id, { title: e.target.value })}
                    placeholder={idx === 0 ? 'e.g. New York' : 'e.g. Software Engineer at Google'}
                    className="h-8 text-sm flex-1 min-w-[140px]"
                  />

                  {/* From / To */}
                  <div className="flex items-center gap-1.5">
                    <Input
                      value={row.fromYear}
                      onChange={e => updateRow(row.id, { fromYear: e.target.value })}
                      placeholder="From"
                      className="h-8 text-sm w-20"
                      type="number" min={1900} max={2100}
                    />
                    <span className="text-muted-foreground text-xs">→</span>
                    <Input
                      value={row.toYear}
                      onChange={e => updateRow(row.id, { toYear: e.target.value })}
                      placeholder="To"
                      className="h-8 text-sm w-20"
                      type="number" min={1900} max={2100}
                    />
                  </div>

                  {/* Remove (only if more than 1 row) */}
                  {rows.length > 1 && (
                    <button type="button" onClick={() => removeRow(row.id)} className="text-muted-foreground hover:text-destructive h-8 flex items-center">
                      <Trash2 className="h-4 w-4" />
                    </button>
                  )}
                </div>
              ))}

              {/* Add event */}
              <button
                type="button"
                onClick={() => setRows(prev => [...prev, makeRow('place')])}
                className="flex items-center gap-1.5 text-sm text-muted-foreground hover:text-foreground transition-colors"
              >
                <Plus className="h-4 w-4" />
                Add another event
              </button>
            </div>
          </div>

          {/* Footer */}
          <div className="px-6 pb-6 pt-2 flex flex-col sm:flex-row items-center gap-3 border-t">
            {/* Progress dots */}
            <div className="flex gap-1.5 mr-auto">
              {STEPS.map((_, i) => (
                <button key={i} onClick={() => setStep(i)}
                  className={`w-1.5 h-1.5 rounded-full transition-colors ${i === step ? 'bg-foreground' : 'bg-muted-foreground/30 hover:bg-muted-foreground/60'}`}
                />
              ))}
            </div>
            <button
              type="button"
              onClick={onClose}
              className="text-sm text-muted-foreground hover:text-foreground transition-colors"
            >
              Continue with Alex example →
            </button>
            <Button onClick={handleStartOwn} className="min-w-[140px]">
              Get started
              <ChevronRight className="h-4 w-4 ml-1" />
            </Button>
          </div>
        </div>
      </div>
    )
  }

  // ── Render: normal spotlight step ─────────────────────────────────────────
  const tooltipStyle = getTooltipStyle()
  const arrowStyle   = getArrowStyle()

  return (
    <div ref={overlayRef} className="fixed inset-0 z-[200]" onClick={handleBackdropClick}>
      {/* Dimmed backdrop with spotlight hole */}
      {hole ? (
        <div
          className="pointer-events-none absolute"
          style={{ top: hole.top, left: hole.left, width: hole.width, height: hole.height, boxShadow: '0 0 0 9999px rgba(0,0,0,0.55)', borderRadius: 6 }}
        />
      ) : (
        <div className="absolute inset-0 bg-black/55 pointer-events-none" />
      )}

      {/* Tooltip card */}
      <div
        className="absolute bg-background/95 backdrop-blur-sm border border-border rounded-xl shadow-2xl pointer-events-auto"
        style={{ width: TIP_W, ...tooltipStyle }}
        onClick={e => e.stopPropagation()}
      >
        <div style={arrowStyle} />

        <div className="flex items-start justify-between px-4 pt-4 pb-2">
          <span className="text-[10px] font-medium text-muted-foreground uppercase tracking-wider">{step + 1} / {total}</span>
          <button onClick={onClose} className="text-muted-foreground hover:text-foreground transition-colors -mt-0.5 -mr-1">
            <X className="h-4 w-4" />
          </button>
        </div>

        <div className="px-4 pb-3">
          <p className="font-semibold text-sm mb-1">{current.title}</p>
          <p className="text-sm text-muted-foreground leading-relaxed">{current.text}</p>
        </div>

        <div className="flex justify-center gap-1.5 pb-3">
          {STEPS.map((_, i) => (
            <button key={i} onClick={() => setStep(i)}
              className={`w-1.5 h-1.5 rounded-full transition-colors ${i === step ? 'bg-foreground' : 'bg-muted-foreground/30 hover:bg-muted-foreground/60'}`}
            />
          ))}
        </div>

        <div className="flex justify-between items-center px-4 pb-4 pt-1 border-t border-border/50">
          <Button variant="ghost" size="sm" onClick={() => setStep(s => Math.max(0, s - 1))} disabled={step === 0} className="gap-1 text-xs">
            <ChevronLeft className="h-3.5 w-3.5" />Back
          </Button>
          <Button size="sm" onClick={() => setStep(s => s + 1)} className="gap-1 text-xs">
            Next<ChevronRight className="h-3.5 w-3.5" />
          </Button>
        </div>
      </div>
    </div>
  )
}
