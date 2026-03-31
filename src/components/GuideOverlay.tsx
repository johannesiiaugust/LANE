import { useEffect, useState, useCallback, useRef } from 'react'
import { X, ChevronRight, ChevronLeft, Plus, Trash2 } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { DateInput } from '@/components/ui/DateInput'
import { DEMO_LANES } from '@/data/demoData'
import { dateStrToFracYear } from '@/lib/constants'
import type { TimelineEvent } from '@/types/timeline'
import { useTranslation } from '@/i18n/context'

// ─── Step definitions ────────────────────────────────────────────────────────

interface Step {
  target: string
  title: string
  text: string
  side: 'top' | 'bottom' | 'left' | 'right'
  align: 'start' | 'center' | 'end'
  isOnboarding?: true   // last step — renders the full-screen form instead
}


const PADDING = 8
const TIP_W  = 288

// ─── Onboarding form types ───────────────────────────────────────────────────

type EndMode = 'none' | 'date' | 'today' | 'ongoing'

interface UserEventRow {
  id: string
  laneId: string
  title: string
  fromYear: string
  toYear: string
  endMode: EndMode
}

function makeRow(laneId: string): UserEventRow {
  return { id: crypto.randomUUID(), laneId, title: '', fromYear: '', toYear: '', endMode: 'none' }
}

// ─── Main component ──────────────────────────────────────────────────────────

interface GuideOverlayProps {
  open: boolean
  onClose: () => void
}

interface TargetRect { top: number; left: number; width: number; height: number }

export function GuideOverlay({ open, onClose }: GuideOverlayProps) {
  const { t } = useTranslation()

  const LANE_OPTIONS = DEMO_LANES.map(l => ({
    id: l.id,
    label: `${l.emoji ?? ''} ${t(`lanes.${l.id}` as Parameters<typeof t>[0])}`.trim(),
  }))

  const STEPS: Step[] = [
    {
      target: 'compare',
      title: t('guide.step1Title'),
      text: t('guide.step1Text'),
      side: 'bottom',
      align: 'start',
    },
    {
      target: 'zoom',
      title: t('guide.step2Title'),
      text: t('guide.step2Text'),
      side: 'bottom',
      align: 'end',
    },
    {
      target: 'compare',
      title: t('guide.step3Title'),
      text: t('guide.step3Text'),
      side: 'bottom',
      align: 'start',
    },
    {
      target: 'add-events',
      title: t('guide.step4Title'),
      text: t('guide.step4Text'),
      side: 'bottom',
      align: 'end',
    },
    {
      target: '__onboarding__',
      title: t('guide.startYourOwnStory'),
      text: '',
      side: 'bottom',
      align: 'center',
      isOnboarding: true,
    },
  ]

  const [step, setStep] = useState(0)
  const [rect, setRect] = useState<TargetRect | null>(null)
  const overlayRef = useRef<HTMLDivElement>(null)

  // Onboarding form state
  const [birthDate, setBirthDate] = useState('')
  const [rows, setRows] = useState<UserEventRow[]>([
    makeRow('place'),
    makeRow('work'),
  ])
  const [submitted, setSubmitted] = useState(false)

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

  // Use a ref so the Escape handler always calls the latest dismiss logic
  const dismissRef = useRef<() => void>(onClose)

  useEffect(() => {
    if (!open) return
    const handler = (e: KeyboardEvent) => { if (e.key === 'Escape') dismissRef.current() }
    window.addEventListener('keydown', handler)
    return () => window.removeEventListener('keydown', handler)
  }, [open])

  if (!open) return null

  const current = STEPS[step]
  const total   = STEPS.length

  const onboardingStep = STEPS.length - 1

  // Dismissing a spotlight step jumps to the onboarding step instead of closing.
  // Only the onboarding step itself actually closes on X / backdrop.
  function handleDismiss() {
    if (current.isOnboarding) onClose()
    else setStep(onboardingStep)
  }
  dismissRef.current = handleDismiss

  const handleBackdropClick = (e: React.MouseEvent<HTMLDivElement>) => {
    if (e.target === overlayRef.current) handleDismiss()
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
    setSubmitted(true)

    const validRows = rows.filter(r => r.title.trim() && r.fromYear.trim())
    if (!birthDate || validRows.length === 0) return

    const now = new Date()
    const currentFracYear = now.getFullYear() + (now.getMonth() / 12) + (now.getDate() / 365.25)

    const newEvents: TimelineEvent[] = validRows.map(r => {
      const startYear = dateStrToFracYear(r.fromYear)
      let endYear: number | undefined
      let link: TimelineEvent['link']

      if (r.endMode === 'date' && r.toYear.trim()) {
        endYear = dateStrToFracYear(r.toYear)
      } else if (r.endMode === 'today') {
        endYear = currentFracYear
      } else if (r.endMode === 'ongoing') {
        endYear = currentFracYear
        link = { anchorType: 'start_to_today', fixedYear: startYear, startOffset: 0 }
      }

      return {
        id: crypto.randomUUID(),
        laneId: r.laneId,
        title: r.title.trim(),
        description: '',
        type: 'range' as const,
        startYear,
        endYear,
        ...(link ? { link } : {}),
      }
    })

    // Merge with existing user events (preserve events from previous guide runs)
    let existingUserEvents: TimelineEvent[] = []
    try {
      const savedRaw = localStorage.getItem('timeline_demo_v3')
      if (savedRaw) {
        const saved = JSON.parse(savedRaw) as { events?: TimelineEvent[] }
        if (Array.isArray(saved.events)) {
          existingUserEvents = saved.events.filter(e => !e.id.startsWith('demo-evt-'))
        }
      }
    } catch { /* ignore */ }

    const allUserEvents = [...existingUserEvents, ...newEvents]
    const birthFrac = dateStrToFracYear(birthDate)
    const meta = { name: 'My Life', color: '#6366f1', start_year: birthFrac, end_year: null, emoji: '👤' }
    try {
      localStorage.setItem('timeline_demo_v3', JSON.stringify({ lanes: DEMO_LANES, events: allUserEvents, meta, userOwnStory: true }))
      localStorage.setItem('timeline_guide_completed', '1')
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
              <h2 className="text-xl font-semibold">{t('guide.startYourOwnStory')}</h2>
              <p className="text-sm text-muted-foreground mt-1">{t('guide.addFewEvents')}</p>
            </div>
            <button onClick={onClose} className="text-muted-foreground hover:text-foreground ml-4 mt-0.5"><X className="h-5 w-5" /></button>
          </div>

          <div className="px-6 py-5 space-y-5">

            {/* Birth date */}
            <div className="space-y-1">
              <div className="flex items-center gap-3">
                <label className="text-sm font-medium shrink-0 w-24">
                  {t('guide.birthDate')} <span className="text-red-500">*</span>
                </label>
                <div className={submitted && !birthDate ? 'ring-2 ring-red-500 rounded-md' : ''}>
                  <DateInput value={birthDate} onChange={setBirthDate} minIso="1900-01-01" maxIso="2020-12-31" className="w-56" />
                </div>
              </div>
              {submitted && !birthDate && (
                <p className="text-xs text-red-500 pl-28">{t('auth.birthDateRequired')}</p>
              )}
            </div>

            {/* Event rows */}
            <div className="space-y-3">
              <p className="text-sm font-medium">{t('guide.yourLifeEvents')}</p>
              {rows.map((row, idx) => (
                <div key={row.id} className="flex flex-wrap gap-2 items-end p-3 rounded-lg border bg-muted/30">
                  {/* Lane selector */}
                  <div className="flex flex-col gap-0.5">
                    <span className="text-xs text-muted-foreground">{t('event.lane')}</span>
                    <select
                      value={row.laneId}
                      onChange={e => updateRow(row.id, { laneId: e.target.value })}
                      className="h-8 text-sm border rounded-md px-2 bg-background min-w-[150px]"
                    >
                      {LANE_OPTIONS.map(l => (
                        <option key={l.id} value={l.id}>{l.label}</option>
                      ))}
                    </select>
                  </div>

                  {/* Title */}
                  <div className="flex flex-col gap-0.5 flex-1 min-w-[140px]">
                    <span className="text-xs text-muted-foreground">{t('common.title')} <span className="text-red-500">*</span></span>
                    <Input
                      value={row.title}
                      onChange={e => updateRow(row.id, { title: e.target.value })}
                      placeholder={idx === 0 ? t('guide.placeholderPlace') : t('guide.placeholderWork')}
                      className={`h-8 text-sm ${submitted && !row.title.trim() ? 'border-red-500 focus-visible:ring-red-500' : ''}`}
                    />
                  </div>

                  {/* From / To */}
                  <div className="flex items-end gap-1.5 flex-wrap">
                    <div className="flex flex-col gap-0.5">
                      <span className="text-xs text-muted-foreground">{t('selector.start')} <span className="text-red-500">*</span></span>
                      <div className={submitted && !row.fromYear.trim() ? 'ring-2 ring-red-500 rounded-md' : ''}>
                        <DateInput value={row.fromYear} onChange={v => updateRow(row.id, { fromYear: v })} minIso="1900-01-01" maxIso="2100-12-31" />
                      </div>
                    </div>
                    <span className="text-muted-foreground text-xs pb-2">→</span>
                    <div className="flex flex-col gap-0.5">
                      <span className="text-xs text-muted-foreground">{t('guide.endOptional')}</span>
                      <div className="flex items-center gap-1">
                        <select
                          value={row.endMode}
                          onChange={e => updateRow(row.id, { endMode: e.target.value as EndMode, toYear: '' })}
                          className="h-8 text-sm border rounded-md px-2 bg-background"
                        >
                          <option value="none">{t('guide.endNone')}</option>
                          <option value="date">{t('guide.endDate')}</option>
                          <option value="today">{t('guide.endToday')}</option>
                          <option value="ongoing">{t('guide.endOngoing')}</option>
                        </select>
                        {row.endMode === 'date' && (
                          <DateInput value={row.toYear} onChange={v => updateRow(row.id, { toYear: v })} minIso="1900-01-01" maxIso="2100-12-31" />
                        )}
                      </div>
                    </div>
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
                {t('guide.addAnotherEvent')}
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
            {submitted && (!birthDate || rows.every(r => !r.title.trim() || !r.fromYear.trim())) && (
              <p className="text-xs text-red-500">{t('guide.fillRequiredFields')}</p>
            )}
            <button
              type="button"
              onClick={onClose}
              className="text-sm text-muted-foreground hover:text-foreground transition-colors"
            >
              {t('guide.continueWithExample')}
            </button>
            <Button onClick={handleStartOwn} className="min-w-[140px]">
              {t('auth.getStarted')}
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
          <button onClick={handleDismiss} className="text-muted-foreground hover:text-foreground transition-colors -mt-0.5 -mr-1">
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
            <ChevronLeft className="h-3.5 w-3.5" />{t('common.back')}
          </Button>
          <Button size="sm" onClick={() => setStep(s => s + 1)} className="gap-1 text-xs">
            {t('guide.next')}<ChevronRight className="h-3.5 w-3.5" />
          </Button>
        </div>
      </div>
    </div>
  )
}
