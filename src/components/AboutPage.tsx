import { useEffect, useRef, useState } from 'react'
import { Footer } from '@/components/Footer'

function navigate(path: string) {
  window.history.pushState(null, '', path)
  window.dispatchEvent(new PopStateEvent('popstate'))
}

/* ── Tiny hook: triggers once when element enters viewport ── */
function useInView(threshold = 0.15) {
  const ref = useRef<HTMLDivElement>(null)
  const [visible, setVisible] = useState(false)
  useEffect(() => {
    const el = ref.current
    if (!el) return
    const obs = new IntersectionObserver(([e]) => { if (e.isIntersecting) setVisible(true) }, { threshold })
    obs.observe(el)
    return () => obs.disconnect()
  }, [threshold])
  return { ref, visible }
}

/* ── Fade-in wrapper ── */
function FadeIn({ children, delay = 0, className = '' }: { children: React.ReactNode; delay?: number; className?: string }) {
  const { ref, visible } = useInView()
  return (
    <div
      ref={ref}
      className={className}
      style={{
        opacity: visible ? 1 : 0,
        transform: visible ? 'translateY(0)' : 'translateY(28px)',
        transition: `opacity 0.7s ease ${delay}ms, transform 0.7s ease ${delay}ms`,
      }}
    >
      {children}
    </div>
  )
}

/* ── Fake mini-timeline preview ── */
function MiniTimeline() {
  const lanes = [
    { name: 'Place', color: '#6366f1', bars: [{ s: 5, w: 28 }, { s: 38, w: 42 }] },
    { name: 'Work', color: '#f59e0b', bars: [{ s: 12, w: 18 }, { s: 35, w: 55 }] },
    { name: 'Relations', color: '#ec4899', bars: [{ s: 20, w: 60 }] },
    { name: 'Health', color: '#10b981', bars: [{ s: 0, w: 100 }] },
  ]
  return (
    <div className="rounded-2xl border border-border/40 bg-card/60 backdrop-blur overflow-hidden shadow-2xl">
      {/* fake toolbar */}
      <div className="flex items-center gap-2 px-4 py-2.5 border-b border-border/30 bg-muted/30">
        <div className="flex gap-1.5">
          <div className="w-3 h-3 rounded-full bg-red-400/70" />
          <div className="w-3 h-3 rounded-full bg-yellow-400/70" />
          <div className="w-3 h-3 rounded-full bg-green-400/70" />
        </div>
        <div className="flex-1 text-center text-[11px] text-muted-foreground font-medium">LifeLANE — My Life</div>
      </div>
      {/* fake header */}
      <div className="flex border-b border-border/20 bg-muted/20">
        <div className="w-24 shrink-0 border-r border-border/20 px-3 py-1.5 text-[10px] text-muted-foreground font-medium">Lane</div>
        {['2000','2005','2010','2015','2020','2025'].map(y => (
          <div key={y} className="flex-1 text-center text-[10px] text-muted-foreground py-1.5">{y}</div>
        ))}
      </div>
      {/* fake lanes */}
      {lanes.map(lane => (
        <div key={lane.name} className="flex items-center border-b border-border/10 last:border-0">
          <div className="w-24 shrink-0 border-r border-border/20 px-3 py-2.5 text-[11px] font-medium truncate">{lane.name}</div>
          <div className="flex-1 relative h-9 mx-2">
            {lane.bars.map((b, i) => (
              <div
                key={i}
                className="absolute top-1.5 h-6 rounded-md opacity-80"
                style={{ left: `${b.s}%`, width: `${b.w}%`, backgroundColor: lane.color, boxShadow: `0 2px 6px ${lane.color}55` }}
              />
            ))}
          </div>
        </div>
      ))}
      {/* red today line */}
      <div className="relative h-0">
        <div className="absolute" style={{ left: '62%', bottom: 0, top: -145, width: 2, background: '#ef4444', opacity: 0.7 }} />
      </div>
    </div>
  )
}

/* ── Feature card ── */
function FeatureCard({ emoji, title, body, delay }: { emoji: string; title: string; body: string; delay: number }) {
  return (
    <FadeIn delay={delay}>
      <div className="rounded-2xl border border-border/40 bg-card/50 p-6 hover:border-border/80 hover:bg-card/80 transition-all group">
        <div className="text-3xl mb-3 group-hover:scale-110 transition-transform inline-block">{emoji}</div>
        <h3 className="font-semibold text-base mb-1.5">{title}</h3>
        <p className="text-sm text-muted-foreground leading-relaxed">{body}</p>
      </div>
    </FadeIn>
  )
}

/* ── Stat pill ── */
function StatPill({ value, label }: { value: string; label: string }) {
  return (
    <div className="text-center">
      <div className="text-3xl font-bold tracking-tight">{value}</div>
      <div className="text-xs text-muted-foreground mt-0.5">{label}</div>
    </div>
  )
}

/* ── Scrolling ticker ── */
const TICKER_ITEMS = [
  '📍 Track where you\'ve lived', '💼 Map your career arc', '❤️ Visualise relationships',
  '📈 Project future wealth', '🧠 Compare with Einstein', '🌍 Overlay any timeline',
  '📅 Import from Google Calendar', '🏠 Track homes & assets', '🚀 Plan your next chapter',
  '🎯 See the whole picture', '⏳ Past, present & future', '🔒 Your data, private by default',
]

function Ticker() {
  const items = [...TICKER_ITEMS, ...TICKER_ITEMS]
  return (
    <div className="overflow-hidden relative">
      <div
        className="flex gap-6 whitespace-nowrap"
        style={{
          animation: 'ticker 32s linear infinite',
          width: 'max-content',
        }}
      >
        {items.map((item, i) => (
          <span key={i} className="text-sm text-muted-foreground border border-border/40 rounded-full px-4 py-1.5 bg-muted/30 shrink-0">
            {item}
          </span>
        ))}
      </div>
      <style>{`@keyframes ticker { 0% { transform: translateX(0) } 100% { transform: translateX(-50%) } }`}</style>
    </div>
  )
}

/* ── Compare preview mockup ── */
function ComparePreview() {
  return (
    <div className="rounded-2xl border border-border/40 bg-card/60 backdrop-blur shadow-xl overflow-hidden text-[11px]">
      <div className="px-4 py-2 border-b border-border/30 bg-muted/30 text-xs font-medium text-muted-foreground">Comparing — You vs. Albert Einstein</div>
      {/* Your lane */}
      <div className="px-4 py-1.5 border-b border-border/20 bg-background/50">
        <div className="text-[10px] text-muted-foreground mb-1 font-medium">YOUR TIMELINE · Work</div>
        <div className="relative h-6">
          <div className="absolute top-0.5 h-5 rounded-md bg-amber-500/80 left-[10%] w-[55%]" style={{ boxShadow: '0 2px 6px #f59e0b55' }} />
          <span className="absolute top-1 left-[12%] text-white text-[9px] font-medium drop-shadow">Software Engineer → Lead</span>
        </div>
      </div>
      {/* Einstein's lane */}
      <div className="px-4 py-1.5 bg-muted/20">
        <div className="text-[10px] text-muted-foreground mb-1 font-medium">ALBERT EINSTEIN · Work <span className="text-primary/60">(age-aligned)</span></div>
        <div className="relative h-6">
          <div className="absolute top-0.5 h-5 rounded-md border-2 border-dashed border-purple-400/60 bg-purple-400/20 left-[5%] w-[70%]" />
          <span className="absolute top-1 left-[7%] text-purple-300 text-[9px] font-medium">Patent Office → Princeton</span>
        </div>
      </div>
    </div>
  )
}

export function AboutPage() {
  return (
    <div className="flex flex-col min-h-screen bg-background overflow-x-hidden">

      {/* ── Nav ── */}
      <div className="fixed top-0 left-0 right-0 z-50 border-b border-border/40 bg-background/80 backdrop-blur-md px-6 py-3 flex items-center justify-between">
        <button onClick={() => navigate('/')} className="text-lg font-bold hover:opacity-80 transition-opacity tracking-tight">
          LifeLANE
        </button>
        <div className="flex items-center gap-4">
          <button onClick={() => navigate('/terms')} className="text-sm text-muted-foreground hover:text-foreground transition-colors">Terms</button>
          <button
            onClick={() => navigate('/')}
            className="text-sm px-4 py-1.5 rounded-full bg-primary text-primary-foreground hover:opacity-90 transition-opacity font-medium"
          >
            Open App →
          </button>
        </div>
      </div>

      {/* ── Hero ── */}
      <section className="pt-32 pb-20 px-6 text-center relative">
        {/* background glow */}
        <div className="absolute inset-0 pointer-events-none overflow-hidden">
          <div className="absolute top-20 left-1/2 -translate-x-1/2 w-[600px] h-[300px] rounded-full bg-primary/10 blur-3xl" />
        </div>
        <div className="relative max-w-3xl mx-auto space-y-6">
          <div
            className="inline-block text-xs font-semibold tracking-widest uppercase px-4 py-1.5 rounded-full border border-primary/40 text-primary/80 bg-primary/5"
            style={{ animation: 'fadeDown 0.6s ease both' }}
          >
            Early Access · Be First
          </div>
          <h1
            className="text-5xl sm:text-6xl font-extrabold tracking-tight leading-tight"
            style={{ animation: 'fadeDown 0.6s ease 0.1s both' }}
          >
            Your entire life,<br />
            <span className="text-primary">in one view.</span>
          </h1>
          <p
            className="text-lg text-muted-foreground max-w-xl mx-auto leading-relaxed"
            style={{ animation: 'fadeDown 0.6s ease 0.2s both' }}
          >
            Most people live reactively. LifeLANE lets you step back, see the full arc — past, present, and the future you're building — and make decisions with real perspective.
          </p>
          <div
            className="flex flex-col sm:flex-row gap-3 justify-center"
            style={{ animation: 'fadeDown 0.6s ease 0.3s both' }}
          >
            <button
              onClick={() => navigate('/')}
              className="px-7 py-3 rounded-full bg-primary text-primary-foreground font-semibold hover:opacity-90 transition-opacity shadow-lg shadow-primary/20 text-sm"
            >
              Start mapping your life →
            </button>
            <a
              href="mailto:hello@timelane.space"
              className="px-7 py-3 rounded-full border border-border/60 text-sm font-medium hover:bg-muted/50 transition-colors"
            >
              Get in touch
            </a>
          </div>
        </div>
        <style>{`
          @keyframes fadeDown { from { opacity:0; transform:translateY(-16px) } to { opacity:1; transform:translateY(0) } }
        `}</style>
      </section>

      {/* ── App preview ── */}
      <section className="px-6 pb-24 max-w-4xl mx-auto w-full">
        <FadeIn>
          <MiniTimeline />
        </FadeIn>
      </section>

      {/* ── Ticker ── */}
      <section className="py-8 border-y border-border/30 bg-muted/10">
        <Ticker />
      </section>

      {/* ── Stats ── */}
      <section className="py-20 px-6">
        <FadeIn>
          <div className="max-w-2xl mx-auto grid grid-cols-3 gap-8 text-center">
            <StatPill value="7" label="life dimensions tracked" />
            <StatPill value="∞" label="years of perspective" />
            <StatPill value="1" label="place to see it all" />
          </div>
        </FadeIn>
      </section>

      {/* ── Features ── */}
      <section className="py-20 px-6 max-w-5xl mx-auto w-full">
        <FadeIn>
          <div className="text-center mb-14">
            <h2 className="text-3xl font-bold tracking-tight">Built for clarity. Designed for life.</h2>
            <p className="text-muted-foreground mt-3 max-w-md mx-auto">Seven swim lanes. One canvas. Every chapter of your life, finally organised.</p>
          </div>
        </FadeIn>
        <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-4">
          <FeatureCard delay={0}   emoji="🗺️" title="Place & Travel" body="See every city, country, and home you've called yours — and where you're heading next." />
          <FeatureCard delay={80}  emoji="💼" title="Work & Career" body="Plot jobs, promotions, side projects. See the shape of your professional life at a glance." />
          <FeatureCard delay={160} emoji="❤️" title="Relations" body="Relationships are the backbone of life. Visualise who's been with you and when." />
          <FeatureCard delay={240} emoji="💰" title="Wealth projection" body="Attach value curves to assets, income, and ventures. Watch your future financial picture unfold." />
          <FeatureCard delay={320} emoji="🧬" title="Health timeline" body="Track periods, milestones, treatments. See the full health arc — not just isolated records." />
          <FeatureCard delay={400} emoji="📅" title="Import in seconds" body="Connect Google Calendar or drag in an ICS file. Your past, imported instantly." />
        </div>
      </section>

      {/* ── Compare section ── */}
      <section className="py-20 px-6 bg-muted/20 border-y border-border/30">
        <div className="max-w-4xl mx-auto grid md:grid-cols-2 gap-12 items-center">
          <FadeIn>
            <div className="space-y-5">
              <div className="text-xs font-semibold tracking-widest uppercase text-primary/70">Perspective mode</div>
              <h2 className="text-3xl font-bold tracking-tight">How does your life compare?</h2>
              <p className="text-muted-foreground leading-relaxed">
                Overlay Einstein's career on yours, age-aligned. See what da Vinci was creating at 30. Compare your timeline with a friend's, a partner's, or the person you aspire to be.
              </p>
              <p className="text-muted-foreground leading-relaxed">
                Perspective is the most underrated life tool. LifeLANE makes it visual, instant, and genuinely illuminating.
              </p>
            </div>
          </FadeIn>
          <FadeIn delay={150}>
            <ComparePreview />
          </FadeIn>
        </div>
      </section>

      {/* ── Planning section ── */}
      <section className="py-20 px-6 max-w-4xl mx-auto w-full">
        <div className="grid md:grid-cols-2 gap-12 items-center">
          <FadeIn delay={150}>
            <div className="rounded-2xl border border-border/40 bg-card/60 p-6 shadow-xl space-y-3">
              {[
                { emoji: '🏠', label: 'Buy apartment in Lisbon', year: '2027', color: '#6366f1' },
                { emoji: '🚀', label: 'Launch startup', year: '2026', color: '#f59e0b' },
                { emoji: '✈️', label: 'Sabbatical year', year: '2028–2029', color: '#10b981' },
                { emoji: '📚', label: 'Write a book', year: '2030', color: '#ec4899' },
              ].map((item, i) => (
                <FadeIn key={item.label} delay={i * 80}>
                  <div className="flex items-center gap-3 rounded-xl border border-border/30 bg-background/60 px-4 py-2.5">
                    <span className="text-xl">{item.emoji}</span>
                    <div className="flex-1 min-w-0">
                      <p className="text-sm font-medium truncate">{item.label}</p>
                    </div>
                    <span className="text-xs text-muted-foreground shrink-0">{item.year}</span>
                    <div className="w-2 h-2 rounded-full shrink-0" style={{ backgroundColor: item.color }} />
                  </div>
                </FadeIn>
              ))}
              <p className="text-xs text-muted-foreground text-center pt-1">Future events, planned on your timeline</p>
            </div>
          </FadeIn>
          <FadeIn>
            <div className="space-y-5">
              <div className="text-xs font-semibold tracking-widest uppercase text-primary/70">Future planning</div>
              <h2 className="text-3xl font-bold tracking-tight">Your life isn't just the past.</h2>
              <p className="text-muted-foreground leading-relaxed">
                Add future events alongside your history. A planned move, a career pivot, a goal. See how it all fits — and whether the timing actually makes sense.
              </p>
              <p className="text-muted-foreground leading-relaxed">
                Most tools record what happened. LifeLANE lets you design what's next, on the same canvas.
              </p>
            </div>
          </FadeIn>
        </div>
      </section>

      {/* ── CTA / Early access ── */}
      <section className="py-24 px-6 text-center relative overflow-hidden">
        <div className="absolute inset-0 pointer-events-none">
          <div className="absolute bottom-0 left-1/2 -translate-x-1/2 w-[700px] h-[250px] rounded-full bg-primary/8 blur-3xl" />
        </div>
        <FadeIn>
          <div className="relative max-w-xl mx-auto space-y-6">
            <div className="text-4xl">⚡</div>
            <h2 className="text-3xl font-bold tracking-tight">The earlier you start,<br />the more you have to look back on.</h2>
            <p className="text-muted-foreground leading-relaxed">
              LifeLANE is early. The people joining now are shaping what it becomes. There's no better time to plant your flag.
            </p>
            <button
              onClick={() => navigate('/')}
              className="px-8 py-3.5 rounded-full bg-primary text-primary-foreground font-semibold hover:opacity-90 transition-opacity shadow-xl shadow-primary/20 text-sm"
            >
              Open LifeLANE — it's free →
            </button>
            <p className="text-xs text-muted-foreground">No credit card. No commitment. Just your life, finally visible.</p>
          </div>
        </FadeIn>
      </section>

      {/* ── Footer links ── */}
      <div className="border-t border-border/30 px-6 py-6 flex flex-col sm:flex-row items-center justify-between gap-2 text-sm text-muted-foreground max-w-5xl mx-auto w-full">
        <span>© {new Date().getFullYear()} LifeLANE</span>
        <div className="flex gap-5">
          <button onClick={() => navigate('/terms')} className="hover:text-foreground transition-colors">Terms & Conditions</button>
          <a href="mailto:hello@timelane.space" className="hover:text-foreground transition-colors">Contact</a>
        </div>
      </div>

      <Footer />
    </div>
  )
}
