-- Add fade_in_time and fade_out_time columns to events table.
-- These allow a bar to extend beyond the event's real start/end with a
-- transparent → color (or color → transparent) gradient, enabling a
-- visual "fading in" or "fading out" effect on the timeline.

ALTER TABLE events
  ADD COLUMN IF NOT EXISTS fade_in_time  TIMESTAMPTZ DEFAULT NULL,
  ADD COLUMN IF NOT EXISTS fade_out_time TIMESTAMPTZ DEFAULT NULL;
