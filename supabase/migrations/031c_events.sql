-- Rafael Nadal
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000017e', 'Place & Travel', 'Manacor, Mallorca', 'Born and raised in Manacor; trains at Rafa Nadal Academy founded with uncle Toni.', 'range', 1986, 2010, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000017e', 'Place & Travel', 'Global tour circuit', 'Competes on ATP Tour worldwide including Paris, Melbourne, New York, and London.', 'range', 2001, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000017e', 'Work & Education', 'Professional tennis career', 'Turned pro at 15; won 22 Grand Slam singles titles across his career.', 'range', 2001, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-00000000017e', 'Work & Education', 'Rafa Nadal Academy', 'Co-founded tennis academy in Manacor offering elite training and education programs.', 'range', 2016, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-00000000017e', 'Health', 'Chronic foot injury (Müller-Weiss)', 'Battled degenerative bone disease in left foot requiring repeated absences from tour.', 'range', 2005, 2024, '#ef4444'),
  ('a0000000-0000-0000-0000-00000000017e', 'Activities', '14 French Open titles', 'Won Roland Garros a record 14 times — an unmatched feat in tennis history.', 'point', 2022, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000017e', 'Activities', 'Olympic gold medals', 'Won singles gold at Beijing 2008 and doubles gold at Rio 2016 for Spain.', 'point', 2016, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000017e', 'Relations & Family', 'Married Mery Perelló', 'Married childhood sweetheart Xisca Perelló in Mallorca after 14 years together.', 'point', 2019, null, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000017e', 'Assets', 'Rafa Nadal Sports Centre', 'Operates sports complex and academy in Manacor, a major investment in Mallorcan sports.', 'range', 2016, 2024, '#14b8a6');

-- Andy Murray
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000017f', 'Place & Travel', 'Dunblane, Scotland', 'Born in Dunblane; survived the 1996 school shooting as a child — shaped his resilience.', 'range', 1987, 2005, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000017f', 'Place & Travel', 'Barcelona training', 'Moved to Barcelona aged 15 to train at Emilio Sánchez Casal Academy.', 'range', 2002, 2005, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000017f', 'Work & Education', 'Professional tennis career', 'Turned pro 2005; won 3 Grand Slams and 2 Olympic golds, ranked No. 1 in 2016.', 'range', 2005, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-00000000017f', 'Health', 'Hip resurfacing surgery', 'Underwent major hip resurfacing in January 2019 after career-threatening chronic pain.', 'point', 2019, null, '#ef4444'),
  ('a0000000-0000-0000-0000-00000000017f', 'Activities', 'Wimbledon titles', 'Won Wimbledon in 2013 and 2016, first British man to do so since Fred Perry in 1936.', 'point', 2016, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000017f', 'Activities', 'Two Olympic gold medals', 'Won singles gold at London 2012 and Rio 2016 — unique double in Open Era tennis.', 'point', 2016, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000017f', 'Relations & Family', 'Married Kim Sears', 'Married Kim Sears in April 2015 at Dunblane Cathedral; they have four children.', 'point', 2015, null, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000017f', 'Assets', 'Cromlix Hotel', 'Purchased and renovated Cromlix House near Dunblane, reopening it as a luxury hotel.', 'range', 2013, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-00000000017f', 'Items', 'Knighthood', 'Awarded knighthood in the 2017 New Year Honours for services to tennis.', 'point', 2017, null, '#64748b');

-- Conor McGregor
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000180', 'Place & Travel', 'Dublin, Ireland', 'Born and raised in Crumlin, Dublin; began boxing at 12 at local club.', 'range', 1988, 2012, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000180', 'Place & Travel', 'Las Vegas, Nevada', 'Relocated to Las Vegas for high-profile fights and business ventures.', 'range', 2015, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000180', 'Work & Education', 'UFC career', 'Signed with UFC in 2013; became dual-weight champion (featherweight + lightweight).', 'range', 2013, 2021, '#10b981'),
  ('a0000000-0000-0000-0000-000000000180', 'Work & Education', 'Proper No. Twelve whiskey', 'Founded Proper No. Twelve Irish whiskey brand in 2018; sold majority stake for ~$600M.', 'range', 2018, 2021, '#10b981'),
  ('a0000000-0000-0000-0000-000000000180', 'Activities', 'Dual UFC champion', 'First fighter to hold UFC featherweight and lightweight titles simultaneously (2016).', 'point', 2016, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000180', 'Activities', 'Mayweather boxing match', 'Crossed over to professional boxing, fighting Floyd Mayweather Jr. in August 2017.', 'point', 2017, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000180', 'Health', 'Leg fracture vs Poirier', 'Suffered horrific tibia fracture at UFC 264 in July 2021, requiring lengthy recovery.', 'point', 2021, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000180', 'Relations & Family', 'Partner Dee Devlin', 'Long-term partner Dee Devlin; have four children together including son Conor Jr.', 'range', 2008, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000180', 'Assets', 'Forged Irish Stout', 'Launched Forged Irish Stout beer brand and acquired The Black Forge Inn pub in Dublin.', 'range', 2021, 2024, '#14b8a6');

-- Floyd Mayweather
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000181', 'Place & Travel', 'Grand Rapids, Michigan', 'Born in Grand Rapids; grew up in poverty, surrounded by boxing family members.', 'range', 1977, 1996, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000181', 'Place & Travel', 'Las Vegas, Nevada', 'Based in Las Vegas; home to his boxing promotions and training operations.', 'range', 1996, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000181', 'Work & Education', 'Professional boxing career', 'Pro from 1996; retired 50-0 after defeating Conor McGregor in 2017.', 'range', 1996, 2017, '#10b981'),
  ('a0000000-0000-0000-0000-000000000181', 'Work & Education', 'Mayweather Promotions', 'Founded boxing promotion company; promoted major fights including Pacquiao rematch bouts.', 'range', 2007, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-000000000181', 'Activities', 'Olympic bronze medal', 'Won bronze at Atlanta 1996 Olympics as a lightweight; controversial loss in semis.', 'point', 1996, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000181', 'Activities', '5-division world champion', 'Won world titles in 5 weight classes from super featherweight to super welterweight.', 'range', 1998, 2015, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000181', 'Activities', 'Pacquiao fight of the century', 'Defeated Manny Pacquiao in May 2015 in the highest-grossing boxing match ever.', 'point', 2015, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000181', 'Health', 'Jail sentence', 'Served 2-month jail sentence in 2012 for domestic battery — caused significant backlash.', 'point', 2012, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000181', 'Assets', 'The Money Team brand', 'Built TMT brand including clothing, boxing gym, and numerous endorsement deals.', 'range', 2010, 2024, '#14b8a6');

-- Canelo Alvarez
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000182', 'Place & Travel', 'Guadalajara, Mexico', 'Born in Guadalajara; grew up in Juanacatlán with several brothers who also boxed.', 'range', 1990, 2010, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000182', 'Place & Travel', 'San Diego training camps', 'Trains regularly in San Diego under Eddy Reynoso at Canelo Team gym.', 'range', 2010, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000182', 'Work & Education', 'Professional boxing career', 'Turned pro at 15 in 2004; became undisputed super middleweight champion by 2021.', 'range', 2004, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-000000000182', 'Work & Education', 'DAZN & Matchroom deal', 'Signed record $365M deal with DAZN in 2018, later disputed and renegotiated.', 'range', 2018, 2020, '#10b981'),
  ('a0000000-0000-0000-0000-000000000182', 'Activities', 'Undisputed super middleweight', 'Unified all four major super middleweight belts in November 2021 — historic achievement.', 'point', 2021, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000182', 'Activities', 'Triple Gennady Golovkin trilogy', 'Fought GGG three times (2017, 2018, 2022) in one of boxing''s greatest rivalries.', 'range', 2017, 2022, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000182', 'Health', 'Failed VADA drug test', 'Tested positive for clenbuterol in 2018; attributed to contaminated Mexican beef.', 'point', 2018, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000182', 'Relations & Family', 'Children and family', 'Has four children with different partners; considered a devoted family man in Mexico.', 'range', 2007, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000182', 'Assets', 'SAul Promotions', 'Founded his own boxing promotion company giving him more control over his career.', 'range', 2020, 2024, '#14b8a6');

-- Anthony Joshua
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000183', 'Place & Travel', 'Watford, England', 'Born in Watford to Nigerian parents; began boxing at 18 after a troubled youth.', 'range', 1989, 2012, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000183', 'Place & Travel', 'Nigeria trips', 'Has strong Nigerian heritage; visits Nigeria and has fought in Saudi Arabia multiple times.', 'range', 2010, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000183', 'Work & Education', 'Professional boxing career', 'Turned pro in 2013; became unified heavyweight world champion by 2016.', 'range', 2013, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-000000000183', 'Activities', 'Olympic gold medal', 'Won super-heavyweight gold at London 2012 Olympics despite limited amateur experience.', 'point', 2012, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000183', 'Activities', 'Unified heavyweight titles', 'Held IBF, WBA, WBO heavyweight belts simultaneously between 2016 and 2019.', 'range', 2016, 2019, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000183', 'Activities', 'Ruiz Jr shock loss & rematch', 'Suffered first pro loss to Andy Ruiz Jr in 2019 but reclaimed titles in Saudi rematch.', 'range', 2019, 2019, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000183', 'Health', 'Shoulder surgery', 'Underwent shoulder surgery following his losses to Oleksandr Usyk in 2021 and 2022.', 'point', 2022, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000183', 'Relations & Family', 'Son Joseph', 'Has a son, Joseph, born 2015 with ex-partner Nicole. Co-parents amicably.', 'range', 2015, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000183', 'Assets', '258 MGT company', 'Founded management and brand company 258 MGT to manage his business affairs.', 'range', 2016, 2024, '#14b8a6');

-- Tyson Fury
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000184', 'Place & Travel', 'Manchester, England', 'Born in Manchester to Irish Traveller family; grew up across northern England.', 'range', 1988, 2010, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000184', 'Place & Travel', 'Morecambe, Lancashire', 'Based in Morecambe with his family; trains at various UK and US camps.', 'range', 2010, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000184', 'Work & Education', 'Professional boxing career', 'Turned pro in 2008; holds WBC heavyweight title, defeated Wilder and Ngannou.', 'range', 2008, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-000000000184', 'Activities', 'Defeated Wladimir Klitschko', 'Shocked the world defeating Klitschko by unanimous decision in Düsseldorf, 2015.', 'point', 2015, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000184', 'Activities', 'Wilder trilogy', 'Fought Deontay Wilder three times (2018–2021), winning the last two including a KO.', 'range', 2018, 2021, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000184', 'Health', 'Mental health and addiction battle', 'Publicly battled depression, cocaine use, and weight gain after first Wilder fight in 2018.', 'range', 2016, 2018, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000184', 'Health', 'Mental health advocacy', 'Became prominent advocate for men''s mental health after his own recovery.', 'range', 2018, 2024, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000184', 'Relations & Family', 'Married Paris Fury', 'Married Paris Mulroy in 2008; they have seven children and star in Netflix series.', 'range', 2008, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000184', 'Items', 'Netflix series At Home with the Furys', 'Starred in Netflix documentary series showing family life with Paris and their children.', 'range', 2023, 2024, '#64748b');

-- Max Verstappen
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000185', 'Place & Travel', 'Hasselt, Belgium', 'Born in Hasselt to Dutch-Belgian parents; grew up between Belgium and Netherlands.', 'range', 1997, 2015, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000185', 'Place & Travel', 'Monaco', 'Moved to Monaco as base for F1 career; common choice for tax and racing lifestyle.', 'range', 2015, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000185', 'Work & Education', 'F1 career at Red Bull', 'Joined Red Bull Racing in 2016; won consecutive world championships 2021–2024.', 'range', 2016, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-000000000185', 'Work & Education', 'Toro Rosso debut', 'Became youngest F1 driver in history at 17 years old, debuting for Toro Rosso in 2015.', 'point', 2015, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000185', 'Activities', '4 consecutive F1 titles', 'Won Formula 1 World Drivers'' Championship four times in a row from 2021 to 2024.', 'range', 2021, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000185', 'Activities', 'Record 19 wins in 2023', 'Set the single-season F1 record with 19 victories in the 2023 season.', 'point', 2023, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000185', 'Relations & Family', 'Partner Kelly Piquet', 'Started relationship with Brazilian model Kelly Piquet, daughter of Nelson Piquet, in 2021.', 'range', 2021, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000185', 'Assets', 'Racing team investment', 'Invested in karting and junior motorsport with plans for broader racing ventures.', 'range', 2022, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-000000000185', 'Items', 'SIM racing hobby', 'Competes seriously in sim racing; runs Virtual Racing School and competed in iRacing events.', 'range', 2018, 2024, '#64748b');

-- Sebastian Vettel
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000186', 'Place & Travel', 'Heppenheim, Germany', 'Born in Heppenheim, Baden-Württemberg; grew up in a car-loving family.', 'range', 1987, 2006, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000186', 'Place & Travel', 'Switzerland', 'Moved to Switzerland for privacy and proximity to F1 infrastructure; lives near Thurgau.', 'range', 2010, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000186', 'Work & Education', 'F1 career', 'Competed in F1 2007–2022 for BMW Sauber, Toro Rosso, Red Bull, Ferrari, and Aston Martin.', 'range', 2007, 2022, '#10b981'),
  ('a0000000-0000-0000-0000-000000000186', 'Activities', '4 consecutive F1 championships', 'Won four consecutive world titles with Red Bull Racing from 2010 to 2013.', 'range', 2010, 2013, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000186', 'Activities', 'Youngest world champion', 'Became youngest F1 world champion in 2010 at 23 years old — record since broken.', 'point', 2010, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000186', 'Health', 'Retirement for family', 'Announced retirement in 2022 citing desire to spend more time with family.', 'point', 2022, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000186', 'Relations & Family', 'Married Hanna Prater', 'Married childhood friend Hanna Prater in 2019; they have three children together.', 'range', 2019, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000186', 'Activities', 'Environmental activism', 'Became vocal climate activist after retirement; participated in Greenpeace events.', 'range', 2021, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000186', 'Items', 'Classic car collection', 'Amassed extensive collection of historic racing cars; known for deep automotive passion.', 'range', 2010, 2024, '#64748b');

-- Stephen Curry
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000187', 'Place & Travel', 'Charlotte, North Carolina', 'Born in Charlotte; son of NBA player Dell Curry; grew up around the NBA.', 'range', 1988, 2006, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000187', 'Place & Travel', 'Davidson, North Carolina', 'Attended Davidson College where he led the team to Elite Eight in 2008.', 'range', 2006, 2009, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000187', 'Place & Travel', 'San Francisco Bay Area', 'Home base since being drafted by Golden State Warriors in 2009.', 'range', 2009, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000187', 'Work & Education', 'NBA career – Golden State Warriors', 'Drafted 7th overall in 2009; became two-time MVP and four-time NBA champion.', 'range', 2009, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-000000000187', 'Activities', '4 NBA Championships', 'Won NBA titles in 2015, 2017, 2018, and 2022 with the Golden State Warriors.', 'range', 2015, 2022, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000187', 'Activities', 'All-time 3-point record', 'Surpassed Ray Allen''s all-time record for 3-pointers made in December 2021.', 'point', 2021, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000187', 'Relations & Family', 'Married Ayesha Alexander', 'Married Ayesha Alexander in 2011; they have three children, Riley, Ryan, and Canon.', 'range', 2011, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000187', 'Assets', 'Unanimous Media', 'Co-founded Unanimous Media, a production company focused on inspirational content.', 'range', 2019, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-000000000187', 'Activities', 'Olympic gold 2024', 'Won gold with Team USA at Paris 2024 Olympics after previous team USA appearances.', 'point', 2024, null, '#f59e0b');

-- Kevin Durant
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000188', 'Place & Travel', 'Washington D.C.', 'Born in Washington D.C.; raised in Prince George''s County, Maryland.', 'range', 1988, 2007, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000188', 'Place & Travel', 'Austin, Texas', 'Attended University of Texas at Austin for one year before entering NBA Draft.', 'range', 2006, 2007, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000188', 'Work & Education', 'NBA career', 'Drafted 2nd overall in 2007; played for OKC, Golden State, Brooklyn, and Phoenix/Suns.', 'range', 2007, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-000000000188', 'Activities', '2 NBA Championships', 'Won back-to-back titles with Golden State Warriors in 2017 and 2018, winning Finals MVP both times.', 'range', 2017, 2018, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000188', 'Activities', 'Olympic gold medals', 'Won gold with Team USA at Beijing 2008, London 2012, Tokyo 2021, and Paris 2024.', 'range', 2008, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000188', 'Health', 'Achilles rupture 2019', 'Ruptured Achilles tendon in 2019 NBA Finals Game 5, missing entire 2019–20 season.', 'point', 2019, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000188', 'Relations & Family', 'Mother Wanda Durant', 'Publicly dedicated his 2014 MVP speech to his mother Wanda, calling her the real MVP.', 'point', 2014, null, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000188', 'Assets', 'Thirty Five Ventures', 'Co-founded Thirty Five Ventures with business partner Rich Kleiman for investments.', 'range', 2016, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-000000000188', 'Work & Education', 'UT Austin — one year', 'Played one season at Texas averaging 25.8 pts before declaring for 2007 NBA Draft.', 'range', 2006, 2007, '#10b981');

-- Giannis Antetokounmpo
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000189', 'Place & Travel', 'Athens, Greece', 'Born in Athens to Nigerian immigrant parents; grew up in Sepolia, a working-class district.', 'range', 1994, 2013, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000189', 'Place & Travel', 'Milwaukee, Wisconsin', 'Moved to Milwaukee after being drafted by the Bucks in 2013; became face of the city.', 'range', 2013, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000189', 'Work & Education', 'NBA career – Milwaukee Bucks', 'Drafted 15th overall in 2013; signed supermax extension 2020; led Bucks to 2021 title.', 'range', 2013, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-000000000189', 'Activities', 'NBA Championship 2021', 'Won NBA Finals MVP and championship with Milwaukee Bucks in July 2021.', 'point', 2021, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000189', 'Activities', 'Back-to-back MVP 2019–2020', 'Won NBA Most Valuable Player award in consecutive seasons 2018–19 and 2019–20.', 'range', 2019, 2020, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000189', 'Relations & Family', 'Greek citizenship', 'Greece granted family citizenship in 2013 after father Charles died stateless in Nigeria.', 'point', 2013, null, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000189', 'Relations & Family', 'Partner Mariah Riddlesprigger', 'Together with Mariah Riddlesprigger since 2016; have three sons including Liam and Maverick.', 'range', 2016, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000189', 'Assets', 'Bucks supermax contract', 'Signed richest contract in NBA history at the time — $228M supermax in 2020.', 'point', 2020, null, '#14b8a6'),
  ('a0000000-0000-0000-0000-000000000189', 'Items', 'Nike Zoom Freak signature line', 'Launched Nike Zoom Freak signature shoe series starting in 2019.', 'range', 2019, 2024, '#64748b');

-- Shaquille O'Neal
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000018a', 'Place & Travel', 'Newark, New Jersey', 'Born in Newark; grew up moving with stepfather''s military postings including Germany.', 'range', 1972, 1992, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000018a', 'Place & Travel', 'Baton Rouge, Louisiana', 'Attended LSU in Baton Rouge, where he became a dominant college basketball force.', 'range', 1989, 1992, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000018a', 'Work & Education', 'NBA career', 'Played 19 NBA seasons for 6 teams; won 4 championships, retired in 2011.', 'range', 1992, 2011, '#10b981'),
  ('a0000000-0000-0000-0000-00000000018a', 'Work & Education', 'Media and entertainment', 'Actor, rapper, TNT analyst; earned doctorate in education from Barry University in 2012.', 'range', 1993, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-00000000018a', 'Activities', '4 NBA Championships', 'Won NBA titles with LA Lakers (2000–2002) and Miami Heat (2006).', 'range', 2000, 2006, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000018a', 'Activities', 'Olympic gold medal', 'Won gold with Dream Team at Barcelona 1992 and Atlanta 1996 Olympics.', 'range', 1992, 1996, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000018a', 'Relations & Family', 'Married Shaunie Nelson', 'Married Shaunie Nelson in 2002; divorced 2011; have four children together.', 'range', 2002, 2011, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000018a', 'Assets', 'Franchise investments', 'Invested in numerous restaurant franchises including Five Guys and Auntie Anne''s.', 'range', 2000, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-00000000018a', 'Items', 'Reebok Shaq Attaq shoes', 'Launched iconic Shaq Attaq and Shaqnosis signature Reebok shoes starting 1992.', 'range', 1992, 2000, '#64748b');

-- Kobe Bryant
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000018b', 'Place & Travel', 'Philadelphia, Pennsylvania', 'Born in Philadelphia; lived in Italy ages 6–13 while father Joe Bryant played there.', 'range', 1978, 1991, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000018b', 'Place & Travel', 'Los Angeles, California', 'Moved to LA after being drafted by Charlotte/traded to Lakers; spent entire career there.', 'range', 1996, 2020, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000018b', 'Work & Education', 'NBA career – LA Lakers', 'Played 20 seasons for LA Lakers; 5x champion, 2x Finals MVP, 1x league MVP.', 'range', 1996, 2016, '#10b981'),
  ('a0000000-0000-0000-0000-00000000018b', 'Work & Education', 'Granity Studios', 'Founded multimedia content company Granity Studios focused on storytelling.', 'range', 2013, 2020, '#10b981'),
  ('a0000000-0000-0000-0000-00000000018b', 'Activities', '5 NBA Championships', 'Won five NBA titles with the LA Lakers: 2000, 2001, 2002, 2009, and 2010.', 'range', 2000, 2010, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000018b', 'Activities', 'Oscar for Dear Basketball', 'Won Academy Award for Best Animated Short Film for Dear Basketball in 2018.', 'point', 2018, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000018b', 'Health', 'Achilles tear 2013', 'Suffered Achilles tendon rupture in April 2013, limiting his final playing years.', 'point', 2013, null, '#ef4444'),
  ('a0000000-0000-0000-0000-00000000018b', 'Relations & Family', 'Married Vanessa Laine', 'Married Vanessa Laine in 2001; have four daughters; Gianna died alongside Kobe in 2020.', 'range', 2001, 2020, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000018b', 'Items', 'Nike Kobe signature line', 'Collaborated with Nike on signature shoe line; shoes retired in his honor after death.', 'range', 2003, 2020, '#64748b');

-- Neymar
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000018c', 'Place & Travel', 'Mogi das Cruzes, Brazil', 'Born in Mogi das Cruzes, São Paulo state; family moved to Santos for his career.', 'range', 1992, 2013, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000018c', 'Place & Travel', 'Barcelona and Paris', 'Moved to Barcelona 2013, then made record-breaking €222M transfer to PSG in 2017.', 'range', 2013, 2023, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000018c', 'Work & Education', 'Professional football career', 'Turned pro at Santos at 17; played for Santos, Barcelona, PSG, and Al-Hilal.', 'range', 2009, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-00000000018c', 'Activities', 'Olympic gold 2016', 'Led Brazil to first-ever Olympic gold medal in football at Rio 2016 with winning penalty.', 'point', 2016, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000018c', 'Activities', 'UEFA Champions League 2015', 'Won the treble with Barcelona including the Champions League title in 2014–15.', 'point', 2015, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000018c', 'Health', 'ACL injury 2023', 'Suffered ACL rupture in October 2023 playing for Brazil, requiring lengthy rehabilitation.', 'point', 2023, null, '#ef4444'),
  ('a0000000-0000-0000-0000-00000000018c', 'Relations & Family', 'Son Davi Lucca', 'Has son Davi Lucca born 2011 with ex-partner Carolina Dantas; maintains close bond.', 'range', 2011, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000018c', 'Assets', 'Neymar Jr Institute', 'Runs social project in Praia Grande helping underprivileged children through sport.', 'range', 2014, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-00000000018c', 'Items', 'Nike NJR signature boots', 'Had long-running Nike signature football boot line before switching to Puma in 2020.', 'range', 2010, 2020, '#64748b');

-- Kylian Mbappé
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000018d', 'Place & Travel', 'Bondy, France', 'Born in Bondy, Seine-Saint-Denis; grew up in the banlieue north of Paris.', 'range', 1998, 2016, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000018d', 'Place & Travel', 'Madrid, Spain', 'Signed for Real Madrid in June 2024 after years of speculation; new chapter begins.', 'range', 2024, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000018d', 'Work & Education', 'Professional football career', 'Debuted for Monaco at 16; joined PSG 2017; moved to Real Madrid 2024.', 'range', 2015, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-00000000018d', 'Activities', 'FIFA World Cup 2018', 'Won World Cup with France at 19, scoring 4 goals and winning Best Young Player.', 'point', 2018, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000018d', 'Activities', 'FIFA World Cup 2022 hat-trick final', 'Scored hat-trick in 2022 World Cup Final against Argentina; France lost on penalties.', 'point', 2022, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000018d', 'Activities', 'Ligue 1 top scorer multiple seasons', 'Led Ligue 1 in goals for multiple consecutive seasons while at PSG.', 'range', 2018, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000018d', 'Relations & Family', 'Donated World Cup 2018 earnings', 'Donated entire France squad bonus (~€500K) to a children''s charity after 2018 World Cup.', 'point', 2018, null, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000018d', 'Assets', 'Haut les Coeurs association', 'Funds youth football programmes through his charitable foundation Inspired by KM.', 'range', 2020, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-00000000018d', 'Items', 'Nike Mercurial signature boots', 'Has had signature Nike Mercurial football boot colourways dedicated to him since 2018.', 'range', 2018, 2024, '#64748b');

-- Erling Haaland
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000018e', 'Place & Travel', 'Leeds, England', 'Born in Leeds while father Alfie Haaland played for Manchester City; grew up in Norway.', 'range', 2000, 2016, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000018e', 'Place & Travel', 'Bryne, Norway', 'Grew up in Bryne, Rogaland; began career at local club Bryne FK.', 'range', 2000, 2019, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000018e', 'Place & Travel', 'Manchester, England', 'Moved to Manchester City in June 2022; immediately broke Premier League scoring records.', 'range', 2022, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000018e', 'Work & Education', 'Professional football career', 'Career at Molde, Salzburg, Dortmund, then Man City from 2022; prodigious scorer.', 'range', 2016, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-00000000018e', 'Activities', '36 PL goals in debut season', 'Scored 36 Premier League goals in 2022–23, demolishing the single-season PL record.', 'point', 2023, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000018e', 'Activities', 'UCL Golden Boot 2022', 'Won Champions League Golden Boot with Dortmund in 2021–22 season before joining City.', 'point', 2022, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000018e', 'Activities', 'Premier League title 2023', 'Part of Manchester City treble-winning squad in 2022–23 (PL, FA Cup, UCL).', 'point', 2023, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000018e', 'Relations & Family', 'Partner Isabel Haugseng Johansen', 'Dating childhood sweetheart Isabel Haugseng Johansen from Bryne.', 'range', 2022, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000018e', 'Items', 'Nike Air Zoom Mercurial Haaland', 'Has dedicated Nike boot colourways; Nike partnership includes signature gear.', 'range', 2022, 2024, '#64748b');

-- Robert Lewandowski
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000018f', 'Place & Travel', 'Warsaw, Poland', 'Born in Warsaw; came through youth system at Legia Warsaw before moving abroad.', 'range', 1988, 2008, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000018f', 'Place & Travel', 'Munich, Germany', 'Joined Bayern Munich in 2014; became the club''s all-time top scorer.', 'range', 2014, 2022, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000018f', 'Place & Travel', 'Barcelona, Spain', 'Transferred to FC Barcelona in 2022; continued prolific scoring in La Liga.', 'range', 2022, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000018f', 'Work & Education', 'Professional football career', 'Professional since 2005; played for Znicz, Lech Poznań, Dortmund, Bayern, Barça.', 'range', 2005, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-00000000018f', 'Activities', 'UEFA Champions League 2020', 'Won UCL with Bayern Munich in 2019–20, scoring 15 goals including 4 in semis.', 'point', 2020, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000018f', 'Activities', '41 Bundesliga goals in 2020–21', 'Broke Gerd Müller''s 49-year-old Bundesliga single-season record with 41 goals.', 'point', 2021, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000018f', 'Relations & Family', 'Married Anna Lewandowska', 'Married karate athlete Anna Stachurska in 2013; have two daughters together.', 'range', 2013, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000018f', 'Assets', 'RL9 brand', 'Launched personal brand RL9 including nutrition products, supplements, and apparel.', 'range', 2018, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-00000000018f', 'Health', 'Knee injury 2021', 'Missed several key games in 2021 including Germany vs Poland due to knee ligament damage.', 'point', 2021, null, '#ef4444');

-- Zlatan Ibrahimovic
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000190', 'Place & Travel', 'Malmö, Sweden', 'Born in Malmö to Bosnian father and Croatian mother; grew up in Rosengård housing estate.', 'range', 1981, 2001, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000190', 'Place & Travel', 'Multiple club cities', 'Played in Amsterdam, Turin, Barcelona, Milan, Paris, Manchester, LA, and Milan again.', 'range', 2001, 2023, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000190', 'Work & Education', 'Professional football career', 'Pro career 1999–2023 spanning Ajax, Juve, Inter, Barça, AC Milan, PSG, Man Utd, LA Galaxy.', 'range', 1999, 2023, '#10b981'),
  ('a0000000-0000-0000-0000-000000000190', 'Activities', 'Ligue 1 and multiple league titles', 'Won league titles in Netherlands, Italy, Spain, France (×4), Sweden — 12 in total.', 'range', 2002, 2016, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000190', 'Activities', 'Sweden all-time top scorer', 'Finished Sweden career with 62 international goals — the nation''s all-time record.', 'point', 2016, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000190', 'Health', 'Achilles injury at 36', 'Ruptured Achilles at age 36 with Manchester United in 2017 but returned to play.', 'point', 2017, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000190', 'Relations & Family', 'Partner Helena Seger', 'Long-term partner Helena Seger since 2002; have two sons, Maximilian and Vincent.', 'range', 2002, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000190', 'Assets', 'A-Z restaurant Malmö', 'Co-owns A-Z Restaurant in Malmö; part of wider food and beverage investments.', 'range', 2019, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-000000000190', 'Items', 'Autobiography I Am Zlatan', 'Published autobiography ''I am Zlatan'' in 2011; became bestseller in Sweden and Europe.', 'point', 2011, null, '#64748b');

-- Thierry Henry
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000191', 'Place & Travel', 'Les Ulis, France', 'Born and raised in Les Ulis, Essonne; came through Monaco academy from age 13.', 'range', 1977, 1999, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000191', 'Place & Travel', 'London, England', 'Joined Arsenal in 1999 in transformative transfer; became club''s all-time top scorer.', 'range', 1999, 2007, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000191', 'Work & Education', 'Professional football career', 'Played for Monaco, Juventus, Arsenal, Barcelona, Red Bulls, and NY Red Bulls 1994–2014.', 'range', 1994, 2014, '#10b981'),
  ('a0000000-0000-0000-0000-000000000191', 'Work & Education', 'Coaching and punditry', 'Managed Belgium U21s and CF Montréal; worked as pundit for CBS Sports and Sky Sports.', 'range', 2016, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-000000000191', 'Activities', 'FIFA World Cup 1998', 'Won FIFA World Cup with France at home in 1998; scored three goals in the tournament.', 'point', 1998, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000191', 'Activities', 'UEFA Euro 2000', 'Won UEFA European Championship with France in 2000, completing golden generation era.', 'point', 2000, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000191', 'Activities', 'Arsenal Invincibles 2003–04', 'Part of Arsenal''s unbeaten Premier League season — the last club to go undefeated.', 'point', 2004, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000191', 'Relations & Family', 'Daughter Tea Henry', 'Has daughter Tea from first marriage to model Claire Merry (divorced 2008).', 'range', 2003, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000191', 'Items', 'Adidas T90 endorsement', 'Became face of Adidas in early 2000s; closely associated with Total 90 boot campaigns.', 'range', 2000, 2007, '#64748b');

-- Zinedine Zidane
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000192', 'Place & Travel', 'Marseille, France', 'Born in La Castellane, Marseille to Algerian parents; youth career at Cannes.', 'range', 1972, 1992, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000192', 'Place & Travel', 'Madrid, Spain', 'Joined Real Madrid in 2001 in then-world record £46.5M transfer; became manager 2016.', 'range', 2001, 2021, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000192', 'Work & Education', 'Professional football career', 'Played for Cannes, Bordeaux, Juventus, and Real Madrid; retired 2006.', 'range', 1989, 2006, '#10b981'),
  ('a0000000-0000-0000-0000-000000000192', 'Work & Education', 'Real Madrid head coach', 'Managed Real Madrid 2016–2021; won three consecutive Champions League titles.', 'range', 2016, 2021, '#10b981'),
  ('a0000000-0000-0000-0000-000000000192', 'Activities', 'FIFA World Cup 1998', 'Won the World Cup with France scoring twice in the final against Brazil.', 'point', 1998, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000192', 'Activities', 'UEFA Euro 2000', 'Won the European Championship with France in 2000 on home territory.', 'point', 2000, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000192', 'Activities', '3 consecutive UCL titles as manager', 'First manager to win Champions League in three consecutive seasons (2016, 2017, 2018).', 'range', 2016, 2018, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000192', 'Relations & Family', 'Married Véronique Fernández', 'Married Véronique Fernández in 1994; they have four sons, all professional footballers.', 'range', 1994, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000192', 'Items', '2006 World Cup headbutt', 'Headbutted Marco Materazzi in 2006 World Cup Final — infamous end to legendary career.', 'point', 2006, null, '#64748b');

-- Ronaldinho
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000193', 'Place & Travel', 'Porto Alegre, Brazil', 'Born in Porto Alegre; grew up playing futsal in neighbourhood of Vila Nova.', 'range', 1980, 2001, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000193', 'Place & Travel', 'Barcelona, Spain', 'Moved to Barcelona in 2003; dazzled Camp Nou for five seasons with unmatched flair.', 'range', 2003, 2008, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000193', 'Work & Education', 'Professional football career', 'Played for Grêmio, PSG, Barcelona, AC Milan, Flamengo, Atlético Mineiro, and others.', 'range', 1998, 2018, '#10b981'),
  ('a0000000-0000-0000-0000-000000000193', 'Activities', 'FIFA World Cup 2002', 'Won World Cup with Brazil in Japan/Korea 2002; scored iconic free kick vs England.', 'point', 2002, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000193', 'Activities', 'FIFA World Player of the Year', 'Won FIFA World Player of the Year award in 2004 and 2005 at height of his powers.', 'range', 2004, 2005, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000193', 'Activities', 'UCL winner 2006', 'Won Champions League with Barcelona in 2005–06 season.', 'point', 2006, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000193', 'Health', 'Arrested in Paraguay 2020', 'Detained in Asunción for alleged use of fraudulent documents; released after 32 days.', 'point', 2020, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000193', 'Relations & Family', 'Sons João and João Mendes', 'Has son João from Janaína Mendes; close family unit despite not marrying.', 'range', 2005, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000193', 'Items', 'Nike Total 90 campaigns', 'Featured in iconic Nike Total 90 and Joga Bonito advertising campaigns in mid-2000s.', 'range', 2003, 2008, '#64748b');

-- Pep Guardiola
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000194', 'Place & Travel', 'Santpedor, Spain', 'Born in Santpedor, Catalonia; joined La Masia academy at 13 and played for Barcelona.', 'range', 1971, 2001, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000194', 'Place & Travel', 'Manchester, England', 'Moved to Manchester in 2016 to manage City; dominant era in English football followed.', 'range', 2016, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000194', 'Work & Education', 'Playing career', 'Midfielder for Barcelona 1990–2001, winning 6 La Liga titles; also played in Italy and UAE.', 'range', 1990, 2006, '#10b981'),
  ('a0000000-0000-0000-0000-000000000194', 'Work & Education', 'Managerial career', 'Managed Barcelona B, Barcelona, Bayern Munich, and Manchester City from 2007.', 'range', 2007, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-000000000194', 'Activities', 'Barcelona treble 2009 and 2011', 'Won historic back-to-back trebles (La Liga, Copa del Rey, UCL) with Barcelona.', 'range', 2009, 2011, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000194', 'Activities', 'Manchester City treble 2023', 'Guided City to historic Premier League, FA Cup, and Champions League treble.', 'point', 2023, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000194', 'Relations & Family', 'Married Cristina Serra', 'Married Cristina Serra in 2014; separated 2022 after 30 years together; three children.', 'range', 2014, 2022, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000194', 'Assets', 'Premier League record titles', 'Won a record 6 Premier League titles with Manchester City as manager.', 'range', 2018, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-000000000194', 'Items', 'Tactical philosophy tiki-taka', 'Developed and globalised tiki-taka possession-based football philosophy at Barcelona.', 'range', 2008, 2012, '#64748b');

-- Jose Mourinho
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000195', 'Place & Travel', 'Setúbal, Portugal', 'Born in Setúbal; father was a professional goalkeeper; studied sports science.', 'range', 1963, 1992, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000195', 'Place & Travel', 'London, England', 'Managed Chelsea twice and Tottenham; spent significant years living and working in London.', 'range', 2004, 2021, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000195', 'Work & Education', 'Managerial career', 'Managed Porto, Chelsea, Inter Milan, Real Madrid, ManUtd, Spurs, Roma, and Fenerbahçe.', 'range', 2000, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-000000000195', 'Work & Education', 'Bobby Robson & Barça era', 'Worked as interpreter/assistant under Bobby Robson at Sporting CP, Porto, and Barcelona.', 'range', 1992, 2000, '#10b981'),
  ('a0000000-0000-0000-0000-000000000195', 'Activities', 'Porto UCL 2004 and Inter UCL 2010', 'Won Champions League with Porto in 2003–04 and with Inter Milan in 2009–10.', 'range', 2004, 2010, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000195', 'Activities', 'Premier League titles with Chelsea', 'Won Premier League in 2004–05 and 2005–06 with Chelsea; returned to win 2014–15.', 'range', 2005, 2015, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000195', 'Relations & Family', 'Married Matilde Faria', 'Married Matilde Faria in 1989; they have two children, Matilde and José Mário Jr.', 'range', 1989, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000195', 'Assets', 'Self-brand "The Special One"', 'The "Special One" nickname became a globally recognised brand since Chelsea unveiling 2004.', 'range', 2004, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-000000000195', 'Items', 'UEFA Conference League 2022', 'Won UEFA Conference League with AS Roma in 2022 — becoming only manager to win all 3 UEFA trophies.', 'point', 2022, null, '#64748b');

-- Patrick Mahomes
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000196', 'Place & Travel', 'Tyler, Texas', 'Born in Tyler; father Pat Sr. pitched in MLB — grew up around elite professional sport.', 'range', 1995, 2017, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000196', 'Place & Travel', 'Kansas City, Missouri', 'Drafted 10th overall by Kansas City Chiefs in 2017; made KC home base ever since.', 'range', 2017, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000196', 'Work & Education', 'NFL career – Kansas City Chiefs', 'Became starting QB in 2018; led Chiefs to four Super Bowl wins in his first six seasons.', 'range', 2017, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-000000000196', 'Activities', 'NFL MVP 2018', 'Won NFL Most Valuable Player at just 23 throwing 50 TD passes in his first full season.', 'point', 2018, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000196', 'Activities', '4 Super Bowl titles', 'Won Super Bowl LIV, LVII, LVIII, and a fourth title — one of the greatest QBs of all time.', 'range', 2020, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000196', 'Activities', 'Multiple Super Bowl MVPs', 'Won Super Bowl Most Valuable Player award multiple times cementing all-time status.', 'range', 2020, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000196', 'Relations & Family', 'Married Brittany Matthews', 'Married childhood sweetheart Brittany Matthews in March 2022; have two children together.', 'range', 2022, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000196', 'Assets', '$503M contract extension', 'Signed 10-year, $503M contract extension with Chiefs in 2020 — richest in NFL history at time.', 'point', 2020, null, '#14b8a6'),
  ('a0000000-0000-0000-0000-000000000196', 'Items', 'Adidas and State Farm endorsements', 'Has major endorsements with Adidas, State Farm, Oakley, and Coors Light.', 'range', 2018, 2024, '#64748b');

-- Tom Brady
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000197', 'Place & Travel', 'San Mateo, California', 'Born in San Mateo; grew up a sports fan attending Giants and 49ers games with family.', 'range', 1977, 2000, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000197', 'Place & Travel', 'Boston, Massachusetts', 'Played for New England Patriots 2000–2019; became synonymous with Boston dynasty era.', 'range', 2000, 2020, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000197', 'Work & Education', 'NFL career', 'Drafted 199th overall in 2000; played until 2022 for New England Patriots and Tampa Bay.', 'range', 2000, 2023, '#10b981'),
  ('a0000000-0000-0000-0000-000000000197', 'Work & Education', 'Fox Sports analyst', 'Signed record $375M 10-year deal with Fox Sports to become lead NFL analyst from 2023.', 'range', 2023, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-000000000197', 'Activities', '7 Super Bowl titles', 'Won Super Bowls with Patriots (XXXVI, XXXVIII, XXXIX, XLIX, LI, LIII) and Tampa Bay (LV).', 'range', 2002, 2021, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000197', 'Health', 'Two retirements', 'Retired February 2022 then unretired 40 days later; finally retired for good in 2023.', 'range', 2022, 2023, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000197', 'Relations & Family', 'Married Gisele Bündchen', 'Married supermodel Gisele Bündchen in 2009; divorced October 2022 after 13 years.', 'range', 2009, 2022, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000197', 'Assets', 'TB12 Sports brand', 'Founded TB12 Sports promoting his pliability-based training method and nutrition products.', 'range', 2016, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-000000000197', 'Items', 'Deflategate suspension', 'Suspended 4 games in 2016 after NFL investigation into underinflated footballs (PSI-gate).', 'point', 2016, null, '#64748b');

-- Aaron Rodgers
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000198', 'Place & Travel', 'Chico, California', 'Born in Chico; played at Butte College then transferred to UC Berkeley before NFL draft.', 'range', 1983, 2005, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000198', 'Place & Travel', 'Green Bay, Wisconsin', 'Drafted 24th overall by Green Bay Packers in 2005; played there for 18 seasons.', 'range', 2005, 2023, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000198', 'Work & Education', 'NFL career', 'Played for Green Bay Packers 2005–2022 then traded to New York Jets in 2023.', 'range', 2005, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-000000000198', 'Activities', 'Super Bowl XLV MVP', 'Led Packers to Super Bowl XLV victory over Steelers in February 2011, winning MVP.', 'point', 2011, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000198', 'Activities', '4 NFL MVP awards', 'Won NFL Most Valuable Player in 2011, 2014, 2020, and 2021 — tied record.', 'range', 2011, 2021, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000198', 'Health', 'Achilles rupture 2023', 'Tore Achilles tendon on 4th play of Jets debut in September 2023; missed entire season.', 'point', 2023, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000198', 'Relations & Family', 'Engagement to Shailene Woodley', 'Announced engagement to actress Shailene Woodley in early 2021; relationship ended 2022.', 'range', 2020, 2022, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000198', 'Assets', 'State Farm ambassador', 'Long-running State Farm endorsement deal including iconic Discount Double Check ads.', 'range', 2012, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-000000000198', 'Items', 'Jeopardy guest host 2021', 'Served as celebrity guest host for Jeopardy! in 2021; well received by viewers.', 'point', 2021, null, '#64748b');

-- Peyton Manning
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000199', 'Place & Travel', 'New Orleans, Louisiana', 'Born in New Orleans to NFL QB Archie Manning; grew up surrounded by professional football.', 'range', 1976, 1998, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000199', 'Place & Travel', 'Indianapolis and Denver', 'Career spanned Indianapolis Colts (1998–2011) and Denver Broncos (2012–2015).', 'range', 1998, 2016, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000199', 'Work & Education', 'NFL career', 'Drafted 1st overall in 1998; 5x NFL MVP, 2x Super Bowl champion, Hall of Famer.', 'range', 1998, 2016, '#10b981'),
  ('a0000000-0000-0000-0000-000000000199', 'Work & Education', 'Omaha Productions media', 'Co-founded Omaha Productions media company producing NFL Films documentary content.', 'range', 2020, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-000000000199', 'Activities', '2 Super Bowl titles', 'Won Super Bowl XLI with Indianapolis Colts (2007) and Super Bowl 50 with Broncos (2016).', 'range', 2007, 2016, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000199', 'Activities', '5 NFL MVP awards', 'Won five league MVP awards — a record shared only with Brady in NFL history.', 'range', 2003, 2013, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000199', 'Health', 'Neck surgery 2011', 'Had spinal fusion surgery causing him to miss the entire 2011 season with Indianapolis.', 'point', 2011, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000199', 'Relations & Family', 'Married Ashley Thompson', 'Married Ashley Thompson in 2001; they have twins Marshall and Mosley.', 'range', 2001, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000199', 'Items', 'MasterClass on quarterback play', 'Hosted MasterClass session on quarterback technique and leadership in elite sport.', 'point', 2021, null, '#64748b');

-- Mike Trout
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000019a', 'Place & Travel', 'Vineland, New Jersey', 'Born and raised in Vineland; starred at Millville Senior High School before MLB draft.', 'range', 1991, 2009, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000019a', 'Place & Travel', 'Anaheim, California', 'Spent entire MLB career with the Los Angeles Angels in Anaheim from 2011 onwards.', 'range', 2011, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000019a', 'Work & Education', 'MLB career – LA Angels', 'Drafted 25th overall in 2009; widely regarded as the best baseball player of his generation.', 'range', 2009, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-00000000019a', 'Activities', 'AL Rookie of the Year 2012', 'Won American League Rookie of the Year award in his first full MLB season.', 'point', 2012, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000019a', 'Activities', '3 AL MVP awards', 'Won American League MVP award in 2014, 2016, and 2019 — third most in AL history.', 'range', 2014, 2019, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000019a', 'Health', 'Calf and back injuries 2021–2023', 'Battled recurring injuries limiting him to fewer than 40 games over three consecutive seasons.', 'range', 2021, 2023, '#ef4444'),
  ('a0000000-0000-0000-0000-00000000019a', 'Relations & Family', 'Married Jessica Cox', 'Married childhood sweetheart Jessica Cox in 2017; have son Beckham Aaron born 2020.', 'range', 2017, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000019a', 'Assets', '$426.5M Angels contract', 'Signed the richest contract in North American sports history with the Angels in 2019.', 'point', 2019, null, '#14b8a6'),
  ('a0000000-0000-0000-0000-00000000019a', 'Items', 'Nike endorsement', 'Long-standing Nike endorsement deal including signature cleats and training apparel line.', 'range', 2014, 2024, '#64748b');

-- Derek Jeter
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000019b', 'Place & Travel', 'Pequannock, New Jersey', 'Born in Pequannock; grew up in Kalamazoo, Michigan as a lifelong Yankees fan.', 'range', 1974, 1995, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000019b', 'Place & Travel', 'New York City', 'Played entire 20-year career with the New York Yankees; became the face of the franchise.', 'range', 1995, 2014, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000019b', 'Work & Education', 'MLB career – New York Yankees', 'Drafted 6th overall in 1992; 14x All-Star, 5x World Series champion, Hall of Famer.', 'range', 1992, 2014, '#10b981'),
  ('a0000000-0000-0000-0000-00000000019b', 'Work & Education', 'Miami Marlins CEO', 'Purchased controlling share of Miami Marlins in 2017; served as CEO until 2022.', 'range', 2017, 2022, '#10b981'),
  ('a0000000-0000-0000-0000-00000000019b', 'Activities', '5 World Series titles', 'Won World Series with Yankees in 1996, 1998, 1999, 2000, and 2009.', 'range', 1996, 2009, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000019b', 'Activities', 'Baseball Hall of Fame 2020', 'Elected to Baseball Hall of Fame in 2020 with 99.7% of votes — near-unanimous.', 'point', 2020, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000019b', 'Relations & Family', 'Married Hannah Davis', 'Married Sports Illustrated model Hannah Davis in 2016; have two daughters together.', 'range', 2016, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000019b', 'Assets', 'The Players Tribune', 'Co-founded The Players Tribune in 2014 — athlete-authored media platform for storytelling.', 'range', 2014, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-00000000019b', 'Items', 'Jordan Brand deal', 'Had long-running signature Jordan Brand endorsement — rare for a non-basketball athlete.', 'range', 1999, 2014, '#64748b');

-- Barry Bonds
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000019c', 'Place & Travel', 'Riverside, California', 'Born in Riverside; son of MLB star Bobby Bonds; grew up in clubhouses around baseball.', 'range', 1964, 1986, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000019c', 'Place & Travel', 'San Francisco, California', 'Joined San Francisco Giants in 1993; broke home run records at what is now Oracle Park.', 'range', 1993, 2007, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000019c', 'Work & Education', 'MLB career', 'Played 22 seasons for Pittsburgh Pirates and San Francisco Giants from 1986 to 2007.', 'range', 1986, 2007, '#10b981'),
  ('a0000000-0000-0000-0000-00000000019c', 'Activities', '73 HR season record 2001', 'Hit 73 home runs in the 2001 regular season — still the MLB single-season record.', 'point', 2001, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000019c', 'Activities', '7 NL MVP awards', 'Won National League MVP award a record seven times (1990, 1992, 1993, 2001–2004).', 'range', 1990, 2004, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000019c', 'Activities', 'All-time HR record 762', 'Hit 762 career home runs — the MLB all-time record, surpassing Hank Aaron in 2007.', 'point', 2007, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000019c', 'Health', 'BALCO investigation', 'Connected to BALCO steroids investigation in 2003; indicted for perjury; records asterisked.', 'range', 2003, 2011, '#ef4444'),
  ('a0000000-0000-0000-0000-00000000019c', 'Relations & Family', 'Two marriages', 'Married Elizabeth Watson 1988–1994, then Liz Neufeld 1998; has three children total.', 'range', 1988, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000019c', 'Items', 'Hall of Fame exclusion', 'Repeatedly denied Baseball Hall of Fame entry due to PED allegations despite statistical records.', 'range', 2013, 2022, '#64748b');

-- Alex Rodriguez
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000019d', 'Place & Travel', 'New York City', 'Born in Washington Heights, NYC; raised partly in Miami after parents divorced.', 'range', 1975, 1993, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000019d', 'Place & Travel', 'Seattle, Texas, and New York', 'Played for Seattle Mariners (1994–2000), Texas Rangers (2001–03), and Yankees (2004–2016).', 'range', 1994, 2016, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000019d', 'Work & Education', 'MLB career', 'Drafted 1st overall in 1993; 696 career HR, 14x All-Star, 3x AL MVP.', 'range', 1993, 2016, '#10b981'),
  ('a0000000-0000-0000-0000-00000000019d', 'Work & Education', 'A-Rod Corp investments', 'Founded A-Rod Corp after retirement; invested in real estate, technology, and sports teams.', 'range', 2016, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-00000000019d', 'Activities', '3 AL MVP awards', 'Won American League MVP in 2003, 2005, and 2007 with the New York Yankees.', 'range', 2003, 2007, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000019d', 'Activities', 'World Series 2009', 'Won World Series with New York Yankees in 2009 — his only championship ring.', 'point', 2009, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000019d', 'Health', 'Biogenesis suspension 2014', 'Suspended for entire 2014 season (162 games) for PED use connected to Biogenesis clinic.', 'point', 2014, null, '#ef4444'),
  ('a0000000-0000-0000-0000-00000000019d', 'Relations & Family', 'Engaged Jennifer Lopez', 'Announced engagement to Jennifer Lopez in March 2019; relationship called off in 2021.', 'range', 2019, 2021, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000019d', 'Assets', 'Minnesota Timberwolves stake', 'Led investor group to purchase controlling interest in Minnesota Timberwolves NBA team.', 'point', 2021, null, '#14b8a6');

-- Maria Sharapova
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000019e', 'Place & Travel', 'Nyagan, Russia', 'Born in Nyagan, Siberia; family moved to Sochi then relocated to Florida for tennis.', 'range', 1987, 2001, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000019e', 'Place & Travel', 'Bradenton, Florida', 'Moved to IMG Academy in Bradenton at age 9 to pursue elite tennis training.', 'range', 1996, 2001, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000019e', 'Work & Education', 'Professional tennis career', 'Turned pro 2001; won 5 Grand Slams; ranked world No. 1 five separate times.', 'range', 2001, 2020, '#10b981'),
  ('a0000000-0000-0000-0000-00000000019e', 'Work & Education', 'Harvard Business School', 'Completed executive education program at Harvard Business School in 2015.', 'point', 2015, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000019e', 'Activities', '5 Grand Slam titles', 'Won Wimbledon (2004), US Open (2006), Australian Open (2008), French Open (2012, 2014).', 'range', 2004, 2014, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000019e', 'Activities', 'Olympic silver medal 2012', 'Won silver medal at London 2012 Olympics representing Russia in singles.', 'point', 2012, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000019e', 'Health', 'Meldonium doping ban 2016', 'Received 15-month doping ban after testing positive for meldonium at 2016 Australian Open.', 'range', 2016, 2017, '#ef4444'),
  ('a0000000-0000-0000-0000-00000000019e', 'Relations & Family', 'Engaged Alexander Gilkes', 'Announced engagement to art entrepreneur Alexander Gilkes in 2020.', 'point', 2020, null, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000019e', 'Assets', 'Sugarpova candy brand', 'Founded Sugarpova premium candy brand in 2012; sold globally in over 30 countries.', 'range', 2012, 2024, '#14b8a6');

-- Ashleigh Barty
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000019f', 'Place & Travel', 'Ipswich, Queensland', 'Born in Ipswich, Queensland; identified as tennis prodigy from a very young age.', 'range', 1996, 2016, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000019f', 'Work & Education', 'Tennis career', 'Turned pro 2010; stepped away for cricket 2014–2016; returned to reach world No. 1.', 'range', 2010, 2022, '#10b981'),
  ('a0000000-0000-0000-0000-00000000019f', 'Work & Education', 'Women''s cricket stint', 'Played for Brisbane Heat in Women''s Big Bash League 2014–15 during tennis hiatus.', 'range', 2014, 2016, '#10b981'),
  ('a0000000-0000-0000-0000-00000000019f', 'Activities', 'French Open 2019', 'Won her first Grand Slam title at Roland Garros 2019, claiming world No. 1 ranking.', 'point', 2019, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000019f', 'Activities', 'Wimbledon 2021', 'Won Wimbledon in 2021 — her second Grand Slam title on the grass of Centre Court.', 'point', 2021, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000019f', 'Activities', 'Australian Open 2022', 'Won Australian Open in January 2022 completing a career Grand Slam on home soil.', 'point', 2022, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000019f', 'Health', 'Shock retirement at 25', 'Announced retirement in March 2022 at career peak citing personal fulfilment goals.', 'point', 2022, null, '#ef4444'),
  ('a0000000-0000-0000-0000-00000000019f', 'Relations & Family', 'Married Garry Kissick', 'Married golfer Garry Kissick in July 2022, months after her stunning retirement announcement.', 'point', 2022, null, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000019f', 'Items', 'Australian of the Year 2022', 'Named Australian of the Year in January 2022 for contributions to sport and the community.', 'point', 2022, null, '#64748b');

-- Iga Swiatek
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001a0', 'Place & Travel', 'Warsaw, Poland', 'Born in Warsaw; sister Agata is a professional rower; sport deeply embedded in the family.', 'range', 2001, 2016, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001a0', 'Work & Education', 'Professional tennis career', 'Turned pro in 2016; won French Open as a 19-year-old in 2020 — dominant clay player.', 'range', 2016, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001a0', 'Activities', 'French Open 2020', 'Won Roland Garros 2020 without dropping a set — stunning debut major victory at age 19.', 'point', 2020, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a0', 'Activities', 'Multiple French Opens 2022–2024', 'Won Roland Garros in 2022, 2023, and 2024 — historically dominant clay court presence.', 'range', 2022, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a0', 'Activities', '37-match winning streak 2022', 'Won 37 consecutive WTA matches in 2022 — one of the longest streaks in Open Era tennis.', 'point', 2022, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a0', 'Health', 'Trimetazidine suspension 2022', 'Received one-month provisional suspension in late 2022 due to contaminated supplement.', 'point', 2022, null, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000001a0', 'Relations & Family', 'Polish national hero', 'Became Poland''s most prominent active athlete; celebrated as a national icon in Warsaw.', 'range', 2022, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001a0', 'Assets', 'Rolex and Porsche deals', 'Signed major endorsement agreements with Rolex and Porsche as global brand ambassador.', 'range', 2022, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-0000000001a0', 'Items', 'WTA World No. 1 for 100+ weeks', 'Held WTA world No. 1 ranking for over 100 consecutive weeks starting from April 2022.', 'range', 2022, 2024, '#64748b');

-- Coco Gauff
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001a1', 'Place & Travel', 'Delray Beach, Florida', 'Born in Delray Beach; trained from early age at Patrick Mouratoglou tennis academy.', 'range', 2004, 2018, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001a1', 'Work & Education', 'Professional tennis career', 'Turned pro in 2018 at age 14; became youngest qualifier to win a Wimbledon main draw match.', 'range', 2018, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001a1', 'Activities', 'Wimbledon 2019 — Serena upset', 'Beat Serena Williams at Wimbledon age 15 in third round — worldwide breakout moment.', 'point', 2019, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a1', 'Activities', 'US Open 2023 title', 'Won US Open in September 2023 — her first Grand Slam singles title at age 19.', 'point', 2023, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a1', 'Activities', 'Olympic gold 2024', 'Won Olympic gold in mixed doubles with Taylor Fritz at Paris 2024 Games.', 'point', 2024, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a1', 'Relations & Family', 'Social justice activism', 'Spoke at March for Our Lives in 2018; consistently uses platform for civil rights causes.', 'range', 2018, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001a1', 'Assets', 'New Balance and Rolex deals', 'Signed headline endorsement deals with New Balance and Rolex as a teenager.', 'range', 2020, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-0000000001a1', 'Items', 'Vogue and fashion covers', 'Featured on covers of Teen Vogue and major international fashion magazines.', 'range', 2021, 2024, '#64748b'),
  ('a0000000-0000-0000-0000-0000000001a1', 'Health', 'Balanced season schedule', 'Carefully managed injury prevention protocols to sustain long competitive season schedules.', 'range', 2022, 2024, '#ef4444');

-- Mia Hamm
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001a2', 'Place & Travel', 'Selma, Alabama', 'Born in Selma to Air Force family; moved frequently across USA and spent time in Italy.', 'range', 1972, 1990, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001a2', 'Place & Travel', 'Chapel Hill, North Carolina', 'Attended UNC Chapel Hill; won 4 national championships under coach Anson Dorrance.', 'range', 1989, 1994, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001a2', 'Work & Education', 'USWNT and WUSA career', 'Played for USWNT 1987–2004 and WUSA Washington Freedom 2001–2003.', 'range', 1987, 2004, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001a2', 'Activities', 'FIFA World Cup 1991 and 1999', 'Won World Cup with USA in 1991 (inaugural) and iconic 1999 tournament on home soil.', 'range', 1991, 1999, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a2', 'Activities', 'Olympic gold 1996 and 2000', 'Won Olympic gold medals at Atlanta 1996 and Sydney 2000 with the USWNT.', 'range', 1996, 2000, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a2', 'Activities', 'FIFA Female Player of the Year', 'Won FIFA Female Player of the Year award in 2001 and 2002 back-to-back.', 'range', 2001, 2002, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a2', 'Health', 'Mia Hamm Foundation', 'Founded foundation after brother Garrett''s death; focused on bone marrow disease research.', 'range', 1999, 2024, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000001a2', 'Relations & Family', 'Married Nomar Garciaparra', 'Married MLB star Nomar Garciaparra in 2003; they have three children together.', 'range', 2003, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001a2', 'Assets', 'Advocacy and foundation work', 'Built lasting philanthropic legacy through Mia Hamm Foundation supporting youth sport.', 'range', 1999, 2024, '#14b8a6');

-- Abby Wambach
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001a3', 'Place & Travel', 'Rochester, New York', 'Born and raised in Rochester; one of seven children; standout at Our Lady of Mercy school.', 'range', 1980, 2002, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001a3', 'Work & Education', 'USWNT and club career', 'Played WUSA/WPS/NWSL clubs; USWNT 2001–2015; became all-time international top scorer.', 'range', 2001, 2015, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001a3', 'Activities', '184 international goals', 'Scored 184 goals for USA — then the world record for men''s or women''s international football.', 'range', 2001, 2015, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a3', 'Activities', 'Olympic gold 2004 and 2012', 'Won Olympic gold medals at Athens 2004 and London 2012 with the USWNT.', 'range', 2004, 2012, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a3', 'Activities', 'FIFA World Cup 2015', 'Won FIFA World Cup with USA in 2015 — celebrated as key leader in the squad.', 'point', 2015, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a3', 'Health', 'DUI arrest 2016', 'Arrested for DUI in April 2016; became public turning point leading to sobriety journey.', 'point', 2016, null, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000001a3', 'Relations & Family', 'Married Glennon Doyle', 'Married author and activist Glennon Doyle in 2017 after coming out publicly.', 'point', 2017, null, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001a3', 'Assets', 'Author and speaker', 'Wrote bestselling memoir Forward; became paid keynote speaker on leadership and resilience.', 'range', 2016, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-0000000001a3', 'Items', 'FIFA FIFPro Women''s World XI', 'Named to FIFA FIFPro Women''s World XI five times between 2012 and 2015.', 'range', 2012, 2015, '#64748b');

-- Alex Morgan
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001a4', 'Place & Travel', 'San Dimas, California', 'Born in San Dimas; grew up in LA area playing youth soccer from age 7.', 'range', 1989, 2011, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001a4', 'Place & Travel', 'Portland and Orlando', 'Played for Portland Thorns and Orlando Pride in NWSL; also had stint at Tottenham Hotspur.', 'range', 2013, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001a4', 'Work & Education', 'Professional football career', 'Drafted 1st overall in NWSL Draft 2011; USWNT stalwart for over a decade.', 'range', 2011, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001a4', 'Activities', 'FIFA World Cup 2015 and 2019', 'Won back-to-back World Cup titles with USA in the 2015 and 2019 tournaments.', 'range', 2015, 2019, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a4', 'Activities', 'Olympic gold 2012', 'Won gold medal at London 2012 Olympics with the USWNT as a key attacking threat.', 'point', 2012, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a4', 'Health', 'Pregnancy 2020', 'Gave birth to daughter Charlie Elena Carrasco in May 2020 during COVID-19 pandemic.', 'point', 2020, null, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000001a4', 'Relations & Family', 'Married Servando Carrasco', 'Married MLS player Servando Carrasco in 2014; they have daughter Charlie born 2020.', 'range', 2014, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001a4', 'Assets', 'Kicks book series and brand', 'Authored Kicks children''s soccer book series; major sponsorships with Nike and Coca-Cola.', 'range', 2015, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-0000000001a4', 'Items', 'Sports Illustrated Swimsuit 2012', 'Featured on Sports Illustrated Swimsuit Issue in 2012 — raised her profile beyond sport.', 'point', 2012, null, '#64748b');

-- Satya Nadella
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001a5', 'Place & Travel', 'Hyderabad, India', 'Born in Hyderabad; father was an IAS officer; grew up with strong academic foundation.', 'range', 1967, 1990, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001a5', 'Place & Travel', 'Seattle, Washington', 'Moved to Seattle to join Microsoft in 1992; remained at the company ever since.', 'range', 1992, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001a5', 'Work & Education', 'Career at Microsoft', 'Joined Microsoft in 1992; rose through cloud and server divisions; became CEO in 2014.', 'range', 1992, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001a5', 'Work & Education', 'University of Wisconsin-Milwaukee', 'Earned MS in Computer Science from UWM in 1990 after engineering degree in Manipal.', 'range', 1988, 1990, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001a5', 'Activities', 'Microsoft CEO from 2014', 'Became Microsoft CEO in February 2014; tripled company''s market cap over the next decade.', 'range', 2014, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a5', 'Activities', 'Azure cloud platform growth', 'Led dramatic growth of Azure cloud business to become No. 2 cloud provider globally.', 'range', 2011, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a5', 'Activities', 'OpenAI investment', 'Championed and oversaw Microsoft''s multibillion-dollar investment in OpenAI from 2019.', 'range', 2019, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a5', 'Relations & Family', 'Son Zain Nadella', 'Has son Zain who had cerebral palsy; experience shaped Nadella''s empathy-focused leadership.', 'range', 1996, 2022, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001a5', 'Items', 'Book Hit Refresh', 'Published memoir Hit Refresh in 2017 about his leadership philosophy and Microsoft''s renewal.', 'point', 2017, null, '#64748b');

-- Tim Cook
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001a6', 'Place & Travel', 'Robertsdale, Alabama', 'Born in Robertsdale, Alabama; grew up in the Deep South with working-class background.', 'range', 1960, 1982, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001a6', 'Place & Travel', 'Cupertino, California', 'Relocated to Silicon Valley upon joining Apple in 1998; headquartered in Cupertino.', 'range', 1998, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001a6', 'Work & Education', 'Career before Apple', 'Worked at IBM (1982–1994) and Compaq (1997–1998) before joining Apple as COO.', 'range', 1982, 1998, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001a6', 'Work & Education', 'Apple CEO from 2011', 'Succeeded Steve Jobs as Apple CEO in August 2011; grew revenue from $108B to over $400B.', 'range', 2011, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001a6', 'Activities', 'Apple Watch launch 2015', 'Oversaw launch of Apple Watch in April 2015 — company''s first major new product category.', 'point', 2015, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a6', 'Activities', 'Apple Silicon transition', 'Led transition from Intel to Apple Silicon chips starting with M1 in November 2020.', 'point', 2020, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a6', 'Activities', '$3 trillion market cap', 'Under Cook''s leadership Apple became the first company to reach $3 trillion market cap.', 'point', 2022, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a6', 'Relations & Family', 'Came out publicly 2014', 'Publicly came out as gay in an essay for Bloomberg Businessweek in October 2014.', 'point', 2014, null, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001a6', 'Items', 'Duke Fuqua MBA', 'Earned MBA from Duke University Fuqua School of Business in 1988.', 'point', 1988, null, '#64748b');

-- Sundar Pichai
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001a7', 'Place & Travel', 'Madurai, India', 'Born in Madurai, Tamil Nadu; grew up in Chennai with limited resources but excelled academically.', 'range', 1972, 1993, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001a7', 'Place & Travel', 'Silicon Valley, California', 'Moved to Mountain View area after joining Google in 2004; based there since.', 'range', 2004, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001a7', 'Work & Education', 'Education', 'IIT Kharagpur metallurgy degree; Stanford MS materials science; Wharton MBA 2002.', 'range', 1989, 2002, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001a7', 'Work & Education', 'Google/Alphabet CEO', 'Joined Google in 2004; became Google CEO in 2015 and Alphabet CEO in 2019.', 'range', 2004, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001a7', 'Activities', 'Chrome browser launch 2008', 'Led development and launch of Google Chrome, which became the world''s most-used browser.', 'point', 2008, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a7', 'Activities', 'Google AI and Gemini strategy', 'Led Google''s pivot to AI-first strategy including launch of Gemini AI models from 2023.', 'range', 2023, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a7', 'Activities', 'Android and Google Play', 'Oversaw Android growth to 3 billion active devices globally during his product leadership.', 'range', 2008, 2015, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a7', 'Relations & Family', 'Married Anjali Pichai', 'Married Anjali, his college sweetheart from IIT Kharagpur; they have two children.', 'range', 1999, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001a7', 'Assets', 'Multi-billion dollar compensation', 'Received compensation packages totalling billions over tenure including stock awards.', 'range', 2015, 2024, '#14b8a6');

-- Jensen Huang
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001a8', 'Place & Travel', 'Tainan, Taiwan', 'Born in Tainan; family emigrated to the USA when he was nine years old.', 'range', 1963, 1984, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001a8', 'Place & Travel', 'Santa Clara, California', 'Co-founded NVIDIA in Santa Clara in 1993; based in Silicon Valley throughout his career.', 'range', 1993, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001a8', 'Work & Education', 'Oregon State and Stanford degrees', 'Earned BSEE from Oregon State (1984) and MSEE from Stanford University (1992).', 'range', 1980, 1992, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001a8', 'Work & Education', 'NVIDIA CEO and co-founder', 'Co-founded NVIDIA in 1993; remains CEO — one of the longest-serving CEOs in tech history.', 'range', 1993, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001a8', 'Activities', 'CUDA platform launch 2006', 'Launched CUDA in 2006 enabling general-purpose GPU computing that powered AI revolution.', 'point', 2006, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a8', 'Activities', 'AI chip dominance', 'NVIDIA H100 GPUs became the essential infrastructure for training large language models.', 'range', 2022, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a8', 'Activities', '$1 trillion market cap 2023', 'NVIDIA crossed $1 trillion market cap in June 2023 on surging AI demand for its chips.', 'point', 2023, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a8', 'Relations & Family', 'Married Lori Mills', 'Married Lori Mills, his former lab partner at Oregon State; they have two children.', 'range', 1985, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001a8', 'Items', 'Signature leather jacket', 'Known for his black leather jacket worn at all keynotes — became a recognisable tech icon.', 'range', 2010, 2024, '#64748b');

-- Sam Altman
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001a9', 'Place & Travel', 'Chicago, Illinois', 'Born in Chicago; grew up in St. Louis, Missouri; interested in computers from age 8.', 'range', 1985, 2003, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001a9', 'Place & Travel', 'San Francisco, California', 'Moved to SF to join Silicon Valley startup ecosystem; based there throughout career.', 'range', 2005, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001a9', 'Work & Education', 'Stanford dropout and Loopt', 'Dropped out of Stanford CS in 2005 to co-found Loopt, a location-sharing startup.', 'range', 2005, 2012, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001a9', 'Work & Education', 'Y Combinator president', 'Served as president of Y Combinator from 2014 to 2019; oversaw thousands of startups.', 'range', 2014, 2019, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001a9', 'Work & Education', 'OpenAI CEO', 'Became CEO of OpenAI in 2019; oversaw launch of GPT-4, ChatGPT, and DALL-E products.', 'range', 2019, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001a9', 'Activities', 'ChatGPT launch November 2022', 'Launched ChatGPT in November 2022 — fastest product to reach 100M users in history.', 'point', 2022, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a9', 'Activities', 'Board firing and reinstatement 2023', 'Fired by OpenAI board in November 2023 then reinstated within days after massive backlash.', 'point', 2023, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001a9', 'Assets', 'Investments in Stripe and Reddit', 'Made early personal investments in companies including Stripe, Airbnb, and Reddit.', 'range', 2010, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-0000000001a9', 'Items', 'Congressional AI testimony 2023', 'Testified before US Senate in May 2023 advocating for AI regulation and safety oversight.', 'point', 2023, null, '#64748b');

-- Demis Hassabis
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001aa', 'Place & Travel', 'London, England', 'Born in North London; chess prodigy from age 4; attended Cambridge University.', 'range', 1976, 2010, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001aa', 'Place & Travel', 'San Francisco, California', 'DeepMind opened San Francisco office; Hassabis splits time between London and Bay Area.', 'range', 2015, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001aa', 'Work & Education', 'Cambridge and UCL', 'Read Computer Science at Cambridge (Double First); PhD in Cognitive Neuroscience at UCL.', 'range', 1994, 2009, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001aa', 'Work & Education', 'DeepMind CEO and co-founder', 'Co-founded DeepMind in London 2010; acquired by Google in 2014 for ~£400M.', 'range', 2010, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001aa', 'Activities', 'AlphaGo defeats world champion', 'AlphaGo defeated world Go champion Lee Sedol in 2016 — landmark AI achievement.', 'point', 2016, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001aa', 'Activities', 'AlphaFold protein structure', 'AlphaFold solved the protein-folding problem in 2020 — a 50-year-old biology challenge.', 'point', 2020, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001aa', 'Activities', 'Nobel Prize in Chemistry 2024', 'Awarded Nobel Prize in Chemistry 2024 for AlphaFold''s contribution to protein structure prediction.', 'point', 2024, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001aa', 'Relations & Family', 'Married Maro Hassabis', 'Married Maro; the couple have two children and maintain a relatively private family life.', 'range', 2008, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001aa', 'Items', 'CBE for services to science', 'Awarded Commander of the Order of the British Empire (CBE) for services to science.', 'point', 2018, null, '#64748b');

-- Yann LeCun
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001ab', 'Place & Travel', 'Soisy-sous-Montmorency, France', 'Born in Soisy-sous-Montmorency near Paris; studied engineering in France.', 'range', 1960, 1987, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001ab', 'Place & Travel', 'New York City', 'Based in New York as Professor at NYU and Chief AI Scientist at Meta.', 'range', 2003, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001ab', 'Work & Education', 'AT&T Bell Labs researcher', 'Worked at Bell Labs from 1988 developing convolutional neural networks for digit recognition.', 'range', 1988, 2003, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001ab', 'Work & Education', 'Meta Chief AI Scientist', 'Joined Facebook (Meta) as Chief AI Scientist in 2013; also VP of AI Research.', 'range', 2013, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001ab', 'Work & Education', 'NYU Professor', 'Silver Professor at New York University''s Courant Institute and Center for Data Science.', 'range', 2003, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001ab', 'Activities', 'Turing Award 2018', 'Won ACM Turing Award (the "Nobel Prize of computing") jointly with Hinton and Bengio.', 'point', 2018, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001ab', 'Activities', 'Convolutional neural networks', 'Pioneered convolutional neural networks (CNNs) in the late 1980s — foundation of computer vision.', 'range', 1988, 1998, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001ab', 'Relations & Family', 'Married Isabelle Doré', 'Has been married to Isabelle Doré; family life largely kept private outside academic circles.', 'range', 1990, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001ab', 'Items', 'MNIST digit recognition', 'MNIST benchmark dataset for handwritten digits became the "Hello World" of deep learning.', 'point', 1998, null, '#64748b');

-- Geoffrey Hinton
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001ac', 'Place & Travel', 'Wimbledon, London', 'Born in Wimbledon, London; descendant of George Boole; studied at Cambridge and Edinburgh.', 'range', 1947, 1987, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001ac', 'Place & Travel', 'Toronto, Canada', 'Based in Toronto since 1987 as professor at University of Toronto; also worked at Google.', 'range', 1987, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001ac', 'Work & Education', 'University of Toronto professor', 'Professor at U of T from 1987; built pioneering deep learning research group in Toronto.', 'range', 1987, 2023, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001ac', 'Work & Education', 'Google Brain researcher', 'Joined Google following acquisition of DNNresearch in 2013; left Google in 2023.', 'range', 2013, 2023, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001ac', 'Activities', 'Backpropagation popularisation', 'Co-authored foundational 1986 paper on backpropagation — cornerstone of modern neural nets.', 'point', 1986, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001ac', 'Activities', 'AlexNet breakthrough 2012', 'With students Krizhevsky and Sutskever created AlexNet — igniting the deep learning revolution.', 'point', 2012, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001ac', 'Activities', 'Turing Award 2018', 'Won ACM Turing Award jointly with LeCun and Bengio for pioneering deep learning research.', 'point', 2018, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001ac', 'Activities', 'Nobel Prize Physics 2024', 'Awarded Nobel Prize in Physics 2024 (jointly with John Hopfield) for foundational AI work.', 'point', 2024, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001ac', 'Items', 'Left Google to speak freely on AI risks', 'Resigned from Google in 2023 to speak openly about existential risks of AI development.', 'point', 2023, null, '#64748b');

-- Andrew Ng
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001ad', 'Place & Travel', 'London, England', 'Born in London; family relocated to Hong Kong and Singapore; multicultural upbringing.', 'range', 1976, 1997, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001ad', 'Place & Travel', 'Silicon Valley, California', 'Moved to Bay Area for Stanford career; based in Silicon Valley throughout professional life.', 'range', 2002, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001ad', 'Work & Education', 'Stanford Professor', 'CS and Statistics professor at Stanford; founded Stanford AI Lab (SAIL) group.', 'range', 2002, 2014, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001ad', 'Work & Education', 'Google Brain founder', 'Founded Google Brain deep learning project in 2011 which became central to Google AI.', 'range', 2011, 2014, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001ad', 'Work & Education', 'Baidu Chief Scientist', 'Served as Chief Scientist at Baidu from 2014 to 2017 building Chinese AI capabilities.', 'range', 2014, 2017, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001ad', 'Activities', 'Coursera co-founder', 'Co-founded Coursera in 2012 with Daphne Koller; grew it to 100M+ learners worldwide.', 'range', 2012, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001ad', 'Activities', 'deeplearning.ai', 'Founded deeplearning.ai in 2017 to democratise AI education globally.', 'range', 2017, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001ad', 'Relations & Family', 'Married Carol Reiley', 'Married robotics entrepreneur Carol Reiley in 2014; they have two children together.', 'range', 2014, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001ad', 'Assets', 'AI Fund', 'Founded AI Fund, a venture studio building and funding AI-powered companies.', 'range', 2017, 2024, '#14b8a6');

-- Reid Hoffman
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001ae', 'Place & Travel', 'Palo Alto, California', 'Born in Palo Alto; grew up in the Bay Area; attended Stanford and Oxford universities.', 'range', 1967, 1994, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001ae', 'Work & Education', 'Education at Stanford and Oxford', 'Studied symbolic systems at Stanford; earned MA in philosophy from Oxford in 1993.', 'range', 1985, 1993, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001ae', 'Work & Education', 'PayPal Executive VP', 'Served as Executive VP at PayPal before it was acquired by eBay in 2002.', 'range', 2000, 2002, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001ae', 'Work & Education', 'LinkedIn co-founder', 'Co-founded LinkedIn in 2002; sold to Microsoft for $26.2 billion in 2016.', 'range', 2002, 2016, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001ae', 'Work & Education', 'Greylock Partners investor', 'Partner at Greylock Partners VC firm; invested in Airbnb, Facebook, and many others.', 'range', 2009, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001ae', 'Activities', 'LinkedIn sale to Microsoft 2016', 'LinkedIn acquisition by Microsoft for $26.2B was the largest tech acquisition at the time.', 'point', 2016, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001ae', 'Activities', 'Inflection AI investment', 'Co-founded and funded Inflection AI; closely involved in early OpenAI board governance.', 'range', 2022, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001ae', 'Relations & Family', 'Married Michelle Yee', 'Married; relatively private about personal life compared to his very public professional role.', 'range', 2004, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001ae', 'Items', 'Book Blitzscaling', 'Co-authored Blitzscaling (2018) on rapid startup growth strategy — became a business school text.', 'point', 2018, null, '#64748b');

-- Brian Chesky
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001af', 'Place & Travel', 'Niskayuna, New York', 'Born in Niskayuna, NY; parents were social workers; studied Industrial Design at RISD.', 'range', 1981, 2007, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001af', 'Place & Travel', 'San Francisco, California', 'Moved to San Francisco in 2007 and soon co-founded Airbnb out of a rented apartment.', 'range', 2007, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001af', 'Work & Education', 'RISD Industrial Design', 'Earned BFA in Industrial Design from Rhode Island School of Design in 2004.', 'range', 2000, 2004, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001af', 'Work & Education', 'Airbnb CEO and co-founder', 'Co-founded Airbnb in 2008; led company from air mattresses to $75B+ valuation.', 'range', 2008, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001af', 'Activities', 'Airbnb IPO 2020', 'Led Airbnb''s IPO in December 2020 during COVID-19 pandemic — raised $3.5B on first day.', 'point', 2020, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001af', 'Activities', 'COVID survival and pivot', 'Navigated Airbnb through near-collapse in 2020 when travel stopped; led full recovery.', 'range', 2020, 2021, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001af', 'Health', 'Lived in Airbnbs for years', 'Lived out of Airbnb properties for several years to experience his product firsthand.', 'range', 2010, 2015, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000001af', 'Assets', 'Airbnb valuation', 'Airbnb peaked at over $100B valuation; Chesky personally holds billions in company stock.', 'range', 2021, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-0000000001af', 'Items', 'Time 100 most influential 2023', 'Named to Time magazine''s 100 Most Influential People list in 2023.', 'point', 2023, null, '#64748b');

-- Drew Houston
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001b0', 'Place & Travel', 'Acton, Massachusetts', 'Born in Acton, MA; studied Computer Science at MIT from 2001 to 2005.', 'range', 1983, 2007, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001b0', 'Place & Travel', 'San Francisco, California', 'Moved to SF after founding Dropbox through Y Combinator in 2007.', 'range', 2007, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001b0', 'Work & Education', 'MIT Computer Science', 'Earned BS in Computer Science from MIT in 2005; started Dropbox as a solution to own problem.', 'range', 2001, 2005, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001b0', 'Work & Education', 'Dropbox CEO and co-founder', 'Co-founded Dropbox in 2007 with Arash Ferdowsi; grew it to 600M+ registered users.', 'range', 2007, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001b0', 'Activities', 'Y Combinator Summer 2007', 'Joined Y Combinator in 2007; made famous demo video that drove 70k overnight beta signups.', 'point', 2007, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001b0', 'Activities', 'Dropbox IPO 2018', 'Led Dropbox IPO in March 2018 on Nasdaq — raised $756M, valued at $9.2B.', 'point', 2018, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001b0', 'Activities', 'Apple acquisition offer declined', 'Reportedly turned down a $800M acquisition offer from Steve Jobs at Apple around 2009.', 'point', 2009, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001b0', 'Assets', 'Dropbox enterprise pivot', 'Successfully transitioned Dropbox from consumer storage to profitable enterprise platform.', 'range', 2017, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-0000000001b0', 'Items', 'MIT $1M donation', 'Donated $1M to MIT for computer science scholarships in 2013 as an MIT alum.', 'point', 2013, null, '#64748b');

-- Kevin Systrom
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001b1', 'Place & Travel', 'Holliston, Massachusetts', 'Born in Holliston, MA; grew up in New England; studied management science at Stanford.', 'range', 1983, 2006, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001b1', 'Place & Travel', 'San Francisco, California', 'Moved to SF to work at Nextstop and then co-found Instagram.', 'range', 2009, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001b1', 'Work & Education', 'Stanford and Google internship', 'Studied MS&E at Stanford; interned at Odeo (later Twitter) and Google before Instagram.', 'range', 2002, 2010, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001b1', 'Work & Education', 'Instagram CEO and co-founder', 'Co-founded Instagram in 2010 with Mike Krieger; app reached 1M users in 3 months.', 'range', 2010, 2018, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001b1', 'Activities', 'Facebook acquisition 2012', 'Sold Instagram to Facebook for $1B in April 2012 — one of the most prescient acquisitions.', 'point', 2012, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001b1', 'Activities', 'Instagram growth to 1 billion users', 'Under his leadership Instagram grew from 0 to over 1 billion monthly active users.', 'range', 2010, 2018, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001b1', 'Health', 'Resigned from Instagram 2018', 'Resigned from Instagram in September 2018 citing tensions with Facebook over autonomy.', 'point', 2018, null, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000001b1', 'Assets', 'Artifact news app', 'Co-founded Artifact, an AI-powered personalised news app, with Mike Krieger in 2023.', 'range', 2023, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-0000000001b1', 'Items', 'Photography passion', 'Amateur photographer; his interest in photo filters directly inspired Instagram''s original concept.', 'range', 2010, 2024, '#64748b');

-- Jan Koum
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001b2', 'Place & Travel', 'Fastiv, Ukraine', 'Born near Kyiv in Soviet Ukraine; emigrated to Mountain View, California with mother in 1992.', 'range', 1976, 1992, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001b2', 'Place & Travel', 'Mountain View, California', 'Settled in Mountain View; family initially relied on food stamps and government assistance.', 'range', 1992, 2014, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001b2', 'Work & Education', 'Self-taught programmer at Yahoo', 'Worked at Yahoo for nine years as infrastructure engineer; self-taught network security.', 'range', 2000, 2009, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001b2', 'Work & Education', 'WhatsApp CEO and co-founder', 'Co-founded WhatsApp with Brian Acton in 2009; grew to 450M monthly users in 5 years.', 'range', 2009, 2018, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001b2', 'Activities', 'Facebook acquisition $19B 2014', 'Sold WhatsApp to Facebook for $19B in February 2014 — largest tech acquisition at time.', 'point', 2014, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001b2', 'Activities', 'WhatsApp to 2 billion users', 'WhatsApp grew to 2 billion monthly users — making it the world''s most popular messenger.', 'range', 2014, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001b2', 'Health', 'Resigned from Facebook 2018', 'Left Facebook board in 2018 citing disagreements over privacy and encryption policy.', 'point', 2018, null, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000001b2', 'Assets', 'Car and watch collection', 'Spend post-retirement time on passion for rare cars and vintage watch collecting.', 'range', 2018, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-0000000001b2', 'Items', 'Forbes Billionaire list 2014', 'Entered Forbes Billionaire list after WhatsApp sale; known for understated lifestyle.', 'point', 2014, null, '#64748b');

-- Jack Dorsey
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001b3', 'Place & Travel', 'St. Louis, Missouri', 'Born in St. Louis; became obsessed with dispatch logistics as a teenager; studied at NYU.', 'range', 1976, 2005, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001b3', 'Place & Travel', 'San Francisco, California', 'Moved to SF for work at Odeo and to co-found Twitter; later founded Square in the city.', 'range', 2005, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001b3', 'Work & Education', 'Twitter co-founder', 'Co-founded Twitter in 2006; served as CEO twice (2006–2008 and 2015–2021).', 'range', 2006, 2021, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001b3', 'Work & Education', 'Square/Block CEO', 'Founded Square in 2009 (now Block); revolutionised mobile payments for small businesses.', 'range', 2009, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001b3', 'Activities', 'First tweet in history', 'Sent the first tweet ever: "just setting up my twttr" on March 21, 2006.', 'point', 2006, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001b3', 'Activities', 'Square IPO 2015', 'Led Square IPO in November 2015; company later renamed Block and expanded into crypto.', 'point', 2015, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001b3', 'Health', 'Daily routine and fasting', 'Known for extreme wellness routines including intermittent fasting, cold plunges, and meditation.', 'range', 2018, 2024, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000001b3', 'Assets', 'Bitcoin advocacy', 'Became prominent Bitcoin maximalist; Block dedicates significant resources to Bitcoin development.', 'range', 2020, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-0000000001b3', 'Items', 'Bluesky social protocol', 'Backed Bluesky decentralised social protocol as an alternative to centralised platforms.', 'range', 2021, 2024, '#64748b');

-- Sheryl Sandberg
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001b4', 'Place & Travel', 'Washington, D.C.', 'Born in Washington D.C.; grew up in North Miami Beach; studied economics at Harvard.', 'range', 1969, 1991, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001b4', 'Place & Travel', 'Menlo Park, California', 'Joined Facebook and relocated to Bay Area; based in Silicon Valley from 2008 onwards.', 'range', 2008, 2022, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001b4', 'Work & Education', 'Harvard and World Bank', 'Harvard economics BA (1991) and MBA (1995); worked at World Bank with Larry Summers.', 'range', 1987, 1996, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001b4', 'Work & Education', 'Facebook COO', 'Served as Facebook COO from 2008 to 2022; built the advertising business worth billions.', 'range', 2008, 2022, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001b4', 'Activities', 'Lean In published 2013', 'Published Lean In in 2013 — a bestseller on women in the workplace; spawned global movement.', 'point', 2013, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001b4', 'Activities', 'Facebook monetisation', 'Architected Facebook''s advertising platform transforming it into a $100B+ revenue business.', 'range', 2008, 2022, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001b4', 'Health', 'Husband Dave Goldberg death', 'Husband Dave Goldberg died suddenly in 2015; wrote Option B about grief and resilience.', 'point', 2015, null, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000001b4', 'Relations & Family', 'Married Tom Bernthal 2021', 'Married TV producer Tom Bernthal in 2021; has two children from first marriage to Goldberg.', 'point', 2021, null, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001b4', 'Items', 'Book Option B 2017', 'Co-authored Option B with Adam Grant about resilience after grief — became a global bestseller.', 'point', 2017, null, '#64748b');

-- Marissa Mayer
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001b5', 'Place & Travel', 'Wausau, Wisconsin', 'Born in Wausau, Wisconsin; studied symbolic systems and computer science at Stanford.', 'range', 1975, 1999, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001b5', 'Place & Travel', 'Silicon Valley, California', 'Joined Google as employee #20 in 1999; moved to Yahoo in Sunnyvale as CEO in 2012.', 'range', 1999, 2017, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001b5', 'Work & Education', 'Google VP of Search Products', 'Served as first female engineer at Google; led search, maps, and Google News products.', 'range', 1999, 2012, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001b5', 'Work & Education', 'Yahoo CEO', 'Became CEO of Yahoo in July 2012; attempted high-profile turnaround of the struggling firm.', 'range', 2012, 2017, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001b5', 'Activities', 'Tumblr acquisition 2013', 'Led Yahoo''s $1.1B acquisition of Tumblr in 2013 — later sold for under $3M.', 'point', 2013, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001b5', 'Activities', 'Verizon sale of Yahoo 2017', 'Oversaw sale of Yahoo''s core business to Verizon for $4.48B in 2017.', 'point', 2017, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001b5', 'Health', 'Gave birth during CEO tenure', 'Had twins during her Yahoo CEO tenure; became prominent discussion about work-life balance.', 'point', 2015, null, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000001b5', 'Relations & Family', 'Married Zachary Bogue', 'Married investor and attorney Zachary Bogue in 2009; they have three children.', 'range', 2009, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001b5', 'Assets', 'Lumi Labs venture', 'Founded Lumi Labs AI consumer applications startup in 2018 after Yahoo departure.', 'range', 2018, 2024, '#14b8a6');

-- Meg Whitman
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001b6', 'Place & Travel', 'Cold Spring Harbor, New York', 'Born in Cold Spring Harbor, NY; attended Princeton (economics) and Harvard Business School.', 'range', 1956, 1980, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001b6', 'Place & Travel', 'Silicon Valley, California', 'Based in Bay Area during eBay and Hewlett Packard eras; ran for California governor 2010.', 'range', 1998, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001b6', 'Work & Education', 'eBay CEO', 'Joined eBay as CEO in 1998; grew it from $4M to $8B in revenue over 10 years.', 'range', 1998, 2008, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001b6', 'Work & Education', 'Hewlett Packard Enterprise CEO', 'Led HP split and became CEO of Hewlett Packard Enterprise from 2015 to 2018.', 'range', 2011, 2018, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001b6', 'Work & Education', 'Quibi CEO', 'Launched Quibi short-form streaming platform in 2020; shut down after 6 months.', 'range', 2018, 2020, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001b6', 'Activities', 'eBay IPO 1998 and growth', 'Took eBay public and transformed it into global e-commerce and auction powerhouse.', 'range', 1998, 2008, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001b6', 'Activities', 'California governor race 2010', 'Ran as Republican candidate for California Governor in 2010; spent $144M; lost to Jerry Brown.', 'point', 2010, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001b6', 'Relations & Family', 'Married Griffith Harsh', 'Married neurosurgeon Griffith Harsh in 1980; they have two sons, Griffith and Will.', 'range', 1980, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001b6', 'Assets', 'Procter & Gamble early career', 'Started career at P&G in brand management; foundation for consumer marketing expertise.', 'range', 1980, 1989, '#14b8a6');

-- Carly Fiorina
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001b7', 'Place & Travel', 'Austin, Texas', 'Born in Austin; grew up across the US due to father''s academic career; studied at Stanford.', 'range', 1954, 1980, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001b7', 'Place & Travel', 'Silicon Valley, California', 'Based in Bay Area during Lucent and Hewlett-Packard careers; ran for Senate from California.', 'range', 1996, 2016, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001b7', 'Work & Education', 'AT&T and Lucent career', 'Worked at AT&T for nearly 20 years; led Lucent''s spin-off and became its first President.', 'range', 1980, 1999, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001b7', 'Work & Education', 'Hewlett-Packard CEO', 'Became first woman to lead a Fortune 20 company as HP CEO from 1999 to 2005.', 'range', 1999, 2005, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001b7', 'Activities', 'HP-Compaq merger 2002', 'Completed controversial $25B merger with Compaq in 2002 despite shareholder opposition.', 'point', 2002, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001b7', 'Activities', '2016 presidential campaign', 'Ran in the 2016 Republican presidential primary; performed well in debates before dropping out.', 'range', 2015, 2016, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001b7', 'Health', 'Breast cancer treatment', 'Publicly disclosed breast cancer diagnosis and treatment in 2009 to raise awareness.', 'point', 2009, null, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000001b7', 'Relations & Family', 'Married Frank Fiorina', 'Married Frank Fiorina in 1985; stepdaughter Lori died of drug-related causes in 2009.', 'range', 1985, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001b7', 'Items', 'Book Tough Choices', 'Published memoir Tough Choices in 2006 detailing her rise and ouster at Hewlett-Packard.', 'point', 2006, null, '#64748b');

-- Michael Dell
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001b8', 'Place & Travel', 'Houston, Texas', 'Born in Houston; showed entrepreneurial instinct from early age selling stamps and newspapers.', 'range', 1965, 1984, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001b8', 'Place & Travel', 'Austin, Texas', 'Founded Dell from University of Texas dorm room in 1984; headquartered in Round Rock, TX.', 'range', 1984, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001b8', 'Work & Education', 'UT Austin dropout', 'Left University of Texas in freshman year 1984 to found PC''s Limited (later Dell Inc.).', 'range', 1983, 1984, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001b8', 'Work & Education', 'Dell Technologies CEO', 'Served as CEO from founding in 1984; stepped down 2004; returned 2007; private buyout 2013.', 'range', 1984, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001b8', 'Activities', 'Dell public offering 1988', 'Took Dell public in 1988 raising $30M; company grew to be the world''s largest PC maker.', 'point', 1988, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001b8', 'Activities', 'Dell goes private 2013', 'Orchestrated $24.9B leveraged buyout taking Dell private in 2013 with Silver Lake Partners.', 'point', 2013, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001b8', 'Activities', 'VMware acquisition', 'Acquired VMware as part of the EMC merger; later spun out VMware in 2021 for $64B.', 'range', 2016, 2021, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001b8', 'Relations & Family', 'Married Susan Lieberman', 'Married Susan Lieberman in 1989; they have four children; family active in philanthropy.', 'range', 1989, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001b8', 'Assets', 'MSD Capital and philanthropy', 'Manages personal investments through MSD Capital; Michael & Susan Dell Foundation donated $1B+.', 'range', 1998, 2024, '#14b8a6');

-- Steve Ballmer
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001b9', 'Place & Travel', 'Detroit, Michigan', 'Born in Detroit; father worked at Ford Motor Company; attended Harvard College.', 'range', 1956, 1980, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001b9', 'Place & Travel', 'Seattle, Washington', 'Joined Microsoft in Seattle in 1980 as its 30th employee; spent entire career there.', 'range', 1980, 2014, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001b9', 'Work & Education', 'Harvard and Stanford', 'Studied mathematics and economics at Harvard; attended Stanford GSB for two years.', 'range', 1973, 1980, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001b9', 'Work & Education', 'Microsoft CEO', 'Served as Microsoft CEO from 2000 to 2014; led Windows XP, Vista, 7, Xbox era.', 'range', 2000, 2014, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001b9', 'Activities', 'Microsoft employee number 30', 'Joined Microsoft in 1980 as 30th employee; his equity stake made him a billionaire.', 'point', 1980, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001b9', 'Activities', 'Xbox launch 2001', 'Oversaw launch of Xbox gaming console in November 2001 entering the video game market.', 'point', 2001, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001b9', 'Activities', 'LA Clippers purchase 2014', 'Purchased the LA Clippers NBA team for $2B in 2014 after leaving Microsoft.', 'point', 2014, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001b9', 'Relations & Family', 'Married Connie Snyder', 'Married Connie Snyder in 1990; they have three sons and are active in Seattle philanthropy.', 'range', 1990, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001b9', 'Assets', 'LA Clippers ownership', 'Largest individual owner of an NBA team; LA Clippers valued at over $4B under his ownership.', 'range', 2014, 2024, '#14b8a6');

-- Eric Schmidt
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001ba', 'Place & Travel', 'Falls Church, Virginia', 'Born in Falls Church, VA; family military background; studied at Princeton and Berkeley.', 'range', 1955, 1979, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001ba', 'Place & Travel', 'Silicon Valley, California', 'Career centered in Silicon Valley at Sun Microsystems, Novell, then Google in Mountain View.', 'range', 1983, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001ba', 'Work & Education', 'Princeton and UC Berkeley', 'BS in Electrical Engineering from Princeton; MS and PhD in Computer Science from UC Berkeley.', 'range', 1972, 1979, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001ba', 'Work & Education', 'Google CEO', 'Served as Google CEO from 2001 to 2011; hired by Larry Page and Sergey Brin to add experience.', 'range', 2001, 2011, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001ba', 'Work & Education', 'Alphabet Executive Chairman', 'Served as Alphabet Executive Chairman until 2018 after stepping down as CEO.', 'range', 2011, 2018, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001ba', 'Activities', 'Google''s commercial growth era', 'Led Google''s transformation from startup to advertising empire 2001–2011 during his CEO tenure.', 'range', 2001, 2011, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001ba', 'Activities', 'AI national security advisory', 'Chaired NSCAI (National Security Commission on AI) 2019–2021; shaped US AI policy.', 'range', 2019, 2021, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001ba', 'Relations & Family', 'Married Wendy Boyle', 'Married Wendy Boyle in 1980; separated; they have two daughters.', 'range', 1980, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001ba', 'Assets', 'Philanthropic investments', 'Invested hundreds of millions in national security tech, AI startups, and public policy.', 'range', 2010, 2024, '#14b8a6');

-- Paul Allen
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001bb', 'Place & Travel', 'Seattle, Washington', 'Born in Seattle; met Bill Gates at Lakeside School — lifelong partnership began there.', 'range', 1953, 1975, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001bb', 'Place & Travel', 'Albuquerque, New Mexico', 'Moved to Albuquerque in 1975 with Gates to found Microsoft near MITS headquarters.', 'range', 1975, 1979, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001bb', 'Work & Education', 'Microsoft co-founder', 'Co-founded Microsoft with Bill Gates in 1975; left the company in 1983 due to Hodgkin lymphoma.', 'range', 1975, 1983, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001bb', 'Work & Education', 'Vulcan Inc. ventures', 'Founded Vulcan Inc. in 1986 to manage his business investments and philanthropic activities.', 'range', 1986, 2018, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001bb', 'Activities', 'Seattle Seahawks and Portland Trail Blazers', 'Owned the Seattle Seahawks (NFL) and Portland Trail Blazers (NBA) simultaneously.', 'range', 1988, 2018, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001bb', 'Activities', 'SpaceShipOne funding', 'Funded Scaled Composites'' SpaceShipOne — first privately funded spacecraft to reach space in 2004.', 'point', 2004, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001bb', 'Health', 'Hodgkin lymphoma 1983', 'Diagnosed with Hodgkin lymphoma in 1983; left Microsoft; relapsed with non-Hodgkin lymphoma 2018.', 'range', 1983, 2018, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000001bb', 'Relations & Family', 'Sister Jody Allen executor', 'Remained unmarried; sister Jody Allen served as executor of his $20B+ estate after death.', 'range', 2018, 2018, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001bb', 'Assets', 'Paul G. Allen Foundation', 'Donated $2B+ through foundation to brain science, conservation, and arts before death in 2018.', 'range', 1986, 2018, '#14b8a6');

-- PewDiePie
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001bc', 'Place & Travel', 'Gothenburg, Sweden', 'Born Felix Kjellberg in Gothenburg; studied industrial economics at Chalmers before dropping out.', 'range', 1989, 2010, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001bc', 'Place & Travel', 'Brighton, England', 'Moved to Brighton with wife Marzia; later relocated to Japan for several years.', 'range', 2014, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001bc', 'Work & Education', 'YouTube gaming content creator', 'Created PewDiePie channel in 2010; held the most YouTube subscribers record for years.', 'range', 2010, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001bc', 'Activities', '100 million YouTube subscribers', 'First individual creator to reach 100 million YouTube subscribers in 2019.', 'point', 2019, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001bc', 'Activities', 'Sub wars with T-Series', 'Staged global sub-count race vs T-Series 2018–2019 — one of YouTube''s biggest cultural moments.', 'range', 2018, 2019, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001bc', 'Health', 'Content reduction and breaks', 'Took multiple breaks from YouTube citing burnout and desire for slower-paced lifestyle.', 'range', 2020, 2024, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000001bc', 'Relations & Family', 'Married Marzia Bisognin', 'Married Italian YouTuber and creator Marzia Bisognin in August 2019 in London.', 'point', 2019, null, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001bc', 'Assets', 'Tsuki market merchandise', 'Launched Tsuki, a minimalist merchandise and lifestyle brand focused on quality goods.', 'range', 2019, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-0000000001bc', 'Items', 'Disney deal cancellation 2017', 'Lost Disney YouTube deal in 2017 following antisemitic remarks in videos — major controversy.', 'point', 2017, null, '#64748b');

-- MrBeast
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001bd', 'Place & Travel', 'Wichita, Kansas', 'Born Jimmy Donaldson in Wichita; family moved to Greenville, North Carolina early on.', 'range', 2003, 2012, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001bd', 'Place & Travel', 'Greenville, North Carolina', 'Based in Greenville where he films most content; built production operation there.', 'range', 2012, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001bd', 'Work & Education', 'YouTube content creator', 'Started YouTube at age 13; went viral in 2017 with counting videos; dominates platform since.', 'range', 2016, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001bd', 'Activities', 'Most subscribed YouTube channel', 'Became the most subscribed individual YouTube channel surpassing PewDiePie in 2022.', 'point', 2022, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001bd', 'Activities', 'Plant 20M trees campaign', 'Raised money to plant 20 million trees with Team Trees challenge at end of 2019.', 'point', 2019, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001bd', 'Activities', 'Real-life Squid Game video', 'Produced real-life Squid Game recreation in 2021 — biggest viral YouTube video of that year.', 'point', 2021, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001bd', 'Relations & Family', 'Friend group collaborators', 'Built content empire around core friend group including Chandler, Chris, and Karl.', 'range', 2017, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001bd', 'Assets', 'Feastables chocolate brand', 'Launched Feastables chocolate bar brand in 2022; distributed in major retail chains globally.', 'range', 2022, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-0000000001bd', 'Assets', 'MrBeast Burger virtual brand', 'Launched MrBeast Burger virtual restaurant brand in 2020 using ghost kitchen model.', 'range', 2020, 2023, '#14b8a6');

-- Logan Paul
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001be', 'Place & Travel', 'Westlake, Ohio', 'Born and raised in Westlake, Ohio; gained fame on Vine before transitioning to YouTube.', 'range', 1995, 2014, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001be', 'Place & Travel', 'Los Angeles, California', 'Moved to LA to pursue entertainment career; later moved to Puerto Rico for tax purposes.', 'range', 2014, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001be', 'Work & Education', 'YouTube and social media career', 'Built massive YouTube following; launched PRIME hydration drink with KSI in 2022.', 'range', 2014, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001be', 'Activities', 'Floyd Mayweather exhibition', 'Fought Floyd Mayweather in June 2021 exhibition bout — drew 1M+ pay-per-view buys.', 'point', 2021, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001be', 'Activities', 'WWE championship', 'Won the WWE United States Championship in January 2023; legitimate wrestling career began.', 'range', 2023, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001be', 'Health', 'Japan forest video controversy', 'Faced global backlash in January 2018 for filming suicide victim in Japanese Aokigahara forest.', 'point', 2018, null, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000001be', 'Relations & Family', 'Engaged Nina Agdal', 'Got engaged to model Nina Agdal in 2023 at a boxing event in New York.', 'point', 2023, null, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001be', 'Assets', 'PRIME Hydration brand', 'Co-founded PRIME hydration drinks with KSI in 2022; became one of the fastest growing drink brands.', 'range', 2022, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-0000000001be', 'Items', 'Pokémon card craze investments', 'Sparked mainstream Pokémon card collecting frenzy in 2020 by showcasing rare card purchases.', 'point', 2020, null, '#64748b');

-- Jake Paul
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001bf', 'Place & Travel', 'Westlake, Ohio', 'Born in Westlake, Ohio; younger brother of Logan Paul; rose to fame on Vine then YouTube.', 'range', 1997, 2014, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001bf', 'Place & Travel', 'Los Angeles, California', 'Moved to LA and became part of Team 10 creator house; later moved to Puerto Rico.', 'range', 2014, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001bf', 'Work & Education', 'Disney and YouTube career', 'Starred on Disney Channel''s Bizaardvark 2016–2017; known for YouTube boxing content.', 'range', 2016, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001bf', 'Activities', 'Professional boxing record', 'Built professional boxing record fighting YouTube personalities, athletes, and retired boxers.', 'range', 2020, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001bf', 'Activities', 'Mike Tyson fight 2024', 'Fought 58-year-old Mike Tyson in Netflix live event in November 2024 — won by decision.', 'point', 2024, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001bf', 'Health', 'Looting controversy 2020', 'Charged with criminal trespass during 2020 Scottsdale, Arizona mall looting and rioting.', 'point', 2020, null, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000001bf', 'Relations & Family', 'Engaged Julia Rose', 'Had several high-profile relationships; briefly engaged to Julia Rose in 2023.', 'range', 2023, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001bf', 'Assets', 'Most Valuable Promotions', 'Co-founded MVP boxing promotion company to stage and promote his own fights.', 'range', 2020, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-0000000001bf', 'Assets', 'W Founder and investments', 'Co-founded W beverage brand; invested in early-stage consumer and sports companies.', 'range', 2022, 2024, '#14b8a6');

-- David Dobrik
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001c0', 'Place & Travel', 'Košice, Slovakia', 'Born in Košice, Slovakia; family immigrated to the USA when he was six years old.', 'range', 1996, 2013, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001c0', 'Place & Travel', 'Los Angeles, California', 'Moved to LA to be part of Vlog Squad; built his brand in Hollywood Hills.', 'range', 2015, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001c0', 'Work & Education', 'YouTube and Vlog Squad', 'Built YouTube fame through 4-minute vlogs with Vlog Squad; amassed 18M+ subscribers.', 'range', 2015, 2021, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001c0', 'Activities', 'Shorty Award and creator awards', 'Won multiple Shorty Awards for best YouTuber and creator of the year.', 'range', 2019, 2021, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001c0', 'Activities', 'Forbes 30 Under 30 2019', 'Named to Forbes 30 Under 30 list in 2019 in media category.', 'point', 2019, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001c0', 'Health', 'Controversy and hiatus 2021', 'Faced sexual assault allegations against Vlog Squad members in 2021; took extended hiatus.', 'point', 2021, null, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000001c0', 'Relations & Family', 'Brief marriage to Lorraine Nash', 'Briefly married Jeff Wittek''s ex-girlfriend Lorraine Nash in 2019 for immigration visa.', 'point', 2019, null, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001c0', 'Assets', 'Dispo photo app', 'Co-founded Dispo, a disposable camera photo app; launched and raised funding but stepped back.', 'range', 2021, 2022, '#14b8a6'),
  ('a0000000-0000-0000-0000-0000000001c0', 'Items', 'Tesla car giveaway videos', 'Famous for giving away Tesla cars to friends and fans in videos — signature content format.', 'range', 2017, 2021, '#64748b');

-- Emma Chamberlain
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001c1', 'Place & Travel', 'San Bruno, California', 'Born in San Bruno, CA; grew up in the Bay Area; started YouTube from her bedroom at 16.', 'range', 2001, 2018, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001c1', 'Place & Travel', 'Los Angeles, California', 'Moved to LA in 2018 after YouTube success; became part of Vine-to-YouTube creator generation.', 'range', 2018, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001c1', 'Work & Education', 'YouTube and podcast creator', 'YouTube channel launched 2016 with candid vlog style; hosts Anything Goes podcast.', 'range', 2016, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001c1', 'Activities', 'Met Gala appearances', 'Featured as invited guest at the Met Gala multiple years — rare for a YouTuber.', 'range', 2021, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001c1', 'Activities', 'Vogue US cover 2023', 'Featured on the cover of Vogue US — cementing crossover status into high fashion.', 'point', 2023, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001c1', 'Assets', 'Chamberlain Coffee brand', 'Founded Chamberlain Coffee in 2019; grew it into a widely distributed sustainable coffee brand.', 'range', 2019, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-0000000001c1', 'Assets', 'Louis Vuitton partnership', 'Became Louis Vuitton brand ambassador in 2021 — first major luxury fashion collaboration.', 'range', 2021, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-0000000001c1', 'Relations & Family', 'Private personal life', 'Moved from San Bruno to LA at 17; known for keeping romantic relationships mostly private.', 'range', 2018, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001c1', 'Items', 'Streamy Award Best Lifestyle 2019', 'Won Streamy Award for Best Lifestyle Channel in 2019 among other creator awards.', 'point', 2019, null, '#64748b');

-- Addison Rae
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001c2', 'Place & Travel', 'Lafayette, Louisiana', 'Born in Lafayette, Louisiana; grew up dancing and was a competitive cheerleader.', 'range', 2000, 2019, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001c2', 'Place & Travel', 'Los Angeles, California', 'Moved to LA to pursue TikTok career and entertainment after going viral in 2019.', 'range', 2019, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001c2', 'Work & Education', 'TikTok and entertainment career', 'Became one of the most followed TikTok creators globally; transitioned into music and acting.', 'range', 2019, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001c2', 'Activities', 'He''s All That film 2021', 'Starred in Netflix film He''s All That in 2021 — gender-flipped remake of She''s All That.', 'point', 2021, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001c2', 'Activities', 'Forbes highest-paid TikToker 2020', 'Named highest-earning TikTok star by Forbes in 2020 with estimated $5M earnings.', 'point', 2020, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001c2', 'Activities', 'Music debut 2021', 'Released debut single Obsessed in March 2021; received mixed reviews but reached millions.', 'point', 2021, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001c2', 'Relations & Family', 'Parents in content', 'Parents Sheri Nicole and Monty Lopez frequently appeared in her social media content.', 'range', 2019, 2022, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001c2', 'Assets', 'Item Beauty brand', 'Co-founded Item Beauty cosmetics brand in 2020 with Ipsy — affordable inclusive makeup line.', 'range', 2020, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-0000000001c2', 'Items', 'American Eagle ambassador', 'Became American Eagle brand ambassador and creative collaborator from 2020 onwards.', 'range', 2020, 2024, '#64748b');

-- Charli D'Amelio
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001c3', 'Place & Travel', 'Norwalk, Connecticut', 'Born in Norwalk, CT; competitive dancer from age 3; family became content creators together.', 'range', 2004, 2020, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001c3', 'Place & Travel', 'Los Angeles, California', 'Entire family relocated to LA in 2020 to pursue entertainment and content careers.', 'range', 2020, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001c3', 'Work & Education', 'TikTok creator career', 'Became the most followed TikTok creator globally in 2020 at just 16 years old.', 'range', 2019, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001c3', 'Activities', 'Most followed TikTok account', 'First person to reach 100 million TikTok followers — the platform''s biggest account.', 'point', 2020, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001c3', 'Activities', 'Dancing With the Stars 2022', 'Competed on Dancing With the Stars Season 31 in 2022, finishing as runner-up.', 'point', 2022, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001c3', 'Health', 'Mental health advocacy', 'Publicly discussed anxiety and eating disorder struggles; became mental health advocate.', 'range', 2021, 2024, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000001c3', 'Relations & Family', 'The D''Amelio Show on Hulu', 'Family reality show The D''Amelio Show premiered on Hulu in 2021 documenting family life.', 'range', 2021, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001c3', 'Assets', 'D''Amelio Footwear brand', 'Co-founded D''Amelio Footwear with sister Dixie and family as a fashion business venture.', 'range', 2022, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-0000000001c3', 'Items', 'Dunkin'' Donuts collaboration', 'Had signature Dunkin'' drink (The Charli) and major brand partnership from 2020 onwards.', 'range', 2020, 2022, '#64748b');

-- Kylie Jenner
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001c4', 'Place & Travel', 'Los Angeles, California', 'Born in LA; grew up on Keeping Up with the Kardashians from infancy.', 'range', 1997, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001c4', 'Work & Education', 'Reality TV career', 'Featured on KUWTK from 2007; launched own spinoff Life of Kylie in 2017.', 'range', 2007, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001c4', 'Work & Education', 'Kylie Cosmetics founder', 'Founded Kylie Cosmetics in 2015 starting with lip kits; sold 51% to Coty Inc. in 2020.', 'range', 2015, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001c4', 'Activities', 'Forbes youngest self-made billionaire', 'Named youngest self-made billionaire by Forbes in 2019 at age 21 — later disputed.', 'point', 2019, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001c4', 'Activities', 'Instagram record egg', 'Her 2020 pregnancy reveal post held the most-liked Instagram photo record before egg meme.', 'point', 2018, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001c4', 'Health', 'Lip filler controversy', 'Publicly admitted lip filler use in 2015 after years of denial — sparked lip kit trend.', 'point', 2015, null, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000001c4', 'Relations & Family', 'Children with Travis Scott', 'Has two children with rapper Travis Scott: Stormi (born 2018) and Aire (born 2022).', 'range', 2018, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001c4', 'Assets', 'Kylie Skin and Kylie Baby', 'Extended brand to Kylie Skin (2019) and Kylie Baby (2021) product lines.', 'range', 2019, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-0000000001c4', 'Items', 'Private jet controversy', 'Faced backlash in 2022 for numerous short private jet flights amid carbon footprint debate.', 'point', 2022, null, '#64748b');

-- Kim Kardashian
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001c5', 'Place & Travel', 'Los Angeles, California', 'Born and raised in LA; daughter of attorney Robert Kardashian; grew up in Bel Air.', 'range', 1980, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001c5', 'Work & Education', 'Keeping Up with the Kardashians', 'KUWTK aired 20 seasons from 2007 to 2021 on E! — one of the longest-running reality shows.', 'range', 2007, 2021, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001c5', 'Work & Education', 'SKIMS founder', 'Founded SKIMS shapewear brand in 2019; valued at $4B+ by 2023.', 'range', 2019, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001c5', 'Work & Education', 'Law school studies', 'Studying to pass the bar exam via legal apprenticeship from 2019; passed Baby Bar in 2021.', 'range', 2019, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001c5', 'Activities', 'Criminal justice reform advocacy', 'Worked with Trump administration on First Step Act in 2018; secured multiple commutations.', 'range', 2018, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001c5', 'Health', 'Paris robbery 2016', 'Robbed at gunpoint in Paris hotel room in October 2016; traumatic experience changed her approach.', 'point', 2016, null, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000001c5', 'Relations & Family', 'Married Kanye West', 'Married Kanye West in Florence in 2014; divorced 2022; have four children together.', 'range', 2014, 2022, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001c5', 'Assets', 'KKW Beauty brand', 'Founded KKW Beauty in 2017 selling out within minutes; later relaunched under new name.', 'range', 2017, 2024, '#14b8a6'),
  ('a0000000-0000-0000-0000-0000000001c5', 'Items', 'Sex tape impact on career', 'Leaked sex tape with Ray J in 2007 controversially launched her into mainstream celebrity.', 'point', 2007, null, '#64748b');

-- Khloé Kardashian
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001c6', 'Place & Travel', 'Los Angeles, California', 'Born in LA; third Kardashian daughter; grew up in Bel Air alongside her famous siblings.', 'range', 1984, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001c6', 'Work & Education', 'Reality TV career', 'Featured on KUWTK from premiere in 2007; had spin-off Khloé and Lamar and Revenge Body.', 'range', 2007, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001c6', 'Work & Education', 'Good American brand', 'Co-founded denim and fashion brand Good American in 2016 with Emma Grede — size-inclusive.', 'range', 2016, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001c6', 'Activities', 'Body transformation public journey', 'Documented dramatic physical transformation publicly — became inspiration for fitness community.', 'range', 2015, 2020, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001c6', 'Activities', 'Kocktails with Khloé show', 'Hosted talk show Kocktails with Khloé on FYI network in 2016.', 'point', 2016, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001c6', 'Health', 'COVID-19 positive 2020', 'Publicly shared she tested positive for COVID-19 in March 2020 and documented recovery.', 'point', 2020, null, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000001c6', 'Relations & Family', 'Tristan Thompson relationship', 'On-and-off relationship with NBA player Tristan Thompson; have two children together.', 'range', 2016, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001c6', 'Relations & Family', 'Married Lamar Odom', 'Married NBA player Lamar Odom in 2009 after 30 days of dating; divorced in 2016.', 'range', 2009, 2016, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001c6', 'Assets', 'Good American valuation', 'Good American became a multi-hundred million dollar fashion brand by the early 2020s.', 'range', 2020, 2024, '#14b8a6');

-- Kourtney Kardashian
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001c7', 'Place & Travel', 'Los Angeles, California', 'Born in LA; eldest of the Kardashian siblings; studied theatre arts at the University of Arizona.', 'range', 1979, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001c7', 'Work & Education', 'Reality TV career', 'Featured on KUWTK from 2007; had spin-offs Kourtney and Kim Take New York and Miami.', 'range', 2007, 2021, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001c7', 'Work & Education', 'Poosh lifestyle brand', 'Founded Poosh, a curated lifestyle and wellness website in 2019 focused on clean living.', 'range', 2019, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001c7', 'Activities', 'Kardashians on Hulu', 'Stars in The Kardashians on Hulu from 2022 with family after leaving E! Network.', 'range', 2022, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001c7', 'Activities', 'Lemme supplement brand', 'Co-founded Lemme gummy supplement brand in 2022 as a wellness product line.', 'range', 2022, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001c7', 'Health', 'Organic and clean living advocacy', 'Became prominent voice for organic parenting and clean lifestyle choices on social media.', 'range', 2010, 2024, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000001c7', 'Relations & Family', 'Three children with Scott Disick', 'Has three children (Mason, Penelope, Reign) with ex-partner Scott Disick.', 'range', 2009, 2024, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001c7', 'Relations & Family', 'Married Travis Barker', 'Married Blink-182 drummer Travis Barker in Santa Barbara in May 2022.', 'point', 2022, null, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001c7', 'Assets', 'DASH boutiques', 'Co-owned DASH clothing boutiques with sisters in Miami, New York, and LA until 2018 closure.', 'range', 2006, 2018, '#14b8a6');

-- Kris Jenner
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000001c8', 'Place & Travel', 'San Diego, California', 'Born in San Diego; grew up in suburban California and met first husband Robert Kardashian young.', 'range', 1955, 1980, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001c8', 'Place & Travel', 'Calabasas, California', 'Settled in Calabasas with her family; the suburb became synonymous with Kardashian brand.', 'range', 1990, 2024, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000001c8', 'Work & Education', 'Momager and TV producer', 'Self-styled "momager" managing all six children''s careers; executive producer on KUWTK.', 'range', 2007, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001c8', 'Work & Education', 'Jenner Communications', 'Runs Jenner Communications, the management and production company for the Kardashian empire.', 'range', 2007, 2024, '#10b981'),
  ('a0000000-0000-0000-0000-0000000001c8', 'Activities', 'KUWTK record 20 seasons', 'Executive produced Keeping Up with the Kardashians for 20 seasons on E! Network.', 'range', 2007, 2021, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001c8', 'Activities', 'Hulu deal The Kardashians', 'Negotiated lucrative Hulu deal to continue family content after departing E! in 2022.', 'range', 2022, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000001c8', 'Relations & Family', 'Married Robert Kardashian', 'Married attorney Robert Kardashian in 1978; had four children; divorced 1991.', 'range', 1978, 1991, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001c8', 'Relations & Family', 'Married Bruce Jenner', 'Married Olympic champion Bruce Jenner in 1991; had Kylie and Kendall; divorced 2015.', 'range', 1991, 2015, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000001c8', 'Assets', 'Kardashian brand empire', 'Orchestrated and managed family brand worth an estimated $2B+ across multiple businesses.', 'range', 2007, 2024, '#14b8a6');

