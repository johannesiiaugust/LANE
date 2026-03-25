import { useState, useEffect } from 'react'
import type { Lane } from '@/types/timeline'
import { useTranslation } from '@/i18n'
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
import { EmojiField } from '@/components/ui/EmojiPickerPopover'
import { ColorPicker } from '@/components/ui/ColorPicker'

interface LaneDialogProps {
  open: boolean
  onOpenChange: (open: boolean) => void
  editingLane?: Lane | null
  onSave: (data: { name: string; color: string; visible: boolean; emoji?: string }) => void
}

export function LaneDialog({ open, onOpenChange, editingLane, onSave }: LaneDialogProps) {
  const { t } = useTranslation()
  const [name, setName] = useState('')
  const [color, setColor] = useState('#3b82f6')
  const [emoji, setEmoji] = useState('')

  useEffect(() => {
    if (editingLane) {
      setName(editingLane.name)
      setColor(editingLane.color)
      setEmoji(editingLane.emoji ?? '')
    } else {
      setName('')
      setColor('#3b82f6')
      setEmoji('')
    }
  }, [editingLane, open])

  function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    if (!name.trim()) return
    onSave({ name: name.trim(), color, visible: true, emoji: emoji || undefined })
    onOpenChange(false)
  }

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="sm:max-w-sm">
        <DialogHeader>
          <DialogTitle>{editingLane ? t('lane.editLane') : t('lane.addLane')}</DialogTitle>
          <DialogDescription>
            {editingLane ? t('lane.modifyLane') : t('lane.createNewSwimLane')}
          </DialogDescription>
        </DialogHeader>
        <form onSubmit={handleSubmit} className="grid gap-3">
          <div className="grid gap-1.5">
            <Label htmlFor="lane-name">{t('common.name')}</Label>
            <Input id="lane-name" value={name} onChange={e => setName(e.target.value)} placeholder={t('lane.laneName')} />
          </div>
          {/* Color + Emoji on the same row */}
          <div className="flex items-end gap-4">
            <div className="flex-1 grid gap-1.5">
              <Label>{t('common.color')}</Label>
              <ColorPicker value={color} onChange={setColor} />
            </div>
            <div className="grid gap-1.5">
              <Label>{t('common.emoji')}</Label>
              <EmojiField value={emoji} onChange={setEmoji} />
            </div>
          </div>
          <DialogFooter className="mt-2">
            <Button type="button" variant="outline" onClick={() => onOpenChange(false)}>{t('common.cancel')}</Button>
            <Button type="submit">{editingLane ? t('lane.saveChanges') : t('lane.addLane')}</Button>
          </DialogFooter>
        </form>
      </DialogContent>
    </Dialog>
  )
}
