-- ============================================================
-- 032b_nordic_events.sql
-- Events for Nordic personas 284 – 2c1 (personas 39–100)
-- ============================================================

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  -- Ingvar Kamprad (284)
  ('a0000000-0000-0000-0000-000000000284', 'Place & Travel', 'Born in Pjätteryd, Småland', 'Born on 30 March 1926 near the village of Pjätteryd in Småland; the frugal, industrious culture of the region shaped his entire philosophy.', 'point', 1926, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000284', 'Work & Education', 'Founded IKEA at 17', 'Registered the company Ingvar Kamprad Elmtaryd Agunnaryd (IKEA) in 1943 at age 17; initially sold pens, picture frames, and matches by mail order.', 'point', 1943, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000284', 'Work & Education', 'First furniture showroom', 'Opened IKEA''s first furniture showroom in Älmhult in 1958; the flat-pack concept — solving the problem of shipping assembled furniture — emerged soon after.', 'point', 1958, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000284', 'Work & Education', 'Global retail empire', 'Expanded IKEA across Europe, North America, and Asia; by the time of his death the company operated 433 stores in over 60 countries with annual revenues exceeding €38 billion.', 'range', 1963, 2018, '#10b981'),
  ('a0000000-0000-0000-0000-000000000284', 'Assets', 'One of world''s wealthiest people', 'Built one of the world''s great private fortunes through IKEA; famous for personal frugality — flew economy class, drove an old Volvo, bought discounted groceries.', 'range', 1970, 2018, '#8b5cf6'),
  ('a0000000-0000-0000-0000-000000000284', 'Items', 'The IKEA Way', 'Authored Testament of a Furniture Dealer, an internal document outlining IKEA''s philosophy; became a template for corporate culture emphasising humility, cost-consciousness, and simplicity.', 'point', 1976, null, '#64748b'),
  ('a0000000-0000-0000-0000-000000000284', 'Health', 'Died in Småland', 'Died on 27 January 2018 in his home region of Småland, aged 91; had moved back to Sweden after decades in Switzerland and other countries.', 'point', 2018, null, '#ef4444'),

  -- Tage Erlander (285)
  ('a0000000-0000-0000-0000-000000000285', 'Place & Travel', 'Born in Ransäter, Värmland', 'Born on 13 June 1901 in Ransäter, Värmland; the son of a schoolteacher; studied at Lund University.', 'point', 1901, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000285', 'Work & Education', 'Became Prime Minister', 'Became Prime Minister of Sweden in 1946, succeeding Per Albin Hansson who died suddenly; held the post until 1969 — 23 years, the longest of any democratically elected head of government.', 'range', 1946, 1969, '#10b981'),
  ('a0000000-0000-0000-0000-000000000285', 'Work & Education', 'Built the Swedish welfare state', 'Oversaw the construction of the modern Swedish welfare state including universal healthcare, public pensions, and the million-programme housing programme.', 'range', 1946, 1969, '#10b981'),
  ('a0000000-0000-0000-0000-000000000285', 'Activities', 'Maintained Swedish neutrality', 'Carefully maintained Swedish neutrality during the Cold War while cultivating a close relationship with the United States; rejected both NATO and the Warsaw Pact.', 'range', 1946, 1969, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000285', 'Relations & Family', 'Married Aina Andersson', 'Married Aina Andersson in 1930; their partnership lasted until his death; she was a key political and personal support.', 'range', 1930, 1985, '#ec4899'),

  -- Per Albin Hansson (286)
  ('a0000000-0000-0000-0000-000000000286', 'Place & Travel', 'Born in Malmö', 'Born on 28 October 1885 in Malmö; grew up in poverty; left school at 14 to work.', 'point', 1885, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000286', 'Work & Education', 'Labour movement organiser', 'Became active in the youth wing of the Social Democratic Party as a teenager; edited party newspapers and became a leading organiser.', 'range', 1905, 1920, '#10b981'),
  ('a0000000-0000-0000-0000-000000000286', 'Work & Education', '"Folkhemmet" concept', 'In a famous 1928 speech coined and popularised "Folkhemmet" — the People''s Home — the idea that Sweden should be a society without class distinctions where everyone is cared for equally; became the ideological basis of the Swedish welfare state.', 'point', 1928, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000286', 'Work & Education', 'Prime Minister 1932–1946', 'Served as Prime Minister 1932–1936 and 1936–1946; built the foundations of the Swedish welfare state and led the country through World War II.', 'range', 1932, 1946, '#10b981'),
  ('a0000000-0000-0000-0000-000000000286', 'Activities', 'Swedish neutrality in WWII', 'Navigated Sweden through World War II maintaining neutrality under extreme pressure from both Nazi Germany and the Allied powers; a controversial but successful strategy.', 'range', 1939, 1945, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000286', 'Health', 'Died in office', 'Died of a heart attack on 6 October 1946 while still serving as Prime Minister; mourned across Sweden.', 'point', 1946, null, '#ef4444'),

  -- King Carl XVI Gustaf (287)
  ('a0000000-0000-0000-0000-000000000287', 'Place & Travel', 'Born in Haga Palace', 'Born on 30 April 1946 at Haga Palace near Stockholm; his father Prince Gustaf Adolf died in a plane crash when Carl Gustaf was only nine months old.', 'point', 1946, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000287', 'Work & Education', 'Military and naval education', 'Educated at various Swedish military academies and served in all three branches of the armed forces as part of his royal training.', 'range', 1966, 1973, '#10b981'),
  ('a0000000-0000-0000-0000-000000000287', 'Work & Education', 'Became King of Sweden', 'Acceded to the throne on 15 September 1973 following the death of his grandfather King Gustaf VI Adolf; became Sweden''s reigning monarch at age 27.', 'point', 1973, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000287', 'Relations & Family', 'Married Silvia Sommerlath', 'Married German-Brazilian Silvia Sommerlath on 19 June 1976 in Stockholm; the wedding was watched by hundreds of millions on television worldwide.', 'point', 1976, null, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000287', 'Activities', 'Environmental advocacy', 'A committed environmentalist who chairs the World Scout Foundation and has made conservation and sustainability central themes of his reign.', 'range', 1980, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000287', 'Work & Education', 'Purely ceremonial role', 'The 1974 constitution removed political power from the monarch; Carl XVI Gustaf became a purely ceremonial head of state representing Sweden at home and abroad.', 'range', 1974, 2026, '#10b981'),

  -- Pär Lagerkvist (288)
  ('a0000000-0000-0000-0000-000000000288', 'Place & Travel', 'Born in Växjö', 'Born on 23 May 1891 in Växjö, Småland; grew up in a deeply religious low-church family that informed his lifelong preoccupation with good and evil.', 'point', 1891, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000288', 'Work & Education', 'Early literary career', 'Published poetry, plays, and novels from 1912; moved to Paris and was influenced by Cubism and expressionism; returned to Sweden and continued writing.', 'range', 1912, 1950, '#10b981'),
  ('a0000000-0000-0000-0000-000000000288', 'Work & Education', 'The Dwarf', 'Published the novel The Dwarf in 1944 — a disturbing portrait of Renaissance-era evil — establishing his international reputation.', 'point', 1944, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000288', 'Work & Education', 'Barabbas and Nobel Prize', 'Published Barabbas in 1950 — a novel about the man released instead of Christ — which became his most widely read work; awarded the Nobel Prize in Literature in 1951.', 'point', 1951, null, '#10b981'),

  -- Vilhelm Moberg (289)
  ('a0000000-0000-0000-0000-000000000289', 'Place & Travel', 'Born in Algutsboda, Småland', 'Born on 20 August 1898 in the parish of Algutsboda, Kronoberg County; the son of a crofter whose family had worked the same land for generations.', 'point', 1898, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000289', 'Work & Education', 'Journalist and novelist', 'Worked as a journalist from his teens while publishing novels; wrote about Swedish rural life and small-town society with a sharply critical social eye.', 'range', 1919, 1949, '#10b981'),
  ('a0000000-0000-0000-0000-000000000289', 'Work & Education', 'The Emigrants tetralogy', 'Wrote the four-volume Emigrant series 1949–1959 following Swedish peasants who emigrated to Minnesota in the 19th century; became the most widely read Swedish novels internationally.', 'range', 1949, 1959, '#10b981'),
  ('a0000000-0000-0000-0000-000000000289', 'Activities', 'Political journalism', 'A vocal critic of the Swedish establishment, press freedom limitations, and later of the Social Democrats; championed individual rights throughout his life.', 'range', 1930, 1973, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000289', 'Health', 'Died in Lake Immeln', 'Died on 8 August 1973 when he drowned in Lake Immeln, Skåne; ruled an accident though some speculation of suicide; mourned as one of the great Swedish authors.', 'point', 1973, null, '#ef4444'),

  -- Robyn (28a)
  ('a0000000-0000-0000-0000-00000000028a', 'Place & Travel', 'Born in Stockholm', 'Born Robin Miriam Carlsson on 12 June 1979 in Stockholm; began performing in the Stockholm suburb of Enskede as a child.', 'point', 1979, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000028a', 'Work & Education', 'Show Me Love — debut hit', 'Released Show Me Love in 1997 at age 18; the song topped charts across Europe and became one of the defining Swedish pop hits of the decade.', 'point', 1997, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000028a', 'Work & Education', 'Left major label, founded Konichiwa', 'Walked away from major label Jive Records in 2005 to found her own label Konichiwa Records, retaining creative control; a pioneering move for a pop artist.', 'point', 2005, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000028a', 'Work & Education', 'Body Talk albums', 'Released the critically acclaimed Body Talk album in three volumes in 2010; Dancing on My Own and Hang with Me became anthems; cemented her status as an art-pop icon.', 'range', 2010, 2010, '#10b981'),
  ('a0000000-0000-0000-0000-00000000028a', 'Activities', 'Influential on global pop', 'Cited by artists including Taylor Swift, Lizzo, and Charli XCX as a key influence; her blend of personal emotion and electro-pop production defined a new approach to mainstream pop.', 'range', 2010, 2026, '#f59e0b'),

  -- Mannerheim (28b)
  ('a0000000-0000-0000-0000-00000000028b', 'Place & Travel', 'Born in Askainen, Finland', 'Born on 4 June 1867 at Louhisaari Manor in Askainen; from a Swedish-speaking Finnish noble family; Finland was then part of the Russian Empire.', 'point', 1867, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000028b', 'Work & Education', 'Russian Imperial Army career', 'Served in the Russian Imperial Army for 30 years, rising to the rank of Lieutenant General; served in the Russo-Japanese War and World War I with distinction.', 'range', 1889, 1917, '#10b981'),
  ('a0000000-0000-0000-0000-00000000028b', 'Place & Travel', 'Intelligence expedition to Asia', 'Completed a two-year military intelligence expedition across Central Asia and China 1906–1908, producing detailed geographic and ethnographic reports for the Russian General Staff.', 'range', 1906, 1908, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000028b', 'Work & Education', 'Led Finnish White forces in Civil War', 'Returned to Finland after independence in 1917; led the "White" government forces to victory over the "Red" socialists in the Finnish Civil War of 1918.', 'range', 1918, 1918, '#10b981'),
  ('a0000000-0000-0000-0000-00000000028b', 'Work & Education', 'Regent of Finland', 'Served as Regent of Finland 1918–1919 while a constitution was negotiated; lost the presidential election to K.J. Ståhlberg in 1919.', 'range', 1918, 1919, '#10b981'),
  ('a0000000-0000-0000-0000-00000000028b', 'Work & Education', 'Led Winter War defence', 'Commanded Finnish forces in the Winter War against the Soviet Union 1939–1940; the outnumbered Finns inflicted massive Soviet casualties before the Moscow Peace Treaty ended the war.', 'range', 1939, 1940, '#10b981'),
  ('a0000000-0000-0000-0000-00000000028b', 'Work & Education', 'President of Finland', 'Served as President of Finland 1944–1946, overseeing the armistice with the Soviet Union and the transition to post-war stability.', 'range', 1944, 1946, '#10b981'),
  ('a0000000-0000-0000-0000-00000000028b', 'Health', 'Died in Lausanne', 'Died on 27 January 1951 in a clinic in Lausanne, Switzerland; buried with full state honours in Helsinki; remains Finland''s most revered historical figure.', 'point', 1951, null, '#ef4444'),

  -- Jean Sibelius (28c)
  ('a0000000-0000-0000-0000-00000000028c', 'Place & Travel', 'Born in Hämeenlinna', 'Born on 8 December 1865 in Hämeenlinna; grew up in a Swedish-speaking Finnish family; began violin lessons at age nine.', 'point', 1865, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000028c', 'Work & Education', 'Studies in Helsinki, Berlin, Vienna', 'Studied composition and violin in Helsinki, then Berlin, then Vienna 1885–1891; absorbed German Romanticism while developing a distinctly Finnish voice.', 'range', 1885, 1891, '#10b981'),
  ('a0000000-0000-0000-0000-00000000028c', 'Work & Education', 'Kullervo symphony', 'Premiered his choral symphony Kullervo in 1892 to great acclaim; its use of Finnish mythology signalled a new national music.', 'point', 1892, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000028c', 'Work & Education', 'Finlandia — national symbol', 'Composed Finlandia in 1899 as a protest against Russian censorship; it became a symbol of Finnish independence and one of the most recognisable pieces of nationalist music.', 'point', 1899, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000028c', 'Work & Education', 'Seven symphonies', 'Composed seven numbered symphonies between 1899 and 1924; considered among the great symphonic cycles of the 20th century.', 'range', 1899, 1924, '#10b981'),
  ('a0000000-0000-0000-0000-00000000028c', 'Health', 'Thirty years of silence', 'Stopped composing publicly after his Seventh Symphony in 1924; the legendary "Eighth Symphony" was reportedly composed and burned; lived as a recluse at Ainola.', 'range', 1926, 1957, '#ef4444'),
  ('a0000000-0000-0000-0000-00000000028c', 'Place & Travel', 'Died at Ainola', 'Died on 20 September 1957 at his home Ainola in Järvenpää, aged 91, after watching a flock of cranes — which appear in his music — fly overhead.', 'point', 1957, null, '#3b82f6'),

  -- Alvar Aalto (28d)
  ('a0000000-0000-0000-0000-00000000028d', 'Place & Travel', 'Born in Kuortane', 'Born on 3 February 1898 in Kuortane; studied architecture at the Helsinki University of Technology.', 'point', 1898, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000028d', 'Work & Education', 'Paimio Sanatorium', 'Designed the Paimio Tuberculosis Sanatorium 1929–1933 — a landmark of modernism where every detail, including door handles and window positions, was designed around patient wellbeing.', 'range', 1929, 1933, '#10b981'),
  ('a0000000-0000-0000-0000-00000000028d', 'Work & Education', 'Viipuri Library and international fame', 'Designed the Viipuri City Library, completed 1935, and was included in the landmark 1932 MoMA International Style exhibition; became internationally recognised.', 'point', 1935, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000028d', 'Work & Education', 'MIT Baker House', 'Designed the MIT Baker House dormitory in Cambridge, Massachusetts (1948); his undulating brick building influenced a generation of American architects.', 'point', 1948, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000028d', 'Work & Education', 'Finlandia Hall', 'Designed the Finlandia Hall concert venue in Helsinki (completed 1971), one of Finland''s most important public buildings.', 'point', 1971, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000028d', 'Items', 'Aalto furniture and design', 'Co-founded Artek in 1935 to manufacture and sell his bent-plywood furniture designs; the Stool 60 and Paimio Chair remain design icons still in production.', 'range', 1935, 2026, '#64748b'),

  -- Urho Kekkonen (28e)
  ('a0000000-0000-0000-0000-00000000028e', 'Place & Travel', 'Born in Pielavesi', 'Born on 3 September 1900 in Pielavesi; worked as a youth activist before studying law at Helsinki University.', 'point', 1900, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000028e', 'Work & Education', 'Minister and PM before presidency', 'Served as Minister of Justice, Interior Minister, and twice as Prime Minister before being elected President in 1956.', 'range', 1937, 1956, '#10b981'),
  ('a0000000-0000-0000-0000-00000000028e', 'Work & Education', 'President of Finland — 26 years', 'Served as President from 1956 to 1982; held the record for the longest presidential term in Finnish history; dominated Finnish politics as no other figure.', 'range', 1956, 1982, '#10b981'),
  ('a0000000-0000-0000-0000-00000000028e', 'Activities', 'Finlandisation policy', 'Mastered the delicate balancing act of maintaining Finnish sovereignty while accommodating Soviet sensitivities; his approach — later called "Finlandisation" — became a model for small-state diplomacy.', 'range', 1956, 1982, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000028e', 'Activities', 'Helsinki Accords 1975', 'Hosted the Conference on Security and Co-operation in Europe summit in Helsinki in 1975; the Helsinki Accords were signed by 35 nations including the USA and USSR, embedding human rights in Cold War diplomacy.', 'point', 1975, null, '#f59e0b'),

  -- Paavo Nurmi (28f)
  ('a0000000-0000-0000-0000-00000000028f', 'Place & Travel', 'Born in Turku', 'Born on 13 June 1897 in Turku; grew up in poverty; began running at age 12 inspired by Hannes Kolehmainen''s 1912 Olympic victories.', 'point', 1897, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000028f', 'Activities', 'Nine Olympic gold medals', 'Won nine Olympic gold medals across the 1920 Antwerp, 1924 Paris, and 1928 Amsterdam Games — the most of any track and field athlete at the time.', 'range', 1920, 1928, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000028f', 'Activities', '22 world records', 'Set 22 official world records between 1921 and 1931 at distances from 1500m to 20km; competed with a stopwatch in hand, running mathematically precise race plans.', 'range', 1921, 1931, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000028f', 'Work & Education', 'Business career', 'Built a successful construction and real estate business after retirement from athletics; became a wealthy businessman in Turku.', 'range', 1932, 1973, '#10b981'),
  ('a0000000-0000-0000-0000-00000000028f', 'Activities', 'Lit Olympic torch 1952', 'Carried the Olympic flame into Helsinki''s Olympic Stadium to open the 1952 Summer Olympics; a revered moment of Finnish national pride.', 'point', 1952, null, '#f59e0b'),

  -- Tove Jansson (290)
  ('a0000000-0000-0000-0000-000000000290', 'Place & Travel', 'Born in Helsinki', 'Born on 9 August 1914 in Helsinki; daughter of sculptor Viktor Jansson and illustrator Signe Hammarsten; grew up in a creative, Swedish-speaking family.', 'point', 1914, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000290', 'Work & Education', 'Art studies in Stockholm and Paris', 'Studied art at the Swedish School of Arts and Crafts in Stockholm and the École des Beaux-Arts in Paris; worked as a magazine illustrator in Helsinki.', 'range', 1930, 1938, '#10b981'),
  ('a0000000-0000-0000-0000-000000000290', 'Work & Education', 'Moomins created', 'Published the first Moomin book The Moomins and the Great Flood in 1945; the round, gentle Moomin characters — living in a peaceful valley threatened by various catastrophes — became a global phenomenon.', 'point', 1945, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000290', 'Work & Education', 'Moomin comic strip', 'Produced the Moomin comic strip for the London Evening News 1954–1975 — syndicated worldwide, reaching an estimated 40 million readers daily.', 'range', 1954, 1975, '#10b981'),
  ('a0000000-0000-0000-0000-000000000290', 'Relations & Family', 'Partner Tuulikki Pietilä', 'Maintained a long-term relationship with artist Tuulikki Pietilä from the 1950s; they lived together in Helsinki and on the island of Klovharun.', 'range', 1956, 2001, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000290', 'Items', 'Adult fiction', 'Wrote acclaimed adult novels and short story collections including The Summer Book and Fair Play; her adult work is regarded as literary art of the highest order.', 'range', 1972, 1998, '#64748b'),

  -- Linus Torvalds (291)
  ('a0000000-0000-0000-0000-000000000291', 'Place & Travel', 'Born in Helsinki', 'Born on 28 December 1969 in Helsinki into a Swedish-speaking family; grandfather was a statistician who used early computers, sparking Linus''s interest.', 'point', 1969, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000291', 'Work & Education', 'Created Linux kernel', 'While a student at the University of Helsinki, posted a message to a newsgroup in August 1991 announcing a free hobby operating system kernel; Linux grew into the world''s dominant server and embedded OS.', 'point', 1991, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000291', 'Work & Education', 'Linux Foundation', 'Has led development of the Linux kernel for over 30 years; works under the auspices of the Linux Foundation; Linux powers most of the world''s servers, the majority of smartphones (Android), and the ISS.', 'range', 1991, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-000000000291', 'Work & Education', 'Created Git', 'Created Git in 2005 after disputes over version-control software for Linux; Git became the world''s most widely used version control system, fundamental to modern software development.', 'point', 2005, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000291', 'Place & Travel', 'Moved to USA', 'Moved to the United States in 1997; became a US citizen; based in Portland, Oregon for many years before relocating.', 'point', 1997, null, '#3b82f6'),

  -- Mika Häkkinen (292)
  ('a0000000-0000-0000-0000-000000000292', 'Place & Travel', 'Born in Vantaa', 'Born on 28 September 1968 in Vantaa; showed exceptional car control as a kart racer from childhood.', 'point', 1968, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000292', 'Work & Education', 'F1 debut and McLaren career', 'Made his Formula One debut in 1991; joined McLaren in 1993 and formed a legendary partnership with the team.', 'range', 1991, 2001, '#10b981'),
  ('a0000000-0000-0000-0000-000000000292', 'Health', 'Survived near-fatal crash', 'Suffered a near-fatal crash at the 1995 Australian Grand Prix and was given an emergency tracheotomy trackside; made a remarkable recovery.', 'point', 1995, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000292', 'Activities', 'Back-to-back World Championships', 'Won the Formula One World Championship with McLaren in 1998 and 1999; his legendary rivalry with Michael Schumacher produced some of the most thrilling racing of the era.', 'range', 1998, 1999, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000292', 'Work & Education', 'Retirement from F1', 'Retired from Formula One in 2001 to spend time with his family; made a brief return to racing with Mercedes in DTM 2005–2007.', 'point', 2001, null, '#10b981'),

  -- Kimi Räikkönen (293)
  ('a0000000-0000-0000-0000-000000000293', 'Place & Travel', 'Born in Espoo', 'Born on 17 October 1979 in Espoo; took up kart racing as a child; showed remarkable natural speed from his first races.', 'point', 1979, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000293', 'Work & Education', 'F1 debut with Sauber', 'Made his Formula One debut with Sauber in 2001 with just 23 kart races to his name; immediately showed championship-calibre pace.', 'point', 2001, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000293', 'Work & Education', 'McLaren years', 'Drove for McLaren 2002–2006; narrowly missed the 2003 championship and was consistently fast but mechanical failures cost him points.', 'range', 2002, 2006, '#10b981'),
  ('a0000000-0000-0000-0000-000000000293', 'Activities', 'World Champion with Ferrari', 'Won the 2007 Formula One World Championship with Ferrari, edging out Lewis Hamilton and Fernando Alonso by a single point on the final lap of the final race.', 'point', 2007, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000293', 'Work & Education', 'Record 349 Grand Prix starts', 'Competed in a record 349 Formula One Grand Prix starts across 19 seasons; retired at the end of 2021 with 21 race wins and a reputation as one of the sport''s most naturally gifted drivers.', 'range', 2001, 2021, '#10b981'),

  -- Martti Ahtisaari (294)
  ('a0000000-0000-0000-0000-000000000294', 'Place & Travel', 'Born in Viipuri', 'Born on 23 June 1937 in Viipuri (now Vyborg, Russia); his family was evacuated during the Winter War, an experience that shaped his commitment to conflict resolution.', 'point', 1937, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000294', 'Work & Education', 'Finnish diplomatic career', 'Built a career in Finnish foreign affairs, eventually serving as Under-Secretary-General of the UN and Finnish Ambassador to Tanzania.', 'range', 1965, 1994, '#10b981'),
  ('a0000000-0000-0000-0000-000000000294', 'Work & Education', 'President of Finland', 'Served as President of Finland 1994–2000; supported EU and NATO cooperation; positioned Finland firmly in European institutions.', 'range', 1994, 2000, '#10b981'),
  ('a0000000-0000-0000-0000-000000000294', 'Activities', 'Kosovo independence mediation', 'Led the UN-backed negotiations that resulted in Kosovo''s declaration of independence in 2008 — one of the most complex post-Yugoslav diplomatic challenges.', 'range', 2005, 2008, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000294', 'Activities', 'Nobel Peace Prize', 'Awarded the Nobel Peace Prize in 2008 for his decades of efforts to resolve international conflicts including Namibia, Kosovo, and Aceh.', 'point', 2008, null, '#f59e0b'),

  -- Sanna Marin (295)
  ('a0000000-0000-0000-0000-000000000295', 'Place & Travel', 'Born in Helsinki', 'Born on 16 November 1985 in Helsinki; grew up in a working-class family in Pirkkala; first in her family to attend university.', 'point', 1985, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000295', 'Work & Education', 'Rise in Social Democrats', 'Became chair of the Tampere City Council in 2013; elected to the Finnish parliament in 2015; served as Transport and Communications Minister 2019.', 'range', 2012, 2019, '#10b981'),
  ('a0000000-0000-0000-0000-000000000295', 'Work & Education', 'Became Prime Minister', 'Became Prime Minister of Finland on 10 December 2019 at age 34, making her the world''s youngest sitting head of government at the time.', 'point', 2019, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000295', 'Activities', 'Led Finland''s NATO application', 'Led Finland''s historic decision to apply for NATO membership in May 2022 following Russia''s full-scale invasion of Ukraine; a dramatic reversal of Finland''s long-standing neutrality.', 'point', 2022, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000295', 'Work & Education', 'Lost 2023 election', 'Lost the April 2023 election to the conservative National Coalition Party; subsequently joined the Tony Blair Institute as a Senior Adviser on democracy and inequality.', 'point', 2023, null, '#10b981'),

  -- Tarja Halonen (296)
  ('a0000000-0000-0000-0000-000000000296', 'Place & Travel', 'Born in Helsinki', 'Born on 24 December 1943 in Helsinki; studied law at Helsinki University; worked as a social worker before entering politics.', 'point', 1943, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000296', 'Work & Education', 'Social Democratic politician', 'Served as MP from 1979, and in various cabinet roles including Minister for Social Affairs and Health, Nordic Cooperation, and Foreign Affairs.', 'range', 1979, 2000, '#10b981'),
  ('a0000000-0000-0000-0000-000000000296', 'Work & Education', 'President of Finland', 'Elected President of Finland in 2000 — the first woman to hold the office — and re-elected in 2006; served two terms until 2012.', 'range', 2000, 2012, '#10b981'),
  ('a0000000-0000-0000-0000-000000000296', 'Activities', 'Human rights advocacy', 'A lifelong advocate for gender equality, LGBTQ+ rights, and multilateralism; helped lead legal reform recognising same-sex partnerships in Finland.', 'range', 1980, 2026, '#f59e0b'),

  -- Alexander Stubb (297)
  ('a0000000-0000-0000-0000-000000000297', 'Place & Travel', 'Born in Helsinki', 'Born on 1 April 1968 in Helsinki; grew up in a politically engaged family; studied extensively abroad.', 'point', 1968, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000297', 'Work & Education', 'Academic and European careers', 'Earned a PhD from the London School of Economics; worked as a researcher at the College of Europe in Bruges and the European Parliament before entering Finnish politics.', 'range', 1992, 2006, '#10b981'),
  ('a0000000-0000-0000-0000-000000000297', 'Work & Education', 'Foreign Minister and PM', 'Served as Foreign Minister 2008–2011 and 2015, and as Prime Minister of Finland in 2014–2015; known for his pro-EU, Atlanticist positions and energetic communication style.', 'range', 2008, 2015, '#10b981'),
  ('a0000000-0000-0000-0000-000000000297', 'Activities', 'Triathlete', 'A committed triathlete who has completed numerous Ironman events; fitness and sport are central to his public persona and daily life.', 'range', 2000, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000297', 'Work & Education', 'President of Finland', 'Elected President of Finland in February 2024, defeating Pekka Haavisto in the second round; took office on 1 March 2024.', 'point', 2024, null, '#10b981'),

  -- Paasikivi (298)
  ('a0000000-0000-0000-0000-000000000298', 'Place & Travel', 'Born in Tampere', 'Born on 27 November 1870 in Tampere; studied law at Helsinki University; became a lawyer and bank director before entering politics.', 'point', 1870, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000298', 'Work & Education', 'Armistice negotiations', 'Represented Finland in armistice negotiations with the Soviet Union at the end of both the Winter War (1940) and the Continuation War (1944).', 'range', 1940, 1944, '#10b981'),
  ('a0000000-0000-0000-0000-000000000298', 'Work & Education', 'Prime Minister and President', 'Served as Prime Minister 1944–1946, then as President of Finland 1946–1956; architect of the cautious but sovereignty-preserving relationship with the Soviet Union.', 'range', 1944, 1956, '#10b981'),
  ('a0000000-0000-0000-0000-000000000298', 'Activities', 'Paasikivi–Kekkonen Line', 'Established the diplomatic doctrine of acknowledging Soviet security interests while maintaining Finnish independence; later continued and deepened by Kekkonen into the doctrine bearing both their names.', 'range', 1944, 1956, '#f59e0b'),

  -- Mauno Koivisto (299)
  ('a0000000-0000-0000-0000-000000000299', 'Place & Travel', 'Born in Turku', 'Born on 25 November 1923 in Turku; worked as a docker and served in the Continuation War before studying at Helsinki University.', 'point', 1923, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000299', 'Work & Education', 'Prime Minister twice', 'Served as Prime Minister of Finland in 1968–1970 and 1979–1981 before being elected President.', 'range', 1968, 1982, '#10b981'),
  ('a0000000-0000-0000-0000-000000000299', 'Work & Education', 'President 1982–1994', 'Served as President 1982–1994; more reserved than Kekkonen, he gradually opened Finland toward Western Europe, laying the groundwork for EU membership.', 'range', 1982, 1994, '#10b981'),
  ('a0000000-0000-0000-0000-000000000299', 'Activities', 'EU application', 'Submitted Finland''s application to join the European Community in 1992; Finland joined the EU in 1995 under his successor Ahtisaari.', 'point', 1992, null, '#f59e0b'),

  -- Henrik Ibsen (29a)
  ('a0000000-0000-0000-0000-00000000029a', 'Place & Travel', 'Born in Skien, Norway', 'Born on 20 March 1828 in Skien; father went bankrupt when he was eight, an experience that shaped his preoccupation with financial ruin and social hypocrisy.', 'point', 1828, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000029a', 'Work & Education', 'Early theatre career', 'Worked at the Bergen National Theatre 1851–1857; gained practical theatre experience that honed his dramatic craft.', 'range', 1851, 1857, '#10b981'),
  ('a0000000-0000-0000-0000-00000000029a', 'Place & Travel', 'Self-imposed exile in Europe', 'Left Norway in 1864 and lived in Italy and Germany for 27 years; exile freed him from Norwegian social constraints and enabled his most radical work.', 'range', 1864, 1891, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000029a', 'Work & Education', 'A Doll''s House', 'Published A Doll''s House in 1879; Nora''s slamming of the door at the play''s end became a symbol of feminist awakening across Europe.', 'point', 1879, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000029a', 'Work & Education', 'Hedda Gabler and Ghosts', 'Wrote Ghosts (1881) and Hedda Gabler (1890) — two of the most psychologically sophisticated plays ever written; caused scandal across Europe for their subject matter.', 'range', 1881, 1890, '#10b981'),
  ('a0000000-0000-0000-0000-00000000029a', 'Health', 'Died in Kristiania', 'Suffered a series of strokes from 1900; died in Kristiania (Oslo) on 23 May 1906; the world''s most-performed playwright after Shakespeare.', 'point', 1906, null, '#ef4444'),

  -- Edvard Grieg (29b)
  ('a0000000-0000-0000-0000-00000000029b', 'Place & Travel', 'Born in Bergen', 'Born on 15 June 1843 in Bergen; mother was a pianist who gave him his early musical education; sent to Leipzig Conservatory at 15.', 'point', 1843, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000029b', 'Work & Education', 'Piano Concerto in A minor', 'Composed his only piano concerto in 1868; it became one of the most popular in the repertoire and remains his most internationally recognised work.', 'point', 1868, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000029b', 'Work & Education', 'Peer Gynt suites', 'Composed the incidental music for Henrik Ibsen''s Peer Gynt in 1875; the two orchestral suites drawn from it, including In the Hall of the Mountain King, are among the most recognised pieces of classical music.', 'point', 1875, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000029b', 'Place & Travel', 'Troldhaugen — composer''s home', 'Built his home Troldhaugen (Hill of Trolls) near Bergen in 1885; spent summers there composing; now a museum.', 'range', 1885, 1907, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000029b', 'Activities', 'Norwegian national identity', 'Championed Norwegian folk music and language at a time when Norway sought independence from Sweden; his music became synonymous with Norwegian identity.', 'range', 1864, 1907, '#f59e0b'),

  -- Edvard Munch (29c)
  ('a0000000-0000-0000-0000-00000000029c', 'Place & Travel', 'Born in Ådalsbruk, Norway', 'Born on 12 December 1863 in Ådalsbruk; childhood marked by his mother''s death from tuberculosis when he was five and his sister''s death from the same disease at 15.', 'point', 1863, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000029c', 'Work & Education', 'Studies in Kristiania and Paris', 'Studied art in Kristiania (Oslo) and made formative visits to Paris in the late 1880s; influenced by Impressionism and Post-Impressionism.', 'range', 1880, 1892, '#10b981'),
  ('a0000000-0000-0000-0000-00000000029c', 'Work & Education', 'The Frieze of Life', 'Developed his major thematic series The Frieze of Life — exploring love, anxiety, and death — throughout the 1890s; included The Scream and Madonna.', 'range', 1893, 1902, '#10b981'),
  ('a0000000-0000-0000-0000-00000000029c', 'Work & Education', 'The Scream', 'Created the iconic The Scream in 1893; the figure''s open-mouthed, anguished cry against a blood-red sky became one of the most reproduced images in art history.', 'point', 1893, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000029c', 'Health', 'Breakdown and recovery', 'Suffered a severe psychological breakdown in 1908 and was hospitalised for eight months; recovered and entered a calmer, more productive period.', 'range', 1908, 1909, '#ef4444'),
  ('a0000000-0000-0000-0000-00000000029c', 'Place & Travel', 'Died at Ekely', 'Spent his final decades at his Ekely estate near Oslo; died on 23 January 1944; bequeathed all remaining works to the City of Oslo.', 'point', 1944, null, '#3b82f6'),

  -- Fridtjof Nansen (29d)
  ('a0000000-0000-0000-0000-00000000029d', 'Place & Travel', 'Born near Kristiania', 'Born on 10 October 1861 near Kristiania (Oslo); an outstanding skier and skater from childhood; studied zoology at the Royal Frederick University.', 'point', 1861, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000029d', 'Activities', 'Crossed Greenland on skis', 'Led the first crossing of the Greenland ice sheet in 1888 — a 500-km ski traverse — making an international name for himself at age 27.', 'point', 1888, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000029d', 'Activities', 'Polar expedition — farthest north', 'Led the Fram expedition 1893–1896; his attempt to reach the North Pole brought him to 86°14''N — the farthest north any human had reached at the time.', 'range', 1893, 1896, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000029d', 'Work & Education', 'Norwegian independence diplomat', 'Served as Norway''s first Ambassador to London 1906–1908 following the dissolution of the union with Sweden; a crucial role in establishing Norway internationally.', 'range', 1906, 1908, '#10b981'),
  ('a0000000-0000-0000-0000-00000000029d', 'Activities', 'Nansen passport and Nobel Prize', 'As League of Nations High Commissioner for Refugees, created the Nansen passport — an internationally recognised identity document for stateless refugees; awarded the Nobel Peace Prize in 1922.', 'range', 1920, 1922, '#f59e0b'),

  -- Roald Amundsen (29e)
  ('a0000000-0000-0000-0000-00000000029e', 'Place & Travel', 'Born in Borge, Norway', 'Born on 16 July 1872 in Borge; dreamed of polar exploration from childhood inspired by John Franklin''s doomed Arctic expedition.', 'point', 1872, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000029e', 'Activities', 'Northwest Passage navigation', 'Navigated the Northwest Passage 1903–1906 in the small ship Gjøa — the first successful navigation of the fabled Arctic route connecting the Atlantic and Pacific.', 'range', 1903, 1906, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000029e', 'Activities', 'First to reach South Pole', 'Led the Fram expedition team to the South Pole on 14 December 1911 — 33 days before Robert Falcon Scott''s ill-fated British party; all five Amundsen team members survived; Scott''s entire party perished.', 'point', 1911, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000029e', 'Activities', 'First polar airship crossing', 'Crossed the North Pole in the airship Norge in 1926 with Umberto Nobile and Lincoln Ellsworth — the first verified overflight of the North Pole.', 'point', 1926, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000029e', 'Health', 'Disappeared in Arctic rescue', 'Disappeared on 18 June 1928 while flying a rescue mission for survivors of the crashed airship Italia near Svalbard; wreckage was found months later; body never recovered.', 'point', 1928, null, '#ef4444'),

  -- Thor Heyerdahl (29f)
  ('a0000000-0000-0000-0000-00000000029f', 'Place & Travel', 'Born in Larvik, Norway', 'Born on 6 October 1914 in Larvik; studied zoology and geography at the University of Oslo; moved to Polynesia in the 1930s to study the indigenous population.', 'point', 1914, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000029f', 'Activities', 'Kon-Tiki expedition', 'Sailed the balsa raft Kon-Tiki from Peru to Polynesia in 1947, covering 8,000 km in 101 days, to demonstrate that pre-Columbian South Americans could have settled the Pacific islands.', 'point', 1947, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000029f', 'Items', 'Kon-Tiki book and film', 'The book Kon-Tiki (1948) became a worldwide bestseller; the documentary film won the Academy Award for Best Documentary in 1951.', 'point', 1948, null, '#64748b'),
  ('a0000000-0000-0000-0000-00000000029f', 'Activities', 'Ra and Ra II expeditions', 'Built papyrus reed boats Ra and Ra II and attempted to cross the Atlantic in 1969–1970 to demonstrate ancient Egyptians could have reached the Americas.', 'range', 1969, 1970, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000029f', 'Activities', 'Easter Island and Tigris expeditions', 'Conducted archaeological work on Easter Island and sailed the reed boat Tigris across the Indian Ocean in 1977–1978 to study ancient maritime trade routes.', 'range', 1955, 1978, '#f59e0b'),

  -- Knut Hamsun (2a0)
  ('a0000000-0000-0000-0000-0000000002a0', 'Work & Education', 'Hunger — breakthrough novel', 'Published Hunger in 1890; the stream-of-consciousness portrayal of a starving writer in Kristiania was revolutionary and influenced Kafka, Hemingway, and Kafka.', 'point', 1890, null, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002a0', 'Work & Education', 'Nobel Prize in Literature', 'Awarded the Nobel Prize in Literature in 1920 for the epic Growth of the Soil (1917), a novel celebrating the Norwegian rural life he romanticised.', 'point', 1920, null, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002a0', 'Activities', 'Nazi collaboration — disgraced', 'An open admirer of Hitler and Nazi Germany, he supported the German occupation of Norway and met Hitler in person in 1943; convicted of treason after the war, fined and stripped of assets.', 'range', 1940, 1945, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002a0', 'Items', 'On Overgrown Paths', 'Wrote On Overgrown Paths (1949) at age 89 defending his wartime conduct; despite its literary power it did little to rehabilitate his reputation.', 'point', 1949, null, '#64748b'),

  -- Sigrid Undset (2a1)
  ('a0000000-0000-0000-0000-0000000002a1', 'Work & Education', 'Kristin Lavransdatter', 'Published the medieval trilogy Kristin Lavransdatter 1920–1922; the richly detailed portrait of a 14th-century Norwegian woman is considered among the greatest historical novels ever written.', 'range', 1920, 1922, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002a1', 'Work & Education', 'Nobel Prize in Literature', 'Awarded the Nobel Prize in Literature in 1928 primarily for Kristin Lavransdatter; one of the very few women to have won the prize at that time.', 'point', 1928, null, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002a1', 'Activities', 'Converted to Catholicism', 'Converted to Roman Catholicism in 1924; her faith deeply influenced her later writing and her moral clarity in opposing Nazism.', 'point', 1924, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002a1', 'Place & Travel', 'Fled Norway during Nazi invasion', 'Fled Norway by skiing across the border to Sweden in April 1940 after the German invasion; her son was killed defending Norway; eventually reached the USA.', 'point', 1940, null, '#3b82f6'),

  -- Magnus Carlsen (2a2)
  ('a0000000-0000-0000-0000-0000000002a2', 'Place & Travel', 'Born in Tønsberg, Norway', 'Born on 30 November 1990 in Tønsberg; showed extraordinary chess ability from age eight; learned the game aged four.', 'point', 1990, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002a2', 'Work & Education', 'Became grandmaster at 13', 'Earned the grandmaster title in April 2004 at age 13 years, 4 months, and 27 days — one of the youngest ever at the time.', 'point', 2004, null, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002a2', 'Work & Education', 'World Chess Champion', 'Won the World Chess Championship in 2013 beating Viswanathan Anand; defended the title in 2014, 2016, 2018, and 2021; held the championship for a decade.', 'range', 2013, 2023, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002a2', 'Activities', 'Highest FIDE rating in history', 'Achieved a peak FIDE rating of 2882 in 2014 — the highest in history; dominated chess across classical, rapid, and blitz formats simultaneously.', 'point', 2014, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002a2', 'Work & Education', 'Play Magnus and chess.com', 'Co-founded Play Magnus and invested in chess.com; helped drive the global chess boom sparked by the Netflix show The Queen''s Gambit.', 'range', 2013, 2026, '#10b981'),

  -- Sonja Henie (2a3)
  ('a0000000-0000-0000-0000-0000000002a3', 'Place & Travel', 'Born in Kristiania (Oslo)', 'Born on 8 April 1912 in Kristiania (now Oslo) to a wealthy fur-trading family; began skating at age six.', 'point', 1912, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002a3', 'Activities', 'Three Olympic gold medals', 'Won gold medals at the 1928 St. Moritz, 1932 Lake Placid, and 1936 Garmisch-Partenkirchen Winter Olympics — the only figure skater to win at three consecutive Games.', 'range', 1928, 1936, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002a3', 'Activities', 'Ten consecutive world titles', 'Won the World Figure Skating Championship every year from 1927 to 1936 — ten consecutive world titles; her short skirt and ballet-influenced style revolutionised the sport.', 'range', 1927, 1936, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002a3', 'Work & Education', 'Hollywood career', 'Turned professional and moved to Hollywood; starred in 11 Twentieth Century Fox films in the late 1930s and 1940s; became one of Hollywood''s highest-earning stars.', 'range', 1936, 1950, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002a3', 'Health', 'Died of leukaemia', 'Died on 12 October 1969 of leukaemia aboard a plane en route from Paris to Oslo; her estate was eventually left to Norwegian art institutions.', 'point', 1969, null, '#ef4444'),

  -- Jens Stoltenberg (2a4)
  ('a0000000-0000-0000-0000-0000000002a4', 'Place & Travel', 'Born in Oslo', 'Born on 16 March 1959 in Oslo; son of Thorvald Stoltenberg, Norway''s Foreign Minister; grew up in a politically engaged household.', 'point', 1959, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002a4', 'Work & Education', 'Norwegian Prime Minister', 'Served as Prime Minister of Norway 2000–2001 and again 2005–2013; led Norway through the 2011 terrorist attacks perpetrated by Anders Breivik.', 'range', 2000, 2013, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002a4', 'Activities', '22 July terrorist attacks', 'Led Norway''s response to the 22 July 2011 attacks in which 77 people were killed by right-wing extremist Anders Breivik; kept Norway open and democratic.', 'point', 2011, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002a4', 'Work & Education', 'NATO Secretary General', 'Served as NATO Secretary General 2014–2024 — extended twice due to crises; oversaw NATO''s largest expansion and the Alliance''s response to Russia''s invasion of Ukraine.', 'range', 2014, 2024, '#10b981'),

  -- Erna Solberg (2a5)
  ('a0000000-0000-0000-0000-0000000002a5', 'Place & Travel', 'Born in Bergen', 'Born on 24 February 1961 in Bergen; studied sociology and statistics at the University of Bergen; known from childhood for tenacity — her nickname "Iron Erna" was given in admiration.', 'point', 1961, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002a5', 'Work & Education', 'Rise in Conservative Party', 'Became leader of the Norwegian Conservative Party (Høyre) in 2004; rebuilt it from opposition to election victory.', 'range', 2004, 2013, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002a5', 'Work & Education', 'Prime Minister 2013–2021', 'Served as Prime Minister of Norway 2013–2021; led four consecutive coalition governments spanning eight years; second woman to hold the office.', 'range', 2013, 2021, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002a5', 'Activities', 'Digital and immigration reform', 'Known for significant investment in digitisation of public services and controversial tightening of Norway''s immigration policy; combined progressive economic with firm immigration positions.', 'range', 2013, 2021, '#f59e0b'),

  -- Gro Harlem Brundtland (2a6)
  ('a0000000-0000-0000-0000-0000000002a6', 'Place & Travel', 'Born in Oslo', 'Born on 20 April 1939 in Oslo; father was a Labour politician and doctor; studied medicine at Oslo and Harvard.', 'point', 1939, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002a6', 'Work & Education', 'First female Prime Minister of Norway', 'Became Norway''s first female Prime Minister in February 1981; went on to serve three terms as PM (1981, 1986–1989, 1990–1996).', 'range', 1981, 1996, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002a6', 'Activities', 'Brundtland Report on sustainability', 'Chaired the UN World Commission on Environment and Development 1983–1987; produced the landmark Our Common Future report, introducing the concept of sustainable development to global policy.', 'range', 1983, 1987, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002a6', 'Work & Education', 'WHO Director-General', 'Served as Director-General of the World Health Organization 1998–2003; oversaw major tobacco control initiatives and the global response to SARS.', 'range', 1998, 2003, '#10b981'),

  -- Roald Dahl (2a7)
  ('a0000000-0000-0000-0000-0000000002a7', 'Place & Travel', 'Born in Llandaff, Wales', 'Born on 13 September 1916 in Llandaff, Wales to Norwegian parents; spent summers in Norway; retained a deep connection to his Norwegian heritage.', 'point', 1916, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002a7', 'Work & Education', 'RAF fighter pilot', 'Flew Hawker Hurricanes as a pilot for the Royal Air Force in World War II; shot down over Libya in 1940 and suffered serious injuries; his wartime stories became his first published pieces.', 'range', 1940, 1942, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002a7', 'Work & Education', 'James and the Giant Peach and Charlie', 'Published James and the Giant Peach (1961) and Charlie and the Chocolate Factory (1964) — both became perennial children''s classics adapted for stage and film worldwide.', 'range', 1961, 1964, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002a7', 'Work & Education', 'Matilda and The BFG', 'Wrote The BFG (1982) and Matilda (1988) — two of the bestselling children''s books of the century; Matilda the Musical became a global phenomenon.', 'range', 1982, 1988, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002a7', 'Items', 'Adult macabre short stories', 'Wrote masterfully dark adult short stories including Tales of the Unexpected; widely admired as one of the great short-story writers of the 20th century.', 'range', 1948, 1980, '#64748b'),
  ('a0000000-0000-0000-0000-0000000002a7', 'Health', 'Died in Great Missenden', 'Died on 23 November 1990 in Great Missenden, Buckinghamshire where he lived; his home Gipsy House is a place of literary pilgrimage.', 'point', 1990, null, '#ef4444'),

  -- King Harald V (2a8)
  ('a0000000-0000-0000-0000-0000000002a8', 'Place & Travel', 'Born at Skaugum', 'Born on 21 February 1937 at Skaugum estate; spent World War II in exile in the United States with his mother and siblings while his father Crown Prince Olav and grandfather King Haakon VII remained in Britain.', 'point', 1937, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002a8', 'Activities', 'Olympic sailor', 'Competed in sailing at three Olympic Games — 1964 (Tokyo), 1968 (Mexico City), and 1972 (Munich) — representing Norway in the Dragon class.', 'range', 1964, 1972, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002a8', 'Relations & Family', 'Married commoner Sonja Haraldsen', 'Married Sonja Haraldsen — a commoner — in 1968 after a nine-year courtship that required the King''s consent; a turning point for the Norwegian monarchy''s relationship with society.', 'point', 1968, null, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000002a8', 'Work & Education', 'Became King of Norway', 'Ascended to the throne on 17 January 1991 following the death of King Olav V; his coronation included a unique ceremony of anointing at Nidaros Cathedral.', 'point', 1991, null, '#10b981'),

  -- Hans Christian Andersen (2a9)
  ('a0000000-0000-0000-0000-0000000002a9', 'Place & Travel', 'Born in Odense, Denmark', 'Born on 2 April 1805 in Odense; son of a poor shoemaker; father died when Hans Christian was 11; grew up in poverty but dreamed of becoming an artist.', 'point', 1805, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002a9', 'Place & Travel', 'Moved to Copenhagen', 'Moved alone to Copenhagen at age 14 to pursue a theatrical career; lived in poverty for years before finding support from the Royal Theatre and philanthropists.', 'point', 1819, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002a9', 'Work & Education', 'First fairy tale collections', 'Published his first fairy tales in 1835 — including The Tinderbox and The Princess and the Pea — initially regarded as trivial; eventually recognised as his greatest contribution.', 'point', 1835, null, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002a9', 'Work & Education', 'The Little Mermaid and The Snow Queen', 'Published The Little Mermaid (1837) and The Snow Queen (1844) — two of the most beloved and widely adapted fairy tales in world literature.', 'range', 1837, 1844, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002a9', 'Place & Travel', 'Extensive European travels', 'Travelled widely across Europe meeting Dickens, Dumas, Liszt, Mendelssohn, and Heine; a celebrated figure in literary salons from London to Rome.', 'range', 1833, 1873, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002a9', 'Health', 'Died in Copenhagen', 'Died on 4 August 1875 in Copenhagen; his birthday 2 April is now International Children''s Book Day; his tales have been translated into over 125 languages.', 'point', 1875, null, '#ef4444'),

  -- Søren Kierkegaard (2aa)
  ('a0000000-0000-0000-0000-0000000002aa', 'Place & Travel', 'Born in Copenhagen', 'Born on 5 May 1813 in Copenhagen; youngest of seven children; father''s profound Lutheran guilt shaped Kierkegaard''s preoccupation with sin, faith, and anxiety.', 'point', 1813, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002aa', 'Work & Education', 'University studies in Copenhagen', 'Studied theology and philosophy at the University of Copenhagen 1830–1841; completed his dissertation On the Concept of Irony in 1841.', 'range', 1830, 1841, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002aa', 'Work & Education', 'Either/Or and the pseudonymous works', 'Published Either/Or in 1843 under a pseudonym — the first of many pseudonymous works exploring different worldviews; the aesthetic, ethical, and religious stages of existence.', 'point', 1843, null, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002aa', 'Work & Education', 'The Concept of Anxiety and Sickness unto Death', 'Published major philosophical works including The Concept of Anxiety (1844) and The Sickness Unto Death (1849); introduced anxiety as a philosophical concept that influenced Heidegger and Sartre.', 'range', 1844, 1849, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002aa', 'Health', 'Died young in Copenhagen', 'Collapsed on the street in October 1855 and died on 11 November 1855 aged 42; his entire philosophical output was produced in just 14 years.', 'point', 1855, null, '#ef4444'),

  -- Niels Bohr (2ab)
  ('a0000000-0000-0000-0000-0000000002ab', 'Place & Travel', 'Born in Copenhagen', 'Born on 7 October 1885 in Copenhagen; his father was a physiology professor and his mother came from a wealthy Jewish-Danish family.', 'point', 1885, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002ab', 'Work & Education', 'Bohr model of the atom', 'In 1913 proposed the Bohr model of the atom — electrons orbiting a nucleus in fixed shells — reconciling Rutherford''s nuclear model with quantum theory.', 'point', 1913, null, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002ab', 'Work & Education', 'Nobel Prize in Physics', 'Awarded the Nobel Prize in Physics in 1922 for his atomic model and contributions to quantum theory.', 'point', 1922, null, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002ab', 'Work & Education', 'Copenhagen Institute for Theoretical Physics', 'Founded and led the Institute for Theoretical Physics in Copenhagen from 1920; it became the world''s leading centre for quantum mechanics, attracting Heisenberg, Pauli, and Dirac.', 'range', 1920, 1962, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002ab', 'Place & Travel', 'Escaped Nazi-occupied Denmark', 'Escaped to Sweden in a fishing boat in 1943 as the Nazis prepared to arrest Denmark''s Jews; flown to Britain in a Mosquito aircraft and then sent to Los Alamos for the Manhattan Project.', 'point', 1943, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002ab', 'Activities', 'Complementarity principle', 'Developed the principle of complementarity — that quantum entities exhibit wave or particle properties depending on observation conditions — a cornerstone of the Copenhagen interpretation of quantum mechanics.', 'range', 1927, 1935, '#f59e0b'),

  -- Karen Blixen (2ac)
  ('a0000000-0000-0000-0000-0000000002ac', 'Place & Travel', 'Born in Rungsted, Denmark', 'Born on 17 April 1885 in Rungsted; father was an explorer and soldier; she began writing as a child.', 'point', 1885, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002ac', 'Place & Travel', 'Kenya coffee farm', 'Moved to British East Africa (Kenya) in 1914 with her husband Baron Bror Blixen-Finecke to run a coffee farm at the foot of the Ngong Hills; remained in Kenya until 1931.', 'range', 1914, 1931, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002ac', 'Work & Education', 'Seven Gothic Tales', 'Published Seven Gothic Tales under the pen name Isak Dinesen in 1934; the baroque, sensuous stories were an American bestseller.', 'point', 1934, null, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002ac', 'Work & Education', 'Out of Africa', 'Published Out of Africa in 1937; her memoir of Kenya was praised for its lyrical prose and became one of the great books about colonial Africa; adapted into an Oscar-winning film in 1985.', 'point', 1937, null, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002ac', 'Health', 'Died of malnutrition', 'Died on 7 September 1962 in Rungsted at the age of 77; suffered from severe syphilis-related nerve damage for decades and was severely underweight in her final years.', 'point', 1962, null, '#ef4444'),

  -- Tycho Brahe (2ad)
  ('a0000000-0000-0000-0000-0000000002ad', 'Place & Travel', 'Born in Knudstrup, Scania', 'Born on 14 December 1546 in Knudstrup, Scania (then Denmark, now Sweden); kidnapped and raised by a wealthy uncle as a child after a family dispute.', 'point', 1546, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002ad', 'Activities', 'Lost nose in duel', 'Lost part of his nose in a duel with a fellow Danish nobleman in 1566; wore a prosthetic nose for the rest of his life, allegedly made of brass or silver.', 'point', 1566, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002ad', 'Work & Education', 'Uraniborg observatory on Hven', 'Built the magnificent Uraniborg observatory on the island of Hven (granted by King Frederick II) from 1576; made the most precise pre-telescopic stellar observations in history.', 'range', 1576, 1597, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002ad', 'Work & Education', 'Catalogued over 1000 stars', 'Catalogued over 1,000 stars with unprecedented precision; his data on Mars was used by Kepler to derive the laws of planetary motion.', 'range', 1576, 1601, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002ad', 'Place & Travel', 'Moved to Prague', 'Fell out with the Danish court and moved to Prague in 1597 as Imperial Mathematician to Emperor Rudolf II; Kepler joined him there.', 'range', 1599, 1601, '#3b82f6'),

  -- Lars von Trier (2ae)
  ('a0000000-0000-0000-0000-0000000002ae', 'Place & Travel', 'Born in Copenhagen', 'Born Lars Trier on 30 April 1956 in Copenhagen; added "von" to his name as a film student in homage to European art cinema.', 'point', 1956, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002ae', 'Work & Education', 'Dogme 95 manifesto', 'Co-founded the Dogme 95 movement in 1995 with Thomas Vinterberg; the manifesto demanded films be shot with natural light and sound, no props, on location — a reaction against Hollywood artifice.', 'point', 1995, null, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002ae', 'Work & Education', 'Breaking the Waves and Dancer in the Dark', 'Directed Breaking the Waves (1996), winning the Cannes Grand Prix, and Dancer in the Dark (2000) winning the Palme d''Or and Best Actress for Björk; two of the most acclaimed European films of the decade.', 'range', 1996, 2000, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002ae', 'Work & Education', 'Melancholia and later works', 'Directed Melancholia (2011), The House That Jack Built (2018), and The Kingdom Exodus (2022); consistently provocative, technically innovative, and commercially controversial.', 'range', 2011, 2022, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002ae', 'Health', 'Struggled with depression', 'Has spoken publicly about severe depression and anxiety that have at times paralysed his ability to work; mental illness is a recurring theme in his films.', 'range', 2000, 2026, '#ef4444'),

  -- Mette Frederiksen (2af)
  ('a0000000-0000-0000-0000-0000000002af', 'Place & Travel', 'Born in Copenhagen', 'Born on 19 November 1977 in Copenhagen; grew up in a working-class family in Nørrebro; involved in the Social Democratic youth organisation from her teens.', 'point', 1977, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002af', 'Work & Education', 'Youngest female MP in Denmark', 'Elected to the Folketing at age 24 in 2001, becoming one of the youngest members of parliament; rose steadily through the Social Democrats.', 'point', 2001, null, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002af', 'Work & Education', 'Prime Minister of Denmark', 'Became Prime Minister of Denmark in June 2019, leading a minority Social Democratic government; re-elected in 2022.', 'range', 2019, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002af', 'Activities', 'COVID-19 response and mink cull', 'Navigated Denmark through the COVID-19 pandemic; ordered the controversial cull of all 17 million Danish mink in 2020 over virus mutation fears — later found to have lacked legal basis.', 'range', 2020, 2021, '#f59e0b'),

  -- Queen Margrethe II (2b0)
  ('a0000000-0000-0000-0000-0000000002b0', 'Place & Travel', 'Born in Copenhagen', 'Born on 16 April 1940 in Amalienborg Palace, Copenhagen; the eldest daughter of King Frederik IX and Queen Ingrid.', 'point', 1940, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002b0', 'Work & Education', 'Became Queen of Denmark', 'Acceded to the Danish throne on 14 January 1972 following the death of her father Frederik IX; the first queen regnant of Denmark since Queen Margrethe I in the 14th century.', 'point', 1972, null, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002b0', 'Activities', 'Painter, illustrator, and author', 'A accomplished artist who has illustrated books (including The Lord of the Rings under a pseudonym), designed theatrical sets and costumes, painted watercolours exhibited internationally, and translated French literature into Danish.', 'range', 1960, 2024, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002b0', 'Relations & Family', 'Married Henri de Laborde de Monpezat', 'Married French diplomat Henri de Laborde de Monpezat (Prince Henrik) in 1967; he died in 2018.', 'range', 1967, 2018, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000002b0', 'Work & Education', 'Abdicated on New Year''s Day', 'Announced in December 2023 that she would abdicate on 14 January 2024 — the anniversary of her accession — after 52 years on the throne; handed power to her son Frederik X.', 'point', 2024, null, '#10b981'),

  -- Ole Rømer (2b1)
  ('a0000000-0000-0000-0000-0000000002b1', 'Place & Travel', 'Born in Aarhus, Denmark', 'Born on 25 September 1644 in Aarhus; studied at the University of Copenhagen under Rasmus Bartholin who commissioned him to edit Tycho Brahe''s astronomical observations.', 'point', 1644, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002b1', 'Place & Travel', 'Worked at Paris Observatory', 'Moved to Paris in 1672 to work at the Paris Observatory under Giovanni Cassini; made the observations that led to his measurement of the speed of light.', 'range', 1672, 1681, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002b1', 'Work & Education', 'First measurement of speed of light', 'In 1676 announced that variations in the observed timing of Io''s eclipses proved light travels at a finite speed; his estimate was within 25% of the true value — a remarkable achievement with 17th-century instruments.', 'point', 1676, null, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002b1', 'Work & Education', 'Astronomer Royal of Denmark', 'Served as Astronomer Royal and head of the Copenhagen Observatory; reformed weights and measures, the calendar, and street lighting in Copenhagen.', 'range', 1681, 1710, '#10b981'),

  -- Victor Borge (2b2)
  ('a0000000-0000-0000-0000-0000000002b2', 'Place & Travel', 'Born in Copenhagen', 'Born Børge Rosenbaum on 3 January 1909 in Copenhagen to a Jewish family of musicians; showed piano prodigy-level talent from early childhood.', 'point', 1909, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002b2', 'Work & Education', 'Piano studies in Copenhagen and Vienna', 'Studied piano at the Royal Danish Academy of Music and in Vienna; gave his professional debut as a concert pianist at age nine.', 'range', 1916, 1930, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002b2', 'Place & Travel', 'Fled Nazi occupation to USA', 'His anti-Nazi satire made him a Gestapo target; fled Denmark during the German invasion in 1940, eventually reaching the United States on the last passenger ship to leave Finland.', 'point', 1940, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002b2', 'Work & Education', 'American comedy career', 'Appeared on American radio and television, blending slapstick with classical piano; his one-man Broadway show Comedy in Music (1953–1956) ran 849 performances — still a record for a solo show.', 'range', 1941, 2000, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002b2', 'Health', 'Died in Greenwich, Connecticut', 'Died on 23 December 2000 in Greenwich, Connecticut; the Danish-American entertainer who made millions laugh at classical music.', 'point', 2000, null, '#ef4444'),

  -- Viggo Mortensen (2b3)
  ('a0000000-0000-0000-0000-0000000002b3', 'Place & Travel', 'Born in New York City', 'Born on 20 October 1958 in New York City to a Danish father and American mother; grew up in Argentina and various US states before moving to Denmark as a teenager.', 'point', 1958, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002b3', 'Work & Education', 'Lord of the Rings — Aragorn', 'Cast last-minute as Aragorn in Peter Jackson''s Lord of the Rings trilogy (2001–2003); his powerful, layered performance made him an international star.', 'range', 2001, 2003, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002b3', 'Work & Education', 'A History of Violence and Eastern Promises', 'Won critical acclaim for A History of Violence (2005) and Eastern Promises (2007), both directed by David Cronenberg; earned an Academy Award nomination for the latter.', 'range', 2005, 2007, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002b3', 'Activities', 'Poet, painter, and photographer', 'A prolific and serious visual artist, poet, and photographer; has published multiple books of photography and poetry under his own Perceval Press imprint.', 'range', 1990, 2026, '#f59e0b'),

  -- King Frederik X (2b4)
  ('a0000000-0000-0000-0000-0000000002b4', 'Place & Travel', 'Born in Copenhagen', 'Born on 26 May 1968 in Copenhagen; son of Queen Margrethe II and Prince Henrik; the Crown Prince from birth.', 'point', 1968, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002b4', 'Work & Education', 'Military and naval career', 'Served in the Danish Army and Navy Special Forces; graduated from the Royal Danish Naval Academy; has completed SAS and Sirius Dog Sled Patrol arctic training.', 'range', 1987, 1995, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002b4', 'Activities', 'Olympic sailing', 'Competed in sailing at the 1996 Atlanta Olympics representing Denmark in the Yngling class.', 'point', 1996, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002b4', 'Relations & Family', 'Married Mary Donaldson', 'Married Australian lawyer Mary Donaldson — whom he met during the Sydney 2000 Olympics — at a grand ceremony in Copenhagen on 14 May 2004.', 'point', 2004, null, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000002b4', 'Work & Education', 'Became King of Denmark', 'Became King Frederik X of Denmark on 14 January 2024 when his mother Queen Margrethe II abdicated; the 53rd monarch of the Kingdom of Denmark.', 'point', 2024, null, '#10b981'),

  -- Björk (2b5)
  ('a0000000-0000-0000-0000-0000000002b5', 'Place & Travel', 'Born in Reykjavík', 'Born Björk Guðmundsdóttir on 21 November 1965 in Reykjavík; recorded her first album aged 11; attended the Reykjavík School of Music.', 'point', 1965, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002b5', 'Work & Education', 'The Sugarcubes and Debut', 'Fronted the alternative band The Sugarcubes 1986–1992 before going solo; her debut album Debut (1993) was a worldwide sensation blending pop, electronica, and jazz.', 'range', 1986, 1993, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002b5', 'Work & Education', 'Dancer in the Dark', 'Starred in and composed the soundtrack for Lars von Trier''s Dancer in the Dark (2000), winning Best Actress at Cannes; the film was polarising but her performance universally acclaimed.', 'point', 2000, null, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002b5', 'Activities', 'Avant-garde artistic identity', 'Known for radical artistic choices including extraordinary stage costumes, multimedia installations, and albums that refuse genre classification; considered one of music''s most adventurous artists.', 'range', 1993, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002b5', 'Work & Education', 'Vulnicura and Utopia', 'Released Vulnicura (2015) — a raw account of a relationship breakdown — and Utopia (2017); both considered among the most ambitious records of their era.', 'range', 2015, 2017, '#10b981'),

  -- Halldór Laxness (2b6)
  ('a0000000-0000-0000-0000-0000000002b6', 'Place & Travel', 'Born in Reykjavík', 'Born Halldór Guðjónsson on 23 April 1902 in Reykjavík; grew up on his family farm at Laxnes in Mosfellssveit.', 'point', 1902, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002b6', 'Place & Travel', 'Travels and conversion to Catholicism', 'Travelled across Europe in the 1920s; converted to Catholicism in 1923 but later moved toward socialism and communism.', 'range', 1920, 1930, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002b6', 'Work & Education', 'Independent People', 'Published Independent People 1934–1935; the epic of Icelandic rural stubbornness is widely considered his masterpiece and one of the great novels of the 20th century.', 'range', 1934, 1935, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002b6', 'Work & Education', 'Nobel Prize in Literature', 'Awarded the Nobel Prize in Literature in 1955; the first Icelander to win a Nobel Prize.', 'point', 1955, null, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002b6', 'Activities', 'Icelandic language and culture', 'A passionate defender of the Icelandic language against foreign influence; his writing helped establish a modern Icelandic literary language.', 'range', 1930, 1998, '#f59e0b'),

  -- Vigdís Finnbogadóttir (2b7)
  ('a0000000-0000-0000-0000-0000000002b7', 'Place & Travel', 'Born in Reykjavík', 'Born on 15 April 1930 in Reykjavík; studied French language and literature in Denmark and France; worked as a theatre director and French teacher.', 'point', 1930, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002b7', 'Work & Education', 'Reykjavík Theatre Company', 'Directed the Reykjavík Theatre Company 1972–1980; helped establish theatre as an important cultural institution in Iceland.', 'range', 1972, 1980, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002b7', 'Work & Education', 'First elected female president in the world', 'Elected President of Iceland in 1980 — the world''s first democratically elected female head of state; won by a narrow margin and went on to serve four terms.', 'range', 1980, 1996, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002b7', 'Activities', 'Champion of Icelandic culture and language', 'Used the presidency to champion Icelandic language, culture, and arts; advocated for small nations'' cultural independence in the face of globalisation.', 'range', 1980, 2026, '#f59e0b'),

  -- Leif Erikson (2b8)
  ('a0000000-0000-0000-0000-0000000002b8', 'Place & Travel', 'Born in Iceland', 'Born around 970 in Iceland; son of Erik the Red who founded the Norse settlement in Greenland; grew up in the Norse colony there.', 'point', 970, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002b8', 'Place & Travel', 'Grew up in Greenland', 'Spent his childhood and youth in Greenland''s Norse colony at Brattahlíð, founded by his father Erik the Red around 985.', 'range', 985, 1000, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002b8', 'Activities', 'First European to reach North America', 'Around the year 1000 sailed west from Greenland and reached North America — a land he called Vinland (likely in Newfoundland) — nearly 500 years before Columbus.', 'point', 1000, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002b8', 'Work & Education', 'L''Anse aux Meadows', 'His settlement at Vinland is confirmed by the archaeological site at L''Anse aux Meadows in Newfoundland, Canada, discovered in 1960; the only confirmed Norse site in North America.', 'range', 1000, 1020, '#10b981'),

  -- Jón Sigurðsson (2b9)
  ('a0000000-0000-0000-0000-0000000002b9', 'Place & Travel', 'Born in Hrafnseyri, Iceland', 'Born on 17 June 1811 in Hrafnseyri — a date later chosen as Iceland''s National Day in his honour — in the Westfjords of Iceland.', 'point', 1811, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002b9', 'Place & Travel', 'Studied and lived in Copenhagen', 'Moved to Copenhagen in 1833 to study; spent most of his adult life in Denmark as a scholar and political activist, campaigning for Icelandic rights from afar.', 'range', 1833, 1879, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002b9', 'Work & Education', 'Led Icelandic independence movement', 'Edited the journal Ný félagsrit from 1841 and led the political campaign for Icelandic home rule from Denmark; advocated the restoration of the Althing and Icelandic autonomy.', 'range', 1841, 1879, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002b9', 'Activities', 'Restoration of the Althing', 'His persistent advocacy contributed to the restoration of the Icelandic Althing as a consultative body in 1845; the first step toward self-rule.', 'point', 1845, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002b9', 'Health', 'Died in Copenhagen', 'Died on 7 December 1879 in Copenhagen; his body was returned to Iceland and he was buried at Þingvellir, the ancient parliament site; revered as the father of Icelandic independence.', 'point', 1879, null, '#ef4444'),

  -- Anders Zorn (2ba)
  ('a0000000-0000-0000-0000-0000000002ba', 'Place & Travel', 'Born in Mora, Dalarna', 'Born on 18 February 1860 in Mora, Dalarna; grew up with his grandparents; enrolled at the Royal Swedish Academy of Arts aged 15.', 'point', 1860, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002ba', 'Work & Education', 'Watercolour and international success', 'Made his name painting in watercolour; exhibited across Europe and the USA from the 1880s; his technical virtuosity — especially depicting water — was immediately recognised.', 'range', 1880, 1920, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002ba', 'Work & Education', 'Painted three US presidents', 'Painted portraits of presidents Grover Cleveland, William Howard Taft, and Theodore Roosevelt during American tours; a measure of his international standing.', 'range', 1893, 1911, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002ba', 'Assets', 'Zorn Museum and Zorngården', 'Built a grand home Zorngården in Mora and established the Zorn Museum; bequeathed both to the Swedish state; they remain major tourist attractions in Dalarna.', 'range', 1896, 1920, '#8b5cf6'),

  -- Carl Larsson (2bb)
  ('a0000000-0000-0000-0000-0000000002bb', 'Place & Travel', 'Born in Stockholm', 'Born on 28 May 1853 in the Stockholm slum of Gamla Stan; grew up in poverty; admitted to the preparatory school of the Royal Swedish Academy of Arts at age 13.', 'point', 1853, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002bb', 'Place & Travel', 'Artistic life in France and Sundborn', 'Spent formative years painting in France 1877–1885; returned to Sweden and settled in the village of Sundborn in Dalarna with his wife Karin.', 'range', 1877, 1919, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002bb', 'Work & Education', 'Lilla Hyttnäs and the home paintings', 'Turned his family home Lilla Hyttnäs into a collaborative artwork with wife Karin; his published albums of watercolours depicting their idyllic family life defined an international image of Scandinavian domesticity.', 'range', 1890, 1910, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002bb', 'Items', 'Et hem — defining Swedish interiors', 'Published the album Ett Hem (A Home) in 1899; its images of light-filled, simply furnished rooms became the template for Swedish (and later IKEA-influenced) interior design worldwide.', 'point', 1899, null, '#64748b'),
  ('a0000000-0000-0000-0000-0000000002bb', 'Relations & Family', 'Partnership with Karin Larsson', 'His wife Karin was a pioneering textile artist and designer who created the bold textiles, furniture, and décor of their home; their collaboration was foundational to Swedish arts and crafts.', 'range', 1882, 1919, '#ec4899'),

  -- Evert Taube (2bc)
  ('a0000000-0000-0000-0000-0000000002bc', 'Place & Travel', 'Born in Gothenburg', 'Born on 12 March 1890 in Gothenburg; spent years at sea as a young man, working on ships crossing the Atlantic and calling at South American ports.', 'point', 1890, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002bc', 'Work & Education', 'Troubadour career and beloved songs', 'Created a body of songs blending Swedish folk tradition with Italian canzone and Argentine tango; songs like Fritiof Anderssons visa and Carmencita are etched into Swedish cultural memory.', 'range', 1920, 1970, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002bc', 'Work & Education', 'Artist and author', 'Also an accomplished visual artist, illustrator, and author; his books and paintings complemented his musical career.', 'range', 1920, 1976, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002bc', 'Activities', 'Swedish national cultural icon', 'Regarded as Sweden''s greatest troubadour and a national cultural institution; his birthday 12 March is celebrated as a Swedish cultural day.', 'range', 1940, 1976, '#f59e0b'),

  -- Ivar Kreuger (2bd)
  ('a0000000-0000-0000-0000-0000000002bd', 'Place & Travel', 'Born in Kalmar, Sweden', 'Born on 2 March 1880 in Kalmar; trained as an engineer and worked in construction internationally before entering business.', 'point', 1880, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002bd', 'Work & Education', 'Match monopoly empire', 'Built Swedish Match into a global monopoly that by the 1920s controlled match production across dozens of countries; lent money to governments in exchange for national match monopolies.', 'range', 1917, 1932, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002bd', 'Assets', 'One of the world''s richest men', 'At his peak controlled companies in 34 countries and was considered the third-wealthiest man in the world; known for lavish personal spending despite his business''s underlying fraud.', 'range', 1920, 1932, '#8b5cf6'),
  ('a0000000-0000-0000-0000-0000000002bd', 'Health', 'Financial collapse and suicide', 'His empire unravelled in the Great Depression as the fraud became unsustainable; shot himself in Paris on 12 March 1932; the collapse ruined tens of thousands of investors and shocked the world.', 'point', 1932, null, '#ef4444'),

  -- Anita Ekberg (2be)
  ('a0000000-0000-0000-0000-0000000002be', 'Place & Travel', 'Born in Malmö', 'Born on 29 September 1931 in Malmö; moved to the United States after winning the Miss Sweden pageant in 1950.', 'point', 1931, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002be', 'Work & Education', 'Hollywood career', 'Built a Hollywood career in the 1950s appearing in films including Blood Alley and War and Peace; her striking looks made her a sex symbol.', 'range', 1952, 1960, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002be', 'Work & Education', 'La Dolce Vita — Trevi Fountain', 'Star role in Federico Fellini''s La Dolce Vita (1960); her scene wading in the Trevi Fountain became one of cinema''s most iconic images and permanently defined her legacy.', 'point', 1960, null, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002be', 'Place & Travel', 'Settled in Italy', 'Settled in Italy for most of her adult life; became a beloved figure in Italian popular culture; died in Rocca di Papa near Rome on 11 January 2015.', 'range', 1960, 2015, '#3b82f6'),

  -- Fredrika Bremer (2bf)
  ('a0000000-0000-0000-0000-0000000002bf', 'Place & Travel', 'Born in Åbo (Turku), Finland', 'Born on 17 August 1801 in Åbo (Turku), then part of Sweden; grew up near Stockholm; deeply unhappy in a restricted domestic life.', 'point', 1801, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002bf', 'Work & Education', 'Novels and feminist message', 'Published a series of popular novels including The Neighbours (1837) depicting Swedish domestic life; used fiction to argue for women''s rights to education, professional life, and independent existence.', 'range', 1830, 1865, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002bf', 'Place & Travel', 'Travels in America and Palestine', 'Undertook remarkable solo journeys to the United States (1849–1851) and to the Middle East (1858–1861); published influential travel books about both.', 'range', 1849, 1861, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002bf', 'Activities', 'Hertha — landmark feminist novel', 'Published the novel Hertha in 1856; its heroine''s struggle for independence sparked a parliamentary debate in Sweden leading to reforms giving unmarried women legal majority at age 25 rather than never.', 'point', 1856, null, '#f59e0b'),

  -- Poul Schlüter (2c0)
  ('a0000000-0000-0000-0000-0000000002c0', 'Place & Travel', 'Born in Tønder, Denmark', 'Born on 3 April 1929 in Tønder, near the German border; studied law at the University of Copenhagen.', 'point', 1929, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002c0', 'Work & Education', 'Leader of Conservative Party', 'Became chairman of the Danish Conservative People''s Party in 1974; rebuilt the party from a minor force to a leading political actor.', 'range', 1974, 1993, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002c0', 'Work & Education', 'Prime Minister of Denmark', 'Served as Prime Minister 1982–1993 — the first Conservative PM since 1901 — leading four successive coalition governments; oversaw economic stabilisation and Danish participation in EU integration.', 'range', 1982, 1993, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002c0', 'Activities', 'Danish EU presidency', 'Led Denmark''s EU Council Presidency in 1987 and 1993; a committed European who steered Danish EU policy during critical integration periods.', 'range', 1987, 1993, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002c0', 'Health', 'Died in Copenhagen', 'Died on 12 November 2021 in Copenhagen aged 92; remembered as a pragmatic centre-right statesman who modernised Danish conservatism.', 'point', 2021, null, '#ef4444'),

  -- King Gustaf V (2c1)
  ('a0000000-0000-0000-0000-0000000002c1', 'Place & Travel', 'Born at Drottningholm Palace', 'Born Oscar Gustaf Adolf on 16 June 1858 at Drottningholm Palace near Stockholm; son of King Oscar II.', 'point', 1858, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002c1', 'Work & Education', 'Became King of Sweden', 'Acceded to the throne on 8 December 1907 upon the death of his father Oscar II; reigned for 43 years until his death — the longest reign in Swedish history at the time.', 'point', 1907, null, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002c1', 'Activities', 'Tennis — "Mr G"', 'A passionate and skilled tennis player who competed internationally under the pseudonym "Mr G" to avoid protocol; played well into his 80s; the Swedish Open is still held at the Båstad courts where he often played.', 'range', 1885, 1945, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002c1', 'Activities', 'WWI neutrality', 'Successfully maintained Swedish neutrality in World War I despite considerable internal pressure from Germany-sympathisers including his own courtiers; his cautious approach preserved the country.', 'range', 1914, 1918, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002c1', 'Activities', 'WWII neutrality', 'Maintained Swedish neutrality in World War II; allowed German troop transit through Sweden in 1940 — a decision that remains controversial — but also sheltered Danish and Norwegian refugees.', 'range', 1939, 1945, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002c1', 'Health', 'Died in Stockholm', 'Died on 29 October 1950 at Drottningholm Palace aged 92; at the time of his death he had been king for 43 years and had reigned through two world wars.', 'point', 1950, null, '#ef4444');
