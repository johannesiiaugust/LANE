# CLAUDE.md — Life Timeline App

## Project Overview

Personal life timeline visualization — horizontal swim-lane view of life events across dimensions (location, work, education, relations, etc.). React SPA backed by Supabase for auth, data persistence, and real-time sync. Supports multiple timelines per user, historical persona overlays (age-aligned), external user timeline overlays, public profiles with sharing, AI-powered onboarding, financial value projections, custom themes/skins, and a kanban board for planning.

## Tech Stack

- **Frontend:** React 19, TypeScript, Vite 7, Tailwind CSS v4
- **UI Components:** shadcn/ui (Radix primitives + CVA + Tailwind)
- **Icons:** Lucide React
- **Drag & Drop:** @dnd-kit (core + sortable)
- **Backend:** Supabase (PostgreSQL, Auth, Row-Level Security, Storage)
- **AI:** OpenAI GPT-4o-mini (text/event parsing), Whisper (voice transcription)
- **Calendar:** Google Calendar API (OAuth import)
- **Deployment:** Vercel (SPA rewrite via vercel.json)
- **Package Manager:** npm

## Commands

```bash
npm install          # Install all dependencies
npm run dev          # Start Vite dev server (localhost:4000)
npm run build        # Production build (tsc + vite build)
npm run lint         # Run ESLint
npm run preview      # Preview production build
```

## Environment Variables

```
VITE_SUPABASE_URL=<your-supabase-project-url>
VITE_SUPABASE_ANON_KEY=<your-supabase-anon-key>
VITE_OPENAI_API_KEY=<openai-api-key>                   # Optional — gates onboarding questionnaire + text/voice import
VITE_GOOGLE_CALENDAR_CLIENT_ID=<google-oauth-client-id> # Optional — gates Google Calendar import
```

## Architecture

### File Structure (`src/`)
```
src/
├── App.tsx                        # Root component — routing (hash-based), auth gating, layout
├── main.tsx                       # Entry point
├── index.css                      # Tailwind imports + theme variables
├── types/
│   ├── timeline.ts                # Lane, TimelineEvent, ValueProjection, EventLink, EventMetadata types
│   ├── database.ts                # Supabase row types (DbProfile, DbTimeline, DbLane, DbEvent, DbPersona, sharing, overlays)
│   └── gis.d.ts                   # Google Identity Services type declarations
├── data/
│   ├── seedData.ts                # Default lanes + sample events (offline fallback)
│   └── demoData.ts                # Demo timeline data (12 lanes, 20+ events with value projections)
├── hooks/
│   ├── useSupabaseTimeline.ts     # Supabase-backed timeline state (lanes, events CRUD)
│   ├── useTimelines.ts            # Multi-timeline management (list, create, rename, delete)
│   ├── useProfile.ts              # Current user profile state + update
│   ├── usePersonas.ts             # Persona overlay data + age-alignment
│   ├── useDemoTimeline.ts         # Demo timeline state (pre-auth preview)
│   ├── useExternalOverlays.ts     # External user timeline overlays (public/shared)
│   └── useTimelineOverlays.ts     # Same-user cross-timeline overlays
├── lib/
│   ├── utils.ts                   # cn() utility + helper functions
│   ├── constants.ts               # Layout, zoom, year-range constants + helpers
│   ├── supabase.ts                # Supabase client init
│   ├── api.ts                     # All Supabase CRUD functions (profiles, timelines, lanes, events, personas, kanban, sharing, public profiles)
│   ├── openai.ts                  # OpenAI API: text→events parsing, questionnaire generation, Whisper transcription
│   ├── imageUpload.ts             # Event image upload to Supabase Storage (auto-compress JPEG)
│   ├── valueCompute.ts            # Financial projection computation (Monte Carlo, sparklines)
│   ├── calendarParser.ts          # Multi-format calendar parsing (ICS/VCS/CSV/JSON/XML/TSV)
│   └── googleCalendar.ts          # Google Calendar OAuth + event fetching
├── contexts/
│   ├── AuthContext.tsx             # Auth state provider (sign up/in/out, password reset, pending profile)
│   ├── TimelineContext.tsx         # Active timeline + data provider
│   ├── DemoTimelineContext.tsx     # Demo timeline context for unauthenticated preview
│   ├── SkinContext.tsx             # Theme/skin management (6 presets + custom colors/fonts)
│   └── UiSizeContext.tsx           # UI scaling (small/medium/large/fitscreen, 21 metrics)
├── components/
│   ├── ui/                        # shadcn/ui primitives
│   │   ├── alert-dialog.tsx
│   │   ├── button.tsx
│   │   ├── dialog.tsx
│   │   ├── dropdown-menu.tsx
│   │   ├── input.tsx
│   │   ├── label.tsx
│   │   ├── popover.tsx
│   │   ├── select.tsx
│   │   ├── switch.tsx
│   │   ├── textarea.tsx
│   │   └── tooltip.tsx
│   ├── timeline/
│   │   ├── TimelineContainer.tsx   # Main layout: sidebar + scrollable area
│   │   ├── TimelineHeader.tsx      # Sticky year labels + tick marks
│   │   ├── TimelineLane.tsx        # Single swim lane with events
│   │   ├── TimelineEvent.tsx       # Rendered event (bar for range, dot for point) + context menu
│   │   ├── LaneSidebar.tsx         # Lane labels, emoji, visibility toggle, dropdown menu
│   │   ├── YearGrid.tsx            # Vertical dashed year lines
│   │   ├── PersonaEventBar.tsx     # Persona overlay event rendering
│   │   ├── PersonaSeparateTimeline.tsx # Full separate row for persona overlay
│   │   ├── OverlayEventBar.tsx     # External/cross-timeline overlay event rendering
│   │   ├── OverlaySeparateTimeline.tsx # Full separate row for external overlay
│   │   ├── TotalAssetsLane.tsx     # SVG financial projection visualization (net value over time)
│   │   └── EventContextMenu.tsx    # Right-click context menu (move, extend events)
│   ├── kanban/
│   │   ├── KanbanBoard.tsx         # Kanban board with drag-and-drop columns
│   │   ├── KanbanColumn.tsx        # Single kanban column (todo/in_progress/done)
│   │   └── KanbanCard.tsx          # Draggable kanban card
│   ├── auth/
│   │   ├── AuthPage.tsx            # Auth page shell (with demo timeline preview)
│   │   ├── SignInForm.tsx          # Email/password sign-in
│   │   ├── SignUpForm.tsx          # Sign-up with birth date, username, bio
│   │   ├── ForgotPasswordForm.tsx  # Password reset request
│   │   ├── UpdatePasswordForm.tsx  # Set new password after recovery
│   │   └── CheckEmailMessage.tsx   # Post-signup email verification prompt
│   ├── onboarding/
│   │   └── OnboardingQuestionnaire.tsx # AI-powered first-login questionnaire (voice/text → events)
│   ├── dialogs/
│   │   ├── EventDialog.tsx         # Add/Edit event form (with enrichment fields, images, value projections)
│   │   ├── LaneDialog.tsx          # Add/Edit lane form (with emoji)
│   │   └── DeleteConfirmDialog.tsx # Confirmation before delete
│   ├── AboutPage.tsx               # Public about page with terms & contact info
│   ├── DemoTimelineView.tsx        # Standalone demo timeline (pre-auth preview)
│   ├── EventPopover.tsx            # Click-on-event detail popover
│   ├── ExternalOverlayToggle.tsx   # Manage external user timeline overlays
│   ├── Footer.tsx                  # Fixed footer with copyright + about link
│   ├── ImportDialog.tsx            # Multi-tab import (calendar file, Google Calendar, text, voice)
│   ├── PublicProfilePage.tsx       # Public profile view (/@username routes)
│   ├── SearchDialog.tsx            # Live event search across timeline
│   ├── SkinDialog.tsx              # Theme/skin editor (colors + font)
│   ├── TimelineOverview.tsx        # Grid overview of all timelines
│   ├── Toolbar.tsx                 # Top bar: title, zoom slider, add/import/search buttons
│   ├── TimelineSelector.tsx        # Timeline switcher with cross-timeline overlays
│   ├── TimelinePersonaSelector.tsx # Persona overlay selector with search
│   ├── PersonaToggle.tsx           # Enable/disable persona overlays
│   ├── ProfileDialog.tsx           # Edit profile (display name, username, birth date, bio, avatar)
│   └── UserMenu.tsx                # User avatar/menu dropdown
```

### Routes

| Route | Component | Auth |
|-------|-----------|------|
| `/` | Main timeline view | Required |
| `/kanban` | Kanban board | Required |
| `/overview` | Timeline overview grid | Required |
| `/about` | About page | Public |
| `/@{username}` | Public profile page | Public |
| `/@{username}/{index}` | Public profile + specific timeline | Public |

### Database Schema (Supabase PostgreSQL)

**profiles**
| Column | Type | Notes |
|--------|------|-------|
| id | uuid PK | FK → auth.users(id) |
| display_name | text | Default `''` |
| username | text | Unique, 3-32 chars (lowercase + digits + underscore) |
| bio | text | Default `''` |
| birth_date | date | Nullable |
| end_date | date | Nullable |
| is_public | boolean | Default `false` |
| avatar_url | text | Nullable |
| created_at | timestamptz | Default `now()` |
| updated_at | timestamptz | Default `now()` |

**timelines**
| Column | Type | Notes |
|--------|------|-------|
| id | uuid PK | Auto-generated |
| user_id | uuid | FK → auth.users(id) |
| name | text | Default `'My Life'` |
| start_year | real | Nullable |
| end_year | real | Nullable |
| color | text | Nullable |
| emoji | text | Nullable |
| visibility | text | Default `'private'` |
| created_at | timestamptz | Default `now()` |
| updated_at | timestamptz | Default `now()` |

**lanes**
| Column | Type | Notes |
|--------|------|-------|
| id | uuid PK | Auto-generated |
| timeline_id | uuid | FK → timelines(id) |
| name | text | |
| color | text | Default `'#3b82f6'` |
| emoji | text | Nullable |
| visible | boolean | Default `true` |
| is_default | boolean | Default `false` |
| order | integer | Default `0` |

**events**
| Column | Type | Notes |
|--------|------|-------|
| id | uuid PK | Auto-generated |
| lane_id | uuid | FK → lanes(id) |
| timeline_id | uuid | FK → timelines(id) |
| title | text | |
| description | text | Default `''` |
| type | text | `'range'` or `'point'` |
| start_time | timestamptz | ISO timestamp (converted to fractional year in frontend) |
| end_time | timestamptz | Nullable |
| color | text | Nullable |
| emoji | text | Nullable |
| point_value | real | Nullable |
| value_points | jsonb | Nullable |
| value_projection | jsonb | Nullable |
| source | text | Nullable |
| link | jsonb | Nullable |
| url | text | Nullable |
| location | text | Nullable |
| rating | integer | Nullable (1-5) |
| metadata | jsonb | Nullable (image URL, tags, external ID, etc.) |

**personas**
| Column | Type | Notes |
|--------|------|-------|
| id | uuid PK | Auto-generated |
| name | text | |
| bio | text | Default `''` |
| birth_year | integer | |
| death_year | integer | Nullable |

**persona_events**
| Column | Type | Notes |
|--------|------|-------|
| id | uuid PK | Auto-generated |
| persona_id | uuid | FK → personas(id) |
| lane_name | text | Matched by name to user lanes |
| title | text | |
| description | text | Default `''` |
| type | text | `'range'` or `'point'` |
| start_year | real | |
| end_year | real | Nullable |
| color | text | Nullable |

**kanban_cards**
| Column | Type | Notes |
|--------|------|-------|
| id | uuid PK | Auto-generated |
| title | text | |
| description | text | Nullable |
| status | text | `'todo'`, `'in_progress'`, or `'done'` |
| position | integer | Default `0` |
| created_by | uuid | FK → auth.users(id), nullable |
| archived | boolean | Default `false` |
| created_at | timestamptz | Default `now()` |
| updated_at | timestamptz | Default `now()` |

**timeline_shares**
| Column | Type | Notes |
|--------|------|-------|
| id | uuid PK | Auto-generated |
| owner_id | uuid | FK → auth.users(id) |
| shared_with_id | uuid | FK → auth.users(id) |
| timeline_id | uuid | FK → timelines(id) |

### Supabase Storage Buckets

- **event-images** — Event photos/attachments (5MB max, JPEG/PNG/WebP/GIF/AVIF, auto-compressed)
- **avatars** — User profile pictures (5MB max)

### Frontend Data Model (TypeScript)
- **Lane:** id, name, color, emoji, visible, isDefault, order
- **TimelineEvent:** id, laneId, title, description, type (`range`|`point`), startYear (float), endYear?, color?, emoji?, pointValue?, valueProjection?, link?, url?, location?, rating?, source?, metadata?
- **ValueProjection:** spotChanges[], growthPeriods[], deposits[] — for financial modeling
- **EventLink:** targetEventId | 'today', offset — for dynamically updating event timing
- **Default lanes:** Location, University, Work, Other Activities, Type of House, Assets, Relations, Kids, Parents, Cars

### Key Patterns
- `pixelsPerYear` controls zoom (0.5–200px, default 80)
- Position formula: `left = (year - yearStart) * pixelsPerYear`
- Year range: 0–2500 (configurable via constants)
- Range events → colored rounded bars; point events → colored dots
- Lane sidebar is `sticky left-0` — scrolls vertically with lanes but not horizontally
- Present-day line rendered at current year fraction
- Past events are dimmed relative to current date
- Event timestamps stored as ISO in DB, converted to fractional years in frontend
- Persona events are age-aligned to the user's birth year
- External overlays loaded from other users' public/shared timelines
- Signup stores pending profile data in localStorage; applied on first sign-in after email verification
- Kanban board uses @dnd-kit for drag-and-drop between columns
- UI size scaled via UiSizeContext (21 metrics, 4 presets)
- Themes managed via SkinContext (6 presets + custom, applied as CSS variables)
- Canvas windowing with `MAX_CANVAS_PX` for large year ranges

### Supabase Migrations
```
supabase/migrations/
├── 001_schema.sql                          # Core tables: profiles, timelines, lanes, events + RLS + triggers
├── 002_seed_personas.sql                   # Historical persona seed data
├── 003_profile_birth_year.sql              # Added birth_year column to profiles
├── 004_kanban_cards.sql                    # Kanban cards table
├── 005_profile_birth_date.sql              # Added birth_date column to profiles
├── 006_event_link.sql                      # Added link jsonb column to events
├── 006_remove_birth_year.sql               # Removed birth_year from profiles
├── 006_value_series.sql                    # Added value_points, value_projection jsonb to events
├── 007_event_emoji_pointvalue.sql          # Added emoji, point_value to events
├── 008_rename_wealth_lane.sql              # Renamed "Wealth" lane to "Assets"
├── 009_timeline_meta_columns.sql           # Added start_year, end_year, color, emoji to timelines
├── 010_event_lane_timestamps.sql           # Renamed start_year/end_year → start_time/end_time (timestamptz)
├── 011_event_timestamps.sql                # Event timestamp schema update
├── 012_lane_emoji.sql                      # Added emoji to lanes
├── 013_public_profiles.sql                 # Username, visibility columns, public read RLS
├── 014_profile_is_public.sql               # Added is_public to profiles
├── 015_standardize_persona_lane_names.sql  # Standardized persona lane names
├── 016_event_enrichment.sql                # Added url, location, rating, metadata to events
├── 017_event_images_storage.sql            # event-images storage bucket + RLS
├── 018_public_timeline_simplify.sql        # Simplified to timeline-level visibility
├── 019_sharing.sql                         # timeline_shares table + sharing RLS
├── 020_persona_events_enriched.sql         # Enrichment fields on persona_events
├── 021_profile_avatar.sql                  # avatar_url + avatars storage bucket
├── 022_public_profile_avatar.sql           # Public avatar access RLS
└── 023_personas_merkel_swift_ronaldo.sql   # Merkel, Swift, Ronaldo persona data
```

## Code Standards

- ES modules (`import/export`), no CommonJS
- TypeScript strict mode
- Functional components with hooks only
- PascalCase components, camelCase utilities
- Path alias: `@/` → `src/`
- Tailwind CSS for styling — no CSS modules or styled-components
- Supabase client instantiated once in `lib/supabase.ts`, used via `lib/api.ts` functions

## Git

- Branch from `master`
- Commit messages: `type: description` (feat, fix, docs, refactor, test, chore)
- Keep commits focused — one logical change per commit
