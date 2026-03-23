-- Search usernames by prefix (for autocomplete suggestions)
CREATE OR REPLACE FUNCTION public.search_usernames(p_query text, p_limit int DEFAULT 8)
RETURNS TABLE(username text, display_name text, avatar_url text)
LANGUAGE sql
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT
    p.username,
    p.display_name,
    p.avatar_url
  FROM profiles p
  WHERE
    p.username IS NOT NULL
    AND p.is_public = true
    AND p.username ILIKE (p_query || '%')
  ORDER BY p.username
  LIMIT p_limit;
$$;

GRANT EXECUTE ON FUNCTION public.search_usernames(text, int) TO anon, authenticated;
