import { useState, useEffect } from 'react'
import type { Lane } from '@/types/timeline'
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
          <DialogTitle>{editingLane ? 'Edit Lane' : 'Add Lane'}</DialogTitle>
          <DialogDescription>
            {editingLane ? 'Modify the lane name, emoji, and color.' : 'Create a new swim lane.'}
          </DialogDescription>
        </DialogHeader>
        <form onSubmit={handleSubmit} className="grid gap-3">
          <div className="grid gap-1.5">
            <Label htmlFor="lane-name">Name</Label>
            <Input id="lane-name" value={name} onChange={e => setName(e.target.value)} placeholder="Lane name" />
          </div>
          <div className="grid gap-1.5">
            <Label>Emoji (optional)</Label>
            <EmojiField value={emoji} onChange={setEmoji} />
          </div>
          <div className="grid gap-1.5">
            <Label>Color</Label>
            <ColorPicker value={color} onChange={setColor} />
          </div>
          <DialogFooter className="mt-2">
            <Button type="button" variant="outline" onClick={() => onOpenChange(false)}>Cancel</Button>
            <Button type="submit">{editingLane ? 'Save Changes' : 'Add Lane'}</Button>
          </DialogFooter>
        </form>
      </DialogContent>
    </Dialog>
  )
}
