import { useState, useEffect, useRef, useCallback } from 'react'
import { cn } from '@/lib/utils'
import { Popover, PopoverContent, PopoverTrigger } from '@/components/ui/popover'
import { SignInForm } from '@/components/auth/SignInForm'
import { SignUpForm } from '@/components/auth/SignUpForm'
import { ForgotPasswordForm } from '@/components/auth/ForgotPasswordForm'
import { CheckEmailMessage } from '@/components/auth/CheckEmailMessage'
import { Footer } from '@/components/Footer'
import { Logo } from '@/components/Logo'
import { LandingGanttChart } from '@/components/LandingGanttChart'
import { Layers, CalendarDays, Users, FileText, Atom, FlaskConical, Palette, Building2, Music } from 'lucide-react'

type AuthMode = 'sign-in' | 'sign-up' | 'forgot-password' | 'check-email'

// Palette
const C = {
  yale: '#124e78',
  cream: '#f0f0c9',
  gold: '#f2bb05',
  orange: '#d74e09',
  garnet: '#6e0e0a',
} as const

const features = [
  { icon: Layers, title: 'Swim Lane View', desc: 'Organize your life into parallel lanes — work, education, relationships, assets, and more.', color: C.gold },
  { icon: CalendarDays, title: 'Plan Your Future', desc: 'Extend your timeline forward. Set goals, map milestones, and visualize what comes next.', color: C.orange },
  { icon: Users, title: 'Compare with Icons', desc: 'Overlay historical personas like Einstein or Curie and see how your journey aligns with theirs.', color: C.garnet },
  { icon: FileText, title: 'Import Everything', desc: 'Bring in events from Google Calendar, ICS files, or let AI parse your story from text and voice.', color: C.yale },
]

const personas = [
  { name: 'Albert Einstein', icon: Atom, years: '1879–1955', desc: 'Rewrote the laws of physics', color: C.yale },
  { name: 'Marie Curie', icon: FlaskConical, years: '1867–1934', desc: 'Pioneered radioactivity research', color: C.garnet },
  { name: 'Leonardo da Vinci', icon: Palette, years: '1452–1519', desc: 'The original Renaissance polymath', color: C.orange },
  { name: 'Angela Merkel', icon: Building2, years: '1954–', desc: "Europe's most powerful leader for 16 years", color: C.yale },
  { name: 'Taylor Swift', icon: Music, years: '1989–', desc: 'Redefined the music industry', color: C.gold },
]

function smoothScroll(id: string) {
  document.getElementById(id)?.scrollIntoView({ behavior: 'smooth' })
}

export function LandingPage() {
  const [authOpen, setAuthOpen] = useState(false)
  const [mode, setMode] = useState<AuthMode>('sign-in')
  const [scrolled, setScrolled] = useState(false)
  const [ganttVisible, setGanttVisible] = useState(false)
  const mainRef = useRef<HTMLDivElement>(null)

  // Navbar background on scroll
  useEffect(() => {
    const el = mainRef.current
    if (!el) return
    const handler = () => setScrolled(el.scrollTop > 40)
    el.addEventListener('scroll', handler, { passive: true })
    return () => el.removeEventListener('scroll', handler)
  }, [])

  // Scroll reveal for sections
  useEffect(() => {
    const sections = document.querySelectorAll('[data-reveal]')
    const observer = new IntersectionObserver(
      entries => {
        for (const entry of entries) {
          if (entry.isIntersecting) {
            (entry.target as HTMLElement).classList.add('opacity-100', 'translate-y-0')
            ;(entry.target as HTMLElement).classList.remove('opacity-0', 'translate-y-8')
          }
        }
      },
      { threshold: 0.15 },
    )
    sections.forEach(s => observer.observe(s))
    return () => observer.disconnect()
  }, [])

  // Gantt chart intersection observer
  useEffect(() => {
    const el = document.getElementById('gantt')
    if (!el) return
    const observer = new IntersectionObserver(
      entries => {
        for (const entry of entries) {
          if (entry.isIntersecting) setGanttVisible(true)
        }
      },
      { threshold: 0.15 },
    )
    observer.observe(el)
    return () => observer.disconnect()
  }, [])

  const openAuth = useCallback((authMode: AuthMode = 'sign-up') => {
    setMode(authMode)
    mainRef.current?.scrollTo({ top: 0, behavior: 'smooth' })
    setTimeout(() => setAuthOpen(true), 400)
  }, [])

  const modeLabel: Record<AuthMode, string> = {
    'sign-in': 'Sign In',
    'sign-up': 'Get Started',
    'forgot-password': 'Reset Password',
    'check-email': 'Check Email',
  }

  return (
    <div
      ref={mainRef}
      className="h-screen overflow-y-auto"
      style={{ backgroundColor: C.cream, fontFamily: "'Helvetica Neue', Helvetica, Arial, sans-serif" }}
    >
      {/* ── Navbar ──────────────────────────────────────────────────────── */}
      <nav
        className={cn(
          'fixed top-0 left-0 right-0 z-50 transition-all duration-300',
          scrolled ? 'shadow-sm' : '',
        )}
        style={{
          backgroundColor: scrolled ? `${C.cream}cc` : 'transparent',
          backdropFilter: scrolled ? 'blur(20px) saturate(1.8)' : 'none',
          borderBottom: scrolled ? `1px solid ${C.yale}15` : '1px solid transparent',
        }}
      >
        <div className="max-w-6xl mx-auto px-6 md:px-10 h-14 flex items-center justify-between">
          <Logo size="md" />

          <div className="hidden sm:flex items-center gap-6 text-sm" style={{ color: `${C.yale}99` }}>
            <button onClick={() => smoothScroll('features')} className="transition-colors hover:opacity-100" style={{ color: `${C.yale}99` }} onMouseEnter={e => (e.currentTarget.style.color = C.yale)} onMouseLeave={e => (e.currentTarget.style.color = `${C.yale}99`)}>
              Features
            </button>
            <button onClick={() => smoothScroll('personas')} className="transition-colors" onMouseEnter={e => (e.currentTarget.style.color = C.yale)} onMouseLeave={e => (e.currentTarget.style.color = `${C.yale}99`)}>
              Personas
            </button>
          </div>

          <Popover open={authOpen} onOpenChange={setAuthOpen}>
            <PopoverTrigger asChild>
              <button
                className="px-4 py-1.5 rounded-lg text-sm font-semibold transition-all duration-200"
                style={{
                  backgroundColor: scrolled ? C.yale : 'transparent',
                  color: scrolled ? C.cream : C.yale,
                  border: scrolled ? `1px solid ${C.yale}` : `1px solid ${C.yale}60`,
                }}
                onMouseEnter={e => { e.currentTarget.style.backgroundColor = C.yale; e.currentTarget.style.color = C.cream }}
                onMouseLeave={e => { if (!scrolled) { e.currentTarget.style.backgroundColor = 'transparent'; e.currentTarget.style.color = C.yale } }}
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
      </nav>

      {/* ── Hero ────────────────────────────────────────────────────────── */}
      <section className="min-h-screen flex flex-col items-center justify-center px-6 md:px-10 pt-14">
        <div className="text-center max-w-3xl">
          <div
            className="inline-block mb-6 px-4 py-1.5 rounded-full text-sm font-medium opacity-0 animate-[fadeInUp_0.6s_ease-out_0.1s_forwards]"
            style={{ backgroundColor: `${C.yale}12`, color: C.yale }}
          >
            The operating system for your life
          </div>
          <h1 className="text-5xl md:text-7xl font-bold tracking-tight leading-tight opacity-0 animate-[fadeInUp_0.6s_ease-out_0.25s_forwards]" style={{ color: C.yale }}>
            Visualize your life.
            <br />
            <span style={{ color: C.orange }}>Reach your potential.</span>
          </h1>
          <p className="mt-6 text-lg max-w-xl mx-auto opacity-0 animate-[fadeInUp_0.6s_ease-out_0.4s_forwards]" style={{ color: `${C.yale}88` }}>
            Map every chapter of your story — past, present, and future — on a single interactive timeline.
          </p>
          <div className="mt-8 flex flex-col sm:flex-row items-center justify-center gap-3 opacity-0 animate-[fadeInUp_0.6s_ease-out_0.55s_forwards]">
            <button
              className="px-8 py-3 rounded-xl text-base font-semibold transition-all duration-200 shadow-md hover:shadow-lg"
              style={{ backgroundColor: C.gold, color: C.yale }}
              onClick={() => openAuth('sign-up')}
              onMouseEnter={e => (e.currentTarget.style.backgroundColor = '#e0ad04')}
              onMouseLeave={e => (e.currentTarget.style.backgroundColor = C.gold)}
            >
              Get Started
            </button>
            <button
              onClick={() => smoothScroll('gantt')}
              className="text-sm underline underline-offset-4 transition-colors"
              style={{ color: `${C.yale}88` }}
              onMouseEnter={e => (e.currentTarget.style.color = C.yale)}
              onMouseLeave={e => (e.currentTarget.style.color = `${C.yale}88`)}
            >
              See how it works
            </button>
          </div>
        </div>
      </section>

      {/* ── Gantt Chart ─────────────────────────────────────────────────── */}
      <section
        id="gantt"
        data-reveal
        className="max-w-5xl mx-auto px-6 md:px-10 py-24 opacity-0 translate-y-8 transition-all duration-700 ease-out"
      >
        <h2 className="text-3xl md:text-4xl font-bold tracking-tight text-center mb-4" style={{ color: C.yale }}>
          Your life, at a glance
        </h2>
        <p className="text-center mb-10 max-w-xl mx-auto" style={{ color: `${C.yale}88` }}>
          Every event, every milestone — laid out across swim lanes. Hover to explore.
        </p>
        <LandingGanttChart visible={ganttVisible} />
      </section>

      {/* ── Features ────────────────────────────────────────────────────── */}
      <section
        id="features"
        data-reveal
        className="max-w-5xl mx-auto px-6 md:px-10 py-24 opacity-0 translate-y-8 transition-all duration-700 ease-out"
      >
        <h2 className="text-3xl md:text-4xl font-bold tracking-tight text-center mb-4" style={{ color: C.yale }}>
          Everything you need
        </h2>
        <p className="text-center mb-12 max-w-xl mx-auto" style={{ color: `${C.yale}88` }}>
          A complete toolkit for mapping your past, planning your future, and gaining perspective.
        </p>
        <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-6">
          {features.map(f => (
            <div
              key={f.title}
              className="rounded-2xl p-6 transition-shadow hover:shadow-md"
              style={{ backgroundColor: 'white', border: `1px solid ${C.yale}18` }}
            >
              <f.icon className="w-8 h-8 mb-4" strokeWidth={1.5} style={{ color: f.color }} />
              <h3 className="font-semibold mb-1" style={{ color: C.yale }}>{f.title}</h3>
              <p className="text-sm leading-relaxed" style={{ color: `${C.yale}88` }}>{f.desc}</p>
            </div>
          ))}
        </div>
      </section>

      {/* ── Personas ────────────────────────────────────────────────────── */}
      <section
        id="personas"
        data-reveal
        className="max-w-5xl mx-auto px-6 md:px-10 py-24 opacity-0 translate-y-8 transition-all duration-700 ease-out"
      >
        <h2 className="text-3xl md:text-4xl font-bold tracking-tight text-center mb-4" style={{ color: C.yale }}>
          Walk alongside the world's greatest
        </h2>
        <p className="text-center mb-12 max-w-xl mx-auto" style={{ color: `${C.yale}88` }}>
          Overlay historical figures on your timeline and see how your life compares, age by age.
        </p>
        <div className="grid sm:grid-cols-2 lg:grid-cols-5 gap-4">
          {personas.map(p => (
            <div
              key={p.name}
              className="rounded-2xl p-5 text-center transition-shadow hover:shadow-md"
              style={{ backgroundColor: 'white', border: `1px solid ${C.yale}18` }}
            >
              <p.icon className="w-7 h-7 mx-auto mb-2" strokeWidth={1.5} style={{ color: p.color }} />
              <h3 className="font-semibold text-sm" style={{ color: C.yale }}>{p.name}</h3>
              <p className="text-xs mb-1" style={{ color: `${C.yale}60` }}>{p.years}</p>
              <p className="text-xs" style={{ color: `${C.yale}88` }}>{p.desc}</p>
            </div>
          ))}
        </div>
      </section>

      {/* ── Final CTA ───────────────────────────────────────────────────── */}
      <section
        data-reveal
        className="py-24 px-6 md:px-10 text-center opacity-0 translate-y-8 transition-all duration-700 ease-out"
      >
        <h2 className="text-3xl md:text-4xl font-bold tracking-tight mb-4" style={{ color: C.yale }}>
          Start mapping your life today
        </h2>
        <p className="mb-8 max-w-md mx-auto" style={{ color: `${C.yale}88` }}>
          It's free to get started. No credit card required.
        </p>
        <button
          className="px-8 py-3 rounded-xl text-base font-semibold transition-all duration-200 shadow-md hover:shadow-lg"
          style={{ backgroundColor: C.gold, color: C.yale }}
          onClick={() => openAuth('sign-up')}
          onMouseEnter={e => (e.currentTarget.style.backgroundColor = '#e0ad04')}
          onMouseLeave={e => (e.currentTarget.style.backgroundColor = C.gold)}
        >
          Get Started
        </button>
      </section>

      <Footer />

      {/* ── CSS keyframes ───────────────────────────────────────────────── */}
      <style>{`
        @keyframes fadeInUp {
          from { opacity: 0; transform: translateY(16px); }
          to { opacity: 1; transform: translateY(0); }
        }
      `}</style>
    </div>
  )
}
