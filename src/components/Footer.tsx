import { useTranslation } from '@/i18n'

export function Footer() {
  const { t, navigate } = useTranslation()
  return (
    <div className="shrink-0 border-t bg-background px-4 py-3 flex items-center justify-between text-[13px] text-muted-foreground">
      <div className="flex flex-col gap-0.5">
        <span className="font-medium text-foreground/70">LifeLANE</span>
        <span>© {new Date().getFullYear()}</span>
      </div>
      <div className="flex flex-col items-end gap-0.5">
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
          {t('terms.title')}
        </button>
      </div>
    </div>
  )
}
