import { useState, useEffect, useRef } from 'react'
import { useProfile } from '@/hooks/useProfile'
import { useTranslation } from '@/i18n'
import { isUsernameAvailable } from '@/lib/api'

const USERNAME_RE = /^[a-z0-9_]{3,32}$/
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogDescription,
  DialogFooter,
} from '@/components/ui/dialog'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Textarea } from '@/components/ui/textarea'
import { DateInput } from '@/components/ui/DateInput'

interface ProfileDialogProps {
  open: boolean
  onOpenChange: (open: boolean) => void
}

export function ProfileDialog({ open, onOpenChange }: ProfileDialogProps) {
  const { t } = useTranslation()
  const { profile, updateProfile, uploadProfileAvatar } = useProfile()
  const [displayName, setDisplayName] = useState('')
  const [bio, setBio] = useState('')
  const [username, setUsername] = useState('')
  const [birthDate, setBirthDate] = useState('')
  const [usernameError, setUsernameError] = useState<string | null>(null)
  const [usernameOk, setUsernameOk] = useState(false)
  const [saving, setSaving] = useState(false)

  // Avatar state
  const [avatarPreview, setAvatarPreview] = useState<string | null>(null)
  const [avatarFile, setAvatarFile] = useState<File | null>(null)
  const [uploadingAvatar, setUploadingAvatar] = useState(false)
  const fileInputRef = useRef<HTMLInputElement>(null)

  useEffect(() => {
    if (profile && open) {
      setDisplayName(profile.display_name)
      setBio(profile.bio)
      setUsername(profile.username ?? '')
      setBirthDate(profile.birth_date ?? '')
      setUsernameError(null)
      setUsernameOk(false)
      setAvatarPreview(profile.avatar_url ?? null)
      setAvatarFile(null)
    }
  }, [profile, open])

  async function handleUsernameBlur() {
    const val = username.trim().toLowerCase()
    setUsernameOk(false)
    if (!val) return
    if (!USERNAME_RE.test(val)) {
      setUsernameError(t('auth.usernameChars'))
      return
    }
    // Skip availability check if unchanged
    if (val === profile?.username) {
      setUsernameError(null)
      setUsernameOk(true)
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

  function handleAvatarFileChange(e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0]
    if (!file) return
    setAvatarFile(file)
    setAvatarPreview(URL.createObjectURL(file))
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    setSaving(true)

    let avatarUrl: string | null | undefined = undefined
    if (avatarFile) {
      setUploadingAvatar(true)
      const url = await uploadProfileAvatar(avatarFile)
      setUploadingAvatar(false)
      if (url) avatarUrl = url
    }

    const trimmedUsername = username.trim().toLowerCase() || null
    await updateProfile({
      display_name: displayName.trim(),
      bio: bio.trim(),
      username: trimmedUsername,
      birth_date: birthDate || null,
      ...(avatarUrl !== undefined ? { avatar_url: avatarUrl } : {}),
    })
    setSaving(false)
    onOpenChange(false)
  }

  const currentAvatar = avatarPreview ?? profile?.avatar_url
  const initials = (profile?.display_name || profile?.username || '?').slice(0, 2).toUpperCase()

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="sm:max-w-md">
        <DialogHeader>
          <DialogTitle>{t('profile.editProfile')}</DialogTitle>
          <DialogDescription>{t('profile.updateDisplayNameBio')}</DialogDescription>
        </DialogHeader>
        <form onSubmit={handleSubmit} className="grid gap-3">
          {/* Avatar */}
          <div className="flex flex-col items-center gap-2">
            <button
              type="button"
              onClick={() => fileInputRef.current?.click()}
              className="relative group w-20 h-20 rounded-full overflow-hidden border-2 border-border focus:outline-none focus:ring-2 focus:ring-ring"
              title={t('profile.changeProfilePhoto')}
            >
              {currentAvatar ? (
                <img
                  src={currentAvatar}
                  alt="Profile"
                  className="w-full h-full object-cover"
                />
              ) : (
                <div className="w-full h-full bg-muted flex items-center justify-center text-xl font-semibold text-muted-foreground">
                  {initials}
                </div>
              )}
              <div className="absolute inset-0 bg-black/40 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center">
                <span className="text-white text-xs font-medium">{t('common.change')}</span>
              </div>
            </button>
            <input
              ref={fileInputRef}
              type="file"
              accept="image/jpeg,image/png,image/webp,image/gif,image/avif"
              className="hidden"
              onChange={handleAvatarFileChange}
            />
            {avatarFile && (
              <p className="text-xs text-muted-foreground">{avatarFile.name}</p>
            )}
          </div>

          <div className="grid gap-1.5">
            <Label htmlFor="displayName">{t('profile.displayName')}</Label>
            <Input
              id="displayName"
              value={displayName}
              onChange={e => setDisplayName(e.target.value)}
              placeholder={t('profile.yourName')}
            />
          </div>
          <div className="grid gap-1.5">
            <Label htmlFor="profileUsername">{t('auth.username')}</Label>
            <Input
              id="profileUsername"
              type="text"
              value={username}
              onChange={e => { setUsername(e.target.value.toLowerCase()); setUsernameError(null); setUsernameOk(false) }}
              onBlur={handleUsernameBlur}
              placeholder="e.g. johndoe"
            />
            {usernameError
              ? <p className="text-xs text-red-600">{usernameError}</p>
              : usernameOk
                ? <p className="text-xs text-green-600">{t('profile.yourPublicPage')}: /{username}</p>
                : <p className="text-xs text-muted-foreground">{t('profile.publicPageUrl')} /{username || '…'}</p>
            }
          </div>
          <div className="grid gap-1.5">
            <Label htmlFor="bio">{t('profile.bio')}</Label>
            <Textarea
              id="bio"
              value={bio}
              onChange={e => setBio(e.target.value)}
              placeholder={t('profile.shortBio')}
              rows={3}
            />
          </div>
          <div className="grid gap-1.5">
            <Label htmlFor="profileBirthDate">{t('guide.birthDate')}</Label>
            <DateInput
              value={birthDate}
              onChange={setBirthDate}
              minIso="1900-01-01"
              maxIso="2020-12-31"
            />
          </div>
          <DialogFooter className="mt-2">
            <Button type="button" variant="outline" onClick={() => onOpenChange(false)}>
              {t('common.cancel')}
            </Button>
            <Button type="submit" disabled={saving}>
              {uploadingAvatar ? t('profile.uploading') : saving ? t('profile.saving') : t('common.save')}
            </Button>
          </DialogFooter>
        </form>
      </DialogContent>
    </Dialog>
  )
}
