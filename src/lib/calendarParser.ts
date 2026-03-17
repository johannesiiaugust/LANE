/**
 * Calendar file parser — supports ICS, VCS, CSV, JSON, XML, TSV formats.
 * Returns ParsedCalendarEvent[] for import into timeline.
 */

export interface ParsedCalendarEvent {
  title: string
  description: string
  startYear: number    // fractional year
  endYear?: number     // fractional year, undefined = point event
  category: string     // mapped to lane name
}

/** Convert a Date to fractional year (e.g. 2020.5 = July 2020) */
function dateToFractionalYear(d: Date): number {
  const year = d.getFullYear()
  const start = new Date(year, 0, 1).getTime()
  const end = new Date(year + 1, 0, 1).getTime()
  return year + (d.getTime() - start) / (end - start)
}

/** Parse an ICS/ICAL date string (YYYYMMDD or YYYYMMDDTHHmmssZ) */
function parseIcsDate(s: string): Date | null {
  s = s.trim()
  // Strip TZID prefix like TZID=America/New_York:20200115T090000
  if (s.includes(':')) {
    s = s.split(':').pop()!
  }
  if (s.length < 8) return null
  const y = parseInt(s.slice(0, 4))
  const m = parseInt(s.slice(4, 6)) - 1
  const d = parseInt(s.slice(6, 8))
  let h = 0, min = 0, sec = 0
  if (s.length >= 15 && s[8] === 'T') {
    h = parseInt(s.slice(9, 11))
    min = parseInt(s.slice(11, 13))
    sec = parseInt(s.slice(13, 15))
  }
  const date = new Date(y, m, d, h, min, sec)
  if (isNaN(date.getTime())) return null
  return date
}

/** Unfold ICS lines (continuation lines start with space/tab) */
function unfoldIcsLines(text: string): string[] {
  const raw = text.replace(/\r\n/g, '\n').replace(/\r/g, '\n')
  const lines: string[] = []
  for (const line of raw.split('\n')) {
    if ((line.startsWith(' ') || line.startsWith('\t')) && lines.length > 0) {
      lines[lines.length - 1] += line.slice(1)
    } else {
      lines.push(line)
    }
  }
  return lines
}

/** Unescape ICS text values */
function unescapeIcs(s: string): string {
  return s.replace(/\\n/g, '\n').replace(/\\,/g, ',').replace(/\\\\/g, '\\').replace(/\\;/g, ';')
}

/** Parse ICS / ICAL / VCS (iCalendar & vCalendar) */
export function parseIcs(text: string): ParsedCalendarEvent[] {
  const lines = unfoldIcsLines(text)
  const events: ParsedCalendarEvent[] = []
  let inEvent = false
  let title = ''
  let description = ''
  let startDate: Date | null = null
  let endDate: Date | null = null
  let category = ''
  let location = ''

  for (const line of lines) {
    const upper = line.toUpperCase()
    if (upper === 'BEGIN:VEVENT') {
      inEvent = true
      title = ''
      description = ''
      startDate = null
      endDate = null
      category = ''
      location = ''
    } else if (upper === 'END:VEVENT') {
      if (inEvent && title && startDate) {
        const startYear = dateToFractionalYear(startDate)
        let endYear: number | undefined
        if (endDate) {
          const ey = dateToFractionalYear(endDate)
          // Only treat as range if end is meaningfully different from start (> 30 days)
          if (ey - startYear > 30 / 365) {
            endYear = ey
          }
        }
        // Append location to description if present
        const fullDesc = [description.trim(), location ? `Location: ${location}` : ''].filter(Boolean).join('\n')
        events.push({
          title,
          description: fullDesc,
          startYear,
          endYear,
          category: category || 'Activities',
        })
      }
      inEvent = false
    } else if (inEvent) {
      const colonIdx = line.indexOf(':')
      if (colonIdx === -1) continue
      const key = line.slice(0, colonIdx).split(';')[0].toUpperCase()
      const value = line.slice(colonIdx + 1)
      switch (key) {
        case 'SUMMARY':
          title = unescapeIcs(value)
          break
        case 'DESCRIPTION':
          description = unescapeIcs(value)
          break
        case 'DTSTART':
          startDate = parseIcsDate(value)
          break
        case 'DTEND':
        case 'DUE':
          if (!endDate) endDate = parseIcsDate(value)
          break
        case 'CATEGORIES':
        case 'X-CATEGORY':
        case 'X-CATEGORIES':
          if (!category) category = unescapeIcs(value).split(',')[0].trim()
          break
        case 'CLASS':
        case 'X-LANE':
        case 'X-TIMELINE-LANE':
        case 'X-TIMELINE-CATEGORY':
          if (!category) category = unescapeIcs(value).trim()
          break
        case 'LOCATION':
        case 'GEO':
        case 'X-LOCATION':
          location = unescapeIcs(value)
          break
        case 'COMMENT':
        case 'X-ALT-DESC':
          // Append as supplementary description
          if (!description) description = unescapeIcs(value)
          break
      }
    }
  }
  return events
}

// Column header keyword sets for CSV/TSV parsing
const TITLE_HEADERS = new Set([
  'title', 'summary', 'name', 'event', 'event_name', 'event_title',
  'subject', 'heading', 'label', 'what', 'activity', 'item',
  'eventname', 'eventtitle', 'task', 'task_name', 'entry',
])
const DESC_HEADERS = new Set([
  'description', 'desc', 'notes', 'details', 'body', 'content',
  'memo', 'comment', 'comments', 'info', 'information', 'text',
  'remark', 'remarks', 'about', 'summary_detail', 'long_description',
])
const START_HEADERS = new Set([
  'start_date', 'start', 'date', 'begin', 'from', 'start_time',
  'startdate', 'begin_date', 'begindate', 'from_date', 'fromdate',
  'started', 'started_at', 'starts', 'starts_at', 'date_start',
  'beginning', 'onset', 'since', 'first_date', 'open_date',
  'created', 'created_at', 'created_date', 'when',
])
const END_HEADERS = new Set([
  'end_date', 'end', 'finish', 'to', 'until', 'end_time',
  'enddate', 'finish_date', 'finishdate', 'to_date', 'todate',
  'ended', 'ended_at', 'ends', 'ends_at', 'date_end',
  'through', 'thru', 'completed', 'completed_at', 'close_date',
  'due', 'due_date', 'deadline', 'expiry', 'expires', 'last_date',
])
const CAT_HEADERS = new Set([
  'category', 'lane', 'type', 'group', 'tag', 'tags', 'class',
  'kind', 'area', 'dimension', 'domain', 'bucket', 'section',
  'classification', 'label_type', 'event_type', 'eventtype',
  'track', 'channel', 'stream', 'pillar', 'topic', 'theme',
  'life_area', 'lifearea', 'aspect',
])

/** Find first header index matching a keyword set */
function findHeaderIdx(header: string[], keywords: Set<string>): number {
  return header.findIndex(h => keywords.has(h))
}

/** Parse CSV text: title,description,start_date,end_date,category */
export function parseCsv(text: string): ParsedCalendarEvent[] {
  const lines = text.trim().split(/\r?\n/)
  if (lines.length < 2) return []

  // Parse header to find column indices
  const header = parseCsvLine(lines[0]).map(h => h.toLowerCase().trim().replace(/[^a-z0-9_]/g, '_'))
  const titleIdx = findHeaderIdx(header, TITLE_HEADERS)
  const descIdx = findHeaderIdx(header, DESC_HEADERS)
  const startIdx = findHeaderIdx(header, START_HEADERS)
  const endIdx = findHeaderIdx(header, END_HEADERS)
  const catIdx = findHeaderIdx(header, CAT_HEADERS)

  if (titleIdx === -1 || startIdx === -1) return []

  const events: ParsedCalendarEvent[] = []
  for (let i = 1; i < lines.length; i++) {
    if (!lines[i].trim()) continue
    const cols = parseCsvLine(lines[i])
    const title = cols[titleIdx]?.trim()
    if (!title) continue
    const startDate = parseFlexibleDate(cols[startIdx]?.trim())
    if (!startDate) continue
    const endDate = endIdx >= 0 ? parseFlexibleDate(cols[endIdx]?.trim()) : null
    const startYear = dateToFractionalYear(startDate)
    let endYear: number | undefined
    if (endDate) {
      const ey = dateToFractionalYear(endDate)
      if (ey - startYear > 30 / 365) endYear = ey
    }
    events.push({
      title,
      description: descIdx >= 0 ? (cols[descIdx]?.trim() || '') : '',
      startYear,
      endYear,
      category: (catIdx >= 0 ? cols[catIdx]?.trim() : '') || 'Activities',
    })
  }
  return events
}

/** Parse a single CSV line respecting quoted fields */
function parseCsvLine(line: string): string[] {
  const result: string[] = []
  let current = ''
  let inQuotes = false
  for (let i = 0; i < line.length; i++) {
    const ch = line[i]
    if (inQuotes) {
      if (ch === '"') {
        if (i + 1 < line.length && line[i + 1] === '"') {
          current += '"'
          i++
        } else {
          inQuotes = false
        }
      } else {
        current += ch
      }
    } else {
      if (ch === '"') {
        inQuotes = true
      } else if (ch === ',') {
        result.push(current)
        current = ''
      } else {
        current += ch
      }
    }
  }
  result.push(current)
  return result
}

/** Parse TSV text (tab-separated) — same column names as CSV */
export function parseTsv(text: string): ParsedCalendarEvent[] {
  const lines = text.trim().split(/\r?\n/)
  if (lines.length < 2) return []

  const header = lines[0].split('\t').map(h => h.toLowerCase().trim().replace(/[^a-z0-9_]/g, '_'))
  const titleIdx = findHeaderIdx(header, TITLE_HEADERS)
  const descIdx = findHeaderIdx(header, DESC_HEADERS)
  const startIdx = findHeaderIdx(header, START_HEADERS)
  const endIdx = findHeaderIdx(header, END_HEADERS)
  const catIdx = findHeaderIdx(header, CAT_HEADERS)

  if (titleIdx === -1 || startIdx === -1) return []

  const events: ParsedCalendarEvent[] = []
  for (let i = 1; i < lines.length; i++) {
    if (!lines[i].trim()) continue
    const cols = lines[i].split('\t')
    const title = cols[titleIdx]?.trim()
    if (!title) continue
    const startDate = parseFlexibleDate(cols[startIdx]?.trim())
    if (!startDate) continue
    const endDate = endIdx >= 0 ? parseFlexibleDate(cols[endIdx]?.trim()) : null
    const startYear = dateToFractionalYear(startDate)
    let endYear: number | undefined
    if (endDate) {
      const ey = dateToFractionalYear(endDate)
      if (ey - startYear > 30 / 365) endYear = ey
    }
    events.push({
      title,
      description: descIdx >= 0 ? (cols[descIdx]?.trim() || '') : '',
      startYear,
      endYear,
      category: (catIdx >= 0 ? cols[catIdx]?.trim() : '') || 'Activities',
    })
  }
  return events
}

/** Parse JSON: expects array of objects with title, start_date, etc. */
export function parseJson(text: string): ParsedCalendarEvent[] {
  let data: unknown
  try {
    data = JSON.parse(text)
  } catch {
    return []
  }

  // Accept array at root or under common wrapper keys
  const ARRAY_KEYS = ['events', 'items', 'data', 'entries', 'records', 'calendar', 'timeline', 'results', 'list']
  let arr: unknown[]
  if (Array.isArray(data)) {
    arr = data
  } else if (data && typeof data === 'object') {
    const obj = data as Record<string, unknown>
    const key = ARRAY_KEYS.find(k => Array.isArray(obj[k]))
    if (key) {
      arr = obj[key] as unknown[]
    } else {
      return []
    }
  } else {
    return []
  }

  /** Pick first truthy string from an object by trying multiple keys */
  const pick = (obj: Record<string, unknown>, keys: string[]): string => {
    for (const k of keys) {
      const v = obj[k]
      if (v != null && v !== '' && v !== false) return String(v).trim()
    }
    return ''
  }

  const TITLE_KEYS = ['title', 'summary', 'name', 'event', 'event_name', 'eventName', 'event_title', 'eventTitle', 'subject', 'heading', 'label', 'what', 'activity', 'item', 'task']
  const DESC_KEYS = ['description', 'desc', 'notes', 'details', 'body', 'content', 'memo', 'comment', 'info', 'text', 'remark', 'about', 'long_description', 'longDescription']
  const START_KEYS = ['start_date', 'start', 'date', 'startDate', 'begin', 'from', 'started', 'started_at', 'startedAt', 'begins', 'since', 'when', 'created', 'created_at', 'createdAt', 'from_date', 'fromDate', 'start_time', 'startTime']
  const END_KEYS = ['end_date', 'end', 'endDate', 'finish', 'to', 'until', 'ended', 'ended_at', 'endedAt', 'through', 'thru', 'completed', 'completed_at', 'completedAt', 'to_date', 'toDate', 'due', 'due_date', 'dueDate', 'deadline', 'end_time', 'endTime', 'close_date', 'closeDate']
  const CAT_KEYS = ['category', 'lane', 'type', 'group', 'tag', 'class', 'kind', 'area', 'domain', 'bucket', 'section', 'track', 'channel', 'topic', 'theme', 'life_area', 'lifeArea']

  const events: ParsedCalendarEvent[] = []
  for (const item of arr) {
    if (!item || typeof item !== 'object') continue
    const obj = item as Record<string, unknown>
    const title = pick(obj, TITLE_KEYS)
    if (!title) continue
    const startStr = pick(obj, START_KEYS)
    const startDate = parseFlexibleDate(startStr)
    if (!startDate) continue
    const endStr = pick(obj, END_KEYS)
    const endDate = endStr ? parseFlexibleDate(endStr) : null
    const startYear = dateToFractionalYear(startDate)
    let endYear: number | undefined
    if (endDate) {
      const ey = dateToFractionalYear(endDate)
      if (ey - startYear > 30 / 365) endYear = ey
    }
    events.push({
      title,
      description: pick(obj, DESC_KEYS),
      startYear,
      endYear,
      category: pick(obj, CAT_KEYS) || 'Activities',
    })
  }
  return events
}

/** Parse XML: expects <events><event>...</event></events> or similar structure */
export function parseXml(text: string): ParsedCalendarEvent[] {
  const parser = new DOMParser()
  const doc = parser.parseFromString(text, 'text/xml')
  if (doc.querySelector('parsererror')) return []

  // Accept various root/item element names
  let eventEls = doc.querySelectorAll('event')
  if (eventEls.length === 0) eventEls = doc.querySelectorAll('item')
  if (eventEls.length === 0) eventEls = doc.querySelectorAll('entry')
  if (eventEls.length === 0) eventEls = doc.querySelectorAll('record')
  if (eventEls.length === 0) eventEls = doc.querySelectorAll('row')
  if (eventEls.length === 0) eventEls = doc.querySelectorAll('activity')

  const events: ParsedCalendarEvent[] = []

  /** Try multiple tag names and return first non-empty text */
  const pickTag = (el: Element, names: string[]): string => {
    for (const n of names) {
      const text = el.querySelector(n)?.textContent?.trim()
      if (text) return text
    }
    return ''
  }

  const XML_TITLE_TAGS = ['title', 'summary', 'name', 'event_name', 'eventName', 'subject', 'heading', 'label', 'what', 'activity']
  const XML_DESC_TAGS = ['description', 'desc', 'notes', 'details', 'body', 'content', 'memo', 'comment', 'info', 'text', 'remark', 'about']
  const XML_START_TAGS = ['start_date', 'startDate', 'start', 'date', 'begin', 'from', 'since', 'when', 'created', 'from_date', 'fromDate']
  const XML_END_TAGS = ['end_date', 'endDate', 'end', 'finish', 'to', 'until', 'through', 'thru', 'completed', 'due', 'deadline', 'to_date', 'toDate', 'close_date', 'closeDate']
  const XML_CAT_TAGS = ['category', 'lane', 'type', 'group', 'tag', 'class', 'kind', 'area', 'domain', 'bucket', 'section', 'track', 'topic', 'theme']

  for (const el of eventEls) {
    const title = pickTag(el, XML_TITLE_TAGS)
    if (!title) continue
    const startStr = pickTag(el, XML_START_TAGS)
    const startDate = parseFlexibleDate(startStr)
    if (!startDate) continue
    const endStr = pickTag(el, XML_END_TAGS)
    const endDate = endStr ? parseFlexibleDate(endStr) : null
    const startYear = dateToFractionalYear(startDate)
    let endYear: number | undefined
    if (endDate) {
      const ey = dateToFractionalYear(endDate)
      if (ey - startYear > 30 / 365) endYear = ey
    }
    events.push({
      title,
      description: pickTag(el, XML_DESC_TAGS),
      startYear,
      endYear,
      category: pickTag(el, XML_CAT_TAGS) || 'Activities',
    })
  }
  return events
}

/** Month name → 0-indexed month number */
const MONTH_NAMES: Record<string, number> = {
  jan: 0, january: 0, feb: 1, february: 1, mar: 2, march: 2,
  apr: 3, april: 3, may: 4, jun: 5, june: 5,
  jul: 6, july: 6, aug: 7, august: 7, sep: 8, sept: 8, september: 8,
  oct: 9, october: 9, nov: 10, november: 10, dec: 11, december: 11,
}

/** Parse flexible date strings — supports many formats */
function parseFlexibleDate(s: string): Date | null {
  if (!s) return null
  s = s.trim()

  // Pure year: "2020"
  if (/^\d{4}$/.test(s)) {
    return new Date(parseInt(s), 0, 1)
  }
  // YYYY-MM-DD or YYYY/MM/DD (with optional time)
  const isoMatch = s.match(/^(\d{4})[-/.](\d{1,2})[-/.](\d{1,2})/)
  if (isoMatch) {
    return new Date(parseInt(isoMatch[1]), parseInt(isoMatch[2]) - 1, parseInt(isoMatch[3]))
  }
  // MM/DD/YYYY or MM-DD-YYYY or MM.DD.YYYY
  const usMatch = s.match(/^(\d{1,2})[-/.](\d{1,2})[-/.](\d{4})/)
  if (usMatch) {
    return new Date(parseInt(usMatch[3]), parseInt(usMatch[1]) - 1, parseInt(usMatch[2]))
  }
  // DD.MM.YYYY European (only when first num > 12, otherwise ambiguous — fallback later)
  const euMatch = s.match(/^(\d{1,2})[-/.](\d{1,2})[-/.](\d{4})/)
  if (euMatch && parseInt(euMatch[1]) > 12) {
    return new Date(parseInt(euMatch[3]), parseInt(euMatch[2]) - 1, parseInt(euMatch[1]))
  }
  // "Month DD, YYYY" or "Month DD YYYY" — e.g. "January 15, 2020"
  const monthNameMatch = s.match(/^([a-z]+)\s+(\d{1,2}),?\s*(\d{4})/i)
  if (monthNameMatch) {
    const m = MONTH_NAMES[monthNameMatch[1].toLowerCase()]
    if (m !== undefined) {
      return new Date(parseInt(monthNameMatch[3]), m, parseInt(monthNameMatch[2]))
    }
  }
  // "DD Month YYYY" — e.g. "15 January 2020"
  const dmyNameMatch = s.match(/^(\d{1,2})\s+([a-z]+)\s+(\d{4})/i)
  if (dmyNameMatch) {
    const m = MONTH_NAMES[dmyNameMatch[2].toLowerCase()]
    if (m !== undefined) {
      return new Date(parseInt(dmyNameMatch[3]), m, parseInt(dmyNameMatch[1]))
    }
  }
  // "Month YYYY" — e.g. "March 2020"
  const monthYearMatch = s.match(/^([a-z]+)\s+(\d{4})$/i)
  if (monthYearMatch) {
    const m = MONTH_NAMES[monthYearMatch[1].toLowerCase()]
    if (m !== undefined) {
      return new Date(parseInt(monthYearMatch[2]), m, 1)
    }
  }
  // "YYYY-MM" — e.g. "2020-03"
  const yearMonthMatch = s.match(/^(\d{4})[-/.](\d{1,2})$/)
  if (yearMonthMatch) {
    return new Date(parseInt(yearMonthMatch[1]), parseInt(yearMonthMatch[2]) - 1, 1)
  }
  // Unix timestamp (seconds or milliseconds)
  if (/^\d{10,13}$/.test(s)) {
    const ts = parseInt(s)
    const d = new Date(ts > 9999999999 ? ts : ts * 1000)
    if (!isNaN(d.getTime()) && d.getFullYear() > 1000) return d
  }
  // Try native Date.parse as fallback
  const d = new Date(s)
  if (!isNaN(d.getTime()) && d.getFullYear() > 1000) return d
  return null
}

/** Detect format from extension or content and parse */
export function parseCalendarFile(text: string, fileName: string): ParsedCalendarEvent[] {
  const ext = fileName.split('.').pop()?.toLowerCase() || ''

  switch (ext) {
    case 'ics':
    case 'ical':
    case 'vcs':
      return parseIcs(text)
    case 'csv':
      return parseCsv(text)
    case 'tsv':
      return parseTsv(text)
    case 'json':
      return parseJson(text)
    case 'xml':
      return parseXml(text)
    default:
      // Try to detect format from content
      if (text.includes('BEGIN:VCALENDAR') || text.includes('BEGIN:VEVENT')) {
        return parseIcs(text)
      }
      if (text.trimStart().startsWith('{') || text.trimStart().startsWith('[')) {
        return parseJson(text)
      }
      if (text.trimStart().startsWith('<')) {
        return parseXml(text)
      }
      // Try TSV (if first line has tabs)
      if (text.split(/\r?\n/)[0]?.includes('\t')) {
        const tsvResult = parseTsv(text)
        if (tsvResult.length > 0) return tsvResult
      }
      // Try CSV
      const csvResult = parseCsv(text)
      if (csvResult.length > 0) return csvResult
      return []
  }
}

/** Known lane names for category matching */
const LANE_ALIASES: Record<string, string> = {
  // Place (Location + Travel)
  'location': 'Place',
  'city': 'Place',
  'place': 'Place',
  'address': 'Place',
  'residence': 'Place',
  'country': 'Place',
  'town': 'Place',
  'region': 'Place',
  'where': 'Place',
  'living': 'Place',
  'lived': 'Place',
  'moved': 'Place',
  'move': 'Place',
  'relocation': 'Place',
  'travel': 'Place',
  'abroad': 'Place',
  'geo': 'Place',
  'geography': 'Place',
  'neighborhood': 'Place',
  'state': 'Place',
  'province': 'Place',
  'locations': 'Place',

  // Work (Work + Education)
  'university': 'Work',
  'college': 'Work',
  'school': 'Work',
  'education': 'Work',
  'academic': 'Work',
  'academics': 'Work',
  'degree': 'Work',
  'study': 'Work',
  'studies': 'Work',
  'student': 'Work',
  'campus': 'Work',
  'graduation': 'Work',
  'graduate': 'Work',
  'undergrad': 'Work',
  'undergraduate': 'Work',
  'postgrad': 'Work',
  'postgraduate': 'Work',
  'phd': 'Work',
  'masters': 'Work',
  'bachelors': 'Work',
  'diploma': 'Work',
  'certification': 'Work',
  'training': 'Work',
  'learning': 'Work',
  'course': 'Work',
  'courses': 'Work',
  'bootcamp': 'Work',
  'mba': 'Work',
  'high school': 'Work',
  'highschool': 'Work',
  'elementary': 'Work',
  'middle school': 'Work',
  'seminary': 'Work',
  'institute': 'Work',
  'academy': 'Work',
  'work': 'Work',
  'job': 'Work',
  'career': 'Work',
  'employment': 'Work',
  'profession': 'Work',
  'professional': 'Work',
  'company': 'Work',
  'employer': 'Work',
  'occupation': 'Work',
  'business': 'Work',
  'corporate': 'Work',
  'office': 'Work',
  'freelance': 'Work',
  'consulting': 'Work',
  'contractor': 'Work',
  'internship': 'Work',
  'intern': 'Work',
  'startup': 'Work',
  'entrepreneurship': 'Work',
  'self-employed': 'Work',
  'self employed': 'Work',
  'position': 'Work',
  'role': 'Work',
  'gig': 'Work',
  'volunteer': 'Work',
  'volunteering': 'Work',
  'military': 'Work',
  'service': 'Work',
  'project': 'Work',
  'side hustle': 'Work',
  'part-time': 'Work',
  'full-time': 'Work',
  'contract': 'Work',
  'appointment': 'Work',

  // Health
  'health': 'Health',
  'medical': 'Health',
  'wellness': 'Health',
  'fitness': 'Health',
  'sport': 'Health',
  'sports': 'Health',
  'exercise': 'Health',
  'injury': 'Health',
  'illness': 'Health',
  'surgery': 'Health',
  'therapy': 'Health',
  'mental health': 'Health',

  // Relations (Relationships + Family + Kids + Parents)
  'relations': 'Relations',
  'relationship': 'Relations',
  'relationships': 'Relations',
  'family': 'Relations',
  'marriage': 'Relations',
  'married': 'Relations',
  'wedding': 'Relations',
  'partner': 'Relations',
  'spouse': 'Relations',
  'dating': 'Relations',
  'romance': 'Relations',
  'romantic': 'Relations',
  'love': 'Relations',
  'engagement': 'Relations',
  'engaged': 'Relations',
  'divorce': 'Relations',
  'divorced': 'Relations',
  'separation': 'Relations',
  'significant other': 'Relations',
  'couple': 'Relations',
  'domestic': 'Relations',
  'friendship': 'Relations',
  'friends': 'Relations',
  'social': 'Relations',
  'kids': 'Relations',
  'children': 'Relations',
  'child': 'Relations',
  'baby': 'Relations',
  'babies': 'Relations',
  'son': 'Relations',
  'daughter': 'Relations',
  'newborn': 'Relations',
  'birth': 'Relations',
  'born': 'Relations',
  'parenting': 'Relations',
  'toddler': 'Relations',
  'infant': 'Relations',
  'offspring': 'Relations',
  'adoption': 'Relations',
  'adopted': 'Relations',
  'pregnancy': 'Relations',
  'pregnant': 'Relations',
  'parents': 'Relations',
  'parent': 'Relations',
  'mother': 'Relations',
  'father': 'Relations',
  'mom': 'Relations',
  'dad': 'Relations',
  'grandparent': 'Relations',
  'grandparents': 'Relations',
  'grandmother': 'Relations',
  'grandfather': 'Relations',
  'guardian': 'Relations',
  'caregiver': 'Relations',
  'elder': 'Relations',
  'elders': 'Relations',
  'in-laws': 'Relations',
  'in laws': 'Relations',
  'siblings': 'Relations',
  'sibling': 'Relations',
  'brother': 'Relations',
  'sister': 'Relations',
  'aunt': 'Relations',
  'uncle': 'Relations',
  'extended family': 'Relations',

  // Assets
  'wealth': 'Assets',
  'finance': 'Assets',
  'finances': 'Assets',
  'financial': 'Assets',
  'money': 'Assets',
  'income': 'Assets',
  'salary': 'Assets',
  'earnings': 'Assets',
  'investment': 'Assets',
  'investments': 'Assets',
  'savings': 'Assets',
  'net worth': 'Assets',
  'networth': 'Assets',
  'budget': 'Assets',
  'debt': 'Assets',
  'loan': 'Assets',
  'loans': 'Assets',
  'tax': 'Assets',
  'taxes': 'Assets',
  'bank': 'Assets',
  'banking': 'Assets',
  'retirement': 'Assets',
  'pension': 'Assets',
  '401k': 'Assets',
  'ira': 'Assets',
  'stock': 'Assets',
  'stocks': 'Assets',
  'crypto': 'Assets',
  'economic': 'Assets',
  'economy': 'Assets',
  'assets': 'Assets',
  'portfolio': 'Assets',
  'fundraising': 'Assets',

  // Items (Vehicles + Type of House + Items)
  'cars': 'Items',
  'car': 'Items',
  'vehicles': 'Items',
  'vehicle': 'Items',
  'auto': 'Items',
  'automobile': 'Items',
  'automotive': 'Items',
  'truck': 'Items',
  'motorcycle': 'Items',
  'bike': 'Items',
  'transport': 'Items',
  'transportation': 'Items',
  'driving': 'Items',
  'commute': 'Items',
  'suv': 'Items',
  'van': 'Items',
  'ev': 'Items',
  'electric vehicle': 'Items',
  'boat': 'Items',
  'rv': 'Items',
  'house': 'Items',
  'housing': 'Items',
  'home': 'Items',
  'apartment': 'Items',
  'flat': 'Items',
  'condo': 'Items',
  'condominium': 'Items',
  'dwelling': 'Items',
  'real estate': 'Items',
  'realestate': 'Items',
  'property': 'Items',
  'rental': 'Items',
  'rent': 'Items',
  'mortgage': 'Items',
  'residence type': 'Items',
  'living situation': 'Items',
  'shelter': 'Items',
  'studio': 'Items',
  'townhouse': 'Items',
  'duplex': 'Items',
  'loft': 'Items',
  'dormitory': 'Items',
  'dorm': 'Items',
  'roommate': 'Items',
  'cottage': 'Items',
  'cabin': 'Items',
  'manor': 'Items',
  'villa': 'Items',

  // Activities
  'other': 'Activities',
  'other activities': 'Activities',
  'activities': 'Activities',
  'personal': 'Activities',
  'misc': 'Activities',
  'miscellaneous': 'Activities',
  'general': 'Activities',
  'hobby': 'Activities',
  'hobbies': 'Activities',
  'leisure': 'Activities',
  'recreation': 'Activities',
  'event': 'Activities',
  'milestone': 'Activities',
  'achievement': 'Activities',
  'award': 'Activities',
  'awards': 'Activities',
  'certification received': 'Activities',
  'side project': 'Activities',
  'creative': 'Activities',
  'art': 'Activities',
  'music': 'Activities',
  'writing': 'Activities',
  'travel adventure': 'Activities',
  'adventure': 'Activities',
  'vacation': 'Activities',
  'trip': 'Activities',
  'conference': 'Activities',
  'community': 'Activities',
  'religion': 'Activities',
  'spiritual': 'Activities',
  'church': 'Activities',
  'faith': 'Activities',
  'politics': 'Activities',
  'legal': 'Activities',
  'immigration': 'Activities',
  'visa': 'Activities',
  'citizenship': 'Activities',
  'pets': 'Activities',
  'pet': 'Activities',
  'animal': 'Activities',
  'animals': 'Activities',
  'technology': 'Activities',
  'tech': 'Activities',
  'publication': 'Activities',
  'publications': 'Activities',
  'research': 'Activities',
  'mentorship': 'Activities',
  'coaching': 'Activities',
}

/** Map a category string to the best matching lane name */
export function mapCategoryToLane(category: string, laneNames: string[]): string {
  if (!category) return 'Activities'
  // Exact match (case-insensitive)
  const exact = laneNames.find(n => n.toLowerCase() === category.toLowerCase())
  if (exact) return exact
  // Alias lookup
  const alias = LANE_ALIASES[category.toLowerCase()]
  if (alias && laneNames.includes(alias)) return alias
  // Partial match
  const partial = laneNames.find(n => n.toLowerCase().includes(category.toLowerCase()) || category.toLowerCase().includes(n.toLowerCase()))
  if (partial) return partial
  return 'Activities'
}

/** Supported file extensions */
export const SUPPORTED_EXTENSIONS = ['.ics', '.ical', '.vcs', '.csv', '.json', '.xml', '.tsv']

export function isSupportedFile(fileName: string): boolean {
  const lower = fileName.toLowerCase()
  return SUPPORTED_EXTENSIONS.some(ext => lower.endsWith(ext))
}
