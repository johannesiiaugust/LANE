import { useState } from 'react'
import { useTitle } from '@/hooks/useTitle'
import { useTranslation } from '@/i18n'
import { useLanguage } from '@/i18n'
import { WelcomeModal } from '@/components/WelcomeModal'
import { SignInForm } from './SignInForm'
import { SignUpForm } from './SignUpForm'
import { ForgotPasswordForm } from './ForgotPasswordForm'
import { CheckEmailMessage } from './CheckEmailMessage'
import { DemoTimelineProvider } from '@/contexts/DemoTimelineContext'
import { DemoTimelineView } from '@/components/DemoTimelineView'
import { SkinProvider, useSkin, SKINS, type SkinId } from '@/contexts/SkinContext'
import { UiSizeProvider, useSizeConfig, type UiSize } from '@/contexts/UiSizeContext'
import { Popover, PopoverContent, PopoverTrigger } from '@/components/ui/popover'
import { Button } from '@/components/ui/button'
import { Footer } from '@/components/Footer'
import { MoreHorizontal, Search } from 'lucide-react'
import { LanguageSwitcherInline } from '@/components/LanguageSwitcher'
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu'

type AuthMode = 'landing' | 'sign-in' | 'sign-up' | 'forgot-password' | 'check-email'

function AuthHeader({ onOpenAuth, onOpenSearch }: { onOpenAuth: () => void; onOpenSearch: () => void }) {
  const { t } = useTranslation()
  const { size, setSize } = useSizeConfig()
  const { skinId, setSkinId } = useSkin()
  const SIZE_NAMES: Record<UiSize, string> = { small: t('toolbar.small'), medium: t('toolbar.medium'), large: t('toolbar.large'), fitscreen: t('toolbar.fitScreen') }

  return (
    <div className="shrink-0 border-b shadow-sm bg-background px-4 py-3 flex items-center justify-between gap-4">
      {/* Brand + tagline */}
      <div className="shrink-0">
        <div className="text-xl font-bold leading-tight">LifeLANE</div>
        <div className="text-xs text-muted-foreground italic">{t('auth.theOSForYourLife')}</div>
      </div>

      {/* Short description — hidden on small screens */}
      <p className="hidden sm:block text-sm text-muted-foreground text-center flex-1 max-w-md leading-snug">
        {t('auth.visualizeLives')}
      </p>

      {/* Sign in + 3-dot */}
      <div className="flex items-center gap-2 shrink-0">
        <Button size="sm" onClick={onOpenAuth}>{t('auth.signIn')}</Button>

        <DropdownMenu>
          <DropdownMenuTrigger asChild>
            <Button variant="outline" size="sm" className="px-2">
              <MoreHorizontal className="h-4 w-4" />
            </Button>
          </DropdownMenuTrigger>
          <DropdownMenuContent align="end" className="w-48">
            {/* Search */}
            <DropdownMenuItem onClick={onOpenSearch}>
              <Search className="h-4 w-4 mr-2" />
              {t('toolbar.searchEvents')}
            </DropdownMenuItem>
            <DropdownMenuSeparator />
            {/* Size */}
            {(['small', 'large', 'fitscreen'] as UiSize[]).map(s => (
              <DropdownMenuItem key={s} onClick={() => setSize(s)} className={size === s ? 'font-semibold' : ''}>
                {SIZE_NAMES[s]}
              </DropdownMenuItem>
            ))}
            <DropdownMenuSeparator />
            {/* Theme */}
            {SKINS.filter(s => ['classic', 'dark', 'sepia'].includes(s.id)).map(s => (
              <DropdownMenuItem key={s.id} onClick={() => setSkinId(s.id as SkinId)} className={skinId === s.id ? 'font-semibold' : ''}>
                {s.name}
              </DropdownMenuItem>
            ))}
            <DropdownMenuSeparator />
            <LanguageSwitcherInline />
          </DropdownMenuContent>
        </DropdownMenu>
      </div>
    </div>
  )
}

export function AuthPage() {
  const { t } = useTranslation()
  const lang = useLanguage()
  useTitle(`LifeLANE — ${t('auth.startYourLife')}`)
  const [mode, setMode] = useState<AuthMode>('landing')
  const [authOpen, setAuthOpen] = useState(false)
  const [fromDemo, setFromDemo] = useState(false)
  const [demoSearchOpen, setDemoSearchOpen] = useState(false)
  const [welcomeOpen, setWelcomeOpen] = useState(() => !localStorage.getItem('welcome_shown'))
  const [welcomeDone, setWelcomeDone] = useState(() => !!localStorage.getItem('welcome_shown'))

  function handleSignUpWithTimeline() {
    localStorage.setItem('timeline_import_demo', '1')
    setFromDemo(true)
    setMode('sign-up')
    setTimeout(() => setAuthOpen(true), 50)
  }

  function openLanding() {
    setMode('landing')
    setAuthOpen(true)
  }

  function handleWelcomeDismiss() {
    localStorage.setItem('welcome_shown', '1')
    setWelcomeOpen(false)
    setWelcomeDone(true)
  }

  return (
    <SkinProvider>
      <UiSizeProvider storageKey="ui-size-demo" initialSize="small">
        <div className="flex flex-col h-screen bg-background overflow-hidden">
          {/* Top header bar */}
          <Popover open={authOpen} onOpenChange={setAuthOpen}>
            <PopoverTrigger asChild>
              {/* Hidden trigger — we open programmatically */}
              <span />
            </PopoverTrigger>

            <AuthHeader onOpenAuth={openLanding} onOpenSearch={() => setDemoSearchOpen(true)} />

            <PopoverContent align="end" sideOffset={8} className="w-80 p-4 max-h-[85vh] overflow-y-auto">
              {mode === 'landing' && (
                <div className="space-y-3">
                  <p className="text-sm font-semibold">{t('auth.getStarted')}</p>
                  <Button className="w-full" onClick={() => { setFromDemo(true); localStorage.setItem('timeline_import_demo', '1'); setMode('sign-up') }}>
                    {t('auth.continueWithTimeline')}
                  </Button>
                  <Button variant="outline" className="w-full" onClick={() => { setFromDemo(false); setMode('sign-up') }}>
                    {t('auth.createAccountBlank')}
                  </Button>
                  <p className="text-center text-xs text-muted-foreground pt-1">
                    {t('auth.alreadyHaveAccount')}{' '}
                    <button className="underline hover:text-foreground" onClick={() => setMode('sign-in')}>{t('auth.signIn')}</button>
                  </p>
                </div>
              )}
              {mode === 'sign-in' && (
                <SignInForm
                  onSwitchToSignUp={() => setMode('sign-up')}
                  onSwitchToForgotPassword={() => setMode('forgot-password')}
                />
              )}
              {mode === 'sign-up' && (
                <SignUpForm
                  onSwitchToSignIn={() => setMode('sign-in')}
                  onSignUpSuccess={() => setMode('check-email')}
                  fromDemo={fromDemo}
                />
              )}
              {mode === 'forgot-password' && (
                <ForgotPasswordForm
                  onSwitchToSignIn={() => setMode('sign-in')}
                  onResetSuccess={() => setMode('check-email')}
                />
              )}
              {mode === 'check-email' && (
                <CheckEmailMessage onBackToSignIn={() => setMode('sign-in')} />
              )}
            </PopoverContent>
          </Popover>

          {/* Demo timeline fills remaining space */}
          <div className="flex-1 overflow-hidden">
            <DemoTimelineProvider>
              <DemoTimelineView onSignUpWithTimeline={handleSignUpWithTimeline} searchOpen={demoSearchOpen} onSearchOpenChange={setDemoSearchOpen} welcomeDone={welcomeDone} />
            </DemoTimelineProvider>
          </div>
          <Footer />
        </div>
      </UiSizeProvider>

      {welcomeOpen && (
        <WelcomeModal
          currentLang={lang}
          onDismiss={handleWelcomeDismiss}
        />
      )}
    </SkinProvider>
  )
}
