import { useState, useEffect, useRef } from 'react'
import { Switch } from '@/components/ui/switch'
import { Button } from '@/components/ui/button'
import { useTranslation } from '@/i18n'
import { navigateLocalized, loadTranslation, type Lang } from '@/i18n/context'
import { en, type Translations } from '@/i18n'

const NUGGET_COUNT = 7

const WELCOME_LANGS: { id: Lang; code: string; label: string }[] = [
  { id: 'en', code: 'gb', label: 'English' },
  { id: 'de', code: 'de', label: 'Deutsch' },
  { id: 'fr', code: 'fr', label: 'Français' },
  { id: 'es', code: 'es', label: 'Español' },
  { id: 'it', code: 'it', label: 'Italiano' },
  { id: 'nl', code: 'nl', label: 'Nederlands' },
  { id: 'sv', code: 'se', label: 'Svenska' },
  { id: 'fi', code: 'fi', label: 'Suomi' },
  { id: 'no', code: 'no', label: 'Norsk' },
  { id: 'da', code: 'dk', label: 'Dansk' },
  { id: 'pl', code: 'pl', label: 'Polski' },
  { id: 'cs', code: 'cz', label: 'Čeština' },
  { id: 'pt', code: 'pt', label: 'Português' },
  { id: 'tr', code: 'tr', label: 'Türkçe' },
]

interface WelcomeModalProps {
  currentLang: Lang
  onDismiss: () => void
}

export function WelcomeModal({ currentLang, onDismiss }: WelcomeModalProps) {
  const { t: tApp } = useTranslation()
  const [selectedLang, setSelectedLang] = useState<Lang>(currentLang)
  const [nuggetIndex, setNuggetIndex] = useState(0)
  const [nuggetVisible, setNuggetVisible] = useState(true)
  const nuggetTimer = useRef<ReturnType<typeof setTimeout> | null>(null)

  useEffect(() => {
    const cycle = () => {
      setNuggetVisible(false)
      nuggetTimer.current = setTimeout(() => {
        setNuggetIndex(i => (i + 1) % NUGGET_COUNT)
        setNuggetVisible(true)
        nuggetTimer.current = setTimeout(cycle, 2500)
      }, 400)
    }
    nuggetTimer.current = setTimeout(cycle, 2500)
    return () => { if (nuggetTimer.current) clearTimeout(nuggetTimer.current) }
  }, [])
  const [cookiesAccepted, setCookiesAccepted] = useState(false)
  const [previewTranslations, setPreviewTranslations] = useState<Translations | null>(null)

  // Load translations for preview when selected language changes
  useEffect(() => {
    if (selectedLang === currentLang) {
      setPreviewTranslations(null)
      return
    }
    if (selectedLang === 'en') {
      setPreviewTranslations(en)
      return
    }
    loadTranslation(selectedLang).then(setPreviewTranslations)
  }, [selectedLang, currentLang])

  // Use preview translations if a different language is selected, otherwise app translations
  function t(key: string): string {
    const trans = previewTranslations ?? null
    if (!trans) return tApp(key as Parameters<typeof tApp>[0])
    // Navigate nested key like 'welcome.title'
    const parts = key.split('.')
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    let val: any = trans
    for (const part of parts) {
      val = val?.[part]
    }
    return typeof val === 'string' ? val : tApp(key as Parameters<typeof tApp>[0])
  }

  function handleContinue() {
    localStorage.setItem('cookie_consent', cookiesAccepted ? 'full' : 'essential')
    if (selectedLang !== currentLang) {
      navigateLocalized('/', selectedLang)
    }
    onDismiss()
  }

  function handleBackdropClick() {
    localStorage.setItem('cookie_consent', 'essential')
    onDismiss()
  }

  return (
    <div
      className="fixed inset-0 z-[100] flex items-center justify-center p-4"
      style={{ background: 'rgba(0,0,0,0.45)' }}
      onClick={handleBackdropClick}
    >
      <div
        className="relative w-full max-w-md rounded-2xl bg-background border border-border shadow-2xl p-6 flex flex-col gap-5"
        onClick={e => e.stopPropagation()}
      >
        {/* Header */}
        <div className="text-center">
          <div className="text-3xl mb-1">👋</div>
          <p className="text-xs font-medium text-primary/80 mb-2 leading-snug">{t('welcome.tagline')}</p>
          <h2 className="text-xl font-bold">{t('welcome.title')}</h2>
          <p
            className="text-sm text-muted-foreground mt-2 italic min-h-[1.25rem] transition-opacity duration-400"
            style={{ opacity: nuggetVisible ? 1 : 0 }}
          >
            {t(`welcome.nugget${nuggetIndex + 1}`)}
          </p>
        </div>

        {/* Language selector */}
        <div>
          <p className="text-xs font-semibold text-muted-foreground uppercase tracking-wide mb-2">{t('welcome.chooseLanguage')}</p>
          <div className="grid grid-cols-7 gap-1">
            {WELCOME_LANGS.map(({ id, code, label }) => (
              <button
                key={id}
                onClick={() => setSelectedLang(id)}
                title={label}
                className={`flex flex-col items-center gap-0.5 rounded-lg py-1.5 px-1 transition-all text-center ${
                  selectedLang === id
                    ? 'bg-primary/15 ring-2 ring-primary'
                    : 'hover:bg-accent'
                }`}
              >
                <img
                  src={`https://flagcdn.com/w40/${code}.png`}
                  width="24"
                  height="16"
                  alt={label}
                  className="rounded-sm object-cover"
                  style={{ imageRendering: 'auto' }}
                />
                <span className="text-[9px] text-muted-foreground leading-tight truncate w-full text-center">{label}</span>
              </button>
            ))}
          </div>
        </div>

        {/* Cookie consent */}
        <div className="rounded-xl border border-border bg-muted/30 px-4 py-3 flex items-start gap-3">
          <Switch
            checked={cookiesAccepted}
            onCheckedChange={setCookiesAccepted}
            className="mt-0.5 shrink-0"
          />
          <div>
            <p className="text-sm font-medium leading-snug">{t('welcome.cookieLabel')}</p>
            <p className="text-xs text-muted-foreground mt-0.5 leading-snug">
              {t('welcome.cookieDescription')}{' '}
              <button
                onClick={() => { navigateLocalized('/about', selectedLang); onDismiss() }}
                className="underline hover:text-foreground transition-colors"
              >
                {t('terms.title')}
              </button>
            </p>
          </div>
        </div>

        {/* Actions */}
        <div className="flex gap-2">
          <Button className="flex-1" onClick={handleContinue}>
            {t('welcome.continue')}
          </Button>
          <Button variant="outline" onClick={() => { navigateLocalized('/about', selectedLang); onDismiss() }}>
            {t('welcome.aboutButton')}
          </Button>
        </div>

        {/* Demo note */}
        <p className="text-xs text-muted-foreground/80 text-center">{t('welcome.demoNote')}</p>

        {/* Security note */}
        <p className="text-xs text-muted-foreground/60 text-center">🔒 {t('welcome.secureStorage')}</p>
      </div>
    </div>
  )
}
