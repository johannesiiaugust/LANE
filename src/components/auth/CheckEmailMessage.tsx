import { Mail } from 'lucide-react'
import { useTranslation } from '@/i18n'
import { Button } from '@/components/ui/button'

interface CheckEmailMessageProps {
  onBackToSignIn: () => void
}

export function CheckEmailMessage({ onBackToSignIn }: CheckEmailMessageProps) {
  const { t } = useTranslation()
  return (
    <div className="space-y-4 text-center">
      <Mail className="mx-auto h-12 w-12 text-muted-foreground" />
      <h3 className="text-lg font-medium">{t('auth.checkYourEmail')}</h3>
      <p className="text-sm text-muted-foreground">
        {t('auth.sentLink')}
      </p>
      <Button variant="outline" className="w-full" onClick={onBackToSignIn}>
        {t('auth.backToSignIn')}
      </Button>
    </div>
  )
}
