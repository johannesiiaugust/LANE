import { useState } from 'react'
import { useAuth } from '@/contexts/AuthContext'
import { useTranslation } from '@/i18n'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'

interface ForgotPasswordFormProps {
  onSwitchToSignIn: () => void
  onResetSuccess: () => void
}

export function ForgotPasswordForm({ onSwitchToSignIn, onResetSuccess }: ForgotPasswordFormProps) {
  const { resetPassword } = useAuth()
  const { t } = useTranslation()
  const [email, setEmail] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [submitting, setSubmitting] = useState(false)

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setError(null)
    setSubmitting(true)
    const { error } = await resetPassword(email)
    if (error) {
      setError(error)
      setSubmitting(false)
    } else {
      onResetSuccess()
    }
  }

  return (
    <form onSubmit={handleSubmit} className="space-y-4">
      <p className="text-sm text-muted-foreground">
        {t('auth.enterEmailResetPassword')}
      </p>
      <div className="space-y-2">
        <Label htmlFor="email">{t('common.email')}</Label>
        <Input
          id="email"
          type="email"
          placeholder="you@example.com"
          value={email}
          onChange={e => setEmail(e.target.value)}
          required
        />
      </div>
      {error && <p className="text-sm text-red-600">{error}</p>}
      <Button type="submit" className="w-full" disabled={submitting}>
        {submitting ? t('auth.sending') : t('auth.sendResetLink')}
      </Button>
      <p className="text-center text-sm text-muted-foreground">
        <button type="button" className="hover:underline" onClick={onSwitchToSignIn}>
          {t('auth.backToSignIn')}
        </button>
      </p>
    </form>
  )
}
