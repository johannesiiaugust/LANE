-- 50 iconic fictional characters as personas
INSERT INTO public.personas (id, name, bio, birth_year, death_year) VALUES

-- Superheroes & Comics
('a0000000-0000-0000-0000-0000000002c2', 'Bruce Wayne (Fictional)', 'Billionaire philanthropist and vigilante crime-fighter known as Batman. Orphaned at age 8 when his parents were murdered in Gotham City, he spent years training his mind and body before returning to wage war on crime.', 1972, NULL),
('a0000000-0000-0000-0000-0000000002c3', 'Clark Kent (Fictional)', 'Last son of Krypton, raised in Smallville, Kansas by the Kent family. Works as a journalist at the Daily Planet in Metropolis while secretly protecting the world as Superman.', 1978, NULL),
('a0000000-0000-0000-0000-0000000002c4', 'Peter Parker (Fictional)', 'Teenager from Queens, New York bitten by a radioactive spider. Balances life as a science student and photographer with fighting crime as Spider-Man, driven by the lesson that with great power comes great responsibility.', 1991, NULL),
('a0000000-0000-0000-0000-0000000002c5', 'Tony Stark (Fictional)', 'Genius engineer and billionaire who built a powered suit of armor while held captive in Afghanistan, becoming Iron Man. Later led the Avengers before sacrificing himself to defeat Thanos.', 1970, 2023),
('a0000000-0000-0000-0000-0000000002c6', 'Steve Rogers (Fictional)', 'Frail but courageous young man from Brooklyn who received a super-soldier serum in 1943 and became Captain America. Frozen in Arctic ice, he reawakened in the modern era and led the Avengers.', 1918, NULL),
('a0000000-0000-0000-0000-0000000002c7', 'Logan / Wolverine (Fictional)', 'Mutant born in 19th-century Canada with a regenerative healing factor and bone claws, later coated with indestructible adamantium. Has lived for over 150 years and joined the X-Men.', 1832, NULL),
('a0000000-0000-0000-0000-0000000002c8', 'Diana Prince (Fictional)', 'Princess of the Amazons, daughter of Zeus, trained warrior who left the hidden island of Themyscira to fight in World War I and has protected humanity as Wonder Woman ever since.', 800, NULL),

-- TV Antiheroes
('a0000000-0000-0000-0000-0000000002c9', 'Walter White (Fictional)', 'Albuquerque high school chemistry teacher diagnosed with inoperable lung cancer who began manufacturing methamphetamine to secure his family''s financial future. His transformation into the drug lord "Heisenberg" consumed everything he loved.', 1958, 2010),
('a0000000-0000-0000-0000-0000000002ca', 'Don Draper (Fictional)', 'Enigmatic creative director at Madison Avenue advertising firm Sterling Cooper. Born Dick Whitman, he assumed the identity of a fallen Korean War officer and reinvented himself as the epitome of 1960s cool.', 1926, NULL),
('a0000000-0000-0000-0000-0000000002cb', 'Tony Soprano (Fictional)', 'New Jersey mob boss who struggled to balance family life with running a criminal organization while dealing with panic attacks and sessions with his psychiatrist, Dr. Melfi.', 1959, 2007),

-- Harry Potter Universe
('a0000000-0000-0000-0000-0000000002cc', 'Harry Potter (Fictional)', 'The Boy Who Lived. Orphaned as an infant when Voldemort killed his parents, raised by his neglectful aunt and uncle, and discovered at age 11 that he was a wizard destined to defeat the Dark Lord.', 1980, NULL),
('a0000000-0000-0000-0000-0000000002cd', 'Hermione Granger (Fictional)', 'Brightest witch of her age. Born to Muggle parents, she became Harry Potter''s closest companion and the intellectual backbone of the trio that defeated Voldemort. Later a senior official at the Ministry of Magic.', 1979, NULL),
('a0000000-0000-0000-0000-0000000002ce', 'Albus Dumbledore (Fictional)', 'The greatest sorcerer of the modern age. Headmaster of Hogwarts, founder of the Order of the Phoenix, and the only wizard Voldemort ever feared. Keeper of profound wisdom and haunted by a dark past.', 1881, 1997),

-- Middle-earth
('a0000000-0000-0000-0000-0000000002cf', 'Frodo Baggins (Fictional)', 'Hobbit of the Shire who inherited the One Ring from his uncle Bilbo and led the Fellowship on the quest to destroy it in the fires of Mount Doom. Years mapped from Third Age (TA-1600).', 1368, 1421),
('a0000000-0000-0000-0000-0000000002d0', 'Bilbo Baggins (Fictional)', 'Respectable Hobbit who was swept into an unexpected adventure with thirteen dwarves to reclaim the Lonely Mountain, finding the One Ring in Gollum''s cave along the way. Years mapped from Third Age (TA-1600).', 1290, 1421),
('a0000000-0000-0000-0000-0000000002d1', 'Aragorn (Fictional)', 'Heir of Isildur and rightful King of Gondor, who spent decades as a wandering Ranger known as Strider before leading the free peoples against Sauron and claiming his throne. Years mapped from Third Age (TA-1600).', 1331, 1541),
('a0000000-0000-0000-0000-0000000002d2', 'Gandalf (Fictional)', 'Istari wizard sent from the Undying Lands to aid the peoples of Middle-earth. Known first as Gandalf the Grey, then as Gandalf the White after his resurrection. Pivotal in both the Quest of Erebor and the War of the Ring.', 1, 1421),

-- Game of Thrones (years in AC — After Conquest)
('a0000000-0000-0000-0000-0000000002d3', 'Tyrion Lannister (Fictional)', 'Clever dwarf and youngest child of Lord Tywin Lannister of Casterly Rock. Known as the Imp, he served as Hand of the King, Master of Coin, and ultimately Hand of the Queen — then Hand of the King to Bran Stark.', 273, NULL),
('a0000000-0000-0000-0000-0000000002d4', 'Jon Snow (Fictional)', 'Lord Commander of the Night''s Watch and secret heir to the Iron Throne, born Aegon Targaryen. Raised as Ned Stark''s bastard, he died and was resurrected before leading the living against the dead.', 281, NULL),
('a0000000-0000-0000-0000-0000000002d5', 'Daenerys Targaryen (Fictional)', 'Last surviving Targaryen, sold into marriage as a teenager, who rose from exile to become Khaleesi, Mother of Dragons, Breaker of Chains — before her tragic end in King''s Landing.', 284, 305),
('a0000000-0000-0000-0000-0000000002d6', 'Arya Stark (Fictional)', 'Youngest daughter of Ned Stark, trained by Syrio Forel and later as a Faceless Man in Braavos. Her list of names drove her south, and she ultimately killed the Night King.', 289, NULL),
('a0000000-0000-0000-0000-0000000002d7', 'Ned Stark (Fictional)', 'Lord of Winterfell, Warden of the North, and the most honorable man in Westeros. His trust in justice and refusal to play the game of thrones cost him his head.', 263, 298),

-- Classic Detectives & Spies
('a0000000-0000-0000-0000-0000000002d8', 'Sherlock Holmes (Fictional)', 'World''s only consulting detective, operating from 221B Baker Street in London. Renowned for his extraordinary powers of observation and deduction, applied to cases Scotland Yard could not solve.', 1854, 1930),
('a0000000-0000-0000-0000-0000000002d9', 'James Bond (Fictional)', 'MI6 secret agent with a licence to kill. Commander Bond conducted missions across the globe through the Cold War era, known for his charm, his Walther PPK, and his preference for martinis shaken, not stirred.', 1920, NULL),
('a0000000-0000-0000-0000-0000000002da', 'Hercule Poirot (Fictional)', 'Fastidious Belgian detective with immaculate moustaches who solved hundreds of murders using his "little grey cells." Worked extensively in England after fleeing WWI Belgium.', 1844, 1975),

-- American Literature
('a0000000-0000-0000-0000-0000000002db', 'Jay Gatsby (Fictional)', 'Mysterious millionaire who threw lavish parties at his Long Island mansion to win back his lost love, Daisy Buchanan. Born James Gatz, he reinvented himself through bootlegging and the pursuit of a dream that consumed him.', 1893, 1922),
('a0000000-0000-0000-0000-0000000002dc', 'Atticus Finch (Fictional)', 'Widowed lawyer in Maycomb, Alabama who courageously defended Tom Robinson, a Black man falsely accused of rape, in the 1930s. A moral cornerstone in American fiction.', 1886, NULL),
('a0000000-0000-0000-0000-0000000002dd', 'Holden Caulfield (Fictional)', 'Disillusioned 17-year-old New Yorker expelled from Pencey Prep who wandered Manhattan for three days, railing against the phoniness of the adult world and mourning his dead brother Allie.', 1934, NULL),
('a0000000-0000-0000-0000-0000000002de', 'Huckleberry Finn (Fictional)', 'Son of the town drunk in Hannibal, Missouri who faked his own death to escape his abusive father and rafted down the Mississippi River with the escaped slave Jim, questioning the morality of a society that enslaves people.', 1845, NULL),

-- European Classic Literature
('a0000000-0000-0000-0000-0000000002df', 'Dorian Gray (Fictional)', 'Beautiful young Londoner whose portrait aged and absorbed his sins in his place, allowing him to pursue every vice while remaining eternally youthful — until he turned on the painting.', 1843, 1890),
('a0000000-0000-0000-0000-0000000002e0', 'Victor Frankenstein (Fictional)', 'Swiss scientist obsessed with cheating death who assembled and animated a creature from dead tissue. Horrified by his creation, he fled — and spent the rest of his life being hunted across Europe and into the Arctic.', 1770, 1799),
('a0000000-0000-0000-0000-0000000002e1', 'Count Dracula (Fictional)', 'Ancient Transylvanian vampire who ruled Castle Dracula for centuries. Travelled to England in 1897 to spread his undead curse, only to be hunted down by a small band of determined adversaries.', 1431, 1897),
('a0000000-0000-0000-0000-0000000002e2', 'Jean Valjean (Fictional)', 'French ex-convict who served 19 years in the galleys for stealing bread. Transformed by an act of grace, he rebuilt himself as a factory owner and mayor while being relentlessly pursued by Inspector Javert.', 1769, 1833),
('a0000000-0000-0000-0000-0000000002e3', 'Edmond Dantès (Fictional)', 'Young Marseille sailor unjustly imprisoned in the island fortress of Château d''If for 13 years. He escaped, discovered hidden treasure, and returned to Paris as the mysterious Count of Monte Cristo to take precise revenge on those who betrayed him.', 1796, NULL),
('a0000000-0000-0000-0000-0000000002e4', 'Ebenezer Scrooge (Fictional)', 'Miserly Victorian London businessman visited on Christmas Eve by three spirits — Past, Present, and Yet to Come — who transformed him from a cold-hearted miser into the most generous man in the city overnight.', 1786, NULL),
('a0000000-0000-0000-0000-0000000002e5', 'Elizabeth Bennet (Fictional)', 'Second of five daughters of a Hertfordshire country gentleman. Sharp-witted, principled, and independent, she famously resisted and then fell for the proud Mr Fitzwilliam Darcy of Pemberley.', 1797, NULL),
('a0000000-0000-0000-0000-0000000002e6', 'Robinson Crusoe (Fictional)', 'English sailor who survived a shipwreck near Trinidad and lived alone on a deserted island for 28 years, building a life through resourcefulness, faith, and the eventual companionship of a man he named Friday.', 1632, NULL),
('a0000000-0000-0000-0000-0000000002e7', 'Captain Ahab (Fictional)', 'Obsessed Nantucket whaling captain who lost his leg to the white whale Moby Dick and sacrificed everything — his ship, his crew, his sanity — in mad pursuit of revenge against the beast.', 1790, 1851),

-- Adventure & Action
('a0000000-0000-0000-0000-0000000002e8', 'Indiana Jones (Fictional)', 'Professor of archaeology at Marshall College who led dangerous expeditions to recover legendary artifacts — the Ark of the Covenant, the Holy Grail, the Crystal Skull — while battling Nazis and cultists across four decades.', 1899, NULL),
('a0000000-0000-0000-0000-0000000002e9', 'Lara Croft (Fictional)', 'British archaeologist and explorer from an aristocratic family. After surviving a shipwreck off a mysterious island, she became the world''s foremost tomb raider, uncovering ancient secrets and stopping those who would weaponise them.', 1992, NULL),
('a0000000-0000-0000-0000-0000000002ea', 'Jason Bourne (Fictional)', 'CIA black-ops assassin who suffered complete amnesia after being shot in the Mediterranean. Spent years reconstructing his identity while evading the very agency that created him.', 1970, NULL),
('a0000000-0000-0000-0000-0000000002eb', 'Jack Sparrow (Fictional)', 'Eccentric and unpredictable pirate captain of the Black Pearl, sailing the Caribbean in the golden age of piracy. More cunning than he appears, and always at the centre of chaos.', 1695, NULL),
('a0000000-0000-0000-0000-0000000002ec', 'Michael Corleone (Fictional)', 'Youngest son of Vito Corleone who returned from WWII determined to live an honest life, only to be drawn into the family''s criminal empire step by step until he became its cold and ruthless head.', 1920, 1997),

-- Sci-fi & Dystopia
('a0000000-0000-0000-0000-0000000002ed', 'Katniss Everdeen (Fictional)', 'Survivor from District 12 in the dystopian nation of Panem. Her defiance in the Hunger Games made her the Mockingjay — symbol of a revolution that toppled President Snow and the Capitol. Story set ~2391–2394.', 2377, NULL),
('a0000000-0000-0000-0000-0000000002ee', 'Forrest Gump (Fictional)', 'Simple and kind-hearted man from Greenbow, Alabama who inadvertently witnessed and shaped many defining moments of American history from the 1950s through the 1980s — Vietnam, Watergate, and more.', 1944, NULL),

-- Nordic Fictional Characters
('a0000000-0000-0000-0000-0000000002ef', 'Lisbeth Salander (Fictional)', 'Brilliant and antisocial computer hacker in Stockholm, Sweden. A ward of the state from a troubled childhood, she exposed corruption at the heart of Swedish institutions and fought back against those who preyed on women.', 1978, NULL),
('a0000000-0000-0000-0000-0000000002f0', 'Pippi Longstocking (Fictional)', 'Exceptionally strong nine-year-old girl living alone in Villa Villekulla with her horse and monkey. She rejects all adult authority, lies cheerfully, and is the strongest person in the world. Created by Astrid Lindgren.', 1936, NULL),

-- Shakespeare & Classic Drama
('a0000000-0000-0000-0000-0000000002f1', 'Hamlet (Fictional)', 'Prince of Denmark, paralysed by grief and moral uncertainty after his father''s ghost reveals he was murdered by Hamlet''s uncle. His search for proof and his delay in acting destroy everyone around him.', 980, 1000),

-- French & Spanish Classic Literature
('a0000000-0000-0000-0000-0000000002f2', 'Don Quixote (Fictional)', 'Spanish country gentleman from La Mancha who read so many chivalric romances he lost his mind, declared himself a knight-errant, and set out on horseback with his squire Sancho Panza to right the wrongs of the world.', 1547, 1614),
('a0000000-0000-0000-0000-0000000002f3', 'Raskolnikov (Fictional)', 'Impoverished student in St. Petersburg who murdered a pawnbroker as a philosophical experiment in whether extraordinary people stand above ordinary moral law — and was then consumed by guilt until he confessed.', 1840, NULL),

-- Thriller & Crime
('a0000000-0000-0000-0000-0000000002f4', 'Hannibal Lecter (Fictional)', 'Brilliant psychiatrist, Renaissance man, and cannibalistic serial killer. Dr. Lecter''s cultured tastes and savage violence made him one of fiction''s most unforgettable villains — and occasional reluctant ally.', 1933, NULL),
('a0000000-0000-0000-0000-0000000002f5', 'Patrick Bateman (Fictional)', 'Yale-educated Wall Street investment banker in 1980s Manhattan, obsessed with status, business cards, and designer labels. Whether his murders are real or fantasy remains deliberately ambiguous.', 1962, NULL);
