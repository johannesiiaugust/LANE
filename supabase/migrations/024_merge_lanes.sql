-- ============================================================
-- 024_merge_lanes.sql
-- Consolidate 12 default lanes into 7:
--   Locations + Travel    → Place       (📍 #3b82f6)
--   Work + Education      → Work        (💼 #10b981)
--   Relationships + Family → Relations  (👪 #ec4899)
--   Activities + Achievements → Activities (🎯 #f59e0b)
--   Items + Vehicles      → Items       (🚗 #64748b)
--   Health                → unchanged
--   Assets                → unchanged
-- ============================================================

-- ── Step 1: Move events from secondary lanes into primary lanes ───────────────
-- For each timeline that has BOTH the primary and secondary lane,
-- reassign events from the secondary to the primary.

-- Travel → Locations
UPDATE public.events e
SET lane_id = primary_lane.id
FROM public.lanes primary_lane
JOIN public.lanes secondary_lane
  ON  secondary_lane.timeline_id = primary_lane.timeline_id
  AND secondary_lane.name = 'Travel'
  AND primary_lane.name = 'Locations'
WHERE e.lane_id = secondary_lane.id;

-- Education → Work
UPDATE public.events e
SET lane_id = primary_lane.id
FROM public.lanes primary_lane
JOIN public.lanes secondary_lane
  ON  secondary_lane.timeline_id = primary_lane.timeline_id
  AND secondary_lane.name = 'Education'
  AND primary_lane.name = 'Work'
WHERE e.lane_id = secondary_lane.id;

-- Family → Relationships
UPDATE public.events e
SET lane_id = primary_lane.id
FROM public.lanes primary_lane
JOIN public.lanes secondary_lane
  ON  secondary_lane.timeline_id = primary_lane.timeline_id
  AND secondary_lane.name = 'Family'
  AND primary_lane.name = 'Relationships'
WHERE e.lane_id = secondary_lane.id;

-- Achievements → Activities
UPDATE public.events e
SET lane_id = primary_lane.id
FROM public.lanes primary_lane
JOIN public.lanes secondary_lane
  ON  secondary_lane.timeline_id = primary_lane.timeline_id
  AND secondary_lane.name = 'Achievements'
  AND primary_lane.name = 'Activities'
WHERE e.lane_id = secondary_lane.id;

-- Vehicles → Items
UPDATE public.events e
SET lane_id = primary_lane.id
FROM public.lanes primary_lane
JOIN public.lanes secondary_lane
  ON  secondary_lane.timeline_id = primary_lane.timeline_id
  AND secondary_lane.name = 'Vehicles'
  AND primary_lane.name = 'Items'
WHERE e.lane_id = secondary_lane.id;

-- ── Step 2: Rename orphan secondary lanes (timelines that only have the ──────
-- secondary lane but not the primary, so we rename rather than delete).

-- Travel (no Locations sibling) → rename to Place
UPDATE public.lanes
SET name = 'Place', emoji = '📍', color = '#3b82f6'
WHERE name = 'Travel'
  AND timeline_id NOT IN (
    SELECT timeline_id FROM public.lanes WHERE name = 'Locations'
  );

-- Education (no Work sibling) → rename to Work
UPDATE public.lanes
SET name = 'Work', emoji = '💼', color = '#10b981'
WHERE name = 'Education'
  AND timeline_id NOT IN (
    SELECT timeline_id FROM public.lanes WHERE name = 'Work'
  );

-- Family (no Relationships sibling) → rename to Relations
UPDATE public.lanes
SET name = 'Relations', emoji = '👪', color = '#ec4899'
WHERE name = 'Family'
  AND timeline_id NOT IN (
    SELECT timeline_id FROM public.lanes WHERE name = 'Relationships'
  );

-- Achievements (no Activities sibling) → rename to Activities
UPDATE public.lanes
SET name = 'Activities', emoji = '🎯', color = '#f59e0b'
WHERE name = 'Achievements'
  AND timeline_id NOT IN (
    SELECT timeline_id FROM public.lanes WHERE name = 'Activities'
  );

-- Vehicles (no Items sibling) → rename to Items
UPDATE public.lanes
SET name = 'Items', emoji = '🚗', color = '#64748b'
WHERE name = 'Vehicles'
  AND timeline_id NOT IN (
    SELECT timeline_id FROM public.lanes WHERE name = 'Items'
  );

-- ── Step 3: Delete remaining secondary lanes (those that had a primary sibling) ─
DELETE FROM public.lanes WHERE name IN ('Travel', 'Education', 'Family', 'Achievements', 'Vehicles');

-- ── Step 4: Rename primary lanes and update emoji/color/order ─────────────────
UPDATE public.lanes SET name = 'Place',     emoji = '📍', color = '#3b82f6', "order" = 0 WHERE name = 'Locations';
UPDATE public.lanes SET                                                        "order" = 1 WHERE name = 'Work';
UPDATE public.lanes SET                                                        "order" = 2 WHERE name = 'Health';
UPDATE public.lanes SET name = 'Relations', emoji = '👪', color = '#ec4899', "order" = 3 WHERE name = 'Relationships';
UPDATE public.lanes SET                      emoji = '🎯',                    "order" = 4 WHERE name = 'Activities';
UPDATE public.lanes SET                                                        "order" = 5 WHERE name = 'Assets';
UPDATE public.lanes SET                      emoji = '🚗', color = '#64748b', "order" = 6 WHERE name = 'Items';

-- ── Step 5: Update persona_events lane_names ──────────────────────────────────
UPDATE public.persona_events SET lane_name = 'Place'     WHERE lane_name IN ('Locations', 'Travel');
UPDATE public.persona_events SET lane_name = 'Work'      WHERE lane_name = 'Education';
UPDATE public.persona_events SET lane_name = 'Relations' WHERE lane_name IN ('Relationships', 'Family');
UPDATE public.persona_events SET lane_name = 'Items'     WHERE lane_name = 'Vehicles';
-- Activities and Assets are already correct
