-- 031g_events.sql
-- Events for personas 200–213 (Serena Williams through Roger Clemens)
-- Missing from 031d_events.sql

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000200', 'Place & Travel', 'Compton, California', 'Born in Saginaw, Michigan 1981; family moved to Compton, CA — father Richard coached Serena and Venus on public courts.', 'range', 1981, 2001, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000200', 'Work & Education', 'Turned professional', 'Turned pro age 14 in 1995; won first WTA title in 1999 US Open — her first Grand Slam.', 'range', 1995, 1999, '#10b981'),
  ('a0000000-0000-0000-0000-000000000200', 'Work & Education', '23 Grand Slam titles', 'Won 23 Grand Slam singles titles — most by any player in the Open Era; dominated women''s tennis for two decades.', 'range', 1999, 2017, '#10b981'),
  ('a0000000-0000-0000-0000-000000000200', 'Work & Education', 'Evolution venture firm', 'Founded Evolution VC fund in 2014; invested in over 60 companies including Impossible Foods and MasterClass.', 'range', 2014, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-000000000200', 'Health', 'Pulmonary embolism & comeback', 'Near-fatal pulmonary embolism in 2011; remarkable comeback to dominate tennis through 2017.', 'point', 2011, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000200', 'Relations & Family', 'Alexis Ohanian marriage', 'Married Reddit co-founder Alexis Ohanian in 2017; daughter Olympia born 2017 (life-threatening delivery).', 'range', 2017, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000200', 'Work & Education', 'Retirement from tennis', 'Announced "evolution away from tennis" in 2022; last match at US Open 2022.', 'point', 2022, null, '#10b981');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000201', 'Place & Travel', 'Cypress, California', 'Born in Cypress, CA 1975; mixed Thai, Chinese, Dutch, and African-American heritage.', 'range', 1975, 1995, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000201', 'Work & Education', 'Child prodigy & Stanford', 'Appeared on The Mike Douglas Show at age 2; attended Stanford briefly before turning pro in 1996.', 'range', 1992, 1996, '#10b981'),
  ('a0000000-0000-0000-0000-000000000201', 'Work & Education', '15 major championships', 'Won 15 major titles including the Tiger Slam (2000–01) — four consecutive major titles.', 'range', 1997, 2008, '#10b981'),
  ('a0000000-0000-0000-0000-000000000201', 'Health', 'Career setbacks — scandal and injury', 'Infidelity scandal in 2009; multiple back surgeries, knee injuries. Catastrophic car accident 2021.', 'range', 2009, 2021, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000201', 'Work & Education', 'Masters 2019 comeback', 'Won Masters 2019 at age 43 — one of sport''s greatest comebacks after years of injuries.', 'point', 2019, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000201', 'Relations & Family', 'Elin Nordegren marriage', 'Married Swedish model Elin Nordegren 2004; two children; divorced 2010 after infidelity scandal.', 'range', 2004, 2010, '#ec4899');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000202', 'Place & Travel', 'Basel, Switzerland', 'Born in Basel 1981; grew up in Birsfelden; talent spotted at youth clubs.', 'range', 1981, 1999, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000202', 'Work & Education', 'Wimbledon dominance', 'Eight Wimbledon singles titles (2003–2012, 2017); defined an era of grass-court excellence.', 'range', 2003, 2017, '#10b981'),
  ('a0000000-0000-0000-0000-000000000202', 'Work & Education', '20 Grand Slam titles', 'Won 20 Grand Slam singles titles; world No.1 for record 310 weeks (non-consecutive).', 'range', 2003, 2018, '#10b981'),
  ('a0000000-0000-0000-0000-000000000202', 'Work & Education', 'Laver Cup creator', 'Co-founded Laver Cup team competition in 2017; merged Europe vs World format become popular ATP event.', 'range', 2017, 2022, '#10b981'),
  ('a0000000-0000-0000-0000-000000000202', 'Health', 'Retirement after illness', 'Knee problems; diagnosed with rare blood cancer (CML) 2020; retired September 2022.', 'point', 2022, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000202', 'Relations & Family', 'Mirka Vavrinec marriage', 'Married former player Mirka Vavrinec 2009; twin girls and twin boys — four children.', 'range', 2009, 2026, '#ec4899');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000203', 'Place & Travel', 'Jamaica', 'Born in Sherwood Content, Trelawny, Jamaica 1986; discovered by coach Norman Peart as a teenager.', 'range', 1986, 2004, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000203', 'Work & Education', 'World junior champion', 'Won 200m at 2002 World Junior Championships age 15; youngest world junior champion at the time.', 'point', 2002, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000203', 'Work & Education', 'Beijing Olympics 2008 — triple gold', 'Won 100m, 200m, and 4×100m relay at Beijing — first man to set world records in all three at a single Olympics.', 'point', 2008, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000203', 'Work & Education', 'Triple-triple at London 2012', 'Successfully defended all three golds at London 2012; established himself as greatest sprinter ever.', 'point', 2012, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000203', 'Work & Education', 'Rio 2016 — completing the treble', 'Won triple gold again at Rio; 100m record 9.58s and 200m record 19.19s remain unbeaten.', 'point', 2016, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000203', 'Work & Education', 'Retirement 2017', 'Retired from athletics after 2017 World Championships; attempted professional soccer career.', 'point', 2017, null, '#10b981');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000204', 'Place & Travel', 'Baltimore, Maryland', 'Born in Baltimore 1985; raised by single mother Debbie Phelps who supported his swimming passion.', 'range', 1985, 2001, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000204', 'Work & Education', '23 Olympic gold medals', 'Won 23 Olympic gold medals (28 total) across Athens, Beijing, London, and Rio — most decorated Olympian ever.', 'range', 2004, 2016, '#10b981'),
  ('a0000000-0000-0000-0000-000000000204', 'Work & Education', 'Eight golds at Beijing 2008', 'Won eight gold medals at a single Olympics in Beijing — surpassing Mark Spitz''s 1972 record.', 'point', 2008, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000204', 'Health', 'Mental health struggles', 'Publicly shared depression, suicidal thoughts after retiring; became prominent mental health advocate.', 'range', 2012, 2026, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000204', 'Work & Education', 'Retirement 2016', 'Retired after Rio Olympics 2016; previously had brief retirement 2012–2014.', 'point', 2016, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000204', 'Relations & Family', 'Nicole Johnson marriage', 'Married model Nicole Johnson 2016; three sons: Boomer, Beckett, Maverick.', 'range', 2016, 2026, '#ec4899');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000205', 'Place & Travel', 'Louisville, Kentucky', 'Born Cassius Clay in Louisville 1942; raised Baptist in a segregated Louisville.', 'range', 1942, 1960, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000205', 'Work & Education', 'Olympic gold & professional debut', 'Won light heavyweight gold at Rome Olympics 1960; turned professional immediately after.', 'point', 1960, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000205', 'Work & Education', 'World heavyweight champion', 'Won first heavyweight title beating Sonny Liston in 1964; changed name to Muhammad Ali.', 'point', 1964, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000205', 'Activities', 'Vietnam War refusal', 'Refused military induction in 1967 citing religious beliefs; stripped of title, banned 3 years.', 'point', 1967, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000205', 'Work & Education', 'Rumble in the Jungle & Thrilla in Manila', 'Beat Foreman 1974 (Zaire); fought Frazier 1975 (Manila) — two of boxing''s greatest events.', 'range', 1974, 1975, '#10b981'),
  ('a0000000-0000-0000-0000-000000000205', 'Health', 'Parkinson''s disease', 'Diagnosed with Parkinson''s disease in 1984; bore illness publicly and with grace until death 2016.', 'range', 1984, 2016, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000205', 'Activities', 'Civil rights & humanitarian', 'Major civil rights activist; UNICEF goodwill ambassador; Presidential Medal of Freedom 2005.', 'range', 1964, 2016, '#d97706');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000206', 'Place & Travel', 'Brooklyn & Chicago', 'Born in Brooklyn 1963; family moved to Chicago; starred at Emsley A. Laney High School.', 'range', 1963, 1981, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000206', 'Work & Education', 'North Carolina & NBA Draft', 'Played at UNC under Dean Smith; first-team All-American; drafted 3rd overall by Bulls in 1984.', 'range', 1981, 1984, '#10b981'),
  ('a0000000-0000-0000-0000-000000000206', 'Work & Education', 'Six NBA championships with Bulls', 'Led Chicago Bulls to six championships (1991–93, 1996–98); five MVP awards; never lost in NBA Finals.', 'range', 1991, 1998, '#10b981'),
  ('a0000000-0000-0000-0000-000000000206', 'Work & Education', 'Space Jam & global brand', 'Space Jam (1996) a cultural phenomenon; Air Jordan brand generated $3.6B in 2020.', 'range', 1994, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-000000000206', 'Work & Education', 'Charlotte Hornets ownership', 'Became majority owner of Charlotte Hornets in 2010; sold majority stake 2023.', 'range', 2010, 2023, '#10b981'),
  ('a0000000-0000-0000-0000-000000000206', 'Work & Education', 'The Last Dance documentary', '"The Last Dance" (Netflix 2020) 10-part documentary — most-watched sports documentary ever.', 'point', 2020, null, '#10b981');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000207', 'Place & Travel', 'Três Corações, Brazil', 'Born Edson Arantes do Nascimento in Três Corações, Brazil 1940; grew up in Bauru, São Paulo.', 'range', 1940, 1956, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000207', 'Work & Education', 'Santos FC & debut', 'Joined Santos FC at 15; scored in debut match; became club''s centerpiece for 18 years.', 'range', 1956, 1974, '#10b981'),
  ('a0000000-0000-0000-0000-000000000207', 'Work & Education', 'Three World Cup victories', 'Won World Cup with Brazil in 1958, 1962, 1970 — still the only player to win three World Cups.', 'range', 1958, 1970, '#10b981'),
  ('a0000000-0000-0000-0000-000000000207', 'Work & Education', 'New York Cosmos', 'Joined NASL''s New York Cosmos 1975; helped popularize soccer in the United States.', 'range', 1975, 1977, '#10b981'),
  ('a0000000-0000-0000-0000-000000000207', 'Work & Education', 'Minister of Sport — Brazil', 'Served as Brazil''s Extraordinary Minister of Sport under President Cardoso (1995–1998).', 'range', 1995, 1998, '#10b981'),
  ('a0000000-0000-0000-0000-000000000207', 'Health', 'Death', 'Died in São Paulo on December 29, 2022, aged 82, after colon cancer complications.', 'point', 2022, null, '#6b7280');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000208', 'Place & Travel', 'Buenos Aires, Argentina', 'Born in Lanús, Buenos Aires 1960; grew up in Villa Fiorito shantytown; talent spotted age 10.', 'range', 1960, 1976, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000208', 'Work & Education', 'Barcelona & Napoli', 'Played for Barcelona (1982–84) and Napoli (1984–91) where he won two Serie A titles.', 'range', 1982, 1991, '#10b981'),
  ('a0000000-0000-0000-0000-000000000208', 'Work & Education', 'Hand of God & Goal of the Century', '1986 World Cup quarter-final vs England: scored both the "Hand of God" goal and the "Goal of the Century" — in the same match.', 'point', 1986, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000208', 'Work & Education', '1986 World Cup victory', 'Led Argentina to 1986 World Cup victory; named tournament''s best player; greatest individual World Cup performance.', 'point', 1986, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000208', 'Health', 'Drug problems & heart attack', 'Cocaine addiction from mid-1980s; failed drug test 1994 World Cup; heart attack in 2000 and 2004.', 'range', 1984, 2004, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000208', 'Health', 'Death', 'Died in Buenos Aires on November 25, 2020, aged 60, following cardiac arrest after brain surgery.', 'point', 2020, null, '#6b7280');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000209', 'Place & Travel', 'Brazil', 'Born in Três Corações, Brazil 1960; grew up in São Paulo; came from motorsport family.', 'range', 1960, 1978, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000209', 'Work & Education', 'Formula 1 debut & early career', 'F1 debut 1984 for Toleman; moved to Lotus 1985; won first world championship with McLaren 1988.', 'range', 1984, 1988, '#10b981'),
  ('a0000000-0000-0000-0000-000000000209', 'Work & Education', 'Three World Championships', 'Won F1 World Championships in 1988, 1990, and 1991 with McLaren.', 'range', 1988, 1991, '#10b981'),
  ('a0000000-0000-0000-0000-000000000209', 'Work & Education', 'Williams & fatal accident', 'Moved to Williams 1994; died at San Marino Grand Prix, Imola, May 1, 1994. Led 32nd lap when his car crashed.', 'point', 1994, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000209', 'Activities', 'Social philanthropy', 'Founded Instituto Ayrton Senna in 1994 before his death; charity has since helped millions of Brazilian children.', 'range', 1994, 2026, '#d97706'),
  ('a0000000-0000-0000-0000-000000000209', 'Activities', 'National hero', 'Considered Brazil''s greatest ever sportsman; his death triggered national mourning and a state funeral.', 'point', 1994, null, '#d97706');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000020a', 'Place & Travel', 'Germany', 'Born in Hürth, North Rhine-Westphalia 1969; began karting at 6 on local track his father managed.', 'range', 1969, 1989, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000020a', 'Work & Education', 'F1 debut & Jordan/Benetton', 'F1 debut 1991 for Jordan; won first race for Benetton at 1992 Belgian Grand Prix.', 'range', 1991, 1995, '#10b981'),
  ('a0000000-0000-0000-0000-00000000020a', 'Work & Education', 'Seven World Championships', 'Won seven F1 World Championships (1994, 1995, 2000–2004) — still tied for the most ever.', 'range', 1994, 2004, '#10b981'),
  ('a0000000-0000-0000-0000-00000000020a', 'Work & Education', 'Retirement & return with Mercedes', 'Retired 2006; returned 2010–2012 with Mercedes; never recaptured former glory.', 'range', 2010, 2012, '#10b981'),
  ('a0000000-0000-0000-0000-00000000020a', 'Health', 'Skiing accident', 'Suffered severe traumatic brain injury in ski accident in Méribel, France, December 2013; has not appeared in public since.', 'point', 2013, null, '#ef4444'),
  ('a0000000-0000-0000-0000-00000000020a', 'Relations & Family', 'Corinna Betsch marriage', 'Married former manager Corinna Betsch in 1995; son Mick (also F1 driver) and daughter Gina-Maria.', 'range', 1995, 2026, '#ec4899');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000020b', 'Place & Travel', 'Ontario, Canada', 'Born in Brantford, Ontario 1961; learned to skate at age 3; dominated local hockey from childhood.', 'range', 1961, 1978, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000020b', 'Work & Education', 'NHL career — Edmonton Oilers dynasty', 'Led Oilers to four Stanley Cup victories (1984, 1985, 1987, 1988); broke essentially every NHL scoring record.', 'range', 1979, 1988, '#10b981'),
  ('a0000000-0000-0000-0000-00000000020b', 'Work & Education', 'All-time NHL points record', 'Scored 894 goals and 2,857 total points — so far ahead of anyone else the record seems unbreakable.', 'range', 1979, 1999, '#10b981'),
  ('a0000000-0000-0000-0000-00000000020b', 'Work & Education', 'Trade to LA Kings — popularizing hockey', 'Traded to Los Angeles Kings in 1988; credited with popularizing hockey in southern US states.', 'range', 1988, 1994, '#10b981'),
  ('a0000000-0000-0000-0000-00000000020b', 'Work & Education', 'Retirement & legacy', 'Retired 1999; jersey number 99 immediately retired league-wide — only player ever given that honor by the NHL.', 'point', 1999, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000020b', 'Relations & Family', 'Janet Jones marriage', 'Married actress Janet Jones in 1988 — dubbed "The Royal Wedding" in Canada; five children.', 'range', 1988, 2026, '#ec4899');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000020c', 'Place & Travel', 'Columbus, Ohio', 'Born in Columbus 1940; grew up in Upper Arlington, Ohio suburb; took up golf age 10.', 'range', 1940, 1961, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000020c', 'Work & Education', 'Amateur record & Augusta debut', 'Won US Amateur twice (1959, 1961); finished 2nd at Masters as an amateur in 1961.', 'range', 1959, 1961, '#10b981'),
  ('a0000000-0000-0000-0000-00000000020c', 'Work & Education', '18 major championships', 'Won 18 professional major championships — a record that stood until Tiger Woods approached it.', 'range', 1962, 1986, '#10b981'),
  ('a0000000-0000-0000-0000-00000000020c', 'Work & Education', 'Course design — Muirfield Village', 'Designed Muirfield Village Golf Club (1974) in Dublin, Ohio; hosts the Memorial Tournament.', 'range', 1974, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-00000000020c', 'Activities', 'The Golden Bear nickname', 'Known as "The Golden Bear" — considered by many the greatest golfer of all time based on major wins.', 'range', 1962, 2026, '#f59e0b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000020d', 'Place & Travel', 'Brooklyn, New York', 'Born in Brownsville, Brooklyn 1966; turbulent childhood in one of New York''s toughest neighborhoods.', 'range', 1966, 1982, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000020d', 'Work & Education', 'Cus D''Amato & boxing career', 'Taken under wing of trainer Cus D''Amato age 13; turned pro 1985; won first title at 20.', 'range', 1982, 1986, '#10b981'),
  ('a0000000-0000-0000-0000-00000000020d', 'Work & Education', 'Undisputed heavyweight champion', 'Became undisputed heavyweight champion in 1987, age 20 — youngest ever. Destroyed opponents in seconds.', 'range', 1987, 1990, '#10b981'),
  ('a0000000-0000-0000-0000-00000000020d', 'Work & Education', 'Buster Douglas upset & decline', 'Shocking loss to Buster Douglas 1990; imprisoned for rape conviction 1992–1995.', 'range', 1990, 1995, '#10b981'),
  ('a0000000-0000-0000-0000-00000000020d', 'Activities', 'Ear biting incident', 'Bit off part of Evander Holyfield''s ear in 1997 WBC rematch — one of sport''s most bizarre incidents.', 'point', 1997, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000020d', 'Work & Education', 'Retirement & entertainment', 'Retired from boxing 2005; appeared in The Hangover (2009); Broadway show about his life 2012.', 'range', 2005, 2026, '#10b981');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000020e', 'Place & Travel', 'Brühl, West Germany', 'Born in Brühl, West Germany 1969; parents fled East Germany; tennis prodigy discovered age 6.', 'range', 1969, 1987, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000020e', 'Work & Education', 'Professional career & Wimbledon', 'Turned pro at 13; won Wimbledon in 1988, 1989, 1991, 1992, 1993, 1995, 1996 — seven titles.', 'range', 1982, 1999, '#10b981'),
  ('a0000000-0000-0000-0000-00000000020e', 'Work & Education', '22 Grand Slam titles', 'Won 22 Grand Slam titles in singles, doubles, and mixed doubles; career Golden Slam in 1988.', 'range', 1987, 1999, '#10b981'),
  ('a0000000-0000-0000-0000-00000000020e', 'Work & Education', 'Dominance — 377 weeks at No.1', 'Held world No.1 ranking for 377 weeks; won six consecutive Wimbledon titles 1991–96.', 'range', 1987, 1997, '#10b981'),
  ('a0000000-0000-0000-0000-00000000020e', 'Work & Education', 'Retirement & coaching career', 'Retired 1999; became leading coach; coached Victoria Azarenka and Angelique Kerber to Grand Slams.', 'range', 1999, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-00000000020e', 'Relations & Family', 'Michael Bartels relationship', 'Long relationship with German racing driver Michael Bartels; never married.', 'range', 1993, 2009, '#ec4899');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000020f', 'Place & Travel', 'Prague, Czechoslovakia', 'Born in Prague 1956; defected to United States during 1975 US Open at age 18.', 'range', 1956, 1975, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000020f', 'Work & Education', 'Wimbledon dominance', 'Won Wimbledon nine times (1978–79, 1982–87, 1990) — most Wimbledon singles titles in women''s history.', 'range', 1978, 1990, '#10b981'),
  ('a0000000-0000-0000-0000-00000000020f', 'Work & Education', '18 Grand Slam titles', 'Won 18 singles Grand Slams; 31 doubles Grand Slams; 10 mixed doubles — 59 total, most ever.', 'range', 1978, 1994, '#10b981'),
  ('a0000000-0000-0000-0000-00000000020f', 'Work & Education', 'Pro career & records', 'Turned pro 1975; held world No.1 ranking for 332 weeks; last Grand Slam win at age 37 (1993 US Open doubles).', 'range', 1975, 2004, '#10b981'),
  ('a0000000-0000-0000-0000-00000000020f', 'Activities', 'LGBTQ+ pioneer', 'Came out as bisexual in 1981 autobiography — one of the first major sports figures to do so publicly.', 'point', 1981, null, '#d97706'),
  ('a0000000-0000-0000-0000-00000000020f', 'Relations & Family', 'Julia Lemigova marriage', 'Married former Miss USSR Julia Lemigova in 2014, after coming out as lesbian on Ellen DeGeneres Show.', 'range', 2014, 2026, '#ec4899');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000210', 'Place & Travel', 'Plano, Texas', 'Born in Plano, Texas 1971; dominated cycling from college; lived in Austin, TX and Nice, France.', 'range', 1971, 1994, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000210', 'Work & Education', 'Tour de France victories', 'Won seven consecutive Tour de France titles (1999–2005) after recovering from cancer.', 'range', 1999, 2005, '#10b981'),
  ('a0000000-0000-0000-0000-000000000210', 'Health', 'Testicular cancer', 'Diagnosed with stage 3 testicular cancer in 1996; given less than 50% chance of survival; recovered fully.', 'point', 1996, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000210', 'Work & Education', 'Livestrong Foundation', 'Founded Livestrong Foundation in 1997; raised $500M+ for cancer awareness and support.', 'range', 1997, 2012, '#10b981'),
  ('a0000000-0000-0000-0000-000000000210', 'Activities', 'Doping scandal', 'Admitted to systematic doping on Oprah 2013; stripped of all seven Tour de France titles by USADA.', 'point', 2013, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000210', 'Relations & Family', 'Sheryl Crow relationship', 'Engaged to musician Sheryl Crow 2005; relationship ended 2006. Has five children.', 'range', 2003, 2006, '#ec4899');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000211', 'Place & Travel', 'San Francisco Bay Area', 'Born in Washington DC 1976; raised in Austin, TX and Ann Arbor, MI; studied at University of Michigan.', 'range', 1976, 1999, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000211', 'Work & Education', 'StumbleUpon & early ventures', 'Co-founded StumbleUpon in 2001 (web discovery tool); sold to eBay for $75M in 2007.', 'range', 2001, 2007, '#10b981'),
  ('a0000000-0000-0000-0000-000000000211', 'Work & Education', 'Uber co-founding & growth', 'Co-founded Uber in 2009 with Garrett Camp; grew it from startup to $70B valuation under his tenure.', 'range', 2009, 2017, '#10b981'),
  ('a0000000-0000-0000-0000-000000000211', 'Work & Education', 'Ousted as Uber CEO', 'Forced to resign as Uber CEO in June 2017 following cultural misconduct allegations and board pressure.', 'point', 2017, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000211', 'Work & Education', 'CloudKitchens', 'Founded CloudKitchens ghost kitchen company in 2018; valued at $15B+ by 2021.', 'range', 2018, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-000000000211', 'Activities', 'Controversy & culture', 'Uber''s "bro culture" and aggressive expansion under Kalanick sparked multiple regulatory battles globally.', 'range', 2010, 2017, '#f59e0b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000212', 'Place & Travel', 'New Mexico & San Francisco', 'Born in Albuquerque, New Mexico 1987; grew up in Pittsburgh; studied at Stanford and MIT.', 'range', 1987, 2015, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000212', 'Work & Education', 'OpenAI co-founding', 'Co-founded OpenAI in 2015 with Sam Altman, Elon Musk and others; served as President and CTO.', 'range', 2015, 2023, '#10b981'),
  ('a0000000-0000-0000-0000-000000000212', 'Work & Education', 'GPT and ChatGPT development', 'Oversaw development of GPT series including GPT-4 and ChatGPT — transformative AI products.', 'range', 2018, 2023, '#10b981'),
  ('a0000000-0000-0000-0000-000000000212', 'Work & Education', 'Departure from OpenAI', 'Left OpenAI in May 2023; joined Exponent, a startup founded with former colleagues.', 'point', 2023, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000212', 'Activities', 'AI safety advocate', 'Co-authored influential AI safety papers; considered a key figure in shaping OpenAI''s safety culture.', 'range', 2015, 2023, '#d97706');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000213', 'Place & Travel', 'Dayton, Ohio', 'Born in Dayton, Ohio 1962; grew up dreaming of baseball; attended San Jacinto College in Texas.', 'range', 1962, 1983, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000213', 'Work & Education', 'Boston Red Sox debut', 'Drafted by Red Sox in 1983; debuted 1984; dominated American League with his fastball.', 'range', 1983, 1996, '#10b981'),
  ('a0000000-0000-0000-0000-000000000213', 'Work & Education', 'Cy Young Awards & Yankees', 'Won seven Cy Young Awards; joined Yankees 1999 winning two World Series (1999, 2000).', 'range', 1986, 2003, '#10b981'),
  ('a0000000-0000-0000-0000-000000000213', 'Work & Education', 'Houston Astros & retirement', 'Returned to Houston 2004–06; retired 2007 with 354 career wins and 4,672 strikeouts.', 'range', 2004, 2007, '#10b981'),
  ('a0000000-0000-0000-0000-000000000213', 'Activities', 'Steroid controversy', 'Named in Mitchell Report 2007; denied PED use; perjury trial (2012) acquitted but reputation damaged.', 'range', 2007, 2012, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000213', 'Activities', 'Hall of Fame controversy', 'Repeatedly denied Hall of Fame induction due to steroid suspicions despite statistically dominant career.', 'range', 2013, 2026, '#f59e0b');
