import { useState, useCallback, useRef, useMemo, useEffect } from 'react'
import type { Lane, TimelineEvent } from '@/types/timeline'
import { DEMO_TIMELINE_START_YEAR } from '@/data/demoData'
import { useTimelineContext } from '@/contexts/TimelineContext'
import { usePersonas } from '@/hooks/usePersonas'
import { TimelineContainer } from '@/components/timeline/TimelineContainer'
import { EventDialog } from '@/components/dialogs/EventDialog'
import { LaneDialog } from '@/components/dialogs/LaneDialog'
import { DeleteConfirmDialog } from '@/components/dialogs/DeleteConfirmDialog'
import { EventPopover } from '@/components/EventPopover'
import { TooltipProvider } from '@/components/ui/tooltip'
import { UiSizeProvider, useSizeConfig, type UiSize } from '@/contexts/UiSizeContext'
import { useSkin, SKINS } from '@/contexts/SkinContext'
import { SkinDialog } from '@/components/SkinDialog'
import { ImportDialog, type ImportTab } from '@/components/ImportDialog'
import { SearchDialog } from '@/components/SearchDialog'
import { GuideOverlay } from '@/components/GuideOverlay'
import { useGoogleTranslate, TranslateMenuContent } from '@/components/TranslateMenu'
import { Button } from '@/components/ui/button'
import { Switch } from '@/components/ui/switch'
import { cn } from '@/lib/utils'
import {
  Plus,
  ZoomIn,
  ZoomOut,
  MoreHorizontal,
  CalendarDays,
  Globe,
  FileText,
  Mic,
  Search,
  Users,
  Link2,
  Link2Off,
  ChevronDown,
  Pencil,
  Check,
  X,
} from 'lucide-react'
import { MIN_PIXELS_PER_YEAR, MAX_PIXELS_PER_YEAR, SIDEBAR_WIDTH, fracYearToMs, msToFracYear } from '@/lib/constants'
import { incrementPersonaView } from '@/lib/api'
import type { DbPersona } from '@/types/database'
import { Input } from '@/components/ui/input'
import { DateInput } from '@/components/ui/DateInput'
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu'
import { Popover, PopoverContent, PopoverTrigger } from '@/components/ui/popover'

interface DemoTimelineViewProps {
  onSignUpWithTimeline: () => void
}

const SIZE_NAMES: Record<UiSize, string> = { small: 'Small', medium: 'Medium', large: 'Large', fitscreen: 'Fit Screen' }

function DemoTimelineViewInner({ onSignUpWithTimeline }: DemoTimelineViewProps) {
  const {
    lanes,
    events,
    pixelsPerYear,
    setPixelsPerYear,
    yearStart,
    yearEnd,
    dataYearMin,
    dataYearMax,
    addEvent,
    updateEvent,
    deleteEvent,
    addLane,
    updateLane,
    deleteLane,
    moveLane,
    toggleLaneVisibility,
    timelines,
    selectedTimelineId,
    updateTimeline,
  } = useTimelineContext()

  const currentTimeline = timelines.find(t => t.id === selectedTimelineId) ?? timelines[0]

  // Birth year for age-aligning persona overlays — use user's own if saved, else Alex's
  const DEMO_BIRTH_YEAR = currentTimeline?.start_year ?? DEMO_TIMELINE_START_YEAR

  const {
    personas,
    activePersonaEvents,
    activePersonaIds,
    togglePersona,
    alignedPersonaIds,
    togglePersonaAlignment,
    personaDisplayModes,
    setPersonaDisplayMode,
  } = usePersonas(DEMO_BIRTH_YEAR)

  // Auto-activate Einstein with age alignment and separate display on first load
  const einsteinInitRef = useRef(false)
  useEffect(() => {
    if (einsteinInitRef.current) return
    if (personas.length === 0) return
    einsteinInitRef.current = true
    const einstein = personas.find(p => p.name.toLowerCase().includes('einstein'))
    if (einstein) {
      if (!activePersonaIds.has(einstein.id)) togglePersona(einstein.id)
      if (!alignedPersonaIds.has(einstein.id)) togglePersonaAlignment(einstein.id)
      // Always default Einstein to separate timeline on the demo page
      if (personaDisplayModes.get(einstein.id) !== 'separate') {
        setPersonaDisplayMode(einstein.id, 'separate')
      }
    }
  }, [personas, activePersonaIds, alignedPersonaIds, personaDisplayModes, togglePersona, togglePersonaAlignment, setPersonaDisplayMode])

  // ── Persona search + recently viewed ──────────────────────────────────────
  const [personaSearch, setPersonaSearch] = useState('')
  const [recentPersonaIds, setRecentPersonaIds] = useState<string[]>(() => {
    try { return JSON.parse(localStorage.getItem('persona_recently_viewed') ?? '[]') } catch { return [] }
  })

  function handleTogglePersona(id: string) {
    if (!activePersonaIds.has(id)) {
      incrementPersonaView(id)
      setRecentPersonaIds(prev => {
        const next = [id, ...prev.filter(x => x !== id)].slice(0, 5)
        localStorage.setItem('persona_recently_viewed', JSON.stringify(next))
        return next
      })
    }
    togglePersona(id)
  }

  const top5Personas = [...personas]
    .sort((a, b) => ((b as DbPersona).view_count ?? 0) - ((a as DbPersona).view_count ?? 0))
    .slice(0, 5)

  const recentPersonas = recentPersonaIds
    .map(id => personas.find(p => p.id === id))
    .filter((p): p is DbPersona => !!p)

  const personaSearchTrimmed = personaSearch.trim().toLowerCase()
  const personaSearchResults = personaSearchTrimmed.length > 0
    ? personas.filter(p => p.name.toLowerCase().includes(personaSearchTrimmed)).slice(0, 20)
    : []

  // Set initial zoom so ~180 years (90 back + 90 forward) fills the screen, centred on today
  useEffect(() => {
    const isMobile = window.innerWidth <= 767
    const contentW = window.innerWidth - (isMobile ? 0 : SIDEBAR_WIDTH)
    const ppy = Math.max(MIN_PIXELS_PER_YEAR, contentW / 180)
    setPixelsPerYear(Math.round(ppy * 100) / 100)
    // Scroll to today after layout settles
    requestAnimationFrame(() => { scrollToTodayRef.current?.() })
  }, []) // eslint-disable-line react-hooks/exhaustive-deps

  // Timeline edit state
  const [tlEditOpen, setTlEditOpen] = useState(false)
  const [tlEditName, setTlEditName] = useState('')
  const [tlEditColor, setTlEditColor] = useState('')
  const [tlEditStartDate, setTlEditStartDate] = useState('')

  function fracToDateStr(fy: number | null): string {
    if (fy == null) return ''
    const d = new Date(fracYearToMs(fy))
    return `${d.getUTCFullYear()}-${String(d.getUTCMonth() + 1).padStart(2, '0')}-${String(d.getUTCDate()).padStart(2, '0')}`
  }
  function dateStrToFrac(s: string): number | null {
    if (!s) return null
    const [y, mo, da] = s.split('-').map(Number)
    return msToFracYear(Date.UTC(y, mo - 1, da))
  }

  function openTlEdit() {
    setTlEditName(currentTimeline?.name ?? '')
    setTlEditColor(currentTimeline?.color ?? '#6366f1')
    setTlEditStartDate(fracToDateStr(currentTimeline?.start_year ?? null))
    setTlEditOpen(true)
  }

  async function saveTlEdit() {
    await updateTimeline('demo', {
      name: tlEditName.trim() || currentTimeline?.name,
      color: tlEditColor,
      start_year: dateStrToFrac(tlEditStartDate),
    })
    setTlEditOpen(false)
  }

  const { size, setSize } = useSizeConfig()
  const { skinId, setSkinId } = useSkin()
  const [skinDialogOpen, setSkinDialogOpen] = useState(false)
  const [importDialogOpen, setImportDialogOpen] = useState(false)
  const [importTab, setImportTab] = useState<ImportTab>('calendar-file')
  const [searchOpen, setSearchOpen] = useState(false)
  const [guideOpen, setGuideOpen] = useState(false)
  useGoogleTranslate()
  const [showExampleOverlay, setShowExampleOverlay] = useState(
    () => !localStorage.getItem('timeline_guide_completed')
  )
  const guideWasOpenRef = useRef(false)
  const guideClosedRef = useRef(false)

  // Auto-open guide after 3.5 seconds — skip if user already completed onboarding
  useEffect(() => {
    if (localStorage.getItem('timeline_guide_completed')) return
    const t = setTimeout(() => setGuideOpen(true), 3500)
    return () => clearTimeout(t)
  }, [])

  // Track when guide has been shown and then closed; auto-hide overlay 10s after close
  useEffect(() => {
    if (guideOpen) { guideWasOpenRef.current = true }
    else if (guideWasOpenRef.current) {
      guideClosedRef.current = true
      const t = setTimeout(() => setShowExampleOverlay(false), 8000)
      return () => clearTimeout(t)
    }
  }, [guideOpen])

  const stepZoom = useCallback((factor: number) => {
    const next = Math.max(MIN_PIXELS_PER_YEAR, Math.min(MAX_PIXELS_PER_YEAR, pixelsPerYear * factor))
    setPixelsPerYear(Math.round(next * 10) / 10)
  }, [pixelsPerYear, setPixelsPerYear])

  const openImport = (tab: ImportTab) => {
    setImportTab(tab)
    setImportDialogOpen(true)
  }

  const handleSelectSkin = (id: Parameters<typeof setSkinId>[0]) => {
    setSkinId(id)
    if (id === 'custom') setSkinDialogOpen(true)
  }

  const scrollToTodayRef = useRef<(() => void) | null>(null)
  const scrollToEventRef = useRef<((event: TimelineEvent) => void) | null>(null)
  const [todayOffScreen, setTodayOffScreen] = useState<{ direction: 'left' | 'right' } | null>(null)

  const [maxEvents] = useState(100)
  const [navigatedEventId, setNavigatedEventId] = useState<string | null>(null)
  const displayedEvents = useMemo(() => {
    const sorted = [...events].sort((a, b) => {
      const durA = a.type === 'range' && a.endYear != null ? a.endYear - a.startYear : 0
      const durB = b.type === 'range' && b.endYear != null ? b.endYear - b.startYear : 0
      return durB - durA
    })
    const top = sorted.slice(0, Math.max(1, maxEvents))
    if (navigatedEventId && !top.find(e => e.id === navigatedEventId)) {
      const target = events.find(e => e.id === navigatedEventId)
      if (target) top.push(target)
    }
    return top
  }, [events, maxEvents, navigatedEventId])

  const handleSearchNavigate = useCallback((event: TimelineEvent) => {
    setNavigatedEventId(event.id)
    scrollToEventRef.current?.(event)
  }, [])

  // Popover state
  const [popover, setPopover] = useState<{ event: TimelineEvent; anchor: HTMLElement; x: number; y: number } | null>(null)

  // Event dialog state
  const [eventDialogOpen, setEventDialogOpen] = useState(false)
  const [editingEvent, setEditingEvent] = useState<TimelineEvent | null>(null)
  const [defaultLaneId, setDefaultLaneId] = useState<string | undefined>()
  const [defaultStartYear, setDefaultStartYear] = useState<number | undefined>()
  const [defaultEndYear, setDefaultEndYear] = useState<number | undefined>()

  // Lane dialog state
  const [laneDialogOpen, setLaneDialogOpen] = useState(false)
  const [editingLane, setEditingLane] = useState<Lane | null>(null)

  // Delete dialog state
  const [deleteDialog, setDeleteDialog] = useState<{ open: boolean; title: string; description: string; onConfirm: () => void }>
    ({ open: false, title: '', description: '', onConfirm: () => {} })

  const handleEventClick = useCallback((event: TimelineEvent, element: HTMLElement, clientX: number, clientY: number) => {
    setPopover({ event, anchor: element, x: clientX, y: clientY })
  }, [])

  const handleAddEvent = useCallback(() => {
    setEditingEvent(null); setDefaultLaneId(undefined); setDefaultStartYear(undefined); setDefaultEndYear(undefined)
    setEventDialogOpen(true)
  }, [])

  const handleAddLane = useCallback(() => { setEditingLane(null); setLaneDialogOpen(true) }, [])

  const handleLaneClick = useCallback((laneId: string, year: number) => {
    setEditingEvent(null); setDefaultLaneId(laneId); setDefaultStartYear(year); setDefaultEndYear(undefined)
    setEventDialogOpen(true)
  }, [])

  const handleLaneDragRange = useCallback((laneId: string, startYear: number, endYear: number) => {
    setEditingEvent(null); setDefaultLaneId(laneId); setDefaultStartYear(startYear); setDefaultEndYear(endYear)
    setEventDialogOpen(true)
  }, [])

  const handleEditEvent = useCallback((event: TimelineEvent) => {
    setPopover(null); setEditingEvent(event); setDefaultLaneId(undefined); setDefaultStartYear(undefined); setDefaultEndYear(undefined)
    setEventDialogOpen(true)
  }, [])

  const handleDeleteEvent = useCallback((event: TimelineEvent) => {
    setPopover(null)
    setDeleteDialog({ open: true, title: 'Delete Event', description: `Delete "${event.title}"?`, onConfirm: () => { deleteEvent(event.id); setDeleteDialog(p => ({ ...p, open: false })) } })
  }, [deleteEvent])

  const handleEditLane = useCallback((lane: Lane) => { setEditingLane(lane); setLaneDialogOpen(true) }, [])

  const handleDeleteLane = useCallback((lane: Lane) => {
    setDeleteDialog({ open: true, title: 'Delete Lane', description: `Delete "${lane.name}" and all its events?`, onConfirm: () => { deleteLane(lane.id); setDeleteDialog(p => ({ ...p, open: false })) } })
  }, [deleteLane])

  const handleSaveEvent = useCallback((data: Omit<TimelineEvent, 'id'>) => {
    if (editingEvent) updateEvent(editingEvent.id, data); else addEvent(data)
  }, [editingEvent, updateEvent, addEvent])

  const handleEventDrop = useCallback((eventId: string, newLaneId: string, newStartYear: number, newEndYear: number | undefined) => {
    updateEvent(eventId, { laneId: newLaneId, startYear: newStartYear, ...(newEndYear !== undefined ? { endYear: newEndYear } : { endYear: undefined }) })
  }, [updateEvent])

  const handleSaveLane = useCallback((data: { name: string; color: string; visible: boolean; emoji?: string }) => {
    if (editingLane) updateLane(editingLane.id, data); else addLane(data)
  }, [editingLane, updateLane, addLane])

  return (
    <div className="flex flex-col h-full bg-background overflow-hidden">
      {/* Minimal demo toolbar */}
      <div className="flex items-center justify-between border-b bg-background px-3 py-2 gap-2 shrink-0">
        {/* ── Left side ── */}
        <div className="flex items-center gap-2 min-w-0">
        {/* Compare & edit */}
        <Popover>
          <PopoverTrigger asChild>
            <Button variant="outline" size="sm" className="gap-1.5" data-guide="compare">
              <Users className="h-4 w-4" />
              <span className="hidden sm:inline">Compare & edit</span>
              <ChevronDown className="h-3.5 w-3.5 opacity-50 shrink-0" />
            </Button>
          </PopoverTrigger>
          <PopoverContent align="end" className="w-72 p-0 max-h-[80vh] overflow-y-auto">

            {/* ── Current timeline ── */}
            <div className="px-3 pt-2 pb-1">
              <p className="text-xs font-semibold text-muted-foreground uppercase tracking-wide">My Timeline</p>
            </div>
            <div className="px-1 pb-1">
              {!tlEditOpen ? (
                <div className="flex items-center rounded-md px-2 py-1.5 bg-accent group gap-2">
                  {currentTimeline?.color && (
                    <div className="w-3 h-3 rounded-full shrink-0" style={{ backgroundColor: currentTimeline.color }} />
                  )}
                  <span className="flex-1 text-sm font-semibold truncate">{currentTimeline?.name ?? 'My Timeline'}</span>
                  <button
                    className="p-0.5 text-muted-foreground hover:text-foreground opacity-0 group-hover:opacity-100"
                    onClick={openTlEdit}
                    title="Edit timeline"
                  >
                    <Pencil className="h-3 w-3" />
                  </button>
                </div>
              ) : (
                <div className="px-2 py-2 space-y-2">
                  <div className="flex items-center gap-2">
                    <input type="color" value={tlEditColor} onChange={e => setTlEditColor(e.target.value)} className="w-6 h-6 rounded cursor-pointer border-0 p-0 shrink-0" />
                    <Input value={tlEditName} onChange={e => setTlEditName(e.target.value)} placeholder="Name" className="h-7 text-xs flex-1" />
                  </div>
                  <div>
                    <p className="text-[10px] text-muted-foreground mb-0.5">Start date</p>
                    <DateInput value={tlEditStartDate} onChange={setTlEditStartDate} />
                  </div>
                  <div className="flex gap-1.5 justify-end">
                    <button onClick={() => setTlEditOpen(false)} className="p-1 text-muted-foreground hover:text-foreground rounded"><X className="h-3.5 w-3.5" /></button>
                    <button onClick={saveTlEdit} className="p-1 text-primary hover:text-primary/80 rounded"><Check className="h-3.5 w-3.5" /></button>
                  </div>
                </div>
              )}
            </div>

            {/* ── Personas ── */}
            <div className="border-t px-3 pt-2 pb-1">
              <p className="text-xs font-semibold text-muted-foreground uppercase tracking-wide flex items-center gap-1">
                <Users className="h-3 w-3" />
                Compare with
                {activePersonaIds.size > 0 && (
                  <span className="ml-auto rounded-full bg-primary px-1.5 text-[10px] text-primary-foreground">{activePersonaIds.size}</span>
                )}
              </p>
            </div>
            <div className="px-1 pt-1 pb-2">
              {personas.length === 0 ? (
                <p className="px-2 py-2 text-xs text-muted-foreground text-center">No personas available</p>
              ) : (
                <>
                  {/* Top 5 popular */}
                  <div className="px-2 pb-1">
                    <p className="text-[10px] font-medium text-muted-foreground mb-1">Popular</p>
                    {top5Personas.map(p => {
                      const isActive = activePersonaIds.has(p.id)
                      const aligned = alignedPersonaIds.has(p.id)
                      return (
                        <div key={p.id} className="rounded-md px-2 py-1.5 hover:bg-accent">
                          <div className="flex items-center justify-between gap-2">
                            <div className="min-w-0">
                              <p className="text-sm font-medium truncate">{p.name}</p>
                              <p className="text-xs text-muted-foreground">{p.birth_year}–{p.death_year ?? 'present'}</p>
                            </div>
                            <div className="flex items-center gap-1.5 shrink-0">
                              {isActive && (
                                <button onClick={() => togglePersonaAlignment(p.id)}
                                  title={aligned ? 'Age-aligned — click for real years' : 'Real years — click to age-align'}
                                  className={cn('p-1 rounded transition-colors', aligned ? 'text-primary bg-primary/10 hover:bg-primary/20' : 'text-muted-foreground hover:bg-muted')}>
                                  {aligned ? <Link2 className="h-3 w-3" /> : <Link2Off className="h-3 w-3" />}
                                </button>
                              )}
                              <Switch checked={isActive} onCheckedChange={() => handleTogglePersona(p.id)} />
                            </div>
                          </div>
                        </div>
                      )
                    })}
                  </div>

                  {/* Search */}
                  <div className="px-2 py-1.5 border-t">
                    <div className="flex gap-1.5">
                      <Input value={personaSearch} onChange={e => setPersonaSearch(e.target.value)} placeholder="Search personas…" className="h-7 text-xs flex-1" />
                      {personaSearch && (
                        <button type="button" onClick={() => setPersonaSearch('')} className="shrink-0 text-muted-foreground hover:text-foreground">
                          <X className="h-3.5 w-3.5" />
                        </button>
                      )}
                    </div>
                    {personaSearchResults.length > 0 && (
                      <div className="mt-1 space-y-0.5">
                        {personaSearchResults.map(p => {
                          const isActive = activePersonaIds.has(p.id)
                          const aligned = alignedPersonaIds.has(p.id)
                          return (
                            <div key={p.id} className="rounded-md px-2 py-1.5 hover:bg-accent">
                              <div className="flex items-center justify-between gap-2">
                                <div className="min-w-0">
                                  <p className="text-sm font-medium truncate">{p.name}</p>
                                  <p className="text-xs text-muted-foreground">{p.birth_year}–{p.death_year ?? 'present'}</p>
                                </div>
                                <div className="flex items-center gap-1.5 shrink-0">
                                  {isActive && (
                                    <button onClick={() => togglePersonaAlignment(p.id)}
                                      title={aligned ? 'Age-aligned — click for real years' : 'Real years — click to age-align'}
                                      className={cn('p-1 rounded transition-colors', aligned ? 'text-primary bg-primary/10 hover:bg-primary/20' : 'text-muted-foreground hover:bg-muted')}>
                                      {aligned ? <Link2 className="h-3 w-3" /> : <Link2Off className="h-3 w-3" />}
                                    </button>
                                  )}
                                  <Switch checked={isActive} onCheckedChange={() => handleTogglePersona(p.id)} />
                                </div>
                              </div>
                            </div>
                          )
                        })}
                      </div>
                    )}
                    {personaSearchTrimmed.length > 0 && personaSearchResults.length === 0 && (
                      <p className="text-[10px] text-muted-foreground mt-1">No results</p>
                    )}
                  </div>

                  {/* Recently viewed */}
                  {recentPersonas.length > 0 && personaSearchTrimmed.length === 0 && (
                    <div className="px-2 pt-1.5 border-t">
                      <p className="text-[10px] font-medium text-muted-foreground mb-1">Recently viewed</p>
                      {recentPersonas.map(p => {
                        const isActive = activePersonaIds.has(p.id)
                        const aligned = alignedPersonaIds.has(p.id)
                        return (
                          <div key={p.id} className="rounded-md px-2 py-1.5 hover:bg-accent">
                            <div className="flex items-center justify-between gap-2">
                              <div className="min-w-0">
                                <p className="text-sm font-medium truncate">{p.name}</p>
                                <p className="text-xs text-muted-foreground">{p.birth_year}–{p.death_year ?? 'present'}</p>
                              </div>
                              <div className="flex items-center gap-1.5 shrink-0">
                                {isActive && (
                                  <button onClick={() => togglePersonaAlignment(p.id)}
                                    title={aligned ? 'Age-aligned — click for real years' : 'Real years — click to age-align'}
                                    className={cn('p-1 rounded transition-colors', aligned ? 'text-primary bg-primary/10 hover:bg-primary/20' : 'text-muted-foreground hover:bg-muted')}>
                                    {aligned ? <Link2 className="h-3 w-3" /> : <Link2Off className="h-3 w-3" />}
                                  </button>
                                )}
                                <Switch checked={isActive} onCheckedChange={() => handleTogglePersona(p.id)} />
                              </div>
                            </div>
                          </div>
                        )
                      })}
                    </div>
                  )}
                </>
              )}
            </div>
          </PopoverContent>
        </Popover>
        </div>

        {/* ── Right side ── */}
        <div className="flex items-center gap-2 shrink-0">
        {/* Back to Today — fixed center, only when today is off-screen */}
        {todayOffScreen && (
          <button
            onClick={() => scrollToTodayRef.current?.()}
            className="fixed top-14 left-1/2 -translate-x-1/2 whitespace-nowrap flex items-center gap-1 px-3 py-1.5 rounded text-xs font-semibold border-2 border-red-500 bg-red-500 text-white hover:bg-red-600 hover:border-red-600 transition-colors z-50 shadow-md"
          >
            {todayOffScreen.direction === 'left' ? '← ' : '→ '}Back to Today
          </button>
        )}

        {/* Zoom out */}
        <Button variant="outline" size="sm" onClick={() => stepZoom(1 / 1.69)} title="Zoom out" data-guide="zoom">
          <ZoomOut className="h-4 w-4" />
        </Button>

        {/* Zoom in */}
        <Button variant="outline" size="sm" onClick={() => stepZoom(1.69)} title="Zoom in">
          <ZoomIn className="h-4 w-4" />
        </Button>

        {/* How to use */}
        <Button variant="outline" size="sm" onClick={() => setGuideOpen(true)} title="How to use" className="px-2 text-red-500 border-red-500 hover:bg-red-50 hover:text-red-600 dark:hover:bg-red-950">
          <span className="font-bold text-base leading-none">?</span>
        </Button>

        {/* Add dropdown */}
        <DropdownMenu>
          <DropdownMenuTrigger asChild>
            <Button size="sm" className="px-2.5" title="Add…" data-guide="add-events">
              <Plus className="h-4 w-4" />
            </Button>
          </DropdownMenuTrigger>
          <DropdownMenuContent align="end" className="w-40">
            <DropdownMenuItem onClick={handleAddEvent}>
              <Plus className="h-4 w-4 mr-2" />
              Add Event
            </DropdownMenuItem>
            <DropdownMenuItem onClick={handleAddLane}>
              <Plus className="h-4 w-4 mr-2" />
              Add Lane
            </DropdownMenuItem>
          </DropdownMenuContent>
        </DropdownMenu>

        {/* Three-dot overflow menu */}
        <DropdownMenu>
          <DropdownMenuTrigger asChild>
            <Button variant="outline" size="sm" className="px-2" data-guide="overflow-menu">
              <MoreHorizontal className="h-4 w-4" />
            </Button>
          </DropdownMenuTrigger>
          <DropdownMenuContent align="end" className="w-52">
            <div className="max-h-[70vh] overflow-y-auto">
              <DropdownMenuItem onClick={() => setSearchOpen(true)}>
                <Search className="h-4 w-4 mr-2" />
                Search Events
              </DropdownMenuItem>
              <DropdownMenuSeparator />
              {/* Size */}
              {(['small', 'large', 'fitscreen'] as UiSize[]).map(s => (
                <DropdownMenuItem
                  key={s}
                  onClick={() => setSize(s)}
                  className={size === s ? 'font-semibold' : ''}
                >
                  {SIZE_NAMES[s]}
                </DropdownMenuItem>
              ))}
              <DropdownMenuSeparator />
              {/* Theme */}
              {SKINS.filter(s => ['classic', 'dark', 'sepia'].includes(s.id)).map(s => (
                <DropdownMenuItem
                  key={s.id}
                  onClick={() => handleSelectSkin(s.id)}
                  className={skinId === s.id ? 'font-semibold' : ''}
                >
                  {s.name}
                </DropdownMenuItem>
              ))}
              <DropdownMenuSeparator />
              {/* Import */}
              <DropdownMenuItem onClick={() => openImport('calendar-file')}>
                <CalendarDays className="h-4 w-4 mr-2" />
                Import Calendar File
              </DropdownMenuItem>
              <DropdownMenuItem onClick={() => openImport('google-calendar')}>
                <Globe className="h-4 w-4 mr-2" />
                Import Google Calendar
              </DropdownMenuItem>
              <DropdownMenuItem onClick={() => openImport('text')}>
                <FileText className="h-4 w-4 mr-2" />
                Import from Text
              </DropdownMenuItem>
              <DropdownMenuItem onClick={() => openImport('voice')}>
                <Mic className="h-4 w-4 mr-2" />
                Import from Voice
              </DropdownMenuItem>
              <DropdownMenuSeparator />
              <DropdownMenuItem onClick={onSignUpWithTimeline}>
                Continue with this timeline →
              </DropdownMenuItem>
              <DropdownMenuSeparator />
              <TranslateMenuContent />
            </div>
          </DropdownMenuContent>
        </DropdownMenu>
        </div>
      </div>

      {/* Example overlay text — fixed over full width incl. sidebar, own-lanes height only */}
      <div
        className="pointer-events-none fixed left-0 right-0 flex items-center justify-center"
        style={{
          top: '48px',
          bottom: '45%',
          zIndex: 100,
          opacity: showExampleOverlay ? 1 : 0,
          transform: showExampleOverlay ? 'translateY(0)' : 'translateY(80vh)',
          transition: 'opacity 4000ms ease-in, transform 4000ms ease-in',
        }}
      >
        <p
          className="text-4xl font-black text-foreground/45 select-none text-center leading-tight"
          style={{ transform: 'rotate(-45deg)', letterSpacing: '0.04em' }}
        >
          Example life<br />adjust to your story!!
        </p>
      </div>

      <div
        className="flex-1 overflow-hidden flex flex-col"
        onClick={() => setShowExampleOverlay(false)}
      >
        <TimelineContainer
          lanes={lanes}
          events={displayedEvents}
          yearStart={yearStart}
          yearEnd={yearEnd}
          pixelsPerYear={pixelsPerYear}
          onZoom={setPixelsPerYear}
          dataYearMin={dataYearMin}
          dataYearMax={dataYearMax}
          onToggleVisibility={toggleLaneVisibility}
          onMoveLane={moveLane}
          onEditLane={handleEditLane}
          onDeleteLane={handleDeleteLane}
          onEventClick={handleEventClick}
          onLaneClick={handleLaneClick}
          onLaneDragRange={handleLaneDragRange}
          onEventDrop={handleEventDrop}
          personaEvents={activePersonaEvents}
          personas={personas}
          personaDisplayModes={personaDisplayModes}
          scrollToTodayRef={scrollToTodayRef}
          scrollToEventRef={scrollToEventRef}
          onTodayVisibilityChange={setTodayOffScreen}
          lifeSpan={currentTimeline?.start_year != null ? { birthYear: currentTimeline.start_year, endYear: currentTimeline.end_year ?? null, color: currentTimeline.color ?? undefined } : undefined}
          overlayEvents={[]}
          overlayDisplayModes={new Map()}
          activeOverlayTimelines={[]}
          timelineName={localStorage.getItem('timeline_guide_completed') ? (currentTimeline?.name ?? 'My Life') : 'Example'}
        />
      </div>

      {popover && (
        <EventPopover
          event={popover.event}
          anchorEl={popover.anchor}
          anchorX={popover.x}
          anchorY={popover.y}
          laneEmoji={lanes.find(l => l.id === popover.event.laneId)?.emoji}
          laneName={lanes.find(l => l.id === popover.event.laneId)?.name ?? ''}
          onEdit={handleEditEvent}
          onDelete={handleDeleteEvent}
          onClose={() => setPopover(null)}
        />
      )}

      <EventDialog open={eventDialogOpen} onOpenChange={setEventDialogOpen} lanes={lanes} editingEvent={editingEvent} onSave={handleSaveEvent} defaultLaneId={defaultLaneId} defaultStartYear={defaultStartYear} defaultEndYear={defaultEndYear} />
      <LaneDialog open={laneDialogOpen} onOpenChange={setLaneDialogOpen} editingLane={editingLane} onSave={handleSaveLane} />
      <DeleteConfirmDialog open={deleteDialog.open} onOpenChange={open => setDeleteDialog(p => ({ ...p, open }))} title={deleteDialog.title} description={deleteDialog.description} onConfirm={deleteDialog.onConfirm} />
      <SkinDialog open={skinDialogOpen} onOpenChange={setSkinDialogOpen} />
      <ImportDialog open={importDialogOpen} onOpenChange={setImportDialogOpen} defaultTab={importTab} lanes={lanes} addEvent={addEvent} addLane={addLane} />
      <SearchDialog open={searchOpen} onOpenChange={setSearchOpen} events={events} lanes={lanes} onNavigate={handleSearchNavigate} />
      <GuideOverlay open={guideOpen} onClose={() => setGuideOpen(false)} />
    </div>
  )
}

export function DemoTimelineView({ onSignUpWithTimeline }: DemoTimelineViewProps) {
  return (
    <TooltipProvider>
      <UiSizeProvider storageKey="ui-size-demo" initialSize="small">
        <DemoTimelineViewInner onSignUpWithTimeline={onSignUpWithTimeline} />
      </UiSizeProvider>
    </TooltipProvider>
  )
}
