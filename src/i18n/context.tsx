import { createContext, useContext, useMemo, useCallback, useSyncExternalStore } from 'react'
import en, { type Translations } from './en'

// ── Supported languages ──────────────────────────────────────────────────────
export const SUPPORTED_LANGS = ['en', 'sv', 'no', 'fi', 'lv', 'lt', 'de', 'nl', 'fr', 'es', 'it', 'da', 'pl', 'cs'] as const
export type Lang = (typeof SUPPORTED_LANGS)[number]

const LANG_SET = new Set<string>(SUPPORTED_LANGS)

// ── Lazy-loaded translations ─────────────────────────────────────────────────
const translationModules: Record<Lang, () => Promise<{ default: Translations }>> = {
  en: () => Promise.resolve({ default: en }),
  sv: () => import('./sv'),
  no: () => import('./no'),
  fi: () => import('./fi'),
  lv: () => import('./lv'),
  lt: () => import('./lt'),
  de: () => import('./de'),
  nl: () => import('./nl'),
  fr: () => import('./fr'),
  es: () => import('./es'),
  it: () => import('./it'),
  da: () => import('./da'),
  pl: () => import('./pl'),
  cs: () => import('./cs'),
}

const loadedTranslations = new Map<Lang, Translations>([['en', en]])

export async function loadTranslation(lang: Lang): Promise<Translations> {
  if (loadedTranslations.has(lang)) return loadedTranslations.get(lang)!
  const mod = await translationModules[lang]()
  loadedTranslations.set(lang, mod.default)
  return mod.default
}

// ── URL language detection ───────────────────────────────────────────────────
export function getLangFromPath(pathname: string): Lang {
  const first = pathname.split('/')[1]
  if (first && LANG_SET.has(first) && first !== 'en') return first as Lang
  return 'en'
}

export function stripLangPrefix(pathname: string): string {
  const lang = getLangFromPath(pathname)
  if (lang === 'en') return pathname
  const prefix = `/${lang}`
  if (pathname === prefix) return '/'
  if (pathname.startsWith(prefix + '/')) return pathname.slice(prefix.length)
  return pathname
}

export function localizedPath(path: string, lang: Lang): string {
  if (lang === 'en') return path
  if (path === '/') return `/${lang}`
  return `/${lang}${path}`
}

// ── Navigate helper ──────────────────────────────────────────────────────────
export function navigateLocalized(path: string, lang: Lang) {
  const target = localizedPath(path, lang)
  if (window.location.pathname !== target) {
    window.history.pushState(null, '', target)
    window.dispatchEvent(new PopStateEvent('popstate'))
  }
}

// ── Deep accessor for dot-path keys ──────────────────────────────────────────
function getNestedValue(obj: Record<string, unknown>, path: string): string {
  const parts = path.split('.')
  let current: unknown = obj
  for (const part of parts) {
    if (current == null || typeof current !== 'object') return path
    current = (current as Record<string, unknown>)[part]
  }
  return typeof current === 'string' ? current : path
}

// ── React Context ────────────────────────────────────────────────────────────
interface LanguageContextValue {
  lang: Lang
  translations: Translations
  t: (key: string, params?: Record<string, string | number>) => string
  navigate: (path: string) => void
  localizedPath: (path: string) => string
}

const LanguageContext = createContext<LanguageContextValue>({
  lang: 'en',
  translations: en,
  t: (key) => key,
  navigate: () => {},
  localizedPath: (p) => p,
})

// ── Provider ─────────────────────────────────────────────────────────────────
export function LanguageProvider({
  lang,
  translations,
  children,
}: {
  lang: Lang
  translations: Translations
  children: React.ReactNode
}) {
  const t = useCallback(
    (key: string, params?: Record<string, string | number>) => {
      let text = getNestedValue(translations as unknown as Record<string, unknown>, key)
      // Fallback to English if key not found in current language
      if (text === key) {
        text = getNestedValue(en as unknown as Record<string, unknown>, key)
      }
      if (params) {
        for (const [k, v] of Object.entries(params)) {
          text = text.replace(`{${k}}`, String(v))
        }
      }
      return text
    },
    [translations],
  )

  const nav = useCallback(
    (path: string) => navigateLocalized(path, lang),
    [lang],
  )

  const lp = useCallback(
    (path: string) => localizedPath(path, lang),
    [lang],
  )

  const value = useMemo<LanguageContextValue>(
    () => ({ lang, translations, t, navigate: nav, localizedPath: lp }),
    [lang, translations, t, nav, lp],
  )

  return <LanguageContext.Provider value={value}>{children}</LanguageContext.Provider>
}

// ── Hooks ────────────────────────────────────────────────────────────────────
export function useTranslation() {
  return useContext(LanguageContext)
}

export function useLanguage(): Lang {
  return useContext(LanguageContext).lang
}

// ── Default lane name translation ────────────────────────────────────────────
/** Maps English default lane names → lane id keys used in translations */
export const DEFAULT_LANE_NAME_TO_ID: Record<string, string> = {
  'Place & Travel': 'place',
  'Work & Education': 'work',
  'Health': 'health',
  'Relations & Family': 'relations',
  'Activities': 'activities',
  'Assets': 'assets',
  'Items': 'items',
}

/** Returns a function that translates a lane name if it matches a default lane, otherwise returns it unchanged */
export function useTranslateLaneName(): (name: string) => string {
  const { t } = useTranslation()
  return (name: string) => {
    const id = DEFAULT_LANE_NAME_TO_ID[name]
    return id ? t(`lanes.${id}`) : name
  }
}

// ── Hook to detect lang from URL reactively ──────────────────────────────────
export function useUrlLang(): Lang {
  return useSyncExternalStore(
    (cb) => {
      window.addEventListener('popstate', cb)
      return () => window.removeEventListener('popstate', cb)
    },
    () => getLangFromPath(window.location.pathname),
  )
}
