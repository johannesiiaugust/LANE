import { useTranslation, SUPPORTED_LANGS, localizedPath as lp, type Lang } from '@/i18n'
import { Footer } from '@/components/Footer'

export function TestI18nPage() {
  const { t, lang, navigate } = useTranslation()

  // Sample keys to test across all sections
  const testKeys = [
    'common.cancel', 'common.save', 'common.delete', 'common.edit', 'common.close',
    'common.loading', 'common.create', 'common.done', 'common.search', 'common.email',
    'common.password', 'common.title', 'common.description', 'common.name', 'common.color',
    'auth.signIn', 'auth.signUp', 'auth.signOut', 'auth.continueWithGoogle',
    'auth.forgotPassword', 'auth.sendResetLink', 'auth.checkYourEmail',
    'auth.passwordsDoNotMatch', 'auth.startYourLife', 'auth.getStarted',
    'auth.theOSForYourLife', 'auth.visualizeLives',
    'toolbar.addEvent', 'toolbar.addLane', 'toolbar.addTimeline', 'toolbar.searchEvents',
    'toolbar.zoomIn', 'toolbar.zoomOut', 'toolbar.backToToday', 'toolbar.editProfile',
    'toolbar.analytics', 'toolbar.small', 'toolbar.large', 'toolbar.fitScreen',
    'about.yourEntireLife', 'about.inOneView', 'about.startMappingLife',
    'about.builtForClarity', 'about.sevenSwimLanes',
    'about.placeAndTravel', 'about.workAndCareer', 'about.relations',
    'about.wealthProjection', 'about.healthTimeline', 'about.importInSeconds',
    'about.perspectiveMode', 'about.howDoesYourLifeCompare',
    'about.futurePlanning', 'about.yourLifeIsntJustThePast',
    'about.openLifelane', 'about.noCreditCard',
    'ticker.trackWhereLived', 'ticker.mapCareerArc', 'ticker.visualizeRelationships',
    'ticker.projectFutureWealth', 'ticker.overlayAnyTimeline',
    'event.editEvent', 'event.addEvent', 'event.startDate', 'event.endDate',
    'event.moreTimeOptions', 'event.saveChanges',
    'lane.editLane', 'lane.addLane', 'lane.saveChanges',
    'deleteConfirm.deleteEvent', 'deleteConfirm.deleteLane',
    'search.searchEvents', 'search.noEventsFound',
    'popover.value', 'popover.ongoing',
    'profile.editProfile', 'profile.displayName', 'profile.bio',
    'skin.customTheme', 'skin.background', 'skin.font',
    'import.calendarFile', 'import.googleCalendar', 'import.text', 'import.voice',
    'kanban.kanbanBoard', 'kanban.manageTasks', 'kanban.newCard',
    'kanban.toDo', 'kanban.inProgress',
    'publicProfile.goHome', 'publicProfile.noTimelines',
    'footer.about',
    'terms.title', 'terms.back',
    'personas.personas',
  ]

  return (
    <div className="flex flex-col min-h-screen bg-background">
      {/* Nav */}
      <div className="border-b bg-background px-6 py-3 flex items-center justify-between">
        <button onClick={() => navigate('/')} className="text-xl font-bold hover:opacity-80">
          LifeLANE
        </button>
        <button onClick={() => navigate('/about')} className="text-sm text-muted-foreground hover:underline">
          {t('terms.back')}
        </button>
      </div>

      <div className="flex-1 max-w-5xl mx-auto w-full px-6 py-10 space-y-8">
        <div>
          <h1 className="text-3xl font-bold mb-2">i18n Test Page</h1>
          <p className="text-muted-foreground">
            Current language: <strong>{lang}</strong> ({t(`languages.${lang}`)})
          </p>
        </div>

        {/* Language switcher */}
        <div>
          <h2 className="text-lg font-semibold mb-3">Switch Language</h2>
          <div className="flex flex-wrap gap-2">
            {SUPPORTED_LANGS.map(l => (
              <a
                key={l}
                href={lp('/test-i18n', l as Lang)}
                onClick={e => {
                  e.preventDefault()
                  window.history.pushState(null, '', lp('/test-i18n', l as Lang))
                  window.dispatchEvent(new PopStateEvent('popstate'))
                }}
                className={`px-3 py-1.5 rounded-full text-sm font-medium border transition-colors ${
                  l === lang
                    ? 'bg-primary text-primary-foreground border-transparent'
                    : 'bg-background hover:bg-muted border-border'
                }`}
              >
                {t(`languages.${l}`)}
              </a>
            ))}
          </div>
        </div>

        {/* Route tests */}
        <div>
          <h2 className="text-lg font-semibold mb-3">Route Tests</h2>
          <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-2">
            {['/', '/about', '/terms', '/demo', '/kanban', '/overview', '/test-i18n'].map(route => (
              <a
                key={route}
                href={lp(route, lang as Lang)}
                onClick={e => {
                  e.preventDefault()
                  navigate(route)
                }}
                className="px-3 py-2 rounded-md border text-sm hover:bg-muted transition-colors text-center"
              >
                <div className="font-mono text-xs text-muted-foreground">{lp(route, lang as Lang)}</div>
                <div className="text-xs mt-0.5">{route}</div>
              </a>
            ))}
          </div>
        </div>

        {/* Translation keys test */}
        <div>
          <h2 className="text-lg font-semibold mb-3">Translation Keys ({testKeys.length})</h2>
          <div className="rounded-lg border overflow-hidden">
            <table className="w-full text-sm">
              <thead className="bg-muted">
                <tr>
                  <th className="text-left px-3 py-2 font-medium w-1/3">Key</th>
                  <th className="text-left px-3 py-2 font-medium">Translation</th>
                </tr>
              </thead>
              <tbody className="divide-y">
                {testKeys.map(key => {
                  const value = t(key)
                  const isFallback = value === key
                  return (
                    <tr key={key} className={isFallback ? 'bg-red-50 dark:bg-red-950/20' : ''}>
                      <td className="px-3 py-1.5 font-mono text-xs text-muted-foreground">{key}</td>
                      <td className={`px-3 py-1.5 ${isFallback ? 'text-red-500 font-medium' : ''}`}>
                        {isFallback ? `MISSING: ${key}` : value}
                      </td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </div>
        </div>

        {/* Parameterized translations test */}
        <div>
          <h2 className="text-lg font-semibold mb-3">Parameterized Translations</h2>
          <div className="space-y-2 text-sm">
            <p><strong>footer.copyright:</strong> {t('footer.copyright', { year: '2026' })}</p>
            <p><strong>deleteConfirm.deleteEventDesc:</strong> {t('deleteConfirm.deleteEventDesc', { title: 'My Birthday' })}</p>
            <p><strong>deleteConfirm.deleteLaneDesc:</strong> {t('deleteConfirm.deleteLaneDesc', { name: 'Work' })}</p>
            <p><strong>import.importedEvents:</strong> {t('import.importedEvents', { count: '5' })}</p>
            <p><strong>import.importingEvents:</strong> {t('import.importingEvents', { progress: '3', total: '10' })}</p>
          </div>
        </div>
      </div>

      <Footer />
    </div>
  )
}
