import { useState, useEffect } from 'react'

// ── Data ─────────────────────────────────────────────────────────────────────

const QUICK_LANGS = [
  { flag: '🇬🇧', code: 'en', name: 'English' },
  { flag: '🇩🇪', code: 'de', name: 'German' },
  { flag: '🇫🇷', code: 'fr', name: 'French' },
  { flag: '🇪🇸', code: 'es', name: 'Spanish' },
]

const ALL_LANGS = [
  { code: 'zh', name: 'Chinese' }, { code: 'ar', name: 'Arabic' },
  { code: 'pt', name: 'Portuguese' }, { code: 'ru', name: 'Russian' },
  { code: 'ja', name: 'Japanese' }, { code: 'ko', name: 'Korean' },
  { code: 'it', name: 'Italian' }, { code: 'nl', name: 'Dutch' },
  { code: 'pl', name: 'Polish' }, { code: 'sv', name: 'Swedish' },
  { code: 'no', name: 'Norwegian' }, { code: 'da', name: 'Danish' },
  { code: 'fi', name: 'Finnish' }, { code: 'tr', name: 'Turkish' },
  { code: 'hi', name: 'Hindi' }, { code: 'id', name: 'Indonesian' },
  { code: 'uk', name: 'Ukrainian' }, { code: 'cs', name: 'Czech' },
  { code: 'ro', name: 'Romanian' }, { code: 'hu', name: 'Hungarian' },
  { code: 'el', name: 'Greek' }, { code: 'he', name: 'Hebrew' },
  { code: 'vi', name: 'Vietnamese' }, { code: 'th', name: 'Thai' },
]

// ── Init ─────────────────────────────────────────────────────────────────────

function initGoogleTranslate() {
  if (!document.getElementById('gt-element')) {
    const el = document.createElement('div')
    el.id = 'gt-element'
    el.style.display = 'none'
    document.body.appendChild(el)
  }
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  ;(window as any)['googleTranslateElementInit'] = () => {
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    new (window as any).google.translate.TranslateElement(
      { pageLanguage: 'en', autoDisplay: false },
      'gt-element',
    )
  }
  if (!document.getElementById('gt-script')) {
    const s = document.createElement('script')
    s.id = 'gt-script'
    s.src = '//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit'
    document.body.appendChild(s)
  }
  if (!document.getElementById('gt-style')) {
    const style = document.createElement('style')
    style.id = 'gt-style'
    style.textContent = [
      '.goog-te-banner-frame { display:none !important; }',
      '.goog-te-menu-frame { display:none !important; }',
      'body { top:0 !important; }',
    ].join(' ')
    document.head.appendChild(style)
  }
}

export function useGoogleTranslate() {
  useEffect(() => { initGoogleTranslate() }, [])
}

export function translateTo(code: string) {
  const attempt = (retries: number) => {
    const select = document.querySelector('.goog-te-combo') as HTMLSelectElement | null
    if (select) {
      select.value = code
      select.dispatchEvent(new Event('change'))
    } else if (retries > 0) {
      setTimeout(() => attempt(retries - 1), 300)
    }
  }
  attempt(10)
}

// ── Shared content (used inside any dropdown/popover) ────────────────────────

export function TranslateMenuContent({ onSelect }: { onSelect?: () => void }) {
  const [langSearch, setLangSearch] = useState('')
  const filtered = langSearch.trim()
    ? ALL_LANGS.filter(l => l.name.toLowerCase().includes(langSearch.toLowerCase()))
    : []

  function handle(code: string) {
    translateTo(code)
    setLangSearch('')
    onSelect?.()
  }

  return (
    <div className="px-2 py-1.5" onClick={e => e.stopPropagation()}>
      <p className="text-[10px] font-semibold text-muted-foreground uppercase tracking-wider mb-2 px-1">
        Translate with Google
      </p>
      <div className="flex gap-1 mb-2">
        {QUICK_LANGS.map(({ flag, code, name }) => (
          <button
            key={code}
            onClick={() => handle(code)}
            title={name}
            className="flex-1 flex flex-col items-center py-1.5 rounded hover:bg-accent transition-colors"
          >
            <span className="text-xl leading-none">{flag}</span>
          </button>
        ))}
      </div>
      <input
        type="text"
        placeholder="Search language…"
        value={langSearch}
        onChange={e => setLangSearch(e.target.value)}
        onKeyDown={e => e.stopPropagation()}
        className="w-full text-xs px-2 py-1.5 rounded border border-border bg-background focus:outline-none focus:ring-1 focus:ring-primary placeholder:text-muted-foreground/60"
      />
      {filtered.length > 0 && (
        <div className="mt-1 max-h-28 overflow-y-auto rounded border border-border bg-background">
          {filtered.map(l => (
            <button
              key={l.code}
              onClick={() => handle(l.code)}
              className="w-full text-left px-2 py-1 text-xs hover:bg-accent transition-colors"
            >
              {l.name}
            </button>
          ))}
        </div>
      )}
    </div>
  )
}

// ── Standalone globe dropdown (for nav bars without a surrounding dropdown) ──

export function TranslateDropdown() {
  const [open, setOpen] = useState(false)
  useGoogleTranslate()

  return (
    <div className="relative">
      <button
        onClick={() => setOpen(o => !o)}
        title="Translate page"
        className="flex items-center justify-center w-8 h-8 rounded-full text-muted-foreground hover:text-foreground hover:bg-muted/50 transition-colors text-lg"
      >
        🌐
      </button>
      {open && (
        <>
          {/* backdrop to close on outside click */}
          <div className="fixed inset-0 z-40" onClick={() => setOpen(false)} />
          <div className="absolute right-0 top-full mt-1 w-52 bg-background border border-border rounded-lg shadow-lg z-50">
            <TranslateMenuContent onSelect={() => setOpen(false)} />
          </div>
        </>
      )}
    </div>
  )
}
