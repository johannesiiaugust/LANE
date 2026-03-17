import type { Lane, TimelineEvent } from '@/types/timeline'

export const defaultLanes: Lane[] = [
  { id: 'place',      name: 'Place',      emoji: '📍', color: '#3b82f6', visible: true, isDefault: true, order: 0 },
  { id: 'work',       name: 'Work',       emoji: '💼', color: '#10b981', visible: true, isDefault: true, order: 1 },
  { id: 'health',     name: 'Health',     emoji: '❤️', color: '#ef4444', visible: true, isDefault: true, order: 2 },
  { id: 'relations',  name: 'Relations',  emoji: '👪', color: '#ec4899', visible: true, isDefault: true, order: 3 },
  { id: 'activities', name: 'Activities', emoji: '🎯', color: '#f59e0b', visible: true, isDefault: true, order: 4 },
  { id: 'assets',     name: 'Assets',     emoji: '💰', color: '#14b8a6', visible: true, isDefault: true, order: 5 },
  { id: 'items',      name: 'Items',      emoji: '🚗', color: '#64748b', visible: true, isDefault: true, order: 6 },
]

export const seedEvents: TimelineEvent[] = [
  // Place (merged Locations + Travel)
  { id: 'e1',  laneId: 'place',      title: 'New York',         description: 'Grew up in NYC',              type: 'range', startYear: 1990, endYear: 2008 },
  { id: 'e2',  laneId: 'place',      title: 'Boston',           description: 'College years',               type: 'range', startYear: 2008, endYear: 2012 },
  { id: 'e3',  laneId: 'place',      title: 'San Francisco',    description: 'Moved for work',              type: 'range', startYear: 2012, endYear: 2020 },
  { id: 'e4',  laneId: 'place',      title: 'Austin',           description: 'Remote work era',             type: 'range', startYear: 2020, endYear: 2026 },

  // Work (merged Work + Education)
  { id: 'e5',  laneId: 'work',       title: 'MIT',              description: 'BS Computer Science',         type: 'range', startYear: 2008, endYear: 2012 },
  { id: 'e6',  laneId: 'work',       title: 'Stanford Online',  description: 'ML Certificate',              type: 'range', startYear: 2018, endYear: 2019 },
  { id: 'e7',  laneId: 'work',       title: 'Google',           description: 'Software Engineer',           type: 'range', startYear: 2012, endYear: 2016 },
  { id: 'e8',  laneId: 'work',       title: 'Stripe',           description: 'Senior Engineer',             type: 'range', startYear: 2016, endYear: 2020 },
  { id: 'e9',  laneId: 'work',       title: 'Own Startup',      description: 'Founded a SaaS company',      type: 'range', startYear: 2020, endYear: 2026 },

  // Activities (merged Activities + Achievements)
  { id: 'e10', laneId: 'activities', title: 'Marathon',         description: 'First marathon completed',    type: 'point', startYear: 2015 },
  { id: 'e11', laneId: 'activities', title: 'Rock Climbing',    description: 'Regular climbing',            type: 'range', startYear: 2017, endYear: 2022 },
  { id: 'e12', laneId: 'activities', title: 'Piano Lessons',    description: 'Learning piano',              type: 'range', startYear: 2023, endYear: 2025 },

  // Items (merged Items + Vehicles)
  { id: 'e13', laneId: 'items',      title: 'Parents\' Home',   description: 'Family house',                type: 'range', startYear: 1990, endYear: 2008 },
  { id: 'e14', laneId: 'items',      title: 'Dorm',             description: 'College dormitory',           type: 'range', startYear: 2008, endYear: 2012 },
  { id: 'e15', laneId: 'items',      title: 'Apartment',        description: 'Rented apartment in SF',      type: 'range', startYear: 2012, endYear: 2019 },
  { id: 'e16', laneId: 'items',      title: 'Own House',        description: 'Bought a house in Austin',    type: 'range', startYear: 2019, endYear: 2026 },
  { id: 'e26', laneId: 'items',      title: 'Honda Civic',      description: 'First car',                   type: 'range', startYear: 2012, endYear: 2016 },
  { id: 'e27', laneId: 'items',      title: 'Tesla Model 3',    description: 'Electric car',                type: 'range', startYear: 2016, endYear: 2022 },
  { id: 'e28', laneId: 'items',      title: 'Rivian R1S',       description: 'Electric SUV',                type: 'range', startYear: 2022, endYear: 2026 },

  // Assets
  { id: 'e17', laneId: 'assets',     title: 'First $100k',      description: 'Savings milestone',           type: 'point', startYear: 2015 },
  { id: 'e18', laneId: 'assets',     title: 'First $1M',        description: 'Net worth milestone',         type: 'point', startYear: 2021 },

  // Relations (merged Relationships + Family)
  { id: 'e19', laneId: 'relations',  title: 'Dating Sarah',     description: 'Started dating',              type: 'range', startYear: 2014, endYear: 2016 },
  { id: 'e20', laneId: 'relations',  title: 'Met Alex',         description: 'Met partner',                 type: 'point', startYear: 2017 },
  { id: 'e21', laneId: 'relations',  title: 'Married Alex',     description: 'Got married',                 type: 'range', startYear: 2019, endYear: 2026 },
  { id: 'e22', laneId: 'relations',  title: 'Emma born',        description: 'First child',                 type: 'point', startYear: 2021 },
  { id: 'e23', laneId: 'relations',  title: 'Liam born',        description: 'Second child',                type: 'point', startYear: 2024 },
  { id: 'e24', laneId: 'relations',  title: 'Parents together', description: 'Both parents alive and well', type: 'range', startYear: 1990, endYear: 2023 },
  { id: 'e25', laneId: 'relations',  title: 'Dad passed',       description: 'Father passed away',          type: 'point', startYear: 2023 },
]
