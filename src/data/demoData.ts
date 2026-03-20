import type { Lane, TimelineEvent } from '@/types/timeline'

// Demo person (Alex Weber) timeline date range
export const DEMO_TIMELINE_START_YEAR = 1980
export const DEMO_TIMELINE_END_YEAR: number | null = null

// Uses the same standard lane IDs/names/emojis/colors as seedData.ts
export const DEMO_LANES: Lane[] = [
  { id: 'place',      name: 'Place & Travel',       emoji: '📍', color: '#3b82f6', visible: true,  isDefault: true, order: 0 },
  { id: 'work',       name: 'Work & Education',     emoji: '💼', color: '#10b981', visible: true,  isDefault: true, order: 1 },
  { id: 'health',     name: 'Health',               emoji: '❤️', color: '#ef4444', visible: false, isDefault: true, order: 2 },
  { id: 'relations',  name: 'Relations & Family',   emoji: '👪', color: '#ec4899', visible: true,  isDefault: true, order: 3 },
  { id: 'activities', name: 'Activities', emoji: '🎯', color: '#f59e0b', visible: true,  isDefault: true, order: 4 },
  { id: 'assets',     name: 'Assets',     emoji: '💰', color: '#14b8a6', visible: true,  isDefault: true, order: 5 },
  { id: 'items',      name: 'Items',      emoji: '🚗', color: '#64748b', visible: true,  isDefault: true, order: 6 },
]

export const DEMO_EVENTS: TimelineEvent[] = [
  // Place (Locations + Travel merged)
  { id: 'demo-evt-berlin',     laneId: 'place',      emoji: '🏙️', title: 'Berlin',              description: 'Grew up and worked in Berlin',              type: 'range', startYear: 2000, endYear: 2021,   color: '#3b82f6' },
  { id: 'demo-evt-sabbatical', laneId: 'place',      emoji: '🌏', title: 'Sabbatical — SE Asia', description: 'A year to explore — Vietnam, Thailand, Bali', type: 'range', startYear: 2021, endYear: 2023, color: '#0ea5e9' },
  { id: 'demo-evt-munich',     laneId: 'place',      emoji: '🏔️', title: 'Munich',               description: 'Moved to Munich after returning',           type: 'range', startYear: 2023, endYear: 2035,   color: '#3b82f6' },

  // Work (Work + Education merged)
  { id: 'demo-evt-highschool', laneId: 'work',       emoji: '🎓', title: 'School & University',  description: 'Gymnasium Berlin-Mitte, then TU Berlin Computer Science', type: 'range', startYear: 1994, endYear: 2004, color: '#8b5cf6' },
  { id: 'demo-evt-work',       laneId: 'work',       emoji: '💻', title: 'Software Engineer',    description: 'Full-stack developer at Berlin tech startup', type: 'range', startYear: 2005, endYear: 2022,   color: '#10b981' },
  { id: 'demo-evt-leadeng',    laneId: 'work',       emoji: '🚀', title: 'Lead Engineer',        description: 'Returned with new perspective — promoted to Lead Engineer at Munich startup', type: 'range', startYear: 2023, endYear: 2040.5, color: '#059669' },
  { id: 'demo-evt-biz',        laneId: 'work',       emoji: '🏢', title: '?Own Business?',       description: 'Future venture',                             type: 'range', startYear: 2040.5, endYear: 2060.5, color: '#0d9488',
    valueProjection: {
      startValue: 0,
      spotChanges: [],
      growthPeriods: [],
      deposits: [{ id: 'demo-dep-biz', label: 'Monthly income', amount: 20, frequency: 'monthly', startYear: 2040.5, endYear: 2060.5 }],
    },
  },

  // Health
  { id: 'demo-evt-leg',        laneId: 'health',     emoji: '🦴', title: 'Broke Left Leg',       description: 'Skiing accident in the Alps',                type: 'point', startYear: 2010,             color: '#ef4444' },
  { id: 'demo-evt-wrist',      laneId: 'health',     emoji: '🦴', title: 'Broke Right Wrist',    description: 'Mountain biking fall',                       type: 'point', startYear: 2018.3,           color: '#ef4444' },
  { id: 'demo-evt-wrist-rec',  laneId: 'health',     emoji: '🩹', title: 'Wrist Recovery',       description: 'Physio and rest — back to full strength',    type: 'range', startYear: 2018.3, endYear: 2018.8, color: '#22c55e' },
  { id: 'demo-evt-marathon',   laneId: 'health',     emoji: '🏃', title: 'First Marathon',       description: 'Munich marathon — 4h 12m',                   type: 'point', startYear: 2025,             color: '#10b981' },

  // Relations (Relationships + Family merged)
  { id: 'demo-evt-girlfriend', laneId: 'relations',  emoji: '💕', title: 'First Girlfriend',     description: 'High school relationship',                   type: 'range', startYear: 1996, endYear: 1999, color: '#ec4899' },
  { id: 'demo-evt-married',    laneId: 'relations',  emoji: '💍', title: 'Married',              description: 'Married',                                    type: 'range', startYear: 2007, endYear: 2065, color: '#ec4899' },
  { id: 'demo-evt-kid',        laneId: 'relations',  emoji: '👶', title: 'Child',                description: 'First child born (2015)',                     type: 'range', startYear: 2015, endYear: 2100, color: '#f97316' },

  // Activities (Activities + Achievements merged)
  { id: 'demo-evt-chess',      laneId: 'activities', emoji: '♟️', title: 'Chess Club',           description: 'University chess club',                      type: 'range', startYear: 2001, endYear: 2021, color: '#f59e0b' },
  { id: 'demo-evt-diving',     laneId: 'activities', emoji: '🤿', title: 'PADI Open Water Diver', description: 'Got certified diving in Koh Tao, Thailand', type: 'point', startYear: 2022.6, color: '#0ea5e9' },
  { id: 'demo-evt-nobel',      laneId: 'activities', title: '🏆 Nobel Prize',      description: 'Nobel Prize in Physics, 2050',               type: 'point', startYear: 2050, color: '#eab308' },

  // Assets
  { id: 'demo-evt-bank',       laneId: 'assets',     emoji: '💳', title: 'Savings Account',      description: 'Personal savings account',                   type: 'range', startYear: 1998, endYear: 2065, color: '#14b8a6',
    valueProjection: {
      startValue: 100,
      spotChanges: [],
      growthPeriods: [],
      deposits: [{ id: 'demo-dep-bank', label: 'Quarterly savings', amount: 10, frequency: 'quarterly', startYear: 1998, endYear: 2065 }],
    },
  },

  // Items (Vehicles + Items merged)
  { id: 'demo-evt-volvo',      laneId: 'items',      emoji: '🚗', title: 'Volvo',                description: 'Current car',                                type: 'range', startYear: 2021, endYear: 2037, color: '#64748b' },
  { id: 'demo-evt-boat',       laneId: 'items',      emoji: '⛵', title: 'Boat',                 description: 'Future boat',                                type: 'range', startYear: 2053, endYear: 2082, color: '#0ea5e9',
    valueProjection: {
      startValue: 0,
      spotChanges: [{ id: 'demo-vs-boat', year: 2053, amount: -100, label: 'Purchase' }],
      growthPeriods: [],
      deposits: [{ id: 'demo-dep-boat', label: 'Monthly running cost', amount: -10, frequency: 'monthly', startYear: 2053, endYear: 2082 }],
    },
  },
]
