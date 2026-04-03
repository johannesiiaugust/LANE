import { useTranslation, localizedPath, stripLangPrefix, type Lang } from '@/i18n'

const LANG_FLAGS: Record<string, { code: string; name: string }> = {
  en: { code: 'gb', name: 'English' },
  de: { code: 'de', name: 'Deutsch' },
  fr: { code: 'fr', name: 'Français' },
  es: { code: 'es', name: 'Español' },
  it: { code: 'it', name: 'Italiano' },
  nl: { code: 'nl', name: 'Nederlands' },
  sv: { code: 'se', name: 'Svenska' },
  fi: { code: 'fi', name: 'Suomi' },
  no: { code: 'no', name: 'Norsk' },
  da: { code: 'dk', name: 'Dansk' },
  pl: { code: 'pl', name: 'Polski' },
  cs: { code: 'cz', name: 'Čeština' },
  pt: { code: 'pt', name: 'Português' },
  tr: { code: 'tr', name: 'Türkçe' },
}

const ALL_LANG_KEYS = Object.keys(LANG_FLAGS)

function switchLang(lang: string) {
  const currentPath = stripLangPrefix(window.location.pathname)
  const target = localizedPath(currentPath, lang as Lang)
  if (window.location.pathname !== target) {
    window.history.pushState(null, '', target)
    window.dispatchEvent(new PopStateEvent('popstate'))
  }
}

/** Inline row of flag buttons — fits inside a dropdown menu or navbar */
export function LanguageSwitcherInline({ onSelect }: { onSelect?: () => void } = {}) {
  const { lang } = useTranslation()

  return (
    <div className="flex flex-wrap gap-1 px-2 py-1.5">
      {ALL_LANG_KEYS.map(l => {
        const info = LANG_FLAGS[l]
        if (!info) return null
        const isActive = l === lang
        return (
          <button
            key={l}
            onClick={() => { switchLang(l); onSelect?.() }}
            title={info.name}
            className={`flex items-center justify-center w-8 h-8 rounded transition-colors text-xl leading-none ${
              isActive
                ? 'bg-primary/15 ring-1 ring-primary/40'
                : 'hover:bg-accent cursor-pointer'
            }`}
          >
            <img src={`https://flagcdn.com/w40/${info.code}.png`} width="20" height="14" className="rounded-sm object-cover" alt={info.name} />
          </button>
        )
      })}
    </div>
  )
}

/** Standalone dropdown for navbars (About page, etc.) */
export function LanguageSwitcherDropdown() {
  const { lang } = useTranslation()
  const currentLang = LANG_FLAGS[lang]

  return (
    <div className="relative group">
      <button
        className="flex items-center justify-center w-8 h-8 rounded-full hover:bg-muted/50 transition-colors"
        title="Language"
      >
        {currentLang
          ? <img src={`https://flagcdn.com/w40/${currentLang.code}.png`} width="20" height="14" className="rounded-sm object-cover" alt={currentLang.name} />
          : '🌐'}
      </button>
      <div className="absolute right-0 top-full mt-1 hidden group-hover:flex flex-col bg-background border border-border rounded-lg shadow-lg z-50 p-1.5 min-w-[140px]">
        {ALL_LANG_KEYS.map(l => {
          const info = LANG_FLAGS[l]
          if (!info) return null
          const isActive = l === lang
          return (
            <button
              key={l}
              onClick={() => switchLang(l)}
              className={`flex items-center gap-2 px-2 py-1.5 rounded text-sm transition-colors w-full text-left ${
                isActive
                  ? 'bg-primary/10 font-medium'
                  : 'hover:bg-accent cursor-pointer'
              }`}
            >
              <img src={`https://flagcdn.com/w40/${info.code}.png`} width="20" height="14" className="rounded-sm object-cover" alt={info.name} />
              <span>{info.name}</span>
            </button>
          )
        })}
      </div>
    </div>
  )
}
