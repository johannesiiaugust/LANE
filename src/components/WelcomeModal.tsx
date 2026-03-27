import { useState } from 'react'
import { Switch } from '@/components/ui/switch'
import { Button } from '@/components/ui/button'
import { useTranslation } from '@/i18n'
import { navigateLocalized, type Lang } from '@/i18n/context'

const WELCOME_LANGS: { id: Lang; flag: string; label: string }[] = [
  { id: 'en', flag: '🇬🇧', label: 'English' },
  { id: 'de', flag: '🇩🇪', label: 'Deutsch' },
  { id: 'fr', flag: '🇫🇷', label: 'Français' },
  { id: 'es', flag: '🇪🇸', label: 'Español' },
  { id: 'it', flag: '🇮🇹', label: 'Italiano' },
  { id: 'nl', flag: '🇳🇱', label: 'Nederlands' },
  { id: 'sv', flag: '🇸🇪', label: 'Svenska' },
]

interface WelcomeModalProps {
  currentLang: Lang
  onDismiss: () => void
  onAbout: () => void
}

export function WelcomeModal({ currentLang, onDismiss, onAbout }: WelcomeModalProps) {
  const { t } = useTranslation()
  const [selectedLang, setSelectedLang] = useState<Lang>(currentLang)
  const [cookiesAccepted, setCookiesAccepted] = useState(false)

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

  function handleSelectLang(lang: Lang) {
    setSelectedLang(lang)
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
          <div className="text-3xl mb-2">👋</div>
          <h2 className="text-xl font-bold">{t('welcome.title')}</h2>
          <p className="text-sm text-muted-foreground mt-1">{t('welcome.subtitle')}</p>
        </div>

        {/* Language selector */}
        <div>
          <p className="text-xs font-semibold text-muted-foreground uppercase tracking-wide mb-2">{t('welcome.chooseLanguage')}</p>
          <div className="grid grid-cols-7 gap-1">
            {WELCOME_LANGS.map(({ id, flag, label }) => (
              <button
                key={id}
                onClick={() => handleSelectLang(id)}
                title={label}
                className={`flex flex-col items-center gap-0.5 rounded-lg py-1.5 px-1 transition-all text-center ${
                  selectedLang === id
                    ? 'bg-primary/15 ring-2 ring-primary'
                    : 'hover:bg-accent'
                }`}
              >
                <span className="text-xl leading-none">{flag}</span>
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
                onClick={() => { onAbout(); onDismiss() }}
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
          <Button variant="outline" onClick={() => { onAbout(); onDismiss() }}>
            {t('welcome.aboutButton')}
          </Button>
        </div>
      </div>
    </div>
  )
}
