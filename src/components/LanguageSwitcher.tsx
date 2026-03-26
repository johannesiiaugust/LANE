import { useTranslation, localizedPath, stripLangPrefix, type Lang } from '@/i18n'

const LANG_FLAGS: Record<string, { flag: string; name: string }> = {
  en: { flag: '🇬🇧', name: 'English' },
  de: { flag: '🇩🇪', name: 'Deutsch' },
  fr: { flag: '🇫🇷', name: 'Français' },
  es: { flag: '🇪🇸', name: 'Español' },
  it: { flag: '🇮🇹', name: 'Italiano' },
  nl: { flag: '🇳🇱', name: 'Nederlands' },
  sv: { flag: '🇸🇪', name: 'Svenska' },
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
export function LanguageSwitcherInline() {
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
            onClick={() => switchLang(l)}
            title={info.name}
            className={`flex items-center justify-center w-8 h-8 rounded transition-colors text-xl leading-none ${
              isActive
                ? 'bg-primary/15 ring-1 ring-primary/40'
                : 'hover:bg-accent cursor-pointer'
            }`}
          >
            {info.flag}
          </button>
        )
      })}
    </div>
  )
}

/** Standalone dropdown for navbars (About page, etc.) */
export function LanguageSwitcherDropdown() {
  const { lang } = useTranslation()
  const currentFlag = LANG_FLAGS[lang]?.flag ?? '🌐'

  return (
    <div className="relative group">
      <button
        className="flex items-center justify-center w-8 h-8 rounded-full text-lg hover:bg-muted/50 transition-colors"
        title="Language"
      >
        {currentFlag}
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
              <span className="text-lg leading-none">{info.flag}</span>
              <span>{info.name}</span>
            </button>
          )
        })}
      </div>
    </div>
  )
}
