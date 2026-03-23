-- ============================================================
-- 028_persona_views.sql
-- Adds view_count to personas for popularity ranking.
-- Exposes a security-definer RPC so any user (incl. anon)
-- can atomically increment a persona's view count.
-- ============================================================

-- 1. Add view_count column
ALTER TABLE public.personas
  ADD COLUMN IF NOT EXISTS view_count bigint NOT NULL DEFAULT 0;

-- 2. Index for fast ORDER BY view_count DESC
CREATE INDEX IF NOT EXISTS personas_view_count_idx ON public.personas (view_count DESC);

-- 3. RPC: increment_persona_view(p_id uuid)
CREATE OR REPLACE FUNCTION public.increment_persona_view(p_id uuid)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  UPDATE public.personas
  SET view_count = view_count + 1
  WHERE id = p_id;
END;
$$;

-- Grant execute to everyone (anon + authenticated)
GRANT EXECUTE ON FUNCTION public.increment_persona_view(uuid) TO anon, authenticated;
