-- ============================================================
-- 026_remap_persona_events.sql
-- Full replacement of all persona_events.
-- 7 lane names: Place & Travel | Work & Education | Health |
--               Relations & Family | Activities | Assets | Items
-- Max 3 concurrent overlapping events per lane per persona.
-- ============================================================

DELETE FROM public.persona_events;

-- ============================================================
-- ELON MUSK  (born 1971)
-- ============================================================
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  -- Place & Travel (sequential, no overlap)
  ('a0000000-0000-0000-0000-000000000001', 'Place & Travel', 'Pretoria, South Africa',      'Born and raised; left at 17 to avoid mandatory military service, arriving in North America with almost nothing',          'range', 1971, 1989, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000001', 'Place & Travel', 'Canada — Queen''s University', 'Used his mother''s Canadian citizenship; attended Queen''s University in Kingston before transferring south',               'range', 1989, 1992, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000001', 'Place & Travel', 'Philadelphia — UPenn',         'Rented a large house with a partner and threw parties on weekends to cover rent while earning two degrees',               'range', 1992, 1997, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000001', 'Place & Travel', 'Silicon Valley',               'Arrived at the peak of the internet boom; slept in his office to save money; never seriously considered leaving',         'range', 1997, 2020, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000001', 'Place & Travel', 'Austin, Texas',                'Relocated citing California taxes; built Gigafactory Texas and Starbase nearby; often sleeps in a rented prefab at the rocket factory', 'range', 2020, 2026, '#3b82f6'),

  -- Work & Education (max 3 concurrent: UPenn+Zip2 = 2; SpaceX+Tesla+SolarCity = 3; SpaceX+Tesla+Twitter = 3)
  ('a0000000-0000-0000-0000-000000000001', 'Work & Education', 'UPenn — Wharton + Physics',  'Dual degree in economics and physics; dropped out of a Stanford PhD after 2 days to start Zip2',                        'range', 1992, 1997, '#8b5cf6'),
  ('a0000000-0000-0000-0000-000000000001', 'Work & Education', 'Zip2 — first startup',       'City-guide software sold to Compaq for $307M; Elon received $22M at age 27; slept on a beanbag and showered at a gym',  'range', 1995, 1999, '#10b981'),
  ('a0000000-0000-0000-0000-000000000001', 'Work & Education', 'X.com → PayPal',             'Founded online bank X.com; merged with Confinity; ousted as CEO; sold to eBay for $1.5B; walked away with $180M',        'range', 1999, 2002, '#059669'),
  ('a0000000-0000-0000-0000-000000000001', 'Work & Education', 'SpaceX — Founder & CEO',     'Founded to make humanity multi-planetary; nearly went bankrupt 2008; first private company to reuse orbital rockets',    'range', 2002, 2026, '#047857'),
  ('a0000000-0000-0000-0000-000000000001', 'Work & Education', 'Tesla — Chairman then CEO',  'Joined as chairman in 2004; became CEO 2008; nearly bankrupt the same year as SpaceX crisis; saved both companies',      'range', 2004, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-000000000001', 'Work & Education', 'SolarCity',                  'Co-founded with cousins; grew to largest US residential solar installer; later merged into Tesla',                        'range', 2006, 2016, '#059669'),
  ('a0000000-0000-0000-0000-000000000001', 'Work & Education', 'Twitter → X',                'Bought for $44B; fired 75% of staff overnight; renamed X; turned profitable but shed most advertisers; polarised the world', 'range', 2022, 2026, '#10b981'),

  -- Health
  ('a0000000-0000-0000-0000-000000000001', 'Health', '2008 — near breakdown',            'SpaceX''s third rocket failed and Tesla neared bankruptcy simultaneously; he wept on the floor and considered which company to save', 'point', 2008, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000001', 'Health', 'Ketamine use acknowledged',        'Admitted regular ketamine use in 2023; said it helped his depression; became subject of a Wall Street Journal investigation',   'point', 2023, null, '#ef4444'),

  -- Relations & Family
  ('a0000000-0000-0000-0000-000000000001', 'Relations & Family', 'Married Justine Wilson',      'Canadian author; met at Queen''s; 6 children together; first son Nevada died of SIDS at 10 weeks; she later wrote a revealing essay about the marriage', 'range', 2000, 2008, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000001', 'Relations & Family', 'Nevada — first son, died',    'SIDS at 10 weeks; Musk said he would not let himself grieve; Justine said it was a turning point in the marriage',                                       'point', 2002, null, '#f97316'),
  ('a0000000-0000-0000-0000-000000000001', 'Relations & Family', 'Twins and triplets',          'Griffin, Vivian (now transitioned), Damian, Saxon, Kai — born via IVF with Justine; Vivian later severed contact with her father',                       'range', 2004, 2006, '#f97316'),
  ('a0000000-0000-0000-0000-000000000001', 'Relations & Family', 'Married Talulah Riley',       'Married British actress twice (2010, 2013); divorced twice (2012, 2016); she later wrote a novel loosely based on the relationship',                      'range', 2010, 2016, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000001', 'Relations & Family', 'Grimes — partner',            'Met online over a shared AI joke; had X Æ A-12 and Exa Dark Sideræl; Musk also secretly had three children with Shivon Zilis simultaneously',           'range', 2018, 2022, '#db2777'),

  -- Activities
  ('a0000000-0000-0000-0000-000000000001', 'Activities', 'Hyperloop white paper',          'Published open-source concept for 760mph vacuum tube transport; inspired dozens of startups; he built none of them himself',       'point', 2013, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000001', 'Activities', 'OpenAI co-founded',              'Co-founded AI safety lab with $1B pledge; departed the board in 2018; later sued OpenAI for abandoning its non-profit mission',      'point', 2015, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000001', 'Activities', 'First Falcon 9 booster landing', 'First rocket stage to return upright to a launchpad; widely seen as the moment reusable rocketry became real',                       'point', 2015, null, '#d97706'),
  ('a0000000-0000-0000-0000-000000000001', 'Activities', 'Starship — first orbital flight','After two explosive attempts, Starship completed its first orbital-class flight in late 2023 — the biggest rocket ever flown',        'point', 2023, null, '#d97706'),
  ('a0000000-0000-0000-0000-000000000001', 'Activities', 'DOGE — government advisory',     'Appointed to lead the Department of Government Efficiency; targeted federal spending; his most controversial political role yet',    'range', 2025, 2026, '#b45309'),

  -- Assets
  ('a0000000-0000-0000-0000-000000000001', 'Assets', 'PayPal payout — $180M',         'Invested $100M immediately into SpaceX and $70M into Tesla before either had a product; friends thought he''d lost his mind',  'point', 2002, null, '#14b8a6'),
  ('a0000000-0000-0000-0000-000000000001', 'Assets', 'World''s richest person',        'Surpassed Bezos in Jan 2021; net worth peaked ~$300B — the largest personal fortune in recorded history',                       'point', 2021, null, '#0d9488'),
  ('a0000000-0000-0000-0000-000000000001', 'Assets', 'Lost $200B in a single year',    'Tesla stock collapse + Twitter acquisition cost; lost more wealth in 12 months than any person in history; still top-3 richest', 'point', 2022, null, '#0d9488'),

  -- Items
  ('a0000000-0000-0000-0000-000000000001', 'Items', 'Tesla Roadster in space',      'His personal car was the payload on Falcon Heavy''s test flight; now in elliptic orbit between Earth and Mars; dashboard reads "Don''t Panic"', 'point', 2018, null, '#64748b'),
  ('a0000000-0000-0000-0000-000000000001', 'Items', 'Sold all California houses',   'Famous tweet: "I am selling almost all physical possessions"; moved into a $50k prefab Boxabl house at Starbase, Texas',                    'point', 2020, null, '#64748b'),
  ('a0000000-0000-0000-0000-000000000001', 'Items', 'Gulfstream G650ER',            'His private jet tracked obsessively by a college student''s bot; 2022 carbon footprint from jets alone estimated at 2,000× average American',  'range', 2015, 2026, '#475569');


-- ============================================================
-- STEVE JOBS  (born 1955, died 2011)
-- ============================================================
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  -- Place & Travel
  ('a0000000-0000-0000-0000-000000000002', 'Place & Travel', 'Los Altos, California',     'Adopted; grew up in Silicon Valley before Silicon Valley existed; tinkered in the family garage with Steve Wozniak from a young age', 'range', 1955, 1976, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000002', 'Place & Travel', 'India — 7-month journey',   'Spent 7 months in ashrams; contracted dysentery; returned a devoted Zen Buddhist; said the trip shaped his entire design philosophy',  'point', 1974, null, '#0ea5e9'),
  ('a0000000-0000-0000-0000-000000000002', 'Place & Travel', 'Cupertino / Palo Alto',     'Never really left Silicon Valley after founding Apple; his Woodside home and Apple''s campus were his whole world for 35 years',       'range', 1976, 2011, '#3b82f6'),

  -- Work & Education (NeXT+Pixar = 2; Pixar+Apple-return = 2; max 2 concurrent)
  ('a0000000-0000-0000-0000-000000000002', 'Work & Education', 'Reed College — dropped out',       'Dropped out after one semester; kept auditing calligraphy classes; 10 years later it gave Mac its beautiful proportional typefaces',     'range', 1972, 1974, '#8b5cf6'),
  ('a0000000-0000-0000-0000-000000000002', 'Work & Education', 'Atari — night-shift technician',   'Hired at $5/hour; tasked with simplifying Breakout''s circuit boards; secretly paid Woz to do it for a cut of the bonus',            'range', 1974, 1976, '#10b981'),
  ('a0000000-0000-0000-0000-000000000002', 'Work & Education', 'Apple — co-founder (1st stint)',   'Garage startup to public company; the Apple II funded everything; the Mac changed computing; ousted by a board he himself assembled',  'range', 1976, 1985, '#059669'),
  ('a0000000-0000-0000-0000-000000000002', 'Work & Education', 'NeXT Computer',                    'Founded after being fired; built gorgeous, overpriced workstations; the NeXT OS became macOS; Berners-Lee used one to invent the Web',  'range', 1985, 1997, '#047857'),
  ('a0000000-0000-0000-0000-000000000002', 'Work & Education', 'Pixar',                            'Bought Lucas''s computer graphics division for $5M; grew it into the world''s greatest animation studio; sold to Disney for $7.4B',   'range', 1986, 2006, '#10b981'),
  ('a0000000-0000-0000-0000-000000000002', 'Work & Education', 'Apple — CEO (return)',             'Returned when Apple bought NeXT; inherited a company weeks from bankruptcy; launched iMac, iPod, iTunes, iPhone, iPad in 14 years',     'range', 1997, 2011, '#059669'),

  -- Health
  ('a0000000-0000-0000-0000-000000000002', 'Health', 'Cancer diagnosis — refused surgery',  'Diagnosed with a rare, operable pancreatic tumour; chose 9 months of alternative medicine instead; later called it his greatest mistake', 'range', 2003, 2004, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000002', 'Health', 'Surgery + first medical leave',        'Finally underwent surgery in 2004; required disclosure to SEC; returned to work but the cancer was not fully stopped',                   'range', 2004, 2005, '#dc2626'),
  ('a0000000-0000-0000-0000-000000000002', 'Health', 'Liver transplant in Memphis',          'Listed under an assumed name in Tennessee; flown in secret; returned visibly thinner; took medical leave again in 2011; died 5 Oct 2011', 'point', 2009, null, '#dc2626'),

  -- Relations & Family
  ('a0000000-0000-0000-0000-000000000002', 'Relations & Family', 'Chrisann Brennan',            'On-off relationship throughout high school and Reed College; she became pregnant; Jobs denied paternity despite a positive DNA test',    'range', 1972, 1978, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000002', 'Relations & Family', 'Lisa Brennan-Jobs born',      'Jobs denied paternity for years claiming sterility; forced by welfare court to pay $385/month; reconciled in her teens; she wrote "Small Fry"', 'point', 1978, null, '#f97316'),
  ('a0000000-0000-0000-0000-000000000002', 'Relations & Family', 'Joan Baez',                   'Dated the legendary folk singer — she was 18 years his senior; reportedly besotted; she has spoken warmly about him',                  'range', 1982, 1984, '#db2777'),
  ('a0000000-0000-0000-0000-000000000002', 'Relations & Family', 'Married Laurene Powell',      'Married in a Zen Buddhist ceremony in Yosemite; three children; she founded Emerson Collective after his death',                        'range', 1991, 2011, '#ec4899'),

  -- Activities
  ('a0000000-0000-0000-0000-000000000002', 'Activities', '"1984" Super Bowl ad',               'Directed by Ridley Scott; ran once during Super Bowl XVIII; voted the greatest TV commercial ever made; launched the Mac to the world',     'point', 1984, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000002', 'Activities', 'Macworld "One more thing" era',      'Turned product launches into theatrical events; the Reality Distortion Field made audiences believe the impossible was inevitable',         'range', 1998, 2011, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000002', 'Activities', 'Stanford "Stay hungry, stay foolish"', 'Delivered one of history''s most quoted speeches; told stories of dropping out, being fired, and facing death; his philosophical testament', 'point', 2005, null, '#d97706'),
  ('a0000000-0000-0000-0000-000000000002', 'Activities', 'iPhone keynote',                     '"An iPod, a phone, an internet communicator" — the audience laughed; when they understood, the industry never recovered',                  'point', 2007, null, '#d97706'),
  ('a0000000-0000-0000-0000-000000000002', 'Activities', 'iPad launch',                        'Ridiculed as a big phone; sold 300,000 on day one; created the modern tablet category while quietly dying of cancer',                      'point', 2010, null, '#b45309'),

  -- Assets
  ('a0000000-0000-0000-0000-000000000002', 'Assets', 'Apple IPO — $256M at age 25',       'The youngest person on the Fortune 400; famously told an interviewer he felt "old money" by Silicon Valley standards',                  'point', 1980, null, '#14b8a6'),
  ('a0000000-0000-0000-0000-000000000002', 'Assets', 'Sold Apple shares after ouster',    'Sold all but one share in disgust; said he kept one share so he''d receive annual reports and could rub their noses in his success',       'point', 1985, null, '#14b8a6'),
  ('a0000000-0000-0000-0000-000000000002', 'Assets', 'Pixar sale to Disney',              'Pixar IPO in 1995 made him worth $1.5B; sold to Disney for $7.4B in 2006; received stock making him Disney''s largest individual shareholder', 'range', 1995, 2006, '#0d9488'),

  -- Items
  ('a0000000-0000-0000-0000-000000000002', 'Items', 'Black mock-turtleneck — hundreds identical', 'Had Issey Miyake design 100 identical black turtlenecks; said he chose his outfit once so he could save decision-making energy for things that mattered', 'range', 1998, 2011, '#64748b'),
  ('a0000000-0000-0000-0000-000000000002', 'Items', 'Mercedes SL55 — no licence plates',        'Exploited a California law giving new cars 6 months before needing plates; leased a new identical Mercedes every 6 months, perpetually plateless',      'range', 1998, 2011, '#475569'),
  ('a0000000-0000-0000-0000-000000000002', 'Items', 'Woodside mansion — mostly empty',           'Bought a 1920s mansion but lived in near-empty rooms for decades; fought neighbours and planning boards rather than renovate; demolished 2011',          'range', 1984, 2011, '#64748b');


-- ============================================================
-- ALBERT EINSTEIN  (born 1879, died 1955)
-- ============================================================
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  -- Place & Travel (sequential)
  ('a0000000-0000-0000-0000-000000000003', 'Place & Travel', 'Ulm → Munich, Germany',         'Born Ulm; grew up Munich; dropped out of school at 15 rather than submit to rote German military-style education',    'range', 1879, 1895, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000003', 'Place & Travel', 'Switzerland — Aarau + Zurich',  'Passed ETH on second attempt; flourished at a progressive Swiss school; renounced German citizenship at 16; stateless for years', 'range', 1895, 1914, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000003', 'Place & Travel', 'World lecture tour',             'After the 1919 eclipse confirmation made him famous; toured Japan, Palestine, Spain; greeted by crowds larger than any scientist before', 'range', 1922, 1923, '#0ea5e9'),
  ('a0000000-0000-0000-0000-000000000003', 'Place & Travel', 'Berlin, Germany',                'Director of the Kaiser Wilhelm Institute; watched the Nazis rise to power; left Germany forever in December 1932 on a "holiday"',   'range', 1914, 1933, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000003', 'Place & Travel', 'Princeton, New Jersey',          'Safe haven at IAS; became US citizen 1940; never returned to Europe; worked on unified field theory until the night before he died',  'range', 1933, 1955, '#3b82f6'),

  -- Work & Education (all sequential, max 1 concurrent)
  ('a0000000-0000-0000-0000-000000000003', 'Work & Education', 'ETH Zurich — Physics degree',      'Studied physics and mathematics; graduated 1900; immediately found he could not get a single academic post despite applying everywhere',  'range', 1896, 1900, '#8b5cf6'),
  ('a0000000-0000-0000-0000-000000000003', 'Work & Education', 'Swiss Patent Office, Bern',        'Patent clerk third class; wrote the four Annus Mirabilis papers in his lunch breaks; described it as a perfect job for a physicist',   'range', 1902, 1909, '#10b981'),
  ('a0000000-0000-0000-0000-000000000003', 'Work & Education', 'Zurich → Prague → ETH professor', 'First professorships; finally getting academic recognition; moved between universities as offers improved; returned to ETH as professor',  'range', 1909, 1914, '#059669'),
  ('a0000000-0000-0000-0000-000000000003', 'Work & Education', 'Kaiser Wilhelm Institute, Berlin', 'Director of physics; no teaching obligations — pure research; produced General Relativity here; became world-famous after 1919',        'range', 1914, 1933, '#047857'),
  ('a0000000-0000-0000-0000-000000000003', 'Work & Education', 'IAS Princeton',                    'Professor until death; worked on unified field theory for 22 years without success; admitted late in life it may have been a mistake',   'range', 1933, 1955, '#10b981'),

  -- Health
  ('a0000000-0000-0000-0000-000000000003', 'Health', 'Serious illness — Berlin',         'Overwork and war-time malnutrition; lost 25kg; bedridden for months; nursed back by cousin Elsa who then became his wife',              'point', 1917, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000003', 'Health', 'Refused surgery — died on terms',  'Aortic aneurysm ruptured 1955; surgeons offered an operation; he said "I want to go when I want to go; it is tasteless to prolong life artificially"', 'point', 1955, null, '#ef4444'),

  -- Relations & Family
  ('a0000000-0000-0000-0000-000000000003', 'Relations & Family', 'Lieserl — secret daughter',      'Born before marriage; either died young or was given up for adoption; Einstein never mentioned her; the letters revealing her existence were only discovered in 1986', 'point', 1902, null, '#f97316'),
  ('a0000000-0000-0000-0000-000000000003', 'Relations & Family', 'Married Mileva Maric',           'Fellow physics student at ETH; possibly collaborated on early papers; marriage deteriorated; he gave her his future Nobel Prize money as condition of divorce', 'range', 1903, 1919, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000003', 'Relations & Family', 'Hans Albert + Eduard born',      'Hans Albert became a hydraulics professor at Berkeley; Eduard, brilliant and musical, developed schizophrenia and died in a Zurich asylum', 'range', 1904, 1910, '#f97316'),
  ('a0000000-0000-0000-0000-000000000003', 'Relations & Family', 'Affair with cousin Elsa',        'Began affair while still married to Mileva; Elsa managed his public life for years before and after they married',                         'range', 1912, 1919, '#db2777'),
  ('a0000000-0000-0000-0000-000000000003', 'Relations & Family', 'Married Elsa Einstein',          'Married his widowed cousin; she described herself as a caretaker rather than romantic partner; died 1936; he was reportedly unmoved',     'range', 1919, 1936, '#ec4899'),

  -- Activities
  ('a0000000-0000-0000-0000-000000000003', 'Activities', 'Annus Mirabilis — 4 papers',      'Special relativity, E=mc², photoelectric effect, Brownian motion — four papers in one year while working as a patent clerk; he was 26',      'point', 1905, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000003', 'Activities', 'General Relativity published',    'Redefined gravity as curved spacetime; took 10 years of intense struggle; described by later physicists as a superhuman achievement',          'point', 1915, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000003', 'Activities', 'Confirmed by solar eclipse',      'Eddington''s 1919 expedition bent starlight around the sun; overnight Einstein became the world''s most famous scientist — the new Newton',   'point', 1919, null, '#d97706'),
  ('a0000000-0000-0000-0000-000000000003', 'Activities', 'Nobel Prize in Physics',          'Awarded for the photoelectric effect, not relativity — the committee was still uncertain; he gave the $32,000 prize to Mileva per their divorce deal', 'point', 1921, null, '#d97706'),
  ('a0000000-0000-0000-0000-000000000003', 'Activities', 'Letter to Roosevelt — atom bomb', 'Signed the Einstein–Szilard letter urging FDR to develop nuclear weapons before Germany; it helped trigger the Manhattan Project; he spent the rest of his life advocating disarmament and calling it his greatest regret', 'point', 1939, null, '#b45309'),

  -- Assets
  ('a0000000-0000-0000-0000-000000000003', 'Assets', 'Nobel Prize money — all to Mileva', 'Promised his future Nobel Prize as a divorce condition in 1919; paid in 1922; she used it to buy three houses in Zurich',                     'point', 1922, null, '#14b8a6'),
  ('a0000000-0000-0000-0000-000000000003', 'Assets', 'Legacy to Hebrew University',        'Left his papers and intellectual estate to Hebrew University Jerusalem; his brain was removed without family permission at autopsy and spent decades in a Kansas cider box', 'point', 1955, null, '#0d9488'),

  -- Items
  ('a0000000-0000-0000-0000-000000000003', 'Items', 'His violin — lifelong companion',    'Began lessons at 6; played Mozart and Bach throughout his life; said music was how he thought; once played privately for Queen Elisabeth of Belgium', 'range', 1885, 1955, '#64748b'),
  ('a0000000-0000-0000-0000-000000000003', 'Items', 'His pipe',                           'Joined the Montreal Pipe Smokers Club "to smoke in the interest of mankind"; doctors urged him to stop; he said smoking contributed to calm and objective judgement', 'range', 1900, 1955, '#475569'),
  ('a0000000-0000-0000-0000-000000000003', 'Items', 'His brain — removed at autopsy',    'Pathologist Thomas Harvey removed it without family consent; kept it in a cider box under his desk for years; 46 scientific papers have since been published on it', 'point', 1955, null, '#64748b');


-- ============================================================
-- MARIE CURIE  (born 1867, died 1934)
-- ============================================================
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  -- Place & Travel
  ('a0000000-0000-0000-0000-000000000004', 'Place & Travel', 'Warsaw, Poland',              'Born under Russian occupation; attended the illegal Flying University; secretly taught peasant children; left at 24 for Paris and never lived in Poland again', 'range', 1867, 1891, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000004', 'Place & Travel', 'Paris, France',               'Arrived with almost nothing; wore a coat in bed in winter; graduated first in physics; built her entire scientific career here over 43 years',                 'range', 1891, 1934, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000004', 'Place & Travel', 'WWI front lines',             'Drove X-ray vans to battlefield hospitals; trained 150 female radiographers; operated under fire; estimated to have aided over 1 million wounded soldiers',    'range', 1914, 1918, '#0ea5e9'),
  ('a0000000-0000-0000-0000-000000000004', 'Place & Travel', 'USA fundraising tour',        'American women raised $100,000 to gift her a gram of radium; she met President Harding; was mobbed by crowds; found the adulation exhausting and humiliating',  'point', 1921, null, '#0ea5e9'),

  -- Work & Education (Flying Uni ends 1891; UParis 1891-1895; Research+Sorbonne = 2; Sorbonne+Institute = 2)
  ('a0000000-0000-0000-0000-000000000004', 'Work & Education', 'Flying University, Warsaw',         'Attended the illegal underground university for women; took classes in private homes risking arrest; funded her own studies by working as a governess',        'range', 1885, 1891, '#8b5cf6'),
  ('a0000000-0000-0000-0000-000000000004', 'Work & Education', 'University of Paris',               'First woman to complete a physics degree there; graduated top of her class; then earned a second degree in mathematics',                                      'range', 1891, 1895, '#8b5cf6'),
  ('a0000000-0000-0000-0000-000000000004', 'Work & Education', 'Discovery of radioactivity',        'Coined the term; discovered polonium (named for occupied Poland) and radium; refined a tonne of pitchblende by hand in a leaky shed over four years',         'range', 1897, 1906, '#10b981'),
  ('a0000000-0000-0000-0000-000000000004', 'Work & Education', 'Professor at Sorbonne',             'Took Pierre''s chair after his death — the first female professor in the university''s 660-year history; students stood on chairs to see her first lecture',  'range', 1906, 1934, '#059669'),
  ('a0000000-0000-0000-0000-000000000004', 'Work & Education', 'Radium Institute — founded',       'Fundraised internationally; France donated a building; opened just as WWI began; pivoted to battlefield medicine; now the Institut Curie cancer centre',       'range', 1914, 1934, '#047857'),

  -- Health
  ('a0000000-0000-0000-0000-000000000004', 'Health', 'Chronic fatigue and anaemia',       'Years of unprotected radiation; carried radioactive samples in coat pockets; complained only of tiredness; the danger was entirely unknown',  'range', 1910, 1925, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000004', 'Health', 'Cataracts — four operations',       'Underwent four eye surgeries believing the condition was unrelated to her work; used assumed names to hide her deteriorating health from the public', 'range', 1920, 1930, '#dc2626'),
  ('a0000000-0000-0000-0000-000000000004', 'Health', 'Aplastic anaemia — death',          'Bone marrow destroyed by a lifetime of radiation; died 4 July 1934; her notebooks and cookbooks are still too radioactive to handle without protective gear', 'range', 1932, 1934, '#dc2626'),

  -- Relations & Family
  ('a0000000-0000-0000-0000-000000000004', 'Relations & Family', 'Kazimierz Zorawski',          'Romance while governess to his family; his parents forbade marriage to a penniless woman; he became a famous mathematician; reportedly seen weeping at her statue years later', 'range', 1887, 1891, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000004', 'Relations & Family', 'Married Pierre Curie',        'Met as scientific equals; toured France by bicycle on their honeymoon; she wore a dark navy dress to be practical — wore it in the lab for years after',                        'range', 1895, 1906, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000004', 'Relations & Family', 'Irène born',                  'First daughter; also became a physicist; won the 1935 Nobel Prize in Chemistry — the only mother and daughter to both be Nobel laureates',                                      'point', 1897, null, '#f97316'),
  ('a0000000-0000-0000-0000-000000000004', 'Relations & Family', 'Ève born',                    'Second daughter; became a celebrated journalist and biographer; wrote the definitive biography of her mother; received the Legion of Honour aged 95',                           'point', 1904, null, '#f97316'),
  ('a0000000-0000-0000-0000-000000000004', 'Relations & Family', 'Affair with Paul Langevin',   'Affair with a colleague 5 years her junior became public via stolen letters; she received death threats and was told to "go back to Poland"; Nobel Committee asked her not to collect her prize', 'range', 1910, 1911, '#db2777'),

  -- Activities
  ('a0000000-0000-0000-0000-000000000004', 'Activities', 'Refused to patent radium process',  'Deliberately refused to patent the method for isolating radium; believed scientific knowledge belonged to everyone; effectively gave away what would have been an enormous fortune', 'point', 1898, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000004', 'Activities', 'Nobel Prize in Physics',            'First woman ever to win a Nobel Prize; shared with Pierre and Becquerel; the Swedish Academy initially excluded her until Pierre insisted she be named',                           'point', 1903, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000004', 'Activities', 'Nobel Prize in Chemistry',          'Second Nobel Prize in 1911 — the only person in history to win in two different sciences; collected while under death threats over the Langevin affair',                           'point', 1911, null, '#d97706'),
  ('a0000000-0000-0000-0000-000000000004', 'Activities', 'WWI mobile X-ray units',           '"Petites Curies" — converted Renault vans into mobile X-ray labs; she drove one herself; trained her 17-year-old daughter Irène to operate another',                              'range', 1914, 1918, '#d97706'),

  -- Assets
  ('a0000000-0000-0000-0000-000000000004', 'Assets', 'Nobel Prize winnings — into research', 'Declined to patent radium; gave away most prize money; said "I have no dress except the one I wear every day; you may give the money to the laboratory"', 'range', 1903, 1911, '#14b8a6'),
  ('a0000000-0000-0000-0000-000000000004', 'Assets', 'The Radium Institute',                 'Fundraised internationally to build it; France donated land; it became the world''s leading radiation research centre; it still exists as the Institut Curie',  'range', 1914, 1934, '#0d9488'),

  -- Items
  ('a0000000-0000-0000-0000-000000000004', 'Items', 'Radioactive notebooks',       'Stored in lead-lined boxes at the Bibliothèque Nationale de France; visitors must sign a liability waiver and wear protective gear; will remain radioactive for 1,500 years', 'range', 1897, 1934, '#64748b'),
  ('a0000000-0000-0000-0000-000000000004', 'Items', '"Petites Curies" — 20 X-ray vans', 'Converted Renault vans she designed and built herself; she held a driving licence; the fleet is credited with saving thousands of lives on the Western Front',          'range', 1914, 1918, '#475569'),
  ('a0000000-0000-0000-0000-000000000004', 'Items', 'Pierre''s bicycle',            'The couple toured France by bicycle on their honeymoon — an unconventional choice that symbolised their equal, practical partnership',                                      'point', 1895, null, '#64748b');


-- ============================================================
-- LEONARDO DA VINCI  (born 1452, died 1519)
-- ============================================================
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  -- Place & Travel
  ('a0000000-0000-0000-0000-000000000005', 'Place & Travel', 'Vinci, Tuscany',              'Born illegitimate to a peasant woman and a Florentine notary; raised by grandparents and uncle in the hills above the Arno valley',           'range', 1452, 1466, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000005', 'Place & Travel', 'Florence — apprentice years', 'Apprenticed to master sculptor Verrocchio at 14; quickly became the most gifted artist in the city; stayed until a better offer arrived',       'range', 1466, 1482, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000005', 'Place & Travel', 'Milan — Sforza court',        'Wrote to Ludovico Sforza offering himself first as a military engineer, last as a painter; spent 17 years at the most glamorous court in Europe', 'range', 1482, 1499, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000005', 'Place & Travel', 'Florence (return) + Borgia',  'Returned after the Sforza fell; briefly served Cesare Borgia as military cartographer; made some of the most accurate maps of 16th-century Italy', 'range', 1500, 1506, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000005', 'Place & Travel', 'Milan + Rome',                'A second stint in Milan; then Rome under Giuliano de'' Medici; increasingly sidelined; anatomical studies halted by the Pope',                    'range', 1506, 1516, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000005', 'Place & Travel', 'Amboise, France',             'Invited by King Francis I; lived at Château du Clos Lucé connected to the royal castle by a tunnel; the king reportedly held him as he died',    'range', 1516, 1519, '#3b82f6'),

  -- Work & Education (anatomy overlaps with Milan + Florence return = 2; max 2 concurrent)
  ('a0000000-0000-0000-0000-000000000005', 'Work & Education', 'Verrocchio''s Workshop',         'Trained as painter, sculptor, goldsmith; Verrocchio reportedly retired his own brushes after seeing Leonardo''s angel in the Baptism of Christ', 'range', 1466, 1478, '#10b981'),
  ('a0000000-0000-0000-0000-000000000005', 'Work & Education', 'Independent studio, Florence',   'Set up own workshop; often abandoned commissions unfinished — a lifelong pattern; left Florence without finishing the Adoration of the Magi', 'range', 1478, 1482, '#10b981'),
  ('a0000000-0000-0000-0000-000000000005', 'Work & Education', 'Court Artist & Engineer, Milan', 'Designed canals, war machines, heating systems, stage sets; spent more time engineering than painting; planned a bronze horse 3× life-size',   'range', 1482, 1499, '#059669'),
  ('a0000000-0000-0000-0000-000000000005', 'Work & Education', 'Anatomical dissections',         'Dissected 30+ human corpses at night in hospital morgues; produced the most accurate anatomical drawings in existence; work suppressed for centuries', 'range', 1490, 1510, '#047857'),
  ('a0000000-0000-0000-0000-000000000005', 'Work & Education', 'Premier Painter of France',      'King Francis I granted an annual stipend and freedom to think; said Leonardo''s conversation was worth more than his painting; almost no art made here', 'range', 1516, 1519, '#10b981'),

  -- Health
  ('a0000000-0000-0000-0000-000000000005', 'Health', 'Right hand paralysis — possible stroke', 'A visitor to Amboise noted Leonardo''s right hand was paralysed at 65; he had painted with his right but written in left-hand mirror script; had to let assistants hold the brush', 'point', 1517, null, '#ef4444'),

  -- Relations & Family
  ('a0000000-0000-0000-0000-000000000005', 'Relations & Family', 'Salai — apprentice and companion', 'Joined aged 10; Leonardo listed him as a thief who stole money and supplies; loved him anyway for 29 years; left him the Mona Lisa',                     'range', 1490, 1519, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000005', 'Relations & Family', 'Francesco Melzi',                  'Nobleman''s son who gave up his inheritance to follow Leonardo; wept at his death; inherited all the notebooks; kept them safe until his own death 1570', 'range', 1506, 1519, '#f97316'),

  -- Activities (Last Supper + Flying machines + Canal engineering = 3 concurrent at 1495-1498)
  ('a0000000-0000-0000-0000-000000000005', 'Activities', 'Baptism of Christ — first brushwork', 'Added an angel so superior to Verrocchio''s work that the master reportedly retired his brushes; Leonardo''s first documented painting; age ~20',      'range', 1472, 1475, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000005', 'Activities', 'Canal engineering for Milan',         'Designed a system of canals, locks and irrigation for the Lombard plain; some were built; he studied water movement obsessively for 40 years',           'range', 1482, 1499, '#d97706'),
  ('a0000000-0000-0000-0000-000000000005', 'Activities', 'Flying machine designs',              'Designed ornithopters, hang gliders and a parachute based on bird anatomy; the parachute was tested successfully in 2000; he never built a full prototype', 'range', 1488, 1505, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000005', 'Activities', 'The Last Supper',                     'Worked in bursts and long pauses; the abbot complained he was lazy; depicted the moment Jesus announced his betrayal; never successfully restored',        'range', 1495, 1498, '#d97706'),
  ('a0000000-0000-0000-0000-000000000005', 'Activities', 'Vitruvian Man',                       'Study of ideal human proportions combining art and mathematics; two overlapping body positions in a single drawing; the most reproduced image in the world', 'point', 1490, null, '#b45309'),
  ('a0000000-0000-0000-0000-000000000005', 'Activities', 'Mona Lisa',                           'Worked on it for 16 years and was still adding details when he died; carried it everywhere; sold to King Francis I; stolen from the Louvre in 1911', 'range', 1503, 1519, '#b45309'),

  -- Assets
  ('a0000000-0000-0000-0000-000000000005', 'Assets', 'Vineyard from Ludovico Sforza', 'Given as payment for court services in the Porta Vercellina district; still produces wine today under the Ca'' del Bosco label',          'point', 1498, null, '#14b8a6'),
  ('a0000000-0000-0000-0000-000000000005', 'Assets', 'Royal pension — King Francis I', 'Granted 1,000 écus per year plus Château du Clos Lucé; the most generous royal patronage of any Renaissance artist; he called it freedom', 'range', 1516, 1519, '#0d9488'),

  -- Items
  ('a0000000-0000-0000-0000-000000000005', 'Items', 'The Codices — 13,000 pages',  'Accumulated across his lifetime; cover anatomy, physics, engineering, botany, music; scattered across Europe after his death; the world''s most expensive books today', 'range', 1478, 1519, '#64748b'),
  ('a0000000-0000-0000-0000-000000000005', 'Items', 'His lute',                    'Played the lute and invented new stringed instruments; used musical skill to gain access to noble courts; Sforza first hired him for a lute performance, not his art', 'range', 1466, 1519, '#475569'),
  ('a0000000-0000-0000-0000-000000000005', 'Items', 'Mona Lisa — his possession',  'Never delivered to the patron; carried with him for 16 years; sold to King Francis I after his death; only reached the Louvre in 1797',                           'range', 1503, 1519, '#64748b');


-- ============================================================
-- ANGELA MERKEL  (born 1954)
-- ============================================================
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  -- Place & Travel
  ('a0000000-0000-0000-0000-000000000006', 'Place & Travel', 'Hamburg → Templin, East Germany', 'Born in Hamburg; father moved the family to East Germany to take a pastor position; grew up behind the Iron Curtain with severe travel restrictions', 'range', 1954, 1973, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000006', 'Place & Travel', 'Leipzig + East Berlin',           'Physics degree then doctoral research in East Berlin; never left the GDR until the Wall fell; her entire world was within 200km',                    'range', 1973, 1990, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000006', 'Place & Travel', 'First visit to West Germany',     'Walked through the open checkpoint on 9 November 1989 at age 35 — the first time she had ever set foot in the West; went to a sauna with a friend the next morning', 'point', 1989, null, '#0ea5e9'),
  ('a0000000-0000-0000-0000-000000000006', 'Place & Travel', 'Berlin, reunified Germany',       'Moved to Berlin after reunification; remained there throughout her 31-year political career and into retirement; lives in the same Mitte apartment',   'range', 1990, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000006', 'Place & Travel', 'China — 12 state visits',         'More state visits to China than any other German Chancellor; built Germany''s deep economic dependency on Beijing; later widely seen as a strategic vulnerability', 'range', 2006, 2021, '#0ea5e9'),

  -- Work & Education (CDU politician ends 2005 when Chancellor begins; CDU Leader + Chancellor = 2 concurrent 2005-2018)
  ('a0000000-0000-0000-0000-000000000006', 'Work & Education', 'Physics + PhD in Quantum Chemistry', 'Karl Marx University Leipzig 1973–78; doctorate on hydrocarbon decay rates from Academy of Sciences 1986; graded magna cum laude',                'range', 1973, 1986, '#8b5cf6'),
  ('a0000000-0000-0000-0000-000000000006', 'Work & Education', 'Researcher — Academy of Sciences',   'Physical chemist in East Berlin; published papers; reportedly contemplated emigrating; then the Wall fell',                                        'range', 1986, 1989, '#10b981'),
  ('a0000000-0000-0000-0000-000000000006', 'Work & Education', 'CDU politician — Bundestag + minister roles', 'Joined CDU within weeks of the Wall falling; elected to Bundestag 1990; Minister for Women then Environment under Chancellor Kohl', 'range', 1990, 2000, '#059669'),
  ('a0000000-0000-0000-0000-000000000006', 'Work & Education', 'CDU Party Leader',                   'Engineered a brilliant ambush of the Kohl-era guard via a newspaper op-ed; elected chairwoman Dec 2000; first woman to lead the CDU',            'range', 2000, 2018, '#047857'),
  ('a0000000-0000-0000-0000-000000000006', 'Work & Education', 'Chancellor of Germany',             'Four consecutive coalition governments; navigated eurozone crisis, refugee crisis, and COVID-19; retired 2021 as longest-serving democratic EU leader', 'range', 2005, 2021, '#059669'),

  -- Health
  ('a0000000-0000-0000-0000-000000000006', 'Health', 'Skiing hip injury',        'Sustained a pelvic injury while cross-country skiing in the Swiss Alps; worked through it during a critical EU budget negotiation; never publicly complained', 'point', 2014, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000006', 'Health', 'Trembling episodes',       'Visible uncontrolled shaking at public ceremonies from 2019; attributed officially to dehydration; a third episode in 2021 preceded her retirement announcement; true cause unconfirmed', 'range', 2019, 2021, '#ef4444'),

  -- Relations & Family
  ('a0000000-0000-0000-0000-000000000006', 'Relations & Family', 'Ulrich Merkel — first husband', 'Married fellow physics student 1977; divorced 1982; famously kept his name throughout her entire political career without ever explaining why', 'range', 1977, 1982, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000006', 'Relations & Family', 'Helmut Kohl — mentor and rival', 'Mentored by Chancellor Kohl who called her "Mädchen" (little girl); she ended his political career in a 2000 newspaper letter advising the CDU to cut ties with him over a slush fund; called patricide by his allies', 'range', 1990, 2000, '#f97316'),
  ('a0000000-0000-0000-0000-000000000006', 'Relations & Family', 'Joachim Sauer',                  'Quantum chemist at Humboldt University; married 1998; appeared at official functions perhaps a dozen times in 23 years of chancellorship; they cook together, he says', 'range', 1998, 2026, '#ec4899'),

  -- Activities
  ('a0000000-0000-0000-0000-000000000006', 'Activities', 'Fall of the Berlin Wall',        'Celebrated at age 35; went to a sauna with friends on the night the Wall fell; it pivoted her from physicist to politician within months',                   'point', 1989, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000006', 'Activities', 'First female Chancellor',        'Became Germany''s and the EU''s first female head of government on 22 November 2005; deliberately accepted a lower ministerial salary than her predecessor',  'point', 2005, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000006', 'Activities', 'Eurozone crisis management',    'Led EU response to the Greek sovereign debt crisis; insisted on austerity; kept the eurozone intact while being burned in effigy across southern Europe',      'range', 2010, 2012, '#d97706'),
  ('a0000000-0000-0000-0000-000000000006', 'Activities', '"Wir schaffen das"',             'Opened Germany''s borders to over 1 million Syrian refugees in 2015; "We can do it" became both rallying cry and political millstone; haunts German politics still', 'point', 2015, null, '#d97706'),
  ('a0000000-0000-0000-0000-000000000006', 'Activities', 'COVID-19 pandemic address',     'Her TV address explaining the exponential mathematics of the pandemic was praised internationally; "the most important speech of her career" — her physics training made audible', 'point', 2020, null, '#b45309'),
  ('a0000000-0000-0000-0000-000000000006', 'Activities', 'Zapfenstreich farewell',         'Chose punk music and a church hymn for her farewell military ceremony; a final quiet act of individuality from a leader who had hidden all of it for 16 years', 'point', 2021, null, '#b45309'),

  -- Assets
  ('a0000000-0000-0000-0000-000000000006', 'Assets', 'Modest lifestyle throughout',  'Paid herself €18,820/month as Chancellor; lives with Sauer in the same Berlin flat she rented before becoming famous; no private chef, no entourage in retirement', 'range', 2005, 2026, '#14b8a6'),

  -- Items
  ('a0000000-0000-0000-0000-000000000006', 'Items', 'The puffer jacket',    'Wore the same style of colourful quilted puffer jacket for 30 years; became a global meme; a major fashion house eventually put it on the runway as a tribute', 'range', 1990, 2026, '#64748b'),
  ('a0000000-0000-0000-0000-000000000006', 'Items', 'Her Berlin apartment', 'Continued living in the same modest Mitte apartment through all 16 years of chancellorship; no state residence; grocery-shopped herself on weekends',            'range', 1990, 2026, '#475569');


-- ============================================================
-- TAYLOR SWIFT  (born 1989)
-- ============================================================
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  -- Place & Travel (Nashville+NYC = 2; Nashville+NYC+Eras Tour = 3)
  ('a0000000-0000-0000-0000-000000000007', 'Place & Travel', 'West Reading, Pennsylvania',    'Born in West Reading; grew up on a Christmas tree farm; won a local theatre competition at 11; performed in every musical she could find',          'range', 1989, 2004, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000007', 'Place & Travel', 'Hendersonville, Tennessee',     'Family relocated at 14 so Taylor could pursue Nashville''s music industry; enrolled briefly in high school then homeschooled to fit touring',         'range', 2004, 2011, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000007', 'Place & Travel', 'Nashville — permanent base',    'Bought her own home at 19; it remains the emotional and musical centre of her career despite spending half the year in New York',                    'range', 2011, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000007', 'Place & Travel', 'New York City — Tribeca',       'Moved to Tribeca in 2014; became core to NYC''s cultural scene; inspired "Welcome to New York"; the penthouse hosted legendary gatherings',          'range', 2014, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000007', 'Place & Travel', 'Eras Tour — 21 countries',      '152 shows across 5 continents; hotel prices spiked in every host city; local economies dubbed the phenomenon "Swiftonomics"',                        'range', 2023, 2024, '#0ea5e9'),

  -- Work & Education (max 3 concurrent: Republic+Re-recordings+Eras Tour)
  ('a0000000-0000-0000-0000-000000000007', 'Work & Education', 'Signed at 14 — Big Machine Records',  'Youngest artist ever signed to the label; wrote or co-wrote every song on her debut; the label''s biggest bet paid off immediately',              'point', 2004, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000007', 'Work & Education', 'Debut + Fearless era',                 'Self-titled debut written alone at 14; Fearless won Grammy AOTY; "Love Story" rewrote the country-pop boundary; she was 18',                    'range', 2006, 2010, '#059669'),
  ('a0000000-0000-0000-0000-000000000007', 'Work & Education', 'Speak Now + Red era',                  'Speak Now written entirely alone to prove she could; Red was genre-blending; "All Too Well" hidden as a 10-minute heartbreak epic',             'range', 2010, 2014, '#047857'),
  ('a0000000-0000-0000-0000-000000000007', 'Work & Education', '1989 + Reputation era',                'Full pop crossover; 1989 Tour grossed $250M; Reputation Stadium Tour $345M — both records at the time',                                         'range', 2014, 2019, '#10b981'),
  ('a0000000-0000-0000-0000-000000000007', 'Work & Education', 'Republic Records — Folklore to Midnights', 'Signed with Universal; wrote Folklore in pandemic quarantine in one month; won fourth Grammy AOTY with Midnights in 2024',               'range', 2019, 2026, '#059669'),
  ('a0000000-0000-0000-0000-000000000007', 'Work & Education', 'Re-recordings (Taylor''s Version)',    'Re-recorded all 6 Big Machine albums to own her masters; the campaign caused streaming platforms to shift listeners to her versions; Braun sold the originals at a loss', 'range', 2021, 2024, '#047857'),
  ('a0000000-0000-0000-0000-000000000007', 'Work & Education', 'Eras Tour',                           '152 shows, 5 continents, 10 million tickets; first tour to gross $1B; she paid each of her truck drivers bonuses up to $55,000',               'range', 2023, 2024, '#10b981'),

  -- Health
  ('a0000000-0000-0000-0000-000000000007', 'Health', 'Eating disorder',              'Battled anorexia and orthorexia throughout her early career; opened up in the 2020 documentary Miss Americana; said tabloid "fat" comments were the trigger', 'range', 2010, 2019, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000007', 'Health', 'Mother''s cancer diagnoses',   'Mother Andrea diagnosed with cancer in 2015; Taylor became outspoken about genetic testing; cancer returned as a different type in 2023 during the Eras Tour', 'range', 2015, 2026, '#dc2626'),

  -- Relations & Family (max 3 concurrent shown in consecutive non-overlapping relationships)
  ('a0000000-0000-0000-0000-000000000007', 'Relations & Family', 'Jake Gyllenhaal',       'Relationship at 20 to his 29; inspired "All Too Well"; the 10-minute re-recorded version in 2021 caused such backlash he deleted his Instagram',                     'range', 2010, 2011, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000007', 'Relations & Family', 'Harry Styles',          'Dated One Direction''s Harry Styles; inspired "Style" and "Out of the Woods"; their New Year''s breakup became music lore',                                          'range', 2012, 2013, '#db2777'),
  ('a0000000-0000-0000-0000-000000000007', 'Relations & Family', 'Calvin Harris',         'Longest public relationship before Alwyn; broke up in a public Twitter spat after it emerged she had written Rihanna''s hit "This Is What You Came For" uncredited', 'range', 2015, 2016, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000007', 'Relations & Family', 'Tom Hiddleston',        'Two-month relationship immediately after Calvin Harris; papped wearing an "I ♥ T.S." tank top; became the most mocked celebrity couple of 2016',                    'range', 2016, 2016, '#db2777'),
  ('a0000000-0000-0000-0000-000000000007', 'Relations & Family', 'Joe Alwyn',             'Six-year private relationship; reportedly co-wrote Folklore and Evermore songs under the alias William Bowery; broke up quietly in early 2023',                      'range', 2017, 2023, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000007', 'Relations & Family', 'Travis Kelce',          'NFL tight end for Kansas City Chiefs; went public mid-Eras Tour 2023; she attended 12 Chiefs games; "Swifties became football fans" — ESPN; attended Super Bowl LVIII', 'range', 2023, 2026, '#db2777'),

  -- Activities
  ('a0000000-0000-0000-0000-000000000007', 'Activities', '4× Grammy Album of the Year',   'Only artist ever to win four times: Fearless, 1989, Folklore, Midnights; made each acceptance speech about the process of songwriting',         'range', 2010, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000007', 'Activities', 'Registered 35,000 voters in a day', 'Posted a voter registration link to Instagram; Vote.org crashed within minutes; credited with 35,252 new registrations that single day',   'point', 2023, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000007', 'Activities', 'TIME Person of the Year 2023',   'First solo musician ever to receive the honour; "Swiftonomics" was cited — her cultural influence had measurably moved national economies',     'point', 2023, null, '#d97706'),
  ('a0000000-0000-0000-0000-000000000007', 'Activities', 'Eras Tour grosses $1B+',         'Certified by Pollstar in December 2024; estimated total economic impact across host cities exceeded the GDP of several small countries',        'point', 2024, null, '#d97706'),

  -- Assets
  ('a0000000-0000-0000-0000-000000000007', 'Assets', 'Masters stolen — Scooter Braun',       'Braun''s Ithaca Holdings acquired her entire 6-album catalogue without her knowledge; she found out on Tumblr the same day as the public',        'point', 2019, null, '#14b8a6'),
  ('a0000000-0000-0000-0000-000000000007', 'Assets', 'Re-recordings devalue originals',      'Her Taylor''s Versions campaign caused platforms to push her re-records algorithmically; Braun eventually sold the originals at a significant loss', 'range', 2021, 2023, '#0d9488'),
  ('a0000000-0000-0000-0000-000000000007', 'Assets', 'Billionaire status',                   'Forbes confirmed billionaire in October 2023 — from the Eras Tour, owned re-recorded catalogue, and smart real-estate investments; unique among artists', 'point', 2023, null, '#0d9488'),

  -- Items
  ('a0000000-0000-0000-0000-000000000007', 'Items', 'Rhode Island compound — Watch Hill',    'Eight-bedroom coastal estate; hosted legendary annual 4th of July parties for celebrity friends; known as "Taylor''s Squad" gatherings',          'range', 2012, 2026, '#64748b'),
  ('a0000000-0000-0000-0000-000000000007', 'Items', 'Cornelia Street apartment, NYC',        'Her NYC apartment; said she was "20 seconds from crying" at the thought of giving it up; the song "Cornelia Street" is about that fear',         'range', 2017, 2019, '#475569'),
  ('a0000000-0000-0000-0000-000000000007', 'Items', 'Private jet fleet',                     'Ranked the most polluting celebrity jet user in 2022 by a carbon-tracking study; jets became a source of prolonged backlash during the Eras Tour era', 'range', 2018, 2026, '#64748b');


-- ============================================================
-- CRISTIANO RONALDO  (born 1985)
-- ============================================================
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  -- Place & Travel (sequential club cities)
  ('a0000000-0000-0000-0000-000000000008', 'Place & Travel', 'Funchal, Madeira',              'Born in Santo António, Funchal; grew up in a small house with 4 siblings; father was a municipal gardener; the neighbourhood has since been renamed after him', 'range', 1985, 1997, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000008', 'Place & Travel', 'Lisbon — Sporting CP academy', 'Left home at 12 on his first ever flight; reportedly cried for weeks; struggled with his Madeiran accent being mocked; stayed through sheer determination',     'range', 1997, 2003, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000008', 'Place & Travel', 'Manchester, England',           'Signed by Man Utd for £12.24M; bought a mansion in Cheshire; learned English; adapted to the physical Premier League under Sir Alex Ferguson',                  'range', 2003, 2009, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000008', 'Place & Travel', 'Madrid, Spain',                 'World-record £80M move; lived in La Finca gated estate; nine prolific years; broke every Real Madrid scoring record; became a national hero in Lisbon too',      'range', 2009, 2018, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000008', 'Place & Travel', 'Turin, Italy',                  'Signed for €100M; lived in a luxury villa; won Serie A titles; became the first player to win league titles in England, Spain, and Italy',                       'range', 2018, 2021, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000008', 'Place & Travel', 'Manchester (return)',           'Emotional homecoming ended in a public dispute; gave a bombshell interview criticising the club and manager; contract terminated by mutual consent',              'range', 2021, 2022, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000008', 'Place & Travel', 'Riyadh, Saudi Arabia',          'Signed for Al Nassr at reported €200M/year; the highest-paid footballer in history; his arrival elevated the Saudi Pro League''s global profile overnight',      'range', 2023, 2026, '#3b82f6'),

  -- Work & Education (club + Portugal national team = max 2 concurrent throughout)
  ('a0000000-0000-0000-0000-000000000008', 'Work & Education', 'Sporting CP academy',               'Left school at 16 to focus on football; the coaches called him the most dedicated player they had ever seen; made his senior debut at 17',                   'range', 1997, 2003, '#8b5cf6'),
  ('a0000000-0000-0000-0000-000000000008', 'Work & Education', 'Manchester United (1st spell)',     'Under Sir Alex Ferguson; won 3 Premier Leagues and 1 Champions League; won first Ballon d''Or 2008; sold for then-world-record £80M',                       'range', 2003, 2009, '#10b981'),
  ('a0000000-0000-0000-0000-000000000008', 'Work & Education', 'Real Madrid',                       'Scored 450 goals in 438 games; won 4 Champions Leagues and 2 La Liga titles; broke every Real Madrid scoring record ever set',                             'range', 2009, 2018, '#059669'),
  ('a0000000-0000-0000-0000-000000000008', 'Work & Education', 'Juventus',                          'Signed for €100M; won 2 Serie A titles; became the first player to win the league in England, Spain, and Italy',                                           'range', 2018, 2021, '#047857'),
  ('a0000000-0000-0000-0000-000000000008', 'Work & Education', 'Manchester United (2nd) + Al Nassr','Emotional return ended in controversy; moved to Saudi Arabia where he became the world''s highest-paid active athlete',                                    'range', 2021, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-000000000008', 'Work & Education', 'Portugal national team captain',    'Debuted at 18; 130+ international goals — the all-time world record; captained Portugal to Euro 2016 and Nations League 2019; appeared at 5 World Cups',   'range', 2003, 2026, '#059669'),

  -- Health
  ('a0000000-0000-0000-0000-000000000008', 'Health', 'Heart surgery at 15',          'Diagnosed with tachycardia; underwent laser surgery; reportedly asked the doctor "am I going to be able to play football?"; nearly ended his career before it began',  'point', 2000, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000008', 'Health', 'Extreme fitness regimen',      '7% body fat; multiple 90-minute sleep cycles instead of one long sleep; personal nutritionist since age 18; widely credited with extending peak performance into his late 30s', 'range', 2005, 2026, '#dc2626'),
  ('a0000000-0000-0000-0000-000000000008', 'Health', 'Chronic knee management',      'Persistent knee issues managed with daily ice baths, strict anti-inflammatory diet, and physiotherapy; reportedly spent €50,000/year on his body',                     'range', 2012, 2022, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000008', 'Health', 'No alcohol — ever',            'Has never consumed alcohol; reportedly turned down celebratory champagne after every trophy; linked to his father''s alcoholism and early death',                        'range', 2003, 2026, '#dc2626'),

  -- Relations & Family
  ('a0000000-0000-0000-0000-000000000008', 'Relations & Family', 'Irina Shayk',              'Russian supermodel; 5-year relationship; one of the most photographed celebrity couples of the era; reportedly split when Georgina entered the picture', 'range', 2010, 2015, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000008', 'Relations & Family', 'Cristiano Jr born',        'First child born via surrogate in 2010; mother''s identity never revealed; raised primarily by Ronaldo; CR Jr now trains professionally at the academy',  'point', 2010, null, '#f97316'),
  ('a0000000-0000-0000-0000-000000000008', 'Relations & Family', 'Georgina Rodríguez',       'Met in a Gucci store in Madrid in 2016; starred in her own Netflix documentary "I Am Georgina"; the children call her mum',                             'range', 2016, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000008', 'Relations & Family', 'Eva, Mateo + Alana — three children in one year', 'Twins Eva and Mateo born via surrogate in June 2017; daughter Alana born with Georgina in November 2017', 'point', 2017, null, '#f97316'),
  ('a0000000-0000-0000-0000-000000000008', 'Relations & Family', 'Angel dies at birth; Bella survives', 'Georgina pregnant with twins in 2022; baby son Angel died at birth; Ronaldo wore a black armband for weeks; the loss was publicly mourned worldwide', 'point', 2022, null, '#f97316'),

  -- Activities
  ('a0000000-0000-0000-0000-000000000008', 'Activities', 'First Ballon d''Or',              'Won his first at 23 following the Champions League and Premier League double with Man Utd; finally cemented his claim to world''s best',             'point', 2008, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000008', 'Activities', '5 Ballon d''Or awards',           'Won 2008, 2013, 2014, 2016, 2017; his decade-long rivalry with Messi pushed both men to records that may never be broken',                           'range', 2008, 2017, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000008', 'Activities', 'UEFA Euro 2016 winner',           'Captained Portugal to their first major trophy; injured in the 10th minute but refused to leave; coached from the touchline for 80 minutes; wept at the final whistle', 'point', 2016, null, '#d97706'),
  ('a0000000-0000-0000-0000-000000000008', 'Activities', 'Nations League 2019',             'Portugal won the inaugural Nations League on home soil; Ronaldo was the decisive player throughout; a rare trophy that was unambiguously his',        'point', 2019, null, '#d97706'),
  ('a0000000-0000-0000-0000-000000000008', 'Activities', '900 career goals',                'First footballer to score 900 official career goals; reached at age 39; still scoring in Saudi Arabia; the record may stand for a generation',        'point', 2024, null, '#b45309'),
  ('a0000000-0000-0000-0000-000000000008', 'Activities', 'Most followed person on Instagram', '600M+ followers — more than any other human on any social platform; generates €20M+ per sponsored post; his influence extends far beyond sport',    'point', 2023, null, '#b45309'),

  -- Assets
  ('a0000000-0000-0000-0000-000000000008', 'Assets', '€1B career earnings — first footballer', 'Became the first footballer to earn €1 billion in career income from salary and endorsements combined; the primary earner in world sport since 2010', 'point', 2020, null, '#14b8a6'),
  ('a0000000-0000-0000-0000-000000000008', 'Assets', 'CR7 brand empire',                      'Pestana CR7 hotels, CR7 cologne, CR7 clothing line, a hair transplant clinic; brand estimated worth over $1B; built in parallel with playing career',  'range', 2013, 2026, '#0d9488'),
  ('a0000000-0000-0000-0000-000000000008', 'Assets', 'Al Nassr deal — €200M/year',            'The richest sports contract in history at signing; includes image rights and a tourism ambassador role for Saudi Arabia as part of the package',       'point', 2023, null, '#0d9488'),

  -- Items
  ('a0000000-0000-0000-0000-000000000008', 'Items', 'CR7 Museum, Funchal',     'Self-funded museum on his home island dedicated entirely to his own career; 3,000+ trophies and medals; 200,000+ visitors per year; a wax figure of himself at the entrance', 'range', 2013, 2026, '#64748b'),
  ('a0000000-0000-0000-0000-000000000008', 'Items', 'Supercar collection',     'Bugatti Veyron, Lamborghini Aventador, Ferrari F430, Rolls-Royce Phantom among 20+ cars; one of the most expensive private car collections in the world',                'range', 2007, 2026, '#475569'),
  ('a0000000-0000-0000-0000-000000000008', 'Items', 'Pestana CR7 hotels',      'Co-owns boutique hotel chain with properties in Funchal, Lisbon, Madrid, and New York; opened a Manchester location; part hotels, part personal brand monument',          'range', 2016, 2026, '#64748b');
