# Life Timeline

A personal life timeline visualization app — horizontal swim-lane view of life events across dimensions like location, work, education, relationships, and more. Built with React and backed by Supabase for authentication, persistence, and real-time sync.

## Features

- **Swim-lane timeline** — visualize life events across customizable lanes (Location, Work, Education, Relations, Assets, etc.)
- **Range & point events** — range events render as colored bars, point events as dots; supports emoji, ratings, URLs, locations, and images
- **Zoom & scroll** — smooth zoom from 0.5 to 200 pixels/year with sticky lane sidebar
- **Multiple timelines** — create, rename, and switch between separate timelines
- **Timeline overview** — grid view of all timelines with independent zoom and cursor tracking
- **Persona overlays** — compare your timeline against historical figures (Einstein, Marie Curie, Merkel, Taylor Swift, Ronaldo, etc.), age-aligned to your birth year
- **External overlays** — browse and overlay other users' public or shared timelines
- **Public profiles** — shareable profile pages (`/@username`) with public timelines
- **Timeline sharing** — share private timelines with specific users
- **Financial projections** — model future financial scenarios with value projections, compound growth, recurring deposits; visualized on a total assets lane
- **AI onboarding** — first-login questionnaire generates events from voice/text answers using GPT-4o-mini
- **Multi-format import** — import from calendar files (ICS/VCS/CSV/JSON/XML/TSV), Google Calendar, text (AI-parsed), or voice recording
- **Event search** — live search across all events by title, description, or lane name
- **Custom themes** — 6 preset skins (Classic, Dark, Sepia, Ocean, Forest, Midnight) + full custom color/font editor
- **UI scaling** — 4 size presets (small, medium, large, fit-to-screen) with 21 responsive metrics
- **Present-day line** — vertical marker at current date with past-event dimming
- **Kanban board** — drag-and-drop task board with todo/in-progress/done columns
- **User profiles** — display name, username, birth date, bio, avatar
- **Auth flow** — email/password signup with username and bio; email verification; password reset

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | React 19, TypeScript, Vite 7 |
| Styling | Tailwind CSS v4 |
| UI Components | shadcn/ui (Radix primitives + CVA) |
| Icons | Lucide React |
| Drag & Drop | @dnd-kit |
| Backend | Supabase (PostgreSQL, Auth, RLS, Storage) |
| AI | OpenAI GPT-4o-mini + Whisper |
| Calendar | Google Calendar API |
| Deployment | Vercel |
| Package Manager | npm |

## Getting Started

### Prerequisites

- Node.js 18+
- A [Supabase](https://supabase.com) project

### Setup

1. Clone the repository:
   ```bash
   git clone <repo-url>
   cd timeline
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Create a `.env` file with your credentials:
   ```
   VITE_SUPABASE_URL=https://your-project.supabase.co
   VITE_SUPABASE_ANON_KEY=your-anon-key
   VITE_OPENAI_API_KEY=your-openai-key              # Optional — enables AI onboarding + text/voice import
   VITE_GOOGLE_CALENDAR_CLIENT_ID=your-client-id    # Optional — enables Google Calendar import
   ```

4. Run the database migrations in your Supabase project (SQL Editor or CLI):
   ```
   supabase/migrations/001_schema.sql              — core tables, RLS policies, triggers
   supabase/migrations/002_seed_personas.sql        — historical persona data
   supabase/migrations/003_profile_birth_year.sql   — birth_year column
   supabase/migrations/004_kanban_cards.sql         — kanban cards table
   supabase/migrations/005_profile_birth_date.sql   — birth_date column
   supabase/migrations/006_event_link.sql           — event linking
   supabase/migrations/006_remove_birth_year.sql    — remove birth_year from profiles
   supabase/migrations/006_value_series.sql         — value projections on events
   supabase/migrations/007_event_emoji_pointvalue.sql — emoji + point values
   supabase/migrations/008_rename_wealth_lane.sql   — rename Wealth → Assets
   supabase/migrations/009_timeline_meta_columns.sql — timeline metadata
   supabase/migrations/010_event_lane_timestamps.sql — ISO timestamps on events
   supabase/migrations/011_event_timestamps.sql     — timestamp schema update
   supabase/migrations/012_lane_emoji.sql           — lane emoji support
   supabase/migrations/013_public_profiles.sql      — username + public visibility
   supabase/migrations/014_profile_is_public.sql    — profile is_public flag
   supabase/migrations/015_standardize_persona_lane_names.sql — persona lane normalization
   supabase/migrations/016_event_enrichment.sql     — url, location, rating, metadata
   supabase/migrations/017_event_images_storage.sql — event-images storage bucket
   supabase/migrations/018_public_timeline_simplify.sql — timeline-level visibility
   supabase/migrations/019_sharing.sql              — timeline sharing
   supabase/migrations/020_persona_events_enriched.sql — persona event enrichment
   supabase/migrations/021_profile_avatar.sql       — avatar support
   supabase/migrations/022_public_profile_avatar.sql — public avatar access
   supabase/migrations/023_personas_merkel_swift_ronaldo.sql — additional personas
   ```

5. Start the dev server:
   ```bash
   npm run dev
   ```

   The app runs at `http://localhost:4000`.

## Scripts

| Command | Description |
|---------|-------------|
| `npm run dev` | Start Vite dev server |
| `npm run build` | TypeScript check + production build |
| `npm run lint` | Run ESLint |
| `npm run preview` | Preview production build locally |

## Project Structure

```
src/
├── App.tsx                        # Root component — routing, auth gating, layout
├── main.tsx                       # Entry point
├── index.css                      # Tailwind imports + theme variables
├── types/
│   ├── timeline.ts                # Lane, TimelineEvent, ValueProjection, EventLink types
│   ├── database.ts                # Supabase row types + sharing/overlay types
│   └── gis.d.ts                   # Google Identity Services type declarations
├── data/
│   ├── seedData.ts                # Default lanes + sample events (offline fallback)
│   └── demoData.ts                # Demo timeline data for unauthenticated preview
├── hooks/
│   ├── useSupabaseTimeline.ts     # Supabase-backed timeline state (lanes, events CRUD)
│   ├── useTimelines.ts            # Multi-timeline management
│   ├── useProfile.ts              # User profile state + update
│   ├── usePersonas.ts             # Persona overlay data + age-alignment
│   ├── useDemoTimeline.ts         # Demo timeline state (pre-auth)
│   ├── useExternalOverlays.ts     # External user timeline overlays
│   └── useTimelineOverlays.ts     # Same-user cross-timeline overlays
├── lib/
│   ├── utils.ts                   # cn() class merging + helpers
│   ├── constants.ts               # Layout, zoom, year-range constants
│   ├── supabase.ts                # Supabase client initialization
│   ├── api.ts                     # All Supabase CRUD functions
│   ├── openai.ts                  # OpenAI: text→events, questionnaire, Whisper transcription
│   ├── imageUpload.ts             # Event image upload (auto-compress JPEG)
│   ├── valueCompute.ts            # Financial projection computation + sparklines
│   ├── calendarParser.ts          # Multi-format calendar parsing
│   └── googleCalendar.ts          # Google Calendar OAuth + event fetching
├── contexts/
│   ├── AuthContext.tsx             # Auth state provider
│   ├── TimelineContext.tsx         # Active timeline + data provider
│   ├── DemoTimelineContext.tsx     # Demo timeline context
│   ├── SkinContext.tsx             # Theme/skin management (6 presets + custom)
│   └── UiSizeContext.tsx           # UI scaling (4 presets, 21 metrics)
├── components/
│   ├── ui/                        # shadcn/ui primitives (button, dialog, input, etc.)
│   ├── timeline/                  # Timeline rendering components
│   │   ├── TimelineContainer.tsx   # Main layout: sidebar + scrollable area
│   │   ├── TimelineHeader.tsx      # Year labels + tick marks
│   │   ├── TimelineLane.tsx        # Single swim lane with events
│   │   ├── TimelineEvent.tsx       # Event rendering (bar or dot) + context menu
│   │   ├── LaneSidebar.tsx         # Lane labels, emoji, visibility controls
│   │   ├── YearGrid.tsx            # Vertical year grid lines
│   │   ├── PersonaEventBar.tsx     # Persona overlay events
│   │   ├── PersonaSeparateTimeline.tsx # Separate persona row
│   │   ├── OverlayEventBar.tsx     # External overlay events
│   │   ├── OverlaySeparateTimeline.tsx # Separate external overlay row
│   │   ├── TotalAssetsLane.tsx     # SVG financial projection chart
│   │   └── EventContextMenu.tsx    # Right-click event menu
│   ├── kanban/                    # Kanban board components
│   │   ├── KanbanBoard.tsx         # Board with drag-and-drop columns
│   │   ├── KanbanColumn.tsx        # Column (todo / in_progress / done)
│   │   └── KanbanCard.tsx          # Draggable card
│   ├── auth/                      # Authentication components
│   │   ├── AuthPage.tsx            # Auth page shell (with demo preview)
│   │   ├── SignUpForm.tsx          # Signup (email, password, username, bio)
│   │   ├── SignInForm.tsx          # Sign-in form
│   │   ├── ForgotPasswordForm.tsx  # Password reset request
│   │   ├── UpdatePasswordForm.tsx  # New password form
│   │   └── CheckEmailMessage.tsx   # Email verification prompt
│   ├── onboarding/                # First-login onboarding
│   │   └── OnboardingQuestionnaire.tsx # AI questionnaire (voice/text → events)
│   ├── dialogs/                   # Modal dialogs
│   │   ├── EventDialog.tsx         # Add/Edit event (enrichment, images, projections)
│   │   ├── LaneDialog.tsx          # Add/Edit lane (with emoji)
│   │   └── DeleteConfirmDialog.tsx # Delete confirmation
│   ├── AboutPage.tsx               # Public about page
│   ├── DemoTimelineView.tsx        # Demo timeline (pre-auth)
│   ├── EventPopover.tsx            # Event detail popover
│   ├── ExternalOverlayToggle.tsx   # External overlay manager
│   ├── Footer.tsx                  # Footer with copyright
│   ├── ImportDialog.tsx            # Multi-tab import (file, Google, text, voice)
│   ├── PublicProfilePage.tsx       # Public profile (/@username)
│   ├── SearchDialog.tsx            # Live event search
│   ├── SkinDialog.tsx              # Theme editor
│   ├── TimelineOverview.tsx        # All-timelines grid view
│   ├── Toolbar.tsx                 # Top bar with zoom, add, import, search
│   ├── TimelineSelector.tsx        # Timeline switcher + overlays
│   ├── TimelinePersonaSelector.tsx # Persona selector
│   ├── PersonaToggle.tsx           # Persona overlay toggle
│   ├── ProfileDialog.tsx           # Edit profile (name, username, avatar, etc.)
│   └── UserMenu.tsx                # User menu dropdown
```

## Database Schema

The app uses Supabase tables with Row-Level Security:

### profiles
| Column | Type | Notes |
|--------|------|-------|
| id | uuid PK | FK → auth.users(id) |
| display_name | text | Default `''` |
| username | text | Unique, 3-32 chars |
| bio | text | Default `''` |
| birth_date | date | Nullable |
| end_date | date | Nullable |
| is_public | boolean | Default `false` |
| avatar_url | text | Nullable |
| created_at | timestamptz | Default `now()` |
| updated_at | timestamptz | Default `now()` |

### timelines
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

### lanes
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

### events
| Column | Type | Notes |
|--------|------|-------|
| id | uuid PK | Auto-generated |
| lane_id | uuid | FK → lanes(id) |
| timeline_id | uuid | FK → timelines(id) |
| title | text | |
| description | text | Default `''` |
| type | text | `'range'` or `'point'` |
| start_time | timestamptz | ISO timestamp |
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
| metadata | jsonb | Nullable |

### personas
| Column | Type | Notes |
|--------|------|-------|
| id | uuid PK | Auto-generated |
| name | text | |
| bio | text | Default `''` |
| birth_year | integer | |
| death_year | integer | Nullable |

### persona_events
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

### kanban_cards
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

### timeline_shares
| Column | Type | Notes |
|--------|------|-------|
| id | uuid PK | Auto-generated |
| owner_id | uuid | FK → auth.users(id) |
| shared_with_id | uuid | FK → auth.users(id) |
| timeline_id | uuid | FK → timelines(id) |

### Storage Buckets
- **event-images** — Event photos/attachments (5MB max, auto-compressed JPEG)
- **avatars** — User profile pictures (5MB max)

## Key Concepts

### Timeline Rendering
- **Zoom:** `pixelsPerYear` ranges from 0.5 to 200 (default 80)
- **Positioning:** `left = (year - yearStart) * pixelsPerYear`
- **Year range:** 0–2500
- **Lane sidebar** is `sticky left-0` — scrolls vertically but stays pinned horizontally
- **Present-day line** rendered at the current fractional year
- **Past events** are dimmed relative to the current date
- **Canvas windowing** with `MAX_CANVAS_PX` for large year ranges

### Event Timestamps
Events are stored as ISO timestamps (`start_time`/`end_time`) in the database and converted to fractional years in the frontend for rendering.

### Persona Overlays
Historical figures' timelines can be overlaid on your own, age-aligned to your birth year. Includes Einstein, Marie Curie, Angela Merkel, Taylor Swift, Cristiano Ronaldo, and more.

### External Overlays
Browse and overlay other users' public timelines or timelines shared with you. Supports integrated (inline) or separate (own row) display modes with optional age-alignment.

### Public Profiles & Sharing
- Users can set a unique username and make their profile public
- Public profiles are accessible at `/@username` with public timelines visible to anyone
- Private timelines can be shared with specific users via `timeline_shares`

### Financial Projections
Events can carry value projections (spot changes, compound growth, recurring deposits). The TotalAssetsLane renders an SVG chart of net value over time with tooltips and year-over-year deltas.

### AI Features (requires OpenAI key)
- **Onboarding questionnaire** — first-login multi-step form that generates events from voice/text answers
- **Text import** — paste natural language, AI parses into structured events
- **Voice import** — record audio, Whisper transcribes, then AI parses into events

### Auth & Signup Flow
- Signup requires email, password, username, and a bio; birth date is optional
- After signup, extra profile fields are saved to `localStorage` (key: `timeline_pending_profile`)
- On first sign-in after email verification, pending data is applied to the user's profile

### Themes & UI Scaling
- 6 preset skins (Classic, Dark, Sepia, Ocean, Forest, Midnight) + full custom color/font editor
- 4 UI size presets (small, medium, large, fit-to-screen) with 21 responsive metrics

### Kanban Board
A simple task board with three columns (Todo, In Progress, Done). Cards are drag-and-drop reorderable via @dnd-kit. Soft-deleted via an `archived` flag.
