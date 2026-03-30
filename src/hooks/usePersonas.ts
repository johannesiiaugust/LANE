import { useState, useEffect, useCallback, useMemo } from 'react'
import { fetchPersonas, fetchPersonaEvents, fetchPersonaTranslations, fetchPersonaEventTranslations } from '@/lib/api'
import type { DbPersona, DbPersonaEvent, DbPersonaTranslation, DbPersonaEventTranslation, AlignedPersonaEvent } from '@/types/database'
import { useTranslation } from '@/i18n'

const ACTIVE_PERSONAS_KEY = 'timeline_active_personas'
const DISPLAY_MODES_KEY = 'timeline_persona_display_modes'
const ALIGNED_PERSONAS_KEY = 'timeline_persona_aligned'

export type PersonaDisplayMode = 'integrated' | 'separate'

function loadActiveIds(): Set<string> {
  try {
    const raw = localStorage.getItem(ACTIVE_PERSONAS_KEY)
    if (raw) return new Set(JSON.parse(raw) as string[])
  } catch { /* ignore */ }
  return new Set()
}

function saveActiveIds(ids: Set<string>) {
  localStorage.setItem(ACTIVE_PERSONAS_KEY, JSON.stringify([...ids]))
}

function loadDisplayModes(): Map<string, PersonaDisplayMode> {
  try {
    const raw = localStorage.getItem(DISPLAY_MODES_KEY)
    if (raw) return new Map(JSON.parse(raw) as [string, PersonaDisplayMode][])
  } catch { /* ignore */ }
  return new Map()
}

function saveDisplayModes(modes: Map<string, PersonaDisplayMode>) {
  localStorage.setItem(DISPLAY_MODES_KEY, JSON.stringify([...modes.entries()]))
}

function loadAlignedIds(): Set<string> {
  try {
    const raw = localStorage.getItem(ALIGNED_PERSONAS_KEY)
    if (raw) return new Set(JSON.parse(raw) as string[])
  } catch { /* ignore */ }
  // First load: default to aligning all currently active personas
  const activeIds = loadActiveIds()
  if (activeIds.size > 0) {
    saveAlignedIds(activeIds)
    return activeIds
  }
  return new Set()
}

function saveAlignedIds(ids: Set<string>) {
  localStorage.setItem(ALIGNED_PERSONAS_KEY, JSON.stringify([...ids]))
}

export function usePersonas(userBirthYear: number | null = null) {
  const { lang } = useTranslation()
  const [personas, setPersonas] = useState<DbPersona[]>([])
  const [translations, setTranslations] = useState<DbPersonaTranslation[]>([])
  const [eventTranslations, setEventTranslations] = useState<DbPersonaEventTranslation[]>([])
  const [rawPersonaEvents, setRawPersonaEvents] = useState<DbPersonaEvent[]>([])
  const [loadedPersonaIds, setLoadedPersonaIds] = useState<Set<string>>(new Set())
  const [activePersonaIds, setActivePersonaIds] = useState<Set<string>>(loadActiveIds)
  const [alignedPersonaIds, setAlignedPersonaIds] = useState<Set<string>>(loadAlignedIds)
  const [personaDisplayModes, setPersonaDisplayModesState] = useState<Map<string, PersonaDisplayMode>>(loadDisplayModes)
  const [loading, setLoading] = useState(true)

  // Fetch all personas (metadata only) on mount
  useEffect(() => {
    let cancelled = false
    async function load() {
      const list = await fetchPersonas()
      if (cancelled) return
      setPersonas(list)
      setLoading(false)
    }
    load()
    return () => { cancelled = true }
  }, [])

  // Fetch translations whenever language changes (skip for English — base data is already English)
  useEffect(() => {
    let cancelled = false
    Promise.all([
      fetchPersonaTranslations(lang),
      fetchPersonaEventTranslations(lang),
    ]).then(([personaRows, eventRows]) => {
      if (cancelled) return
      setTranslations(personaRows)
      setEventTranslations(eventRows)
    })
    return () => { cancelled = true }
  }, [lang])

  // Build a translated view of personas: overlay translation fields, fall back to English base data
  const translatedPersonas = useMemo(() => {
    if (translations.length === 0) return personas
    const map = new Map<string, DbPersonaTranslation>()
    for (const t of translations) map.set(t.persona_id, t)
    return personas.map(p => {
      const tr = map.get(p.id)
      if (!tr) return p
      return {
        ...p,
        name: tr.name ?? p.name,
        bio:  tr.bio  ?? p.bio,
      }
    })
  }, [personas, translations])

  // Fetch events lazily — only for active personas not yet loaded
  useEffect(() => {
    const missing = [...activePersonaIds].filter(id => !loadedPersonaIds.has(id))
    if (missing.length === 0) return
    let cancelled = false
    fetchPersonaEvents(missing).then(events => {
      if (cancelled) return
      setRawPersonaEvents(prev => [...prev, ...events])
      setLoadedPersonaIds(prev => {
        const next = new Set(prev)
        missing.forEach(id => next.add(id))
        return next
      })
    })
    return () => { cancelled = true }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [activePersonaIds])

  // Build event translation lookup with two-tier keying:
  //   1. persona_event_id  (reliable — set after migration 040)
  //   2. persona_id::title_en  (legacy fallback for any rows not yet backfilled)
  // Both keys are stored in the same Map so the lookup below stays a single .get().
  const eventTranslationMap = useMemo(() => {
    const map = new Map<string, DbPersonaEventTranslation>()
    for (const tr of eventTranslations) {
      if (tr.persona_event_id) {
        map.set(tr.persona_event_id, tr)
      } else {
        // Legacy path: rows where backfill didn't find a match
        map.set(`${tr.persona_id}::${tr.title_en}`, tr)
      }
    }
    return map
  }, [eventTranslations])

  // Compute aligned events reactively based on alignment toggles
  const allPersonaEvents = useMemo(() => {
    const personaMap = new Map<string, DbPersona>()
    for (const p of translatedPersonas) {
      personaMap.set(p.id, p)
    }

    return rawPersonaEvents.map((e): AlignedPersonaEvent => {
      // Apply event translation: try ID-based lookup first (post-migration 040),
      // then fall back to legacy title key for any rows not yet backfilled.
      const tr = eventTranslationMap.get(e.id)
             ?? eventTranslationMap.get(`${e.persona_id}::${e.title}`)
      const translatedEvent = tr
        ? { ...e, title: tr.title ?? e.title, description: tr.description ?? e.description }
        : e
      const persona = personaMap.get(translatedEvent.persona_id)
      const personaBirth = persona?.birth_year
      const persona_name = persona?.name ?? ''
      if (userBirthYear != null && personaBirth != null && alignedPersonaIds.has(translatedEvent.persona_id)) {
        const offset = userBirthYear - personaBirth
        return {
          ...translatedEvent,
          persona_name,
          display_start_year: translatedEvent.start_year + offset,
          display_end_year: translatedEvent.end_year != null ? translatedEvent.end_year + offset : null,
        }
      }
      return {
        ...translatedEvent,
        persona_name,
        display_start_year: translatedEvent.start_year,
        display_end_year: translatedEvent.end_year,
      }
    })
  }, [rawPersonaEvents, translatedPersonas, eventTranslationMap, userBirthYear, alignedPersonaIds])

  const togglePersona = useCallback((personaId: string) => {
    setActivePersonaIds(prev => {
      const next = new Set(prev)
      if (next.has(personaId)) {
        next.delete(personaId)
      } else {
        next.add(personaId)
        // Auto-align newly activated personas
        setAlignedPersonaIds(prevAligned => {
          if (prevAligned.has(personaId)) return prevAligned
          const nextAligned = new Set(prevAligned)
          nextAligned.add(personaId)
          saveAlignedIds(nextAligned)
          return nextAligned
        })
        // Default display mode to 'separate' for newly activated personas
        setPersonaDisplayModesState(prevModes => {
          if (prevModes.has(personaId)) return prevModes
          const nextModes = new Map(prevModes)
          nextModes.set(personaId, 'separate')
          saveDisplayModes(nextModes)
          return nextModes
        })
      }
      saveActiveIds(next)
      return next
    })
  }, [])

  const togglePersonaAlignment = useCallback((personaId: string) => {
    setAlignedPersonaIds(prev => {
      const next = new Set(prev)
      if (next.has(personaId)) {
        next.delete(personaId)
      } else {
        next.add(personaId)
      }
      saveAlignedIds(next)
      return next
    })
  }, [])

  const setPersonaDisplayMode = useCallback((personaId: string, mode: PersonaDisplayMode) => {
    setPersonaDisplayModesState(prev => {
      const next = new Map(prev)
      next.set(personaId, mode)
      saveDisplayModes(next)
      return next
    })
  }, [])

  const activePersonaEvents = useMemo(
    () => allPersonaEvents.filter(e => activePersonaIds.has(e.persona_id)),
    [allPersonaEvents, activePersonaIds],
  )

  return {
    personas: translatedPersonas,
    activePersonaEvents,
    activePersonaIds,
    togglePersona,
    alignedPersonaIds,
    togglePersonaAlignment,
    personaDisplayModes,
    setPersonaDisplayMode,
    loading,
  }
}
