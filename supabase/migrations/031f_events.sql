-- 031f_events.sql
-- Events for personas 16a–17d (Nicole Kidman through Novak Djokovic)
-- Missing from 031b_events.sql

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000016a', 'Place & Travel', 'Australia & USA', 'Born in Honolulu; raised in Sydney; moved to Hollywood after first film successes.', 'range', 1967, 1990, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000016a', 'Work & Education', 'Early Australian career', 'BMX Bandits (1983) and Dead Calm (1989) brought international attention.', 'range', 1983, 1990, '#10b981'),
  ('a0000000-0000-0000-0000-00000000016a', 'Work & Education', 'Hollywood stardom — Moulin Rouge to The Hours', 'Moulin Rouge! (2001) and The Hours (2002, Oscar win) cemented her as A-list star.', 'range', 2001, 2003, '#10b981'),
  ('a0000000-0000-0000-0000-00000000016a', 'Work & Education', 'Later acclaimed roles', 'Lion (2016), Boy Erased (2018), Being the Ricardos (2021) — continued awards recognition.', 'range', 2016, 2022, '#10b981'),
  ('a0000000-0000-0000-0000-00000000016a', 'Relations & Family', 'Tom Cruise marriage', 'Married Tom Cruise 1990; divorced 2001 after 11 years. Adopted two children together.', 'range', 1990, 2001, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000016a', 'Relations & Family', 'Keith Urban marriage', 'Married country singer Keith Urban in 2006; four children together.', 'range', 2006, 2026, '#ec4899');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000016b', 'Place & Travel', 'New Orleans & Nashville', 'Born in New Orleans 1976; grew up in Nashville; studied at Stanford briefly.', 'range', 1976, 1995, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000016b', 'Place & Travel', 'Los Angeles', 'Based in LA since her early career; later split time between LA and Nashville.', 'range', 1995, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000016b', 'Work & Education', 'Legally Blonde & breakout', 'Legally Blonde (2001) made her one of Hollywood''s most bankable stars.', 'point', 2001, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000016b', 'Work & Education', 'Wild & Big Little Lies', 'Wild (2014) earned an Oscar nomination; Big Little Lies (2017 HBO) won Emmy.', 'range', 2014, 2019, '#10b981'),
  ('a0000000-0000-0000-0000-00000000016b', 'Work & Education', 'Hello Sunshine production company', 'Founded Hello Sunshine in 2016; sold majority stake for $900M in 2021.', 'range', 2016, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-00000000016b', 'Relations & Family', 'Ryan Phillippe marriage', 'Married co-star Ryan Phillippe 1999; divorced 2007. Two children: Ava and Deacon.', 'range', 1999, 2007, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000016b', 'Relations & Family', 'Jim Toth marriage', 'Married talent agent Jim Toth in 2011; son Tennessee born 2012; divorced 2023.', 'range', 2011, 2023, '#ec4899');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000016c', 'Place & Travel', 'Arlington, Virginia & Washington DC', 'Born in Arlington 1964; raised in DC area; studied at East Carolina University.', 'range', 1964, 1987, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000016c', 'Place & Travel', 'Los Angeles', 'Moved to LA to pursue acting; became one of Hollywood''s most loved stars.', 'range', 1987, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000016c', 'Work & Education', 'Speed & breakout', 'Speed (1994) made her a star; followed by While You Were Sleeping (1995).', 'point', 1994, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000016c', 'Work & Education', 'Miss Congeniality to Oscar', 'Miss Congeniality franchise; Oscar for The Blind Side (2009); Gravity (2013) hit.', 'range', 2000, 2013, '#10b981'),
  ('a0000000-0000-0000-0000-00000000016c', 'Relations & Family', 'Jesse James marriage', 'Married TV personality Jesse James 2005; divorced 2010 after public infidelity scandal.', 'range', 2005, 2010, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000016c', 'Relations & Family', 'Bryan Randall relationship', 'Long-term partner Bryan Randall; he died of ALS in 2023. Adopted two children.', 'range', 2015, 2023, '#ec4899');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000016d', 'Place & Travel', 'South Africa & USA', 'Born in Benoni, South Africa 1975; moved to Italy at 16, then to USA to pursue acting.', 'range', 1975, 1994, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000016d', 'Work & Education', 'Monster & Oscar win', 'Gained 30 lbs for Monster (2003) to play serial killer Aileen Wuornos; won Best Actress Oscar.', 'point', 2003, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000016d', 'Work & Education', 'Mad Max: Fury Road & continued success', 'Mad Max: Fury Road (2015) a critical triumph; Bombshell (2019) earned Oscar nomination.', 'range', 2015, 2020, '#10b981'),
  ('a0000000-0000-0000-0000-00000000016d', 'Work & Education', 'Production company — Denver & Delilah', 'Co-founded Denver & Delilah Productions; produced Monster, Atomic Blonde, and others.', 'range', 2003, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-00000000016d', 'Relations & Family', 'Stuart Townsend relationship', 'Nine-year relationship with Irish actor Stuart Townsend; ended 2010.', 'range', 2001, 2010, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000016d', 'Relations & Family', 'Single mother', 'Adopted daughter Jackson 2012, daughter August 2015 via surrogate.', 'range', 2012, 2026, '#ec4899');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000016e', 'Place & Travel', 'New York City', 'Born in Syracuse 1962; grew up in New York; moved to LA for acting.', 'range', 1962, 1981, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000016e', 'Work & Education', 'Top Gun & global stardom', 'Top Gun (1986) made him one of the biggest stars; followed by Rain Man and Born on the Fourth of July.', 'range', 1986, 1990, '#10b981'),
  ('a0000000-0000-0000-0000-00000000016e', 'Work & Education', 'Mission Impossible franchise', 'Mission: Impossible franchise (1996–present) became his signature; performed own stunts.', 'range', 1996, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-00000000016e', 'Work & Education', 'Top Gun: Maverick — record-breaking', 'Top Gun: Maverick (2022) grossed $1.49B worldwide — biggest career success at age 60.', 'point', 2022, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000016e', 'Relations & Family', 'Three marriages', 'Married Mimi Rogers (1987–90), Nicole Kidman (1990–2001), Katie Holmes (2006–12).', 'range', 1987, 2012, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000016e', 'Activities', 'Scientology', 'One of Scientology''s most famous adherents; the religion has shaped his public life since 1986.', 'range', 1986, 2026, '#f59e0b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000016f', 'Place & Travel', 'Kentucky & Los Angeles', 'Born in Owensboro, Kentucky 1963; moved to LA as a teenager to pursue acting.', 'range', 1963, 1983, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000016f', 'Work & Education', 'Edward Scissorhands to Pirates', 'Long Tim Burton collaboration; Edward Scissorhands (1990), Ed Wood (1994); Pirates of the Caribbean (2003) a massive hit.', 'range', 1990, 2010, '#10b981'),
  ('a0000000-0000-0000-0000-00000000016f', 'Work & Education', 'Trial with Amber Heard', 'Defamation trial (2022) watched globally; jury ruled in Depp''s favor on most counts.', 'point', 2022, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000016f', 'Relations & Family', 'Vanessa Paradis', 'Partner Vanessa Paradis 1998–2012; two children: Lily-Rose and Jack.', 'range', 1998, 2012, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000016f', 'Relations & Family', 'Amber Heard marriage', 'Married Amber Heard 2015; divorced 2017 amid abuse allegations from both sides.', 'range', 2015, 2017, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000016f', 'Activities', 'Rock musician', 'Plays guitar in band Hollywood Vampires with Alice Cooper and Joe Perry.', 'range', 2015, 2026, '#f59e0b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000170', 'Place & Travel', 'Austria & USA', 'Born in Thal, Austria 1947; moved to US in 1968 to pursue bodybuilding career.', 'range', 1947, 1968, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000170', 'Activities', 'Bodybuilding champion', 'Won Mr. Universe and Mr. Olympia seven times (1970–75, 1980); bodybuilding''s greatest icon.', 'range', 1966, 1980, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000170', 'Work & Education', 'The Terminator & Hollywood', 'The Terminator (1984) and Predator (1987) made him the defining action star of his era.', 'range', 1984, 1994, '#10b981'),
  ('a0000000-0000-0000-0000-000000000170', 'Work & Education', 'Governor of California', 'Republican Governor of California 2003–2011; signed landmark climate legislation.', 'range', 2003, 2011, '#10b981'),
  ('a0000000-0000-0000-0000-000000000170', 'Relations & Family', 'Maria Shriver marriage', 'Married journalist Maria Shriver 1986; separated 2011 after secret love child revealed.', 'range', 1986, 2011, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000170', 'Activities', 'Environmental advocacy', 'Major climate change advocate; founded USC Schwarzenegger Institute for State and Global Policy.', 'range', 2011, 2026, '#d97706');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000171', 'Place & Travel', 'New York City', 'Born in Hell''s Kitchen, Manhattan 1946; rough childhood in NYC foster care system.', 'range', 1946, 1969, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000171', 'Work & Education', 'Rocky — writer and star', 'Wrote and starred in Rocky (1976); won Best Picture Oscar; the quintessential underdog story.', 'point', 1976, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000171', 'Work & Education', 'Rocky & Rambo franchises', 'Rocky franchise (6 films) and Rambo franchise (5 films) made him a global action icon.', 'range', 1976, 2019, '#10b981'),
  ('a0000000-0000-0000-0000-000000000171', 'Work & Education', 'Creed producer & comeback', 'Produced and appeared in Creed franchise (2015–); earned Golden Globe for Best Supporting Actor.', 'range', 2015, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-000000000171', 'Relations & Family', 'Three marriages', 'Married Sasha Czack (1974–85), Brigitte Nielsen (1985–87), Jennifer Flavin (1997–2022, reconciled).', 'range', 1974, 2026, '#ec4899');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000172', 'Place & Travel', 'Beirut & Canada', 'Born in Beirut 1964; raised in Toronto; moved to LA to pursue acting career.', 'range', 1964, 1984, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000172', 'Work & Education', 'Bill & Ted & early career', 'Bill & Ted''s Excellent Adventure (1989) established his likable persona; Point Break (1991) followed.', 'range', 1989, 1993, '#10b981'),
  ('a0000000-0000-0000-0000-000000000172', 'Work & Education', 'The Matrix trilogy', 'The Matrix (1999) redefined action cinema; Reeves became one of Hollywood''s most iconic stars.', 'range', 1999, 2003, '#10b981'),
  ('a0000000-0000-0000-0000-000000000172', 'Work & Education', 'John Wick franchise', 'John Wick (2014) launched a new action franchise; all four films critically and commercially successful.', 'range', 2014, 2023, '#10b981'),
  ('a0000000-0000-0000-0000-000000000172', 'Relations & Family', 'Personal tragedies', 'Girlfriend Jennifer Syme lost their stillborn daughter in 1999; Syme died in car accident 2001.', 'point', 2001, null, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000172', 'Relations & Family', 'Alexandra Grant relationship', 'In relationship with artist Alexandra Grant since 2018; went public in 2019.', 'range', 2018, 2026, '#ec4899');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000173', 'Place & Travel', 'Chicago & California', 'Born in Chicago 1942; grew up in various cities; moved to LA after college.', 'range', 1942, 1964, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000173', 'Work & Education', 'Carpenter collaborations & Star Wars', 'Han Solo in Star Wars (1977) — one of cinema''s most beloved characters. Indiana Jones (1981) followed.', 'range', 1977, 1984, '#10b981'),
  ('a0000000-0000-0000-0000-000000000173', 'Work & Education', 'Blade Runner to The Fugitive', 'Blade Runner (1982) became a sci-fi classic; The Fugitive (1993) and Air Force One (1997) continued success.', 'range', 1982, 2000, '#10b981'),
  ('a0000000-0000-0000-0000-000000000173', 'Work & Education', 'Return to Star Wars & Indiana Jones', 'Star Wars: The Force Awakens (2015) and Indiana Jones 5 (2023) — enduring franchise presence.', 'range', 2015, 2023, '#10b981'),
  ('a0000000-0000-0000-0000-000000000173', 'Relations & Family', 'Calista Flockhart marriage', 'Married actress Calista Flockhart in 2010 after long relationship.', 'range', 2010, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000173', 'Activities', 'Pilot & aviation', 'Licensed pilot since 1996; has used personal aircraft in multiple search-and-rescue operations.', 'range', 1996, 2026, '#f59e0b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000174', 'Place & Travel', 'Memphis, Tennessee', 'Born in Memphis 1937; raised in a Baptist household; studied at Jackson State University.', 'range', 1937, 1959, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000174', 'Work & Education', 'Early career & struggle', 'Worked as a teacher and in the military before acting; first major film role in his 50s.', 'range', 1959, 1987, '#10b981'),
  ('a0000000-0000-0000-0000-000000000174', 'Work & Education', 'Driving Miss Daisy to Se7en', 'Driving Miss Daisy (1989), The Shawshank Redemption (1994), Se7en (1995) — defining performances.', 'range', 1989, 1996, '#10b981'),
  ('a0000000-0000-0000-0000-000000000174', 'Work & Education', 'Million Dollar Baby — Oscar win', 'Won Best Supporting Actor Oscar for Million Dollar Baby (2004).', 'point', 2004, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000174', 'Work & Education', 'Production company — Revelations Entertainment', 'Co-founded Revelations Entertainment to develop diverse stories.', 'range', 1996, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-000000000174', 'Relations & Family', 'Two marriages', 'Married Jeanette Adair Bradshaw (1967–79) and Myrna Colley-Lee (1984–2010).', 'range', 1967, 2010, '#ec4899');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000175', 'Place & Travel', 'Wales & UK', 'Born in Port Talbot, Wales 1937; trained at Royal Welsh College of Music and Drama.', 'range', 1937, 1960, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000175', 'Work & Education', 'Theatre & early films', 'National Theatre under Laurence Olivier; The Lion in Winter (1968) earned first Oscar nomination.', 'range', 1960, 1975, '#10b981'),
  ('a0000000-0000-0000-0000-000000000175', 'Work & Education', 'The Silence of the Lambs', 'Hannibal Lecter in Silence of the Lambs (1991) won Best Actor Oscar; one of cinema''s greatest performances.', 'point', 1991, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000175', 'Work & Education', 'Nixon, The Remains of the Day & more', 'Nixon (1995), The Remains of the Day (1993), Amistad (1997), The Two Popes (2019) — remarkable range.', 'range', 1993, 2019, '#10b981'),
  ('a0000000-0000-0000-0000-000000000175', 'Work & Education', 'MCU — Thor franchise', 'Played Odin in Thor films (2011–2017); brought gravitas to Marvel universe.', 'range', 2011, 2017, '#10b981'),
  ('a0000000-0000-0000-0000-000000000175', 'Activities', 'Knighthood', 'Appointed Knight Commander of the Order of the British Empire in 1993.', 'point', 1993, null, '#d97706');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000176', 'Place & Travel', 'New York City', 'Born in East Harlem 1940; raised in South Bronx; studied at Actors Studio under Lee Strasberg.', 'range', 1940, 1960, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000176', 'Work & Education', 'The Godfather & Serpico', 'The Godfather (1972) as Michael Corleone — one of cinema''s defining performances; Serpico (1973) followed.', 'range', 1972, 1975, '#10b981'),
  ('a0000000-0000-0000-0000-000000000176', 'Work & Education', 'Dog Day Afternoon to Scarface', 'Dog Day Afternoon (1975), ...And Justice for All (1979), Scarface (1983) cemented his legend.', 'range', 1975, 1983, '#10b981'),
  ('a0000000-0000-0000-0000-000000000176', 'Work & Education', 'Scent of a Woman — Oscar win', 'Won Best Actor for Scent of a Woman (1992); also Heat (1995), The Insider (1999).', 'point', 1992, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000176', 'Relations & Family', 'Beverley D''Angelo relationship', 'Long relationship with actress Beverley D''Angelo; twins Anton and Olivia born 2001.', 'range', 1996, 2003, '#ec4899');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000177', 'Place & Travel', 'New York City', 'Born in the Bronx 1943; raised in Little Italy and Lower East Side Manhattan.', 'range', 1943, 1963, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000177', 'Work & Education', 'Mean Streets to Godfather II', 'Mean Streets (1973) with Scorsese; The Godfather Part II (1974) Oscar for Best Supporting Actor.', 'range', 1973, 1975, '#10b981'),
  ('a0000000-0000-0000-0000-000000000177', 'Work & Education', 'Taxi Driver to Raging Bull', 'Taxi Driver (1976) as Travis Bickle; Raging Bull (1980) as Jake LaMotta — both career-defining.', 'range', 1976, 1980, '#10b981'),
  ('a0000000-0000-0000-0000-000000000177', 'Work & Education', 'Goodfellas to Casino', 'Goodfellas (1990), Cape Fear (1991), Casino (1995) — enduring Scorsese collaboration.', 'range', 1990, 1995, '#10b981'),
  ('a0000000-0000-0000-0000-000000000177', 'Work & Education', 'The Irishman — late masterpiece', 'The Irishman (2019) with Scorsese — a 3.5-hour crime epic streaming on Netflix.', 'point', 2019, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000177', 'Work & Education', 'Nobu restaurant empire', 'Co-founded Nobu restaurant chain with Nobu Matsuhisa; grown to 50+ locations worldwide.', 'range', 1994, 2026, '#10b981');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000178', 'Place & Travel', 'New Jersey & Los Angeles', 'Born in Neptune City, NJ 1937; discovered at age 10 by MGM talent scout; moved to Hollywood.', 'range', 1937, 1954, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000178', 'Work & Education', 'Easy Rider & Five Easy Pieces', 'Easy Rider (1969) as a counterculture landmark; Five Easy Pieces (1970) earned first Oscar nomination.', 'range', 1969, 1972, '#10b981'),
  ('a0000000-0000-0000-0000-000000000178', 'Work & Education', 'Chinatown & One Flew Over the Cuckoo''s Nest', 'Chinatown (1974) one of the greatest films ever; One Flew Over the Cuckoo''s Nest (1975) won Oscar.', 'range', 1974, 1976, '#10b981'),
  ('a0000000-0000-0000-0000-000000000178', 'Work & Education', 'The Shining to As Good as It Gets', 'The Shining (1980), Terms of Endearment (1983 Oscar), As Good as It Gets (1997 Oscar) — three decades of excellence.', 'range', 1980, 1997, '#10b981'),
  ('a0000000-0000-0000-0000-000000000178', 'Activities', 'Lakers superfan', 'Courtside Lakers fixture since the 1970s; one of the most recognizable sports fans in the world.', 'range', 1970, 2026, '#f59e0b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000179', 'Place & Travel', 'San Francisco Bay Area', 'Born in San Francisco 1930; grew up in Oakland; served in the Army during Korea.', 'range', 1930, 1955, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000179', 'Work & Education', 'Spaghetti Westerns', 'A Fistful of Dollars (1964), The Good, the Bad and the Ugly (1966) with Sergio Leone — iconic anti-hero.', 'range', 1964, 1968, '#10b981'),
  ('a0000000-0000-0000-0000-000000000179', 'Work & Education', 'Dirty Harry franchise', 'Dirty Harry (1971) created the archetype of the rogue cop; franchise ran through 1988.', 'range', 1971, 1988, '#10b981'),
  ('a0000000-0000-0000-0000-000000000179', 'Work & Education', 'Director — Unforgiven to Million Dollar Baby', 'Won Best Picture and Director Oscars for Unforgiven (1992) and Million Dollar Baby (2004).', 'range', 1992, 2004, '#10b981'),
  ('a0000000-0000-0000-0000-000000000179', 'Work & Education', 'Mayor of Carmel & politics', 'Elected Mayor of Carmel-by-the-Sea, California, 1986–1988.', 'range', 1986, 1988, '#10b981'),
  ('a0000000-0000-0000-0000-000000000179', 'Relations & Family', 'Many relationships & children', 'Eight children with six different women over the decades; married Dina Ruiz 1996–2014.', 'range', 1953, 2026, '#ec4899');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000017a', 'Place & Travel', 'Louisiana & California', 'Born in Metairie, Louisiana 1958; raised in Atlanta; moved to San Francisco for stand-up comedy.', 'range', 1958, 1980, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000017a', 'Work & Education', 'The Ellen DeGeneres Show', 'Daytime talk show debuted 2003; ran 19 seasons until 2022; won 33 Daytime Emmy Awards.', 'range', 2003, 2022, '#10b981'),
  ('a0000000-0000-0000-0000-00000000017a', 'Work & Education', 'Stand-up & sitcom career', 'Stand-up career in 1980s; Ellen sitcom (1994–98); iconic coming-out episode in 1997.', 'range', 1980, 1998, '#10b981'),
  ('a0000000-0000-0000-0000-00000000017a', 'Work & Education', 'Finding Nemo voice work', 'Voiced Dory in Finding Nemo (2003) and Finding Dory (2016) — beloved animated role.', 'point', 2003, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000017a', 'Relations & Family', 'Portia de Rossi marriage', 'Married actress Portia de Rossi in 2008 — among the first same-sex celebrity couples to wed in California.', 'range', 2008, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000017a', 'Activities', 'LGBTQ+ pioneer', 'One of the first openly gay sitcom leads; her 1997 coming-out remains a landmark in LGBTQ+ media history.', 'range', 1997, 2026, '#d97706');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000017b', 'Place & Travel', 'New York City', 'Born in New Rochelle, New York 1947; grew up in Westchester County.', 'range', 1947, 1965, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000017b', 'Work & Education', 'Late Night with David Letterman', 'Late Night (NBC 1982–93) reinvented late-night TV with absurdist humor and Top Ten lists.', 'range', 1982, 1993, '#10b981'),
  ('a0000000-0000-0000-0000-00000000017b', 'Work & Education', 'Late Show with David Letterman', 'Late Show (CBS 1993–2015) ran 22 seasons; 6,028 episodes — one of television''s longest-running shows.', 'range', 1993, 2015, '#10b981'),
  ('a0000000-0000-0000-0000-00000000017b', 'Work & Education', 'Netflix — My Next Guest', 'Returned with My Next Guest Needs No Introduction (Netflix, 2018–) — long-form celebrity interviews.', 'range', 2018, 2023, '#10b981'),
  ('a0000000-0000-0000-0000-00000000017b', 'Relations & Family', 'Regina Lasko marriage', 'Married longtime partner Regina Lasko in 2009; son Harry born 2003.', 'range', 2009, 2026, '#ec4899');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000017c', 'Place & Travel', 'Japan & USA', 'Born in Osaka 1997; dual Japanese-American citizenship; raised in USA from age 3.', 'range', 1997, 2015, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000017c', 'Work & Education', 'Professional tennis career', 'Turned professional 2013; won first WTA title in 2018.', 'range', 2013, 2018, '#10b981'),
  ('a0000000-0000-0000-0000-00000000017c', 'Work & Education', 'Four Grand Slam titles', 'Won US Open (2018, 2020), Australian Open (2019, 2021) — highest-ranked Asian tennis player ever.', 'range', 2018, 2021, '#10b981'),
  ('a0000000-0000-0000-0000-00000000017c', 'Activities', 'Mental health advocacy', 'Withdrew from French Open 2021 citing mental health; sparked global conversation on athlete wellbeing.', 'point', 2021, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000017c', 'Activities', 'Tokyo Olympics lighting ceremony', 'Lit the Olympic cauldron at Tokyo 2020 opening ceremony — a historic moment.', 'point', 2021, null, '#d97706'),
  ('a0000000-0000-0000-0000-00000000017c', 'Relations & Family', 'Cordae relationship & motherhood', 'Partner rapper Cordae; daughter Shai born December 2023.', 'range', 2019, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000017c', 'Work & Education', 'Return from maternity leave', 'Returned to WTA Tour in January 2024 after birth of daughter.', 'point', 2024, null, '#10b981');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000017d', 'Place & Travel', 'Serbia', 'Born in Belgrade 1987; grew up in Serbia during NATO bombing; family supported his tennis dream.', 'range', 1987, 2004, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000017d', 'Work & Education', 'Professional career start', 'Turned pro 2003; broke into top 100 in 2005.', 'range', 2003, 2007, '#10b981'),
  ('a0000000-0000-0000-0000-00000000017d', 'Work & Education', '24 Grand Slam titles', 'Won record 24 Grand Slam singles titles; held world No.1 for a record 428 weeks.', 'range', 2008, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-00000000017d', 'Work & Education', 'Olympic gold medals', 'Won Olympic gold at Paris 2024 — completing career Golden Slam.', 'point', 2024, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000017d', 'Activities', 'COVID vaccine controversy', 'Deported from Australia in 2022 before Australian Open over COVID vaccination status — global media storm.', 'point', 2022, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000017d', 'Relations & Family', 'Jelena Ristic marriage', 'Married childhood sweetheart Jelena Ristic in 2014; son Stefan and daughter Tara.', 'range', 2014, 2026, '#ec4899');
