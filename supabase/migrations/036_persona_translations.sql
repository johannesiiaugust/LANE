-- Persona translations: one row per persona per language
create table if not exists persona_translations (
  id          uuid primary key default gen_random_uuid(),
  persona_id  uuid not null references personas(id) on delete cascade,
  language    text not null,               -- e.g. 'de', 'sv', 'es'
  name        text,                        -- null = keep original
  bio         text,                        -- null = keep original
  unique (persona_id, language)
);

-- Public read (same visibility as personas themselves)
alter table persona_translations enable row level security;

create policy "persona_translations_public_read"
  on persona_translations for select
  using (true);
