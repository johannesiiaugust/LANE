import { useState, useCallback, useSyncExternalStore, useRef, useMemo, useEffect } from 'react'
import { useTitle } from '@/hooks/useTitle'
import type { Lane, TimelineEvent } from '@/types/timeline'
import { useTimelineContext, TimelineProvider } from '@/contexts/TimelineContext'
import { useAuth } from '@/contexts/AuthContext'
import { usePersonas } from '@/hooks/usePersonas'
import { useTimelineOverlays } from '@/hooks/useTimelineOverlays'
import { useExternalOverlays } from '@/hooks/useExternalOverlays'
import { getSharedWithMe } from '@/lib/api'
import type { SharedWithMeItem } from '@/types/database'
import { useProfile } from '@/hooks/useProfile'
import { isOpenAIConfigured } from '@/lib/openai'
import { birthDateToFloatYear } from '@/lib/utils'
import { useTrack } from '@/lib/analytics'
import { OnboardingQuestionnaire } from '@/components/onboarding/OnboardingQuestionnaire'
import { Toolbar, type AppView } from '@/components/Toolbar'
import { TimelineContainer } from '@/components/timeline/TimelineContainer'
import { TimelineOverview } from '@/components/TimelineOverview'
import { KanbanBoard } from '@/components/kanban/KanbanBoard'
import { AnalyticsDashboard } from '@/components/AnalyticsDashboard'
import { LenaAssistant } from '@/components/LenaAssistant'
import { EventPopover } from '@/components/EventPopover'
import { EventDialog } from '@/components/dialogs/EventDialog'
import { LaneDialog } from '@/components/dialogs/LaneDialog'
import { DeleteConfirmDialog } from '@/components/dialogs/DeleteConfirmDialog'
import { TooltipProvider } from '@/components/ui/tooltip'
import { AuthPage } from '@/components/auth/AuthPage'
import { UpdatePasswordForm } from '@/components/auth/UpdatePasswordForm'
import { UiSizeProvider } from '@/contexts/UiSizeContext'
import { SkinProvider } from '@/contexts/SkinContext'
import { PublicProfilePage } from '@/components/PublicProfilePage'
import { AboutPage } from '@/components/AboutPage'
import { TermsPage } from '@/components/TermsPage'
import { TestI18nPage } from '@/components/TestI18nPage'
import { Footer } from '@/components/Footer'
import {
  LanguageProvider,
  useUrlLang,
  useTranslation,
  stripLangPrefix,
  localizedPath,
  loadTranslation,
  en,
  type Lang,
  type Translations,
  SUPPORTED_LANGS,
} from '@/i18n'

// ── Top-level route detection ─────────────────────────────────────────────────

const RESERVED_PATHS = new Set(['/', '/kanban', '/overview', '/about', '/terms', '/demo', '/anal', '/test-i18n'])
const USERNAME_PATH_RE = /^\/([a-z0-9_]{3,32})$/
const USERNAME_TIMELINE_PATH_RE = /^\/([a-z0-9_]{3,32})\/(\d+)$/

type TopLevelRoute =
  | { type: 'app' }
  | { type: 'about' }
  | { type: 'terms' }
  | { type: 'demo' }
  | { type: 'test-i18n' }
  | { type: 'public'; username: string; timelineIndex?: number }

// Returns a string (primitive) so useSyncExternalStore can compare with Object.is
function getTopLevelRouteKey(): string {
  const p = stripLangPrefix(window.location.pathname)
  if (p === '/about') return 'about'
  if (p === '/terms') return 'terms'
  if (p === '/demo') return 'demo'
  if (p === '/test-i18n') return 'test-i18n'
  if (RESERVED_PATHS.has(p)) return 'app'
  const matchWithIndex = p.match(USERNAME_TIMELINE_PATH_RE)
  if (matchWithIndex) return `public:${matchWithIndex[1]}:${matchWithIndex[2]}`
  const match = p.match(USERNAME_PATH_RE)
  if (match && !SUPPORTED_LANGS.includes(match[1] as Lang)) return `public:${match[1]}`
  return 'app'
}

function useTopLevelRoute(): TopLevelRoute {
  const key = useSyncExternalStore(
    cb => {
      window.addEventListener('popstate', cb)
      return () => window.removeEventListener('popstate', cb)
    },
    getTopLevelRouteKey,
  )
  if (key === 'about') return { type: 'about' }
  if (key === 'terms') return { type: 'terms' }
  if (key === 'demo') return { type: 'demo' }
  if (key === 'test-i18n') return { type: 'test-i18n' }
  if (key.startsWith('public:')) {
    const parts = key.slice(7).split(':')
    const username = parts[0]
    const timelineIndex = parts[1] ? parseInt(parts[1], 10) : undefined
    return { type: 'public', username, timelineIndex }
  }
  return { type: 'app' }
}

// Lightweight URL-based routing (no dependency needed)
function getViewFromPath(): AppView {
  const p = stripLangPrefix(window.location.pathname)
  if (p === '/kanban') return 'kanban'
  if (p === '/overview') return 'overview'
  if (p === '/anal') return 'anal'
  return 'timeline'
}

function useAppView(): [AppView, (view: AppView) => void] {
  const lang = useUrlLang()
  const view = useSyncExternalStore(
    (cb) => {
      window.addEventListener('popstate', cb)
      return () => window.removeEventListener('popstate', cb)
    },
    getViewFromPath,
  )

  const setView = useCallback((v: AppView) => {
    const base = v === 'kanban' ? '/kanban' : v === 'overview' ? '/overview' : v === 'anal' ? '/anal' : '/'
    const path = localizedPath(base, lang)
    if (window.location.pathname !== path) {
      window.history.pushState(null, '', path)
      // Trigger re-render via popstate
      window.dispatchEvent(new PopStateEvent('popstate'))
    }
  }, [lang])

  return [view, setView]
}

function TimelineView() {
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
    isFirstLogin,
    clearFirstLogin,
    createTimeline,
    notifyVisibleWindow,
  } = useTimelineContext()

  const selectedTimeline = timelines.find(t => t.id === selectedTimelineId)
  const { t } = useTranslation()

  useTitle(selectedTimeline ? `LifeLANE — ${selectedTimeline.name}` : 'LifeLANE')

  // Analytics page-view tracking
  useTrack()

  const { user } = useAuth()
  const { profile } = useProfile()

  const birthYear = profile?.birth_date ? birthDateToFloatYear(profile.birth_date) : null

  const onboardingKey = user ? `timeline_onboarding_complete_${user.id}` : ''
  const [showQuestionnaire, setShowQuestionnaire] = useState(() => {
    if (!isFirstLogin) return false
    if (!isOpenAIConfigured()) return false
    if (onboardingKey && localStorage.getItem(onboardingKey)) return false
    return true
  })

  // Show questionnaire when isFirstLogin becomes true after initial render
  const prevFirstLoginRef = useRef(isFirstLogin)
  if (isFirstLogin && !prevFirstLoginRef.current && isOpenAIConfigured() && !localStorage.getItem(onboardingKey)) {
    prevFirstLoginRef.current = true
    // Schedule state update
    setTimeout(() => setShowQuestionnaire(true), 0)
  }

  const handleQuestionnaireComplete = useCallback(() => {
    if (onboardingKey) localStorage.setItem(onboardingKey, '1')
    clearFirstLogin()
    setShowQuestionnaire(false)
  }, [onboardingKey, clearFirstLogin])

  const {
    personas,
    activePersonaEvents,
    activePersonaIds,
    togglePersona,
    alignedPersonaIds,
    togglePersonaAlignment,
    personaDisplayModes,
    setPersonaDisplayMode,
  } = usePersonas(selectedTimeline?.start_year ?? null)

  const {
    activeOverlayIds,
    toggleOverlay,
    overlayAlignedIds,
    toggleOverlayAlignment,
    overlayDisplayModes,
    setOverlayDisplayMode,
    activeOverlayEvents,
    activeOverlayTimelines,
  } = useTimelineOverlays()

  const {
    stored: externalOverlays,
    activeIds: externalActiveIds,
    alignedIds: externalAlignedIds,
    displayModes: externalDisplayModes,
    externalOverlayEvents,
    externalOverlayTimelines,
    addExternalOverlay,
    removeExternalOverlay,
    toggleActive: toggleExternalActive,
    toggleAlignment: toggleExternalAlignment,
    setDisplayMode: setExternalDisplayMode,
  } = useExternalOverlays()

  const mergedOverlayDisplayModes = useMemo(() => {
    const m = new Map(overlayDisplayModes)
    for (const [k, v] of externalDisplayModes) m.set(k, v)
    return m
  }, [overlayDisplayModes, externalDisplayModes])

  const [sharedWithMe, setSharedWithMe] = useState<SharedWithMeItem[]>([])
  useEffect(() => {
    if (user) getSharedWithMe().then(setSharedWithMe)
  }, [user])

  // URL-synced view state
  const [activeView, setActiveView] = useAppView()
  const [lenaEnabled, setLinaEnabled] = useState(() => localStorage.getItem('lena_enabled') !== 'false')
  const scrollToTodayRef = useRef<(() => void) | null>(null)
  const scrollToEventRef = useRef<((event: TimelineEvent) => void) | null>(null)
  const [todayOffScreen, setTodayOffScreen] = useState<{ direction: 'left' | 'right' } | null>(null)
  const [requestCreateTimeline, setRequestCreateTimeline] = useState(false)

  // Max-events filter: show the N longest-duration events (point events have duration 0)
  const maxEvents = 1000
  const [navigatedEventId, setNavigatedEventId] = useState<string | null>(null)
  const displayedEvents = useMemo(() => {
    const sorted = [...events].sort((a, b) => {
      const durA = a.type === 'range' && a.endYear != null ? a.endYear - a.startYear : 0
      const durB = b.type === 'range' && b.endYear != null ? b.endYear - b.startYear : 0
      return durB - durA
    })
    const top = sorted.slice(0, Math.max(1, maxEvents))
    // Always include an event the user navigated to, even if outside the limit
    if (navigatedEventId && !top.find(e => e.id === navigatedEventId)) {
      const target = events.find(e => e.id === navigatedEventId)
      if (target) top.push(target)
    }
    return top
  }, [events, maxEvents, navigatedEventId])

  const allOverlayEvents = useMemo(
    () => [...activeOverlayEvents, ...externalOverlayEvents],
    [activeOverlayEvents, externalOverlayEvents],
  )

  // Apply the same top-N filter per overlay timeline
  const displayedOverlayEvents = useMemo(() => {
    const byTimeline = new Map<string, typeof allOverlayEvents>()
    for (const e of allOverlayEvents) {
      const arr = byTimeline.get(e.timeline_id) ?? []
      arr.push(e)
      byTimeline.set(e.timeline_id, arr)
    }
    const result: typeof allOverlayEvents = []
    for (const [, evts] of byTimeline) {
      const sorted = [...evts].sort((a, b) => {
        const durA = a.type === 'range' && a.end_year != null ? a.end_year - a.start_year : 0
        const durB = b.type === 'range' && b.end_year != null ? b.end_year - b.start_year : 0
        return durB - durA
      })
      result.push(...sorted.slice(0, Math.max(1, maxEvents)))
    }
    return result
  }, [allOverlayEvents, maxEvents])

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
  const [deleteDialog, setDeleteDialog] = useState<{
    open: boolean
    title: string
    description: string
    onConfirm: () => void
  }>({ open: false, title: '', description: '', onConfirm: () => {} })

  // Event click -> show popover
  const handleEventClick = useCallback((event: TimelineEvent, element: HTMLElement, clientX: number, clientY: number) => {
    setPopover({ event, anchor: element, x: clientX, y: clientY })
  }, [])

  // Toolbar -> Add Event
  const handleAddEvent = useCallback(() => {
    setEditingEvent(null)
    setDefaultLaneId(undefined)
    setDefaultStartYear(undefined)
    setDefaultEndYear(undefined)
    setEventDialogOpen(true)
  }, [])

  // Toolbar -> Add Lane
  const handleAddLane = useCallback(() => {
    setEditingLane(null)
    setLaneDialogOpen(true)
  }, [])

  // Click on lane -> Add point event pre-filled with lane + year
  const handleLaneClick = useCallback((laneId: string, year: number) => {
    setEditingEvent(null)
    setDefaultLaneId(laneId)
    setDefaultStartYear(year)
    setDefaultEndYear(undefined)
    setEventDialogOpen(true)
  }, [])

  // Drag on lane -> Add range event pre-filled with start + end year
  const handleLaneDragRange = useCallback((laneId: string, startYear: number, endYear: number) => {
    setEditingEvent(null)
    setDefaultLaneId(laneId)
    setDefaultStartYear(startYear)
    setDefaultEndYear(endYear)
    setEventDialogOpen(true)
  }, [])

  // Popover -> Edit
  const handleEditEvent = useCallback((event: TimelineEvent) => {
    setPopover(null)
    setEditingEvent(event)
    setDefaultLaneId(undefined)
    setDefaultStartYear(undefined)
    setDefaultEndYear(undefined)
    setEventDialogOpen(true)
  }, [])

  // Popover -> Delete
  const handleDeleteEvent = useCallback((event: TimelineEvent) => {
    setPopover(null)
    setDeleteDialog({
      open: true,
      title: t('deleteConfirm.deleteEvent'),
      description: t('deleteConfirm.deleteEventDesc', { title: event.title }),
      onConfirm: () => {
        deleteEvent(event.id)
        setDeleteDialog(prev => ({ ...prev, open: false }))
      },
    })
  }, [deleteEvent, t])

  // Sidebar -> Edit Lane
  const handleEditLane = useCallback((lane: Lane) => {
    setEditingLane(lane)
    setLaneDialogOpen(true)
  }, [])

  // Sidebar -> Delete Lane
  const handleDeleteLane = useCallback((lane: Lane) => {
    setDeleteDialog({
      open: true,
      title: t('deleteConfirm.deleteLane'),
      description: t('deleteConfirm.deleteLaneDesc', { name: lane.name }),
      onConfirm: () => {
        deleteLane(lane.id)
        setDeleteDialog(prev => ({ ...prev, open: false }))
      },
    })
  }, [deleteLane, t])

  // Save event (add or update)
  const handleSaveEvent = useCallback((data: Omit<TimelineEvent, 'id'>) => {
    if (editingEvent) {
      updateEvent(editingEvent.id, data)
    } else {
      addEvent(data)
    }
  }, [editingEvent, updateEvent, addEvent])

  // Drag-drop: move or extend event
  const handleEventDrop = useCallback((eventId: string, newLaneId: string, newStartYear: number, newEndYear: number | undefined) => {
    updateEvent(eventId, { laneId: newLaneId, startYear: newStartYear, ...(newEndYear !== undefined ? { endYear: newEndYear } : { endYear: undefined }) })
  }, [updateEvent])

  // Save lane (add or update)
  const handleSaveLane = useCallback((data: { name: string; color: string; visible: boolean; emoji?: string }) => {
    if (editingLane) {
      updateLane(editingLane.id, data)
    } else {
      addLane(data)
    }
  }, [editingLane, updateLane, addLane])

  return (
    <TooltipProvider>
      {showQuestionnaire && birthYear && (
        <OnboardingQuestionnaire
          lanes={lanes}
          addEvent={addEvent}
          birthYear={birthYear}
          onComplete={handleQuestionnaireComplete}
          onSkip={handleQuestionnaireComplete}
        />
      )}
      <div className="flex flex-col h-screen bg-background overflow-hidden">
        <Toolbar
          pixelsPerYear={pixelsPerYear}
          onPixelsPerYearChange={setPixelsPerYear}
          onAddEvent={handleAddEvent}
          onAddLane={handleAddLane}
          personas={personas}
          activePersonaIds={activePersonaIds}
          onTogglePersona={togglePersona}
          alignedPersonaIds={alignedPersonaIds}
          onTogglePersonaAlignment={togglePersonaAlignment}
          personaDisplayModes={personaDisplayModes}
          onSetPersonaDisplayMode={setPersonaDisplayMode}
          activeView={activeView}
          onSetActiveView={setActiveView}
          onScrollToToday={() => scrollToTodayRef.current?.()}
          todayOffScreen={todayOffScreen}
          lanes={lanes}
          events={events}
          addEvent={addEvent}
          addLane={addLane}
          onSearchNavigate={handleSearchNavigate}
          activeOverlayIds={activeOverlayIds}
          onToggleOverlay={toggleOverlay}
          overlayAlignedIds={overlayAlignedIds}
          onToggleOverlayAlignment={toggleOverlayAlignment}
          overlayDisplayModes={overlayDisplayModes}
          onSetOverlayDisplayMode={setOverlayDisplayMode}
          externalStored={externalOverlays}
          externalActiveIds={externalActiveIds}
          externalAlignedIds={externalAlignedIds}
          externalDisplayModes={externalDisplayModes}
          onAddExternal={addExternalOverlay}
          onRemoveExternal={removeExternalOverlay}
          onToggleExternalActive={toggleExternalActive}
          onToggleExternalAlignment={toggleExternalAlignment}
          onSetExternalDisplayMode={setExternalDisplayMode}
          mainStartYear={selectedTimeline?.start_year}
          sharedWithMe={sharedWithMe}
          onAddTimeline={() => setRequestCreateTimeline(true)}
          requestCreateTimeline={requestCreateTimeline}
          onRequestCreateTimelineHandled={() => setRequestCreateTimeline(false)}
          lenaEnabled={lenaEnabled}
          onToggleLena={() => setLinaEnabled(prev => {
            const next = !prev
            localStorage.setItem('lena_enabled', String(next))
            return next
          })}
        />

        {activeView === 'overview' ? (
          <TimelineOverview onSelectTimeline={() => setActiveView('timeline')} selectedTimelineEvents={events} />
        ) : activeView === 'anal' ? (
          <AnalyticsDashboard />
        ) : activeView === 'timeline' ? (
          <>
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
              lifeSpan={selectedTimeline?.start_year != null ? { birthYear: selectedTimeline.start_year, endYear: selectedTimeline.end_year ?? null, color: selectedTimeline.color ?? undefined } : undefined}
              onTodayVisibilityChange={setTodayOffScreen}
              overlayEvents={displayedOverlayEvents}
              overlayDisplayModes={mergedOverlayDisplayModes}
              activeOverlayTimelines={[...activeOverlayTimelines, ...externalOverlayTimelines]}
              timelineName={selectedTimeline?.name}
              onVisibleWindowChange={notifyVisibleWindow}
              onRemovePersona={togglePersona}
              alignedPersonaIds={alignedPersonaIds}
              onTogglePersonaAlignment={togglePersonaAlignment}
            />

            {/* Event popover */}
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

            {/* Dialogs */}
            <EventDialog
              open={eventDialogOpen}
              onOpenChange={setEventDialogOpen}
              lanes={lanes}
              events={events}
              editingEvent={editingEvent}
              onSave={handleSaveEvent}
              defaultLaneId={defaultLaneId}
              defaultStartYear={defaultStartYear}
              defaultEndYear={defaultEndYear}
              userId={user?.id}
            />
            <LaneDialog
              open={laneDialogOpen}
              onOpenChange={setLaneDialogOpen}
              editingLane={editingLane}
              onSave={handleSaveLane}
            />
            <DeleteConfirmDialog
              open={deleteDialog.open}
              onOpenChange={open => setDeleteDialog(prev => ({ ...prev, open }))}
              title={deleteDialog.title}
              description={deleteDialog.description}
              onConfirm={deleteDialog.onConfirm}
            />
          </>
        ) : (
          <KanbanBoard />
        )}
        <Footer />
      </div>
      {lenaEnabled && (
        <LenaAssistant
          lanes={lanes}
          events={events}
          addEvent={addEvent}
          updateEvent={updateEvent}
          deleteEvent={deleteEvent}
          addLane={addLane}
          updateLane={updateLane}
          deleteLane={deleteLane}
          createTimeline={createTimeline}
        />
      )}
    </TooltipProvider>
  )
}

function AppRouter() {
  const route = useTopLevelRoute()
  const { user, loading, isRecovery } = useAuth()
  const { navigate: nav } = useTranslation()

  if (route.type === 'about') {
    return <AboutPage />
  }

  if (route.type === 'terms') {
    return <TermsPage />
  }

  if (route.type === 'test-i18n') {
    return <TestI18nPage />
  }

  if (route.type === 'demo') {
    if (!loading && user) {
      nav('/')
      return null
    }
    return <AuthPage />
  }

  // Public profile pages render without auth
  if (route.type === 'public') {
    return <PublicProfilePage username={route.username} timelineIndex={route.timelineIndex} />
  }

  if (loading) {
    return (
      <div className="flex min-h-screen items-center justify-center">
        <div className="h-8 w-8 animate-spin rounded-full border-4 border-primary border-t-transparent" />
      </div>
    )
  }

  if (isRecovery) {
    return <UpdatePasswordForm />
  }

  if (!user) {
    return <AuthPage />
  }

  return (
    <SkinProvider>
      <UiSizeProvider>
        <TimelineProvider>
          <TimelineView />
        </TimelineProvider>
      </UiSizeProvider>
    </SkinProvider>
  )
}

// Languages shown in the switcher + eligible for auto-detection
const DISPLAY_LANGS = ['de', 'fr', 'es', 'it', 'nl', 'sv'] as const
export type DisplayLang = (typeof DISPLAY_LANGS)[number] | 'en'

function App() {
  const lang = useUrlLang()
  const [translations, setTranslations] = useState<Translations>(lang === 'en' ? en : en)

  // Auto-detect language from browser locale on first visit
  useEffect(() => {
    if (localStorage.getItem('lang_detected')) return
    localStorage.setItem('lang_detected', '1')
    if (lang !== 'en') return // URL already has a lang prefix
    const browserCode = navigator.language?.split('-')[0].toLowerCase()
    const detected = DISPLAY_LANGS.find(l => l === browserCode)
    if (detected) {
      const currentPath = stripLangPrefix(window.location.pathname)
      const target = localizedPath(currentPath, detected as Lang)
      window.history.replaceState(null, '', target)
      window.dispatchEvent(new PopStateEvent('popstate'))
    }
  }, []) // eslint-disable-line react-hooks/exhaustive-deps

  useEffect(() => {
    if (lang === 'en') {
      setTranslations(en)
    } else {
      loadTranslation(lang).then(setTranslations)
    }
  }, [lang])

  return (
    <LanguageProvider lang={lang} translations={translations}>
      <AppRouter />
    </LanguageProvider>
  )
}

export default App
