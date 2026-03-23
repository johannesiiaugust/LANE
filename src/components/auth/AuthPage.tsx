import { useState } from 'react'
import { useTitle } from '@/hooks/useTitle'
import { SignInForm } from './SignInForm'
import { SignUpForm } from './SignUpForm'
import { ForgotPasswordForm } from './ForgotPasswordForm'
import { CheckEmailMessage } from './CheckEmailMessage'
import { DemoTimelineProvider } from '@/contexts/DemoTimelineContext'
import { DemoTimelineView } from '@/components/DemoTimelineView'
import { SkinProvider } from '@/contexts/SkinContext'
import { Popover, PopoverContent, PopoverTrigger } from '@/components/ui/popover'
import { Footer } from '@/components/Footer'
import { Logo } from '@/components/Logo'

type AuthMode = 'landing' | 'sign-in' | 'sign-up' | 'forgot-password' | 'check-email'

const C = {
  yale: '#124e78',
  cream: '#f0f0c9',
  gold: '#f2bb05',
  orange: '#d74e09',
} as const

export function AuthPage() {
  useTitle('LifeLANE — Start your life')
  const [mode, setMode] = useState<AuthMode>('landing')
  const [authOpen, setAuthOpen] = useState(false)
  const [fromDemo, setFromDemo] = useState(false)

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

  return (
    <div
      className="flex flex-col h-screen overflow-hidden"
      style={{ backgroundColor: C.cream, fontFamily: "'Helvetica Neue', Helvetica, Arial, sans-serif" }}
    >
      {/* Top header bar */}
      <div
        className="shrink-0 shadow-sm px-6 md:px-10 py-3 flex items-center justify-between gap-4"
        style={{ backgroundColor: `${C.cream}cc`, backdropFilter: 'blur(20px) saturate(1.8)', borderBottom: `1px solid ${C.yale}15` }}
      >
        {/* Brand + tagline */}
        <div className="shrink-0">
          <Logo size="md" />
          <div className="text-xs italic" style={{ color: `${C.yale}88` }}>The operating system for your life</div>
        </div>

        {/* Short description — hidden on small screens */}
        <p className="hidden sm:block text-sm text-center flex-1 max-w-md leading-snug" style={{ color: `${C.yale}88` }}>
          Visualize lives. Compare with others. Shape your future.
        </p>

        {/* Auth popover anchored top-right */}
        <Popover open={authOpen} onOpenChange={setAuthOpen}>
          <PopoverTrigger asChild>
            <button
              className="px-4 py-1.5 rounded-lg text-sm font-semibold transition-all duration-200"
              style={{ backgroundColor: C.yale, color: C.cream, border: `1px solid ${C.yale}` }}
              onMouseEnter={e => { e.currentTarget.style.backgroundColor = '#0d3d5e' }}
              onMouseLeave={e => { e.currentTarget.style.backgroundColor = C.yale }}
              onClick={openLanding}
            >
              Start your life
            </button>
          </PopoverTrigger>
          <PopoverContent align="end" sideOffset={8} className="w-80 p-4 max-h-[85vh] overflow-y-auto">
            {mode === 'landing' && (
              <div className="space-y-3">
                <p className="text-sm font-semibold" style={{ color: C.yale }}>Get started</p>
                <button
                  className="w-full px-4 py-2 rounded-lg text-sm font-semibold transition-all duration-200"
                  style={{ backgroundColor: C.yale, color: C.cream }}
                  onClick={() => { setFromDemo(true); localStorage.setItem('timeline_import_demo', '1'); setMode('sign-up') }}
                >
                  Continue with this timeline
                </button>
                <button
                  className="w-full px-4 py-2 rounded-lg text-sm font-semibold transition-all duration-200 border"
                  style={{ borderColor: C.yale, color: C.yale }}
                  onClick={() => { setFromDemo(false); setMode('sign-up') }}
                >
                  Create account (blank timeline)
                </button>
                <p className="text-center text-xs text-muted-foreground pt-1">
                  Already have an account?{' '}
                  <button className="underline hover:text-foreground" onClick={() => setMode('sign-in')}>Sign in</button>
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
      </div>

      {/* Demo timeline fills remaining space */}
      <div className="flex-1 overflow-hidden px-6 md:px-10 py-4">
        <SkinProvider>
          <DemoTimelineProvider>
            <DemoTimelineView onSignUpWithTimeline={handleSignUpWithTimeline} />
          </DemoTimelineProvider>
        </SkinProvider>
      </div>
      <Footer />
    </div>
  )
}
