-- Continuation: missing personas from batch a (King Charles III → Lady Gaga)
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000011d', 'Place & Travel', 'Clarence House, London', 'Raised between Clarence House and Balmoral; educated at Gordonstoun in Scotland.', 'range', 1948, 1966, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000011d', 'Work & Education', 'Trinity College, Cambridge', 'Read archaeology and anthropology then history; first heir to earn a university degree.', 'range', 1967, 1970, '#10b981'),
  ('a0000000-0000-0000-0000-00000000011d', 'Work & Education', 'Royal Navy service', 'Served as helicopter pilot and commanded HMS Bronington.', 'range', 1971, 1976, '#10b981'),
  ('a0000000-0000-0000-0000-00000000011d', 'Work & Education', 'King of the United Kingdom', 'Ascended to the throne after Queen Elizabeth II died 8 September 2022.', 'range', 2022, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-00000000011d', 'Relations & Family', 'Married Princess Diana', 'Married Lady Diana Spencer in 1981; two sons William and Harry; divorced 1996.', 'range', 1981, 1996, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000011d', 'Relations & Family', 'Married Camilla Parker Bowles', 'Long-term relationship formalised; married in civil ceremony 9 April 2005.', 'range', 2005, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000011d', 'Health', 'Cancer diagnosis', 'Diagnosed with cancer in early 2024; stepped back from public duties during treatment.', 'point', 2024, null, '#ef4444'),
  ('a0000000-0000-0000-0000-00000000011d', 'Activities', 'The Prince''s Trust', 'Founded 1976 to support disadvantaged young people; helped over 1 million to date.', 'range', 1976, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000011d', 'Activities', 'Climate and architecture advocacy', 'Championed organic farming, heritage architecture, and climate action for decades.', 'range', 1984, 2026, '#d97706');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000011e', 'Place & Travel', 'London & Kensington Palace', 'Born in London; raised between Kensington Palace, Highgrove, and Balmoral.', 'range', 1982, 2000, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000011e', 'Work & Education', 'University of St Andrews', 'Read art history; met Kate Middleton there; graduated with a geography degree.', 'range', 2001, 2005, '#10b981'),
  ('a0000000-0000-0000-0000-00000000011e', 'Work & Education', 'RAF search-and-rescue pilot', 'Qualified helicopter pilot; served on active duty rescuing civilians in Wales.', 'range', 2008, 2013, '#10b981'),
  ('a0000000-0000-0000-0000-00000000011e', 'Work & Education', 'Prince of Wales & future King', 'Became Prince of Wales and Earl of Chester after Queen Elizabeth''s death in 2022.', 'range', 2022, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-00000000011e', 'Relations & Family', 'Married Catherine Middleton', 'Married at Westminster Abbey on 29 April 2011; watched by 2 billion worldwide.', 'range', 2011, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000011e', 'Relations & Family', 'Three children', 'Father to Prince George (2013), Princess Charlotte (2015), and Prince Louis (2018).', 'range', 2013, 2026, '#db2777'),
  ('a0000000-0000-0000-0000-00000000011e', 'Activities', 'Earthshot Prize', 'Founded the £50m environmental prize in 2020 to fund solutions to climate challenges.', 'range', 2020, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000011e', 'Activities', 'Mental health — Heads Together', 'Co-founded Heads Together campaign with Harry and Kate to destigmatise mental health.', 'range', 2016, 2026, '#d97706');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000120', 'Place & Travel', 'Los Angeles, California', 'Born and raised in LA; studied at Northwestern University before acting career.', 'range', 1981, 2011, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000120', 'Place & Travel', 'Montecito, California', 'Moved to Montecito with Harry after stepping back from royal duties in 2020.', 'range', 2020, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000120', 'Work & Education', 'Suits — Rachel Zane', 'Played paralegal Rachel Zane for seven seasons; fame that led to meeting Harry.', 'range', 2011, 2018, '#10b981'),
  ('a0000000-0000-0000-0000-000000000120', 'Work & Education', 'Netflix deal & Archewell Productions', 'Signed multi-year content deal with Netflix; produced docuseries and animations.', 'range', 2020, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-000000000120', 'Relations & Family', 'Married Prince Harry', 'Married at Windsor Castle on 19 May 2018; first American divorcée to marry a senior royal.', 'range', 2018, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000120', 'Relations & Family', 'Archie and Lilibet', 'Son Archie born 2019 in London; daughter Lilibet Diana born 2021 in California.', 'range', 2019, 2026, '#db2777'),
  ('a0000000-0000-0000-0000-000000000120', 'Activities', 'Oprah interview', 'Joint interview with Harry in March 2021 alleged racism in royal family; 49M viewers.', 'point', 2021, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000120', 'Health', 'Mental health disclosures', 'Spoke to Oprah about suicidal thoughts during royal life; raised global debate.', 'point', 2021, null, '#ef4444');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000122', 'Place & Travel', 'Reading, Berkshire', 'Born in Reading; grew up in Chapel Row; family moved to Jordanstow when she was thirteen.', 'range', 1982, 2001, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000122', 'Work & Education', 'University of St Andrews', 'Read history of art; met William in first year; graduated with a 2:1 in 2005.', 'range', 2001, 2005, '#10b981'),
  ('a0000000-0000-0000-0000-000000000122', 'Work & Education', 'Princess of Wales', 'Became Princess of Wales and Duchess of Cornwall after Elizabeth II''s death in 2022.', 'range', 2022, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-000000000122', 'Relations & Family', 'Married Prince William', 'Married at Westminster Abbey on 29 April 2011; became HRH Duchess of Cambridge.', 'range', 2011, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000122', 'Relations & Family', 'Three children', 'Mother to Prince George (2013), Princess Charlotte (2015), and Prince Louis (2018).', 'range', 2013, 2026, '#db2777'),
  ('a0000000-0000-0000-0000-000000000122', 'Health', 'Cancer diagnosis 2024', 'Announced preventative chemotherapy after cancer discovered post-abdominal surgery; returned to duties.', 'point', 2024, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000122', 'Activities', 'Early Years Foundation', 'Led major research project on the importance of the first five years of child development.', 'range', 2018, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000122', 'Items', 'Sapphire engagement ring', 'Wore Princess Diana''s 12-carat sapphire ring; sparked global jewellery trend.', 'point', 2010, null, '#64748b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000123', 'Place & Travel', 'Greece & Denmark (exile)', 'Born into Greek royal family; family exiled when he was 18 months old.', 'range', 1921, 1939, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000123', 'Place & Travel', 'United Kingdom', 'Naturalised British citizen 1947; spent most of his life at Buckingham Palace and Windsor.', 'range', 1947, 2021, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000123', 'Work & Education', 'Royal Navy — WWII', 'Served with distinction at the Battle of Cape Matapan; mentioned in dispatches.', 'range', 1939, 1946, '#10b981'),
  ('a0000000-0000-0000-0000-000000000123', 'Work & Education', 'Duke of Edinburgh', 'Created Duke of Edinburgh on wedding day; devoted 65+ years to public service.', 'range', 1947, 2021, '#10b981'),
  ('a0000000-0000-0000-0000-000000000123', 'Relations & Family', 'Married Queen Elizabeth II', 'Married at Westminster Abbey 20 November 1947; longest marriage of a British monarch.', 'range', 1947, 2021, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000123', 'Relations & Family', 'Four children', 'Father to Charles, Anne, Andrew and Edward; famously stern but devoted grandfather.', 'range', 1948, 1964, '#db2777'),
  ('a0000000-0000-0000-0000-000000000123', 'Activities', 'Duke of Edinburgh''s Award', 'Founded the award scheme in 1956; now operates in 130+ countries, 6M+ participants.', 'range', 1956, 2021, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000123', 'Health', 'Died aged 99', 'Died 9 April 2021 at Windsor Castle, two months before his 100th birthday.', 'point', 2021, null, '#ef4444');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000124', 'Work & Education', 'Royal Navy officer', 'First British royal to serve in a combat zone; served on HMS Ardent in the Falklands.', 'range', 1977, 1992, '#10b981'),
  ('a0000000-0000-0000-0000-000000000124', 'Work & Education', 'Princess Royal', 'Became Princess Royal in 1987; hardest-working royal by public engagements per year.', 'range', 1987, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-000000000124', 'Activities', 'Olympic equestrian', 'Competed in the 1976 Montreal Olympics in eventing; first British royal Olympic competitor.', 'point', 1976, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000124', 'Activities', 'Save the Children president', 'President of Save the Children UK; travelled to frontline regions to highlight child poverty.', 'range', 1970, 2026, '#d97706'),
  ('a0000000-0000-0000-0000-000000000124', 'Relations & Family', 'Married Mark Phillips', 'First marriage 1973 to equestrian Mark Phillips; divorced 1992.', 'range', 1973, 1992, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000124', 'Relations & Family', 'Married Sir Timothy Laurence', 'Second marriage 1992 to Royal Navy officer Timothy Laurence; remains together.', 'range', 1992, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000124', 'Health', 'Kidnapping attempt survived', 'Survived a kidnapping attempt in 1974; refused to leave her car and talked the gunman down.', 'point', 1974, null, '#ef4444');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000125', 'Work & Education', 'Royal Navy — Falklands War', 'Flew Sea King helicopters in the Falklands conflict; saw active combat service.', 'range', 1979, 1992, '#10b981'),
  ('a0000000-0000-0000-0000-000000000125', 'Work & Education', 'Duke of York', 'Created Duke of York on his wedding day; undertook hundreds of royal engagements annually.', 'range', 1986, 2019, '#10b981'),
  ('a0000000-0000-0000-0000-000000000125', 'Relations & Family', 'Married Sarah Ferguson', 'Married ''Fergie'' at Westminster Abbey 23 July 1986; divorced 1996; remain close friends.', 'range', 1986, 1996, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000125', 'Relations & Family', 'Two daughters', 'Father to Princess Beatrice (1988) and Princess Eugenie (1990).', 'range', 1988, 2026, '#db2777'),
  ('a0000000-0000-0000-0000-000000000125', 'Activities', 'Newsnight interview', 'Disastrous BBC interview about Epstein in 2019 led to stepping back from royal duties.', 'point', 2019, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000125', 'Health', 'Epstein scandal & civil lawsuit', 'Settled civil lawsuit in 2022 with Virginia Giuffre for undisclosed sum; titles stripped.', 'range', 2019, 2022, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000125', 'Items', 'Pit Road house, Windsor', 'Given a grace-and-favour home at Windsor by King Charles after losing official residence.', 'point', 2023, null, '#64748b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000126', 'Work & Education', 'Universidad Autónoma, Madrid', 'Law degree in Madrid; also studied at Lakefield College School, Canada.', 'range', 1986, 1993, '#10b981'),
  ('a0000000-0000-0000-0000-000000000126', 'Work & Education', 'King of Spain', 'Ascended to the throne 19 June 2014 after his father Juan Carlos I abdicated.', 'range', 2014, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-000000000126', 'Activities', '1992 Barcelona Olympics', 'Competed as a sailor in the 470 class at the 1992 Barcelona Olympic Games.', 'point', 1992, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000126', 'Relations & Family', 'Married Letizia Ortiz', 'Married journalist Letizia Ortiz in a lavish ceremony in Madrid on 22 May 2004.', 'range', 2004, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000126', 'Relations & Family', 'Two daughters', 'Father to Princess Leonor (heir, born 2005) and Infanta Sofía (born 2007).', 'range', 2005, 2026, '#db2777'),
  ('a0000000-0000-0000-0000-000000000126', 'Activities', 'Catalan independence crisis', 'Delivered rare TV address backing the Spanish state during the 2017 Catalan referendum.', 'point', 2017, null, '#d97706');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000127', 'Work & Education', 'Journalism career', 'Worked as reporter and anchor for CNN+, TVE, and Antena 3 before marrying Felipe.', 'range', 1995, 2004, '#10b981'),
  ('a0000000-0000-0000-0000-000000000127', 'Work & Education', 'Queen of Spain', 'Became Queen consort on 19 June 2014; actively represents Spain on state visits.', 'range', 2014, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-000000000127', 'Relations & Family', 'Married Prince Felipe', 'Married Crown Prince Felipe on 22 May 2004 in Madrid''s Almudena Cathedral.', 'range', 2004, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000127', 'Activities', 'Mental health advocacy', 'Champion of mental health and rare diseases; patron of the Spanish Federation of Mental Health.', 'range', 2014, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000127', 'Activities', 'Princess of Asturias Foundation', 'Actively involved with the foundation awarding prizes in science, arts, and social sciences.', 'range', 2004, 2026, '#d97706'),
  ('a0000000-0000-0000-0000-000000000127', 'Items', 'Fashion influence', 'Regularly wears Spanish designers; her outfits cause immediate sell-outs globally.', 'range', 2004, 2026, '#64748b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000128', 'Work & Education', 'Leiden University & Delft', 'Studied history at Leiden; also qualified as a commercial pilot at Delft.', 'range', 1985, 1993, '#10b981'),
  ('a0000000-0000-0000-0000-000000000128', 'Work & Education', 'King of the Netherlands', 'Became King on 30 April 2013 when his mother Queen Beatrix abdicated.', 'range', 2013, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-000000000128', 'Activities', 'KLM co-pilot', 'Secretly flew passengers as a co-pilot on KLM Cityhopper routes for over 20 years.', 'range', 1995, 2020, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000128', 'Relations & Family', 'Married Máxima Zorreguieta', 'Married Argentine Máxima in 2002; three daughters including heir Princess Catharina-Amalia.', 'range', 2002, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000128', 'Activities', 'Water management', 'Chairs advisory board on water and sanitation for the UN Secretary-General.', 'range', 2013, 2026, '#d97706');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000129', 'Work & Education', 'Sandhurst & US Army', 'Trained at Sandhurst; also attended Pembroke College Oxford; served as military officer.', 'range', 1980, 1993, '#10b981'),
  ('a0000000-0000-0000-0000-000000000129', 'Work & Education', 'King of Jordan', 'Unexpectedly named king after his father Hussein designated him heir; ascended February 1999.', 'range', 1999, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-000000000129', 'Relations & Family', 'Married Queen Rania', 'Married Palestinian-Kuwaiti Rania Al-Yassin in 1993; four children.', 'range', 1993, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000129', 'Activities', 'Moderate Arab voice', 'Positioned Jordan as a moderate bridge between Israel, Palestinians and the Arab world.', 'range', 1999, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000129', 'Activities', 'Syrian refugee crisis', 'Jordan hosted over 1.3M Syrian refugees — largest per-capita in the world.', 'range', 2011, 2026, '#d97706');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000012a', 'Place & Travel', 'Riyadh, Saudi Arabia', 'Born and raised in Riyadh; educated at King Fahd Security College.', 'range', 1985, 2003, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000012a', 'Work & Education', 'Crown Prince & de facto ruler', 'Appointed Crown Prince June 2017; consolidated power rapidly, sidelining rivals.', 'range', 2017, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-00000000012a', 'Work & Education', 'Vision 2030', 'Launched economic diversification plan to reduce Saudi dependence on oil.', 'range', 2016, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-00000000012a', 'Activities', 'Khashoggi killing', 'US intelligence concluded MBS approved operation to kill journalist Jamal Khashoggi in 2018.', 'point', 2018, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000012a', 'Activities', 'Ritz-Carlton detentions', 'Detained hundreds of princes and businessmen in anti-corruption purge in 2017.', 'point', 2017, null, '#d97706'),
  ('a0000000-0000-0000-0000-00000000012a', 'Activities', 'Women allowed to drive', 'Lifted the ban on women driving in 2018 — a landmark social reform.', 'point', 2018, null, '#d97706'),
  ('a0000000-0000-0000-0000-00000000012a', 'Assets', 'Saudi Aramco IPO', 'Oversaw the $25.6 billion IPO of Saudi Aramco in 2019 — the world''s largest ever.', 'point', 2019, null, '#14b8a6');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000012b', 'Work & Education', 'Governor of Riyadh', 'Served as Governor of Riyadh for 48 years, transforming it into a modern city.', 'range', 1963, 2011, '#10b981'),
  ('a0000000-0000-0000-0000-00000000012b', 'Work & Education', 'King of Saudi Arabia', 'Became king 23 January 2015 after the death of his half-brother King Abdullah.', 'range', 2015, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-00000000012b', 'Activities', 'Vision 2030 patron', 'Backed his son MBS in launching Vision 2030 economic and social reform agenda.', 'range', 2016, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000012b', 'Relations & Family', 'Vast royal family', 'Father to at least 13 sons and 16 daughters; grandfather to hundreds; MBS his favourite.', 'range', 1956, 2026, '#ec4899');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000012c', 'Work & Education', 'Dubai Police commander', 'Joined Dubai Police; rose through ranks while composing poetry and writing books.', 'range', 1968, 1995, '#10b981'),
  ('a0000000-0000-0000-0000-00000000012c', 'Work & Education', 'Prime Minister of UAE', 'Became UAE Prime Minister in 2006; also Vice President and Ruler of Dubai.', 'range', 2006, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-00000000012c', 'Activities', 'Dubai Expo 2020', 'Hosted the World Expo in Dubai attracting 24M visitors — a showcase of Arab ambition.', 'point', 2022, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000012c', 'Assets', 'Dubai Inc.', 'Transformed Dubai into a $500B+ economy with Burj Khalifa, Palm Jumeirah and Emirates.', 'range', 1990, 2026, '#14b8a6'),
  ('a0000000-0000-0000-0000-00000000012c', 'Items', 'Poetry and horses', 'Award-winning Arabic poet; owns Godolphin thoroughbred stable — one of the world''s largest.', 'range', 1980, 2026, '#64748b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000012d', 'Work & Education', 'Sandhurst & Doha', 'Educated at Sherborne School UK and Sandhurst; served as army officer.', 'range', 1998, 2013, '#10b981'),
  ('a0000000-0000-0000-0000-00000000012d', 'Work & Education', 'Emir of Qatar', 'Became Emir at 33 in 2013 after his father abdicated — youngest ruling head of state.', 'range', 2013, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-00000000012d', 'Activities', 'FIFA World Cup 2022', 'Delivered the first World Cup held in the Arab world despite intense international scrutiny.', 'point', 2022, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000012d', 'Assets', 'Qatar Investment Authority', 'Oversees the QIA sovereign wealth fund with ~$450B in assets including Harrods and Heathrow.', 'range', 2013, 2026, '#14b8a6');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000012e', 'Work & Education', 'Gakushuin University & Oxford', 'Studied Japanese history at Gakushuin; earned MPhil in water transport history at Oxford.', 'range', 1979, 1988, '#10b981'),
  ('a0000000-0000-0000-0000-00000000012e', 'Work & Education', 'Emperor of Japan', 'Ascended to the Chrysanthemum Throne on 1 May 2019 when his father Akihito abdicated.', 'range', 2019, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-00000000012e', 'Relations & Family', 'Married Masako Owada', 'Married diplomat Masako Owada in 1993 after famously persistent courtship.', 'range', 1993, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000012e', 'Activities', 'Water access advocacy', 'Chair of the UN High-Level Panel on Water; passionate advocate for global clean water.', 'range', 2016, 2026, '#f59e0b');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-00000000012f', 'Work & Education', 'Gakushuin & University of Tokyo', 'Studied biology at Gakushuin; received honorary degrees worldwide; expert ichthyologist.', 'range', 1952, 1958, '#10b981'),
  ('a0000000-0000-0000-0000-00000000012f', 'Work & Education', 'Emperor of Japan', 'Reigned as Emperor from 7 January 1989 until voluntary abdication on 30 April 2019.', 'range', 1989, 2019, '#10b981'),
  ('a0000000-0000-0000-0000-00000000012f', 'Relations & Family', 'Married Michiko Shoda', 'Married commoner Michiko Shoda in 1959 — the first commoner to wed a Japanese crown prince.', 'range', 1959, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000012f', 'Activities', 'War remorse', 'Made unprecedented visits to Pacific war sites; expressed ''feelings of deep remorse'' for WWII.', 'range', 1992, 2019, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000012f', 'Activities', 'First living abdication in 200 years', 'Abdicated citing age and health in 2019; first Japanese emperor to abdicate in over 200 years.', 'point', 2019, null, '#d97706');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000130', 'Place & Travel', 'Houston, Texas', 'Born in Houston; moved to New York City as a child; grew up in performing arts.', 'range', 1981, 1997, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000130', 'Work & Education', 'Destiny''s Child', 'Rose to global fame with Destiny''s Child; group sold over 60M records worldwide.', 'range', 1997, 2006, '#10b981'),
  ('a0000000-0000-0000-0000-000000000130', 'Work & Education', 'Solo career & Lemonade', 'Released six acclaimed solo albums; Lemonade (2016) called the album of a generation.', 'range', 2003, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-000000000130', 'Relations & Family', 'Married Jay-Z', 'Married rapper Jay-Z in a private ceremony 4 April 2008; twins Rumi and Sir born 2017.', 'range', 2008, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000130', 'Activities', 'Coachella headliner', 'First Black woman to headline Coachella; 2018 performance later released as Homecoming film.', 'point', 2018, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000130', 'Activities', 'Renaissance tour', 'Renaissance World Tour (2023) grossed over $579M — one of highest-grossing tours ever.', 'point', 2023, null, '#d97706'),
  ('a0000000-0000-0000-0000-000000000130', 'Assets', 'Ivy Park & brand empire', 'Co-owns Ivy Park clothing line; net worth estimated at $500M+.', 'range', 2016, 2026, '#14b8a6');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000131', 'Place & Travel', 'Barbados', 'Born in Saint Michael, Barbados; discovered by American record producer Evan Rogers on holiday.', 'range', 1988, 2005, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000131', 'Place & Travel', 'Los Angeles', 'Based in LA since her teens; later moved between LA and New York.', 'range', 2005, 2026, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000131', 'Work & Education', 'Def Jam career — Umbrella to ANTI', 'Eight studio albums; Umbrella (2007) a global phenomenon; ANTI (2016) an R&B masterpiece.', 'range', 2005, 2016, '#10b981'),
  ('a0000000-0000-0000-0000-000000000131', 'Work & Education', 'Fenty Beauty launch', 'Launched with 40 foundation shades in 2017; generated $100M in first 40 days.', 'point', 2017, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000131', 'Activities', 'Super Bowl halftime show', 'Performed halftime show at Super Bowl LVII while visibly pregnant; watched by 118M.', 'point', 2023, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000131', 'Relations & Family', 'ASAP Rocky relationship', 'Confirmed relationship in 2020; son RZA born 2022, son Riot born 2023.', 'range', 2020, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000131', 'Assets', 'Billionaire entrepreneur', 'Fenty Beauty and Savage X Fenty combined with music made her a certified billionaire.', 'point', 2021, null, '#14b8a6');

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000132', 'Place & Travel', 'New York City', 'Born in Manhattan; raised Catholic in the Upper West Side; studied at NYU Tisch briefly.', 'range', 1986, 2007, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000132', 'Work & Education', 'The Fame & Born This Way', 'Debut The Fame made her a star; Born This Way (2011) became an LGBTQ+ anthem.', 'range', 2008, 2013, '#10b981'),
  ('a0000000-0000-0000-0000-000000000132', 'Work & Education', 'Acting — A Star Is Born', 'Oscar win for Best Original Song Shallow; acclaimed for her acting alongside Bradley Cooper.', 'point', 2018, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000132', 'Health', 'Fibromyalgia diagnosis', 'Publicly revealed fibromyalgia diagnosis; became an advocate for chronic illness awareness.', 'point', 2017, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000132', 'Relations & Family', 'Engaged to Michael Polansky', 'Long-term relationship with tech entrepreneur Michael Polansky; engaged 2025.', 'range', 2020, 2026, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000132', 'Activities', 'LGBTQ+ activism', 'Long-time advocate; Born This Way Foundation supports LGBTQ+ youth mental health.', 'range', 2011, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000132', 'Activities', 'Las Vegas residency', 'Jazz & Piano and Chromatica Ball residencies brought a new artistic chapter.', 'range', 2021, 2024, '#d97706');
