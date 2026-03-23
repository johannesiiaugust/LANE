-- 031b_remainder_events.sql
-- Events for personas 13a-169 (missing from 031b due to UUID errors)
-- Personas 133-139 already inserted from original broken run

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000013a', 'Place & Travel', 'St. Joseph, Missouri / Detroit', 'Born in St. Joseph; moved to Detroit at age 12 after difficult childhood.', 'range', 1972, 1995, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000013a', 'Place & Travel', 'Detroit, Michigan (home base)', 'Based in Detroit throughout career; deeply tied to city''s identity.', 'range', 1995, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000013a', 'Work & Education', 'Slim Shady LP breakthrough', 'Major label debut executive-produced by Dr. Dre; instantly controversial and successful.', 'point', 1999, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000013a', 'Work & Education', 'The Marshall Mathers LP', 'Fastest-selling rap album in history at release; 1.76 million copies in first week.', 'point', 2000, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000013a', 'Work & Education', 'Recovery and Revival era', 'Recovery became best-selling album of 2010; Revival marked commercial return.', 'range', 2010, 2018, '#10b981'),
  ('a0000000-0000-0000-0000-00000000013a', 'Health', 'Prescription drug addiction', 'Nearly fatal overdose from methadone; spent years in recovery thereafter.', 'range', 2005, 2008, '#ef4444'),
  ('a0000000-0000-0000-0000-00000000013a', 'Relations & Family', 'Kim Scott marriages', 'Married and divorced Kim Scott twice; raised daughter Hailie and two nieces.', 'range', 1999, 2006, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000013a', 'Activities', '8 Mile film', 'Semi-autobiographical film won Oscar for Best Original Song "Lose Yourself."', 'point', 2002, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000013a', 'Assets', 'Shady Records / Aftermath', 'Co-founded Shady Records; signed and developed 50 Cent globally.', 'range', 1999, 2026, '#14b8a6');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000013b', 'Place & Travel', 'Brooklyn, New York', 'Grew up in Marcy Houses housing project in Bedford-Stuyvesant, Brooklyn.', 'range', 1969, 1995, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000013b', 'Place & Travel', 'New York / Hamptons / Tribeca', 'Expanded to luxury properties including Tribeca loft and Hamptons estate.', 'range', 2000, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000013b', 'Work & Education', 'Reasonable Doubt debut', 'Self-funded debut via Roc-A-Fella Records; now regarded as a hip-hop classic.', 'point', 1996, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000013b', 'Work & Education', 'The Blueprint album', 'Released on September 11, 2001; widely regarded as one of rap''s greatest albums.', 'point', 2001, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000013b', 'Work & Education', 'CEO of Def Jam Recordings', 'Served as president and CEO of Def Jam; signed and mentored Rihanna.', 'range', 2004, 2008, '#10b981'),
  ('a0000000-0000-0000-0000-00000000013b', 'Relations & Family', 'Married Beyoncé', 'Married Beyoncé in private ceremony; three children Blue Ivy, Rumi, and Sir.', 'range', 2008, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000013b', 'Assets', 'Armand de Brignac champagne', 'Acquired Armand de Brignac and D''Ussé cognac; LVMH later bought 50% stake.', 'range', 2006, 2026, '#14b8a6'),
  ('a0000000-0000-0000-0000-00000000013b', 'Assets', 'Roc Nation entertainment empire', 'Founded Roc Nation — label, sports agency, and touring company.', 'range', 2008, 2026, '#14b8a6'),
  ('a0000000-0000-0000-0000-00000000013b', 'Activities', 'NFL social justice partnership', 'Partnered with NFL on entertainment and social justice initiatives.', 'range', 2019, 2026, '#f59e0b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000013c', 'Place & Travel', 'Atlanta, Georgia / Chicago, Illinois', 'Born in Atlanta; raised in Chicago''s South Side by English professor mother.', 'range', 1977, 2002, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000013c', 'Place & Travel', 'Los Angeles / Paris / Wyoming', 'Lived in LA, had Paris base, bought Wyoming ranch for creative retreats.', 'range', 2002, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000013c', 'Work & Education', 'The College Dropout', 'Debut album changed rap''s sound; rejected street clichés for introspection.', 'point', 2004, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000013c', 'Work & Education', '808s & Heartbreak / MBDTF', 'Two landmark albums redefining emotional rap and maximalist production.', 'range', 2008, 2010, '#10b981'),
  ('a0000000-0000-0000-0000-00000000013c', 'Work & Education', 'Donda album', 'Delayed for over a year; multiple listening parties generated enormous press.', 'point', 2021, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000013c', 'Relations & Family', 'Married Kim Kardashian', 'Married Kim Kardashian in Florence; four children North, Saint, Chicago, Psalm.', 'range', 2014, 2022, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000013c', 'Health', 'Bipolar disorder / hospitalisation', 'Hospitalised in 2016 after public breakdown; later disclosed bipolar diagnosis.', 'point', 2016, null, '#ef4444'),
  ('a0000000-0000-0000-0000-00000000013c', 'Assets', 'Yeezy brand with Adidas', 'Yeezy footwear generated over $1.5 billion annual revenue before termination.', 'range', 2015, 2022, '#14b8a6'),
  ('a0000000-0000-0000-0000-00000000013c', 'Activities', 'Presidential campaign 2020', 'Announced and briefly ran for US President; received ~60,000 votes.', 'point', 2020, null, '#f59e0b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000013d', 'Place & Travel', 'Saint James, Trinidad', 'Born in Trinidad; emigrated to Queens, New York at age five.', 'range', 1982, 1987, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000013d', 'Place & Travel', 'Queens / Bronx / Los Angeles', 'Raised in South Jamaica, Queens; later split between New York and LA.', 'range', 1987, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000013d', 'Work & Education', 'Mixtape era breakthrough', 'Released over 70 mixtapes; Lil Wayne discovered her through Beam Me Up Scotty.', 'range', 2004, 2009, '#10b981'),
  ('a0000000-0000-0000-0000-00000000013d', 'Work & Education', 'Pink Friday debut album', 'Debut sold over 4 million copies; first female rapper to have four simultaneous Hot 100 entries.', 'point', 2010, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000013d', 'Work & Education', 'Pink Friday 2 — comeback', 'Sequel album debuted at #1; announced retirement then rescinded within days.', 'point', 2023, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000013d', 'Relations & Family', 'Married Kenneth Petty', 'Married childhood friend Kenneth Petty; son born 2020.', 'range', 2019, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000013d', 'Activities', 'American Idol / The Voice mentor', 'Served as mentor and guest judge on multiple US talent shows.', 'range', 2013, 2015, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000013d', 'Assets', 'Queen Radio on Apple Music', 'Hosted Queen Radio talk show on Apple Music Beats 1 channel.', 'range', 2018, 2022, '#14b8a6'),
  ('a0000000-0000-0000-0000-00000000013d', 'Items', 'Barbie doll collaboration', 'Released official Nicki Minaj Barbie doll; self-styled "Barbie" persona since debut.', 'point', 2011, null, '#64748b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000013e', 'Place & Travel', 'Syracuse, New York', 'Born in Syracuse; moved with family to Grapevine, Texas in early childhood.', 'range', 1995, 2013, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000013e', 'Place & Travel', 'Los Angeles / Nashville', 'Relocated to LA for music; later spent time in Nashville for country crossover work.', 'range', 2013, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000013e', 'Work & Education', 'White Iverson — viral debut', '"White Iverson" uploaded to SoundCloud and YouTube; 1M views within days.', 'point', 2015, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000013e', 'Work & Education', 'Stoney debut album', 'Debut album went 4× platinum; "Congratulations" spent 24 weeks at #1 on rap charts.', 'point', 2016, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000013e', 'Work & Education', 'beerbongs & bentleys', 'Second album broke Spotify streaming records on release day in 2018.', 'point', 2018, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000013e', 'Health', 'Sobriety journey', 'Spoke openly about cutting back on drinking; wellness changes visible in 2023.', 'point', 2023, null, '#ef4444'),
  ('a0000000-0000-0000-0000-00000000013e', 'Relations & Family', 'Son Jameson Love born', 'Son Jameson born with ex-fiancée Ashlen Diaz; co-parenting arrangement.', 'point', 2021, null, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000013e', 'Assets', 'Maison No. 9 rosé wine', 'Co-founded Maison No. 9 rosé brand; sold majority stake to Coppola Winery.', 'range', 2020, 2023, '#14b8a6'),
  ('a0000000-0000-0000-0000-00000000013e', 'Items', 'Face tattoo collection', 'Signature facial tattoos became a defining visual element of his public persona.', 'range', 2018, 2026, '#64748b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000013f', 'Place & Travel', 'Toronto, Ontario, Canada', 'Born Abel Tesfaye in Toronto; parents Ethiopian immigrants; raised by grandmother.', 'range', 1990, 2010, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000013f', 'Place & Travel', 'Los Angeles / worldwide', 'Moved between LA and Toronto; global tours across Americas, Europe, Asia.', 'range', 2012, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000013f', 'Work & Education', 'Trilogy mixtapes — anonymous debut', 'Released three mixtapes anonymously on Tumblr; produced by Illangelo and Doc McKinney.', 'range', 2011, 2012, '#10b981'),
  ('a0000000-0000-0000-0000-00000000013f', 'Work & Education', 'Beauty Behind the Madness', 'First #1 album in US; "Can''t Feel My Face" became global pop hit.', 'point', 2015, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000013f', 'Work & Education', 'After Hours / Dawn FM / Hurry Up Tomorrow', 'Trilogy of thematically linked albums exploring isolation and redemption.', 'range', 2020, 2025, '#10b981'),
  ('a0000000-0000-0000-0000-00000000013f', 'Relations & Family', 'Relationship with Bella Hadid', 'On-and-off relationship with Bella Hadid spanning several years publicly.', 'range', 2015, 2021, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000013f', 'Activities', 'Super Bowl Halftime Show', 'Headlined Super Bowl LV halftime show with elaborate staging.', 'point', 2021, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000013f', 'Assets', 'XO Records label', 'Founded XO Records; signed and developed artists including Nav and Belly.', 'range', 2012, 2026, '#14b8a6'),
  ('a0000000-0000-0000-0000-00000000013f', 'Items', 'Signature hair transformations', 'Dreadlocks, straight hair, blond — hair became part of era-defining visual shifts.', 'range', 2011, 2022, '#64748b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000140', 'Place & Travel', 'Honolulu, Hawaii', 'Born Peter Gene Hernandez in Honolulu; performed at family shows from age three.', 'range', 1985, 2003, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000140', 'Place & Travel', 'Los Angeles, California', 'Moved to LA to pursue music professionally; signed to Atlantic Records.', 'range', 2003, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000140', 'Work & Education', 'Doo-Wops & Hooligans debut', '"Just the Way You Are" reached #1 in 19 countries; debut album went 6× platinum.', 'point', 2010, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000140', 'Work & Education', 'Unorthodox Jukebox / Treasure era', '"Treasure" and "Locked Out of Heaven" topped charts worldwide.', 'range', 2012, 2014, '#10b981'),
  ('a0000000-0000-0000-0000-000000000140', 'Work & Education', 'Grammy and Super Bowl performances', 'Won six Grammys including Record of the Year; headlined Super Bowl XLVIII.', 'point', 2014, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000140', 'Work & Education', 'Silk Sonic with Anderson .Paak', '"Leave the Door Open" won Grammy for Record and Song of the Year in 2022.', 'range', 2021, 2022, '#10b981'),
  ('a0000000-0000-0000-0000-000000000140', 'Relations & Family', 'Married Jessica Caban', 'Long-term partner Jessica Caban; maintained largely private personal life.', 'range', 2011, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000140', 'Activities', 'Multi-instrumentalist performer', 'Plays drums, piano, guitar; known for energetic live performances channeling James Brown.', 'range', 1990, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000140', 'Items', 'Custom stage outfits', 'Works with designer Mark Anthony Green; iconic retro-inspired performance suits.', 'range', 2010, 2026, '#64748b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000141', 'Place & Travel', 'Holmes Chapel, Cheshire, England', 'Grew up in small village; ordinary childhood before X Factor changed everything.', 'range', 1994, 2010, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000141', 'Place & Travel', 'London / Los Angeles / New York', 'Based between London and LA; toured globally as both 1D member and solo artist.', 'range', 2010, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000141', 'Work & Education', 'One Direction (X Factor & beyond)', 'Formed on X Factor 2010; one of the best-selling boy bands ever.', 'range', 2010, 2016, '#10b981'),
  ('a0000000-0000-0000-0000-000000000141', 'Work & Education', 'Fine Line solo album', '"Watermelon Sugar" won Grammy for Best Pop Solo Performance; global hit.', 'point', 2019, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000141', 'Work & Education', 'Harry''s House album', 'Won Grammy for Album of the Year 2023; sold-out Love On Tour grossed $600M+.', 'point', 2022, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000141', 'Relations & Family', 'Relationship with Olivia Wilde', 'Dated director Olivia Wilde during filming of Don''t Worry Darling.', 'range', 2021, 2022, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000141', 'Activities', 'Acting — Don''t Worry Darling', 'Led role opposite Florence Pugh in Olivia Wilde-directed psychological thriller.', 'point', 2022, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000141', 'Items', 'Pleasing beauty brand', 'Launched gender-neutral nail polish and skincare brand Pleasing in 2021.', 'point', 2021, null, '#64748b'),
  ('a0000000-0000-0000-0000-000000000141', 'Activities', 'Fashion icon & Vogue covers', 'Wore feminine fashion on Vogue covers; shifted mainstream views on male style.', 'range', 2020, 2024, '#f59e0b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000142', 'Place & Travel', 'London, England (born in Kosovo)', 'Born in London to Albanian Kosovar parents; grew up in Hammersmith.', 'range', 1995, 2014, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000142', 'Place & Travel', 'London / Los Angeles', 'Maintained London base while spending time in LA for recordings and press.', 'range', 2015, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000142', 'Work & Education', 'New Rules — breakthrough single', '"New Rules" reached #1 in the UK; first breakthrough into global markets.', 'point', 2017, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000142', 'Work & Education', 'Future Nostalgia album', 'Grammy-winning album blended 80s disco-pop; praised as one of 2020''s best albums.', 'point', 2020, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000142', 'Work & Education', 'Radical Optimism album', 'Fourth album debuted at #1 in the UK; continued disco-pop sound evolution.', 'point', 2024, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000142', 'Relations & Family', 'Married Anwar Hadid', 'Dated Anwar Hadid publicly from 2019; split in 2021 but co-parent a daughter.', 'range', 2019, 2021, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000142', 'Activities', 'UNICEF ambassador', 'Named UNICEF UK ambassador; advocated for children''s rights in conflict zones.', 'range', 2020, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000142', 'Assets', 'Warner Records deal', 'Signed major deal with Warner Records; significant advance for debut LP.', 'point', 2017, null, '#14b8a6'),
  ('a0000000-0000-0000-0000-000000000142', 'Items', 'Yves Saint Laurent brand ambassador', 'Appointed YSL Beauty global brand ambassador in 2021.', 'point', 2021, null, '#64748b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000143', 'Place & Travel', 'London / Exeter, England', 'Born in London; grew up in Exeter; formed Coldplay at University College London.', 'range', 1977, 1996, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000143', 'Place & Travel', 'London (recording & family base)', 'Settled in North London; used it as base between global tours.', 'range', 1998, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000143', 'Work & Education', 'University College London', 'Studied Greek and Latin; formed Coldplay with Guy Berryman, Jon Buckland, Will Champion.', 'range', 1996, 1999, '#10b981'),
  ('a0000000-0000-0000-0000-000000000143', 'Work & Education', 'Parachutes & A Rush of Blood to the Head', 'Debut and second albums established Coldplay as global arena rock act.', 'range', 2000, 2003, '#10b981'),
  ('a0000000-0000-0000-0000-000000000143', 'Work & Education', 'Music of the Spheres world tour', 'One of the highest-grossing tours ever; focused on carbon-neutral concert practices.', 'range', 2022, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-000000000143', 'Relations & Family', 'Married Gwyneth Paltrow', 'Married Gwyneth Paltrow; "consciously uncoupled" in 2014; two children Apple and Moses.', 'range', 2003, 2014, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000143', 'Relations & Family', 'Relationship with Dakota Johnson', 'In a long-term relationship with actress Dakota Johnson from 2017.', 'range', 2017, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000143', 'Activities', 'Sustainability / eco concerts', 'LED wristbands, kinetic dance floors, and biofuel vehicles used on tour.', 'range', 2022, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000143', 'Items', 'Grammy-winning albums', 'Won Grammy for Best Alternative Album (Clocks era); multiple nominations.', 'point', 2003, null, '#64748b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000144', 'Place & Travel', 'Dublin, Ireland', 'Born and raised in Dublin''s Artane; U2 formed at Mount Temple Comprehensive School.', 'range', 1960, 1980, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000144', 'Place & Travel', 'Dublin / Killiney estate', 'Maintained base in Killiney, South Dublin, described as Ireland''s Beverly Hills.', 'range', 1980, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000144', 'Work & Education', 'The Joshua Tree album', 'One of the best-selling albums ever; first to debut at #1 in the US and UK simultaneously.', 'point', 1987, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000144', 'Work & Education', 'Achtung Baby & Zoo TV Tour', 'Reinvented U2''s image with irony and postmodernism; revolutionary staging.', 'range', 1991, 1993, '#10b981'),
  ('a0000000-0000-0000-0000-000000000144', 'Work & Education', '360° Tour — record-breaking gross', 'The 360° Tour grossed over $736 million; most attended tour in history at the time.', 'range', 2009, 2011, '#10b981'),
  ('a0000000-0000-0000-0000-000000000144', 'Relations & Family', 'Married Alison Stewart', 'Married childhood sweetheart Alison "Ali" Stewart; four children together.', 'range', 1982, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000144', 'Activities', 'ONE Campaign & Live 8', 'Co-founded ONE Campaign to fight global poverty; performed at Live 8 concert.', 'range', 2004, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000144', 'Activities', 'Nobel Peace Prize nomination', 'Repeatedly nominated for Nobel Peace Prize for humanitarian work.', 'range', 2006, 2012, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000144', 'Assets', 'Elevation Partners investment firm', 'Co-founded Elevation Partners; early investor in Facebook and Forbes Media.', 'range', 2004, 2014, '#14b8a6');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000145', 'Place & Travel', 'Wellingborough, England', 'Born in Wellingborough, Northamptonshire; family moved to Oxford in childhood.', 'range', 1968, 1985, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000145', 'Place & Travel', 'Oxford / London / Devon', 'Lived in Oxford during Radiohead years; later settled in rural Devon.', 'range', 1985, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000145', 'Work & Education', 'Pablo Honey & The Bends', 'Early Radiohead albums established band as UK indie rock favourites.', 'range', 1993, 1995, '#10b981'),
  ('a0000000-0000-0000-0000-000000000145', 'Work & Education', 'OK Computer — landmark album', 'Widely voted greatest album ever in multiple polls; Grammy for Best Alternative Album.', 'point', 1997, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000145', 'Work & Education', 'Kid A and electronic evolution', 'Abandoned guitars for electronics; Kid A debuted at #1 in the US and UK.', 'range', 2000, 2003, '#10b981'),
  ('a0000000-0000-0000-0000-000000000145', 'Work & Education', 'The Eraser & TKOL solo work', 'Solo and Atoms for Peace project; continued experimental electronic music.', 'range', 2006, 2014, '#10b981'),
  ('a0000000-0000-0000-0000-000000000145', 'Relations & Family', 'Partner Rachel Owen', 'Long-term partner Rachel Owen; two children together before her death in 2016.', 'range', 1990, 2016, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000145', 'Activities', 'Climate change activism', 'Vocal climate advocate; performed at and helped organise environmental fundraisers.', 'range', 2000, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000145', 'Items', 'Jonny Greenwood collaboration', 'Longstanding creative partnership with guitarist Jonny Greenwood, spanning all Radiohead albums.', 'range', 1985, 2023, '#64748b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000146', 'Place & Travel', 'Newark, New Jersey', 'Born in Newark; grew up in a family steeped in gospel — mother Cissy Houston sang with Elvis.', 'range', 1963, 1983, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000146', 'Place & Travel', 'New Jersey / Los Angeles', 'Based in New Jersey throughout career; recorded in LA studios; died in Beverly Hills hotel.', 'range', 1983, 2012, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000146', 'Work & Education', 'Whitney Houston debut album', 'Debut became one of the best-selling debut albums ever; launched global stardom.', 'point', 1985, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000146', 'Work & Education', 'The Bodyguard soundtrack', '"I Will Always Love You" sold over 20 million copies; still the best-selling soundtrack album.', 'point', 1992, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000146', 'Work & Education', 'Grammy & Emmy achievements', 'Won six Grammys, two Emmys, thirty Billboard Music Awards — one of the most awarded artists.', 'range', 1986, 2000, '#10b981'),
  ('a0000000-0000-0000-0000-000000000146', 'Relations & Family', 'Married Bobby Brown', 'Married R&B singer Bobby Brown; tumultuous marriage ended in divorce in 2007.', 'range', 1992, 2007, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000146', 'Health', 'Drug addiction & decline', 'Substance abuse with Bobby Brown widely documented; affected voice and career.', 'range', 1996, 2009, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000146', 'Health', 'Death at Beverly Hilton', 'Found deceased in hotel bathtub; coronary artery disease and cocaine cited as causes.', 'point', 2012, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000146', 'Items', 'Iconic "Star-Spangled Banner"', '1991 Super Bowl national anthem performance widely cited as the greatest ever recorded.', 'point', 1991, null, '#64748b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000147', 'Place & Travel', 'Huntington, New York', 'Born in Huntington; raised partly in Compton, California; mixed Irish-Venezuelan heritage.', 'range', 1969, 1990, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000147', 'Place & Travel', 'New York / Los Angeles / Bahamas', 'Maintained homes on both US coasts and in the Bahamas.', 'range', 1990, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000147', 'Work & Education', 'Mariah Carey debut album', 'Debut produced five consecutive #1 singles — unprecedented for a debut.', 'point', 1990, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000147', 'Work & Education', 'Daydream & Hero era', '"Fantasy" debuted at #1 — first female artist to achieve that; Hero became anthem.', 'range', 1995, 1996, '#10b981'),
  ('a0000000-0000-0000-0000-000000000147', 'Work & Education', 'Merry Christmas & all I Want', '"All I Want for Christmas Is You" is the best-selling holiday single of all time.', 'point', 1994, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000147', 'Work & Education', 'E=MC² comeback', 'Career renaissance after Glitter failure; produced #1 single "We Belong Together."', 'point', 2005, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000147', 'Relations & Family', 'Married Tommy Mottola', 'Married Sony Music boss Tommy Mottola; described relationship as controlling.', 'range', 1993, 1998, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000147', 'Relations & Family', 'Twins Moroccan and Monroe born', 'Twins born with Nick Cannon; named Moroccan (after her apartment) and Monroe.', 'point', 2011, null, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000147', 'Health', 'Emotional breakdown & hospitalisation', 'Publicly broke down in 2001 during TRL appearance; hospitalised for exhaustion.', 'point', 2001, null, '#ef4444');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000148', 'Place & Travel', 'Charlemagne, Quebec, Canada', 'Born into a large French-Canadian family of 14 children; poor rural upbringing.', 'range', 1968, 1988, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000148', 'Place & Travel', 'Montreal / Las Vegas (Caesars Palace)', 'Built Las Vegas residency base; primary residence in Montreal suburbs.', 'range', 1988, 2014, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000148', 'Place & Travel', 'Jupiter Island, Florida', 'Moved to luxury compound in Jupiter Island, Florida after husband''s death.', 'range', 2016, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000148', 'Work & Education', 'Eurovision Song Contest winner', 'Won Eurovision 1988 representing Switzerland; launched international career.', 'point', 1988, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000148', 'Work & Education', 'My Heart Will Go On — Titanic', 'Titanic theme became best-selling single by a Canadian artist; won Oscar and Grammy.', 'point', 1997, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000148', 'Work & Education', 'A New Day Las Vegas residency', 'Caesars Palace residency ran from 2003–2007; 723 shows, $385 million gross.', 'range', 2003, 2007, '#10b981'),
  ('a0000000-0000-0000-0000-000000000148', 'Relations & Family', 'Married René Angélil', 'Married manager René Angélil, 26 years her senior; three sons together.', 'range', 1994, 2016, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000148', 'Health', 'Stiff-person syndrome diagnosis', 'Rare neurological condition stiff-person syndrome forced extended break from performing.', 'point', 2022, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000148', 'Activities', 'Paris Olympics opening ceremony', 'Performed "Hymne à l''amour" at Paris 2024 Olympics opening atop the Eiffel Tower.', 'point', 2024, null, '#f59e0b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000149', 'Place & Travel', 'Kentwood, Louisiana', 'Born in McComb MS; raised in Kentwood LA; performed in church and dance from childhood.', 'range', 1981, 1993, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000149', 'Place & Travel', 'Orlando, Florida — MMC', 'Joined The Mickey Mouse Club at age 11 alongside future pop stars.', 'range', 1993, 1994, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000149', 'Place & Travel', 'Los Angeles / New York', 'Career centred in LA; conservatorship and legal proceedings tied her to the city.', 'range', 1998, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000149', 'Work & Education', '...Baby One More Time debut', 'Debut single broke records; album sold over 25 million copies worldwide.', 'point', 1998, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000149', 'Work & Education', 'Blackout album', 'Produced during public breakdown; later re-evaluated as ahead of its time.', 'point', 2007, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000149', 'Work & Education', 'Piece of Me Las Vegas residency', 'Multi-year Vegas residency 2013–2017 grossed over $137 million.', 'range', 2013, 2017, '#10b981'),
  ('a0000000-0000-0000-0000-000000000149', 'Health', 'Conservatorship and breakdown', 'Placed under father Jamie Spears'' conservatorship following 2007–08 breakdown; ended 2021.', 'range', 2008, 2021, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000149', 'Relations & Family', 'Married Kevin Federline', 'Married dancer Kevin Federline; two sons Sean Preston and Jayden James.', 'range', 2004, 2007, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000149', 'Items', 'Iconic shaved head moment', 'Shaved head at a Tarzana salon in 2007; became one of the decade''s defining tabloid images.', 'point', 2007, null, '#64748b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000014a', 'Place & Travel', 'Staten Island, NY / Pittsburgh, PA', 'Born in Staten Island; moved to Pittsburgh then Orlando for performing career.', 'range', 1980, 1992, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000014a', 'Place & Travel', 'Los Angeles, California', 'Relocated to LA after MMC; built career as major recording artist.', 'range', 1999, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000014a', 'Work & Education', 'Mickey Mouse Club', 'Performed on MMC alongside Britney Spears, Justin Timberlake, and Ryan Gosling.', 'range', 1992, 1994, '#10b981'),
  ('a0000000-0000-0000-0000-00000000014a', 'Work & Education', 'Debut album — Genie in a Bottle', 'Debut single #1 globally; won Grammy for Best New Artist 2000.', 'point', 1999, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000014a', 'Work & Education', 'Stripped — Beautiful era', 'Mature artistic reinvention; "Beautiful" became an enduring pop anthem.', 'point', 2002, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000014a', 'Work & Education', 'The Voice coach', 'Original coach on NBC''s The Voice; appeared in multiple seasons from 2011.', 'range', 2011, 2021, '#10b981'),
  ('a0000000-0000-0000-0000-00000000014a', 'Relations & Family', 'Married Jordan Bratman', 'Married music marketer Jordan Bratman 2005; son Max Liron born; divorced 2011.', 'range', 2005, 2011, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000014a', 'Activities', 'Acting in Burlesque', 'Starred alongside Cher in Burlesque (2010); praised for vocal performances.', 'point', 2010, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000014a', 'Health', 'Body image advocacy', 'Publicly challenged Hollywood beauty standards; wrote about body confidence over career.', 'range', 2002, 2015, '#ef4444');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000014b', 'Place & Travel', 'West Palm Beach, Florida', 'Born Alexander James McLean in West Palm Beach; parents divorced early.', 'range', 1978, 1992, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000014b', 'Place & Travel', 'Orlando, Florida / Los Angeles', 'Moved to Orlando for auditions; later based in LA with Backstreet Boys.', 'range', 1992, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000014b', 'Work & Education', 'Backstreet Boys formation', 'BSB formed in Orlando 1993; AJ was a founding member and lead vocalist.', 'point', 1993, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000014b', 'Work & Education', 'Millennium album', 'Sold 40 million copies; one of the best-selling albums of all time.', 'point', 1999, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000014b', 'Work & Education', 'BSB DNA album & world tour', 'DNA album and tour marked major commercial comeback; Grammy nomination.', 'range', 2019, 2023, '#10b981'),
  ('a0000000-0000-0000-0000-00000000014b', 'Health', 'Alcohol & drug rehabilitation', 'Checked into rehab multiple times; first publicly in 2001 before Black & Blue tour.', 'range', 2001, 2011, '#ef4444'),
  ('a0000000-0000-0000-0000-00000000014b', 'Relations & Family', 'Married Rochelle Karidis', 'Married Rochelle Karidis 2011; daughter Ava Jaymes born; stable family life.', 'range', 2011, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000014b', 'Activities', 'Solo album Have It All', 'Released debut solo album Have It All in 2010 during BSB hiatus.', 'point', 2010, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000014b', 'Items', 'Extensive tattoo collection', 'Over 30 tattoos; one of the most visually distinctive members of the Backstreet Boys.', 'range', 1996, 2026, '#64748b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000014c', 'Place & Travel', 'Memphis, Tennessee', 'Born in Memphis; parents divorced; moved between Memphis and Millington.', 'range', 1981, 1993, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000014c', 'Place & Travel', 'Orlando (MMC) / Los Angeles', 'Joined MMC at 12; later based in LA as NSYNC and solo career took off.', 'range', 1993, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000014c', 'Work & Education', 'NSYNC — No Strings Attached', 'Sold 2.4 million copies in first week — US record at the time.', 'point', 2000, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000014c', 'Work & Education', 'FutureSex/LoveSounds', 'Second solo album with Timbaland; "SexyBack" redefined pop and R&B.', 'point', 2006, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000014c', 'Work & Education', 'Man of the Woods / Everything I Thought', 'Americana album 2018; won Grammy for Best Pop Vocal Album for Trolls song.', 'range', 2018, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-00000000014c', 'Relations & Family', 'Married Jessica Biel', 'Married actress Jessica Biel 2012; two sons Silas and Phineas.', 'range', 2012, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000014c', 'Activities', 'Acting career', 'Notable roles in The Social Network, Friends with Benefits, and Palmer.', 'range', 2006, 2021, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000014c', 'Assets', 'Sauza 901 tequila brand', 'Co-founded Sauza 901 tequila; later sold brand to Sauza parent company.', 'range', 2009, 2014, '#14b8a6'),
  ('a0000000-0000-0000-0000-00000000014c', 'Activities', 'Super Bowl halftime show', 'Headlined Super Bowl 2024 halftime; sparked discussion amid #FreeBritney movement fallout.', 'point', 2024, null, '#f59e0b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000014d', 'Place & Travel', 'Harlow, Essex, England', 'Born Victoria Adams in Harlow; grew up in South Woodham Ferrers.', 'range', 1974, 1994, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000014d', 'Place & Travel', 'London / Madrid / Miami', 'Settled in London, then Madrid with David Beckham; relocated to Miami after MLS move.', 'range', 1999, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000014d', 'Work & Education', 'Spice Girls — Wannabe', '"Wannabe" hit #1 in 37 countries; Spice Girls became best-selling female group ever.', 'range', 1996, 2000, '#10b981'),
  ('a0000000-0000-0000-0000-00000000014d', 'Work & Education', 'Victoria Beckham fashion label', 'Launched eponymous label in 2008; gained genuine critical respect in the industry.', 'range', 2008, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-00000000014d', 'Work & Education', 'Spice Girls reunion Spice World tour', 'Reunion tour without Victoria grossed over £70 million in 2019.', 'point', 2019, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000014d', 'Relations & Family', 'Married David Beckham', 'Married footballer David Beckham 1999; four children Brooklyn, Romeo, Cruz, Harper.', 'range', 1999, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000014d', 'Assets', 'Victoria Beckham Beauty', 'Launched VB Beauty skincare and make-up range in 2019.', 'range', 2019, 2026, '#14b8a6'),
  ('a0000000-0000-0000-0000-00000000014d', 'Items', 'Hermès Birkin collection', 'Reported to own one of the world''s largest private Hermès Birkin collections.', 'range', 2002, 2026, '#64748b'),
  ('a0000000-0000-0000-0000-00000000014d', 'Activities', 'CFDA Fashion Icon award', 'Received CFDA Fashion Icon award 2016; marked full recognition as a designer.', 'point', 2016, null, '#f59e0b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000014e', 'Place & Travel', 'Barranquilla, Colombia', 'Born and raised in Barranquilla; began belly dancing and performing from age 8.', 'range', 1977, 2000, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000014e', 'Place & Travel', 'Miami / Barcelona / Nassau', 'Split between Miami, Barcelona (with Piqué), and Nassau estate over the years.', 'range', 2000, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000014e', 'Work & Education', 'Laundry Service — English crossover', '"Whenever, Wherever" introduced Shakira to English-speaking audiences globally.', 'point', 2001, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000014e', 'Work & Education', 'Waka Waka — FIFA World Cup anthem', '"Waka Waka" became the best-selling FIFA World Cup song of all time.', 'point', 2010, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000014e', 'Work & Education', 'Super Bowl LIV halftime show', 'Co-headlined with Jennifer Lopez; landmark moment for Latin pop visibility.', 'point', 2020, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000014e', 'Relations & Family', 'Partnership with Gerard Piqué', 'Eleven-year relationship with footballer Gerard Piqué; sons Milan and Sasha.', 'range', 2011, 2022, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000014e', 'Health', 'Vocal cord haemorrhage surgery', 'Underwent surgery for vocal cord haemorrhage that threatened to end career.', 'point', 1997, null, '#ef4444'),
  ('a0000000-0000-0000-0000-00000000014e', 'Assets', 'Spanish tax fraud settlement', 'Settled €7.3M tax fraud case with Spanish prosecutors; suspended prison sentence.', 'point', 2023, null, '#14b8a6'),
  ('a0000000-0000-0000-0000-00000000014e', 'Activities', 'Belly dancing as artistic signature', 'Signature belly dancing incorporated into all world tours; deeply tied to Colombian identity.', 'range', 1995, 2026, '#f59e0b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000014f', 'Place & Travel', 'The Bronx, New York', 'Born Jennifer Lynn Lopez in Castle Hill, The Bronx; Puerto Rican parents.', 'range', 1969, 1990, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000014f', 'Place & Travel', 'Los Angeles / Miami / New York', 'Maintained multiple city homes throughout her film, music, and TV career.', 'range', 1990, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000014f', 'Work & Education', 'Selena biopic acting breakthrough', 'First Latina to earn over $1M for a film; launched mainstream Hollywood career.', 'point', 1997, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000014f', 'Work & Education', 'On the 6 debut album', '"If You Had My Love" debuted at #1; first artist with simultaneous #1 album and film.', 'point', 1999, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000014f', 'Work & Education', 'Hustlers — Oscar buzz', 'Critically praised in Hustlers; notable Oscar snub generated widespread headlines.', 'point', 2019, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000014f', 'Relations & Family', 'Married Marc Anthony', 'Married Marc Anthony 2004; twins Emme and Maximilian born 2008; divorced 2014.', 'range', 2004, 2014, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000014f', 'Relations & Family', 'Married Ben Affleck', 'Reunited with and married Ben Affleck two decades after original engagement.', 'range', 2022, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000014f', 'Activities', 'Super Bowl LIV halftime show', 'Co-headlined with Shakira; iconic pole sequence and political imagery made headlines.', 'point', 2020, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000014f', 'Assets', 'JLo Beauty & fragrance empire', 'Fragrance line since 2002; JLo Beauty skincare launched 2021; major commercial success.', 'range', 2002, 2026, '#14b8a6');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000150', 'Place & Travel', 'Madrid, Spain', 'Born Enrique Miguel Iglesias Preysler in Madrid; son of Julio Iglesias.', 'range', 1975, 1995, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000150', 'Place & Travel', 'Miami, Florida', 'Moved to Miami secretly to record debut album without father''s knowledge.', 'range', 1995, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000150', 'Work & Education', 'Spanish-language debut albums', 'Debut sold 2M+ copies; won Grammy for Best Latin Pop Album.', 'range', 1995, 1998, '#10b981'),
  ('a0000000-0000-0000-0000-000000000150', 'Work & Education', 'Bailamos — English crossover', '"Bailamos" written for Wild Wild West reached #1 in the US.', 'point', 1999, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000150', 'Work & Education', 'Hero and Escape album', '"Hero" became a post-9/11 anthem; Escape sold over 15 million copies.', 'range', 2001, 2003, '#10b981'),
  ('a0000000-0000-0000-0000-000000000150', 'Work & Education', 'Tonight and bilingual hits era', '"I Like It" and "Tonight" dominated Latin and pop charts simultaneously.', 'range', 2010, 2014, '#10b981'),
  ('a0000000-0000-0000-0000-000000000150', 'Relations & Family', 'Partner Anna Kournikova', 'Long-term relationship with tennis star Anna Kournikova; three children together.', 'range', 2001, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000150', 'Health', 'Benign vocal cord tumour', 'Treated benign vocal tumour; doctors noted it gave his voice its distinctive tremor.', 'point', 2003, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000150', 'Activities', 'Global touring — Guinness records', 'Among the most successful Latin touring artists; multiple sold-out world tours.', 'range', 1997, 2020, '#f59e0b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000151', 'Place & Travel', 'Santurce, Puerto Rico', 'Born Ramón Luis Ayala Rodríguez in San Juan; grew up in Villa Kennedy housing.', 'range', 1977, 2004, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000151', 'Place & Travel', 'San Juan & global touring', 'Remained Puerto Rico-based while touring the Americas and Europe extensively.', 'range', 2004, 2022, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000151', 'Work & Education', 'Reggaeton underground pioneer', 'Key figure in developing underground Puerto Rican reggaeton in the late 1990s.', 'range', 1994, 2004, '#10b981'),
  ('a0000000-0000-0000-0000-000000000151', 'Work & Education', 'Gasolina — global breakthrough', '"Gasolina" was the first reggaeton song to reach mainstream global radio play.', 'point', 2004, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000151', 'Work & Education', 'Barrio Fino album', 'Best-selling Latin album of 2004 and 2005; credited with globalising reggaeton.', 'point', 2004, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000151', 'Work & Education', 'Despacito co-writer', 'Co-wrote "Despacito"; remix with Justin Bieber became one of history''s most-streamed songs.', 'point', 2017, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000151', 'Work & Education', 'Legendaddy and retirement', 'Announced retirement from music in 2022 after releasing final album Legendaddy.', 'point', 2022, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000151', 'Assets', 'El Cartel Records label', 'Founded El Cartel Records; helped launch reggaeton artists globally.', 'range', 2005, 2022, '#14b8a6'),
  ('a0000000-0000-0000-0000-000000000151', 'Activities', 'Puerto Rico community investment', 'Maintained close family ties; donated to Puerto Rico schools and communities.', 'range', 2000, 2022, '#f59e0b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000152', 'Place & Travel', 'Vega Baja, Puerto Rico', 'Born Benito Antonio Martínez Ocasio in Vega Baja; modest upbringing.', 'range', 1994, 2016, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000152', 'Place & Travel', 'San Juan / Los Angeles / worldwide', 'Global ambassador for Puerto Rican culture; homes in LA and Puerto Rico.', 'range', 2016, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000152', 'Work & Education', 'Soy Peor — SoundCloud debut', 'Went viral on SoundCloud without label backing; launched career organically.', 'point', 2016, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000152', 'Work & Education', 'X 100pre debut album', 'First studio album debuted at #1 on Billboard Latin; Grammy-nominated.', 'point', 2018, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000152', 'Work & Education', 'YHLQMDLG — first all-Spanish Billboard #1', 'First all-Spanish album to debut at #1 on US Billboard 200.', 'point', 2020, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000152', 'Work & Education', 'Un Verano Sin Ti', 'Won Grammy for Best Música Urbana Album; sparked global Latin trap wave.', 'point', 2022, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000152', 'Relations & Family', 'Relationship with Kendall Jenner', 'Briefly dated model Kendall Jenner; relationship reported through 2023–2024.', 'range', 2023, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000152', 'Activities', 'Puerto Rico hurricane relief', 'Donated millions and organised aid for Puerto Rico after Hurricane Maria in 2017.', 'point', 2017, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000152', 'Items', 'Distinctive fashion and visual style', 'Known for bold genre-defying fashion blending streetwear and high fashion.', 'range', 2018, 2026, '#64748b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000153', 'Place & Travel', 'Medellín, Colombia', 'Born José Álvaro Osorio Balvín in Medellín; grew up in a working-class neighbourhood.', 'range', 1985, 2011, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000153', 'Place & Travel', 'Miami / Paris / Medellín', 'Based across Miami and Europe; Medellín remained spiritual home and brand symbol.', 'range', 2011, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000153', 'Work & Education', 'Ginza — Latin breakthrough', '"Ginza" hit #1 in Latin markets; introduced J Balvin to mainstream global audiences.', 'point', 2015, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000153', 'Work & Education', 'Mi Gente — 58-country #1', '"Mi Gente" reached #1 in 58 countries; Beyoncé remix amplified global reach.', 'point', 2017, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000153', 'Work & Education', 'Colores concept album', 'Each song named for a colour; praised for artistic ambition and visual identity.', 'point', 2020, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000153', 'Work & Education', 'Coachella headliner', 'First Latin artist to headline Coachella main stage in the festival''s history.', 'point', 2019, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000153', 'Relations & Family', 'Son Rio born', 'Son Rio born with Argentine model and actress Valentina Ferrer in 2021.', 'point', 2021, null, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000153', 'Health', 'Depression and mental health advocacy', 'Spoke openly about severe depression; became Latin America''s leading mental health voice.', 'point', 2019, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000153', 'Items', 'Jordan Brand sneaker collaboration', 'Collaborated with Nike Jordan Brand on limited edition Air Jordan 1 sneakers.', 'point', 2020, null, '#64748b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000154', 'Place & Travel', 'Ilsan, South Korea', 'Born Kim Namjoon in Ilsan, Gyeonggi-do; moved to Seoul for education and career.', 'range', 1994, 2013, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000154', 'Place & Travel', 'Seoul / global touring', 'Based in Seoul with BTS; world tours across Asia, Americas, Europe, and Australia.', 'range', 2013, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000154', 'Work & Education', 'BTS debut under Big Hit', 'Debuted with BTS in 2013; RM was the first member signed to Big Hit Entertainment.', 'point', 2013, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000154', 'Work & Education', 'Love Yourself era', '"Dynamite" and "Butter" debuted at #1 on Billboard Hot 100 — historic K-pop firsts.', 'range', 2017, 2021, '#10b981'),
  ('a0000000-0000-0000-0000-000000000154', 'Work & Education', 'Solo album Indigo', 'Introspective art-pop debut album Indigo released; features global collaborators.', 'point', 2022, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000154', 'Work & Education', 'Military service', 'Enlisted in South Korean military 2023 as required by law; expected return 2025.', 'range', 2023, 2025, '#10b981'),
  ('a0000000-0000-0000-0000-000000000154', 'Activities', 'UN General Assembly speech', 'Delivered UNICEF-related speech at the UN; became global face of Korean soft power.', 'point', 2018, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000154', 'Activities', 'Art collecting & museum advocacy', 'Avid art collector; donated works and partnered with the National Museum of Korea.', 'range', 2018, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000154', 'Health', 'LOVE MYSELF — UNICEF campaign', 'Co-led LOVE MYSELF anti-violence campaign with UNICEF; raised over $3 million.', 'range', 2017, 2021, '#ef4444');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000155', 'Place & Travel', 'Concord, California', 'Born Thomas Jeffrey Hanks in Concord; parents divorced when he was 5; moved often.', 'range', 1956, 1978, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000155', 'Place & Travel', 'Los Angeles, California', 'Moved to LA after landing Bosom Buddies; built career in Hollywood.', 'range', 1978, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000155', 'Work & Education', 'Big and Punchline — comedy breakthrough', 'Big (1988) earned first Oscar nomination; established him as a box office draw.', 'point', 1988, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000155', 'Work & Education', 'Philadelphia and Forrest Gump', 'Won back-to-back Best Actor Oscars — first actor to do so since Spencer Tracy.', 'range', 1993, 1994, '#10b981'),
  ('a0000000-0000-0000-0000-000000000155', 'Work & Education', 'Saving Private Ryan, Cast Away, Road to Perdition', 'String of acclaimed serious dramas cementing status as Hollywood''s most trusted actor.', 'range', 1998, 2002, '#10b981'),
  ('a0000000-0000-0000-0000-000000000155', 'Work & Education', 'Pinocchio and later career', 'Voice work and character roles in later career; honoured with Presidential Medal of Freedom.', 'range', 2015, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-000000000155', 'Relations & Family', 'Married Rita Wilson', 'Married actress Rita Wilson in 1988; two sons Chet and Truman together.', 'range', 1988, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000155', 'Health', 'Type 2 diabetes diagnosis', 'Disclosed Type 2 diabetes diagnosis in 2013; attributed it to weight fluctuations for roles.', 'point', 2013, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000155', 'Activities', 'WWII memorial and veterans advocacy', 'Longtime advocate for WWII veterans; helped fund and promote the WWII Memorial in DC.', 'range', 1998, 2020, '#f59e0b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000156', 'Place & Travel', 'Summit, New Jersey', 'Born Mary Louise Streep in Summit; grew up in Bernardsville, New Jersey.', 'range', 1949, 1971, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000156', 'Place & Travel', 'New York City / Connecticut', 'Based in NYC and rural Connecticut throughout film and stage career.', 'range', 1971, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000156', 'Work & Education', 'Vassar College and Yale Drama', 'BA from Vassar; MFA from Yale School of Drama; stage career in NY followed.', 'range', 1967, 1975, '#10b981'),
  ('a0000000-0000-0000-0000-000000000156', 'Work & Education', 'Kramer vs. Kramer and Sophie''s Choice', 'Won two early Oscars in four years; established as the greatest actress of her generation.', 'range', 1979, 1982, '#10b981'),
  ('a0000000-0000-0000-0000-000000000156', 'Work & Education', 'The Devil Wears Prada and Doubt', 'Career renaissance in 2000s; third Oscar for The Iron Lady; 21 nominations total.', 'range', 2006, 2012, '#10b981'),
  ('a0000000-0000-0000-0000-000000000156', 'Work & Education', 'The Iron Lady — third Oscar', 'Won Best Actress for playing Margaret Thatcher; most Academy Award wins in history.', 'point', 2011, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000156', 'Relations & Family', 'Married Don Gummer', 'Married sculptor Don Gummer in 1978; four children; marriage of over 45 years.', 'range', 1978, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000156', 'Activities', 'Political advocacy', 'Outspoken liberal activist; speeches at Golden Globes and women''s marches went viral.', 'range', 2000, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000156', 'Items', 'Record 21 Oscar nominations', 'Holds the all-time record for most Academy Award nominations for any actor.', 'range', 1978, 2023, '#64748b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000157', 'Place & Travel', 'Los Angeles, California', 'Born and raised in LA; parents split when young; moved between parents'' homes.', 'range', 1974, 1990, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000157', 'Place & Travel', 'Los Angeles / New York / worldwide', 'LA-based career with extensive global travel for filming and environmental work.', 'range', 1990, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000157', 'Work & Education', 'What''s Eating Gilbert Grape', 'First Oscar nomination at age 19; considered one of history''s greatest debut performances.', 'point', 1993, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000157', 'Work & Education', 'Titanic — global superstardom', 'Titanic was highest-grossing film ever at time; DiCaprio became the biggest movie star.', 'point', 1997, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000157', 'Work & Education', 'The Aviator, Gangs of NY, Blood Diamond', 'Four Oscar nominations without a win; sustained critical acclaim across decades.', 'range', 2002, 2013, '#10b981'),
  ('a0000000-0000-0000-0000-000000000157', 'Work & Education', 'The Revenant — first Oscar win', 'Won Best Actor for The Revenant (2015); accepted by invoking climate change.', 'point', 2015, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000157', 'Activities', 'Leonardo DiCaprio Foundation', 'Founded environmental foundation in 1998; donated over $100M to climate causes.', 'range', 1998, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000157', 'Assets', 'Private island Blackadore Caye', 'Purchased private island in Belize with plans for eco-resort development.', 'range', 2005, 2026, '#14b8a6'),
  ('a0000000-0000-0000-0000-000000000157', 'Relations & Family', 'Series of model relationships', 'Long-term relationships with Gisele Bündchen, Bar Refaeli, and Camila Morrone.', 'range', 2000, 2022, '#ec4899');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000158', 'Place & Travel', 'Shawnee, Oklahoma', 'Born William Bradley Pitt in Shawnee; grew up in Springfield, Missouri.', 'range', 1963, 1986, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000158', 'Place & Travel', 'Los Angeles, California', 'Dropped out of Missouri to pursue acting in LA; slept in car early on.', 'range', 1986, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000158', 'Work & Education', 'Thelma & Louise — star-making role', 'Small but iconic breakout role as the hitchhiker J.D.; launched his career overnight.', 'point', 1991, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000158', 'Work & Education', 'Se7en, Fight Club, Snatch', 'Series of defining roles in critically and commercially successful films.', 'range', 1995, 2000, '#10b981'),
  ('a0000000-0000-0000-0000-000000000158', 'Work & Education', 'Babel and The Curious Case of Benjamin Button', 'Multiple Oscar nominations; Inglourious Basterds won him Supporting Actor Oscar.', 'range', 2006, 2012, '#10b981'),
  ('a0000000-0000-0000-0000-000000000158', 'Work & Education', 'Once Upon a Time in Hollywood — Oscar win', 'Won Best Supporting Actor at the Oscars and Golden Globes.', 'point', 2019, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000158', 'Relations & Family', 'Married Jennifer Aniston', 'Married Jennifer Aniston in 2000; divorced in 2005 following Angelina Jolie affair.', 'range', 2000, 2005, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000158', 'Relations & Family', 'Married Angelina Jolie', 'Married Angelina Jolie 2014; six children; separated 2016 following plane incident.', 'range', 2014, 2019, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000158', 'Assets', 'Plan B Entertainment', 'Founded Plan B Entertainment; produced 12 Years a Slave (Best Picture Oscar 2014).', 'range', 2001, 2026, '#14b8a6');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000159', 'Place & Travel', 'Los Angeles, California', 'Born Angelina Jolie Voight in LA; parents divorced when she was a toddler.', 'range', 1975, 2000, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000159', 'Place & Travel', 'Los Angeles / London / Cambodia / France', 'International life across homes; close ties to Cambodia, France château, and London.', 'range', 2000, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000159', 'Work & Education', 'Girl, Interrupted — Oscar win', 'Won Best Supporting Actress; performance marked transition from edgy to prestige roles.', 'point', 1999, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000159', 'Work & Education', 'Lara Croft: Tomb Raider — action icon', 'Box office blockbuster; made her the highest-paid actress in Hollywood briefly.', 'point', 2001, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000159', 'Work & Education', 'Changeling, Maleficent, Those Who Wish Me Dead', 'Sustained career across drama, action, and fantasy genres over three decades.', 'range', 2008, 2021, '#10b981'),
  ('a0000000-0000-0000-0000-000000000159', 'Relations & Family', 'Married Brad Pitt', 'Married Brad Pitt 2014; six children (3 biological, 3 adopted); separated 2016.', 'range', 2014, 2019, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000159', 'Health', 'Preventive double mastectomy', 'Underwent preventive double mastectomy after BRCA1 mutation; wrote open NYT op-ed.', 'point', 2013, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000159', 'Activities', 'UNHCR Goodwill Ambassador', 'Named UNHCR Goodwill Ambassador 2001; visited over 30 countries for refugee advocacy.', 'range', 2001, 2022, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000159', 'Assets', 'Château Miraval winery', 'Co-owned Château Miraval in Provence; winery became subject of legal dispute with Pitt.', 'range', 2008, 2026, '#14b8a6');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000015a', 'Place & Travel', 'Sherman Oaks, Los Angeles', 'Born Jennifer Joanna Aniston in Sherman Oaks; father John Aniston was a soap actor.', 'range', 1969, 1987, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000015a', 'Place & Travel', 'New York / Los Angeles', 'Moved between NYC for early stage work and LA for screen career.', 'range', 1987, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000015a', 'Work & Education', 'Friends — Rachel Green', 'Played Rachel Green for ten seasons; earned $1M per episode by final season.', 'range', 1994, 2004, '#10b981'),
  ('a0000000-0000-0000-0000-00000000015a', 'Work & Education', 'The Good Girl and film career', 'Won SAG, Golden Globe, and Emmy; The Good Girl demonstrated dramatic range.', 'range', 2002, 2014, '#10b981'),
  ('a0000000-0000-0000-0000-00000000015a', 'Work & Education', 'The Morning Show (Apple TV+)', 'Starred in and produced critically acclaimed drama; Emmy-nominated performance.', 'range', 2019, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-00000000015a', 'Relations & Family', 'Married Brad Pitt', 'Married Brad Pitt in 2000; divorced 2005; remained close friends publicly.', 'range', 2000, 2005, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000015a', 'Relations & Family', 'Married Justin Theroux', 'Married screenwriter Justin Theroux in 2015; separated in 2017.', 'range', 2015, 2017, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000015a', 'Assets', 'LolaVie haircare brand', 'Launched LolaVie haircare brand in 2021; sold out within hours of launch.', 'range', 2021, 2026, '#14b8a6'),
  ('a0000000-0000-0000-0000-00000000015a', 'Activities', 'Highest-paid TV actress', 'Among highest-paid TV actresses in history; also major advertising presence for Aveeno.', 'range', 2000, 2026, '#f59e0b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000015b', 'Place & Travel', 'Smyrna, Georgia', 'Born Julia Fiona Roberts in Smyrna, Georgia; parents ran acting school.', 'range', 1967, 1987, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000015b', 'Place & Travel', 'Los Angeles / New Mexico', 'Based in LA for career; ranch in Taos, New Mexico is long-term family home.', 'range', 1987, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000015b', 'Work & Education', 'Pretty Woman — star-making role', 'Highest-grossing film of 1990; earned her first Oscar nomination; cemented iconic status.', 'point', 1990, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000015b', 'Work & Education', 'Erin Brockovich — Oscar win', 'First actress to earn $20M for a single film; won Best Actress at the Academy Awards.', 'point', 2000, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000015b', 'Work & Education', 'Ocean''s Eleven, Charlie Wilson''s War', 'Sustained A-list box office presence through ensemble and dramatic films.', 'range', 2001, 2012, '#10b981'),
  ('a0000000-0000-0000-0000-00000000015b', 'Relations & Family', 'Married Lyle Lovett', 'Married country singer Lyle Lovett in 1993; divorced the following year.', 'range', 1993, 1994, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000015b', 'Relations & Family', 'Married Daniel Moder', 'Married cinematographer Daniel Moder in 2002; three children Hazel, Phinnaeus, Henry.', 'range', 2002, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000015b', 'Activities', 'UNICEF ambassador & philanthropy', 'Long-standing UNICEF ambassador; donated to Doctors Without Borders and relief funds.', 'range', 1995, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000015b', 'Assets', 'Red Om Films production company', 'Founded Red Om Films; produced several of her own feature films.', 'range', 2000, 2020, '#14b8a6');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000015c', 'Place & Travel', 'Mount Vernon, New York', 'Born Denzel Hayes Washington Jr. in Mount Vernon; parents divorced early.', 'range', 1954, 1977, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000015c', 'Place & Travel', 'Los Angeles, California', 'Moved to LA after stage career in NY; rooted in LA throughout Hollywood career.', 'range', 1977, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000015c', 'Work & Education', 'St. Elsewhere TV career', 'Played Dr. Phillip Chandler in NBC drama St. Elsewhere for six seasons.', 'range', 1982, 1988, '#10b981'),
  ('a0000000-0000-0000-0000-00000000015c', 'Work & Education', 'Glory and Malcolm X', 'Won Supporting Actor Oscar for Glory (1989); nominated for Best Actor for Malcolm X.', 'range', 1989, 1992, '#10b981'),
  ('a0000000-0000-0000-0000-00000000015c', 'Work & Education', 'Training Day — Best Actor Oscar', 'Won Best Actor Oscar for Training Day; only second Black man to win that award.', 'point', 2001, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000015c', 'Work & Education', 'The Equalizer franchise', 'Action franchise grossed over $500 million globally across three films.', 'range', 2014, 2023, '#10b981'),
  ('a0000000-0000-0000-0000-00000000015c', 'Relations & Family', 'Married Pauletta Pearson', 'Married actress Pauletta Pearson in 1983; four children; one of Hollywood''s longest marriages.', 'range', 1983, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000015c', 'Activities', 'Boys & Girls Clubs of America', 'Long-time supporter and board member of Boys & Girls Clubs of America.', 'range', 1995, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000015c', 'Work & Education', 'Broadway — Fences', 'Starred in and produced Fences on Broadway; won Tony Award for Best Actor.', 'point', 2010, null, '#10b981');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000015d', 'Place & Travel', 'Philadelphia, Pennsylvania', 'Born Willard Carroll Smith II in West Philadelphia; raised in Wynnefield.', 'range', 1968, 1990, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000015d', 'Place & Travel', 'Los Angeles, California', 'Moved to LA as The Fresh Prince; Calabasas home became centre of family life.', 'range', 1990, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000015d', 'Work & Education', 'DJ Jazzy Jeff & The Fresh Prince', 'Won first Grammy for Rap at the 1989 ceremony for "Parents Just Don''t Understand."', 'range', 1987, 1993, '#10b981'),
  ('a0000000-0000-0000-0000-00000000015d', 'Work & Education', 'The Fresh Prince of Bel-Air', 'Six-season NBC sitcom became a cultural touchstone; defined 1990s pop culture.', 'range', 1990, 1996, '#10b981'),
  ('a0000000-0000-0000-0000-00000000015d', 'Work & Education', 'Independence Day, Men in Black, Ali', 'Built blockbuster film career; nominated for Best Actor for Ali and The Pursuit of Happyness.', 'range', 1996, 2007, '#10b981'),
  ('a0000000-0000-0000-0000-00000000015d', 'Work & Education', 'King Richard — Oscar win', 'Won Best Actor Oscar for King Richard (2022); famous Oscars slap in same ceremony.', 'point', 2022, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000015d', 'Relations & Family', 'Married Jada Pinkett Smith', 'Married Jada Pinkett Smith 1997; two children Jaden and Willow; controversial separation.', 'range', 1997, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000015d', 'Activities', 'Oscars slap — Chris Rock', 'Slapped presenter Chris Rock on stage at 94th Academy Awards; banned from Oscars.', 'point', 2022, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000015d', 'Assets', 'Westbrook Inc. production company', 'Founded Westbrook Inc. with Jada; produced multiple film and TV projects.', 'range', 2019, 2026, '#14b8a6');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000015e', 'Place & Travel', 'Hayward, California', 'Born Dwayne Douglas Johnson in Hayward; family moved constantly due to wrestling circuit.', 'range', 1972, 1990, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000015e', 'Place & Travel', 'Miami / Los Angeles / Hawaii', 'Maintained homes in Miami, LA, and Hawaii; tied to Hawaii through Polynesian heritage.', 'range', 1995, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000015e', 'Work & Education', 'University of Miami football', 'Played defensive tackle at U of Miami; went undrafted; briefly in CFL.', 'range', 1990, 1995, '#10b981'),
  ('a0000000-0000-0000-0000-00000000015e', 'Work & Education', 'WWE — The Rock', 'Became one of WWE''s biggest stars; seven-time World Champion; coined "Can you smell it?"', 'range', 1996, 2004, '#10b981'),
  ('a0000000-0000-0000-0000-00000000015e', 'Work & Education', 'Fast & Furious and Jumanji', 'Highest-paid actor in the world 2016–2019; global franchise dominance.', 'range', 2011, 2022, '#10b981'),
  ('a0000000-0000-0000-0000-00000000015e', 'Relations & Family', 'Married Lauren Hashian', 'Married singer Lauren Hashian in Hawaii 2019; two daughters Jasmine and Tiana.', 'range', 2019, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000015e', 'Assets', 'Tequila brand Teremana', 'Founded Teremana Tequila in 2020; sold over 2 million cases in first two years.', 'range', 2020, 2026, '#14b8a6'),
  ('a0000000-0000-0000-0000-00000000015e', 'Activities', 'XFL co-ownership', 'Co-purchased the XFL American football league to revive the brand in 2020.', 'range', 2020, 2023, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000015e', 'Health', 'Depression disclosure', 'Disclosed battling depression multiple times; became prominent male mental health voice.', 'point', 2018, null, '#ef4444');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000015f', 'Place & Travel', 'Vancouver, British Columbia', 'Born Ryan Rodney Reynolds in Vancouver; youngest of four brothers.', 'range', 1976, 1991, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000015f', 'Place & Travel', 'Los Angeles / New York', 'Moved to LA for acting career; family settled in New York area after children.', 'range', 1991, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000015f', 'Work & Education', 'Two Guys and a Girl and early TV', 'Starred in ABC sitcom Two Guys and a Girl; built comedic persona in early career.', 'range', 1998, 2001, '#10b981'),
  ('a0000000-0000-0000-0000-00000000015f', 'Work & Education', 'Deadpool — self-produced breakthrough', 'Self-produced and co-wrote Deadpool; $363M budget film grossed $783M globally.', 'point', 2016, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000015f', 'Work & Education', 'Deadpool & Wolverine', 'MCU crossover set opening weekend box office records for R-rated films.', 'point', 2024, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000015f', 'Relations & Family', 'Married Blake Lively', 'Married actress Blake Lively in 2012; four children together.', 'range', 2012, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000015f', 'Assets', 'Aviation Gin acquisition', 'Acquired stake in Aviation American Gin; sold to Diageo for $610M in 2020.', 'range', 2018, 2020, '#14b8a6'),
  ('a0000000-0000-0000-0000-00000000015f', 'Assets', 'Wrexham AFC co-owner', 'Co-purchased Welsh football club Wrexham AFC; subject of Welcome to Wrexham docuseries.', 'range', 2020, 2026, '#14b8a6'),
  ('a0000000-0000-0000-0000-00000000015f', 'Activities', 'Maximum Effort marketing', 'Founded Maximum Effort Productions; known for witty ad campaigns and social media.', 'range', 2018, 2026, '#f59e0b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000160', 'Place & Travel', 'Virginia, Minnesota', 'Born Christopher Michael Pratt in Virginia, Minnesota; family moved to Washington state.', 'range', 1979, 1997, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000160', 'Place & Travel', 'Maui, Hawaii / Los Angeles', 'Lived in Maui and busked for money before heading to LA for acting.', 'range', 1997, 2001, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000160', 'Place & Travel', 'Los Angeles, California', 'Settled in LA after landing Parks and Recreation; base throughout franchise career.', 'range', 2001, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000160', 'Work & Education', 'Parks and Recreation — Andy Dwyer', 'Played lovable Andy Dwyer for seven seasons; established comedic credentials.', 'range', 2009, 2015, '#10b981'),
  ('a0000000-0000-0000-0000-000000000160', 'Work & Education', 'Guardians of the Galaxy and Jurassic World', 'Back-to-back franchise launches made him one of the biggest stars of the 2010s.', 'range', 2014, 2015, '#10b981'),
  ('a0000000-0000-0000-0000-000000000160', 'Work & Education', 'Avengers: Infinity War and Endgame', 'Star-Lord central to MCU''s most successful films; global blockbuster legacy.', 'range', 2018, 2023, '#10b981'),
  ('a0000000-0000-0000-0000-000000000160', 'Relations & Family', 'Married Anna Faris', 'Married actress Anna Faris 2009; son Jack born prematurely; divorced in 2018.', 'range', 2009, 2018, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000160', 'Relations & Family', 'Married Katherine Schwarzenegger', 'Married Katherine Schwarzenegger 2019; daughters Lyla and Eloise born.', 'range', 2019, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000160', 'Health', 'Son Jack''s premature birth', 'Son Jack born nine weeks premature; experience inspired advocacy for neonatal causes.', 'point', 2012, null, '#ef4444');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000161', 'Place & Travel', 'Boston, Massachusetts', 'Born Christopher Robert Evans in Boston; grew up in Sudbury, Massachusetts.', 'range', 1981, 2000, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000161', 'Place & Travel', 'Los Angeles / New York', 'Based in LA for Marvel career; later divided time with NYC for stage work.', 'range', 2000, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000161', 'Work & Education', 'Fantastic Four — early career', 'Played Johnny Storm in Fantastic Four (2005); first superhero role before Cap.', 'range', 2005, 2007, '#10b981'),
  ('a0000000-0000-0000-0000-000000000161', 'Work & Education', 'Captain America / MCU', 'Played Steve Rogers / Captain America across 10+ MCU films over 11 years.', 'range', 2011, 2019, '#10b981'),
  ('a0000000-0000-0000-0000-000000000161', 'Work & Education', 'Knives Out and post-MCU career', 'Played villain Ransom Drysdale; pivoted to adult-oriented dramas successfully.', 'range', 2019, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-000000000161', 'Relations & Family', 'Married Alba Baptista', 'Married Portuguese actress Alba Baptista in 2023; low-key ceremony.', 'range', 2023, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000161', 'Activities', 'A Starting Point civic platform', 'Co-founded A Starting Point, a non-partisan civic engagement platform for US citizens.', 'range', 2020, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000161', 'Health', 'Anxiety and therapy advocacy', 'Publicly discussed severe anxiety; encouraged therapy for men in multiple interviews.', 'range', 2015, 2026, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000161', 'Items', 'Captain America''s shield', 'Iconic vibranium shield became one of the most recognisable props in cinema history.', 'range', 2011, 2019, '#64748b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000162', 'Place & Travel', 'New York City, New York', 'Born Robert John Downey Jr. in Manhattan; father Robert Downey Sr. was a filmmaker.', 'range', 1965, 1987, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000162', 'Place & Travel', 'Los Angeles, California', 'Based in LA throughout film career; Malibu home well-known.', 'range', 1987, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000162', 'Work & Education', 'Less Than Zero and early films', 'Played drug-addicted character eerily reflecting real life; praised for raw performance.', 'point', 1987, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000162', 'Work & Education', 'Chaplin — Oscar nomination', 'First Best Actor Oscar nomination for playing Charlie Chaplin; career high point.', 'point', 1992, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000162', 'Work & Education', 'Iron Man / MCU', 'Iron Man (2008) relaunched career; played Tony Stark across 10 MCU films.', 'range', 2008, 2019, '#10b981'),
  ('a0000000-0000-0000-0000-000000000162', 'Work & Education', 'Oppenheimer — Oscar win', 'Won Best Supporting Actor Oscar for Dr. Strangelove role in Oppenheimer.', 'point', 2023, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000162', 'Health', 'Drug addiction and imprisonment', 'Multiple arrests; served prison time; addiction dominated headlines in the late 1990s.', 'range', 1996, 2001, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000162', 'Relations & Family', 'Married Susan Downey', 'Married producer Susan Levin in 2005; two children Exton and Avri together.', 'range', 2005, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000162', 'Assets', 'Team Downey production company', 'Founded Team Downey with Susan; produced Sherlock Holmes franchise films.', 'range', 2010, 2026, '#14b8a6');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000163', 'Place & Travel', 'New York City, New York', 'Born Scarlett Ingrid Johansson in NYC; father is Danish-born architect.', 'range', 1984, 2000, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000163', 'Place & Travel', 'Los Angeles / New York', 'Maintained NY roots while working extensively in LA and on location globally.', 'range', 2000, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000163', 'Work & Education', 'Ghost World and early career', 'Ghost World (2001) established her as a serious indie actress in her teens.', 'point', 2001, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000163', 'Work & Education', 'Lost in Translation and Girl with a Pearl Earring', 'Two acclaimed films in the same year; BAFTA and Golden Globe nominations.', 'point', 2003, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000163', 'Work & Education', 'Black Widow / MCU', 'Played Natasha Romanoff / Black Widow across 10 MCU appearances over 11 years.', 'range', 2010, 2021, '#10b981'),
  ('a0000000-0000-0000-0000-000000000163', 'Work & Education', 'Jojo Rabbit and Marriage Story', 'Two acclaimed 2019 films; Marriage Story earned BAFTA nomination; Jojo Rabbit won Oscar.', 'point', 2019, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000163', 'Relations & Family', 'Married Ryan Reynolds', 'Married Ryan Reynolds in 2008; divorced in 2011.', 'range', 2008, 2011, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000163', 'Relations & Family', 'Married Colin Jost', 'Married SNL''s Colin Jost in 2020; son Cosmo born 2021.', 'range', 2020, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000163', 'Assets', 'Disney lawsuit — Black Widow streaming', 'Sued Disney over simultaneous Disney+ release of Black Widow; settled in 2021.', 'point', 2021, null, '#14b8a6');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000164', 'Place & Travel', 'Louisville, Kentucky', 'Born Jennifer Shrader Lawrence in Louisville; youngest of three boys; tomboy childhood.', 'range', 1990, 2008, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000164', 'Place & Travel', 'New York / Los Angeles', 'Moved to NYC as a teenager with mother; later based in LA.', 'range', 2008, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000164', 'Work & Education', 'Winter''s Bone — first Oscar nomination', 'Nominated for Best Actress at age 20; announced as a major new talent.', 'point', 2010, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000164', 'Work & Education', 'Silver Linings Playbook — Oscar win', 'Won Best Actress at age 22; youngest winner in that category in Oscar history.', 'point', 2012, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000164', 'Work & Education', 'Hunger Games franchise', 'Played Katniss Everdeen across four films; franchise grossed over $2.9 billion.', 'range', 2012, 2015, '#10b981'),
  ('a0000000-0000-0000-0000-000000000164', 'Work & Education', 'No Hard Feelings comeback', 'No Hard Feelings (2023) marked commercial comeback after quiet mid-career.', 'point', 2023, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000164', 'Relations & Family', 'Married Cooke Maroney', 'Married art gallerist Cooke Maroney in 2019; son Cy born in 2022.', 'range', 2019, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000164', 'Activities', 'Jennifer Lawrence Foundation', 'Founded charity focused on political reform and the Coalition for Kids.', 'range', 2015, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000164', 'Health', 'iCloud photo hack', 'Victim of 2014 iCloud hack that exposed private photos of many celebrities.', 'point', 2014, null, '#ef4444');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000165', 'Place & Travel', 'Scottsdale, Arizona', 'Born Emily Jean Stone in Scottsdale; family moved to California for acting career.', 'range', 1988, 2004, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000165', 'Place & Travel', 'Los Angeles / New York', 'LA-based career; also maintained New York presence for stage and personal life.', 'range', 2004, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000165', 'Work & Education', 'Superbad and Easy A', 'Breakout roles established her comedic timing; Easy A garnered Golden Globe nomination.', 'range', 2007, 2010, '#10b981'),
  ('a0000000-0000-0000-0000-000000000165', 'Work & Education', 'The Amazing Spider-Man', 'Played Gwen Stacy in two Spider-Man films; relationship with Andrew Garfield began.', 'range', 2012, 2014, '#10b981'),
  ('a0000000-0000-0000-0000-000000000165', 'Work & Education', 'La La Land — Oscar win', 'Won Best Actress Oscar for La La Land (2016); second-most awarded actress of her generation.', 'point', 2016, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000165', 'Work & Education', 'Poor Things — second Oscar win', 'Won Best Actress Oscar for Poor Things; cemented as leading actress of her era.', 'point', 2023, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000165', 'Relations & Family', 'Married Dave McCary', 'Married SNL segment director Dave McCary in 2020; daughter Louise born 2021.', 'range', 2020, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000165', 'Activities', 'Producers Guild advocacy', 'Vocal advocate for equal pay and diversity behind the camera in Hollywood.', 'range', 2017, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000165', 'Health', 'Panic disorder', 'Openly discussed childhood panic disorder; became advocate for mental health awareness.', 'range', 1995, 2015, '#ef4444');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000166', 'Place & Travel', 'Jerusalem, Israel', 'Born Natalie Hershlag in Jerusalem; family emigrated to the United States in 1984.', 'range', 1981, 1984, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000166', 'Place & Travel', 'Long Island / New York / Los Angeles', 'Grew up on Long Island; Harvard and LA film career ran simultaneously.', 'range', 1984, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000166', 'Work & Education', 'The Professional — child actress debut', 'Debuted at age 12 in Luc Besson''s The Professional; immediately acclaimed.', 'point', 1994, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000166', 'Work & Education', 'Harvard University — Psychology degree', 'Enrolled at Harvard while filming Star Wars prequels; graduated with honors.', 'range', 1999, 2003, '#10b981'),
  ('a0000000-0000-0000-0000-000000000166', 'Work & Education', 'Black Swan — Oscar win', 'Won Best Actress Oscar for psychologically intense Black Swan performance.', 'point', 2010, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000166', 'Work & Education', 'Thor and Marvel appearances', 'Played Jane Foster in Thor franchise; returned with expanded role in Love and Thunder.', 'range', 2011, 2022, '#10b981'),
  ('a0000000-0000-0000-0000-000000000166', 'Relations & Family', 'Married Benjamin Millepied', 'Married French choreographer Benjamin Millepied in 2012; two children Aleph and Amalia.', 'range', 2012, 2023, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000166', 'Activities', 'Vegan lifestyle and animal rights', 'Committed vegan; designed vegan shoe line and advocated for animal rights publicly.', 'range', 2009, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000166', 'Assets', 'Free Arts NYC board member', 'Served on the board of Free Arts NYC, supporting arts education for underserved youth.', 'range', 2005, 2015, '#14b8a6');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000167', 'Place & Travel', 'Cleveland, Ohio', 'Born Maria Halle Berry in Cleveland; raised in Ohio after parents'' divorce.', 'range', 1966, 1986, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000167', 'Place & Travel', 'Chicago / New York / Los Angeles', 'Moved to Chicago, then NYC for modelling; settled in LA for film career.', 'range', 1986, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000167', 'Work & Education', 'Boomerang and Losing Isaiah', 'Established serious dramatic range in early 1990s alongside comedic work.', 'range', 1992, 1995, '#10b981'),
  ('a0000000-0000-0000-0000-000000000167', 'Work & Education', 'Monster''s Ball — Oscar win', 'First Black woman to win Best Actress Oscar; emotional acceptance speech widely remembered.', 'point', 2001, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000167', 'Work & Education', 'X-Men franchise and Bond girl', 'Played Storm in X-Men and Jinx in Die Another Day; franchise stardom.', 'range', 2000, 2006, '#10b981'),
  ('a0000000-0000-0000-0000-000000000167', 'Work & Education', 'Bruised — directorial debut', 'Directed and starred in Bruised (2020); first film of a Black woman to top Netflix charts.', 'point', 2020, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000167', 'Relations & Family', 'Married David Justice and Eric Benét', 'Two early marriages ending in divorce; later long-term relationship with Olivier Martinez.', 'range', 1993, 2005, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000167', 'Health', 'Type 1 diabetes management', 'Diagnosed with Type 1 diabetes on set of Living Dolls (1989); managed ever since.', 'range', 1989, 2026, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000167', 'Activities', 'Miss USA — first Black runner-up', 'Finished as first runner-up in Miss USA 1986; launched modelling and acting path.', 'point', 1986, null, '#f59e0b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000168', 'Place & Travel', 'St. Matthews, South Carolina', 'Born Viola Davis in St. Matthews; grew up in extreme poverty in Providence, Rhode Island.', 'range', 1965, 1983, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000168', 'Place & Travel', 'Providence, RI / New York / Los Angeles', 'Grew up in RI; stage career in NYC; film career centred in LA.', 'range', 1983, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000168', 'Work & Education', 'Juilliard School', 'Trained at Juilliard; one of few Oscar winners to have attended the conservatory.', 'range', 1989, 1993, '#10b981'),
  ('a0000000-0000-0000-0000-000000000168', 'Work & Education', 'Doubt — first Oscar nomination', 'Received Best Supporting Actress nomination for just eight minutes of screen time.', 'point', 2008, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000168', 'Work & Education', 'How to Get Away with Murder', 'First Black woman to win Emmy for drama lead; played Professor Annalise Keating.', 'range', 2014, 2020, '#10b981'),
  ('a0000000-0000-0000-0000-000000000168', 'Work & Education', 'Fences — Oscar win', 'Won Best Supporting Actress Oscar for Fences; became an EGOT winner.', 'point', 2016, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000168', 'Work & Education', 'The Woman King', 'Led and produced historical epic; earned Golden Globe nomination at age 57.', 'point', 2022, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000168', 'Relations & Family', 'Married Julius Tennon', 'Married actor Julius Tennon in 2003; adopted daughter Genesis Tennon in 2011.', 'range', 2003, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000168', 'Activities', 'Poverty and hunger advocacy', 'Co-founded JuVee Productions; vocal advocate about childhood poverty and food insecurity.', 'range', 2010, 2026, '#f59e0b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000169', 'Place & Travel', 'Melbourne, Australia', 'Born Catherine Élise Blanchett in Melbourne; father American, mother Australian.', 'range', 1969, 1990, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000169', 'Place & Travel', 'Sydney / London / New York', 'Based in Sydney and London; Artistic Director of Sydney Theatre Company 2008–2013.', 'range', 1990, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000169', 'Work & Education', 'University of Melbourne — fine arts', 'Studied economics; transferred to NIDA (National Institute of Dramatic Art) in Sydney.', 'range', 1988, 1992, '#10b981'),
  ('a0000000-0000-0000-0000-000000000169', 'Work & Education', 'Elizabeth — Oscar nomination', 'First Oscar nomination playing Queen Elizabeth I; launched international career.', 'point', 1998, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000169', 'Work & Education', 'The Aviator — first Oscar win', 'Won Best Supporting Actress for playing Katharine Hepburn in The Aviator.', 'point', 2004, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000169', 'Work & Education', 'Blue Jasmine — second Oscar win', 'Won Best Actress for Woody Allen''s Blue Jasmine; stood ovation at Cannes.', 'point', 2013, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000169', 'Work & Education', 'Tár and later career', 'Tár (2022) generated her eighth Oscar nomination; widely called the performance of the decade.', 'point', 2022, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000169', 'Relations & Family', 'Married Andrew Upton', 'Married playwright Andrew Upton in 1997; four children Roman, Dashiell, Ignatius, and Edith.', 'range', 1997, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000169', 'Activities', 'Sydney Theatre Company co-director', 'Co-directed STC with husband Andrew Upton 2008–2013; revitalised Australian theatre.', 'range', 2008, 2013, '#f59e0b');
