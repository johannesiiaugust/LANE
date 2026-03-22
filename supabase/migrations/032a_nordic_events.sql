-- ============================================================
-- 032a_nordic_events.sql
-- Events for Nordic personas 25e – 283 (personas 1–38)
-- ============================================================

INSERT INTO public.persona_events (persona_id, lane_name, title, description, type, start_year, end_year, color) VALUES
  -- Gustav Vasa (25e)
  ('a0000000-0000-0000-0000-00000000025e', 'Place & Travel', 'Born in Rydboholm, Uppland', 'Born into the Swedish noble Vasa family at Rydboholm castle in Uppland, Sweden.', 'point', 1496, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000025e', 'Place & Travel', 'Hostage in Denmark', 'Held as a Danish hostage in 1518 as security for a truce; escaped in 1519 dressed as an ox-driver through the snowy Swedish landscape.', 'range', 1518, 1519, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000025e', 'Work & Education', 'Led uprising against Denmark', 'Raised a peasant army in Dalarna in 1521 and led a rebellion against King Christian II of Denmark, who had massacred Swedish nobles at the Stockholm Bloodbath.', 'range', 1521, 1523, '#10b981'),
  ('a0000000-0000-0000-0000-00000000025e', 'Work & Education', 'Crowned King of Sweden', 'Elected King of Sweden on 6 June 1523 — a date now celebrated as Sweden''s National Day — ending the Kalmar Union and establishing Sweden as an independent kingdom.', 'point', 1523, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000025e', 'Work & Education', 'Swedish Reformation', 'Broke with Rome and established the Lutheran church as the state church of Sweden in 1527, partly to seize church lands and finances to fund his nascent state.', 'point', 1527, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000025e', 'Relations & Family', 'Married Catherine of Saxe-Lauenburg', 'First marriage in 1531; Catherine died in 1535. He later married twice more, building the Vasa dynasty.', 'range', 1531, 1535, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000025e', 'Work & Education', 'Consolidated royal power', 'Transformed Sweden from a loosely unified kingdom with a powerful nobility into a hereditary monarchy with centralised royal authority, founding the modern Swedish state.', 'range', 1540, 1560, '#10b981'),
  ('a0000000-0000-0000-0000-00000000025e', 'Place & Travel', 'Died in Stockholm', 'Died in Stockholm on 29 September 1560 after 37 years of rule that fundamentally shaped Sweden.', 'point', 1560, null, '#3b82f6'),

  -- Gustavus Adolphus (25f)
  ('a0000000-0000-0000-0000-00000000025f', 'Place & Travel', 'Born in Stockholm', 'Born at Stockholm castle on 9 December 1594; began studying statecraft and languages from a young age.', 'point', 1594, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000025f', 'Work & Education', 'Became King of Sweden', 'Ascended to the throne in 1611 at age 16 upon his father''s death; immediately faced wars with Denmark, Russia, and Poland.', 'point', 1611, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000025f', 'Work & Education', 'Modernised Swedish military', 'Revolutionised warfare by combining mobile cavalry, disciplined infantry, and mobile artillery; his tactical innovations influenced military doctrine for centuries.', 'range', 1611, 1630, '#10b981'),
  ('a0000000-0000-0000-0000-00000000025f', 'Relations & Family', 'Married Maria Eleonora of Brandenburg', 'Married Princess Maria Eleonora in 1620; their daughter Christina would inherit the throne.', 'point', 1620, null, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000025f', 'Work & Education', 'Entered Thirty Years'' War', 'Landed in Germany in 1630 to defend German Protestants and Swedish strategic interests against the Catholic Habsburgs; won a string of dramatic victories across Germany.', 'range', 1630, 1632, '#10b981'),
  ('a0000000-0000-0000-0000-00000000025f', 'Activities', 'Battle of Breitenfeld', 'Won a decisive victory at Breitenfeld in 1631 — the first major Protestant victory of the Thirty Years'' War — turning the tide of the conflict.', 'point', 1631, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000025f', 'Health', 'Killed at Battle of Lützen', 'Died on 16 November 1632 during the Battle of Lützen; charged into the thick of battle and was shot and killed, mourned across Protestant Europe.', 'point', 1632, null, '#ef4444'),

  -- Queen Christina (260)
  ('a0000000-0000-0000-0000-000000000260', 'Place & Travel', 'Born in Stockholm', 'Born in Stockholm on 18 December 1626; her father Gustavus Adolphus was so delighted he initially believed she was a boy.', 'point', 1626, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000260', 'Work & Education', 'Became Queen of Sweden', 'Succeeded her father at age six; ruled under a regency led by Chancellor Axel Oxenstierna until 1644 when she assumed full power.', 'point', 1632, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000260', 'Activities', 'Patron of arts and philosophy', 'Invited leading European intellectuals to Stockholm, including René Descartes, who died shortly after arrival from pneumonia contracted during Swedish winter tutoring sessions.', 'range', 1644, 1654, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000260', 'Work & Education', 'Abdicated the throne', 'Abdicated in 1654, shocking all of Europe; refused marriage and the pressure of rule, ceding the throne to her cousin Charles X Gustav.', 'point', 1654, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000260', 'Place & Travel', 'Moved to Rome', 'Converted to Catholicism and moved to Rome in 1655, becoming one of the most prominent women in Europe outside of a throne.', 'range', 1655, 1689, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000260', 'Activities', 'Founded Accademia Reale', 'Founded the Accademia Reale in Rome, a forerunner of the Accademia dell''Arcadia; became a powerful cultural patron in the papal city.', 'point', 1674, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000260', 'Place & Travel', 'Died in Rome', 'Died in Rome on 19 April 1689 and was buried in St. Peter''s Basilica — one of only three women so honoured.', 'point', 1689, null, '#3b82f6'),

  -- Charles XII (261)
  ('a0000000-0000-0000-0000-000000000261', 'Work & Education', 'Became King at 15', 'Became King of Sweden in 1697 at age 15 following his father''s sudden death; assumed personal rule despite his young age.', 'point', 1697, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000261', 'Activities', 'Battle of Narva', 'Led a Swedish army of 8,000 to a stunning victory over a Russian force of 40,000 at Narva in 1700, establishing his reputation as a military genius.', 'point', 1700, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000261', 'Activities', 'Great Northern War campaigns', 'Led Sweden through years of warfare against a coalition of Denmark, Saxony-Poland, and Russia; won repeated victories but overextended Swedish forces across Europe.', 'range', 1700, 1709, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000261', 'Health', 'Disaster at Poltava', 'Suffered a catastrophic defeat at Poltava in 1709 at the hands of Peter the Great; the Swedish empire never recovered; Charles fled to the Ottoman Empire.', 'point', 1709, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000261', 'Place & Travel', 'Exile in Ottoman Empire', 'Lived in Ottoman Bender (now Moldova) for five years as a guest-prisoner of the Sultan; refused to return to Sweden until forced out.', 'range', 1709, 1714, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000261', 'Health', 'Killed at Fredriksten', 'Shot dead at the siege of Fredriksten fortress in Norway on 30 November 1718; the bullet''s origin — Swedish or enemy — remains debated.', 'point', 1718, null, '#ef4444'),

  -- Carl Linnaeus (262)
  ('a0000000-0000-0000-0000-000000000262', 'Place & Travel', 'Born in Råshult, Småland', 'Born on 23 May 1707 in Råshult; grew up surrounded by his father''s garden, developing a passion for plants from childhood.', 'point', 1707, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000262', 'Work & Education', 'Studies at Uppsala University', 'Enrolled at Uppsala University in 1728; came under the patronage of Professor Olof Celsius and began botanical research.', 'range', 1728, 1732, '#10b981'),
  ('a0000000-0000-0000-0000-000000000262', 'Activities', 'Lapland expedition', 'Undertook an 8-month, 4,600-km solo journey through Lapland in 1732 on behalf of the Royal Society of Sciences; documented hundreds of species.', 'range', 1732, 1732, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000262', 'Work & Education', 'Systema Naturae published', 'Published Systema Naturae in 1735, first laying out his hierarchical classification system for all living things; would be expanded through 12 editions.', 'point', 1735, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000262', 'Work & Education', 'Species Plantarum', 'Published Species Plantarum in 1753, standardising binomial nomenclature for plants — the formal starting point of modern botanical nomenclature.', 'point', 1753, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000262', 'Work & Education', 'Professor at Uppsala', 'Served as professor at Uppsala University from 1741; transformed it into one of Europe''s leading centres for natural history.', 'range', 1741, 1778, '#10b981'),
  ('a0000000-0000-0000-0000-000000000262', 'Activities', 'Knighted and ennobled', 'Knighted in 1757 and ennobled as Carl von Linné in 1761 in recognition of his scientific achievements.', 'point', 1761, null, '#f59e0b'),

  -- Anders Celsius (263)
  ('a0000000-0000-0000-0000-000000000263', 'Place & Travel', 'Born in Uppsala', 'Born on 27 November 1701 in Uppsala into a family of academics; father and grandfathers were all professors at Uppsala University.', 'point', 1701, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000263', 'Work & Education', 'Professor of Astronomy at Uppsala', 'Appointed professor of astronomy at Uppsala University in 1730; taught there for the rest of his life.', 'range', 1730, 1744, '#10b981'),
  ('a0000000-0000-0000-0000-000000000263', 'Place & Travel', 'European scientific tour', 'Travelled to Germany, Italy, France, and England 1732–1736 to work with leading European astronomers and observe the northern lights.', 'range', 1732, 1736, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000263', 'Activities', 'Arctic expedition to measure Earth', 'Joined the French-led Lapland expedition of 1736 to measure the length of a degree of meridian arc, confirming Newton''s theory that the Earth is flattened at the poles.', 'point', 1736, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000263', 'Work & Education', 'Proposed Celsius temperature scale', 'In 1742 proposed a centigrade temperature scale with 0° at boiling and 100° at freezing; the scale was inverted after his death by Linnaeus to its familiar form.', 'point', 1742, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000263', 'Health', 'Died of tuberculosis', 'Died of tuberculosis on 25 April 1744 at only 42; Uppsala Observatory, which he had built, was renamed the Celsius Observatory in his honour.', 'point', 1744, null, '#ef4444'),

  -- Emanuel Swedenborg (264)
  ('a0000000-0000-0000-0000-000000000264', 'Work & Education', 'Engineering and scientific career', 'Worked as an assessor on the Swedish Board of Mines for decades while producing pioneering works on crystallography, metallurgy, and mathematics.', 'range', 1716, 1744, '#10b981'),
  ('a0000000-0000-0000-0000-000000000264', 'Activities', 'Opera Philosophica et Mineralia', 'Published his three-volume Opera Philosophica et Mineralia in 1734, a masterwork combining philosophy and the science of metals.', 'point', 1734, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000264', 'Health', 'Spiritual crisis and visions', 'Experienced a profound spiritual crisis in 1744–1745 including vivid dreams and visions of Heaven and Hell; interpreted as a divine calling to write theology.', 'range', 1744, 1745, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000264', 'Work & Education', 'Theological writings', 'Devoted the second half of his life to theology, writing 30 volumes including Heaven and Hell and Arcana Caelestia, describing the spiritual world in extraordinary detail.', 'range', 1745, 1772, '#10b981'),
  ('a0000000-0000-0000-0000-000000000264', 'Place & Travel', 'Died in London', 'Died in London on 29 March 1772; his teachings eventually inspired the New Church denomination founded by his followers.', 'point', 1772, null, '#3b82f6'),

  -- Alfred Nobel (265)
  ('a0000000-0000-0000-0000-000000000265', 'Place & Travel', 'Born in Stockholm', 'Born in Stockholm on 21 October 1833; family moved to St. Petersburg in 1842 where his father ran an engineering business for the Russian military.', 'point', 1833, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000265', 'Work & Education', 'Chemistry studies in Paris and USA', 'Studied chemistry in Paris and briefly in the USA, learning under prominent chemists; became fascinated with nitroglycerin.', 'range', 1850, 1856, '#10b981'),
  ('a0000000-0000-0000-0000-000000000265', 'Work & Education', 'Invented dynamite', 'Patented dynamite in 1867 — a stabilised form of nitroglycerin mixed with diatomite — making explosives far safer to transport and use; transformed construction and mining worldwide.', 'point', 1867, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000265', 'Assets', 'Built industrial empire', 'Established more than 90 factories and laboratories in 20 countries; by the time of his death held 355 patents and had amassed a vast fortune.', 'range', 1867, 1896, '#8b5cf6'),
  ('a0000000-0000-0000-0000-000000000265', 'Health', 'Troubled by legacy', 'Shaken by a premature obituary in 1888 calling him "the merchant of death"; reflected deeply on the destructive uses of his inventions.', 'point', 1888, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000265', 'Items', 'Nobel Prizes established in will', 'Signed his final will in 1895 leaving the bulk of his estate to fund prizes in Physics, Chemistry, Medicine, Literature, and Peace — awarded annually since 1901.', 'point', 1895, null, '#64748b'),
  ('a0000000-0000-0000-0000-000000000265', 'Place & Travel', 'Died in San Remo', 'Died of a cerebral haemorrhage at his villa in San Remo, Italy, on 10 December 1896 — the date now used for the Nobel Prize ceremonies.', 'point', 1896, null, '#3b82f6'),

  -- August Strindberg (266)
  ('a0000000-0000-0000-0000-000000000266', 'Place & Travel', 'Born in Stockholm', 'Born on 22 January 1849 in Stockholm into a troubled middle-class family; childhood marked by poverty and emotional turbulence.', 'point', 1849, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000266', 'Work & Education', 'The Red Room published', 'Published The Red Room in 1879, a satirical novel attacking Swedish bourgeois society; considered the first modern Swedish novel.', 'point', 1879, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000266', 'Work & Education', 'Miss Julie and The Father', 'Wrote his key naturalist dramas — The Father (1887) and Miss Julie (1888) — which shocked Scandinavian audiences with their frank depictions of class and gender conflict.', 'range', 1887, 1888, '#10b981'),
  ('a0000000-0000-0000-0000-000000000266', 'Relations & Family', 'Three turbulent marriages', 'Married three times — to Siri von Essen, Frida Uhl, and Harriet Bosse — each ending in separation; his difficult relationships fuelled much of his writing.', 'range', 1877, 1904, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000266', 'Health', 'Inferno crisis', 'Suffered a major psychological breakdown in Paris 1894–1896, which he called his "Inferno"; experimented with alchemy and suffered paranoid episodes.', 'range', 1894, 1896, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000266', 'Work & Education', 'Expressionist later works', 'Wrote visionary expressionist plays including A Dream Play (1902) and The Ghost Sonata (1907) that prefigured 20th-century absurdist theatre.', 'range', 1898, 1909, '#10b981'),
  ('a0000000-0000-0000-0000-000000000266', 'Place & Travel', 'Died in Stockholm', 'Died of stomach cancer in Stockholm on 14 May 1912; mourned as Sweden''s greatest literary figure.', 'point', 1912, null, '#3b82f6'),

  -- Selma Lagerlöf (267)
  ('a0000000-0000-0000-0000-000000000267', 'Place & Travel', 'Born in Mårbacka, Värmland', 'Born on 20 November 1858 at Mårbacka estate in Värmland; the landscape and folk tales of the region permeate her fiction.', 'point', 1858, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000267', 'Work & Education', 'Teaching career', 'Worked as a school teacher for a decade from 1885 while writing in her spare time; teaching shaped her understanding of narrative and her readers.', 'range', 1885, 1895, '#10b981'),
  ('a0000000-0000-0000-0000-000000000267', 'Work & Education', 'Gösta Berlings Saga', 'Debut novel Gösta Berlings Saga published in 1891 to great acclaim; the romantic tale of a defrocked priest won her immediate literary attention.', 'point', 1891, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000267', 'Items', 'Wonderful Adventures of Nils', 'Commissioned by the Swedish National Teachers'' Association to write a geography primer; created The Wonderful Adventures of Nils (1906–07), which became a Swedish classic read by generations of children.', 'range', 1906, 1907, '#64748b'),
  ('a0000000-0000-0000-0000-000000000267', 'Work & Education', 'Nobel Prize in Literature', 'In 1909 became the first woman to win the Nobel Prize in Literature; the prize money allowed her to buy back the family estate at Mårbacka.', 'point', 1909, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000267', 'Assets', 'Bought back Mårbacka', 'Used Nobel Prize money to repurchase Mårbacka in 1907; expanded the estate over the years and lived there for the rest of her life.', 'point', 1907, null, '#8b5cf6'),
  ('a0000000-0000-0000-0000-000000000267', 'Activities', 'Helped Jews escape Nazi Germany', 'Used her international fame to help the German-Jewish author Nelly Sachs escape from Nazi Germany to Sweden in 1940.', 'point', 1940, null, '#f59e0b'),

  -- Jenny Lind (268)
  ('a0000000-0000-0000-0000-000000000268', 'Place & Travel', 'Born in Stockholm', 'Born on 6 October 1820 in Stockholm to an unmarried mother; grew up in poverty before her vocal talent was discovered.', 'point', 1820, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000268', 'Work & Education', 'Training at Royal Theatre', 'Accepted for voice training by the Royal Theatre of Stockholm at age 17; studied in Paris under Manuel García, transforming her voice completely.', 'range', 1838, 1841, '#10b981'),
  ('a0000000-0000-0000-0000-000000000268', 'Work & Education', 'European opera career', 'Performed to rapturous acclaim across Europe, including Vienna, London, and Berlin; became a close friend of Felix Mendelssohn who wrote for her.', 'range', 1844, 1849, '#10b981'),
  ('a0000000-0000-0000-0000-000000000268', 'Activities', 'American tour with P.T. Barnum', 'P.T. Barnum brought her to the United States in 1850 for a 93-concert tour; audiences were frenzied, creating "Lind mania" — an early example of celebrity culture.', 'range', 1850, 1852, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000268', 'Relations & Family', 'Married Otto Goldschmidt', 'Married German pianist and conductor Otto Goldschmidt in 1852; settled in England and had three children.', 'point', 1852, null, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000268', 'Activities', 'Philanthropy', 'Donated generously throughout her life to musical scholarships and charities in Sweden and England; funded the Jenny Lind professorship at the Royal Academy of Music.', 'range', 1850, 1887, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000268', 'Place & Travel', 'Died in England', 'Died on 2 November 1887 in Malvern, England; buried in Great Malvern Priory Cemetery.', 'point', 1887, null, '#3b82f6'),

  -- Hjalmar Branting (269)
  ('a0000000-0000-0000-0000-000000000269', 'Place & Travel', 'Born in Stockholm', 'Born on 23 November 1860 in Stockholm into an intellectual family; his father was a respected gymnastics teacher.', 'point', 1860, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000269', 'Work & Education', 'Co-founded Social Democratic Party', 'Co-founded the Swedish Social Democratic Party in 1889; served as its first leader and the dominant force in Swedish labour politics for decades.', 'point', 1889, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000269', 'Work & Education', 'Editor of Social-Demokraten', 'Edited the party newspaper Social-Demokraten for years, using journalism as a tool for political education and mobilisation.', 'range', 1886, 1908, '#10b981'),
  ('a0000000-0000-0000-0000-000000000269', 'Work & Education', 'First Social Democrat in parliament', 'Elected to the Swedish parliament in 1896 as the first Social Democratic MP, beginning the party''s political ascent.', 'point', 1896, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000269', 'Work & Education', 'Prime Minister three times', 'Served as Prime Minister of Sweden in 1920, 1921–1923, and 1924–1925; led Sweden''s first Social Democratic governments.', 'range', 1920, 1925, '#10b981'),
  ('a0000000-0000-0000-0000-000000000269', 'Activities', 'Nobel Peace Prize', 'Awarded the Nobel Peace Prize in 1921 jointly with Christian Lange for his work in international reconciliation through the League of Nations.', 'point', 1921, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000269', 'Health', 'Died in Stockholm', 'Died on 24 February 1925 in Stockholm; mourned across the Swedish labour movement as its founding father.', 'point', 1925, null, '#ef4444'),

  -- Axel Oxenstierna (26a)
  ('a0000000-0000-0000-0000-00000000026a', 'Work & Education', 'Entered royal council', 'Entered service of King Charles IX around 1609; quickly became indispensable as an administrator and diplomat.', 'point', 1609, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000026a', 'Work & Education', 'Lord High Chancellor of Sweden', 'Appointed Chancellor of Sweden by Gustavus Adolphus in 1612; held the post for over 40 years through the reigns of three monarchs.', 'range', 1612, 1654, '#10b981'),
  ('a0000000-0000-0000-0000-00000000026a', 'Work & Education', 'Ran Sweden during Thirty Years'' War', 'Effectively governed Sweden after Gustavus Adolphus entered Germany; coordinated Sweden''s military campaigns and diplomatic relationships across Europe.', 'range', 1630, 1648, '#10b981'),
  ('a0000000-0000-0000-0000-00000000026a', 'Work & Education', 'Regent for Queen Christina', 'Served as head of the regency council for the young Queen Christina from 1632 to 1644; maintained Swedish power during her minority.', 'range', 1632, 1644, '#10b981'),
  ('a0000000-0000-0000-0000-00000000026a', 'Activities', 'Peace of Westphalia', 'Helped negotiate the Peace of Westphalia in 1648 ending the Thirty Years'' War; secured significant territorial gains for Sweden, establishing it as a great European power.', 'point', 1648, null, '#f59e0b'),

  -- Raoul Wallenberg (26b)
  ('a0000000-0000-0000-0000-00000000026b', 'Place & Travel', 'Born in Lidingö', 'Born on 4 August 1912 in Lidingö near Stockholm; father died before his birth; grew up with his grandfather''s guidance.', 'point', 1912, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000026b', 'Work & Education', 'Architecture studies in USA', 'Studied architecture at the University of Michigan 1931–1935, graduating with honours; travelled widely across the USA.', 'range', 1931, 1935, '#10b981'),
  ('a0000000-0000-0000-0000-00000000026b', 'Work & Education', 'Banking and trade career', 'Worked in trade and banking in Cape Town and Palestine before joining the Central European Trading Company in Stockholm.', 'range', 1936, 1944, '#10b981'),
  ('a0000000-0000-0000-0000-00000000026b', 'Activities', 'Budapest mission to save Jews', 'Sent to Budapest in July 1944 as first secretary of the Swedish legation with a special US-backed mission to save Hungarian Jews facing deportation to Auschwitz.', 'range', 1944, 1945, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000026b', 'Items', 'Schutzpass programme', 'Issued thousands of Swedish protective passports (Schutzpässe) and set up Swedish-protected safe houses; estimated to have saved 10,000–100,000 lives.', 'range', 1944, 1945, '#64748b'),
  ('a0000000-0000-0000-0000-00000000026b', 'Health', 'Arrested by Soviets', 'Arrested by Soviet forces on 17 January 1945 and taken to Moscow; officially reported as having died in Lubyanka prison in 1947 though the true circumstances remain disputed.', 'point', 1945, null, '#ef4444'),

  -- Dag Hammarskjöld (26c)
  ('a0000000-0000-0000-0000-00000000026c', 'Place & Travel', 'Born in Jönköping', 'Born on 29 July 1905 in Jönköping; son of Hjalmar Hammarskjöld, Prime Minister of Sweden during World War I.', 'point', 1905, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000026c', 'Work & Education', 'Economics and law degrees', 'Earned degrees in law and economics from Uppsala and Stockholm universities; a brilliant student who became under-secretary at the Ministry of Finance.', 'range', 1923, 1936, '#10b981'),
  ('a0000000-0000-0000-0000-00000000026c', 'Work & Education', 'Swedish civil service', 'Served in senior positions in the Swedish Ministry of Finance and Foreign Ministry; represented Sweden at international economic conferences.', 'range', 1936, 1953, '#10b981'),
  ('a0000000-0000-0000-0000-00000000026c', 'Work & Education', 'UN Secretary-General', 'Elected UN Secretary-General in 1953; transformed the role into a proactive force for international peace, acting independently in crises from Suez to the Congo.', 'range', 1953, 1961, '#10b981'),
  ('a0000000-0000-0000-0000-00000000026c', 'Activities', 'Suez Crisis mediation', 'Played a central role in resolving the 1956 Suez Crisis, establishing the first UN peacekeeping force — UNEF — to oversee the ceasefire.', 'point', 1956, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000026c', 'Health', 'Died in Congo plane crash', 'Killed on 18 September 1961 when his plane crashed near Ndola in Northern Rhodesia while flying to negotiate a ceasefire in the Congo Crisis.', 'point', 1961, null, '#ef4444'),
  ('a0000000-0000-0000-0000-00000000026c', 'Activities', 'Nobel Peace Prize — posthumous', 'Awarded the Nobel Peace Prize posthumously in 1961; Markings, his personal spiritual diary, was published after his death and revealed a deeply contemplative inner life.', 'point', 1961, null, '#f59e0b'),

  -- Olof Palme (26d)
  ('a0000000-0000-0000-0000-00000000026d', 'Place & Travel', 'Born in Stockholm', 'Born on 30 January 1927 into an upper-class Stockholm family; father died when he was six.', 'point', 1927, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000026d', 'Work & Education', 'Studied at Kenyon College, USA', 'Studied at Kenyon College in Ohio 1947–1948 on a student visa; travelled across the United States and was struck by racial segregation and poverty.', 'range', 1947, 1948, '#10b981'),
  ('a0000000-0000-0000-0000-00000000026d', 'Work & Education', 'Entered politics', 'Joined the Social Democratic Party and became Tage Erlander''s personal political secretary in 1953; rose rapidly through party ranks.', 'range', 1953, 1969, '#10b981'),
  ('a0000000-0000-0000-0000-00000000026d', 'Activities', 'Anti-Vietnam War stance', 'Publicly condemned the Vietnam War including marching alongside the North Vietnamese ambassador in Stockholm in 1968; summoned the US ambassador to protest.', 'range', 1965, 1972, '#f59e0b'),
  ('a0000000-0000-0000-0000-00000000026d', 'Work & Education', 'Prime Minister 1969–1976', 'Became Prime Minister in 1969 at age 42; led an ambitious reform programme expanding the Swedish welfare state.', 'range', 1969, 1976, '#10b981'),
  ('a0000000-0000-0000-0000-00000000026d', 'Work & Education', 'Prime Minister again 1982–1986', 'Returned as Prime Minister in 1982; continued social reform and was a prominent voice in international disarmament efforts.', 'range', 1982, 1986, '#10b981'),
  ('a0000000-0000-0000-0000-00000000026d', 'Health', 'Assassinated in Stockholm', 'Shot and killed on Sveavägen in central Stockholm on 28 February 1986 while walking home from the cinema with his wife; the murder has never been definitively solved.', 'point', 1986, null, '#ef4444'),

  -- Ingmar Bergman (26e)
  ('a0000000-0000-0000-0000-00000000026e', 'Place & Travel', 'Born in Uppsala', 'Born on 14 July 1918 in Uppsala; father was a Lutheran pastor whose strict religious upbringing deeply influenced Bergman''s later preoccupations with faith and mortality.', 'point', 1918, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000026e', 'Work & Education', 'Theatre directing career', 'Began directing theatre in the late 1930s; became director of the Malmö City Theatre 1952–1958, one of Scandinavia''s most important theatrical posts.', 'range', 1938, 1960, '#10b981'),
  ('a0000000-0000-0000-0000-00000000026e', 'Work & Education', 'The Seventh Seal', 'Released The Seventh Seal in 1957 — a medieval allegory of Death playing chess with a knight — to international acclaim; established him as a world-class filmmaker.', 'point', 1957, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000026e', 'Work & Education', 'Golden period of filmmaking', 'Directed a series of masterpieces including Wild Strawberries (1957), Persona (1966), Cries and Whispers (1972), and Scenes from a Marriage (1973).', 'range', 1957, 1973, '#10b981'),
  ('a0000000-0000-0000-0000-00000000026e', 'Work & Education', 'Fanny and Alexander', 'Directed Fanny and Alexander in 1982, winning four Academy Awards; described it as his final film though he continued working in theatre and television.', 'point', 1982, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000026e', 'Relations & Family', 'Five marriages', 'Married five times and had nine children; his personal life was as turbulent as his art.', 'range', 1943, 1995, '#ec4899'),
  ('a0000000-0000-0000-0000-00000000026e', 'Place & Travel', 'Died on Fårö island', 'Spent his last decades in self-imposed exile on the remote island of Fårö in the Baltic; died there on 30 July 2007, the same day as his compatriot Michelangelo Antonioni.', 'point', 2007, null, '#3b82f6'),

  -- Greta Garbo (26f)
  ('a0000000-0000-0000-0000-00000000026f', 'Place & Travel', 'Born in Stockholm', 'Born Greta Lovisa Gustafsson on 18 September 1905 in a working-class Stockholm neighbourhood; father died when she was 14.', 'point', 1905, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000026f', 'Work & Education', 'Stockholm film industry', 'Attended the Royal Dramatic Theatre training school in Stockholm; discovered by director Mauritz Stiller who gave her the name Garbo.', 'range', 1922, 1925, '#10b981'),
  ('a0000000-0000-0000-0000-00000000026f', 'Place & Travel', 'Moved to Hollywood', 'Moved to Hollywood under MGM contract in 1925; initially struggled with language barrier but became a major star of the silent era.', 'range', 1925, 1941, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000026f', 'Work & Education', 'Hollywood star of the 1930s', 'Starred in Grand Hotel (1932), Queen Christina (1933), Anna Karenina (1935), and Ninotchka (1939); her mystique and screen presence made her the most famous woman in the world.', 'range', 1932, 1941, '#10b981'),
  ('a0000000-0000-0000-0000-00000000026f', 'Work & Education', 'Retired from acting', 'Retired from the screen in 1941 at age 35 after the failure of Two-Faced Woman; never made another film despite many attempts to entice her back.', 'point', 1941, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000026f', 'Place & Travel', 'Reclusive life in New York', 'Lived a famously reclusive life in a Manhattan apartment for nearly 50 years, rarely giving interviews; became a symbol of celebrity mystique.', 'range', 1941, 1990, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000026f', 'Health', 'Died in New York', 'Died on 15 April 1990 in New York from pneumonia and renal failure; left her $32 million estate to her niece.', 'point', 1990, null, '#ef4444'),

  -- Ingrid Bergman (270)
  ('a0000000-0000-0000-0000-000000000270', 'Place & Travel', 'Born in Stockholm', 'Born on 29 August 1915 in Stockholm; lost her mother at age three and father at 12; raised by relatives.', 'point', 1915, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000270', 'Work & Education', 'Royal Dramatic Theatre School', 'Enrolled at the Royal Dramatic Theatre School in Stockholm in 1933; made her Swedish film debut the same year.', 'range', 1933, 1938, '#10b981'),
  ('a0000000-0000-0000-0000-000000000270', 'Work & Education', 'Hollywood career begins', 'Went to Hollywood in 1939 under a David O. Selznick contract; her naturalness and beauty made her an immediate sensation.', 'range', 1939, 1949, '#10b981'),
  ('a0000000-0000-0000-0000-000000000270', 'Work & Education', 'Casablanca and Gaslight', 'Starred in Casablanca (1942) and won her first Academy Award for Gaslight (1944); became one of Hollywood''s biggest stars.', 'range', 1942, 1944, '#10b981'),
  ('a0000000-0000-0000-0000-000000000270', 'Relations & Family', 'Affair with Rossellini — Hollywood scandal', 'Her affair with Italian director Roberto Rossellini — while still married — caused a massive scandal; denounced on the US Senate floor; moved to Italy.', 'range', 1949, 1957, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000270', 'Work & Education', 'Second Oscar — Anastasia', 'Won her second Academy Award for Anastasia (1956), signalling her rehabilitation in Hollywood after the Rossellini scandal.', 'point', 1956, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000270', 'Work & Education', 'Third Oscar — Murder on the Orient Express', 'Won a third Academy Award for Best Supporting Actress in Murder on the Orient Express (1974).', 'point', 1974, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000270', 'Health', 'Died on her birthday', 'Died of breast cancer on 29 August 1982 — her 67th birthday — in London.', 'point', 1982, null, '#ef4444'),

  -- Astrid Lindgren (271)
  ('a0000000-0000-0000-0000-000000000271', 'Place & Travel', 'Born in Vimmerby, Småland', 'Born on 14 November 1907 on a farm near Vimmerby; a happy rural childhood provided the imaginative foundation for her later writing.', 'point', 1907, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000271', 'Place & Travel', 'Moved to Stockholm', 'Moved to Stockholm in 1926 after an unmarried pregnancy; raised her son Lasse alone before marrying Sture Lindgren in 1931.', 'point', 1926, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000271', 'Work & Education', 'Pippi Longstocking published', 'Published Pippi Långstrump (Pippi Longstocking) in 1945 after her daughter Karin asked for a story; the anarchic, independent girl became an international phenomenon.', 'point', 1945, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000271', 'Work & Education', 'Editor at Rabén & Sjögren', 'Worked as an editor at the Swedish publisher Rabén & Sjögren for decades; championed Swedish children''s literature from inside the publishing industry.', 'range', 1946, 1970, '#10b981'),
  ('a0000000-0000-0000-0000-000000000271', 'Items', 'Dozens of beloved books', 'Wrote over 30 books including Emil of Lönneberga, Karlsson-on-the-Roof, and Ronja Rövardotter; total sales exceed 165 million copies in over 100 languages.', 'range', 1945, 1995, '#64748b'),
  ('a0000000-0000-0000-0000-000000000271', 'Activities', 'Anti-tax protest', 'In 1976 wrote a satirical fairy tale "Pomperipossa in Monismania" protesting Sweden''s 102% marginal tax rate; helped bring down the Social Democratic government in that year''s election.', 'point', 1976, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000271', 'Health', 'Died in Stockholm', 'Died on 28 January 2002 in Stockholm aged 94; mourned across Sweden as a national treasure; the Astrid Lindgren Memorial Award is the world''s largest children''s literature prize.', 'point', 2002, null, '#ef4444'),

  -- Björn Borg (272)
  ('a0000000-0000-0000-0000-000000000272', 'Place & Travel', 'Born in Södertälje', 'Born on 6 June 1956 in Södertälje; father gave him a tennis racket as a prize for winning a table tennis tournament.', 'point', 1956, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000272', 'Work & Education', 'Turned professional at 16', 'Turned professional in 1972 at age 16; made his Davis Cup debut for Sweden the same year, inspiring a generation of Swedish tennis players.', 'point', 1972, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000272', 'Activities', 'Five consecutive Wimbledon titles', 'Won Wimbledon five consecutive times from 1976 to 1980; his rivalry with John McEnroe produced some of the most dramatic matches in the sport''s history.', 'range', 1976, 1980, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000272', 'Activities', 'Six French Open titles', 'Won the French Open six times between 1974 and 1981; his mastery of clay demonstrated a versatility rare among champions of the era.', 'range', 1974, 1981, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000272', 'Work & Education', 'Retired at 26', 'Retired from professional tennis in 1983 at age 26; a shocking decision at the height of his powers that puzzled the sporting world.', 'point', 1983, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000272', 'Work & Education', 'Björn Borg fashion label', 'Founded the Björn Borg underwear and sportswear brand in 1989; grew it into a publicly listed Scandinavian fashion company.', 'range', 1989, 2026, '#10b981'),

  -- Zlatan Ibrahimović (273)
  ('a0000000-0000-0000-0000-000000000273', 'Place & Travel', 'Born in Malmö', 'Born on 3 October 1981 in Malmö; grew up in the working-class Rosengård neighbourhood; parents were Bosnian and Croatian immigrants.', 'point', 1981, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000273', 'Work & Education', 'Malmö FF and Ajax', 'Started at Malmö FF before joining Ajax in 2001; became a key player and won the Eredivisie title.', 'range', 1999, 2004, '#10b981'),
  ('a0000000-0000-0000-0000-000000000273', 'Work & Education', 'Juventus and Inter Milan', 'Moved to Juventus in 2004 then Inter Milan in 2006; won four consecutive Serie A titles and was voted Swedish Footballer of the Year eight times.', 'range', 2004, 2009, '#10b981'),
  ('a0000000-0000-0000-0000-000000000273', 'Work & Education', 'Barcelona, AC Milan, PSG', 'Had a troubled one year at Barcelona under Guardiola; then to AC Milan, then became PSG''s biggest star, winning four Ligue 1 titles.', 'range', 2009, 2016, '#10b981'),
  ('a0000000-0000-0000-0000-000000000273', 'Work & Education', 'Manchester United and LA Galaxy', 'Joined Manchester United in 2016; moved to LA Galaxy in 2018 where he became a cult hero before returning to AC Milan then retiring in 2023.', 'range', 2016, 2023, '#10b981'),
  ('a0000000-0000-0000-0000-000000000273', 'Activities', 'Swedish international career', 'Scored 62 goals in 120 appearances for Sweden — the all-time national record; retired from international football in 2016, then returned 2021–2022.', 'range', 2001, 2022, '#f59e0b'),

  -- Greta Thunberg (274)
  ('a0000000-0000-0000-0000-000000000274', 'Place & Travel', 'Born in Stockholm', 'Born on 3 January 2003 in Stockholm; daughter of opera singer Malena Ernman and actor Svante Thunberg.', 'point', 2003, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000274', 'Activities', 'School strike for climate', 'On 20 August 2018 began sitting outside the Swedish parliament with a handmade sign reading "Skolstrejk för klimatet" (School strike for the climate); did not return to school until Sweden held a general election.', 'point', 2018, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000274', 'Activities', 'Fridays for Future movement', 'Her weekly strikes inspired millions of students globally; the Fridays for Future movement she catalysed organised a global climate strike in September 2019 with over 4 million participants.', 'range', 2018, 2026, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000274', 'Activities', 'COP24 and UN speeches', 'Addressed world leaders at COP24 in Katowice (2018) and the UN Climate Action Summit in New York (2019), delivering the iconic "How dare you" speech.', 'range', 2018, 2019, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000274', 'Activities', 'Time Person of the Year 2019', 'Named Time magazine''s Person of the Year for 2019 — the youngest individual ever to receive the honour.', 'point', 2019, null, '#f59e0b'),

  -- Avicii (275)
  ('a0000000-0000-0000-0000-000000000275', 'Place & Travel', 'Born in Stockholm', 'Born Tim Bergling on 8 September 1989 in Stockholm; began producing electronic music on his laptop as a teenager.', 'point', 1989, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000275', 'Work & Education', 'Levels and international breakthrough', 'Released Levels in 2011; the euphoric track became one of the defining songs of the EDM era and launched him to global stardom.', 'point', 2011, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000275', 'Work & Education', 'Wake Me Up — massive hit', 'Wake Me Up (2013) fused country and EDM, reaching number one in 22 countries; challenged genre boundaries and expanded his audience hugely.', 'point', 2013, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000275', 'Health', 'Acute pancreatitis', 'Suffered severe acute pancreatitis from 2012 onwards due to heavy alcohol consumption; had emergency gallbladder surgery in 2014; health deteriorated steadily.', 'range', 2012, 2016, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000275', 'Work & Education', 'Retired from touring', 'Publicly retired from live touring in 2016 citing health reasons; continued producing music remotely.', 'point', 2016, null, '#10b981'),
  ('a0000000-0000-0000-0000-000000000275', 'Health', 'Died in Muscat, Oman', 'Found dead in Muscat, Oman on 20 April 2018 aged 28; death ruled a suicide; mourned worldwide.', 'point', 2018, null, '#ef4444'),

  -- Stieg Larsson (276)
  ('a0000000-0000-0000-0000-000000000276', 'Place & Travel', 'Born in Skellefteå', 'Born on 4 August 1954 in Skellefteå; raised partly by his grandparents in northern Sweden.', 'point', 1954, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000276', 'Work & Education', 'Journalism and anti-fascism', 'Worked as a journalist and graphic designer; co-founded Expo magazine in 1995, a publication monitoring Swedish neo-Nazi and far-right movements.', 'range', 1977, 2004, '#10b981'),
  ('a0000000-0000-0000-0000-000000000276', 'Items', 'Millennium trilogy written', 'Wrote The Girl with the Dragon Tattoo, The Girl Who Played with Fire, and The Girl Who Kicked the Hornets'' Nest in his evenings; submitted all three to a publisher shortly before his death.', 'range', 2001, 2004, '#64748b'),
  ('a0000000-0000-0000-0000-000000000276', 'Health', 'Died before publication', 'Died of a heart attack on 9 November 2004 aged 50; had received death threats for his anti-racist work. His books were published posthumously starting 2005.', 'point', 2004, null, '#ef4444'),
  ('a0000000-0000-0000-0000-000000000276', 'Activities', 'Posthumous global phenomenon', 'The Millennium trilogy sold over 100 million copies worldwide; spawned Swedish films, Hollywood adaptations, and a continuation series; among the best-selling series of the 21st century.', 'range', 2005, 2026, '#f59e0b'),

  -- Henning Mankell (277)
  ('a0000000-0000-0000-0000-000000000277', 'Place & Travel', 'Born in Stockholm', 'Born on 3 February 1948 in Stockholm; raised partly in Sveg, Härjedalen where his father was a judge.', 'point', 1948, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000277', 'Work & Education', 'Theatre director', 'Worked as a playwright and theatre director from the 1970s; led theatres in Sweden and Mozambique.', 'range', 1972, 1990, '#10b981'),
  ('a0000000-0000-0000-0000-000000000277', 'Work & Education', 'Wallander series begins', 'Published Faceless Killers in 1991, introducing Detective Kurt Wallander; the series became one of the most successful Scandinavian crime franchises ever.', 'range', 1991, 2009, '#10b981'),
  ('a0000000-0000-0000-0000-000000000277', 'Place & Travel', 'Based between Sweden and Mozambique', 'Split his life between Gothenburg and Maputo, Mozambique where he helped develop local theatre; an activist for Africa.', 'range', 1985, 2015, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000277', 'Health', 'Cancer diagnosis and death', 'Diagnosed with cancer in 2014; wrote openly about the experience in the memoir Quicksand; died in Gothenburg on 5 October 2015.', 'range', 2014, 2015, '#ef4444'),

  -- Agnetha Fältskog (278)
  ('a0000000-0000-0000-0000-000000000278', 'Place & Travel', 'Born in Jönköping', 'Born on 5 April 1950 in Jönköping; began writing songs and singing in local dance bands as a teenager.', 'point', 1950, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000278', 'Work & Education', 'Solo career and ABBA formation', 'Had a Swedish solo career from 1967 before ABBA formed in 1972; married Björn Ulvaeus in 1971.', 'range', 1967, 1972, '#10b981'),
  ('a0000000-0000-0000-0000-000000000278', 'Work & Education', 'ABBA years', 'As part of ABBA from 1972 to 1982 achieved global superstardom; her soprano voice and stage presence were central to the group''s image.', 'range', 1972, 1982, '#10b981'),
  ('a0000000-0000-0000-0000-000000000278', 'Relations & Family', 'Married and divorced Björn Ulvaeus', 'Married Björn Ulvaeus in 1971 and divorced in 1980; the breakup coincided with and influenced many of ABBA''s most emotionally resonant songs.', 'range', 1971, 1980, '#ec4899'),
  ('a0000000-0000-0000-0000-000000000278', 'Work & Education', 'Solo comeback', 'Released the album A (2013) after years of near-reclusion; collaborated with ABBA on the 2021 comeback album Voyage.', 'range', 2013, 2021, '#10b981'),

  -- Björn Ulvaeus (279)
  ('a0000000-0000-0000-0000-000000000279', 'Place & Travel', 'Born in Gothenburg', 'Born on 25 April 1945 in Gothenburg; raised in Västervik; began playing guitar in the folk group Hootenanny Singers.', 'point', 1945, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000279', 'Work & Education', 'ABBA co-founder and songwriter', 'Co-founded ABBA in 1972 with Benny Andersson, Agnetha Fältskog, and Anni-Frid Lyngstad; wrote or co-wrote all ABBA songs with Andersson.', 'range', 1972, 1982, '#10b981'),
  ('a0000000-0000-0000-0000-000000000279', 'Work & Education', 'Mamma Mia! musical', 'Co-created Mamma Mia! with Benny Andersson and playwright Catherine Johnson in 1999; became one of the longest-running musicals in West End and Broadway history and a blockbuster film franchise.', 'range', 1999, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-000000000279', 'Activities', 'ABBA Voyage comeback', 'Reunited with ABBA to record Voyage (2021), their first studio album in 40 years; accompanied by a revolutionary live ABBA avatar show in London.', 'point', 2021, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000279', 'Relations & Family', 'Married Lena Källersjö', 'Married journalist Lena Källersjö in 1981 after divorcing Agnetha; the relationship has lasted over 40 years.', 'point', 1981, null, '#ec4899'),

  -- Benny Andersson (27a)
  ('a0000000-0000-0000-0000-00000000027a', 'Place & Travel', 'Born in Stockholm', 'Born on 16 December 1946 in Stockholm; taught himself accordion and piano as a child; joined pop group The Hep Stars at 18.', 'point', 1946, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000027a', 'Work & Education', 'ABBA and global superstardom', 'Co-founded ABBA and served as primary composer alongside Björn Ulvaeus; his gift for melody and pop construction drove the group''s extraordinary commercial success.', 'range', 1972, 1982, '#10b981'),
  ('a0000000-0000-0000-0000-00000000027a', 'Work & Education', 'Musical Chess', 'Co-wrote the musical Chess with Ulvaeus and lyricist Tim Rice in 1984; while not a Broadway hit, the song One Night in Bangkok was a global hit.', 'point', 1984, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000027a', 'Work & Education', 'Kristina från Duvemåla', 'Composed Kristina från Duvemåla in 1995, a Swedish-language musical based on Vilhelm Moberg''s emigrant novels; considered a masterwork of Nordic musical theatre.', 'point', 1995, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000027a', 'Activities', 'Benny Anderssons Orkester', 'Founded the Benny Anderssons Orkester, a Swedish folk and dance band; performs widely and has released multiple albums celebrating Swedish folk music traditions.', 'range', 2001, 2026, '#f59e0b'),

  -- Anni-Frid Lyngstad (27b)
  ('a0000000-0000-0000-0000-00000000027b', 'Place & Travel', 'Born in Bjørkåsen, Norway', 'Born on 15 November 1945 in Bjørkåsen, Norway; daughter of a Norwegian woman and a German soldier; moved to Sweden with her grandmother at age two.', 'point', 1945, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000027b', 'Work & Education', 'Swedish pop and jazz career', 'Built a Swedish pop career through the 1960s before ABBA formed; known for her jazz-inflected phrasing and powerful mezzo-soprano voice.', 'range', 1963, 1972, '#10b981'),
  ('a0000000-0000-0000-0000-00000000027b', 'Work & Education', 'ABBA worldwide success', 'As part of ABBA 1972–1982 performed on some of the best-selling recordings in history; her voice provided the earthy, soulful counterpart to Agnetha Fältskog''s crystalline soprano.', 'range', 1972, 1982, '#10b981'),
  ('a0000000-0000-0000-0000-00000000027b', 'Work & Education', 'Solo album Something''s Going On', 'Released the acclaimed solo album Something''s Going On in 1982, produced by Phil Collins; contained the hit I Know There''s Something Going On.', 'point', 1982, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000027b', 'Relations & Family', 'Married German prince', 'Married Prince Heinrich Ruzzo of Reuss in 1992, becoming a German princess; lived between Switzerland and the UK; widowed in 1999.', 'range', 1992, 1999, '#ec4899'),

  -- Gunnar Myrdal (27c)
  ('a0000000-0000-0000-0000-00000000027c', 'Place & Travel', 'Born in Gustafs, Dalarna', 'Born on 6 December 1898 in Gustafs, Dalarna; studied law and economics at Stockholm University.', 'point', 1898, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000027c', 'Work & Education', 'An American Dilemma', 'Led a monumental Carnegie Corporation study on race relations in the USA; published An American Dilemma: The Negro Problem and American Democracy in 1944 — a landmark work cited in the Brown v. Board of Education Supreme Court ruling.', 'point', 1944, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000027c', 'Work & Education', 'UN Economic Commission for Europe', 'Served as Executive Secretary of the UN Economic Commission for Europe 1947–1957, rebuilding post-war European economic cooperation.', 'range', 1947, 1957, '#10b981'),
  ('a0000000-0000-0000-0000-00000000027c', 'Work & Education', 'Nobel Prize in Economics', 'Awarded the Nobel Prize in Economics in 1974 jointly with Friedrich Hayek; a politically odd pairing given their opposing views.', 'point', 1974, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000027c', 'Relations & Family', 'Partnership with Alva Myrdal', 'Lifelong intellectual and personal partner to Alva Myrdal; together they wrote Nation and Family (1934), shaping Swedish family and population policy.', 'range', 1924, 1986, '#ec4899'),

  -- Alva Myrdal (27d)
  ('a0000000-0000-0000-0000-00000000027d', 'Work & Education', 'Nation and Family', 'Co-wrote Nation and Family with Gunnar Myrdal in 1934; argued that the state should support families through universal social benefits — a cornerstone of the Swedish welfare state.', 'point', 1934, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000027d', 'Work & Education', 'UNESCO and UN roles', 'Directed UNESCO''s Department of Social Sciences 1950–1955 and served as Swedish Ambassador to India, then led Swedish disarmament negotiations at the UN.', 'range', 1950, 1973, '#10b981'),
  ('a0000000-0000-0000-0000-00000000027d', 'Work & Education', 'Minister for Disarmament', 'Served as Swedish Cabinet Minister for Disarmament 1967–1973; her book The Game of Disarmament (1976) was a devastating critique of superpower arms negotiations.', 'range', 1967, 1973, '#10b981'),
  ('a0000000-0000-0000-0000-00000000027d', 'Activities', 'Nobel Peace Prize', 'Awarded the Nobel Peace Prize in 1982 jointly with Alfonso García Robles for her tireless work on disarmament.', 'point', 1982, null, '#f59e0b'),

  -- Birgit Nilsson (27e)
  ('a0000000-0000-0000-0000-00000000027e', 'Place & Travel', 'Born in Västra Karup, Skåne', 'Born on 17 May 1918 on a farm in Västra Karup, Skåne; showed a powerful voice from childhood but nearly missed an audition at the Royal Academy of Music.', 'point', 1918, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000027e', 'Work & Education', 'Stockholm opera debut', 'Made her debut at the Royal Swedish Opera in Stockholm in 1946; her voice grew steadily more powerful under coaching.', 'point', 1946, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000027e', 'Work & Education', 'Bayreuth and Wagner dominance', 'Became the undisputed queen of Wagnerian soprano roles at Bayreuth from 1954; her Isolde, Brünnhilde, and Turandot were considered unsurpassable for power and stamina.', 'range', 1954, 1982, '#10b981'),
  ('a0000000-0000-0000-0000-00000000027e', 'Work & Education', 'Metropolitan Opera star', 'Debuted at the Metropolitan Opera in New York in 1959; became its biggest draw for Wagnerian roles for over two decades.', 'range', 1959, 1984, '#10b981'),
  ('a0000000-0000-0000-0000-00000000027e', 'Activities', 'Birgit Nilsson Prize', 'Her estate established the Birgit Nilsson Prize, one of the world''s largest music prizes at €1 million, awarded every few years to an outstanding classical musician.', 'point', 2009, null, '#f59e0b'),

  -- Tomas Tranströmer (27f)
  ('a0000000-0000-0000-0000-00000000027f', 'Place & Travel', 'Born in Stockholm', 'Born on 15 April 1931 in Stockholm; grew up in a single-parent home; spent long childhood summers in the Stockholm archipelago.', 'point', 1931, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-00000000027f', 'Work & Education', 'First poetry collection', 'Published his debut collection 17 Dikter (17 Poems) in 1954 at age 23 to immediate critical acclaim; heralded a new voice in Swedish poetry.', 'point', 1954, null, '#10b981'),
  ('a0000000-0000-0000-0000-00000000027f', 'Work & Education', 'Career as psychologist', 'Worked as a psychologist alongside his poetry writing throughout his career; the inner life of his patients informed his spare, compassionate verse.', 'range', 1960, 1990, '#10b981'),
  ('a0000000-0000-0000-0000-00000000027f', 'Health', 'Stroke limits speech', 'Suffered a severe stroke in 1990 that left him partially paralysed and largely unable to speak; he continued writing poetry and playing piano with one hand.', 'point', 1990, null, '#ef4444'),
  ('a0000000-0000-0000-0000-00000000027f', 'Activities', 'Nobel Prize in Literature', 'Awarded the Nobel Prize in Literature in 2011 — after decades of nomination — for his "condensed, translucent images" giving new access to reality.', 'point', 2011, null, '#f59e0b'),

  -- Ingemar Stenmark (280)
  ('a0000000-0000-0000-0000-000000000280', 'Place & Travel', 'Born in Tärnaby, Lapland', 'Born on 18 March 1956 in Tärnaby, a tiny village in Swedish Lapland; learned to ski on steep local hills as a small child.', 'point', 1956, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000280', 'Work & Education', 'World Cup debut and dominance', 'Made his World Cup debut in 1973 at age 16; won his first World Cup overall title in 1976 and dominated slalom and giant slalom for over a decade.', 'range', 1973, 1989, '#10b981'),
  ('a0000000-0000-0000-0000-000000000280', 'Activities', 'Two Olympic gold medals', 'Won gold in slalom and giant slalom at the 1980 Lake Placid Olympics; the dual victory was a defining moment in Swedish winter sports history.', 'point', 1980, null, '#f59e0b'),
  ('a0000000-0000-0000-0000-000000000280', 'Activities', '86 World Cup victories', 'Retired with 86 World Cup victories — a record that stood for decades until beaten by Marcel Hirscher in 2018; also won three Olympic and eight World Championship medals.', 'range', 1974, 1989, '#f59e0b'),

  -- Max Martin (281)
  ('a0000000-0000-0000-0000-000000000281', 'Place & Travel', 'Born in Stockholm', 'Born Martin Karl Sandberg on 26 February 1971 in Stockholm; grew up in Stenby; played in the glam metal band It''s Alive as a teenager.', 'point', 1971, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000281', 'Work & Education', 'Discovered by Denniz Pop', 'Mentored by legendary Swedish producer Denniz Pop at Cheiron Studios in Stockholm; learned modern pop production under his guidance.', 'range', 1992, 1998, '#10b981'),
  ('a0000000-0000-0000-0000-000000000281', 'Work & Education', 'Britney and Backstreet Boys era', 'Co-wrote and produced ...Baby One More Time (1998) for Britney Spears and shaped the Backstreet Boys'' sound; became the dominant pop producer of his era.', 'range', 1997, 2002, '#10b981'),
  ('a0000000-0000-0000-0000-000000000281', 'Work & Education', 'Decades of number-one hits', 'Wrote or co-wrote hits for Katy Perry, Taylor Swift, The Weeknd, Ariana Grande, Justin Timberlake, and dozens more; has the most number-one singles in the US Hot 100 of any songwriter alive.', 'range', 2000, 2026, '#10b981'),
  ('a0000000-0000-0000-0000-000000000281', 'Activities', 'Grammy and global recognition', 'Multiple Grammy wins and nominations; named one of Time magazine''s 100 Most Influential People; widely called the most commercially successful songwriter of the 21st century.', 'range', 2000, 2026, '#f59e0b'),

  -- Anna Lindh (282)
  ('a0000000-0000-0000-0000-000000000282', 'Place & Travel', 'Born in Enskede, Stockholm', 'Born on 19 June 1957 in Enskede; an active young Social Democrat who rose quickly through party youth organisations.', 'point', 1957, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000282', 'Work & Education', 'Environment Minister', 'Served as Minister for the Environment 1994–1998; known for strong positions on climate and environmental protection.', 'range', 1994, 1998, '#10b981'),
  ('a0000000-0000-0000-0000-000000000282', 'Work & Education', 'Foreign Minister', 'Served as Minister for Foreign Affairs 1998–2003; a prominent voice for multilateralism, the EU, and international law; widely tipped as a future Prime Minister.', 'range', 1998, 2003, '#10b981'),
  ('a0000000-0000-0000-0000-000000000282', 'Health', 'Assassinated in Stockholm', 'Stabbed by an attacker in the NK department store in Stockholm on 10 September 2003; died the following day; Sweden was in profound shock.', 'point', 2003, null, '#ef4444'),

  -- Carl Bildt (283)
  ('a0000000-0000-0000-0000-000000000283', 'Place & Travel', 'Born in Halmstad', 'Born on 15 July 1949 in Halmstad; became politically active while studying at Stockholm University.', 'point', 1949, null, '#3b82f6'),
  ('a0000000-0000-0000-0000-000000000283', 'Work & Education', 'Prime Minister of Sweden', 'Served as Prime Minister 1991–1994 at the head of a centre-right coalition; broke decades of Social Democratic dominance and negotiated Sweden''s EU membership.', 'range', 1991, 1994, '#10b981'),
  ('a0000000-0000-0000-0000-000000000283', 'Work & Education', 'High Representative for Bosnia', 'Served as international High Representative for Bosnia-Herzegovina 1995–1997, overseeing implementation of the Dayton Agreement after the Yugoslav Wars.', 'range', 1995, 1997, '#10b981'),
  ('a0000000-0000-0000-0000-000000000283', 'Work & Education', 'Foreign Minister', 'Served as Foreign Minister of Sweden 2006–2014; a prominent advocate for EU enlargement, democracy promotion, and Ukraine''s European integration.', 'range', 2006, 2014, '#10b981'),
  ('a0000000-0000-0000-0000-000000000283', 'Activities', 'International commentator', 'After leaving government became a widely followed voice on international security and European affairs; early and consistent supporter of Ukraine.', 'range', 2014, 2026, '#f59e0b');
