import { useState, useEffect, useRef } from 'react'
import { CalendarDays, ChevronLeft, ChevronRight } from 'lucide-react'
import { Popover, PopoverContent, PopoverTrigger } from '@/components/ui/popover'
import { cn } from '@/lib/utils'
import { iso2dmy, dmy2iso, formatDMYInput } from '@/lib/constants'

// ── helpers ───────────────────────────────────────────────────────────────────

function isValidIso(iso: string) {
  if (!/^\d{4}-\d{2}-\d{2}$/.test(iso)) return false
  const d = new Date(iso + 'T00:00:00Z')
  return !isNaN(d.getTime())
}

function daysInMonth(y: number, m: number) {
  return new Date(y, m, 0).getDate()
}

/** 0=Mon … 6=Sun offset for the first day of month */
function firstWeekdayOffset(y: number, m: number) {
  const js = new Date(y, m - 1, 1).getDay() // 0=Sun
  return (js + 6) % 7                        // rotate so Mon=0
}

const WEEK_DAYS = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su']
const MONTHS = ['January','February','March','April','May','June','July','August','September','October','November','December']

// ── Calendar ──────────────────────────────────────────────────────────────────

function MiniCalendar({
  iso,
  onSelect,
  minIso,
  maxIso,
}: {
  iso: string
  onSelect: (iso: string) => void
  minIso?: string
  maxIso?: string
}) {
  const today = new Date()
  const todayIso = `${today.getFullYear()}-${String(today.getMonth() + 1).padStart(2, '0')}-${String(today.getDate()).padStart(2, '0')}`

  const initial = isValidIso(iso) ? iso : todayIso
  const [vy, setVy] = useState(() => parseInt(initial.slice(0, 4)))
  const [vm, setVm] = useState(() => parseInt(initial.slice(5, 7)))

  const totalDays = daysInMonth(vy, vm)
  const offset = firstWeekdayOffset(vy, vm)

  function prevMonth() {
    if (vm === 1) { setVm(12); setVy(y => y - 1) } else setVm(m => m - 1)
  }
  function nextMonth() {
    if (vm === 12) { setVm(1); setVy(y => y + 1) } else setVm(m => m + 1)
  }

  const cells: Array<number | null> = [
    ...Array(offset).fill(null),
    ...Array.from({ length: totalDays }, (_, i) => i + 1),
  ]
  // pad to full rows
  while (cells.length % 7 !== 0) cells.push(null)

  return (
    <div className="p-2 w-[224px] select-none">
      {/* Header */}
      <div className="flex items-center justify-between mb-2">
        <button type="button" onClick={prevMonth} className="p-1 rounded hover:bg-accent transition-colors">
          <ChevronLeft className="h-3.5 w-3.5" />
        </button>
        <span className="text-xs font-semibold">{MONTHS[vm - 1]} {vy}</span>
        <button type="button" onClick={nextMonth} className="p-1 rounded hover:bg-accent transition-colors">
          <ChevronRight className="h-3.5 w-3.5" />
        </button>
      </div>

      {/* Weekday labels */}
      <div className="grid grid-cols-7 mb-1">
        {WEEK_DAYS.map(d => (
          <div key={d} className="text-center text-[10px] font-medium text-muted-foreground py-0.5">{d}</div>
        ))}
      </div>

      {/* Days */}
      <div className="grid grid-cols-7 gap-y-0.5">
        {cells.map((day, i) => {
          if (!day) return <div key={i} />
          const cellIso = `${vy}-${String(vm).padStart(2, '0')}-${String(day).padStart(2, '0')}`
          const isSelected = cellIso === iso
          const isToday = cellIso === todayIso
          const disabled = (minIso && cellIso < minIso) || (maxIso && cellIso > maxIso)
          return (
            <button
              key={i}
              type="button"
              disabled={!!disabled}
              onClick={() => onSelect(cellIso)}
              className={cn(
                'text-xs rounded py-1 transition-colors w-full',
                isSelected && 'bg-primary text-primary-foreground font-semibold',
                !isSelected && isToday && 'text-primary font-semibold',
                !isSelected && !disabled && 'hover:bg-accent',
                disabled && 'opacity-30 cursor-not-allowed',
              )}
            >
              {day}
            </button>
          )
        })}
      </div>
    </div>
  )
}

// ── DateInput ─────────────────────────────────────────────────────────────────

interface DateInputProps {
  /** ISO string "YYYY-MM-DD" or "" */
  value: string
  onChange: (iso: string) => void
  className?: string
  /** ISO min/max for calendar disabled days */
  minIso?: string
  maxIso?: string
  placeholder?: string
  disabled?: boolean
}

export function DateInput({
  value,
  onChange,
  className,
  minIso,
  maxIso,
  placeholder = 'DD/MM/YYYY',
  disabled,
}: DateInputProps) {
  const [text, setText] = useState(() => iso2dmy(value))
  const [open, setOpen] = useState(false)
  const prevValueRef = useRef(value)

  // Sync display text when value changes from outside (e.g. form reset)
  useEffect(() => {
    if (value !== prevValueRef.current) {
      prevValueRef.current = value
      setText(iso2dmy(value))
    }
  }, [value])

  function handleTextChange(raw: string) {
    const formatted = formatDMYInput(raw)
    setText(formatted)
    if (formatted.length === 10) {
      const iso = dmy2iso(formatted)
      if (isValidIso(iso)) {
        prevValueRef.current = iso
        onChange(iso)
        return
      }
    }
    if (formatted === '') {
      prevValueRef.current = ''
      onChange('')
    }
  }

  function handleCalendarSelect(iso: string) {
    prevValueRef.current = iso
    setText(iso2dmy(iso))
    onChange(iso)
    setOpen(false)
  }

  return (
    <div className={cn('flex items-center gap-1', className)}>
      <input
        type="text"
        value={text}
        onChange={e => handleTextChange(e.target.value)}
        placeholder={placeholder}
        disabled={disabled}
        maxLength={10}
        className={cn(
          'flex h-9 w-full rounded-md border border-input bg-background px-3 py-1 text-sm shadow-sm transition-colors placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring disabled:cursor-not-allowed disabled:opacity-50',
        )}
      />
      <Popover open={open} onOpenChange={setOpen}>
        <PopoverTrigger asChild>
          <button
            type="button"
            disabled={disabled}
            className="shrink-0 h-9 w-9 flex items-center justify-center rounded-md border border-input bg-background hover:bg-accent transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
            title="Pick date"
          >
            <CalendarDays className="h-4 w-4 text-muted-foreground" />
          </button>
        </PopoverTrigger>
        <PopoverContent className="p-0 w-auto z-[300]" align="start" sideOffset={4}>
          <MiniCalendar
            iso={value}
            onSelect={handleCalendarSelect}
            minIso={minIso}
            maxIso={maxIso}
          />
        </PopoverContent>
      </Popover>
    </div>
  )
}
