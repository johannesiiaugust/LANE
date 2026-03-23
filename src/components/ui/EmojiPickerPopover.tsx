import { Suspense, lazy, useState } from 'react'
import { Smile, X } from 'lucide-react'
import { Popover, PopoverTrigger, PopoverContent } from '@/components/ui/popover'

// Lazy-load the heavy emoji-mart bundle only when first needed
const EmojiMart = lazy(() =>
  import('@emoji-mart/react').then(mod => ({ default: mod.default }))
)

// Preload data once at module level (lightweight fetch, cached)
let dataPromise: Promise<unknown> | null = null
function getEmojiData() {
  if (!dataPromise) dataPromise = import('@emoji-mart/data').then(m => m.default)
  return dataPromise
}

interface EmojiPickerPopoverProps {
  value: string
  onChange: (emoji: string) => void
  triggerClassName?: string
}

function PickerInner({ onChange, onClose }: { onChange: (v: string) => void; onClose: () => void }) {
  const [data, setData] = useState<unknown>(null)

  if (!data) {
    getEmojiData().then(d => setData(d))
    return <div className="h-[380px] w-[352px] flex items-center justify-center text-sm text-muted-foreground">Loading…</div>
  }

  return (
    <Suspense fallback={<div className="h-[380px] w-[352px] flex items-center justify-center text-sm text-muted-foreground">Loading…</div>}>
      <EmojiMart
        data={data}
        onEmojiSelect={(em: { native: string }) => { onChange(em.native); onClose() }}
        theme="light"
        previewPosition="none"
        skinTonePosition="search"
      />
    </Suspense>
  )
}

export function EmojiPickerPopover({ value, onChange, triggerClassName = '' }: EmojiPickerPopoverProps) {
  const [open, setOpen] = useState(false)

  return (
    <Popover open={open} onOpenChange={setOpen}>
      <PopoverTrigger asChild>
        <button
          type="button"
          className={`h-9 w-9 flex items-center justify-center rounded-md border border-input bg-background hover:bg-accent text-lg transition-colors ${triggerClassName}`}
          title="Pick emoji"
        >
          {value || <Smile className="h-4 w-4 text-muted-foreground" />}
        </button>
      </PopoverTrigger>
      <PopoverContent className="p-0 w-auto border-0 shadow-xl" align="start" sideOffset={6}>
        {open && <PickerInner onChange={onChange} onClose={() => setOpen(false)} />}
      </PopoverContent>
    </Popover>
  )
}

/** Compact trigger + clear button row */
export function EmojiField({ value, onChange }: { value: string; onChange: (v: string) => void }) {
  return (
    <div className="flex items-center gap-2">
      <EmojiPickerPopover value={value} onChange={onChange} />
      {value && (
        <button
          type="button"
          className="text-muted-foreground hover:text-foreground"
          onClick={() => onChange('')}
          title="Clear emoji"
        >
          <X className="h-4 w-4" />
        </button>
      )}
      <span className="text-sm text-muted-foreground">
        {value || 'No emoji selected'}
      </span>
    </div>
  )
}
