-- ============================================================
-- 035_religious_historical_personas.sql
-- 20 religious & historical personas
-- IDs: a0000000-0000-0000-0000-0000000002f6 → 000000000309
-- Lane names: Place & Travel | Work & Education | Health |
--             Relations & Family | Activities | Assets | Items
-- Negative years = BC (e.g. -4 = 4 BC)
-- ============================================================

-- ============================================================
-- 1. JESUS OF NAZARETH  (c. 4 BC – c. 30 AD)
-- ============================================================
INSERT INTO public.personas (id, name, bio, birth_year, death_year) VALUES (
  'a0000000-0000-0000-0000-0000000002f6',
  'Jesus of Nazareth',
  'Central figure of Christianity, regarded by Christians as the Son of God and the Messiah prophesied in the Hebrew Bible. Born in Bethlehem, raised in Nazareth. His teachings on love, forgiveness, and the Kingdom of God, his crucifixion under Pontius Pilate, and his reported resurrection became the foundation of the world''s largest religion.',
  -4, 30
);
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000002f6', 'Place & Travel', 'Bethlehem, Judea',           'Born in Bethlehem according to the Gospels; family fled briefly to Egypt to escape King Herod', 'range', -4, -3, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002f6', 'Place & Travel', 'Nazareth, Galilee',          'Grew up in Nazareth; worked as a carpenter with Joseph; largely silent years before public ministry', 'range', -3, 26, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002f6', 'Place & Travel', 'Judean Desert',              'Withdrew into the desert for 40 days of fasting and prayer before beginning his public ministry; tempted by the devil according to the Gospels', 'range', 26, 26.1, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002f6', 'Place & Travel', 'Galilee & Jerusalem ministry','Traveled throughout Galilee, Samaria, and Judea; final journey to Jerusalem for Passover', 'range', 26, 30, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002f6', 'Work & Education', 'Carpenter in Nazareth',    'Worked as a craftsman (tekton) with his father Joseph; deeply versed in Torah and synagogue teaching', 'range', 10, 26, '#8b5cf6'),
  ('a0000000-0000-0000-0000-0000000002f6', 'Work & Education', 'Public Ministry',          'Preached the Sermon on the Mount; performed miracles; gathered 12 apostles; challenged Temple authorities', 'range', 26, 30, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002f6', 'Activities', 'Baptism by John the Baptist',   'Baptised in the River Jordan by John; a voice from heaven declared "This is my beloved Son"', 'point', 26, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002f6', 'Activities', 'Sermon on the Mount',           'Delivered the Beatitudes and the Lord''s Prayer; foundational ethical teaching of Christianity', 'point', 27, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002f6', 'Activities', 'Last Supper',                   'Passover meal with the 12 apostles; instituted the Eucharist; foresaw his betrayal by Judas', 'point', 30, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002f6', 'Activities', 'Crucifixion & Resurrection',    'Crucified on Golgotha under Pontius Pilate; rose on the third day according to Christian belief; appeared to disciples before ascending', 'point', 30, null, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000002f6', 'Relations & Family', 'Mary, Mother of Jesus', 'Born to Mary (virgin birth according to Gospels) and raised by Joseph the carpenter', 'range', -4, 30, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000002f6', 'Relations & Family', 'The Twelve Apostles',   'Called fishermen, a tax collector, and others; Peter, James, John were his inner circle', 'range', 26, 30, '#ec4899');

-- ============================================================
-- 2. MUHAMMAD  (570 – 632 AD)
-- ============================================================
INSERT INTO public.personas (id, name, bio, birth_year, death_year) VALUES (
  'a0000000-0000-0000-0000-0000000002f7',
  'Muhammad',
  'Prophet and founder of Islam, regarded by Muslims as the final messenger of God (Allah). Born in Mecca into the Quraysh tribe, he received divine revelations beginning at age 40, compiled in the Quran. His Hijra (migration) to Medina in 622 marks the start of the Islamic calendar. He unified the Arabian Peninsula under Islam before his death in 632.',
  570, 632
);
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000002f7', 'Place & Travel', 'Mecca, Arabia',              'Born in Mecca; orphaned young; raised by grandfather Abd al-Muttalib then uncle Abu Talib', 'range', 570, 622, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002f7', 'Place & Travel', 'Hijra to Medina',            'Migration from Mecca to Medina in 622; founding moment of the Islamic calendar (Year 1 AH)', 'point', 622, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002f7', 'Place & Travel', 'Medina — Islamic State',     'Established the first Muslim community and Islamic governance in Medina; Constitution of Medina', 'range', 622, 632, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002f7', 'Place & Travel', 'Conquest of Mecca',          'Returned to Mecca with 10,000 followers; entered largely peacefully; destroyed idols in the Kaaba', 'point', 630, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002f7', 'Work & Education', 'Merchant & trader',        'Worked as a merchant; known for honesty; managed trade caravans for the wealthy widow Khadijah', 'range', 585, 610, '#8b5cf6'),
  ('a0000000-0000-0000-0000-0000000002f7', 'Work & Education', 'Prophet of Islam',         'Received first revelation in Cave Hira at 40; preached monotheism; faced fierce persecution in Mecca', 'range', 610, 632, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002f7', 'Activities', 'First Revelation (Iqra)',        'Angel Jibreel appeared in Cave Hira on Mount Jabal al-Nour; revealed first verses of the Quran', 'point', 610, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002f7', 'Activities', 'Night Journey (Isra & Mi''raj)', 'Miraculous night journey from Mecca to Jerusalem and ascent to heaven; received the five daily prayers', 'point', 621, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002f7', 'Activities', 'Farewell Pilgrimage',           'Led 100,000+ pilgrims to Mecca; delivered his final sermon on equality and brotherhood', 'point', 632, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002f7', 'Relations & Family', 'Khadijah (first wife)',  'Wealthy merchant widow; his employer then wife for 25 years; first convert to Islam; bore his children', 'range', 595, 619, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000002f7', 'Relations & Family', 'Aisha (wife)',           'Daughter of Abu Bakr; married after Khadijah''s death; major narrator of hadith; mother of the faithful', 'range', 619, 632, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000002f7', 'Health', 'Death in Medina',                   'Died aged ~62 in Medina in the arms of Aisha; buried beneath the mosque; cause likely pleurisy or meningitis', 'point', 632, null, '#ef4444');

-- ============================================================
-- 3. SIDDHARTHA GAUTAMA (Buddha)  (c. 563 – 483 BC)
-- ============================================================
INSERT INTO public.personas (id, name, bio, birth_year, death_year) VALUES (
  'a0000000-0000-0000-0000-0000000002f8',
  'Siddhartha Gautama (Buddha)',
  'Founder of Buddhism, one of the world''s major religions. Born a prince in Lumbini (modern Nepal), he abandoned royal life at 29 after encountering suffering. After six years of ascetic practice and meditation, he attained enlightenment under a Bodhi tree at Bodh Gaya. He spent the next 45 years teaching the path to liberation from suffering (the Dharma).',
  -563, -483
);
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000002f8', 'Place & Travel', 'Lumbini, Shakya Republic',   'Born in Lumbini (Nepal) into the Shakya warrior-ruling clan; father Suddhodana was king', 'range', -563, -534, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002f8', 'Place & Travel', 'Kapilavastu — royal palace', 'Lived sheltered in Kapilavastu; father shielded him from suffering; married Princess Yasodhara', 'range', -534, -534, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002f8', 'Place & Travel', 'Forest — ascetic wandering', 'Left the palace; studied under two teachers; then joined five ascetics in extreme self-mortification', 'range', -534, -528, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002f8', 'Place & Travel', 'Bodh Gaya & Deer Park',      'Attained enlightenment at Bodh Gaya; first sermon at Sarnath''s Deer Park to the five ascetics', 'range', -528, -483, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002f8', 'Work & Education', 'Prince — palace education', 'Trained in statecraft, martial arts, and Vedic scripture; prophesied to be either a great king or teacher', 'range', -563, -534, '#8b5cf6'),
  ('a0000000-0000-0000-0000-0000000002f8', 'Work & Education', 'Teaching the Dharma',       'Taught the Four Noble Truths and Eightfold Path for 45 years; founded the Sangha (monastic community)', 'range', -528, -483, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002f8', 'Activities', 'The Four Sights',                'Saw an old man, sick man, corpse, and wandering ascetic; prompted his renunciation of palace life', 'point', -534, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002f8', 'Activities', 'Enlightenment under Bodhi Tree', 'Sat in meditation under a fig tree in Bodh Gaya; reached full enlightenment (Nirvana) on the full moon', 'point', -528, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002f8', 'Activities', 'First Sermon at Sarnath',        'Taught the Five Ascetics the Middle Way, Four Noble Truths, and the Eightfold Path; birth of Buddhism', 'point', -528, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002f8', 'Activities', 'Parinirvana (death)',            'Died at Kushinagar aged ~80; his last words: "All conditioned things are impermanent — strive on with diligence"', 'point', -483, null, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000002f8', 'Relations & Family', 'Princess Yasodhara',     'Married his cousin Yasodhara; son Rahula born; left them at 29 to seek enlightenment', 'range', -547, -534, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000002f8', 'Relations & Family', 'Son Rahula',             'Only child; later became one of the Buddha''s direct disciples; name means "fetter"', 'range', -534, -483, '#ec4899');

-- ============================================================
-- 4. MOSES  (c. 1391 – 1271 BC)
-- ============================================================
INSERT INTO public.personas (id, name, bio, birth_year, death_year) VALUES (
  'a0000000-0000-0000-0000-0000000002f9',
  'Moses',
  'Prophet and lawgiver central to Judaism, Christianity, and Islam. Born a Hebrew slave in Egypt, raised as an Egyptian prince, he fled after killing an overseer. God appeared to him in a burning bush and commissioned him to lead the Israelites out of Egypt (the Exodus). He received the Ten Commandments on Mount Sinai and guided his people through 40 years in the wilderness.',
  -1391, -1271
);
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000002f9', 'Place & Travel', 'Egypt — royal court',        'Born a Hebrew slave; placed in a basket on the Nile; raised in Pharaoh''s palace as an Egyptian prince', 'range', -1391, -1351, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002f9', 'Place & Travel', 'Midian — exile',             'Fled Egypt after killing an overseer; settled in Midian; married Zipporah; worked as a shepherd', 'range', -1351, -1311, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002f9', 'Place & Travel', 'Egypt — The Exodus',         'Returned to Egypt; demanded Pharaoh free the Israelites; led 600,000+ people out after the Ten Plagues', 'range', -1311, -1310, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002f9', 'Place & Travel', 'Sinai Wilderness — 40 years','Led Israel through the Sinai desert; received the Torah; died on Mount Nebo without entering Canaan', 'range', -1310, -1271, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002f9', 'Work & Education', 'Prince of Egypt',          'Educated in all the wisdom of the Egyptians; trained in military and governance', 'range', -1391, -1351, '#8b5cf6'),
  ('a0000000-0000-0000-0000-0000000002f9', 'Work & Education', 'Prophet & Lawgiver',       'Received the Torah on Mount Sinai; established Israel''s legal and religious code; led as judge and ruler', 'range', -1311, -1271, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002f9', 'Activities', 'The Burning Bush',              'God appeared to Moses at Horeb as a bush that burned but was not consumed; commissioned to free Israel', 'point', -1311, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002f9', 'Activities', 'Ten Plagues of Egypt',          'Called down ten plagues on Egypt culminating in the death of firstborns; Pharaoh released the Israelites', 'point', -1310, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002f9', 'Activities', 'Parting of the Red Sea',        'Stretched his staff over the sea; waters parted allowing Israel to cross; Egyptian army was drowned', 'point', -1310, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002f9', 'Activities', 'Ten Commandments — Mount Sinai','Received the stone tablets with the Ten Commandments from God; foundation of Abrahamic moral law', 'point', -1309, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002f9', 'Relations & Family', 'Zipporah (wife)',        'Daughter of Jethro, Midianite priest; bore sons Gershom and Eliezer; joined Moses during the Exodus', 'range', -1351, -1271, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000002f9', 'Relations & Family', 'Aaron (brother)',        'Elder brother and spokesperson; high priest of Israel; assisted throughout the Exodus and wilderness years', 'range', -1391, -1271, '#ec4899');

-- ============================================================
-- 5. MARY, MOTHER OF JESUS  (c. 18 BC – c. 41 AD)
-- ============================================================
INSERT INTO public.personas (id, name, bio, birth_year, death_year) VALUES (
  'a0000000-0000-0000-0000-0000000002fa',
  'Mary, Mother of Jesus',
  'Jewish woman from Nazareth, venerated in Christianity as the mother of Jesus Christ and the "Theotokos" (God-bearer). Her assent to the angel Gabriel''s announcement (the Annunciation) is central to Christian faith. She was present at the Crucifixion and among the disciples after the Resurrection. Revered as the most important female figure in Christianity and highly respected in Islam as Maryam.',
  -18, 41
);
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000002fa', 'Place & Travel', 'Nazareth, Galilee',          'Grew up in Nazareth; betrothed to Joseph the carpenter; received the Annunciation there', 'range', -18, -4, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002fa', 'Place & Travel', 'Bethlehem — birth of Jesus', 'Traveled with Joseph to Bethlehem for the census; gave birth to Jesus in a manger', 'point', -4, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002fa', 'Place & Travel', 'Egypt — flight from Herod',  'Fled with Joseph and infant Jesus to Egypt to escape Herod''s Massacre of the Innocents', 'range', -4, -3, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002fa', 'Place & Travel', 'Nazareth & Jerusalem',       'Returned to Nazareth; raised Jesus; annual pilgrimages to Jerusalem for Passover', 'range', -3, 41, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002fa', 'Activities', 'The Annunciation',               'Angel Gabriel appeared to Mary; she conceived Jesus by the Holy Spirit; said "Let it be done to me"', 'point', -4, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002fa', 'Activities', 'The Magnificat',                 'Visited her cousin Elizabeth (pregnant with John the Baptist); proclaimed the Magnificat hymn of praise', 'point', -4, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002fa', 'Activities', 'Wedding at Cana',               'Jesus''s first miracle at her request — turning water into wine; she told servants "Do whatever he tells you"', 'point', 27, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002fa', 'Activities', 'Present at the Crucifixion',    'Stood at the foot of the cross as Jesus died; Jesus entrusted her to the apostle John', 'point', 30, null, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000002fa', 'Activities', 'Pentecost',                     'Present with the apostles at Pentecost when the Holy Spirit descended; key figure in early church', 'point', 30, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002fa', 'Relations & Family', 'Joseph (husband)',       'Betrothed and husband; righteous man who accepted her miraculous pregnancy; carpenter from Bethlehem', 'range', -5, 25, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000002fa', 'Relations & Family', 'Elizabeth (cousin)',     'Cousin and mother of John the Baptist; greeted Mary: "Blessed are you among women"', 'range', -4, 15, '#ec4899');

-- ============================================================
-- 6. PAUL THE APOSTLE  (c. 5 – 64 AD)
-- ============================================================
INSERT INTO public.personas (id, name, bio, birth_year, death_year) VALUES (
  'a0000000-0000-0000-0000-0000000002fb',
  'Paul the Apostle',
  'The most influential missionary in early Christianity, author of 13 epistles in the New Testament. Born a Jewish Pharisee named Saul in Tarsus, he zealously persecuted Christians until a vision of the risen Christ on the road to Damascus transformed him. His three missionary journeys spread Christianity throughout the Roman Empire from Jerusalem to Rome, where he was martyred under Nero.',
  5, 64
);
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000002fb', 'Place & Travel', 'Tarsus, Cilicia',            'Born a Roman citizen in Tarsus (modern Turkey); raised a devout Jew of the tribe of Benjamin', 'range', 5, 20, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002fb', 'Place & Travel', 'Jerusalem — Pharisaic study','Studied under the great rabbi Gamaliel in Jerusalem; became an expert in Jewish law; persecuted Christians', 'range', 20, 34, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002fb', 'Place & Travel', 'Missionary journeys (1–3)',  'Three major journeys across Asia Minor, Greece, and the Aegean; founded churches in Corinth, Ephesus, Philippi, Thessalonica', 'range', 46, 58, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002fb', 'Place & Travel', 'Rome — imprisonment & death','Appealed to Caesar; transported to Rome; imprisoned; traditionally martyred by beheading under Nero', 'range', 60, 64, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002fb', 'Work & Education', 'Pharisee & tentmaker',     'Trained as a Pharisee under Gamaliel; also practiced tentmaking as a trade throughout his ministry', 'range', 5, 34, '#8b5cf6'),
  ('a0000000-0000-0000-0000-0000000002fb', 'Work & Education', 'Christian missionary & author','Planted churches across the Roman world; wrote epistles to Rome, Corinth, Galatia, Ephesus, Philippi', 'range', 34, 64, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002fb', 'Activities', 'Road to Damascus conversion',   'Blinding vision of Christ; heard "Saul, why do you persecute me?"; blinded for 3 days then baptised', 'point', 34, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002fb', 'Activities', 'Council of Jerusalem',          'Key figure in ruling that Gentiles need not follow Jewish law — opened Christianity to the wider world', 'point', 48, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002fb', 'Activities', 'Epistles written',              'Wrote foundational letters (Romans, Corinthians, Galatians); defined Christian theology on faith, grace, and the Church', 'range', 48, 62, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002fb', 'Relations & Family', 'Barnabas (companion)',   'Fellow missionary on the first journey; later split over John Mark; both key in spreading Christianity', 'range', 46, 49, '#ec4899');

-- ============================================================
-- 7. MARTIN LUTHER  (1483 – 1546)
-- ============================================================
INSERT INTO public.personas (id, name, bio, birth_year, death_year) VALUES (
  'a0000000-0000-0000-0000-0000000002fc',
  'Martin Luther',
  'German theologian and Augustinian friar whose 1517 Ninety-Five Theses challenged the Catholic Church''s sale of indulgences, sparking the Protestant Reformation. Excommunicated by Pope Leo X and condemned by Emperor Charles V at the Diet of Worms, he translated the Bible into German and founded Lutheranism. His theological concepts of justification by faith alone transformed Western Christianity.',
  1483, 1546
);
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000002fc', 'Place & Travel', 'Eisleben, Saxony',           'Born in Eisleben; family moved to Mansfeld where father Hans worked as a copper miner and smelter', 'range', 1483, 1501, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002fc', 'Place & Travel', 'Erfurt & Wittenberg',        'Studied at Erfurt; entered Augustinian monastery; transferred to University of Wittenberg as professor', 'range', 1501, 1546, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002fc', 'Work & Education', 'Law student',              'Enrolled at Erfurt to study law per his father''s wishes; struck by lightning in 1505; vowed to become a monk', 'range', 1501, 1505, '#8b5cf6'),
  ('a0000000-0000-0000-0000-0000000002fc', 'Work & Education', 'Augustinian friar & professor','Ordained as priest 1507; earned doctorate in theology 1512; professor of biblical theology at Wittenberg', 'range', 1505, 1546, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002fc', 'Activities', 'Ninety-Five Theses',            'Posted (or distributed) 95 theses criticising indulgences on 31 October 1517; ignited the Reformation', 'point', 1517, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002fc', 'Activities', 'Diet of Worms',                 'Refused to recant before Emperor Charles V: "Here I stand, I can do no other"; condemned as an outlaw', 'point', 1521, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002fc', 'Activities', 'German Bible translation',      'Translated the New Testament while hidden at Wartburg Castle; later completed the full Bible in 1534', 'range', 1521, 1534, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002fc', 'Activities', 'Lutheran Church established',   'The Augsburg Confession (1530) formally defined Lutheran doctrine; Lutheranism spread across northern Europe', 'range', 1530, 1546, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002fc', 'Health', 'Excommunication',                  'Excommunicated by Pope Leo X in January 1521 — one of the most consequential acts in Church history', 'point', 1521, null, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000002fc', 'Relations & Family', 'Katharina von Bora',    'Married a former nun in 1525; had six children; their household became a model for Protestant clergy families', 'range', 1525, 1546, '#ec4899');

-- ============================================================
-- 8. POPE JOHN PAUL II  (1920 – 2005)
-- ============================================================
INSERT INTO public.personas (id, name, bio, birth_year, death_year) VALUES (
  'a0000000-0000-0000-0000-0000000002fd',
  'Pope John Paul II',
  'Pope from 1978 to 2005 — the second-longest papal reign in history. Born Karol Wojtyla in Wadowice, Poland, he survived Nazi occupation, became a priest under Communist rule, and was elected the first non-Italian Pope in 455 years. He survived an assassination attempt in 1981, played a key role in the fall of Communism in Eastern Europe, and canonised more saints than any previous Pope.',
  1920, 2005
);
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000002fd', 'Place & Travel', 'Wadowice, Poland',           'Born in Wadowice; lost his mother at 9, brother at 12, father at 20; deeply shaped by suffering and faith', 'range', 1920, 1938, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002fd', 'Place & Travel', 'Kraków — under occupation',  'Studied Polish literature at Jagiellonian University; university closed by Nazis; worked in quarry and factory', 'range', 1938, 1945, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002fd', 'Place & Travel', 'Rome & worldwide',           'Elected Pope 16 Oct 1978; made 104 foreign trips — more than all previous popes combined; ~130 countries visited', 'range', 1978, 2005, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002fd', 'Work & Education', 'Priest & philosopher',     'Ordained as priest 1946; earned two doctorates in Rome; professor of ethics at Lublin Catholic University', 'range', 1946, 1978, '#8b5cf6'),
  ('a0000000-0000-0000-0000-0000000002fd', 'Work & Education', 'Archbishop then Cardinal', 'Archbishop of Kraków 1964; Cardinal 1967; known for opposing Communist regime while maintaining dialogue', 'range', 1964, 1978, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002fd', 'Work & Education', 'Pope of the Catholic Church','265th Pope; 26-year reign; transformed the Church''s global image; beatified 2011, canonised 2014', 'range', 1978, 2005, '#059669'),
  ('a0000000-0000-0000-0000-0000000002fd', 'Activities', 'First visit to Poland as Pope', 'June 1979; 9-day visit; 13 million Poles attended; galvanised the Solidarity movement against Communism', 'point', 1979, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002fd', 'Activities', 'Assassination attempt',         'Shot four times in St Peter''s Square by Mehmet Ali Agca on 13 May 1981; survived; later forgave his attacker', 'point', 1981, null, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000002fd', 'Activities', 'Fall of Communism',             'His moral authority and support for Solidarity credited as key factor in Eastern European revolutions of 1989', 'range', 1979, 1989, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002fd', 'Health', 'Parkinson''s disease',             'Publicly lived with Parkinson''s from the 1990s; his visible suffering became a witness to dignity in illness', 'range', 1992, 2005, '#ef4444'),
  ('a0000000-0000-0000-0000-0000000002fd', 'Relations & Family', 'Karol Sr (father)',     'His deeply devout father had enormous spiritual influence; his death when Karol was 20 was a turning point', 'range', 1920, 1941, '#ec4899');

-- ============================================================
-- 9. RUMI  (1207 – 1273)
-- ============================================================
INSERT INTO public.personas (id, name, bio, birth_year, death_year) VALUES (
  'a0000000-0000-0000-0000-0000000002fe',
  'Rumi (Jalal ad-Din Muhammad Balkhi)',
  'Persian Sufi mystic, jurist, and poet, born in Balkh (modern Afghanistan). His works — especially the six-volume Masnavi and the Divan-e Shams — are among the greatest in Persian and world literature. His encounter with the wandering dervish Shams-i-Tabrizi transformed him from a respected scholar into a mystical poet of divine love. He founded the Mevlevi Order, known for the whirling meditation.',
  1207, 1273
);
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000002fe', 'Place & Travel', 'Balkh, Khorasan (Afghanistan)','Born in Balkh; father Baha ud-Din Walad was a respected theologian; fled the Mongol invasion as a child', 'range', 1207, 1215, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002fe', 'Place & Travel', 'Journey westward — decade',  'Family spent years traveling through Baghdad, Mecca, and several cities; met the great poet Attar in Nishapur', 'range', 1215, 1228, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002fe', 'Place & Travel', 'Konya, Anatolia (Turkey)',   'Settled in Konya; lived there the rest of his life; Konya became a centre of Islamic culture under Seljuk rule', 'range', 1228, 1273, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002fe', 'Work & Education', 'Islamic scholar & teacher', 'Studied theology, jurisprudence, and Sufi mysticism in Aleppo and Damascus; returned to Konya as leading jurist', 'range', 1216, 1244, '#8b5cf6'),
  ('a0000000-0000-0000-0000-0000000002fe', 'Work & Education', 'Sufi master & poet',       'After meeting Shams, abandoned formal teaching; dictated the Masnavi to his disciple Husam Chalabi', 'range', 1244, 1273, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002fe', 'Activities', 'Meeting Shams-i-Tabrizi',        'Encountered the wandering mystic Shams in 1244; their spiritual friendship utterly transformed Rumi; Shams disappeared mysteriously in 1248', 'point', 1244, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002fe', 'Activities', 'Writing the Masnavi',           'Dictated 25,700 verses of the Masnavi — a vast spiritual poem on the soul''s journey toward God; took ~15 years', 'range', 1258, 1273, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002fe', 'Activities', 'Founding the Mevlevi Order',    'His son Sultan Walad organised his followers into the Mevlevi Order; the whirling (Sema) became their meditation', 'range', 1244, 1273, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002fe', 'Relations & Family', 'Baha ud-Din Walad (father)','His father was his first spiritual teacher; his death in 1231 was a great loss; Rumi led his school', 'range', 1207, 1231, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000002fe', 'Relations & Family', 'Sultan Walad (son)',     'Devoted son who compiled and preserved Rumi''s works; founded and organised the Mevlevi Order after his death', 'range', 1226, 1273, '#ec4899');

-- ============================================================
-- 10. FRANCIS OF ASSISI  (1181 – 1226)
-- ============================================================
INSERT INTO public.personas (id, name, bio, birth_year, death_year) VALUES (
  'a0000000-0000-0000-0000-0000000002ff',
  'Francis of Assisi',
  'Italian Catholic friar, deacon, and mystic, founder of the Franciscan Order. Born into a wealthy merchant family, he abandoned riches after a religious conversion, embraced radical poverty, and devoted his life to preaching and serving the poor. He is known for his love of nature and animals, his meeting with Sultan al-Kamil during the Crusades, and receiving the stigmata — the wounds of Christ — in 1224.',
  1181, 1226
);
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-0000000002ff', 'Place & Travel', 'Assisi, Umbria, Italy',      'Born into a wealthy cloth-merchant family; carefree youth; taken prisoner in war with Perugia (1202–1203)', 'range', 1181, 1206, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002ff', 'Place & Travel', 'Egypt — Crusades visit',     'Crossed enemy lines during the Fifth Crusade; had a remarkable peaceful meeting with Sultan al-Kamil in Damietta', 'point', 1219, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002ff', 'Place & Travel', 'La Verna & Umbria',          'Withdrew to mountain hermitage at La Verna for fasting; received the stigmata; returned to Assisi to die', 'range', 1224, 1226, '#3b82f6'),
  ('a0000000-0000-0000-0000-0000000002ff', 'Work & Education', 'Merchant''s son',          'Worked in his father''s cloth business; dreamed of knighthood; illness and visions changed his course entirely', 'range', 1181, 1206, '#8b5cf6'),
  ('a0000000-0000-0000-0000-0000000002ff', 'Work & Education', 'Friar, preacher, founder', 'Founded the Order of Friars Minor (Franciscans); also co-founded the Order of Poor Ladies (Clare); lived radical poverty', 'range', 1206, 1226, '#10b981'),
  ('a0000000-0000-0000-0000-0000000002ff', 'Activities', 'Conversion — stripping before bishop','Publicly renounced his father and wealth; stripped off his fine clothes before the bishop of Assisi', 'point', 1206, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002ff', 'Activities', 'Approval of Franciscan Rule',   'Pope Innocent III verbally approved the Franciscan way of life in 1209; Order grew rapidly across Europe', 'point', 1209, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002ff', 'Activities', 'Receiving the Stigmata',        'Praying on La Verna; received the five wounds of Christ on his hands, feet, and side — first stigmatic on record', 'point', 1224, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002ff', 'Activities', 'Canticle of the Sun',           'Composed one of Italy''s earliest vernacular poems; praised God through Brother Sun, Sister Moon, Brother Wind', 'point', 1224, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-0000000002ff', 'Relations & Family', 'Pietro di Bernardone (father)','Wealthy cloth merchant; furious at Francis''s conversion; disinherited him publicly; their rupture was total', 'range', 1181, 1226, '#ec4899'),
  ('a0000000-0000-0000-0000-0000000002ff', 'Relations & Family', 'Clare of Assisi',        'Noble woman inspired by Francis; founded the Poor Ladies; their spiritual friendship lasted his lifetime', 'range', 1211, 1226, '#ec4899');

-- ============================================================
-- 11. JULIUS CAESAR  (100 – 44 BC)
-- ============================================================
INSERT INTO public.personas (id, name, bio, birth_year, death_year) VALUES (
  'a0000000-0000-0000-0000-000000000300',
  'Julius Caesar',
  'Roman general, statesman, and historian who transformed the Roman Republic into the Roman Empire. Born into a patrician family, he rose through political cunning and military brilliance — conquering Gaul, crossing the Rubicon, defeating Pompey, and becoming dictator perpetuo. Assassinated on the Ides of March (15 March 44 BC) by senators including Brutus and Cassius, his death ended the Republic.',
  -100, -44
);
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000300', 'Place & Travel', 'Rome — early career',        'Born in the Subura district; educated in rhetoric; held early offices including military tribune and quaestor', 'range', -100, -60, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000300', 'Place & Travel', 'Gaul — conquest',            'Commanded Roman legions in the conquest of Gaul (modern France and Belgium); extended Rome to the Rhine', 'range', -58, -50, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000300', 'Place & Travel', 'Egypt — with Cleopatra',     'Pursued Pompey to Egypt; allied with Cleopatra VII; fathered her son Caesarion; delayed his return to Rome', 'range', -48, -47, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000300', 'Work & Education', 'Politician & orator',      'Rose via the cursus honorum; elected consul 59 BC; formed First Triumvirate with Pompey and Crassus', 'range', -100, -60, '#8b5cf6'),
  ('a0000000-0000-0000-0000-000000000300', 'Work & Education', 'General & dictator',       'Commanded in Gaul; crossed the Rubicon 49 BC; defeated Pompey; appointed dictator perpetuo Feb 44 BC', 'range', -60, -44, '#10b981'),
  ('a0000000-0000-0000-0000-000000000300', 'Activities', 'Crossing the Rubicon',           '"The die is cast" — led his legion across the Rubicon river; act of war that began the Roman civil war', 'point', -49, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000300', 'Activities', 'Julian Calendar reform',        'Reformed the Roman calendar in 46 BC introducing the 365-day year with leap years; used until 1582', 'point', -46, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000300', 'Activities', 'Assassination — Ides of March', 'Stabbed 23 times in the Theatre of Pompey by Cassius, Brutus, and others; uttered "Et tu, Brute?"', 'point', -44, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000300', 'Relations & Family', 'Calpurnia (wife)',       'Third wife; married 59 BC; warned him not to go to the Senate on the Ides of March; he ignored her', 'range', -59, -44, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000300', 'Relations & Family', 'Cleopatra VII',          'Alliance and romance; she bore him a son Caesarion; came to Rome 46 BC; left after his assassination', 'range', -48, -44, '#ec4899');

-- ============================================================
-- 12. CLEOPATRA VII  (69 – 30 BC)
-- ============================================================
INSERT INTO public.personas (id, name, bio, birth_year, death_year) VALUES (
  'a0000000-0000-0000-0000-000000000301',
  'Cleopatra VII',
  'Last active ruler of the Ptolemaic Kingdom of Egypt. A brilliant polyglot who spoke nine languages, she aligned herself with the two most powerful Romans of her era — Julius Caesar and Mark Antony — to preserve Egyptian independence. After the defeat of her forces by Octavian, she died by suicide in Alexandria. Her story inspired literature, art, and film across two millennia.',
  -69, -30
);
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000301', 'Place & Travel', 'Alexandria, Egypt',          'Born in Alexandria; educated at the Mouseion; co-ruled with father Ptolemy XII from childhood', 'range', -69, -51, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000301', 'Place & Travel', 'Exile & return',             'Exiled by her brother Ptolemy XIII; smuggled back to meet Caesar; reclaimed throne with his military support', 'range', -49, -47, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000301', 'Place & Travel', 'Rome — with Caesar',         'Lived in Caesar''s villa in Rome 46–44 BC; witness to his assassination; returned immediately to Egypt', 'range', -46, -44, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000301', 'Work & Education', 'Queen of Egypt',           'Co-ruled briefly with father; then ruled with brothers Ptolemy XIII and XIV; sole ruler from 44 BC', 'range', -51, -30, '#10b981'),
  ('a0000000-0000-0000-0000-000000000301', 'Activities', 'Alliance with Julius Caesar',    'Met Caesar smuggled in a carpet or linen sack; their alliance produced a son Caesarion (Ptolemy XV)', 'point', -48, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000301', 'Activities', 'Meeting Mark Antony at Tarsus', 'Arrived on a gilded barge dressed as Aphrodite; Antony was captivated; their alliance lasted a decade', 'point', -41, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000301', 'Activities', 'Battle of Actium & defeat',     'Naval battle vs Octavian off Greece; fleet retreated; Antony and Cleopatra fled to Alexandria then died', 'point', -31, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000301', 'Activities', 'Death by suicide',              'Died 12 August 30 BC; tradition says by asp bite; Octavian became sole ruler of Rome and Egypt', 'point', -30, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000301', 'Relations & Family', 'Julius Caesar',          'Alliance and love affair; bore Caesarion; his assassination ended her Roman protection', 'range', -48, -44, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000301', 'Relations & Family', 'Mark Antony',            'Political and romantic partner from 41 BC; married 37 BC; had three children; died together in Alexandria', 'range', -41, -30, '#ec4899');

-- ============================================================
-- 13. GENGHIS KHAN  (1162 – 1227)
-- ============================================================
INSERT INTO public.personas (id, name, bio, birth_year, death_year) VALUES (
  'a0000000-0000-0000-0000-000000000302',
  'Genghis Khan',
  'Founder and Great Khan of the Mongol Empire — the largest contiguous land empire in history. Born Temüjin near the Onon River, he survived slavery, kidnapping, and tribal warfare to unite the Mongol peoples in 1206. His armies conquered from China to Persia, employing terror and innovative tactics. He promoted religious tolerance and meritocracy but caused some of history''s greatest massacres.',
  1162, 1227
);
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000302', 'Place & Travel', 'Mongolian steppe — childhood','Born near the Onon River; father Yesügei poisoned when Temüjin was 9; family abandoned by the tribe; survived in extreme poverty', 'range', 1162, 1178, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000302', 'Place & Travel', 'Central Asia — conquests',   'Led campaigns from China (Jin dynasty) to Central Asia (Khwarazmian Empire); covered millions of square miles', 'range', 1206, 1227, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000302', 'Work & Education', 'Tribal warrior & leader',  'Built alliances; defeated rival tribes; captured and enslaved briefly; built a following through loyalty and prowess', 'range', 1175, 1206, '#8b5cf6'),
  ('a0000000-0000-0000-0000-000000000302', 'Work & Education', 'Great Khan of the Mongols', 'Proclaimed Genghis Khan at the kurultai of 1206; created the Great Yasa law code; organised army by decimal units', 'range', 1206, 1227, '#10b981'),
  ('a0000000-0000-0000-0000-000000000302', 'Activities', 'Unification of Mongol tribes',   'Defeated the Naimans, Merkits, and Tatars; united all Mongolian peoples; proclaimed at the grand assembly 1206', 'point', 1206, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000302', 'Activities', 'Conquest of northern China',     'Invaded Jin dynasty China; captured Zhongdu (Beijing) in 1215; opened the Silk Road under Pax Mongolica', 'range', 1211, 1215, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000302', 'Activities', 'Destruction of Khwarezm',        'After his envoys were massacred, launched devastating campaign; cities of Samarkand, Merv, Urgench annihilated', 'range', 1219, 1221, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000302', 'Relations & Family', 'Börte (wife)',            'Chief wife; kidnapped by Merkits; rescued by Genghis; bore his four principal sons who inherited the empire', 'range', 1178, 1227, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000302', 'Health', 'Death — cause unknown',             'Died August 1227 during campaign against Xi Xia; cause disputed — battle wound, fall from horse, typhoid, or plague', 'point', 1227, null, '#ef4444');

-- ============================================================
-- 14. LEONARDO DA VINCI  (1452 – 1519)
-- ============================================================
INSERT INTO public.personas (id, name, bio, birth_year, death_year) VALUES (
  'a0000000-0000-0000-0000-000000000303',
  'Leonardo da Vinci',
  'Italian Renaissance polymath — painter, sculptor, architect, musician, mathematician, engineer, geologist, botanist, and writer. Born illegitimate in Anchiano, he apprenticed under Verrocchio in Florence. His paintings — the Mona Lisa and The Last Supper — are among the most famous in the world. His notebooks contain designs for flying machines, tanks, and solar power, centuries ahead of their time.',
  1452, 1519
);
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000303', 'Place & Travel', 'Vinci & Florence',           'Born illegitimate in Anchiano; raised by father in Vinci; moved to Florence at 14 to apprentice under Verrocchio', 'range', 1452, 1482, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000303', 'Place & Travel', 'Milan — court of Ludovico Sforza','Spent 17 years in Milan as court artist, engineer, and organiser of pageants and banquets', 'range', 1482, 1499, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000303', 'Place & Travel', 'Florence, Venice, Rome',     'Returned to Florence after French invasion; worked briefly in Venice and Rome; painted the Mona Lisa', 'range', 1499, 1516, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000303', 'Place & Travel', 'Amboise, France',            'Invited by King Francis I; lived at Château du Clos Lucé; brought the Mona Lisa; died in royal company', 'range', 1516, 1519, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000303', 'Work & Education', 'Verrocchio''s workshop',   'Apprenticed under Andrea del Verrocchio; mastered painting, sculpture, goldsmithing; outshone his master by 20', 'range', 1466, 1478, '#8b5cf6'),
  ('a0000000-0000-0000-0000-000000000303', 'Work & Education', 'Painter, engineer, scientist','Worked simultaneously as artist and military engineer; filled 7,000+ notebook pages with studies and inventions', 'range', 1478, 1519, '#10b981'),
  ('a0000000-0000-0000-0000-000000000303', 'Activities', 'The Last Supper',               'Painted on the wall of Santa Maria delle Grazie in Milan; revolutionary use of perspective and expression', 'range', 1495, 1498, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000303', 'Activities', 'Mona Lisa',                     'Began c.1503; possibly painted over 4+ years; the world''s most recognised portrait; acquired by King Francis I', 'range', 1503, 1517, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000303', 'Activities', 'Flying machine designs',        'Designed ornithopter, glider, and aerial screw (helicopter precursor) based on bird anatomy studies', 'range', 1485, 1490, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000303', 'Relations & Family', 'Gian Giacomo Caprotti (Salaì)','Young assistant and companion from 1490; stayed 26 years; Leonardo left him half his vineyard', 'range', 1490, 1519, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000303', 'Relations & Family', 'Francesco Melzi',        'Noble pupil and devoted companion from 1506; inherited Leonardo''s notebooks and personal effects at his death', 'range', 1506, 1519, '#ec4899');

-- ============================================================
-- 15. GALILEO GALILEI  (1564 – 1642)
-- ============================================================
INSERT INTO public.personas (id, name, bio, birth_year, death_year) VALUES (
  'a0000000-0000-0000-0000-000000000304',
  'Galileo Galilei',
  'Italian astronomer, physicist, and mathematician — the "father of modern science." Born in Pisa, he developed the telescope into an astronomical tool, observed moons of Jupiter, and confirmed the Copernican heliocentric model. The Church forced him to recant and placed him under house arrest for the rest of his life. His work laid the foundation for Newton''s mechanics and the Scientific Revolution.',
  1564, 1642
);
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000304', 'Place & Travel', 'Pisa & Florence',            'Born in Pisa; family moved to Florence; enrolled in medicine at Pisa University but switched to mathematics', 'range', 1564, 1592, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000304', 'Place & Travel', 'Padua — 18 most productive years','Professor at University of Padua; called it the best years of his life; built his telescope and made key discoveries', 'range', 1592, 1610, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000304', 'Place & Travel', 'Florence — house arrest',    'Returned to Florence; published Dialogue on Two Chief World Systems; tried by the Inquisition; confined to Arcetri', 'range', 1610, 1642, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000304', 'Work & Education', 'Professor of mathematics',  'Taught mathematics at Pisa then Padua; privately doubted Aristotle; secretly embraced Copernican heliocentrism', 'range', 1589, 1610, '#8b5cf6'),
  ('a0000000-0000-0000-0000-000000000304', 'Work & Education', 'Astronomer & physicist',   'Chief mathematician to Duke of Tuscany; wrote Sidereal Messenger, Dialogue, and Two New Sciences', 'range', 1610, 1642, '#10b981'),
  ('a0000000-0000-0000-0000-000000000304', 'Activities', 'Improved telescope & Sidereal Messenger','Built 20× telescope; discovered 4 moons of Jupiter, phases of Venus, mountains on the Moon; published 1610', 'range', 1609, 1610, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000304', 'Activities', 'Dialogue on Two Chief World Systems','Published 1632; compared Ptolemaic and Copernican models; the Pope''s mouthpiece character was mocked; led to trial', 'point', 1632, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000304', 'Activities', 'Trial by the Inquisition',       'Found "vehemently suspect of heresy"; forced to recant heliocentrism; allegedly muttered "And yet it moves"', 'point', 1633, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000304', 'Health', 'Blindness in old age',              'Became completely blind by 1638; continued to dictate science from house arrest; died Jan 1642 at Arcetri', 'range', 1638, 1642, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000304', 'Relations & Family', 'Marina Gamba (companion)','Long relationship with Venetian woman Marina Gamba; three children; never married due to social status concerns', 'range', 1599, 1610, '#ec4899');

-- ============================================================
-- 16. ISAAC NEWTON  (1643 – 1727)
-- ============================================================
INSERT INTO public.personas (id, name, bio, birth_year, death_year) VALUES (
  'a0000000-0000-0000-0000-000000000305',
  'Isaac Newton',
  'English mathematician, physicist, astronomer, and theologian — widely regarded as one of the greatest scientists in history. Born prematurely in Woolsthorpe, he developed calculus, formulated the laws of motion and universal gravitation, and built the first reflective telescope. His Principia Mathematica (1687) is arguably the most important scientific book ever written. He also spent decades secretly studying alchemy and biblical prophecy.',
  1643, 1727
);
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000305', 'Place & Travel', 'Woolsthorpe, Lincolnshire',  'Born prematurely; father died before birth; mother remarried and left him with grandmother; lonely childhood', 'range', 1643, 1661, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000305', 'Place & Travel', 'Cambridge — Trinity College','Entered Trinity College 1661; worked as a servant (sizar); transformed science there over 35 years', 'range', 1661, 1696, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000305', 'Place & Travel', 'London — Royal Mint & Society','Appointed Warden then Master of the Royal Mint 1696; reformed British currency; President of Royal Society 1703', 'range', 1696, 1727, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000305', 'Work & Education', 'Cambridge scholar & professor','Earned BA 1665; Lucasian Professor of Mathematics from 1669; succeeded by Stokes, later Hawking', 'range', 1661, 1696, '#8b5cf6'),
  ('a0000000-0000-0000-0000-000000000305', 'Work & Education', 'Natural philosopher',       'Simultaneously developed calculus, laws of motion, optics, and gravitation; worked largely in secrecy', 'range', 1664, 1727, '#10b981'),
  ('a0000000-0000-0000-0000-000000000305', 'Activities', '"Annus Mirabilis" — plague years','Sent home by plague 1665–66; conceived calculus, laws of motion, and gravitation in 18 months; the apple story', 'range', 1665, 1666, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000305', 'Activities', 'Principia Mathematica published', 'Published 1687; established laws of motion and universal gravitation; changed humanity''s view of the universe', 'point', 1687, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000305', 'Activities', 'Opticks published',              'Demonstrated white light is composed of a spectrum; developed corpuscular theory of light; foundation of optics', 'point', 1704, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000305', 'Health', 'Mental breakdown',                  'Suffered severe mental crisis in 1693 possibly due to mercury poisoning from alchemy; sent disturbed letters to Pepys', 'point', 1693, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000305', 'Relations & Family', 'Hannah Smith (mother)',   'Mother remarried when Newton was 3; he once threatened to burn her and stepfather''s house; later reconciled', 'range', 1643, 1727, '#ec4899');

-- ============================================================
-- 17. NAPOLEON BONAPARTE  (1769 – 1821)
-- ============================================================
INSERT INTO public.personas (id, name, bio, birth_year, death_year) VALUES (
  'a0000000-0000-0000-0000-000000000306',
  'Napoleon Bonaparte',
  'French military commander and statesman who rose from Corsican obscurity to become Emperor of the French. He dominated European history from 1799 to 1815, reforming French law (Napoleonic Code), education, and administration while waging nearly continuous war. At his peak he controlled most of continental Europe. Defeated at Waterloo in 1815, he was exiled to Saint Helena where he died aged 51.',
  1769, 1821
);
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000306', 'Place & Travel', 'Ajaccio, Corsica',           'Born in Ajaccio, Corsica, just one year after France acquired the island from Genoa; French citizen by accident', 'range', 1769, 1784, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000306', 'Place & Travel', 'France — military schools',  'Scholarship to French mainland schools; teased for his accent; graduated from École Militaire in Paris', 'range', 1784, 1789, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000306', 'Place & Travel', 'Egypt campaign',             'Invaded Egypt 1798; won Battle of the Pyramids; scholars discovered the Rosetta Stone; stranded after Trafalgar', 'range', 1798, 1799, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000306', 'Place & Travel', 'Saint Helena — final exile', 'Exiled to remote South Atlantic island after Waterloo; lived under British guard; dictated his memoirs', 'range', 1815, 1821, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000306', 'Work & Education', 'Artillery officer',        'Commissioned as second lieutenant in 1785; rose rapidly during the Revolution; promoted general at 24', 'range', 1785, 1799, '#8b5cf6'),
  ('a0000000-0000-0000-0000-000000000306', 'Work & Education', 'First Consul then Emperor', 'Coup of 18 Brumaire 1799; crowned Emperor 1804 by Pope Pius VII; reformed law, education, and banking', 'range', 1799, 1815, '#10b981'),
  ('a0000000-0000-0000-0000-000000000306', 'Activities', 'Napoleonic Code',               'Civil code of 1804; foundation of French law and many legal systems worldwide; his most lasting achievement', 'point', 1804, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000306', 'Activities', 'Battle of Austerlitz',          'His tactical masterpiece — defeated Austria and Russia; considered the greatest victory in military history', 'point', 1805, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000306', 'Activities', 'Russian campaign — catastrophe','Invaded Russia with 600,000 men; reached Moscow (burned); retreated through winter; lost 400,000+ soldiers', 'range', 1812, 1812, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000306', 'Activities', 'Battle of Waterloo — final defeat','Defeated by Wellington and Blücher 18 June 1815; abdicated four days later; exiled to Saint Helena', 'point', 1815, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000306', 'Relations & Family', 'Joséphine de Beauharnais','First wife; passionately loved; divorced 1809 because she bore no heir; he reportedly always loved her', 'range', 1796, 1809, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000306', 'Relations & Family', 'Marie-Louise of Austria','Second wife; bore his only legitimate son Napoléon II (the King of Rome); she did not join him in exile', 'range', 1810, 1821, '#ec4899');

-- ============================================================
-- 18. ABRAHAM LINCOLN  (1809 – 1865)
-- ============================================================
INSERT INTO public.personas (id, name, bio, birth_year, death_year) VALUES (
  'a0000000-0000-0000-0000-000000000307',
  'Abraham Lincoln',
  '16th President of the United States (1861–1865). Born in a log cabin in Kentucky, he was largely self-educated and rose from frontier poverty to become a lawyer and congressman. He led the Union through the Civil War, issued the Emancipation Proclamation abolishing slavery in Confederate states, and delivered the Gettysburg Address. Assassinated by John Wilkes Booth at Ford''s Theatre five days after the Confederacy''s surrender.',
  1809, 1865
);
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000307', 'Place & Travel', 'Kentucky & Indiana frontier',  'Born in a log cabin in Hardin County; family moved to Indiana 1816; mother died 1818; stepmother Nancy raised him', 'range', 1809, 1830, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000307', 'Place & Travel', 'Springfield, Illinois',         'Settled in Springfield as a lawyer; served in Illinois legislature; built political career over 20 years', 'range', 1837, 1861, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000307', 'Place & Travel', 'Washington D.C. — President',   'Entered White House amid secession crisis; never left except to visit troops; assassinated at Ford''s Theatre', 'range', 1861, 1865, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000307', 'Work & Education', 'Self-educated lawyer',        'Borrowed and read Blackstone''s Commentaries; passed the bar in 1836; became a highly successful trial lawyer', 'range', 1831, 1861, '#8b5cf6'),
  ('a0000000-0000-0000-0000-000000000307', 'Work & Education', 'Politician & President',      'Illinois state legislator; one-term Congressman; won 1860 election with no Southern electoral votes', 'range', 1834, 1865, '#10b981'),
  ('a0000000-0000-0000-0000-000000000307', 'Activities', 'Lincoln-Douglas Debates',          'Seven 3-hour debates on slavery with Stephen Douglas in 1858; made him nationally known despite losing the Senate race', 'range', 1858, 1858, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000307', 'Activities', 'Emancipation Proclamation',        'Issued 1 January 1863; declared enslaved people in Confederate states "forever free"; transformed the war''s meaning', 'point', 1863, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000307', 'Activities', 'Gettysburg Address',               '272-word speech at Gettysburg National Cemetery; redefined the war as a struggle for human equality', 'point', 1863, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000307', 'Activities', 'Assassination at Ford''s Theatre', 'Shot by Confederate sympathiser John Wilkes Booth on 14 April 1865; died the following morning', 'point', 1865, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000307', 'Health', 'Depression — "the hypo"',             'Suffered severe depression throughout his life; twice collapsed so badly friends hid his razors from him', 'range', 1835, 1865, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000307', 'Relations & Family', 'Mary Todd Lincoln',        'Married 1842; volatile but devoted relationship; lost sons Eddie and Willie during his life; plagued by grief', 'range', 1842, 1865, '#ec4899');

-- ============================================================
-- 19. QUEEN VICTORIA  (1819 – 1901)
-- ============================================================
INSERT INTO public.personas (id, name, bio, birth_year, death_year) VALUES (
  'a0000000-0000-0000-0000-000000000308',
  'Queen Victoria',
  'Queen of the United Kingdom of Great Britain and Ireland (1837–1901) and Empress of India (1876–1901) — the second-longest reigning British monarch. She ascended the throne at 18 after an isolated childhood and reigned for nearly 64 years, presiding over the height of the British Empire. Her marriage to Prince Albert transformed the monarchy; after his death she mourned conspicuously for 40 years. Her nine children married into royal families across Europe.',
  1819, 1901
);
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000308', 'Place & Travel', 'Kensington Palace, London',  'Born at Kensington Palace; raised under strict "Kensington System" designed to isolate and control her', 'range', 1819, 1837, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000308', 'Place & Travel', 'Windsor Castle & Osborne',   'Made Windsor and Osborne House (Isle of Wight) her primary residences; built Balmoral in Scotland', 'range', 1837, 1901, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000308', 'Work & Education', 'Queen of the United Kingdom','Ascended the throne 20 June 1837 at 18; reigned 63 years 7 months; oversaw transformation of the Empire', 'range', 1837, 1901, '#10b981'),
  ('a0000000-0000-0000-0000-000000000308', 'Work & Education', 'Empress of India',          'Proclaimed Empress of India 1 January 1876; at death controlled 23% of the world''s land area', 'range', 1876, 1901, '#059669'),
  ('a0000000-0000-0000-0000-000000000308', 'Activities', 'Accession to the throne',        'Became Queen at 18 after King William IV died; famously awoken before dawn with the news; took immediate authority', 'point', 1837, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000308', 'Activities', 'Great Exhibition of 1851',       'Championed by Prince Albert; first World''s Fair at the Crystal Palace; 6 million visitors; celebrated Empire', 'point', 1851, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000308', 'Activities', 'Diamond Jubilee — 60 years',     'Celebrated 60 years as Queen 1897; the biggest procession London had seen; telegrams sent to every corner of Empire', 'point', 1897, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000308', 'Health', 'Prolonged mourning after Albert',   'Prince Albert died 1861; wore black for 40 years; nicknamed "the Widow of Windsor"; barely appeared in public', 'range', 1861, 1901, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000308', 'Relations & Family', 'Prince Albert',          'Married her first cousin Albert of Saxe-Coburg in 1840; deeply in love; had 9 children; devastated by his death', 'range', 1840, 1861, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000308', 'Relations & Family', '9 children — royal Europe','Children and grandchildren married into nearly every European royal house; she became "grandmother of Europe"', 'range', 1840, 1901, '#ec4899');

-- ============================================================
-- 20. NIKOLA TESLA  (1856 – 1943)
-- ============================================================
INSERT INTO public.personas (id, name, bio, birth_year, death_year) VALUES (
  'a0000000-0000-0000-0000-000000000309',
  'Nikola Tesla',
  'Serbian-American inventor, electrical engineer, and futurist whose inventions — alternating current (AC), the induction motor, the Tesla coil, and radio — transformed the modern world. He worked briefly for Edison before their famous "War of Currents." His partnership with Westinghouse brought AC power to the world. He died alone in a New York hotel room, having assigned his patents without receiving the credit or fortune he deserved.',
  1856, 1943
);
INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  ('a0000000-0000-0000-0000-000000000309', 'Place & Travel', 'Smiljan, Serbia (now Croatia)','Born in Smiljan to a Serbian Orthodox priest; gifted in mathematics; deeply influenced by his mother''s inventiveness', 'range', 1856, 1875, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000309', 'Place & Travel', 'Graz, Prague & Budapest',     'Studied at Graz polytechnic; suffered mysterious breakdown; worked for telephone company; conceived AC motor', 'range', 1875, 1882, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000309', 'Place & Travel', 'Paris then New York',         'Worked for Edison in Paris; emigrated to New York 1884 with 4 cents; worked directly for Edison', 'range', 1882, 1884, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000309', 'Place & Travel', 'New York — inventor years',   'Lived and worked in New York; laboratory on 5th Avenue then Houston Street; later Hotel New Yorker', 'range', 1884, 1943, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000309', 'Work & Education', 'Edison Machine Works',      'Worked for Edison in New York; Edison allegedly promised $50,000 for motor redesign then laughed at him; Tesla quit', 'range', 1884, 1885, '#8b5cf6'),
  ('a0000000-0000-0000-0000-000000000309', 'Work & Education', 'Independent inventor',      'Founded Tesla Electric Company; sold AC patents to Westinghouse; won the "War of Currents" against Edison''s DC', 'range', 1887, 1943, '#10b981'),
  ('a0000000-0000-0000-0000-000000000309', 'Activities', 'AC Induction Motor patented',    'Filed patents for polyphase AC motor and power transmission system — the basis of all modern electrical grids', 'point', 1888, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000309', 'Activities', 'Niagara Falls Power Station',    'Westinghouse-Tesla AC system chosen over Edison''s DC; first industrial power station opened 1895; lit Buffalo NY', 'point', 1895, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000309', 'Activities', 'Wardenclyffe Tower',             'Attempted to build a global wireless power transmission tower; funding withdrawn by J.P. Morgan; dream collapsed', 'range', 1901, 1917, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000309', 'Health', 'OCD, phobias, and isolation',        'Suffered from OCD, fear of germs, pearl jewellery, and round objects; later became a recluse feeding pigeons', 'range', 1890, 1943, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000309', 'Assets', 'Died penniless',                     'Surrendered Westinghouse royalties to keep the company afloat; died with debts of ~$50,000 in a hotel room', 'point', 1943, null, '#14b8a6'),
  ('a0000000-0000-0000-0000-000000000309', 'Relations & Family', 'Lived and died alone',   'Never married; said his work was his only passion; his closest companion in old age was a pigeon he deeply loved', 'range', 1884, 1943, '#ec4899');
