import { useState, useRef, useCallback, useEffect } from 'react'
import { X, Send, Mic, MicOff, Loader2, Check, CheckCheck, Pencil } from 'lucide-react'
import { cn } from '@/lib/utils'
import { isOpenAIConfigured, transcribeAudio } from '@/lib/openai'
import { useTranslation } from '@/i18n'
import type { Lane, TimelineEvent } from '@/types/timeline'

// ── Types ────────────────────────────────────────────────────────────────────

interface ProposedEvent {
  type: 'event'
  action: 'create' | 'edit' | 'delete'
  id?: string  // required for edit/delete
  title: string
  lane: string
  eventType: 'range' | 'point'
  startYear: number
  endYear?: number | null
  description: string
  location?: string
  color?: string
  emoji?: string
}

interface ProposedLane {
  type: 'lane'
  action: 'create' | 'edit' | 'delete'
  id?: string
  name: string
  color: string
  emoji?: string
}

interface ProposedTimeline {
  type: 'timeline'
  action: 'create' | 'delete'
  id?: string
  name: string
}

type ProposedItem = ProposedEvent | ProposedLane | ProposedTimeline

interface ChatMessage {
  role: 'user' | 'assistant'
  content: string
  proposals?: ProposedItem[]
  proposalStatus?: ('pending' | 'accepted' | 'rejected')[]
}

interface LenaAssistantProps {
  lanes: Lane[]
  events: TimelineEvent[]
  addEvent: (event: Omit<TimelineEvent, 'id'>) => Promise<TimelineEvent | null>
  updateEvent: (id: string, updates: Partial<Omit<TimelineEvent, 'id'>>) => Promise<void>
  deleteEvent: (id: string) => Promise<void>
  addLane: (lane: Omit<Lane, 'id' | 'order' | 'isDefault'>) => Promise<Lane | null>
  updateLane: (id: string, updates: Partial<Omit<Lane, 'id' | 'isDefault'>>) => Promise<void>
  deleteLane: (id: string) => Promise<void>
  createTimeline: (name?: string, emoji?: string, color?: string, withDefaultLanes?: boolean) => Promise<string | null>
  demoMode?: boolean
  onSignUp?: () => void
}

// ── Helpers ──────────────────────────────────────────────────────────────────


function formatYear(y: number): string {
  const year = Math.floor(y)
  const monthFrac = y - year
  const monthNames = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
  const monthIdx = Math.min(11, Math.round(monthFrac * 12))
  return monthFrac > 0.01 ? `${monthNames[monthIdx]} ${year}` : `${year}`
}

function buildSystemPrompt(laneNames: string[], existingEvents: { id: string; title: string; lane: string; startYear: number; endYear?: number }[]): string {
  const now = new Date()
  const currentYear = now.getFullYear()
  const currentMonth = now.getMonth()
  const currentFrac = currentYear + currentMonth / 12

  const recentEvents = existingEvents.slice(0, 50).map(e =>
    `- [${e.id.slice(0, 8)}] "${e.title}" in ${e.lane} (${e.startYear}${e.endYear ? `–${e.endYear}` : ''})`
  ).join('\n')

  return `You are Lina, a friendly AI assistant for LifeLANE — a personal life timeline app.
You help users create, edit, and delete events, lanes, and timelines.

Available lanes: ${JSON.stringify(laneNames)}
Current date: ${now.toISOString().slice(0, 10)} (fractional year: ${currentFrac.toFixed(3)})

Existing events (recent):
${recentEvents || '(none yet)'}

You support full CRUD operations:
- **Create**: Add new events, lanes, or timelines
- **Edit**: Modify existing events or lanes (user must reference which one)
- **Delete**: Remove existing events, lanes, or timelines (user must reference which one)

When the user describes what they want:
1. Determine the operation (create/edit/delete) and target (event/lane/timeline)
2. If missing critical info, ask ONE concise follow-up question
3. When ready, respond with a brief message AND a JSON proposal block on a new line

The JSON block must be on its own line, starting with {"action":"propose":
{"action":"propose","items":[...]}

For CREATING events:
{"action":"propose","items":[{"type":"event","action":"create","title":"...","lane":"...","eventType":"range"|"point","startYear":2020.5,"endYear":2021.0,"description":"...","location":"..."}]}

For EDITING events (include the id from the existing events list):
{"action":"propose","items":[{"type":"event","action":"edit","id":"full-uuid","title":"New Title","lane":"Work","eventType":"range","startYear":2020.5,"endYear":2021.0,"description":"..."}]}

For DELETING events:
{"action":"propose","items":[{"type":"event","action":"delete","id":"full-uuid","title":"Event Title","lane":"Work","eventType":"point","startYear":2020,"description":""}]}

For lanes:
{"action":"propose","items":[{"type":"lane","action":"create","name":"...","color":"#3b82f6","emoji":"..."}]}
{"action":"propose","items":[{"type":"lane","action":"edit","id":"full-uuid","name":"New Name","color":"#3b82f6"}]}
{"action":"propose","items":[{"type":"lane","action":"delete","id":"full-uuid","name":"Lane Name","color":"#3b82f6"}]}

For timelines:
{"action":"propose","items":[{"type":"timeline","action":"create","name":"..."}]}

Rules:
- Convert dates to fractional years (Jan=.0, Feb=.083, Mar=.167, Apr=.25, May=.333, Jun=.5, Jul=.583, Aug=.667, Sep=.75, Oct=.833, Nov=.917, Dec=.958)
- For relative dates like "last year", compute from current date
- Default lane: match to closest existing lane name
- If no existing lane fits, suggest creating a new lane first
- Be conversational and brief — max 2 sentences before the JSON
- You can propose multiple items at once
- For edits, only include fields that are changing (plus id and type/action)
- For deletes, include the id and enough info (title, lane) so the user can confirm
- When user says "delete" or "remove", match the event by title/description
- If the user just wants to chat, respond normally without JSON
- IMPORTANT: For edit/delete, you MUST use the full event id from the existing events list, not the truncated version`
}

function parseAssistantMessage(content: string): { text: string; proposals: ProposedItem[] } {
  const jsonMatch = content.match(/\{"action"\s*:\s*"propose".*\}/)
  if (!jsonMatch) return { text: content, proposals: [] }

  try {
    const parsed = JSON.parse(jsonMatch[0])
    const items: ProposedItem[] = (parsed.items || []).map((item: Record<string, unknown>) => {
      if (item.type === 'event') {
        return {
          type: 'event',
          action: (['create', 'edit', 'delete'].includes(String(item.action)) ? String(item.action) : 'create') as 'create' | 'edit' | 'delete',
          id: item.id ? String(item.id) : undefined,
          title: String(item.title || ''),
          lane: String(item.lane || 'Other Activities'),
          eventType: item.eventType === 'range' ? 'range' : 'point',
          startYear: Number(item.startYear) || 2020,
          endYear: item.endYear != null ? Number(item.endYear) : null,
          description: String(item.description || ''),
          location: item.location ? String(item.location) : undefined,
          color: item.color ? String(item.color) : undefined,
          emoji: item.emoji ? String(item.emoji) : undefined,
        } as ProposedEvent
      }
      if (item.type === 'lane') {
        return {
          type: 'lane',
          action: (['create', 'edit', 'delete'].includes(String(item.action)) ? String(item.action) : 'create') as 'create' | 'edit' | 'delete',
          id: item.id ? String(item.id) : undefined,
          name: String(item.name || ''),
          color: String(item.color || '#3b82f6'),
          emoji: item.emoji ? String(item.emoji) : undefined,
        } as ProposedLane
      }
      return {
        type: 'timeline',
        action: (['create', 'delete'].includes(String(item.action)) ? String(item.action) : 'create') as 'create' | 'delete',
        id: item.id ? String(item.id) : undefined,
        name: String(item.name || 'New Timeline'),
      } as ProposedTimeline
    })

    const text = content.replace(jsonMatch[0], '').trim()
    return { text, proposals: items }
  } catch {
    return { text: content, proposals: [] }
  }
}

// ── Component ────────────────────────────────────────────────────────────────

const DEMO_MESSAGE_LIMIT = 5

// ── Lina SVG Avatar ──────────────────────────────────────────────────────────

function LenaAvatar({ size = 80 }: { size?: number }) {
  return (
    <svg
      width={size}
      height={size}
      viewBox="0 0 80 80"
      xmlns="http://www.w3.org/2000/svg"
      style={{ display: 'block', overflow: 'visible' }}
    >
      <defs>
        <radialGradient id="lena-glow" cx="50%" cy="50%" r="50%">
          <stop offset="0%"   stopColor="#fbbf24" stopOpacity="0.30" />
          <stop offset="55%"  stopColor="#fbbf24" stopOpacity="0.10" />
          <stop offset="100%" stopColor="#fbbf24" stopOpacity="0" />
        </radialGradient>
        <radialGradient id="lena-face" cx="50%" cy="42%" r="52%">
          <stop offset="0%"   stopColor="#fde8cc" />
          <stop offset="100%" stopColor="#f0b87a" />
        </radialGradient>
        <radialGradient id="lena-hair" cx="42%" cy="28%" r="58%">
          <stop offset="0%"   stopColor="#ffe566" />
          <stop offset="60%"  stopColor="#e8a800" />
          <stop offset="100%" stopColor="#c47000" />
        </radialGradient>
      </defs>

      {/* ── Soft ambient glow halo (behind everything) ── */}
      <ellipse cx="40" cy="40" rx="44" ry="44" fill="url(#lena-glow)" />

      {/* ── Past → Future ambient lines ── */}
      <line x1="-4" y1="33" x2="16" y2="33" stroke="#94a3b8" strokeWidth="1.5" strokeLinecap="round" opacity="0.30" />
      <line x1="-4" y1="39" x2="14" y2="39" stroke="#94a3b8" strokeWidth="1"   strokeLinecap="round" opacity="0.18" />
      <line x1="-4" y1="45" x2="16" y2="45" stroke="#94a3b8" strokeWidth="1.5" strokeLinecap="round" opacity="0.30" />

      <line x1="64" y1="33" x2="84" y2="33" stroke="#fbbf24" strokeWidth="2.4" strokeLinecap="round" opacity="1" />
      <line x1="66" y1="39" x2="84" y2="39" stroke="#f59e0b" strokeWidth="1.6" strokeLinecap="round" opacity="0.72" />
      <line x1="64" y1="45" x2="84" y2="45" stroke="#fbbf24" strokeWidth="2.4" strokeLinecap="round" opacity="1" />
      <polyline points="79,29 84,33 79,37" fill="none" stroke="#fbbf24" strokeWidth="2.2" strokeLinejoin="round" strokeLinecap="round" opacity="1" />

      {/* ── Animated head group (tilts occasionally) ── */}
      <g className="lena-tilt-group">

        {/* ── Hair ── */}
        <ellipse cx="40" cy="25" rx="18" ry="19" fill="url(#lena-hair)" />
        {/* Side curtains */}
        <ellipse cx="21" cy="42" rx="5.5" ry="14" fill="#c47000" />
        <ellipse cx="59" cy="42" rx="5.5" ry="14" fill="#c47000" />
        {/* Hair top volume */}
        <ellipse cx="40" cy="14" rx="13" ry="8.5" fill="#e8a800" />
        {/* Shine highlights */}
        <ellipse cx="35" cy="17" rx="8"   ry="3.5" fill="#fff3b0" opacity="0.55" />
        <ellipse cx="46" cy="20" rx="4"   ry="2"   fill="#fff3b0" opacity="0.30" />

        {/* ── Neck ── */}
        <rect x="36.5" y="56" width="7" height="9" rx="2.5" fill="#f0b87a" />

        {/* ── Face ── */}
        <ellipse cx="40" cy="40" rx="15" ry="16.5" fill="url(#lena-face)" />

        {/* ── Eyebrows — thick, confident ── */}
        <path d="M 30 31.5 Q 33.5 29 37.5 30.5" stroke="#7a4820" strokeWidth="2"   fill="none" strokeLinecap="round" />
        <path d="M 42.5 30.5 Q 46.5 29 50 31.5" stroke="#7a4820" strokeWidth="2"   fill="none" strokeLinecap="round" />

        {/* ── Eyes — whites ── */}
        <ellipse cx="34" cy="37" rx="3.4" ry="3.0" fill="white" />
        <ellipse cx="46" cy="37" rx="3.4" ry="3.0" fill="white" />
        {/* Irises — warm blue */}
        <ellipse cx="34" cy="37.3" rx="2.3" ry="2.2" fill="#2563b0" />
        <ellipse cx="46" cy="37.3" rx="2.3" ry="2.2" fill="#2563b0" />
        {/* Pupils */}
        <ellipse cx="34" cy="37.3" rx="1.2" ry="1.2" fill="#111827" />
        <ellipse cx="46" cy="37.3" rx="1.2" ry="1.2" fill="#111827" />
        {/* Sparkles */}
        <circle cx="35.1" cy="36.2" r="0.8" fill="white" />
        <circle cx="47.1" cy="36.2" r="0.8" fill="white" />

        {/* ── Eyelashes — top row ── */}
        <line x1="31.5" y1="34.6" x2="30.8" y2="33.2" stroke="#3d2310" strokeWidth="1"   strokeLinecap="round" />
        <line x1="33.5" y1="34.1" x2="33.2" y2="32.7" stroke="#3d2310" strokeWidth="1"   strokeLinecap="round" />
        <line x1="35.5" y1="34.0" x2="35.8" y2="32.6" stroke="#3d2310" strokeWidth="1"   strokeLinecap="round" />
        <line x1="37.0" y1="34.4" x2="37.6" y2="33.1" stroke="#3d2310" strokeWidth="1"   strokeLinecap="round" />
        <line x1="43.5" y1="34.4" x2="43.0" y2="33.1" stroke="#3d2310" strokeWidth="1"   strokeLinecap="round" />
        <line x1="45.5" y1="34.0" x2="45.2" y2="32.6" stroke="#3d2310" strokeWidth="1"   strokeLinecap="round" />
        <line x1="47.5" y1="34.0" x2="47.8" y2="32.6" stroke="#3d2310" strokeWidth="1"   strokeLinecap="round" />
        <line x1="49.0" y1="34.4" x2="49.7" y2="33.2" stroke="#3d2310" strokeWidth="1"   strokeLinecap="round" />

        {/* ── Glasses — timeline / gantt-bar style ── */}
        <rect x="28" y="34" width="12.5" height="5.5" rx="0.5" fill="none" stroke="#3b82f6" strokeWidth="1.4" />
        <line x1="28"  y1="36.75" x2="40.5" y2="36.75" stroke="#3b82f6" strokeWidth="0.6" opacity="0.6" />
        <rect x="42.5" y="34" width="12.5" height="5.5" rx="0.5" fill="none" stroke="#3b82f6" strokeWidth="1.4" />
        <line x1="42.5" y1="36.75" x2="55" y2="36.75" stroke="#3b82f6" strokeWidth="0.6" opacity="0.6" />
        {/* Bridge */}
        <line x1="40.5" y1="36.75" x2="42.5" y2="36.75" stroke="#3b82f6" strokeWidth="1.4" />
        {/* Left temple — past, grey */}
        <line x1="28"   y1="36.75" x2="21"  y2="36.75" stroke="#94a3b8" strokeWidth="1.3" strokeLinecap="round" />
        {/* Right temple — future, golden */}
        <line x1="55"   y1="36.75" x2="64"  y2="36.75" stroke="#fbbf24" strokeWidth="1.7" strokeLinecap="round" />

        {/* ── Blink eyelids (animated) ── */}
        <ellipse cx="34" cy="37" rx="3.4" ry="3.0" fill="#f0b87a" className="lena-lid" />
        <ellipse cx="46" cy="37" rx="3.4" ry="3.0" fill="#f0b87a" className="lena-lid lena-lid-r" />

        {/* ── Nose ── */}
        <path d="M 38.5 43 Q 40 45.5 41.5 43" stroke="#c47a56" strokeWidth="1.2" fill="none" strokeLinecap="round" />

        {/* ── Cheeks ── */}
        <ellipse cx="29.5" cy="46" rx="4.5" ry="2.8" fill="#f9a8d4" opacity="0.35" />
        <ellipse cx="50.5" cy="46" rx="4.5" ry="2.8" fill="#f9a8d4" opacity="0.35" />

        {/* ── Lips — defined, warm ── */}
        {/* Upper lip */}
        <path d="M 34 49 Q 37 47.5 40 48 Q 43 47.5 46 49" stroke="#c0504d" strokeWidth="1.2" fill="none" strokeLinecap="round" />
        {/* Smile arc */}
        <path d="M 34 49 Q 40 55.5 46 49" stroke="#c0504d" strokeWidth="1.9" fill="none" strokeLinecap="round" />

        {/* ── Open mouth (animated, shows when "talking") ── */}
        <ellipse cx="40" cy="51" rx="5" ry="3.2" fill="#8b1a1a" className="lena-mouth-open" />

      </g>
    </svg>
  )
}

export function LenaAssistant({ lanes, events, addEvent, updateEvent, deleteEvent, addLane, updateLane, deleteLane, createTimeline, demoMode, onSignUp }: LenaAssistantProps) {
  const { t } = useTranslation()
  const [open, setOpen] = useState(false)
  const [messages, setMessages] = useState<ChatMessage[]>([])
  const [input, setInput] = useState('')
  const [sending, setSending] = useState(false)
  const [demoUsed, setDemoUsed] = useState(0)
  const [recording, setRecording] = useState(false)
  const [transcribing, setTranscribing] = useState(false)
  const [elapsed, setElapsed] = useState(0)
  const [editingCell, setEditingCell] = useState<{ msgIdx: number; itemIdx: number; field: string } | null>(null)
  const [editValue, setEditValue] = useState('')

  const messagesEndRef = useRef<HTMLDivElement>(null)
  const inputRef = useRef<HTMLInputElement>(null)
  const mediaRecorderRef = useRef<MediaRecorder | null>(null)
  const chunksRef = useRef<Blob[]>([])
  const streamRef = useRef<MediaStream | null>(null)
  const timerRef = useRef<ReturnType<typeof setInterval> | null>(null)

  // Auto-scroll on new messages
  useEffect(() => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' })
  }, [messages])

  // Focus input when opening
  useEffect(() => {
    if (open) setTimeout(() => inputRef.current?.focus(), 100)
  }, [open])

  // Cleanup recording on unmount
  useEffect(() => {
    return () => {
      if (timerRef.current) clearInterval(timerRef.current)
      streamRef.current?.getTracks().forEach(t => t.stop())
    }
  }, [])

  const laneNames = lanes.map(l => l.name)

  // ── Send message to GPT ──────────────────────────────────────────────────

  const sendMessage = useCallback(async (text: string) => {
    if (!text.trim() || sending) return

    const userMsg: ChatMessage = { role: 'user', content: text.trim() }
    const newMessages = [...messages, userMsg]
    setMessages(newMessages)
    setInput('')

    // Demo limit: block after DEMO_MESSAGE_LIMIT user messages
    if (demoMode) {
      const nextUsed = demoUsed + 1
      setDemoUsed(nextUsed)
      if (nextUsed >= DEMO_MESSAGE_LIMIT) {
        const limitMsg: ChatMessage = {
          role: 'assistant',
          content: t('lena.demoLimitMessage', { limit: String(DEMO_MESSAGE_LIMIT) }),
        }
        setMessages([...newMessages, limitMsg])
        return
      }
    }

    setSending(true)

    try {
      const apiMessages = [
        { role: 'system' as const, content: buildSystemPrompt(laneNames, events.map(e => ({
          id: e.id,
          title: e.title,
          lane: lanes.find(l => l.id === e.laneId)?.name || 'Unknown',
          startYear: e.startYear,
          endYear: e.endYear,
        }))) },
        ...newMessages.map(m => ({ role: m.role as 'user' | 'assistant', content: m.content })),
      ]

      const res = await fetch('/api/chat', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          model: 'gpt-4o-mini',
          messages: apiMessages,
          temperature: 0.4,
        }),
      })

      if (!res.ok) {
        const err = await res.json().catch(() => ({}))
        throw new Error(err.error?.message || `API error: ${res.status}`)
      }

      const data = await res.json()
      const content = data.choices?.[0]?.message?.content || 'Sorry, I could not process that.'

      const { text: displayText, proposals } = parseAssistantMessage(content)

      const assistantMsg: ChatMessage = {
        role: 'assistant',
        content,
        proposals: proposals.length > 0 ? proposals : undefined,
        proposalStatus: proposals.length > 0 ? proposals.map(() => 'pending' as const) : undefined,
      }

      setMessages([...newMessages, { ...assistantMsg, content: displayText || content }])
    } catch (err) {
      const errorMsg: ChatMessage = {
        role: 'assistant',
        content: `Sorry, something went wrong: ${err instanceof Error ? err.message : 'Unknown error'}`,
      }
      setMessages([...newMessages, errorMsg])
    } finally {
      setSending(false)
    }
  }, [messages, sending, laneNames, demoMode, demoUsed, t])

  // ── Voice recording ────────────────────────────────────────────────────────

  const startRecording = useCallback(async () => {
    try {
      const stream = await navigator.mediaDevices.getUserMedia({ audio: true })
      streamRef.current = stream
      chunksRef.current = []

      const mimeType = ['audio/webm', 'audio/ogg', 'audio/mp4']
        .find(t => MediaRecorder.isTypeSupported(t)) || ''
      const recorder = new MediaRecorder(stream, mimeType ? { mimeType } : undefined)
      mediaRecorderRef.current = recorder

      recorder.ondataavailable = (e) => {
        if (e.data.size > 0) chunksRef.current.push(e.data)
      }

      recorder.onstop = async () => {
        streamRef.current?.getTracks().forEach(t => t.stop())
        if (timerRef.current) { clearInterval(timerRef.current); timerRef.current = null }
        setRecording(false)
        setTranscribing(true)

        try {
          const blob = new Blob(chunksRef.current, { type: recorder.mimeType || 'audio/webm' })
          const text = await transcribeAudio(blob)
          setTranscribing(false)
          if (text.trim()) {
            setInput(text.trim())
            // Auto-send after transcription
            sendMessage(text.trim())
          }
        } catch {
          setTranscribing(false)
        }
      }

      recorder.start()
      setRecording(true)
      setElapsed(0)
      timerRef.current = setInterval(() => setElapsed(e => e + 1), 1000)
    } catch {
      // Mic permission denied
    }
  }, [sendMessage])

  const stopRecording = useCallback(() => {
    if (mediaRecorderRef.current?.state !== 'inactive') {
      mediaRecorderRef.current?.stop()
    }
  }, [])

  // ── Accept/reject proposals ────────────────────────────────────────────────

  const handleAcceptItem = useCallback(async (msgIdx: number, itemIdx: number) => {
    const msg = messages[msgIdx]
    if (!msg?.proposals || !msg.proposalStatus) return

    const item = msg.proposals[itemIdx]
    let success = false

    try {
      if (item.type === 'event') {
        if (item.action === 'delete' && item.id) {
          await deleteEvent(item.id)
          success = true
        } else if (item.action === 'edit' && item.id) {
          const lane = lanes.find(l => l.name === item.lane)
          await updateEvent(item.id, {
            title: item.title,
            description: item.description,
            type: item.eventType,
            startYear: item.startYear,
            endYear: item.endYear ?? undefined,
            ...(lane ? { laneId: lane.id } : {}),
            location: item.location,
            color: item.color,
            emoji: item.emoji,
          })
          success = true
        } else {
          const lane = lanes.find(l => l.name === item.lane)
          if (lane) {
            const result = await addEvent({
              laneId: lane.id,
              title: item.title,
              description: item.description,
              type: item.eventType,
              startYear: item.startYear,
              endYear: item.endYear ?? undefined,
              location: item.location,
              color: item.color,
              emoji: item.emoji,
            })
            success = !!result
          }
        }
      } else if (item.type === 'lane') {
        if (item.action === 'delete' && item.id) {
          await deleteLane(item.id)
          success = true
        } else if (item.action === 'edit' && item.id) {
          await updateLane(item.id, {
            name: item.name,
            color: item.color,
            emoji: item.emoji,
          })
          success = true
        } else {
          const result = await addLane({
            name: item.name,
            color: item.color,
            visible: true,
            emoji: item.emoji,
          })
          success = !!result
        }
      } else if (item.type === 'timeline') {
        if (item.action === 'create') {
          const result = await createTimeline(item.name)
          success = !!result
        }
      }
    } catch {
      success = false
    }

    if (success) {
      setMessages(prev => prev.map((m, i) => {
        if (i !== msgIdx || !m.proposalStatus) return m
        const newStatus = [...m.proposalStatus]
        newStatus[itemIdx] = 'accepted'
        return { ...m, proposalStatus: newStatus }
      }))
    }
  }, [messages, lanes, addEvent, addLane, createTimeline])

  const handleRejectItem = useCallback((msgIdx: number, itemIdx: number) => {
    setMessages(prev => prev.map((m, i) => {
      if (i !== msgIdx || !m.proposalStatus) return m
      const newStatus = [...m.proposalStatus]
      newStatus[itemIdx] = 'rejected'
      return { ...m, proposalStatus: newStatus }
    }))
  }, [])

  const handleAcceptAll = useCallback(async (msgIdx: number) => {
    const msg = messages[msgIdx]
    if (!msg?.proposals || !msg.proposalStatus) return

    for (let i = 0; i < msg.proposals.length; i++) {
      if (msg.proposalStatus[i] === 'pending') {
        await handleAcceptItem(msgIdx, i)
      }
    }
  }, [messages, handleAcceptItem])

  // ── Inline editing ─────────────────────────────────────────────────────────

  const startEdit = (msgIdx: number, itemIdx: number, field: string, currentValue: string) => {
    setEditingCell({ msgIdx, itemIdx, field })
    setEditValue(currentValue)
  }

  const commitEdit = () => {
    if (!editingCell) return
    const { msgIdx, itemIdx, field } = editingCell

    setMessages(prev => prev.map((m, i) => {
      if (i !== msgIdx || !m.proposals) return m
      const newProposals = [...m.proposals]
      const item = { ...newProposals[itemIdx] } as Record<string, unknown>

      if (field === 'startYear' || field === 'endYear') {
        item[field] = parseFloat(editValue) || item[field]
      } else {
        item[field] = editValue
      }

      newProposals[itemIdx] = item as unknown as ProposedItem
      return { ...m, proposals: newProposals }
    }))

    setEditingCell(null)
  }

  if (!isOpenAIConfigured()) return null

  // ── Render ─────────────────────────────────────────────────────────────────

  return (
    <>
      {/* Floating button */}
      {!open && (
        <button
          onClick={() => setOpen(true)}
          className="fixed bottom-[66px] right-6 sm:bottom-[82px] sm:right-8 z-50 flex flex-col items-center gap-1 transition-all duration-200 hover:scale-110 active:scale-95 animate-[lena-pulse_2.5s_ease-in-out_infinite]"
          title={t('lena.talkToLina')}
        >
          <LenaAvatar size={80} />
          <span className="text-[10px] sm:text-xs font-semibold text-foreground/80 leading-tight drop-shadow">{t('lena.talkToLina')}</span>
        </button>
      )}

      {/* Chat panel */}
      {open && (
        <>
          {/* Mobile backdrop — shows app dimly behind the panel */}
          <div className="fixed inset-0 z-40 bg-black/40 sm:hidden" onClick={() => setOpen(false)} />
        <div className="fixed inset-x-3 bottom-3 top-14 sm:inset-auto sm:bottom-6 sm:right-6 sm:w-[420px] sm:h-[600px] sm:max-h-[80vh] z-50 flex flex-col bg-background rounded-2xl border border-border shadow-2xl overflow-hidden">
          {/* Header */}
          <div className="shrink-0 flex items-center justify-between px-4 py-3 border-b border-border bg-background">
            <div className="flex items-center gap-2">
              <LenaAvatar size={28} />
              <span className="font-semibold text-foreground">Lina</span>
              <span className="text-xs text-muted-foreground">{t('lena.aiAssistant')}</span>
              {demoMode && (
                <span className={cn('text-xs px-1.5 py-0.5 rounded-full font-medium', demoUsed >= DEMO_MESSAGE_LIMIT ? 'bg-red-100 text-red-600' : 'bg-muted text-muted-foreground')}>
                  {t('lena.messagesLeft', { count: String(Math.max(0, DEMO_MESSAGE_LIMIT - demoUsed)) })}
                </span>
              )}
            </div>
            <button
              onClick={() => setOpen(false)}
              className="h-8 w-8 flex items-center justify-center rounded-md hover:bg-accent transition-colors text-muted-foreground"
            >
              <X className="h-4 w-4" />
            </button>
          </div>

          {/* Messages */}
          <div className="flex-1 overflow-y-auto px-4 py-3 space-y-4">
            {messages.length === 0 && (
              <div className="text-center py-8">
                <div className="flex justify-center mb-3"><LenaAvatar size={56} /></div>
                <p className="text-sm text-muted-foreground">
                  {t('lena.intro')}
                </p>
                <p className="text-xs text-muted-foreground/60 mt-2">
                  {t('lena.introHint')}
                </p>
                {demoMode && (
                  <p className="text-xs text-muted-foreground/50 mt-3">
                    {t('lena.demoNote', { limit: String(DEMO_MESSAGE_LIMIT) })}
                  </p>
                )}
              </div>
            )}

            {messages.map((msg, msgIdx) => (
              <div key={msgIdx} className={cn('flex', msg.role === 'user' ? 'justify-end' : 'justify-start')}>
                <div className={cn(
                  'max-w-[85%] rounded-2xl px-4 py-2.5 text-sm',
                  msg.role === 'user'
                    ? 'bg-primary text-primary-foreground rounded-br-md'
                    : 'bg-accent text-accent-foreground rounded-bl-md',
                )}>
                  {/* Message text */}
                  {msg.content && <p className="whitespace-pre-wrap">{msg.content}</p>}

                  {/* Proposal table */}
                  {msg.proposals && msg.proposalStatus && (
                    <div className="mt-3 space-y-2">
                      {msg.proposals.map((item, itemIdx) => {
                        const status = msg.proposalStatus![itemIdx]
                        return (
                          <div
                            key={itemIdx}
                            className={cn(
                              'rounded-lg border text-xs overflow-hidden transition-all',
                              status === 'accepted' ? 'border-green-500/40 bg-green-500/10' :
                              status === 'rejected' ? 'border-red-500/40 bg-red-500/10 opacity-50' :
                              item.action === 'delete' ? 'border-red-500/40 bg-red-500/10' :
                              item.action === 'edit' ? 'border-amber-500/40 bg-amber-500/10' :
                              'border-border bg-background',
                            )}
                          >
                            {/* Item header */}
                            <div className="flex items-center justify-between px-3 py-1.5 border-b border-border/50">
                              <span className={cn(
                                'font-semibold uppercase tracking-wide text-[10px]',
                                item.action === 'delete' ? 'text-red-600' :
                                item.action === 'edit' ? 'text-amber-600' :
                                item.type === 'event' ? 'text-blue-600' :
                                item.type === 'lane' ? 'text-purple-600' : 'text-green-600',
                              )}>
                                {item.action !== 'create' ? `${item.action} ` : ''}{item.type}
                              </span>
                              {status === 'accepted' && <span className="text-green-600 text-[10px] font-medium flex items-center gap-1"><Check className="h-3 w-3" />{item.action === 'delete' ? t('lena.statusDeleted') : item.action === 'edit' ? t('lena.statusUpdated') : t('lena.statusAdded')}</span>}
                              {status === 'rejected' && <span className="text-red-500 text-[10px] font-medium">Rejected</span>}
                            </div>

                            {/* Item fields */}
                            <div className="px-3 py-2 space-y-1">
                              {item.type === 'event' && (
                                <>
                                  <FieldRow label="Title" value={item.title} msgIdx={msgIdx} itemIdx={itemIdx} field="title" editingCell={editingCell} editValue={editValue} setEditValue={setEditValue} startEdit={startEdit} commitEdit={commitEdit} status={status} />
                                  <FieldRow label="Lane" value={item.lane} msgIdx={msgIdx} itemIdx={itemIdx} field="lane" editingCell={editingCell} editValue={editValue} setEditValue={setEditValue} startEdit={startEdit} commitEdit={commitEdit} status={status} />
                                  <FieldRow label="Type" value={item.eventType} msgIdx={msgIdx} itemIdx={itemIdx} field="eventType" editingCell={editingCell} editValue={editValue} setEditValue={setEditValue} startEdit={startEdit} commitEdit={commitEdit} status={status} />
                                  <div className="flex gap-2">
                                    <div className="flex-1">
                                      <FieldRow label="Start" value={formatYear(item.startYear)} msgIdx={msgIdx} itemIdx={itemIdx} field="startYear" editingCell={editingCell} editValue={editValue} setEditValue={setEditValue} startEdit={startEdit} commitEdit={commitEdit} status={status} />
                                    </div>
                                    {item.endYear && (
                                      <div className="flex-1">
                                        <FieldRow label="End" value={formatYear(item.endYear)} msgIdx={msgIdx} itemIdx={itemIdx} field="endYear" editingCell={editingCell} editValue={editValue} setEditValue={setEditValue} startEdit={startEdit} commitEdit={commitEdit} status={status} />
                                      </div>
                                    )}
                                  </div>
                                  {item.description && <FieldRow label="Desc" value={item.description} msgIdx={msgIdx} itemIdx={itemIdx} field="description" editingCell={editingCell} editValue={editValue} setEditValue={setEditValue} startEdit={startEdit} commitEdit={commitEdit} status={status} />}
                                  {item.location && <FieldRow label="Location" value={item.location} msgIdx={msgIdx} itemIdx={itemIdx} field="location" editingCell={editingCell} editValue={editValue} setEditValue={setEditValue} startEdit={startEdit} commitEdit={commitEdit} status={status} />}
                                </>
                              )}
                              {item.type === 'lane' && (
                                <>
                                  <FieldRow label="Name" value={item.name} msgIdx={msgIdx} itemIdx={itemIdx} field="name" editingCell={editingCell} editValue={editValue} setEditValue={setEditValue} startEdit={startEdit} commitEdit={commitEdit} status={status} />
                                  <div className="flex items-center gap-2">
                                    <span className="text-muted-foreground w-14 shrink-0">Color</span>
                                    <span className="h-4 w-4 rounded-sm border" style={{ background: item.color }} />
                                    <span className="text-foreground">{item.color}</span>
                                  </div>
                                  {item.emoji && <FieldRow label="Emoji" value={item.emoji} msgIdx={msgIdx} itemIdx={itemIdx} field="emoji" editingCell={editingCell} editValue={editValue} setEditValue={setEditValue} startEdit={startEdit} commitEdit={commitEdit} status={status} />}
                                </>
                              )}
                              {item.type === 'timeline' && (
                                <FieldRow label="Name" value={item.name} msgIdx={msgIdx} itemIdx={itemIdx} field="name" editingCell={editingCell} editValue={editValue} setEditValue={setEditValue} startEdit={startEdit} commitEdit={commitEdit} status={status} />
                              )}
                            </div>

                            {/* Actions */}
                            {status === 'pending' && (
                              <div className="flex border-t border-border/50">
                                <button
                                  onClick={() => handleAcceptItem(msgIdx, itemIdx)}
                                  className={cn(
                                    'flex-1 flex items-center justify-center gap-1 py-2 transition-colors font-medium',
                                    item.action === 'delete' ? 'text-red-500 hover:bg-red-500/10' :
                                    item.action === 'edit' ? 'text-amber-500 hover:bg-amber-500/10' :
                                    'text-green-500 hover:bg-green-500/10',
                                  )}
                                >
                                  <Check className="h-3 w-3" />
                                  {item.action === 'delete' ? t('lena.actionDelete') : item.action === 'edit' ? t('lena.actionUpdate') : t('lena.actionAccept')}
                                </button>
                                <button
                                  onClick={() => handleRejectItem(msgIdx, itemIdx)}
                                  className="flex-1 flex items-center justify-center gap-1 py-2 text-muted-foreground hover:bg-accent transition-colors font-medium border-l border-border/50"
                                >
                                  <X className="h-3 w-3" /> {t('lena.actionCancel')}
                                </button>
                              </div>
                            )}
                          </div>
                        )
                      })}

                      {/* Accept All button */}
                      {msg.proposalStatus.some(s => s === 'pending') && msg.proposals.length > 1 && (
                        <button
                          onClick={() => handleAcceptAll(msgIdx)}
                          className="w-full flex items-center justify-center gap-1.5 py-2 rounded-lg border border-green-500/40 text-green-500 hover:bg-green-500/10 transition-colors text-xs font-semibold"
                        >
                          <CheckCheck className="h-3.5 w-3.5" /> {t('lena.acceptAll')}
                        </button>
                      )}
                    </div>
                  )}
                </div>
              </div>
            ))}

            {/* Sending indicator */}
            {sending && (
              <div className="flex justify-start">
                <div className="bg-accent rounded-2xl rounded-bl-md px-4 py-3">
                  <Loader2 className="h-4 w-4 animate-spin text-muted-foreground" />
                </div>
              </div>
            )}

            <div ref={messagesEndRef} />
          </div>

          {/* Input area */}
          <div className="shrink-0 border-t border-border bg-background px-3 py-3" style={{ paddingBottom: 'max(12px, env(safe-area-inset-bottom))' }}>
            {/* Demo limit reached */}
            {demoMode && demoUsed >= DEMO_MESSAGE_LIMIT && (
              <div className="mb-3 rounded-xl bg-primary/10 border border-primary/20 px-4 py-3 text-center">
                <p className="text-xs text-muted-foreground mb-2">{t('lena.demoLimitReached')}</p>
                <button
                  onClick={onSignUp}
                  className="w-full py-2 rounded-lg bg-primary text-primary-foreground text-sm font-semibold hover:bg-primary/90 transition-colors"
                >
                  {t('lena.signUpToContinue')}
                </button>
              </div>
            )}
            {/* Recording indicator */}
            {recording && (
              <div className="flex items-center gap-2 mb-2 px-2">
                <span className="h-2 w-2 rounded-full bg-red-500 animate-pulse" />
                <span className="text-xs text-red-600 font-medium">
                  {t('lena.recording', { time: `${Math.floor(elapsed / 60)}:${(elapsed % 60).toString().padStart(2, '0')}` })}
                </span>
              </div>
            )}
            {transcribing && (
              <div className="flex items-center gap-2 mb-2 px-2">
                <Loader2 className="h-3 w-3 animate-spin text-muted-foreground" />
                <span className="text-xs text-muted-foreground">{t('lena.transcribing')}</span>
              </div>
            )}

            <div className={cn('flex items-center gap-2', demoMode && demoUsed >= DEMO_MESSAGE_LIMIT && 'opacity-40 pointer-events-none')}>
              {/* Mic button */}
              <button
                onClick={recording ? stopRecording : startRecording}
                disabled={sending || transcribing}
                className={cn(
                  'h-10 w-10 shrink-0 flex items-center justify-center rounded-full transition-all',
                  recording
                    ? 'bg-red-500 text-white hover:bg-red-600'
                    : 'bg-accent text-muted-foreground hover:bg-accent/80',
                  (sending || transcribing) && 'opacity-50 pointer-events-none',
                )}
              >
                {recording ? <MicOff className="h-4 w-4" /> : <Mic className="h-4 w-4" />}
              </button>

              {/* Text input */}
              <input
                ref={inputRef}
                type="text"
                value={input}
                onChange={e => setInput(e.target.value)}
                onKeyDown={e => { if (e.key === 'Enter' && !e.shiftKey) { e.preventDefault(); sendMessage(input) } }}
                placeholder={t('lena.inputPlaceholder')}
                disabled={sending || recording || transcribing}
                className="flex-1 h-10 rounded-full border border-input bg-background px-4 text-sm outline-none focus:ring-2 focus:ring-ring disabled:opacity-50"
              />

              {/* Send button */}
              <button
                onClick={() => sendMessage(input)}
                disabled={!input.trim() || sending || recording || transcribing}
                className="h-10 w-10 shrink-0 flex items-center justify-center rounded-full bg-primary text-primary-foreground transition-all hover:bg-primary/90 disabled:opacity-50 disabled:pointer-events-none"
              >
                <Send className="h-4 w-4" />
              </button>
            </div>
          </div>
        </div>
        </>
      )}
    </>
  )
}

// ── Inline editable field row ────────────────────────────────────────────────

function FieldRow({
  label,
  value,
  msgIdx,
  itemIdx,
  field,
  editingCell,
  editValue,
  setEditValue,
  startEdit,
  commitEdit,
  status,
}: {
  label: string
  value: string
  msgIdx: number
  itemIdx: number
  field: string
  editingCell: { msgIdx: number; itemIdx: number; field: string } | null
  editValue: string
  setEditValue: (v: string) => void
  startEdit: (msgIdx: number, itemIdx: number, field: string, currentValue: string) => void
  commitEdit: () => void
  status: string
}) {
  const isEditing = editingCell?.msgIdx === msgIdx && editingCell?.itemIdx === itemIdx && editingCell?.field === field
  const canEdit = status === 'pending'

  if (isEditing) {
    return (
      <div className="flex items-center gap-2">
        <span className="text-muted-foreground w-14 shrink-0">{label}</span>
        <input
          autoFocus
          value={editValue}
          onChange={e => setEditValue(e.target.value)}
          onKeyDown={e => { if (e.key === 'Enter') commitEdit(); if (e.key === 'Escape') commitEdit() }}
          onBlur={commitEdit}
          className="flex-1 h-6 rounded border border-input bg-background px-2 text-xs outline-none focus:ring-1 focus:ring-ring"
        />
      </div>
    )
  }

  return (
    <div className="flex items-center gap-2 group">
      <span className="text-muted-foreground w-14 shrink-0">{label}</span>
      <span className="text-foreground flex-1 truncate">{value}</span>
      {canEdit && (
        <button
          onClick={() => startEdit(msgIdx, itemIdx, field, value)}
          className="opacity-0 group-hover:opacity-100 transition-opacity h-5 w-5 flex items-center justify-center rounded hover:bg-accent"
        >
          <Pencil className="h-2.5 w-2.5 text-muted-foreground" />
        </button>
      )}
    </div>
  )
}
