-- Translations for persona event titles and descriptions
-- Events are identified by (persona_id, title_en) — the original English title
create table if not exists persona_event_translations (
  id          uuid primary key default gen_random_uuid(),
  persona_id  uuid not null references personas(id) on delete cascade,
  title_en    text not null,           -- original English title — used as lookup key
  language    text not null,
  title       text,                    -- translated title (null = keep English)
  description text,                    -- translated description (null = keep English)
  unique (persona_id, title_en, language)
);

alter table persona_event_translations enable row level security;

create policy "persona_event_translations_public_read"
  on persona_event_translations for select
  using (true);
