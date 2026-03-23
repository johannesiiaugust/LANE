import React, { useState, useEffect, useMemo } from 'react'
import { supabase } from '@/lib/supabase'
import {
  Loader2, BarChart3, Users, Eye, MousePointerClick,
  TrendingUp, Clock, Activity, RefreshCw,
  X, Search, ChevronDown, ChevronRight, CalendarDays,
  FolderOpen, Filter, Database, Layers, Crown,
} from 'lucide-react'

// ── Types ────────────────────────────────────────────────────────────────────

interface RawEvent {
  event_type: string
  page: string | null
  target: string | null
  user_id: string
  session_id: string | null
  metadata: Record<string, unknown> | null
  created_at: string
}

interface PageStat { page: string; views: number; uniqueUsers: number }
interface UserStat { user_id: string; name: string; username: string; events: number; sessions: number; pages: number }
interface DayStat { date: string; users: number; events: number; sessions: number }
interface DayDetail { date: string; users: Set<string>; events: number; sessions: number; pageViews: number; clicks: number; engagements: number; topPages: { page: string; count: number }[] }
interface ActionStat { target: string; count: number }
interface HourlyStat { hour: number; events: number }
interface RouteGroup { route: string; views: number; uniqueUsers: number; clicks: number; subPages: PageStat[] }

type TimeRange = '7d' | '30d' | '90d'

// ── Helpers ──────────────────────────────────────────────────────────────────

function avatarColor(name: string): string {
  const colors = ['#5B8E6D', '#7B6D9E', '#4A7B9A', '#C4634A', '#8E6B4A', '#4A8E6B', '#9E5A8A']
  let hash = 0
  for (let i = 0; i < name.length; i++) hash = name.charCodeAt(i) + ((hash << 5) - hash)
  return colors[Math.abs(hash) % colors.length]
}

function getInitials(name: string): string {
  return name.split(' ').map(w => w[0]).join('').toUpperCase().slice(0, 2) || '?'
}

// ── Shared components ────────────────────────────────────────────────────────

function Panel({ children, className = '' }: { children: React.ReactNode; className?: string }) {
  return (
    <div className={`rounded-xl border border-border overflow-hidden bg-background shadow-sm ${className}`}>
      {children}
    </div>
  )
}

function PanelHeader({ title, icon }: { title: string; icon: React.ReactNode }) {
  return (
    <div className="flex items-center gap-2 px-5 py-3 border-b border-border">
      <span className="text-muted-foreground">{icon}</span>
      <h3 className="text-sm font-bold text-foreground">{title}</h3>
    </div>
  )
}

function StatCard({ label, value, sub, color }: { label: string; value: string | number; sub?: string; color: string }) {
  return (
    <div className="rounded-xl border border-border bg-background px-5 py-4">
      <p className="text-xs uppercase tracking-wider font-medium text-muted-foreground">{label}</p>
      <p className="text-3xl font-bold mt-1 leading-none" style={{ color }}>{typeof value === 'number' ? value.toLocaleString() : value}</p>
      {sub && <p className="text-xs mt-1 text-muted-foreground">{sub}</p>}
    </div>
  )
}

function LineChart({ data, height = 180 }: { data: DayStat[]; height?: number }) {
  if (data.length === 0) return null
  const maxUsers = Math.max(...data.map(d => d.users), 1)
  const maxEvents = Math.max(...data.map(d => d.events), 1)
  const w = 800
  const h = height
  const pad = { top: 20, right: 20, bottom: 30, left: 40 }
  const cw = w - pad.left - pad.right
  const ch = h - pad.top - pad.bottom
  const xStep = data.length > 1 ? cw / (data.length - 1) : cw

  function userY(v: number) { return pad.top + ch - (v / maxUsers) * ch }
  function eventY(v: number) { return pad.top + ch - (v / maxEvents) * ch }

  const userPath = data.map((d, i) => `${i === 0 ? 'M' : 'L'}${pad.left + i * xStep},${userY(d.users)}`).join(' ')
  const eventPath = data.map((d, i) => `${i === 0 ? 'M' : 'L'}${pad.left + i * xStep},${eventY(d.events)}`).join(' ')
  const userArea = `${userPath} L${pad.left + (data.length - 1) * xStep},${pad.top + ch} L${pad.left},${pad.top + ch} Z`
  const gridLines = [0, 0.25, 0.5, 0.75, 1].map(f => pad.top + ch * (1 - f))
  const labelStep = Math.max(1, Math.floor(data.length / 6))

  return (
    <svg viewBox={`0 0 ${w} ${h}`} className="w-full" style={{ height }}>
      {gridLines.map((y, i) => (
        <g key={i}>
          <line x1={pad.left} y1={y} x2={w - pad.right} y2={y} className="stroke-border" strokeWidth="1" strokeDasharray={i === 0 ? 'none' : '4,4'} />
          <text x={pad.left - 6} y={y + 4} textAnchor="end" className="fill-muted-foreground" fontSize="10">
            {Math.round(maxUsers * (1 - (y - pad.top) / ch))}
          </text>
        </g>
      ))}
      <path d={userArea} fill="rgba(91, 142, 109, 0.1)" />
      <path d={eventPath} fill="none" stroke="#F59E0B" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" opacity="0.6" />
      <path d={userPath} fill="none" stroke="#5B8E6D" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round" />
      {data.map((d, i) => (
        <g key={d.date}>
          <circle cx={pad.left + i * xStep} cy={userY(d.users)} r="3.5" fill="#5B8E6D" className="stroke-background" strokeWidth="2" />
          <title>{`${d.date}\n${d.users} users\n${d.events} events`}</title>
        </g>
      ))}
      {data.map((d, i) => i % labelStep === 0 ? (
        <text key={d.date} x={pad.left + i * xStep} y={h - 6} textAnchor="middle" className="fill-muted-foreground" fontSize="10">
          {d.date.slice(5)}
        </text>
      ) : null)}
      <circle cx={w - 150} cy={12} r="4" fill="#5B8E6D" />
      <text x={w - 142} y={16} className="fill-muted-foreground" fontSize="10">Users</text>
      <circle cx={w - 70} cy={12} r="4" fill="#F59E0B" />
      <text x={w - 62} y={16} className="fill-muted-foreground" fontSize="10">Events</text>
    </svg>
  )
}

function BarRow({ label, value, max, color, sub }: { label: string; value: number; max: number; color: string; sub?: string }) {
  return (
    <div className="flex items-center gap-3 px-5 py-2 hover:bg-accent/50 transition-colors">
      <span className="text-xs w-32 truncate flex-shrink-0 font-medium text-muted-foreground">{label}</span>
      <div className="flex-1 h-5 rounded overflow-hidden bg-accent/50">
        <div className="h-full rounded transition-all" style={{ width: `${Math.max((value / max) * 100, 2)}%`, background: color }} />
      </div>
      <span className="text-xs font-bold w-12 text-right tabular-nums text-foreground">{value.toLocaleString()}</span>
      {sub && <span className="text-[10px] w-16 text-right text-muted-foreground">{sub}</span>}
    </div>
  )
}

// ── Data Completeness types ──────────────────────────────────────────────────

interface TimelineDataEvent {
  lane_id: string
  source: string | null
  description: string | null
  location: string | null
  url: string | null
  rating: number | null
  emoji: string | null
  color: string | null
  value_projection: unknown
  metadata: Record<string, unknown> | null
  start_time: string | null
  end_time: string | null
  type: string | null
}

interface TimelineDataLane {
  id: string
  name: string
  timeline_id: string
}

// ── Main Component ───────────────────────────────────────────────────────────

export function AnalyticsDashboard() {
  const [loading, setLoading] = useState(true)
  const [dataLoading, setDataLoading] = useState(false)
  const [range, setRange] = useState<TimeRange>('30d')
  const [events, setEvents] = useState<RawEvent[]>([])
  const [userProfiles, setUserProfiles] = useState<Map<string, { name: string; username: string }>>(new Map())
  const [selectedUserId, setSelectedUserId] = useState<string | null>(null)
  const [userLogEvents, setUserLogEvents] = useState<RawEvent[]>([])
  const [userLogLoading, setUserLogLoading] = useState(false)
  const [userLogSearch, setUserLogSearch] = useState('')
  const [userLogExpandedSessions, setUserLogExpandedSessions] = useState<Set<string>>(new Set())
  const [expandedDays, setExpandedDays] = useState<Set<string>>(new Set())
  const [pageFilter, setPageFilter] = useState('')
  const [expandedRoutes, setExpandedRoutes] = useState<Set<string>>(new Set())

  // Data completeness state
  const [timelineEvents, setTimelineEvents] = useState<TimelineDataEvent[]>([])
  const [timelineLanes, setTimelineLanes] = useState<TimelineDataLane[]>([])
  const [personas, setPersonas] = useState<{ id: string; name: string; bio: string; birth_year: number; death_year: number | null; view_count: number }[]>([])

  useEffect(() => {
    loadData()
    loadTimelineData()
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  useEffect(() => {
    loadData()
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [range])

  async function loadData() {
    setDataLoading(true)
    const days = range === '7d' ? 7 : range === '30d' ? 30 : 90
    const since = new Date(Date.now() - days * 24 * 60 * 60 * 1000).toISOString()

    const { data } = await supabase
      .from('analytics_events')
      .select('event_type, page, target, user_id, session_id, metadata, created_at')
      .gte('created_at', since)
      .order('created_at', { ascending: false })
      .limit(50000)

    const evts = data || []
    setEvents(evts)

    const uids = [...new Set(evts.map(e => e.user_id))]
    if (uids.length > 0) {
      const { data: profiles } = await supabase
        .from('profiles')
        .select('id, display_name, username')
        .in('id', uids)

      setUserProfiles(new Map((profiles || []).map(p => [p.id, { name: p.display_name || p.username || '?', username: p.username || '?' }])))
    }

    setDataLoading(false)
    setLoading(false)
  }

  async function loadTimelineData() {
    const { data: evts } = await supabase
      .from('events')
      .select('lane_id, source, description, location, url, rating, emoji, color, value_projection, metadata, start_time, end_time, type')
      .limit(50000)

    setTimelineEvents(evts || [])

    const { data: lanes } = await supabase
      .from('lanes')
      .select('id, name, timeline_id')

    setTimelineLanes(lanes || [])

    const { data: personaData } = await supabase
      .from('personas')
      .select('id, name, bio, birth_year, death_year, view_count')
      .order('view_count', { ascending: false })
      .limit(20)

    setPersonas((personaData || []).map(p => ({ ...p, view_count: p.view_count ?? 0 })))
  }

  async function loadUserLog(userId: string) {
    setSelectedUserId(userId)
    setUserLogLoading(true)
    setUserLogSearch('')
    setUserLogExpandedSessions(new Set())

    const days = range === '7d' ? 7 : range === '30d' ? 30 : 90
    const since = new Date(Date.now() - days * 24 * 60 * 60 * 1000).toISOString()

    const { data } = await supabase
      .from('analytics_events')
      .select('event_type, page, target, user_id, session_id, metadata, created_at')
      .eq('user_id', userId)
      .gte('created_at', since)
      .order('created_at', { ascending: false })
      .limit(5000)

    setUserLogEvents(data || [])
    setUserLogLoading(false)
  }

  // ── User log sessions ──────────────────────────────────────────────────────

  const userLogSessions = useMemo(() => {
    if (!selectedUserId) return []
    const filtered = userLogSearch
      ? userLogEvents.filter(e =>
          (e.page || '').toLowerCase().includes(userLogSearch.toLowerCase()) ||
          (e.target || '').toLowerCase().includes(userLogSearch.toLowerCase()) ||
          e.event_type.toLowerCase().includes(userLogSearch.toLowerCase())
        )
      : userLogEvents

    const sessions: Record<string, { events: RawEvent[]; start: string; end: string }> = {}
    for (const e of filtered) {
      const sid = e.session_id || 'unknown'
      if (!sessions[sid]) sessions[sid] = { events: [], start: e.created_at, end: e.created_at }
      sessions[sid].events.push(e)
      if (e.created_at < sessions[sid].start) sessions[sid].start = e.created_at
      if (e.created_at > sessions[sid].end) sessions[sid].end = e.created_at
    }

    return Object.entries(sessions)
      .map(([id, s]) => {
        const durationMs = new Date(s.end).getTime() - new Date(s.start).getTime()
        const pages = new Set(s.events.filter(e => e.event_type === 'page_view').map(e => e.page)).size
        return { id, ...s, durationMs, pages }
      })
      .sort((a, b) => b.end.localeCompare(a.end))
  }, [selectedUserId, userLogEvents, userLogSearch])

  const selectedUserProfile = selectedUserId ? userProfiles.get(selectedUserId) : null

  // ── Filtered events ────────────────────────────────────────────────────────

  const filteredEvents = useMemo(() => {
    if (!pageFilter) return events
    return events.filter(e => e.page && e.page.startsWith(pageFilter))
  }, [events, pageFilter])

  // ── Route groups ───────────────────────────────────────────────────────────

  const routeGroups = useMemo<RouteGroup[]>(() => {
    const groups: Record<string, { views: number; users: Set<string>; clicks: number; subPages: Record<string, { views: number; users: Set<string> }> }> = {}
    for (const e of filteredEvents) {
      if (e.event_type !== 'page_view' && e.event_type !== 'click') continue
      if (!e.page) continue
      const segments = e.page.split('/').filter(Boolean)
      const route = segments.length > 0 ? `/${segments[0]}` : '/'

      if (!groups[route]) groups[route] = { views: 0, users: new Set(), clicks: 0, subPages: {} }
      if (e.event_type === 'page_view') {
        groups[route].views++
        groups[route].users.add(e.user_id)
        if (!groups[route].subPages[e.page]) groups[route].subPages[e.page] = { views: 0, users: new Set() }
        groups[route].subPages[e.page].views++
        groups[route].subPages[e.page].users.add(e.user_id)
      }
      if (e.event_type === 'click') groups[route].clicks++
    }
    return Object.entries(groups)
      .map(([route, g]) => ({
        route,
        views: g.views,
        uniqueUsers: g.users.size,
        clicks: g.clicks,
        subPages: Object.entries(g.subPages)
          .map(([page, s]) => ({ page, views: s.views, uniqueUsers: s.users.size }))
          .sort((a, b) => b.views - a.views),
      }))
      .sort((a, b) => b.views - a.views)
  }, [filteredEvents])

  const allRoutes = useMemo(() => {
    const routes = new Set<string>()
    for (const e of events) {
      if (e.page) {
        const segments = e.page.split('/').filter(Boolean)
        if (segments.length > 0) routes.add(`/${segments[0]}`)
      }
    }
    return [...routes].sort()
  }, [events])

  // ── Stats ──────────────────────────────────────────────────────────────────

  const stats = useMemo(() => {
    const totalEvents = filteredEvents.length
    const uniqueUserIds = new Set(filteredEvents.map(e => e.user_id))
    const uniqueSessions = new Set(filteredEvents.filter(e => e.session_id).map(e => e.session_id))
    const pageViews = filteredEvents.filter(e => e.event_type === 'page_view').length
    const clicks = filteredEvents.filter(e => e.event_type === 'click').length

    const sessionPages: Record<string, Set<string>> = {}
    for (const e of filteredEvents) {
      if (e.session_id && e.event_type === 'page_view' && e.page) {
        if (!sessionPages[e.session_id]) sessionPages[e.session_id] = new Set()
        sessionPages[e.session_id].add(e.page)
      }
    }
    const sessionCounts = Object.values(sessionPages).map(s => s.size)
    const avgPagesPerSession = sessionCounts.length > 0
      ? (sessionCounts.reduce((a, b) => a + b, 0) / sessionCounts.length).toFixed(1)
      : '0'

    return { totalEvents, uniqueUsers: uniqueUserIds.size, uniqueSessions: uniqueSessions.size, pageViews, clicks, avgPagesPerSession }
  }, [filteredEvents])

  // ── DAU ────────────────────────────────────────────────────────────────────

  const dauData = useMemo<DayStat[]>(() => {
    const dayUsers: Record<string, Set<string>> = {}
    const dayEvents: Record<string, number> = {}
    const daySessions: Record<string, Set<string>> = {}
    for (const e of filteredEvents) {
      const day = e.created_at.slice(0, 10)
      if (!dayUsers[day]) { dayUsers[day] = new Set(); dayEvents[day] = 0; daySessions[day] = new Set() }
      dayUsers[day].add(e.user_id)
      dayEvents[day]++
      if (e.session_id) daySessions[day].add(e.session_id)
    }
    return Object.entries(dayUsers)
      .map(([date, users]) => ({ date, users: users.size, events: dayEvents[date], sessions: daySessions[date]?.size || 0 }))
      .sort((a, b) => a.date.localeCompare(b.date))
  }, [filteredEvents])

  // ── Day details ────────────────────────────────────────────────────────────

  const dayDetails = useMemo<DayDetail[]>(() => {
    const days: Record<string, { users: Set<string>; sessions: Set<string>; events: number; pageViews: number; clicks: number; engagements: number; pages: Record<string, number> }> = {}
    for (const e of filteredEvents) {
      const day = e.created_at.slice(0, 10)
      if (!days[day]) days[day] = { users: new Set(), sessions: new Set(), events: 0, pageViews: 0, clicks: 0, engagements: 0, pages: {} }
      const d = days[day]
      d.users.add(e.user_id)
      if (e.session_id) d.sessions.add(e.session_id)
      d.events++
      if (e.event_type === 'page_view') { d.pageViews++; if (e.page) d.pages[e.page] = (d.pages[e.page] || 0) + 1 }
      if (e.event_type === 'click') d.clicks++
      if (e.event_type === 'engagement') d.engagements++
    }
    return Object.entries(days)
      .map(([date, d]) => ({
        date,
        users: d.users,
        events: d.events,
        sessions: d.sessions.size,
        pageViews: d.pageViews,
        clicks: d.clicks,
        engagements: d.engagements,
        topPages: Object.entries(d.pages).map(([page, count]) => ({ page, count })).sort((a, b) => b.count - a.count).slice(0, 5),
      }))
      .sort((a, b) => b.date.localeCompare(a.date))
  }, [filteredEvents])

  // ── Top pages ──────────────────────────────────────────────────────────────

  const topPages = useMemo<PageStat[]>(() => {
    const pageCounts: Record<string, { views: number; users: Set<string> }> = {}
    for (const e of filteredEvents) {
      if (e.event_type === 'page_view' && e.page) {
        if (!pageCounts[e.page]) pageCounts[e.page] = { views: 0, users: new Set() }
        pageCounts[e.page].views++
        pageCounts[e.page].users.add(e.user_id)
      }
    }
    return Object.entries(pageCounts)
      .map(([page, { views, users }]) => ({ page, views, uniqueUsers: users.size }))
      .sort((a, b) => b.views - a.views)
      .slice(0, 15)
  }, [filteredEvents])

  // ── Top users ──────────────────────────────────────────────────────────────

  const topUsers = useMemo<UserStat[]>(() => {
    const userStats: Record<string, { events: number; sessions: Set<string>; pages: Set<string> }> = {}
    for (const e of filteredEvents) {
      if (!userStats[e.user_id]) userStats[e.user_id] = { events: 0, sessions: new Set(), pages: new Set() }
      userStats[e.user_id].events++
      if (e.session_id) userStats[e.user_id].sessions.add(e.session_id)
      if (e.page) userStats[e.user_id].pages.add(e.page)
    }
    return Object.entries(userStats)
      .map(([user_id, s]) => {
        const p = userProfiles.get(user_id)
        return { user_id, name: p?.name || '?', username: p?.username || '?', events: s.events, sessions: s.sessions.size, pages: s.pages.size }
      })
      .sort((a, b) => b.events - a.events)
      .slice(0, 15)
  }, [filteredEvents, userProfiles])

  // ── Actions ────────────────────────────────────────────────────────────────

  const actions = useMemo<ActionStat[]>(() => {
    const counts: Record<string, number> = {}
    for (const e of filteredEvents) {
      if ((e.event_type === 'click' || e.event_type === 'engagement') && e.target) {
        counts[e.target] = (counts[e.target] || 0) + 1
      }
    }
    return Object.entries(counts)
      .map(([target, count]) => ({ target, count }))
      .sort((a, b) => b.count - a.count)
      .slice(0, 20)
  }, [filteredEvents])

  // ── Hourly ─────────────────────────────────────────────────────────────────

  const hourly = useMemo<HourlyStat[]>(() => {
    const hours: number[] = new Array(24).fill(0)
    for (const e of filteredEvents) {
      const h = new Date(e.created_at).getHours()
      hours[h]++
    }
    return hours.map((events, hour) => ({ hour, events }))
  }, [filteredEvents])

  // ── Event types ────────────────────────────────────────────────────────────

  const eventTypeCounts = useMemo(() => {
    const counts: Record<string, number> = {}
    for (const e of filteredEvents) {
      counts[e.event_type] = (counts[e.event_type] || 0) + 1
    }
    return Object.entries(counts)
      .map(([type, count]) => ({ type, count }))
      .sort((a, b) => b.count - a.count)
  }, [filteredEvents])

  // ── Data completeness ──────────────────────────────────────────────────────

  const laneNameMap = useMemo(() => {
    const m = new Map<string, string>()
    for (const l of timelineLanes) m.set(l.id, l.name)
    return m
  }, [timelineLanes])

  const eventsPerLane = useMemo(() => {
    const counts: Record<string, number> = {}
    for (const e of timelineEvents) {
      const name = laneNameMap.get(e.lane_id) || 'Unknown'
      counts[name] = (counts[name] || 0) + 1
    }
    return Object.entries(counts)
      .map(([lane, count]) => ({ lane, count }))
      .sort((a, b) => b.count - a.count)
  }, [timelineEvents, laneNameMap])

  const importSources = useMemo(() => {
    const counts: Record<string, number> = {}
    for (const e of timelineEvents) {
      const src = e.source || 'manual'
      counts[src] = (counts[src] || 0) + 1
    }
    return Object.entries(counts)
      .map(([source, count]) => ({ source, count }))
      .sort((a, b) => b.count - a.count)
  }, [timelineEvents])

  const enrichmentStats = useMemo(() => {
    const total = timelineEvents.length
    if (total === 0) return []
    const fields = [
      { name: 'Description', count: timelineEvents.filter(e => e.description && e.description.trim().length > 0).length },
      { name: 'Location', count: timelineEvents.filter(e => e.location).length },
      { name: 'URL', count: timelineEvents.filter(e => e.url).length },
      { name: 'Rating', count: timelineEvents.filter(e => e.rating != null).length },
      { name: 'Emoji', count: timelineEvents.filter(e => e.emoji).length },
      { name: 'Color', count: timelineEvents.filter(e => e.color).length },
      { name: 'Image', count: timelineEvents.filter(e => e.metadata && (e.metadata as Record<string, unknown>).image_url).length },
      { name: 'Value Projection', count: timelineEvents.filter(e => e.value_projection != null).length },
    ]
    return fields.map(f => ({ ...f, pct: Math.round((f.count / total) * 100) }))
  }, [timelineEvents])

  const eventTypeBreakdown = useMemo(() => {
    const range = timelineEvents.filter(e => e.type === 'range').length
    const point = timelineEvents.filter(e => e.type === 'point').length
    return { range, point, total: timelineEvents.length }
  }, [timelineEvents])

  // ── Render ─────────────────────────────────────────────────────────────────

  if (loading) {
    return (
      <div className="flex flex-1 items-center justify-center">
        <Loader2 size={24} className="animate-spin text-muted-foreground" />
      </div>
    )
  }

  const maxHourly = Math.max(...hourly.map(h => h.events), 1)

  return (
    <div className="flex-1 overflow-y-auto bg-accent/30">
      {/* Header bar */}
      <div className="sticky top-0 z-20 border-b border-border bg-background">
        <div className="max-w-7xl mx-auto px-6 py-3 flex items-center justify-between">
          <div className="flex items-center gap-3">
            <BarChart3 size={20} style={{ color: '#5B8E6D' }} />
            <h1 className="text-lg font-bold text-foreground">Analytics</h1>
          </div>
          <div className="flex items-center gap-3">
            <div className="flex rounded-lg overflow-hidden border border-border">
              {(['7d', '30d', '90d'] as TimeRange[]).map(r => (
                <button
                  key={r}
                  type="button"
                  onClick={() => setRange(r)}
                  className={`px-4 py-1.5 text-xs font-semibold transition-colors ${
                    range === r ? 'bg-foreground text-background' : 'bg-background text-muted-foreground'
                  }`}
                >
                  {r}
                </button>
              ))}
            </div>
            <button
              type="button"
              onClick={loadData}
              disabled={dataLoading}
              className="flex items-center gap-1.5 rounded-lg px-3 py-1.5 text-xs font-semibold border border-border text-muted-foreground transition-colors hover:bg-accent"
            >
              <RefreshCw size={13} className={dataLoading ? 'animate-spin' : ''} />
              Refresh
            </button>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-6 py-6 space-y-6">
        {dataLoading && events.length === 0 ? (
          <div className="flex items-center justify-center py-24">
            <Loader2 size={28} className="animate-spin text-muted-foreground" />
          </div>
        ) : (
          <>
            {/* KPI cards */}
            <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-4">
              <StatCard label="Events" value={stats.totalEvents} color="hsl(var(--foreground))" />
              <StatCard label="Users" value={stats.uniqueUsers} color="#5B8E6D" />
              <StatCard label="Sessions" value={stats.uniqueSessions} color="#7B6D9E" />
              <StatCard label="Page Views" value={stats.pageViews} color="#B45309" />
              <StatCard label="Clicks" value={stats.clicks} color="#C4634A" />
              <StatCard label="Pages/Session" value={stats.avgPagesPerSession} color="#4A7B9A" />
            </div>

            {/* Route filter */}
            {allRoutes.length > 0 && (
              <div className="flex items-center gap-2 flex-wrap">
                <Filter size={14} className="text-muted-foreground" />
                <span className="text-xs font-medium text-muted-foreground">Filter:</span>
                <button
                  type="button"
                  onClick={() => setPageFilter('')}
                  className={`rounded-md px-3 py-1 text-xs font-semibold transition-colors ${
                    !pageFilter ? 'bg-foreground text-background' : 'bg-background text-muted-foreground border border-border'
                  }`}
                >
                  All
                </button>
                {allRoutes.map(r => (
                  <button
                    key={r}
                    type="button"
                    onClick={() => setPageFilter(pageFilter === r ? '' : r)}
                    className={`rounded-md px-3 py-1 text-xs font-semibold transition-colors ${
                      pageFilter === r ? 'bg-foreground text-background' : 'bg-background text-muted-foreground border border-border'
                    }`}
                  >
                    {r}
                  </button>
                ))}
                {pageFilter && (
                  <span className="text-[10px] ml-1 text-muted-foreground">
                    {filteredEvents.length} / {events.length} events
                  </span>
                )}
              </div>
            )}

            {/* DAU chart */}
            <Panel>
              <PanelHeader title="Daily Activity" icon={<TrendingUp size={16} />} />
              <div className="px-5 py-4">
                {dauData.length > 0 ? (
                  <LineChart data={dauData} height={220} />
                ) : (
                  <p className="text-sm text-center py-12 text-muted-foreground">No data yet</p>
                )}
              </div>
            </Panel>

            {/* Day-by-day breakdown */}
            {dayDetails.length > 0 && (
              <Panel>
                <PanelHeader title="Day-by-Day Breakdown" icon={<CalendarDays size={16} />} />
                <table className="w-full text-xs">
                  <thead>
                    <tr className="border-b border-border">
                      <th className="text-left px-5 py-2.5 font-semibold text-muted-foreground w-8"></th>
                      <th className="text-left px-3 py-2.5 font-semibold text-muted-foreground">Day</th>
                      <th className="text-right px-3 py-2.5 font-semibold text-muted-foreground">Users</th>
                      <th className="text-right px-3 py-2.5 font-semibold text-muted-foreground">Sessions</th>
                      <th className="text-right px-3 py-2.5 font-semibold text-muted-foreground">Events</th>
                      <th className="text-right px-3 py-2.5 font-semibold text-muted-foreground">Views</th>
                      <th className="text-right px-3 py-2.5 font-semibold text-muted-foreground">Clicks</th>
                      <th className="text-right px-3 py-2.5 font-semibold text-muted-foreground">Engagement</th>
                      <th className="px-5 py-2.5 w-40" />
                    </tr>
                  </thead>
                  <tbody>
                    {dayDetails.map(day => {
                      const expanded = expandedDays.has(day.date)
                      const d = new Date(day.date)
                      const dayName = d.toLocaleDateString('en-US', { weekday: 'short' })
                      const dateStr = d.toLocaleDateString('en-US', { month: 'short', day: '2-digit' })
                      const isToday = day.date === new Date().toISOString().slice(0, 10)
                      const maxEvt = dayDetails[0]?.events || 1

                      return (
                        <tr
                          key={day.date}
                          className="border-b border-border last:border-b-0 hover:bg-accent/50 transition-colors cursor-pointer"
                          style={isToday ? { background: 'rgba(91, 142, 109, 0.04)' } : undefined}
                          onClick={() => {
                            setExpandedDays(prev => {
                              const next = new Set(prev)
                              if (next.has(day.date)) next.delete(day.date); else next.add(day.date)
                              return next
                            })
                          }}
                        >
                          <td className="px-5 py-2.5">
                            <ChevronDown size={13} className={`transition-transform text-muted-foreground ${expanded ? '' : '-rotate-90'}`} />
                          </td>
                          <td className="px-3 py-2.5">
                            <div className="flex items-center gap-2">
                              <span className="font-semibold text-foreground">{dateStr}</span>
                              <span className="text-[10px] uppercase text-muted-foreground">{dayName}</span>
                              {isToday && <span className="text-[10px] font-bold px-1.5 py-0.5 rounded text-white" style={{ background: '#5B8E6D' }}>today</span>}
                            </div>
                            {expanded && (
                              <div className="mt-2 space-y-1.5">
                                <div className="flex flex-wrap gap-1">
                                  {[...day.users].map(uid => {
                                    const p = userProfiles.get(uid)
                                    return (
                                      <button
                                        key={uid}
                                        type="button"
                                        onClick={e => { e.stopPropagation(); loadUserLog(uid) }}
                                        className="inline-flex items-center gap-1 px-2 py-0.5 rounded-md text-[10px] font-medium hover:opacity-80 transition-opacity bg-accent border border-border text-muted-foreground"
                                      >
                                        <div
                                          className="w-4 h-4 rounded-full flex items-center justify-center text-white flex-shrink-0"
                                          style={{ background: avatarColor(p?.name || '?'), fontSize: '7px', fontWeight: 700 }}
                                        >
                                          {getInitials(p?.name || '?')}
                                        </div>
                                        {p?.name || uid.slice(0, 8)}
                                      </button>
                                    )
                                  })}
                                </div>
                                {day.topPages.length > 0 && (
                                  <div className="flex flex-wrap gap-1">
                                    {day.topPages.map(tp => (
                                      <span key={tp.page} className="inline-flex items-center gap-1 px-2 py-0.5 rounded-md text-[10px] font-mono" style={{ background: 'rgba(245, 158, 11, 0.1)', color: '#B45309' }}>
                                        {tp.page} <span className="font-bold">{tp.count}</span>
                                      </span>
                                    ))}
                                  </div>
                                )}
                              </div>
                            )}
                          </td>
                          <td className="text-right px-3 py-2.5 tabular-nums font-semibold" style={{ color: '#5B8E6D' }}>{day.users.size}</td>
                          <td className="text-right px-3 py-2.5 tabular-nums" style={{ color: '#7B6D9E' }}>{day.sessions}</td>
                          <td className="text-right px-3 py-2.5 tabular-nums font-semibold text-foreground">{day.events.toLocaleString()}</td>
                          <td className="text-right px-3 py-2.5 tabular-nums text-muted-foreground">{day.pageViews}</td>
                          <td className="text-right px-3 py-2.5 tabular-nums" style={{ color: '#C4634A' }}>{day.clicks}</td>
                          <td className="text-right px-3 py-2.5 tabular-nums" style={{ color: '#5B8E6D' }}>{day.engagements}</td>
                          <td className="px-5 py-2.5">
                            <div className="h-2 rounded-full overflow-hidden bg-accent/50">
                              <div className="h-full rounded-full bg-foreground" style={{ width: `${(day.events / maxEvt) * 100}%` }} />
                            </div>
                          </td>
                        </tr>
                      )
                    })}
                  </tbody>
                </table>
              </Panel>
            )}

            {/* Route groups */}
            {routeGroups.length > 0 && (
              <Panel>
                <PanelHeader title="Routes" icon={<FolderOpen size={16} />} />
                <table className="w-full text-xs">
                  <thead>
                    <tr className="border-b border-border">
                      <th className="text-left px-5 py-2.5 font-semibold text-muted-foreground w-8"></th>
                      <th className="text-left px-3 py-2.5 font-semibold text-muted-foreground">Route</th>
                      <th className="text-right px-3 py-2.5 font-semibold text-muted-foreground">Views</th>
                      <th className="text-right px-3 py-2.5 font-semibold text-muted-foreground">Users</th>
                      <th className="text-right px-3 py-2.5 font-semibold text-muted-foreground">Clicks</th>
                      <th className="px-5 py-2.5 w-48" />
                    </tr>
                  </thead>
                  <tbody>
                    {routeGroups.map(g => {
                      const expanded = expandedRoutes.has(g.route)
                      const maxViews = routeGroups[0]?.views || 1
                      return (
                        <React.Fragment key={g.route}>
                          <tr
                            className="border-b border-border hover:bg-accent/50 transition-colors cursor-pointer"
                            onClick={() => {
                              setExpandedRoutes(prev => {
                                const next = new Set(prev)
                                if (next.has(g.route)) next.delete(g.route); else next.add(g.route)
                                return next
                              })
                            }}
                          >
                            <td className="px-5 py-2.5">
                              {g.subPages.length > 1 && (
                                <ChevronDown size={13} className={`transition-transform text-muted-foreground ${expanded ? '' : '-rotate-90'}`} />
                              )}
                            </td>
                            <td className="px-3 py-2.5">
                              <div className="flex items-center gap-2">
                                <span className="font-bold text-foreground">{g.route}</span>
                                <span className="text-[10px] px-1.5 py-0.5 rounded bg-accent text-muted-foreground">
                                  {g.subPages.length} {g.subPages.length === 1 ? 'page' : 'pages'}
                                </span>
                              </div>
                            </td>
                            <td className="text-right px-3 py-2.5 tabular-nums font-semibold" style={{ color: '#B45309' }}>{g.views.toLocaleString()}</td>
                            <td className="text-right px-3 py-2.5 tabular-nums" style={{ color: '#5B8E6D' }}>{g.uniqueUsers}</td>
                            <td className="text-right px-3 py-2.5 tabular-nums" style={{ color: '#C4634A' }}>{g.clicks}</td>
                            <td className="px-5 py-2.5">
                              <div className="h-2 rounded-full overflow-hidden bg-accent/50">
                                <div className="h-full rounded-full" style={{ width: `${(g.views / maxViews) * 100}%`, background: '#F59E0B' }} />
                              </div>
                            </td>
                          </tr>
                          {expanded && g.subPages.map(sp => (
                            <tr key={sp.page} className="border-b border-border last:border-b-0 bg-accent/30">
                              <td className="px-5 py-1.5" />
                              <td className="px-3 py-1.5 pl-8">
                                <span className="font-mono text-[10px] text-muted-foreground">{sp.page}</span>
                              </td>
                              <td className="text-right px-3 py-1.5 tabular-nums text-muted-foreground">{sp.views}</td>
                              <td className="text-right px-3 py-1.5 tabular-nums text-muted-foreground">{sp.uniqueUsers}</td>
                              <td className="px-3 py-1.5" />
                              <td className="px-5 py-1.5">
                                <div className="h-1.5 rounded-full overflow-hidden bg-accent/50">
                                  <div className="h-full rounded-full" style={{ width: `${(sp.views / g.views) * 100}%`, background: '#F59E0B', opacity: 0.6 }} />
                                </div>
                              </td>
                            </tr>
                          ))}
                        </React.Fragment>
                      )
                    })}
                  </tbody>
                </table>
              </Panel>
            )}

            {/* Two columns: pages + users */}
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
              <Panel>
                <PanelHeader title="Top Pages" icon={<Eye size={16} />} />
                <div className="py-2">
                  {topPages.length > 0 ? topPages.map(p => (
                    <BarRow key={p.page} label={p.page} value={p.views} max={topPages[0].views} color="#F59E0B" sub={`${p.uniqueUsers} usr`} />
                  )) : (
                    <p className="text-xs text-center py-8 text-muted-foreground">No data yet</p>
                  )}
                </div>
              </Panel>

              <Panel>
                <PanelHeader title="Top Users" icon={<Users size={16} />} />
                <div className="py-1">
                  {topUsers.length > 0 ? topUsers.map((u, i) => (
                    <button
                      key={u.user_id}
                      type="button"
                      onClick={() => loadUserLog(u.user_id)}
                      className="w-full flex items-center gap-3 px-5 py-2 hover:bg-accent/50 transition-colors text-left"
                      style={selectedUserId === u.user_id ? { background: 'rgba(91, 142, 109, 0.08)' } : {}}
                    >
                      <span className="text-[10px] font-bold w-5 text-center text-muted-foreground">{i + 1}</span>
                      <div
                        className="w-7 h-7 rounded-full flex items-center justify-center text-white text-[10px] font-bold flex-shrink-0"
                        style={{ background: avatarColor(u.name) }}
                      >
                        {getInitials(u.name)}
                      </div>
                      <div className="flex-1 min-w-0">
                        <p className="text-xs font-semibold truncate text-foreground">{u.name}</p>
                        <p className="text-[10px] text-muted-foreground">@{u.username}</p>
                      </div>
                      <div className="text-right">
                        <p className="text-xs font-bold tabular-nums text-foreground">{u.events.toLocaleString()}</p>
                        <p className="text-[10px] text-muted-foreground">{u.sessions} ses · {u.pages} pg</p>
                      </div>
                      <ChevronRight size={14} className="text-muted-foreground" />
                    </button>
                  )) : (
                    <p className="text-xs text-center py-8 text-muted-foreground">No data yet</p>
                  )}
                </div>
              </Panel>
            </div>

            {/* Three columns: actions + hourly + event types */}
            <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
              <Panel>
                <PanelHeader title="Actions" icon={<MousePointerClick size={16} />} />
                <div className="py-2">
                  {actions.length > 0 ? actions.map(a => (
                    <BarRow key={a.target} label={a.target} value={a.count} max={actions[0].count} color="#5B8E6D" />
                  )) : (
                    <p className="text-xs text-center py-8 text-muted-foreground">No data yet</p>
                  )}
                </div>
              </Panel>

              <Panel>
                <PanelHeader title="Hourly Activity" icon={<Clock size={16} />} />
                <div className="px-5 py-4">
                  <div className="grid grid-cols-12 gap-1">
                    {hourly.map(h => (
                      <div key={h.hour} className="flex flex-col items-center gap-1">
                        <div
                          className="w-full aspect-square rounded-sm transition-all"
                          style={{
                            background: h.events === 0
                              ? 'hsl(var(--accent))'
                              : `rgba(91, 142, 109, ${Math.max(0.15, h.events / maxHourly)})`,
                          }}
                          title={`${h.hour}:00 — ${h.events} events`}
                        />
                        {h.hour % 3 === 0 && (
                          <span className="text-[10px] text-muted-foreground">{h.hour}</span>
                        )}
                      </div>
                    ))}
                  </div>
                </div>
              </Panel>

              <Panel>
                <PanelHeader title="Event Types" icon={<Activity size={16} />} />
                <div className="py-2">
                  {eventTypeCounts.map(({ type, count }) => {
                    const colorMap: Record<string, string> = {
                      page_view: '#F59E0B',
                      click: '#C4634A',
                      engagement: '#5B8E6D',
                      page_leave: '#7B6D9E',
                    }
                    return (
                      <BarRow key={type} label={type} value={count} max={eventTypeCounts[0]?.count || 1} color={colorMap[type] || '#888'} />
                    )
                  })}
                </div>
              </Panel>
            </div>

            {/* Data Completeness section */}
            {timelineEvents.length > 0 && (
              <>
                <div className="flex items-center gap-2 pt-2">
                  <Database size={16} className="text-muted-foreground" />
                  <h2 className="text-sm font-bold text-foreground">Data Completeness</h2>
                  <span className="text-[10px] text-muted-foreground">({timelineEvents.length} timeline events across all users)</span>
                </div>

                <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                  {/* Events per lane */}
                  <Panel>
                    <PanelHeader title="Events per Lane" icon={<Layers size={16} />} />
                    <div className="py-2">
                      {eventsPerLane.map(l => (
                        <BarRow key={l.lane} label={l.lane} value={l.count} max={eventsPerLane[0]?.count || 1} color="#4A7B9A" />
                      ))}
                    </div>
                  </Panel>

                  {/* Import sources */}
                  <Panel>
                    <PanelHeader title="Import Sources" icon={<FolderOpen size={16} />} />
                    <div className="py-2">
                      {importSources.map(s => (
                        <BarRow key={s.source} label={s.source} value={s.count} max={importSources[0]?.count || 1} color="#7B6D9E" />
                      ))}
                    </div>
                  </Panel>

                  {/* Most used personas */}
                  <Panel>
                    <PanelHeader title="Most Used Personas" icon={<Crown size={16} />} />
                    <div className="py-1">
                      {personas.length > 0 ? personas.filter(p => p.view_count > 0).map((p, i) => (
                        <div key={p.id} className="flex items-center gap-3 px-5 py-2 hover:bg-accent/50 transition-colors">
                          <span className="text-[10px] font-bold w-5 text-center text-muted-foreground">{i + 1}</span>
                          <div className="flex-1 min-w-0">
                            <p className="text-xs font-semibold truncate text-foreground">{p.name}</p>
                            <p className="text-[10px] text-muted-foreground">{p.birth_year}–{p.death_year || 'present'}</p>
                          </div>
                          <div className="text-right">
                            <p className="text-xs font-bold tabular-nums text-foreground">{p.view_count.toLocaleString()}</p>
                            <p className="text-[10px] text-muted-foreground">views</p>
                          </div>
                        </div>
                      )) : (
                        <p className="text-xs text-center py-8 text-muted-foreground">No persona views yet</p>
                      )}
                    </div>
                  </Panel>
                </div>

                <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                  {/* Enrichment stats */}
                  <Panel>
                    <PanelHeader title="Field Enrichment" icon={<Database size={16} />} />
                    <div className="py-2">
                      {enrichmentStats.map(f => (
                        <div key={f.name} className="flex items-center gap-3 px-5 py-2">
                          <span className="text-xs w-32 truncate flex-shrink-0 font-medium text-muted-foreground">{f.name}</span>
                          <div className="flex-1 h-5 rounded overflow-hidden bg-accent/50">
                            <div className="h-full rounded transition-all" style={{ width: `${Math.max(f.pct, 2)}%`, background: f.pct > 50 ? '#5B8E6D' : f.pct > 20 ? '#F59E0B' : '#C4634A' }} />
                          </div>
                          <span className="text-xs font-bold w-12 text-right tabular-nums text-foreground">{f.pct}%</span>
                          <span className="text-[10px] w-16 text-right text-muted-foreground">{f.count}/{timelineEvents.length}</span>
                        </div>
                      ))}
                    </div>
                  </Panel>

                  {/* Range vs Point */}
                  <Panel>
                    <PanelHeader title="Event Type Distribution" icon={<Activity size={16} />} />
                    <div className="px-5 py-6">
                      <div className="flex items-center gap-4 mb-4">
                        <div className="flex-1">
                          <div className="h-8 rounded-lg overflow-hidden flex">
                            {eventTypeBreakdown.total > 0 && (
                              <>
                                <div
                                  className="h-full transition-all"
                                  style={{ width: `${(eventTypeBreakdown.range / eventTypeBreakdown.total) * 100}%`, background: '#4A7B9A' }}
                                />
                                <div
                                  className="h-full transition-all"
                                  style={{ width: `${(eventTypeBreakdown.point / eventTypeBreakdown.total) * 100}%`, background: '#F59E0B' }}
                                />
                              </>
                            )}
                          </div>
                        </div>
                      </div>
                      <div className="flex items-center gap-6">
                        <div className="flex items-center gap-2">
                          <div className="w-3 h-3 rounded-sm" style={{ background: '#4A7B9A' }} />
                          <span className="text-xs text-muted-foreground">Range</span>
                          <span className="text-xs font-bold text-foreground">{eventTypeBreakdown.range}</span>
                        </div>
                        <div className="flex items-center gap-2">
                          <div className="w-3 h-3 rounded-sm" style={{ background: '#F59E0B' }} />
                          <span className="text-xs text-muted-foreground">Point</span>
                          <span className="text-xs font-bold text-foreground">{eventTypeBreakdown.point}</span>
                        </div>
                      </div>
                    </div>
                  </Panel>
                </div>
              </>
            )}

            {/* User activity log */}
            {selectedUserId && (
              <Panel>
                <div className="flex items-center justify-between px-5 py-3 border-b border-border">
                  <div className="flex items-center gap-3">
                    <Activity size={16} className="text-muted-foreground" />
                    <div className="flex items-center gap-2">
                      <div
                        className="w-7 h-7 rounded-full flex items-center justify-center text-white text-[10px] font-bold"
                        style={{ background: avatarColor(selectedUserProfile?.name || '?') }}
                      >
                        {getInitials(selectedUserProfile?.name || '?')}
                      </div>
                      <div>
                        <h3 className="text-sm font-bold text-foreground">{selectedUserProfile?.name || '?'}</h3>
                        <p className="text-[10px] text-muted-foreground">
                          @{selectedUserProfile?.username} · {userLogEvents.length} events · {userLogSessions.length} sessions
                        </p>
                      </div>
                    </div>
                  </div>
                  <div className="flex items-center gap-2">
                    <div className="relative">
                      <Search size={13} className="absolute left-2.5 top-2 pointer-events-none text-muted-foreground" />
                      <input
                        type="text"
                        value={userLogSearch}
                        onChange={e => setUserLogSearch(e.target.value)}
                        placeholder="Filter..."
                        className="rounded-lg pl-8 pr-3 py-1.5 text-xs outline-none w-48 border border-border bg-accent text-foreground"
                      />
                    </div>
                    <button
                      type="button"
                      onClick={() => { setSelectedUserId(null); setUserLogEvents([]) }}
                      className="w-7 h-7 flex items-center justify-center rounded-md hover:bg-accent transition-colors text-muted-foreground"
                    >
                      <X size={15} />
                    </button>
                  </div>
                </div>

                {userLogLoading ? (
                  <div className="flex justify-center py-12">
                    <Loader2 size={20} className="animate-spin text-muted-foreground" />
                  </div>
                ) : userLogSessions.length === 0 ? (
                  <div className="text-center py-12">
                    <p className="text-xs text-muted-foreground">No activity</p>
                  </div>
                ) : (
                  <div className="divide-y divide-border">
                    {userLogSessions.map(session => {
                      const expanded = userLogExpandedSessions.has(session.id)
                      const durationMin = Math.round(session.durationMs / 60000)
                      const durationStr = durationMin >= 60
                        ? `${Math.floor(durationMin / 60)}h ${durationMin % 60}m`
                        : durationMin > 0 ? `${durationMin}m` : '<1m'
                      const sessionDate = new Date(session.end)
                      const dateStr = sessionDate.toLocaleDateString('en-US', { month: 'short', day: '2-digit', year: 'numeric' })
                      const timeStr = sessionDate.toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit' })

                      return (
                        <div key={session.id}>
                          <button
                            type="button"
                            onClick={() => {
                              setUserLogExpandedSessions(prev => {
                                const next = new Set(prev)
                                if (next.has(session.id)) next.delete(session.id); else next.add(session.id)
                                return next
                              })
                            }}
                            className="w-full flex items-center gap-4 px-5 py-3 hover:bg-accent/50 transition-colors text-left"
                          >
                            <ChevronDown size={14} className={`transition-transform flex-shrink-0 text-muted-foreground ${expanded ? '' : '-rotate-90'}`} />
                            <div className="flex-1 flex items-center gap-4 flex-wrap">
                              <span className="text-xs font-semibold text-foreground">{dateStr} {timeStr}</span>
                              <span className="text-[10px] px-2 py-0.5 rounded-md bg-accent text-muted-foreground">{session.events.length} events</span>
                              <span className="text-[10px] px-2 py-0.5 rounded-md bg-accent text-muted-foreground">{session.pages} pages</span>
                              <span className="text-[10px] px-2 py-0.5 rounded-md bg-accent text-muted-foreground">{durationStr}</span>
                            </div>
                            <span className="text-[10px] font-mono text-muted-foreground">{session.id.slice(0, 8)}</span>
                          </button>

                          {expanded && (
                            <div className="bg-accent/30">
                              <table className="w-full text-xs">
                                <thead>
                                  <tr className="border-b border-border">
                                    <th className="text-left px-5 py-2 font-semibold text-muted-foreground w-36">Time</th>
                                    <th className="text-left px-3 py-2 font-semibold text-muted-foreground w-28">Type</th>
                                    <th className="text-left px-3 py-2 font-semibold text-muted-foreground w-40">Page</th>
                                    <th className="text-left px-3 py-2 font-semibold text-muted-foreground w-36">Action</th>
                                    <th className="text-left px-3 py-2 font-semibold text-muted-foreground">Details</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  {[...session.events].reverse().map((evt, idx) => {
                                    const t = new Date(evt.created_at)
                                    const typeColors: Record<string, string> = {
                                      page_view: '#B45309',
                                      click: '#C4634A',
                                      engagement: '#5B8E6D',
                                      page_leave: '#7B6D9E',
                                    }
                                    return (
                                      <tr key={idx} className="border-b border-border last:border-b-0 hover:bg-background/50 transition-colors">
                                        <td className="px-5 py-1.5 tabular-nums text-muted-foreground">
                                          {t.toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit', second: '2-digit' })}
                                        </td>
                                        <td className="px-3 py-1.5">
                                          <span
                                            className="inline-block px-2 py-0.5 rounded text-[10px] font-semibold"
                                            style={{
                                              background: `${typeColors[evt.event_type] || '#888'}18`,
                                              color: typeColors[evt.event_type] || '#888',
                                            }}
                                          >
                                            {evt.event_type}
                                          </span>
                                        </td>
                                        <td className="px-3 py-1.5 font-mono text-[10px] truncate max-w-[160px] text-muted-foreground">{evt.page || '—'}</td>
                                        <td className="px-3 py-1.5 truncate max-w-[144px] text-foreground">{evt.target || '—'}</td>
                                        <td className="px-3 py-1.5 font-mono text-[10px] truncate max-w-[200px] text-muted-foreground">
                                          {evt.metadata ? JSON.stringify(evt.metadata) : '—'}
                                        </td>
                                      </tr>
                                    )
                                  })}
                                </tbody>
                              </table>
                            </div>
                          )}
                        </div>
                      )
                    })}
                  </div>
                )}
              </Panel>
            )}
          </>
        )}
      </div>
    </div>
  )
}
