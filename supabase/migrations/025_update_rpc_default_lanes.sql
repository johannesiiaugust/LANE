-- ============================================================
-- 025_update_rpc_default_lanes.sql
-- Update create_default_timeline RPC to match the 7-lane
-- structure established in 024_merge_lanes.sql
-- ============================================================

CREATE OR REPLACE FUNCTION public.create_default_timeline(p_user_id uuid)
RETURNS uuid
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_timeline_id uuid;
BEGIN
  INSERT INTO timelines (user_id, name)
    VALUES (p_user_id, 'My Life')
    RETURNING id INTO v_timeline_id;

  INSERT INTO lanes (timeline_id, name, color, visible, is_default, "order", emoji) VALUES
    (v_timeline_id, 'Place & Travel',     '#3b82f6', true, true, 0, '📍'),
    (v_timeline_id, 'Work & Education',   '#10b981', true, true, 1, '💼'),
    (v_timeline_id, 'Health',             '#ef4444', true, true, 2, '❤️'),
    (v_timeline_id, 'Relations & Family', '#ec4899', true, true, 3, '👪'),
    (v_timeline_id, 'Activities',         '#f59e0b', true, true, 4, '🎯'),
    (v_timeline_id, 'Assets',             '#14b8a6', true, true, 5, '💰'),
    (v_timeline_id, 'Items',              '#64748b', true, true, 6, '🚗');

  RETURN v_timeline_id;
END;
$$;
