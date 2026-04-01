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

function firstWeekdayOffset(y: number, m: number) {
  const js = new Date(y, m - 1, 1).getDay()
  return (js + 6) % 7
}

const WEEK_DAYS = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su']
const MONTHS = ['January','February','March','April','May','June','July','August','September','October','November','December']

// ── Calendar ──────────────────────────────────────────────────────────────────

function MiniCalendar({
  iso,
  onSelect,
  minIso,
  maxIso,
  defaultViewIso,
}: {
  iso: string
  onSelect: (iso: string) => void
  minIso?: string
  maxIso?: string
  defaultViewIso?: string
}) {
  const today = new Date()
  const todayIso = `${today.getFullYear()}-${String(today.getMonth() + 1).padStart(2, '0')}-${String(today.getDate()).padStart(2, '0')}`

  // Default view: selected value → explicit default → today
  const initial = isValidIso(iso) ? iso
    : (defaultViewIso && isValidIso(defaultViewIso)) ? defaultViewIso
    : todayIso

  const initialYear = parseInt(initial.slice(0, 4))

  const [vy, setVy] = useState(initialYear)
  const [vm, setVm] = useState(() => parseInt(initial.slice(5, 7)))
  const [viewMode, setViewMode] = useState<'days' | 'years'>('days')
  // Center the year grid around the initial year
  const [yearViewStart, setYearViewStart] = useState(() => Math.max(1, initialYear - 5))

  function prevMonth() {
    if (vm === 1) { setVm(12); setVy(y => y - 1) } else setVm(m => m - 1)
  }
  function nextMonth() {
    if (vm === 12) { setVm(1); setVy(y => y + 1) } else setVm(m => m + 1)
  }

  function openYearView() {
    setYearViewStart(Math.max(1, vy - 5))
    setViewMode('years')
  }

  function selectYear(y: number) {
    setVy(y)
    setViewMode('days')
  }

  // ── Year grid view ──────────────────────────────────────────────────────────
  if (viewMode === 'years') {
    const years = Array.from({ length: 12 }, (_, i) => yearViewStart + i)
    const minYear = minIso ? parseInt(minIso.slice(0, 4)) : undefined
    const maxYear = maxIso ? parseInt(maxIso.slice(0, 4)) : undefined
    return (
      <div className="p-2 w-[224px] select-none">
        <div className="flex items-center justify-between mb-2">
          <button type="button" onClick={() => setYearViewStart(s => Math.max(1, s - 12))} className="p-1 rounded hover:bg-accent transition-colors">
            <ChevronLeft className="h-3.5 w-3.5" />
          </button>
          <span className="text-xs font-semibold">{yearViewStart} – {yearViewStart + 11}</span>
          <button type="button" onClick={() => setYearViewStart(s => s + 12)} className="p-1 rounded hover:bg-accent transition-colors">
            <ChevronRight className="h-3.5 w-3.5" />
          </button>
        </div>
        <div className="grid grid-cols-4 gap-1">
          {years.map(y => {
            const disabled = (minYear !== undefined && y < minYear) || (maxYear !== undefined && y > maxYear)
            const isSelected = y === vy
            return (
              <button
                key={y}
                type="button"
                disabled={disabled}
                onClick={() => selectYear(y)}
                className={cn(
                  'text-xs rounded py-1.5 transition-colors',
                  isSelected && 'bg-primary text-primary-foreground font-semibold',
                  !isSelected && !disabled && 'hover:bg-accent',
                  disabled && 'opacity-30 cursor-not-allowed',
                )}
              >
                {y}
              </button>
            )
          })}
        </div>
      </div>
    )
  }

  // ── Day grid view ───────────────────────────────────────────────────────────
  const totalDays = daysInMonth(vy, vm)
  const offset = firstWeekdayOffset(vy, vm)
  const cells: Array<number | null> = [
    ...Array(offset).fill(null),
    ...Array.from({ length: totalDays }, (_, i) => i + 1),
  ]
  while (cells.length % 7 !== 0) cells.push(null)

  return (
    <div className="p-2 w-[224px] select-none">
      <div className="flex items-center justify-between mb-2">
        <button type="button" onClick={prevMonth} className="p-1 rounded hover:bg-accent transition-colors">
          <ChevronLeft className="h-3.5 w-3.5" />
        </button>
        <button
          type="button"
          onClick={openYearView}
          className="text-xs font-semibold px-2 py-0.5 rounded hover:bg-accent transition-colors"
          title="Jump to year"
        >
          {MONTHS[vm - 1]} {vy}
        </button>
        <button type="button" onClick={nextMonth} className="p-1 rounded hover:bg-accent transition-colors">
          <ChevronRight className="h-3.5 w-3.5" />
        </button>
      </div>

      <div className="grid grid-cols-7 mb-1">
        {WEEK_DAYS.map(d => (
          <div key={d} className="text-center text-[10px] font-medium text-muted-foreground py-0.5">{d}</div>
        ))}
      </div>

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
  value: string
  onChange: (iso: string) => void
  className?: string
  minIso?: string
  maxIso?: string
  placeholder?: string
  disabled?: boolean
  /** Accept bare year input (YYYY → YYYY-01-01). Calendar still selects full date and shows it. */
  yearOnly?: boolean
  /** ISO date the calendar opens at when no value is selected. Defaults to today. */
  defaultViewIso?: string
}

function isJan1(iso: string) {
  return iso.slice(5) === '01-01'
}

export function DateInput({
  value,
  onChange,
  className,
  minIso,
  maxIso,
  placeholder,
  disabled,
  yearOnly,
  defaultViewIso,
}: DateInputProps) {
  // In yearOnly mode we track whether the current text is a full date (from calendar) or just a year
  const [displayFull, setDisplayFull] = useState<boolean>(() => {
    if (!yearOnly || !value) return false
    return !isJan1(value)
  })

  function makeText(iso: string, full: boolean): string {
    if (!iso) return ''
    if (!yearOnly || full) return iso2dmy(iso)
    return iso.slice(0, 4)
  }

  const [text, setText] = useState(() => makeText(value, !yearOnly ? true : !isJan1(value)))
  const [open, setOpen] = useState(false)
  const prevValueRef = useRef(value)

  useEffect(() => {
    if (value !== prevValueRef.current) {
      prevValueRef.current = value
      if (yearOnly) {
        const full = !!value && !isJan1(value)
        setDisplayFull(full)
        setText(makeText(value, full))
      } else {
        setText(iso2dmy(value))
      }
    }
  }, [value])

  function handleTextChange(raw: string) {
    if (yearOnly) {
      // If currently showing full date, switching to typing resets to year mode
      if (displayFull) setDisplayFull(false)
      const digits = raw.replace(/\D/g, '').slice(0, 4)
      setText(digits)
      if (digits.length === 4) {
        const iso = `${digits}-01-01`
        if (isValidIso(iso)) {
          prevValueRef.current = iso
          onChange(iso)
        }
      } else if (digits === '') {
        prevValueRef.current = ''
        onChange('')
      }
    } else {
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
  }

  function handleCalendarSelect(iso: string) {
    prevValueRef.current = iso
    if (yearOnly) {
      setDisplayFull(true)
      setText(iso2dmy(iso))
    } else {
      setText(iso2dmy(iso))
    }
    onChange(iso)
    setOpen(false)
  }

  const resolvedPlaceholder = placeholder ?? (yearOnly ? 'YYYY' : 'DD/MM/YYYY')
  const maxLength = yearOnly && !displayFull ? 4 : 10

  return (
    <div className={cn('flex items-center gap-1', className)}>
      <input
        type="text"
        value={text}
        onChange={e => handleTextChange(e.target.value)}
        placeholder={resolvedPlaceholder}
        disabled={disabled}
        maxLength={maxLength}
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
            defaultViewIso={defaultViewIso}
          />
        </PopoverContent>
      </Popover>
    </div>
  )
}
