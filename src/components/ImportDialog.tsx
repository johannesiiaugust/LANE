import { useState, useRef, useCallback, useEffect, useMemo } from 'react'
import { pushEvent } from '@/lib/analytics'
import { CalendarDays, FileText, Mic, Upload, CheckCircle2, AlertCircle, X, Loader2, ChevronRight } from 'lucide-react'
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
} from '@/components/ui/dialog'
import { Button } from '@/components/ui/button'
import { Textarea } from '@/components/ui/textarea'
import type { Lane, TimelineEvent } from '@/types/timeline'
import {
  parseCalendarFile,
  mapCategoryToLane,
  isSupportedFile,
  SUPPORTED_EXTENSIONS,
  type ParsedCalendarEvent,
} from '@/lib/calendarParser'
import {
  isOpenAIConfigured,
  parseTextToEvents,
  transcribeAudio,
} from '@/lib/openai'
import { fracYearToMs } from '@/lib/constants'

export type ImportTab = 'calendar-file' | 'text' | 'voice'

interface ImportDialogProps {
  open: boolean
  onOpenChange: (open: boolean) => void
  defaultTab?: ImportTab
  lanes: Lane[]
  addEvent: (event: Omit<TimelineEvent, 'id'>) => Promise<TimelineEvent | null>
  addLane: (lane: Omit<Lane, 'id' | 'order' | 'isDefault'>) => Promise<Lane | null>
}

const MONTHS = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']
function formatImportDate(startYear: number, endYear?: number | null): string {
  const d = new Date(fracYearToMs(startYear))
  const start = `${d.getUTCDate()} ${MONTHS[d.getUTCMonth()]} ${d.getUTCFullYear()}`
  if (!endYear) return start
  const sy = Math.floor(startYear), ey = Math.floor(endYear)
  if (sy === ey) return start
  const de = new Date(fracYearToMs(endYear))
  return `${start} – ${de.getUTCDate()} ${MONTHS[de.getUTCMonth()]} ${de.getUTCFullYear()}`
}

const TABS: { id: ImportTab; label: string; icon: React.ReactNode }[] = [
  { id: 'calendar-file', label: 'Calendar File', icon: <CalendarDays className="h-4 w-4" /> },
  { id: 'text', label: 'Text', icon: <FileText className="h-4 w-4" /> },
  { id: 'voice', label: 'Voice', icon: <Mic className="h-4 w-4" /> },
]

interface CalendarFileTabProps {
  lanes: Lane[]
  addEvent: (event: Omit<TimelineEvent, 'id'>) => Promise<TimelineEvent | null>
  addLane: (lane: Omit<Lane, 'id' | 'order' | 'isDefault'>) => Promise<Lane | null>
  onDone: () => void
}

function CalendarFileTab({ lanes, addEvent, addLane, onDone }: CalendarFileTabProps) {
  const [parsedEvents, setParsedEvents] = useState<ParsedCalendarEvent[]>([])
  const [laneAssignments, setLaneAssignments] = useState<Map<number, string>>(new Map())
  const [selectedIndices, setSelectedIndices] = useState<Set<number>>(new Set())
  const [availableLanes, setAvailableLanes] = useState<Lane[]>(lanes)
  const [bulkLane, setBulkLane] = useState('')
  const [newLaneName, setNewLaneName] = useState('')
  const [fileName, setFileName] = useState('')
  const [error, setError] = useState('')
  const [importing, setImporting] = useState(false)
  const [importedCount, setImportedCount] = useState(0)
  const [importProgress, setImportProgress] = useState(0)
  const [isDragging, setIsDragging] = useState(false)
  const fileInputRef = useRef<HTMLInputElement>(null)

  const laneNames = availableLanes.map(l => l.name)

  // Group events by year (descending)
  const yearGroups = useMemo(() => {
    const groups = new Map<number, { idx: number; ev: ParsedCalendarEvent }[]>()
    for (let i = 0; i < parsedEvents.length; i++) {
      const ev = parsedEvents[i]
      const year = Math.floor(ev.startYear)
      const arr = groups.get(year)
      if (arr) arr.push({ idx: i, ev })
      else groups.set(year, [{ idx: i, ev }])
    }
    return [...groups.entries()].sort((a, b) => b[0] - a[0])
  }, [parsedEvents])

  const selectedCount = selectedIndices.size

  const processFile = useCallback((file: File) => {
    setError('')
    setParsedEvents([])
    setImportedCount(0)

    if (!isSupportedFile(file.name)) {
      setError(`Unsupported format. Use: ${SUPPORTED_EXTENSIONS.join(', ')}`)
      return
    }

    setFileName(file.name)
    const reader = new FileReader()
    reader.onload = (e) => {
      const text = e.target?.result as string
      try {
        const events = parseCalendarFile(text, file.name)
        if (events.length === 0) {
          setError('No events found in file')
          return
        }
        setParsedEvents(events)
        // Select all by default
        setSelectedIndices(new Set(events.map((_, i) => i)))
        // Set default lane assignments
        const assignments = new Map<number, string>()
        events.forEach((ev, i) => {
          assignments.set(i, mapCategoryToLane(ev.category, laneNames))
        })
        setLaneAssignments(assignments)
      } catch {
        setError('Failed to parse file')
      }
    }
    reader.onerror = () => setError('Failed to read file')
    reader.readAsText(file)
  }, [laneNames])

  const handleDrop = useCallback((e: React.DragEvent) => {
    e.preventDefault()
    setIsDragging(false)
    const file = e.dataTransfer.files[0]
    if (file) processFile(file)
  }, [processFile])

  const handleDragOver = useCallback((e: React.DragEvent) => {
    e.preventDefault()
    setIsDragging(true)
  }, [])

  const handleDragLeave = useCallback((e: React.DragEvent) => {
    e.preventDefault()
    setIsDragging(false)
  }, [])

  const handleFileSelect = useCallback((e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0]
    if (file) processFile(file)
    e.target.value = ''
  }, [processFile])

  const toggleYear = (year: number) => {
    const yearItems = yearGroups.find(([y]) => y === year)?.[1] || []
    const allSelected = yearItems.every(item => selectedIndices.has(item.idx))
    const next = new Set(selectedIndices)
    for (const item of yearItems) {
      if (allSelected) next.delete(item.idx)
      else next.add(item.idx)
    }
    setSelectedIndices(next)
  }

  const handleImport = async () => {
    setImporting(true)
    setImportProgress(0)
    let count = 0
    const selected = parsedEvents
      .map((ev, i) => ({ ev, i }))
      .filter(({ i }) => selectedIndices.has(i))
    for (let j = 0; j < selected.length; j++) {
      const { ev, i } = selected[j]
      const laneName = laneAssignments.get(i) || 'Other Activities'
      const lane = availableLanes.find(l => l.name === laneName)
      if (!lane) continue
      const result = await addEvent({
        laneId: lane.id,
        title: ev.title,
        description: ev.description,
        type: ev.endYear ? 'range' : 'point',
        startYear: ev.startYear,
        endYear: ev.endYear,
      })
      if (result) count++
      setImportProgress(j + 1)
    }
    setImportedCount(count)
    setImporting(false)
    if (count > 0) pushEvent('click', '/', 'import_calendar_file', { count })
  }

  const handleReset = () => {
    setParsedEvents([])
    setFileName('')
    setError('')
    setImportedCount(0)
    setImportProgress(0)
    setLaneAssignments(new Map())
    setSelectedIndices(new Set())
    setBulkLane('')
    setNewLaneName('')
  }

  const applyBulkLane = () => {
    if (!bulkLane || bulkLane === '__new__') return
    const next = new Map(laneAssignments)
    for (const idx of selectedIndices) next.set(idx, bulkLane)
    setLaneAssignments(next)
  }

  const handleCreateAndApplyLane = async () => {
    const name = newLaneName.trim()
    if (!name) return
    const created = await addLane({ name, color: '#6366f1', visible: true, emoji: '' })
    if (!created) return
    setAvailableLanes(prev => [...prev, created])
    const next = new Map(laneAssignments)
    for (const idx of selectedIndices) next.set(idx, name)
    setLaneAssignments(next)
    setBulkLane(name)
    setNewLaneName('')
  }

  // Success state
  if (importedCount > 0) {
    return (
      <div className="flex flex-col items-center gap-4 py-6">
        <CheckCircle2 className="h-12 w-12 text-green-500" />
        <p className="text-sm font-medium">Imported {importedCount} event{importedCount !== 1 ? 's' : ''}</p>
        <div className="flex gap-2">
          <Button variant="outline" size="sm" onClick={handleReset}>Import Another</Button>
          <Button size="sm" onClick={onDone}>Done</Button>
        </div>
      </div>
    )
  }

  // Importing state
  if (importing) {
    return (
      <div className="flex flex-col items-center gap-4 py-8">
        <Loader2 className="h-8 w-8 animate-spin text-primary" />
        <p className="text-sm text-muted-foreground">
          Importing events... {importProgress}/{selectedCount}
        </p>
        <div className="w-full bg-muted rounded-full h-2">
          <div
            className="bg-primary h-2 rounded-full transition-all"
            style={{ width: `${selectedCount > 0 ? (importProgress / selectedCount) * 100 : 0}%` }}
          />
        </div>
      </div>
    )
  }

  // Preview parsed events — grouped by year
  if (parsedEvents.length > 0) {
    return (
      <div className="flex flex-col gap-3 py-2">
        <div className="flex items-center justify-between">
          <p className="text-sm font-medium">
            {parsedEvents.length} event{parsedEvents.length !== 1 ? 's' : ''} from {fileName}
          </p>
          <div className="flex items-center gap-2">
            <span className="text-xs text-muted-foreground">{selectedCount} selected</span>
            <button onClick={handleReset} className="text-muted-foreground hover:text-foreground">
              <X className="h-4 w-4" />
            </button>
          </div>
        </div>

        {/* Bulk lane assignment */}
        <div className="flex flex-col gap-1.5 rounded-md border border-border/50 bg-muted/30 p-2">
          <div className="flex items-center gap-2">
            <span className="text-xs text-muted-foreground shrink-0">Assign all selected to:</span>
            <select
              value={bulkLane}
              onChange={(e) => { setBulkLane(e.target.value); setNewLaneName('') }}
              className="flex-1 text-xs bg-background border rounded px-1 py-0.5"
            >
              <option value="">— keep individual —</option>
              {availableLanes.map(l => (
                <option key={l.id} value={l.name}>{l.emoji ? `${l.emoji} ` : ''}{l.name}</option>
              ))}
              <option value="__new__">+ Create new lane…</option>
            </select>
            {bulkLane && bulkLane !== '__new__' && (
              <Button size="sm" variant="outline" onClick={applyBulkLane} className="shrink-0 h-6 text-xs px-2">
                Apply
              </Button>
            )}
          </div>
          {bulkLane === '__new__' && (
            <div className="flex items-center gap-2">
              <input
                value={newLaneName}
                onChange={(e) => setNewLaneName(e.target.value)}
                onKeyDown={(e) => { if (e.key === 'Enter') handleCreateAndApplyLane() }}
                placeholder="New lane name…"
                className="flex-1 text-xs bg-background border rounded px-2 py-0.5 h-6"
              />
              <Button
                size="sm"
                onClick={handleCreateAndApplyLane}
                disabled={!newLaneName.trim()}
                className="shrink-0 h-6 text-xs px-2"
              >
                Create & Apply
              </Button>
            </div>
          )}
        </div>

        <div className="max-h-72 overflow-y-auto rounded-md border">
          <table className="w-full text-xs">
            <thead className="sticky top-0 bg-muted z-10">
              <tr>
                <th className="w-7 px-2 py-1.5">
                  <input
                    type="checkbox"
                    checked={selectedCount === parsedEvents.length && parsedEvents.length > 0}
                    ref={(el) => { if (el) el.indeterminate = selectedCount > 0 && selectedCount < parsedEvents.length }}
                    onChange={() => {
                      if (selectedCount === parsedEvents.length) {
                        setSelectedIndices(new Set())
                      } else {
                        setSelectedIndices(new Set(parsedEvents.map((_, i) => i)))
                      }
                    }}
                    className="accent-primary"
                  />
                </th>
                <th className="text-left px-2 py-1.5 font-medium">Event</th>
                <th className="text-left px-2 py-1.5 font-medium">Date</th>
                <th className="text-left px-2 py-1.5 font-medium w-28">Lane</th>
              </tr>
            </thead>
            <tbody>
              {yearGroups.map(([year, items]) => {
                const yearSelectedCount = items.filter(item => selectedIndices.has(item.idx)).length
                const allYearSelected = yearSelectedCount === items.length
                const someYearSelected = yearSelectedCount > 0 && !allYearSelected
                return (
                  <FileYearGroup
                    key={year}
                    year={year}
                    items={items}
                    allSelected={allYearSelected}
                    someSelected={someYearSelected}
                    selectedIndices={selectedIndices}
                    laneAssignments={laneAssignments}
                    laneNames={laneNames}
                    onToggleYear={() => toggleYear(year)}
                    onToggleEvent={(idx) => {
                      const next = new Set(selectedIndices)
                      if (next.has(idx)) next.delete(idx)
                      else next.add(idx)
                      setSelectedIndices(next)
                    }}
                    onSetLane={(idx, lane) => {
                      const next = new Map(laneAssignments)
                      next.set(idx, lane)
                      setLaneAssignments(next)
                    }}
                  />
                )
              })}
            </tbody>
          </table>
        </div>

        <Button onClick={handleImport} disabled={selectedCount === 0} className="w-full">
          Import {selectedCount} Event{selectedCount !== 1 ? 's' : ''}
        </Button>
      </div>
    )
  }

  return (
    <div className="flex flex-col items-center gap-4 py-4">
      <div
        onDrop={handleDrop}
        onDragOver={handleDragOver}
        onDragLeave={handleDragLeave}
        onClick={() => fileInputRef.current?.click()}
        className={`flex flex-col items-center justify-center w-full h-40 rounded-lg border-2 border-dashed cursor-pointer transition-colors ${
          isDragging
            ? 'border-primary bg-primary/5'
            : 'border-muted-foreground/30 bg-muted/30 hover:border-muted-foreground/50'
        }`}
      >
        <Upload className={`h-8 w-8 mb-2 ${isDragging ? 'text-primary' : 'text-muted-foreground/50'}`} />
        <p className="text-sm text-muted-foreground">
          {isDragging ? 'Drop file here' : 'Drop calendar file or click to browse'}
        </p>
        <p className="text-xs text-muted-foreground/60 mt-1">
          Supports ICS, VCS, CSV, JSON, XML, TSV
        </p>
      </div>
      <input
        ref={fileInputRef}
        type="file"
        accept={SUPPORTED_EXTENSIONS.join(',')}
        onChange={handleFileSelect}
        className="hidden"
      />
      {error && (
        <div className="flex items-center gap-2 text-sm text-destructive">
          <AlertCircle className="h-4 w-4 shrink-0" />
          {error}
        </div>
      )}
    </div>
  )
}

interface FileYearGroupProps {
  year: number
  items: { idx: number; ev: ParsedCalendarEvent }[]
  allSelected: boolean
  someSelected: boolean
  selectedIndices: Set<number>
  laneAssignments: Map<number, string>
  laneNames: string[]
  onToggleYear: () => void
  onToggleEvent: (idx: number) => void
  onSetLane: (idx: number, lane: string) => void
}

function FileYearGroup({
  year, items, allSelected, someSelected,
  selectedIndices, laneAssignments, laneNames,
  onToggleYear, onToggleEvent, onSetLane,
}: FileYearGroupProps) {
  const [collapsed, setCollapsed] = useState(false)

  return (
    <>
      <tr className="bg-muted/50 border-t border-muted">
        <td className="px-2 py-1">
          <input
            type="checkbox"
            checked={allSelected}
            ref={(el) => { if (el) el.indeterminate = someSelected }}
            onChange={onToggleYear}
            className="accent-primary"
          />
        </td>
        <td
          colSpan={2}
          className="px-2 py-1 font-medium cursor-pointer select-none"
          onClick={() => setCollapsed(!collapsed)}
        >
          <span className="inline-flex items-center gap-1">
            <ChevronRight className={`h-3 w-3 transition-transform ${collapsed ? '' : 'rotate-90'}`} />
            {year}
          </span>
        </td>
        <td className="px-2 py-1 text-muted-foreground text-right">
          {items.length} event{items.length !== 1 ? 's' : ''}
        </td>
      </tr>
      {!collapsed && items.map(({ idx, ev }) => (
        <tr key={idx} className="border-t border-muted/50">
          <td className="px-2 py-1">
            <input
              type="checkbox"
              checked={selectedIndices.has(idx)}
              onChange={() => onToggleEvent(idx)}
              className="accent-primary"
            />
          </td>
          <td className="px-2 py-1 truncate max-w-[160px]" title={ev.title}>
            {ev.title}
          </td>
          <td className="px-2 py-1 text-muted-foreground whitespace-nowrap">
            {formatImportDate(ev.startYear, ev.endYear)}
          </td>
          <td className="px-2 py-1">
            <select
              value={laneAssignments.get(idx) || 'Other Activities'}
              onChange={(e) => onSetLane(idx, e.target.value)}
              className="w-full text-xs bg-transparent border rounded px-1 py-0.5"
            >
              {laneNames.map(name => (
                <option key={name} value={name}>{name}</option>
              ))}
            </select>
          </td>
        </tr>
      ))}
    </>
  )
}


interface TextTabProps {
  lanes: Lane[]
  addEvent: (event: Omit<TimelineEvent, 'id'>) => Promise<TimelineEvent | null>
  addLane: (lane: Omit<Lane, 'id' | 'order' | 'isDefault'>) => Promise<Lane | null>
  onDone: () => void
}

function TextTab({ lanes, addEvent, addLane, onDone }: TextTabProps) {
  const [text, setText] = useState('')
  const [phase, setPhase] = useState<'input' | 'parsing' | 'preview' | 'importing' | 'success'>('input')
  const [error, setError] = useState('')
  const [parsedEvents, setParsedEvents] = useState<ParsedCalendarEvent[]>([])
  const [selectedIndices, setSelectedIndices] = useState<Set<number>>(new Set())
  const [laneAssignments, setLaneAssignments] = useState<Map<number, string>>(new Map())
  const [importedCount, setImportedCount] = useState(0)
  const [importProgress, setImportProgress] = useState(0)
  const [availableLanes, setAvailableLanes] = useState<Lane[]>(lanes)
  const [bulkLane, setBulkLane] = useState('')
  const [newLaneName, setNewLaneName] = useState('')

  const laneNames = availableLanes.map(l => l.name)

  const yearGroups = useMemo(() => {
    const groups = new Map<number, { idx: number; ev: ParsedCalendarEvent }[]>()
    for (let i = 0; i < parsedEvents.length; i++) {
      const ev = parsedEvents[i]
      const year = Math.floor(ev.startYear)
      const arr = groups.get(year)
      if (arr) arr.push({ idx: i, ev })
      else groups.set(year, [{ idx: i, ev }])
    }
    return [...groups.entries()].sort((a, b) => b[0] - a[0])
  }, [parsedEvents])

  const selectedCount = selectedIndices.size

  const handleParse = async () => {
    if (!text.trim()) return
    setError('')
    setPhase('parsing')
    try {
      const events = await parseTextToEvents(text.trim(), laneNames)
      if (events.length === 0) {
        setError('No events could be extracted from the text')
        setPhase('input')
        return
      }
      setParsedEvents(events)
      setSelectedIndices(new Set(events.map((_, i) => i)))
      const assignments = new Map<number, string>()
      events.forEach((ev, i) => {
        assignments.set(i, mapCategoryToLane(ev.category, laneNames))
      })
      setLaneAssignments(assignments)
      setPhase('preview')
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to parse text')
      setPhase('input')
    }
  }

  const toggleYear = (year: number) => {
    const yearItems = yearGroups.find(([y]) => y === year)?.[1] || []
    const allSelected = yearItems.every(item => selectedIndices.has(item.idx))
    const next = new Set(selectedIndices)
    for (const item of yearItems) {
      if (allSelected) next.delete(item.idx)
      else next.add(item.idx)
    }
    setSelectedIndices(next)
  }

  const handleImport = async () => {
    setPhase('importing')
    setImportProgress(0)
    let count = 0
    const selected = parsedEvents
      .map((ev, i) => ({ ev, i }))
      .filter(({ i }) => selectedIndices.has(i))
    for (let j = 0; j < selected.length; j++) {
      const { ev, i } = selected[j]
      const laneName = laneAssignments.get(i) || 'Other Activities'
      const lane = availableLanes.find(l => l.name === laneName)
      if (!lane) continue
      const result = await addEvent({
        laneId: lane.id,
        title: ev.title,
        description: ev.description,
        type: ev.endYear ? 'range' : 'point',
        startYear: ev.startYear,
        endYear: ev.endYear,
      })
      if (result) count++
      setImportProgress(j + 1)
    }
    setImportedCount(count)
    setPhase('success')
    if (count > 0) pushEvent('click', '/', 'import_text_ai', { count })
  }

  const handleReset = () => {
    setText('')
    setParsedEvents([])
    setSelectedIndices(new Set())
    setLaneAssignments(new Map())
    setError('')
    setImportedCount(0)
    setImportProgress(0)
    setBulkLane('')
    setNewLaneName('')
    setPhase('input')
  }

  const applyBulkLane = () => {
    if (!bulkLane || bulkLane === '__new__') return
    const next = new Map(laneAssignments)
    for (const idx of selectedIndices) next.set(idx, bulkLane)
    setLaneAssignments(next)
  }

  const handleCreateAndApplyLane = async () => {
    const name = newLaneName.trim()
    if (!name) return
    const created = await addLane({ name, color: '#6366f1', visible: true, emoji: '' })
    if (!created) return
    setAvailableLanes(prev => [...prev, created])
    const next = new Map(laneAssignments)
    for (const idx of selectedIndices) next.set(idx, name)
    setLaneAssignments(next)
    setBulkLane(name)
    setNewLaneName('')
  }

  if (!isOpenAIConfigured()) {
    return (
      <div className="flex flex-col items-center gap-3 py-6">
        <FileText className="h-10 w-10 text-muted-foreground/40" />
        <p className="text-sm text-muted-foreground text-center">
          Text import requires an OpenAI API key.<br />
          Set <code className="text-xs bg-muted px-1 py-0.5 rounded">OPENAI_API_KEY</code> in your .env file.
        </p>
      </div>
    )
  }

  if (phase === 'success') {
    return (
      <div className="flex flex-col items-center gap-4 py-6">
        <CheckCircle2 className="h-12 w-12 text-green-500" />
        <p className="text-sm font-medium">Imported {importedCount} event{importedCount !== 1 ? 's' : ''}</p>
        <div className="flex gap-2">
          <Button variant="outline" size="sm" onClick={handleReset}>Import More</Button>
          <Button size="sm" onClick={onDone}>Done</Button>
        </div>
      </div>
    )
  }

  if (phase === 'importing') {
    return (
      <div className="flex flex-col items-center gap-4 py-8">
        <Loader2 className="h-8 w-8 animate-spin text-primary" />
        <p className="text-sm text-muted-foreground">
          Importing events... {importProgress}/{selectedCount}
        </p>
        <div className="w-full bg-muted rounded-full h-2">
          <div
            className="bg-primary h-2 rounded-full transition-all"
            style={{ width: `${selectedCount > 0 ? (importProgress / selectedCount) * 100 : 0}%` }}
          />
        </div>
      </div>
    )
  }

  if (phase === 'parsing') {
    return (
      <div className="flex flex-col items-center gap-4 py-8">
        <Loader2 className="h-8 w-8 animate-spin text-primary" />
        <p className="text-sm text-muted-foreground">Parsing events with AI...</p>
      </div>
    )
  }

  if (phase === 'preview') {
    return (
      <div className="flex flex-col gap-3 py-2">
        <div className="flex items-center justify-between">
          <p className="text-sm font-medium">
            {parsedEvents.length} event{parsedEvents.length !== 1 ? 's' : ''} found
          </p>
          <div className="flex items-center gap-2">
            <span className="text-xs text-muted-foreground">{selectedCount} selected</span>
            <button onClick={handleReset} className="text-muted-foreground hover:text-foreground">
              <X className="h-4 w-4" />
            </button>
          </div>
        </div>

        {/* Bulk lane assignment */}
        <div className="flex flex-col gap-1.5 rounded-md border border-border/50 bg-muted/30 p-2">
          <div className="flex items-center gap-2">
            <span className="text-xs text-muted-foreground shrink-0">Assign all selected to:</span>
            <select
              value={bulkLane}
              onChange={(e) => { setBulkLane(e.target.value); setNewLaneName('') }}
              className="flex-1 text-xs bg-background border rounded px-1 py-0.5"
            >
              <option value="">— keep individual —</option>
              {availableLanes.map(l => (
                <option key={l.id} value={l.name}>{l.emoji ? `${l.emoji} ` : ''}{l.name}</option>
              ))}
              <option value="__new__">+ Create new lane…</option>
            </select>
            {bulkLane && bulkLane !== '__new__' && (
              <Button size="sm" variant="outline" onClick={applyBulkLane} className="shrink-0 h-6 text-xs px-2">
                Apply
              </Button>
            )}
          </div>
          {bulkLane === '__new__' && (
            <div className="flex items-center gap-2">
              <input
                value={newLaneName}
                onChange={(e) => setNewLaneName(e.target.value)}
                onKeyDown={(e) => { if (e.key === 'Enter') handleCreateAndApplyLane() }}
                placeholder="New lane name…"
                className="flex-1 text-xs bg-background border rounded px-2 py-0.5 h-6"
              />
              <Button
                size="sm"
                onClick={handleCreateAndApplyLane}
                disabled={!newLaneName.trim()}
                className="shrink-0 h-6 text-xs px-2"
              >
                Create & Apply
              </Button>
            </div>
          )}
        </div>

        <div className="max-h-72 overflow-y-auto rounded-md border">
          <table className="w-full text-xs">
            <thead className="sticky top-0 bg-muted z-10">
              <tr>
                <th className="w-7 px-2 py-1.5">
                  <input
                    type="checkbox"
                    checked={selectedCount === parsedEvents.length && parsedEvents.length > 0}
                    ref={(el) => { if (el) el.indeterminate = selectedCount > 0 && selectedCount < parsedEvents.length }}
                    onChange={() => {
                      if (selectedCount === parsedEvents.length) {
                        setSelectedIndices(new Set())
                      } else {
                        setSelectedIndices(new Set(parsedEvents.map((_, i) => i)))
                      }
                    }}
                    className="accent-primary"
                  />
                </th>
                <th className="text-left px-2 py-1.5 font-medium">Event</th>
                <th className="text-left px-2 py-1.5 font-medium">Date</th>
                <th className="text-left px-2 py-1.5 font-medium w-28">Lane</th>
              </tr>
            </thead>
            <tbody>
              {yearGroups.map(([year, items]) => {
                const yearSelectedCount = items.filter(item => selectedIndices.has(item.idx)).length
                const allYearSelected = yearSelectedCount === items.length
                const someYearSelected = yearSelectedCount > 0 && !allYearSelected
                return (
                  <FileYearGroup
                    key={year}
                    year={year}
                    items={items}
                    allSelected={allYearSelected}
                    someSelected={someYearSelected}
                    selectedIndices={selectedIndices}
                    laneAssignments={laneAssignments}
                    laneNames={laneNames}
                    onToggleYear={() => toggleYear(year)}
                    onToggleEvent={(idx) => {
                      const next = new Set(selectedIndices)
                      if (next.has(idx)) next.delete(idx)
                      else next.add(idx)
                      setSelectedIndices(next)
                    }}
                    onSetLane={(idx, lane) => {
                      const next = new Map(laneAssignments)
                      next.set(idx, lane)
                      setLaneAssignments(next)
                    }}
                  />
                )
              })}
            </tbody>
          </table>
        </div>

        <Button onClick={handleImport} disabled={selectedCount === 0} className="w-full">
          Import {selectedCount} Event{selectedCount !== 1 ? 's' : ''}
        </Button>
      </div>
    )
  }

  // Input phase
  return (
    <div className="flex flex-col gap-4 py-4">
      <Textarea
        placeholder={"Describe your events...\n\ne.g. \"I lived in NYC from 2015 to 2019, worked at Google from 2016 to 2020, graduated MIT in 2015\""}
        className="min-h-[140px] resize-none"
        value={text}
        onChange={(e) => setText(e.target.value)}
      />
      <p className="text-xs text-muted-foreground">
        Describe events in natural language. Dates, date ranges, and descriptions will be parsed automatically.
      </p>
      {error && (
        <div className="flex items-center gap-2 text-sm text-destructive">
          <AlertCircle className="h-4 w-4 shrink-0" />
          {error}
        </div>
      )}
      <Button onClick={handleParse} disabled={!text.trim()} className="w-full">Parse &amp; Import</Button>
    </div>
  )
}

interface VoiceTabProps {
  lanes: Lane[]
  addEvent: (event: Omit<TimelineEvent, 'id'>) => Promise<TimelineEvent | null>
  addLane: (lane: Omit<Lane, 'id' | 'order' | 'isDefault'>) => Promise<Lane | null>
  onDone: () => void
}

type VoicePhase = 'idle' | 'recording' | 'transcribing' | 'review' | 'parsing' | 'preview' | 'importing' | 'success'

function VoiceTab({ lanes, addEvent, addLane, onDone }: VoiceTabProps) {
  const [phase, setPhase] = useState<VoicePhase>('idle')
  const [error, setError] = useState('')
  const [transcript, setTranscript] = useState('')
  const [elapsed, setElapsed] = useState(0)

  // Recording refs
  const mediaRecorderRef = useRef<MediaRecorder | null>(null)
  const chunksRef = useRef<Blob[]>([])
  const streamRef = useRef<MediaStream | null>(null)
  const timerRef = useRef<ReturnType<typeof setInterval> | null>(null)

  // Preview state (same pattern as TextTab)
  const [parsedEvents, setParsedEvents] = useState<ParsedCalendarEvent[]>([])
  const [selectedIndices, setSelectedIndices] = useState<Set<number>>(new Set())
  const [laneAssignments, setLaneAssignments] = useState<Map<number, string>>(new Map())
  const [importedCount, setImportedCount] = useState(0)
  const [importProgress, setImportProgress] = useState(0)
  const [availableLanes, setAvailableLanes] = useState<Lane[]>(lanes)
  const [bulkLane, setBulkLane] = useState('')
  const [newLaneName, setNewLaneName] = useState('')

  const laneNames = availableLanes.map(l => l.name)

  const yearGroups = useMemo(() => {
    const groups = new Map<number, { idx: number; ev: ParsedCalendarEvent }[]>()
    for (let i = 0; i < parsedEvents.length; i++) {
      const ev = parsedEvents[i]
      const year = Math.floor(ev.startYear)
      const arr = groups.get(year)
      if (arr) arr.push({ idx: i, ev })
      else groups.set(year, [{ idx: i, ev }])
    }
    return [...groups.entries()].sort((a, b) => b[0] - a[0])
  }, [parsedEvents])

  const selectedCount = selectedIndices.size

  // Cleanup on unmount
  useEffect(() => {
    return () => {
      if (streamRef.current) {
        streamRef.current.getTracks().forEach(t => t.stop())
      }
      if (timerRef.current) {
        clearInterval(timerRef.current)
      }
    }
  }, [])

  const startRecording = async () => {
    setError('')
    try {
      const stream = await navigator.mediaDevices.getUserMedia({ audio: true })
      streamRef.current = stream

      // Auto-detect supported MIME type
      const mimeType = ['audio/webm', 'audio/ogg', 'audio/mp4']
        .find(t => MediaRecorder.isTypeSupported(t)) || ''

      const recorder = new MediaRecorder(stream, mimeType ? { mimeType } : undefined)
      mediaRecorderRef.current = recorder
      chunksRef.current = []

      recorder.ondataavailable = (e) => {
        if (e.data.size > 0) chunksRef.current.push(e.data)
      }

      recorder.onstop = async () => {
        // Stop all tracks
        stream.getTracks().forEach(t => t.stop())
        streamRef.current = null
        if (timerRef.current) {
          clearInterval(timerRef.current)
          timerRef.current = null
        }

        const blob = new Blob(chunksRef.current, { type: recorder.mimeType || 'audio/webm' })
        if (blob.size === 0) {
          setError('No audio recorded')
          setPhase('idle')
          return
        }

        setPhase('transcribing')
        try {
          const text = await transcribeAudio(blob)
          if (!text.trim()) {
            setError('No speech detected in recording')
            setPhase('idle')
            return
          }
          setTranscript(text)
          setPhase('review')
        } catch (err) {
          setError(err instanceof Error ? err.message : 'Transcription failed')
          setPhase('idle')
        }
      }

      recorder.start()
      setElapsed(0)
      setPhase('recording')
      timerRef.current = setInterval(() => {
        setElapsed(prev => prev + 1)
      }, 1000)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not access microphone')
    }
  }

  const stopRecording = () => {
    if (mediaRecorderRef.current && mediaRecorderRef.current.state !== 'inactive') {
      mediaRecorderRef.current.stop()
    }
  }

  const handleParse = async () => {
    if (!transcript.trim()) return
    setError('')
    setPhase('parsing')
    try {
      const events = await parseTextToEvents(transcript.trim(), laneNames)
      if (events.length === 0) {
        setError('No events could be extracted from the transcript')
        setPhase('review')
        return
      }
      setParsedEvents(events)
      setSelectedIndices(new Set(events.map((_, i) => i)))
      const assignments = new Map<number, string>()
      events.forEach((ev, i) => {
        assignments.set(i, mapCategoryToLane(ev.category, laneNames))
      })
      setLaneAssignments(assignments)
      setPhase('preview')
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to parse transcript')
      setPhase('review')
    }
  }

  const toggleYear = (year: number) => {
    const yearItems = yearGroups.find(([y]) => y === year)?.[1] || []
    const allSelected = yearItems.every(item => selectedIndices.has(item.idx))
    const next = new Set(selectedIndices)
    for (const item of yearItems) {
      if (allSelected) next.delete(item.idx)
      else next.add(item.idx)
    }
    setSelectedIndices(next)
  }

  const handleImport = async () => {
    setPhase('importing')
    setImportProgress(0)
    let count = 0
    const selected = parsedEvents
      .map((ev, i) => ({ ev, i }))
      .filter(({ i }) => selectedIndices.has(i))
    for (let j = 0; j < selected.length; j++) {
      const { ev, i } = selected[j]
      const laneName = laneAssignments.get(i) || 'Other Activities'
      const lane = availableLanes.find(l => l.name === laneName)
      if (!lane) continue
      const result = await addEvent({
        laneId: lane.id,
        title: ev.title,
        description: ev.description,
        type: ev.endYear ? 'range' : 'point',
        startYear: ev.startYear,
        endYear: ev.endYear,
      })
      if (result) count++
      setImportProgress(j + 1)
    }
    setImportedCount(count)
    setPhase('success')
    if (count > 0) pushEvent('click', '/', 'import_voice_ai', { count })
  }

  const handleReset = () => {
    setTranscript('')
    setParsedEvents([])
    setSelectedIndices(new Set())
    setLaneAssignments(new Map())
    setError('')
    setImportedCount(0)
    setImportProgress(0)
    setElapsed(0)
    setBulkLane('')
    setNewLaneName('')
    setPhase('idle')
  }

  const applyBulkLane = () => {
    if (!bulkLane || bulkLane === '__new__') return
    const next = new Map(laneAssignments)
    for (const idx of selectedIndices) next.set(idx, bulkLane)
    setLaneAssignments(next)
  }

  const handleCreateAndApplyLane = async () => {
    const name = newLaneName.trim()
    if (!name) return
    const created = await addLane({ name, color: '#6366f1', visible: true, emoji: '' })
    if (!created) return
    setAvailableLanes(prev => [...prev, created])
    const next = new Map(laneAssignments)
    for (const idx of selectedIndices) next.set(idx, name)
    setLaneAssignments(next)
    setBulkLane(name)
    setNewLaneName('')
  }

  const formatTime = (seconds: number) => {
    const m = Math.floor(seconds / 60)
    const s = seconds % 60
    return `${m}:${s.toString().padStart(2, '0')}`
  }

  if (!isOpenAIConfigured()) {
    return (
      <div className="flex flex-col items-center gap-3 py-6">
        <Mic className="h-10 w-10 text-muted-foreground/40" />
        <p className="text-sm text-muted-foreground text-center">
          Voice import requires an OpenAI API key.<br />
          Set <code className="text-xs bg-muted px-1 py-0.5 rounded">OPENAI_API_KEY</code> in your .env file.
        </p>
      </div>
    )
  }

  if (phase === 'success') {
    return (
      <div className="flex flex-col items-center gap-4 py-6">
        <CheckCircle2 className="h-12 w-12 text-green-500" />
        <p className="text-sm font-medium">Imported {importedCount} event{importedCount !== 1 ? 's' : ''}</p>
        <div className="flex gap-2">
          <Button variant="outline" size="sm" onClick={handleReset}>Record Another</Button>
          <Button size="sm" onClick={onDone}>Done</Button>
        </div>
      </div>
    )
  }

  if (phase === 'importing') {
    return (
      <div className="flex flex-col items-center gap-4 py-8">
        <Loader2 className="h-8 w-8 animate-spin text-primary" />
        <p className="text-sm text-muted-foreground">
          Importing events... {importProgress}/{selectedCount}
        </p>
        <div className="w-full bg-muted rounded-full h-2">
          <div
            className="bg-primary h-2 rounded-full transition-all"
            style={{ width: `${selectedCount > 0 ? (importProgress / selectedCount) * 100 : 0}%` }}
          />
        </div>
      </div>
    )
  }

  if (phase === 'transcribing') {
    return (
      <div className="flex flex-col items-center gap-4 py-8">
        <Loader2 className="h-8 w-8 animate-spin text-primary" />
        <p className="text-sm text-muted-foreground">Transcribing audio...</p>
      </div>
    )
  }

  if (phase === 'parsing') {
    return (
      <div className="flex flex-col items-center gap-4 py-8">
        <Loader2 className="h-8 w-8 animate-spin text-primary" />
        <p className="text-sm text-muted-foreground">Parsing events with AI...</p>
      </div>
    )
  }

  if (phase === 'preview') {
    return (
      <div className="flex flex-col gap-3 py-2">
        <div className="flex items-center justify-between">
          <p className="text-sm font-medium">
            {parsedEvents.length} event{parsedEvents.length !== 1 ? 's' : ''} found
          </p>
          <div className="flex items-center gap-2">
            <span className="text-xs text-muted-foreground">{selectedCount} selected</span>
            <button onClick={handleReset} className="text-muted-foreground hover:text-foreground">
              <X className="h-4 w-4" />
            </button>
          </div>
        </div>

        {/* Bulk lane assignment */}
        <div className="flex flex-col gap-1.5 rounded-md border border-border/50 bg-muted/30 p-2">
          <div className="flex items-center gap-2">
            <span className="text-xs text-muted-foreground shrink-0">Assign all selected to:</span>
            <select
              value={bulkLane}
              onChange={(e) => { setBulkLane(e.target.value); setNewLaneName('') }}
              className="flex-1 text-xs bg-background border rounded px-1 py-0.5"
            >
              <option value="">— keep individual —</option>
              {availableLanes.map(l => (
                <option key={l.id} value={l.name}>{l.emoji ? `${l.emoji} ` : ''}{l.name}</option>
              ))}
              <option value="__new__">+ Create new lane…</option>
            </select>
            {bulkLane && bulkLane !== '__new__' && (
              <Button size="sm" variant="outline" onClick={applyBulkLane} className="shrink-0 h-6 text-xs px-2">
                Apply
              </Button>
            )}
          </div>
          {bulkLane === '__new__' && (
            <div className="flex items-center gap-2">
              <input
                value={newLaneName}
                onChange={(e) => setNewLaneName(e.target.value)}
                onKeyDown={(e) => { if (e.key === 'Enter') handleCreateAndApplyLane() }}
                placeholder="New lane name…"
                className="flex-1 text-xs bg-background border rounded px-2 py-0.5 h-6"
              />
              <Button
                size="sm"
                onClick={handleCreateAndApplyLane}
                disabled={!newLaneName.trim()}
                className="shrink-0 h-6 text-xs px-2"
              >
                Create & Apply
              </Button>
            </div>
          )}
        </div>

        <div className="max-h-72 overflow-y-auto rounded-md border">
          <table className="w-full text-xs">
            <thead className="sticky top-0 bg-muted z-10">
              <tr>
                <th className="w-7 px-2 py-1.5">
                  <input
                    type="checkbox"
                    checked={selectedCount === parsedEvents.length && parsedEvents.length > 0}
                    ref={(el) => { if (el) el.indeterminate = selectedCount > 0 && selectedCount < parsedEvents.length }}
                    onChange={() => {
                      if (selectedCount === parsedEvents.length) {
                        setSelectedIndices(new Set())
                      } else {
                        setSelectedIndices(new Set(parsedEvents.map((_, i) => i)))
                      }
                    }}
                    className="accent-primary"
                  />
                </th>
                <th className="text-left px-2 py-1.5 font-medium">Event</th>
                <th className="text-left px-2 py-1.5 font-medium">Date</th>
                <th className="text-left px-2 py-1.5 font-medium w-28">Lane</th>
              </tr>
            </thead>
            <tbody>
              {yearGroups.map(([year, items]) => {
                const yearSelectedCount = items.filter(item => selectedIndices.has(item.idx)).length
                const allYearSelected = yearSelectedCount === items.length
                const someYearSelected = yearSelectedCount > 0 && !allYearSelected
                return (
                  <FileYearGroup
                    key={year}
                    year={year}
                    items={items}
                    allSelected={allYearSelected}
                    someSelected={someYearSelected}
                    selectedIndices={selectedIndices}
                    laneAssignments={laneAssignments}
                    laneNames={laneNames}
                    onToggleYear={() => toggleYear(year)}
                    onToggleEvent={(idx) => {
                      const next = new Set(selectedIndices)
                      if (next.has(idx)) next.delete(idx)
                      else next.add(idx)
                      setSelectedIndices(next)
                    }}
                    onSetLane={(idx, lane) => {
                      const next = new Map(laneAssignments)
                      next.set(idx, lane)
                      setLaneAssignments(next)
                    }}
                  />
                )
              })}
            </tbody>
          </table>
        </div>

        <Button onClick={handleImport} disabled={selectedCount === 0} className="w-full">
          Import {selectedCount} Event{selectedCount !== 1 ? 's' : ''}
        </Button>
      </div>
    )
  }

  if (phase === 'review') {
    return (
      <div className="flex flex-col gap-4 py-4">
        <Textarea
          value={transcript}
          onChange={(e) => setTranscript(e.target.value)}
          className="min-h-[120px] resize-none"
          placeholder="Transcript will appear here..."
        />
        {error && (
          <div className="flex items-center gap-2 text-sm text-destructive">
            <AlertCircle className="h-4 w-4 shrink-0" />
            {error}
          </div>
        )}
        <div className="flex gap-2">
          <Button variant="outline" onClick={handleReset} className="flex-1">Re-record</Button>
          <Button onClick={handleParse} disabled={!transcript.trim()} className="flex-1">Parse Events</Button>
        </div>
      </div>
    )
  }

  if (phase === 'recording') {
    return (
      <div className="flex flex-col items-center gap-4 py-4">
        <div className="relative">
          <div className="h-16 w-16 rounded-full bg-red-500/10 flex items-center justify-center animate-pulse">
            <div className="h-10 w-10 rounded-full bg-red-500/20 flex items-center justify-center">
              <div className="h-5 w-5 rounded-full bg-red-500" />
            </div>
          </div>
        </div>
        <p className="text-sm font-medium tabular-nums">{formatTime(elapsed)}</p>
        <p className="text-xs text-muted-foreground">Recording...</p>
        <Button variant="destructive" size="sm" className="gap-2" onClick={stopRecording}>
          Stop Recording
        </Button>
      </div>
    )
  }

  // Idle phase
  return (
    <div className="flex flex-col items-center gap-4 py-4">
      <div className="h-16 w-16 rounded-full bg-muted/50 flex items-center justify-center">
        <Mic className="h-8 w-8 text-muted-foreground" />
      </div>
      <Button variant="outline" className="gap-2" onClick={startRecording}>
        <Mic className="h-4 w-4" />
        Start Recording
      </Button>
      <p className="text-xs text-muted-foreground text-center">
        Dictate your life events and they&apos;ll be transcribed and added to your timeline
      </p>
      {error && (
        <div className="flex items-center gap-2 text-sm text-destructive">
          <AlertCircle className="h-4 w-4 shrink-0" />
          {error}
        </div>
      )}
    </div>
  )
}

export function ImportDialog({ open, onOpenChange, defaultTab = 'calendar-file', lanes, addEvent, addLane }: ImportDialogProps) {
  const [activeTab, setActiveTab] = useState<ImportTab>(defaultTab)

  // Sync defaultTab when dialog opens with a different tab
  const handleOpenChange = (v: boolean) => {
    if (v) setActiveTab(defaultTab)
    onOpenChange(v)
  }

  const isWide = true

  return (
    <Dialog open={open} onOpenChange={handleOpenChange}>
      <DialogContent className={isWide ? 'sm:max-w-2xl' : 'sm:max-w-md'}>
        <DialogHeader>
          <DialogTitle>Import Events</DialogTitle>
        </DialogHeader>

        {/* Tab navigation */}
        <div className="flex gap-1 rounded-lg bg-muted p-1">
          {TABS.map(tab => (
            <button
              key={tab.id}
              onClick={() => setActiveTab(tab.id)}
              className={`flex-1 flex items-center justify-center gap-1.5 rounded-md px-2 py-1.5 text-xs font-medium transition-colors ${
                activeTab === tab.id
                  ? 'bg-background text-foreground shadow-sm'
                  : 'text-muted-foreground hover:text-foreground'
              }`}
            >
              {tab.icon}
              <span className="hidden sm:inline">{tab.label}</span>
            </button>
          ))}
        </div>

        {activeTab === 'calendar-file' && (
          <CalendarFileTab lanes={lanes} addEvent={addEvent} addLane={addLane} onDone={() => onOpenChange(false)} />
        )}
{activeTab === 'text' && <TextTab lanes={lanes} addEvent={addEvent} addLane={addLane} onDone={() => onOpenChange(false)} />}
        {activeTab === 'voice' && <VoiceTab lanes={lanes} addEvent={addEvent} addLane={addLane} onDone={() => onOpenChange(false)} />}
      </DialogContent>
    </Dialog>
  )
}
