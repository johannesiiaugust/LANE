import { useRef } from 'react'
import { Check, Plus } from 'lucide-react'

// Curated palette: good variety across hues, works well on dark/light UI
const PALETTE = [
  // Blues
  '#3b82f6', '#0ea5e9', '#6366f1', '#8b5cf6',
  // Greens
  '#10b981', '#22c55e', '#84cc16', '#14b8a6',
  // Warm
  '#f59e0b', '#f97316', '#ef4444', '#e11d48',
  // Pink / purple
  '#ec4899', '#a855f7', '#d946ef', '#c084fc',
  // Neutral / dark
  '#64748b', '#475569', '#1e293b', '#78716c',
]

interface ColorPickerProps {
  value: string
  onChange: (color: string) => void
  /** Show a "no color / inherit" option as first swatch */
  allowNone?: boolean
  noneLabel?: string
  /** Number of swatches per row (default: all in one row) */
  columns?: number
}

export function ColorPicker({ value, onChange, allowNone, noneLabel = 'Default', columns }: ColorPickerProps) {
  const inputRef = useRef<HTMLInputElement>(null)
  const normalised = value?.toLowerCase()
  const isCustom = !!value && !PALETTE.map(c => c.toLowerCase()).includes(normalised)

  const wrapClass = columns
    ? `grid gap-1.5`
    : `flex flex-wrap gap-1.5 items-center`
  const gridStyle = columns ? { gridTemplateColumns: `repeat(${columns}, minmax(0, 1fr))` } : undefined

  return (
    <div className={wrapClass} style={gridStyle}>
      {allowNone && (
        <button
          type="button"
          title={noneLabel}
          onClick={() => onChange('')}
          className={`h-7 w-7 rounded-full border-2 flex items-center justify-center transition-all
            ${!value ? 'border-primary scale-110 shadow-sm' : 'border-border hover:scale-105'}`}
          style={{ background: 'repeating-linear-gradient(-45deg,#ccc 0px,#ccc 2px,#fff 2px,#fff 6px)' }}
        >
          {!value && <Check className="h-3 w-3 text-primary" />}
        </button>
      )}

      {PALETTE.map(c => {
        const selected = normalised === c.toLowerCase()
        return (
          <button
            key={c}
            type="button"
            title={c}
            onClick={() => onChange(c)}
            className={`h-7 w-7 rounded-full border-2 transition-all flex items-center justify-center
              ${selected ? 'border-white scale-110 shadow-md ring-2 ring-offset-1 ring-current' : 'border-transparent hover:scale-105 hover:border-white/60'}`}
            style={{ backgroundColor: c, color: c }}
          >
            {selected && <Check className="h-3 w-3 text-white drop-shadow" />}
          </button>
        )
      })}

      {/* Custom color button — opens native picker */}
      <button
        type="button"
        title={isCustom ? value : 'Custom color'}
        onClick={() => inputRef.current?.click()}
        className={`h-7 w-7 rounded-full border-2 flex items-center justify-center transition-all
          ${isCustom ? 'border-white scale-110 shadow-md ring-2 ring-offset-1 ring-current' : 'border-dashed border-border hover:border-foreground/40 hover:scale-105 bg-muted'}`}
        style={isCustom ? { backgroundColor: value, color: value } : undefined}
      >
        {isCustom
          ? <Check className="h-3 w-3 text-white drop-shadow" />
          : <Plus className="h-3.5 w-3.5 text-muted-foreground" />}
        <input
          ref={inputRef}
          type="color"
          value={value || '#3b82f6'}
          onChange={e => onChange(e.target.value)}
          className="sr-only"
          tabIndex={-1}
          aria-hidden
        />
      </button>
    </div>
  )
}
