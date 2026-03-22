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
import { Button } from '@/components/ui/button'
import { Footer } from '@/components/Footer'

type AuthMode = 'landing' | 'sign-in' | 'sign-up' | 'forgot-password' | 'check-email'

export function AuthPage() {
  useTitle('LifeLANE — Try the demo')
  const [mode, setMode] = useState<AuthMode>('landing')
  const [authOpen, setAuthOpen] = useState(false)
  const [fromDemo, setFromDemo] = useState(false)

  function handleSignUpWithTimeline() {
    localStorage.setItem('timeline_import_demo', '1')
    setFromDemo(true)
    setMode('sign-up')
    // Defer opening to let the dropdown finish closing before the popover opens
    setTimeout(() => setAuthOpen(true), 50)
  }

  function openLanding() {
    setMode('landing')
    setAuthOpen(true)
  }

  return (
    <div className="flex flex-col h-screen bg-background overflow-hidden">
      {/* Top header bar */}
      <div className="shrink-0 border-b shadow-sm bg-background px-4 py-3 flex items-center justify-between gap-4">
        {/* Brand + tagline */}
        <div className="shrink-0">
          <div className="text-xl font-bold leading-tight">LifeLANE</div>
          <div className="text-xs text-muted-foreground italic">The operating system for your life</div>
        </div>

        {/* Short description — hidden on small screens */}
        <p className="hidden sm:block text-sm text-muted-foreground text-center flex-1 max-w-md leading-snug">
          Visualize lives. Compare with others. Shape your future.
        </p>

        {/* Auth popover anchored top-right */}
        <Popover open={authOpen} onOpenChange={setAuthOpen}>
          <PopoverTrigger asChild>
            <Button size="sm" onClick={openLanding}>Start your life</Button>
          </PopoverTrigger>
          <PopoverContent align="end" sideOffset={8} className="w-80 p-4 max-h-[85vh] overflow-y-auto">
            {mode === 'landing' && (
              <div className="space-y-3">
                <p className="text-sm font-semibold">Get started</p>
                <Button className="w-full" onClick={() => { setFromDemo(true); localStorage.setItem('timeline_import_demo', '1'); setMode('sign-up') }}>
                  Continue with this timeline
                </Button>
                <Button variant="outline" className="w-full" onClick={() => { setFromDemo(false); setMode('sign-up') }}>
                  Create account (blank timeline)
                </Button>
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
      <div className="flex-1 overflow-hidden">
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
