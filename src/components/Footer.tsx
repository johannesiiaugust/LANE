import { useTranslation } from '@/i18n'

export function Footer() {
  const { t, navigate } = useTranslation()
  return (
    <div className="shrink-0 border-t bg-background px-4 py-1 flex items-center justify-between text-[13px] text-muted-foreground">
      <span>{t('footer.copyright', { year: String(new Date().getFullYear()) })}</span>
      <button
        onClick={() => navigate('/about')}
        className="hover:underline hover:text-foreground transition-colors"
      >
        {t('footer.about')}
      </button>
    </div>
  )
}
