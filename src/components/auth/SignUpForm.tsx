import { useState } from 'react'
import { useAuth } from '@/contexts/AuthContext'
import { useTranslation } from '@/i18n'
import { isUsernameAvailable } from '@/lib/api'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Textarea } from '@/components/ui/textarea'
import { DateInput } from '@/components/ui/DateInput'

const USERNAME_RE = /^[a-z0-9_]{3,32}$/

interface SignUpFormProps {
  onSwitchToSignIn: () => void
  onSignUpSuccess: () => void
  fromDemo?: boolean
}

export function SignUpForm({ onSwitchToSignIn, onSignUpSuccess }: SignUpFormProps) {
  const { signUp, signInWithGoogle } = useAuth()
  const { t } = useTranslation()
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [confirmPassword, setConfirmPassword] = useState('')
  const [username, setUsername] = useState('')
  const [usernameError, setUsernameError] = useState<string | null>(null)
  const [usernameOk, setUsernameOk] = useState(false)
  const [bio, setBio] = useState('')
  const [birthDate, setBirthDate] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [submitting, setSubmitting] = useState(false)

  async function handleUsernameBlur() {
    const val = username.trim().toLowerCase()
    setUsernameOk(false)
    if (!val) return
    if (!USERNAME_RE.test(val)) {
      setUsernameError(t('auth.usernameChars'))
      return
    }
    const available = await isUsernameAvailable(val)
    if (available) {
      setUsernameError(null)
      setUsernameOk(true)
    } else {
      setUsernameError(t('auth.usernameAlreadyTaken'))
    }
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setError(null)

    if (password !== confirmPassword) {
      setError(t('auth.passwordsDoNotMatch'))
      return
    }

    const trimmedUsername = username.trim().toLowerCase()
    if (!trimmedUsername) {
      setError(t('auth.pleaseChooseUsername'))
      return
    }
    if (!USERNAME_RE.test(trimmedUsername)) {
      setError(t('auth.resetPasswordError'))
      return
    }
    const available = await isUsernameAvailable(trimmedUsername)
    if (!available) {
      setError(t('auth.usernameAlreadyTaken'))
      return
    }

    if (!birthDate) {
      setError(t('auth.birthDateRequired'))
      return
    }

    setSubmitting(true)
    const { error } = await signUp(email, password)
    if (error) {
      setError(error)
      setSubmitting(false)
    } else {
      localStorage.setItem(
        'timeline_pending_profile',
        JSON.stringify({
          bio: bio.trim(),
          username: trimmedUsername,
          email,
          ...(birthDate ? { birth_date: birthDate } : {}),
          created_at: new Date().toISOString(),
        }),
      )
      onSignUpSuccess()
    }
  }

  const handleGoogleSignUp = async () => {
    setError(null)
    const { error } = await signInWithGoogle()
    if (error) setError(error)
  }

  return (
    <form onSubmit={handleSubmit} className="space-y-4">
      <Button type="button" variant="outline" className="w-full" onClick={handleGoogleSignUp}>
        <svg className="mr-2 h-4 w-4" viewBox="0 0 24 24">
          <path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92a5.06 5.06 0 0 1-2.2 3.32v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.1z" fill="#4285F4" />
          <path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853" />
          <path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" fill="#FBBC05" />
          <path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335" />
        </svg>
        {t('auth.continueWithGoogle')}
      </Button>

      <div className="relative">
        <div className="absolute inset-0 flex items-center">
          <span className="w-full border-t" />
        </div>
        <div className="relative flex justify-center text-xs uppercase">
          <span className="bg-popover px-2 text-muted-foreground">{t('common.or')}</span>
        </div>
      </div>

      <div className="space-y-2">
        <Label htmlFor="signupUsername">{t('auth.username')} <span className="text-red-500">*</span></Label>
        <Input
          id="signupUsername"
          type="text"
          placeholder="e.g. johndoe"
          value={username}
          onChange={e => { setUsername(e.target.value.toLowerCase()); setUsernameError(null); setUsernameOk(false) }}
          onBlur={handleUsernameBlur}
          required
        />
        {usernameError && <p className="text-xs text-red-600">{usernameError}</p>}
      </div>
      <div className="space-y-2">
        <Label htmlFor="email">{t('common.email')} <span className="text-red-500">*</span></Label>
        <Input
          id="email"
          type="email"
          placeholder="you@example.com"
          value={email}
          onChange={e => setEmail(e.target.value)}
          required
        />
      </div>
      <div className="space-y-2">
        <Label htmlFor="password">{t('common.password')} <span className="text-red-500">*</span></Label>
        <Input
          id="password"
          type="password"
          value={password}
          onChange={e => setPassword(e.target.value)}
          required
          minLength={6}
        />
      </div>
      <div className="space-y-2">
        <Label htmlFor="confirmPassword">{t('auth.confirmPassword')} <span className="text-red-500">*</span></Label>
        <Input
          id="confirmPassword"
          type="password"
          value={confirmPassword}
          onChange={e => setConfirmPassword(e.target.value)}
          required
          minLength={6}
        />
      </div>
      <div className="space-y-2">
        <Label htmlFor="signupBirthDate">
          {t('guide.birthDate')} <span className="text-red-500">*</span>
        </Label>
        <DateInput
          value={birthDate}
          onChange={setBirthDate}
          minIso="1900-01-01"
          maxIso="2020-12-31"
          className="w-full"
        />
      </div>
      <div className="space-y-2">
        <Label htmlFor="signupBio">{t('auth.aboutYou')}</Label>
        <Textarea
          id="signupBio"
          placeholder={t('auth.tellUsAboutYourself')}
          value={bio}
          onChange={e => setBio(e.target.value)}
          rows={3}
        />
      </div>
      {error && <p className="text-sm text-red-600">{error}</p>}
      <Button type="submit" className="w-full" disabled={submitting}>
        {submitting ? t('auth.creatingAccount') : t('auth.signUp')}
      </Button>
      <p className="text-center text-sm text-muted-foreground">
        {t('auth.alreadyHaveAccount')}{' '}
        <button type="button" className="hover:underline" onClick={onSwitchToSignIn}>
          {t('auth.signIn')}
        </button>
      </p>
    </form>
  )
}
