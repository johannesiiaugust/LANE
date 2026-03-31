import { useTranslation } from '@/i18n'

export function Footer() {
  const { t, navigate } = useTranslation()
  return (
    <div data-lane-footer className="shrink-0 border-t bg-background px-4 py-2 flex items-center justify-between text-[11px] text-muted-foreground">
      <div className="flex flex-col gap-0">
        <span className="font-medium text-foreground/70">LifeLANE &copy; {new Date().getFullYear()}</span>
        <span>{t('footer.storedInGermany')}</span>
      </div>
      <div className="flex items-center gap-3">
        <button
          onClick={() => navigate('/about')}
          className="hover:underline hover:text-foreground transition-colors"
        >
          {t('footer.about')}
        </button>
        <button
          onClick={() => navigate('/terms')}
          className="hover:underline hover:text-foreground transition-colors"
        >
          {t('footer.termsShort')}
        </button>
      </div>
    </div>
  )
}
