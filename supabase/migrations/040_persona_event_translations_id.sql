-- ============================================================
-- Migration 040: persona_event_translations → match by persona_event_id
-- ============================================================
-- Problem: looking up translations by (persona_id, title_en) is fragile —
-- any apostrophe/whitespace mismatch silently falls back to English.
-- Fix: add a direct FK column persona_event_id, backfill it from
-- persona_events via normalized title matching, then the app switches to
-- ID-based lookup with title-based fallback for any unmatched rows.
--
-- Safe to re-run:
--   • ADD COLUMN IF NOT EXISTS is idempotent
--   • UPDATE only touches rows WHERE persona_event_id IS NULL
--   • CREATE UNIQUE INDEX IF NOT EXISTS is idempotent
--   • CREATE INDEX IF NOT EXISTS is idempotent
-- ============================================================

-- ── Step 1: Add persona_event_id column ──────────────────────────────────────
-- Nullable so existing rows are untouched.
-- ON DELETE SET NULL: if the source persona_event row is later deleted the
-- translation row survives (falls back to title-based lookup) rather than
-- being silently dropped.

ALTER TABLE public.persona_event_translations
  ADD COLUMN IF NOT EXISTS persona_event_id UUID
    REFERENCES public.persona_events(id) ON DELETE SET NULL;

-- ── Step 2: Backfill persona_event_id from persona_events ────────────────────
-- Uses trim + lower so minor whitespace/case drift doesn't block the match.
-- Only touches rows that are still NULL (idempotent on re-run).

UPDATE public.persona_event_translations pet
SET    persona_event_id = pe.id
FROM   public.persona_events pe
WHERE  pet.persona_event_id IS NULL
  AND  pet.persona_id              = pe.persona_id
  AND  trim(lower(pet.title_en))   = trim(lower(pe.title));

-- ── Step 3: Report unmatched rows ────────────────────────────────────────────
-- This SELECT runs as part of the migration output so you can see any
-- rows that still have NULL persona_event_id after the backfill.
-- These rows continue to work via the legacy title-based path in the app.
-- (No data is deleted — this is informational only.)

DO $$
DECLARE
  unmatched_count INTEGER;
BEGIN
  SELECT count(*) INTO unmatched_count
  FROM public.persona_event_translations
  WHERE persona_event_id IS NULL;

  IF unmatched_count > 0 THEN
    RAISE WARNING
      '% persona_event_translations row(s) could not be matched to a persona_events.id '
      'via normalized title. They remain functional via legacy title-based lookup. '
      'Run the audit queries in this migration file to inspect them.',
      unmatched_count;
  ELSE
    RAISE NOTICE 'All persona_event_translations rows backfilled successfully.';
  END IF;
END $$;

-- ── Step 4: Partial unique index on (persona_event_id, language) ─────────────
-- Only enforces uniqueness for matched rows. Unmatched rows (persona_event_id
-- IS NULL) continue to be protected by the existing
-- UNIQUE (persona_id, title_en, language) constraint.

CREATE UNIQUE INDEX IF NOT EXISTS uix_pet_event_lang
  ON public.persona_event_translations(persona_event_id, language)
  WHERE persona_event_id IS NOT NULL;

-- ── Step 5: Supporting index for fast ID-based lookup ────────────────────────
CREATE INDEX IF NOT EXISTS idx_pet_persona_event_id
  ON public.persona_event_translations(persona_event_id)
  WHERE persona_event_id IS NOT NULL;

-- ============================================================
-- AUDIT QUERIES — paste into Supabase SQL editor after running
-- ============================================================

-- 1. Rows not backfilled (check for data quality issues)
-- SELECT
--   pet.id,
--   pet.persona_id,
--   p.name            AS persona_name,
--   pet.title_en,
--   pet.language
-- FROM   public.persona_event_translations pet
-- JOIN   public.personas p ON p.id = pet.persona_id
-- WHERE  pet.persona_event_id IS NULL
-- ORDER  BY p.name, pet.title_en, pet.language;

-- 2. Duplicate translations by (persona_event_id, language) — should be empty
-- SELECT
--   persona_event_id,
--   language,
--   count(*)                          AS cnt,
--   array_agg(id ORDER BY id)         AS duplicate_ids,
--   array_agg(title_en ORDER BY id)   AS titles
-- FROM   public.persona_event_translations
-- WHERE  persona_event_id IS NOT NULL
-- GROUP  BY persona_event_id, language
-- HAVING count(*) > 1;

-- 3. Orphaned rows — translations whose persona no longer exists in the DB
-- SELECT
--   pet.id,
--   pet.persona_id,
--   pet.title_en,
--   pet.language
-- FROM   public.persona_event_translations pet
-- WHERE  NOT EXISTS (
--   SELECT 1 FROM public.personas p WHERE p.id = pet.persona_id
-- );
