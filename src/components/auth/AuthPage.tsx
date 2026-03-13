import { useState } from 'react'
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

type AuthMode = 'sign-in' | 'sign-up' | 'forgot-password' | 'check-email'

const C = {
  yale: '#124e78',
  cream: '#f0f0c9',
  gold: '#f2bb05',
  orange: '#d74e09',
} as const

export function AuthPage() {
  const [mode, setMode] = useState<AuthMode>('sign-in')
  const [authOpen, setAuthOpen] = useState(false)
  const [fromDemo, setFromDemo] = useState(false)

  function handleSignUpWithTimeline() {
    localStorage.setItem('timeline_import_demo', '1')
    setFromDemo(true)
    setMode('sign-up')
    setTimeout(() => setAuthOpen(true), 50)
  }

  const modeLabel: Record<AuthMode, string> = {
    'sign-in': 'Sign In',
    'sign-up': 'Create Account',
    'forgot-password': 'Reset Password',
    'check-email': 'Check Email',
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
          Visualize your entire life across timelines and lanes —<br />from past memories to future plans.
        </p>

        {/* Auth popover anchored top-right */}
        <Popover open={authOpen} onOpenChange={setAuthOpen}>
          <PopoverTrigger asChild>
            <button
              className="px-4 py-1.5 rounded-lg text-sm font-semibold transition-all duration-200"
              style={{ backgroundColor: C.yale, color: C.cream, border: `1px solid ${C.yale}` }}
              onMouseEnter={e => { e.currentTarget.style.backgroundColor = '#0d3d5e' }}
              onMouseLeave={e => { e.currentTarget.style.backgroundColor = C.yale }}
            >
              {modeLabel[mode]}
            </button>
          </PopoverTrigger>
          <PopoverContent align="end" sideOffset={8} className="theme-landing w-80 p-4 max-h-[85vh] overflow-y-auto">
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
