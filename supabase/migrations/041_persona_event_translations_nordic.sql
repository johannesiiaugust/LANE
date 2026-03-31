-- ============================================================
-- Migration 041: Persona event translations — Nordic celebrities
-- Covers: Björn Borg (272), Zlatan (273), Greta Thunberg (274),
--         Avicii (275)
-- Languages: de, sv, no, fi, lv, lt, nl, fr, es, it, da, pl, cs
-- ============================================================

insert into persona_event_translations (persona_id, title_en, language, title, description) values

-- ══════════════════════════════════════════════════════════════
-- Björn Borg (272)
-- Events: Born in Södertälje · Turned professional at 16 ·
--   Five consecutive Wimbledon titles · Six French Open titles ·
--   Retired at 26 · Björn Borg fashion label
-- ══════════════════════════════════════════════════════════════

-- de
('a0000000-0000-0000-0000-000000000272','Born in Södertälje',              'de','Geboren in Södertälje',               'Wurde am 6. Juni 1956 in Södertälje, Schweden, geboren; entdeckte den Tennis im Alter von neun Jahren, als sein Vater einen Tischtennisschläger als Preis gewann.'),
('a0000000-0000-0000-0000-000000000272','Turned professional at 16',        'de','Mit 16 Jahren Profi geworden',          'Wurde 1972 im Alter von 16 Jahren Tennisprofi; war der jüngste Spieler, der je im Davis-Cup-Team schwedischer Mannschaft aufgestellt wurde.'),
('a0000000-0000-0000-0000-000000000272','Five consecutive Wimbledon titles', 'de','Fünf aufeinanderfolgende Wimbledon-Titel','Gewann Wimbledon von 1976 bis 1980 fünfmal in Folge — eine Leistung, die als eine der größten in der Tennisgeschichte gilt.'),
('a0000000-0000-0000-0000-000000000272','Six French Open titles',            'de','Sechs French-Open-Titel',               'Gewann die French Open sechsmal (1974–1975, 1978–1981); seine Dominanz auf Sand machte ihn zum unangefochtenen König von Roland Garros.'),
('a0000000-0000-0000-0000-000000000272','Retired at 26',                     'de','Rücktritt mit 26 Jahren',               'Trat 1983 überraschend im Alter von 26 Jahren zurück; stand auf dem Höhepunkt seiner Kräfte, wollte aber dem Spiel den Rücken kehren.'),
('a0000000-0000-0000-0000-000000000272','Björn Borg fashion label',          'de','Björn Borg Modelabel',                  'Gründete in den 1990er Jahren das Modeunternehmen Björn Borg; die Marke ist heute vor allem für Unterwäsche und Sportbekleidung bekannt.'),

-- sv
('a0000000-0000-0000-0000-000000000272','Born in Södertälje',              'sv','Född i Södertälje',                    'Född den 6 juni 1956 i Södertälje; upptäckte tennisen som nio-åring när hans far vann ett bordtennisracket som pris.'),
('a0000000-0000-0000-0000-000000000272','Turned professional at 16',        'sv','Professionell vid 16 år',              'Blev professionell tennisspelare 1972 vid 16 års ålder; var den yngsta spelaren att ställas upp i det svenska Davis Cup-laget.'),
('a0000000-0000-0000-0000-000000000272','Five consecutive Wimbledon titles', 'sv','Fem Wimbledon-titlar i rad',           'Vann Wimbledon fem gånger i rad 1976–1980 — en bedrift som räknas som en av de mest imponerande i tennishistorien.'),
('a0000000-0000-0000-0000-000000000272','Six French Open titles',            'sv','Sex French Open-titlar',               'Vann French Open sex gånger (1974–1975, 1978–1981); hans dominans på grus gjorde honom till den obestridde kungen av Roland Garros.'),
('a0000000-0000-0000-0000-000000000272','Retired at 26',                     'sv','Lade av vid 26',                       'Drog sig tillbaka oväntat 1983 vid 26 års ålder; stod på toppen av sin karriär men ville lämna sporten.'),
('a0000000-0000-0000-0000-000000000272','Björn Borg fashion label',          'sv','Björn Borg modellabel',                'Grundade modeföretaget Björn Borg på 1990-talet; varumärket är idag främst känt för underkläder och sportkläder.'),

-- no
('a0000000-0000-0000-0000-000000000272','Born in Södertälje',              'no','Født i Södertälje',                    'Født 6. juni 1956 i Södertälje; oppdaget tennis som ni-åring da faren hans vant en bordtennisracket som premie.'),
('a0000000-0000-0000-0000-000000000272','Turned professional at 16',        'no','Ble proff som 16-åring',               'Ble proff i tennis i 1972, 16 år gammel; var den yngste spilleren som noensinne ble satt på det svenske Davis Cup-laget.'),
('a0000000-0000-0000-0000-000000000272','Five consecutive Wimbledon titles', 'no','Fem Wimbledon-titler på rad',          'Vant Wimbledon fem ganger på rad fra 1976 til 1980 — en bragd som regnes som en av de største i tennishistorien.'),
('a0000000-0000-0000-0000-000000000272','Six French Open titles',            'no','Seks French Open-titler',              'Vant French Open seks ganger (1974–1975, 1978–1981); hans dominans på grus gjorde ham til den ubestridte kongen av Roland Garros.'),
('a0000000-0000-0000-0000-000000000272','Retired at 26',                     'no','Ga seg som 26-åring',                  'Trakk seg uventet tilbake i 1983, 26 år gammel; var på høyden av karrieren, men ønsket å forlate sporten.'),
('a0000000-0000-0000-0000-000000000272','Björn Borg fashion label',          'no','Björn Borg motemerke',                 'Startet motebedriften Björn Borg på 1990-tallet; merket er i dag best kjent for undertøy og sportsklær.'),

-- fi
('a0000000-0000-0000-0000-000000000272','Born in Södertälje',              'fi','Syntynyt Södertäljessä',               'Syntyi 6. kesäkuuta 1956 Södertäljessä; tutustui tennikseen yhdeksänvuotiaana, kun hänen isänsä voitti palkintona pingismailan.'),
('a0000000-0000-0000-0000-000000000272','Turned professional at 16',        'fi','Ammattilaiseksi 16-vuotiaana',         'Siirtyi ammattilaistenniksen pariin vuonna 1972, 16-vuotiaana; oli nuorin pelaaja, joka koskaan sijoitettiin Ruotsin Davis Cup -joukkueeseen.'),
('a0000000-0000-0000-0000-000000000272','Five consecutive Wimbledon titles', 'fi','Viisi peräkkäistä Wimbledon-titteliä','Voitti Wimbledonin viisi kertaa peräkkäin 1976–1980 — saavutus, jota pidetään yhtenä tennishistorian suurimmista.'),
('a0000000-0000-0000-0000-000000000272','Six French Open titles',            'fi','Kuusi Ranskan avoimen titteliä',       'Voitti Ranskan avoimen kuusi kertaa (1974–1975, 1978–1981); hänen ylivertaisuutensa savella teki hänestä Roland Garrosin kiistattoman kuninkaan.'),
('a0000000-0000-0000-0000-000000000272','Retired at 26',                     'fi','Lopetti 26-vuotiaana',                 'Vetäytyi yllättäen tenniksen parista vuonna 1983, 26-vuotiaana; oli uransa huipulla, mutta halusi jättää urheilun taakseen.'),
('a0000000-0000-0000-0000-000000000272','Björn Borg fashion label',          'fi','Björn Borg -muotimerkkki',             'Perusti Björn Borg -muotiyrityksen 1990-luvulla; brändi tunnetaan nykyään parhaiten alusvaatteista ja urheiluvaatteista.'),

-- lv
('a0000000-0000-0000-0000-000000000272','Born in Södertälje',              'lv','Dzimis Södertäljē',                    'Dzimis 1956. gada 6. jūnijā Södertäljē; iepazina tenisu deviņu gadu vecumā, kad viņa tēvs kā balvu ieguva galda tenisa raketi.'),
('a0000000-0000-0000-0000-000000000272','Turned professional at 16',        'lv','Kļuva par profesionāli 16 gadu vecumā','Kļuva par profesionālu tenisistu 1972. gadā, 16 gadu vecumā; bija jaunākais spēlētājs, kurš jebkad tika iekļauts Zviedrijas Deivisa kausa komandā.'),
('a0000000-0000-0000-0000-000000000272','Five consecutive Wimbledon titles', 'lv','Pieci Vimbldonas tituli pēc kārtas',  'Uzvarēja Vimbldonā piecas reizes pēc kārtas no 1976. līdz 1980. gadam — sasniegums, kas tiek uzskatīts par vienu no lielākajiem tenisa vēsturē.'),
('a0000000-0000-0000-0000-000000000272','Six French Open titles',            'lv','Seši Francijas atklātā čempionāta tituli','Uzvarēja Francijas atklātajā čempionātā sešas reizes (1974–1975, 1978–1981); viņa dominance uz māla laukuma padarīja viņu par neapšaubāmo Rolāna Garrosa karali.'),
('a0000000-0000-0000-0000-000000000272','Retired at 26',                     'lv','Pārstāja spēlēt 26 gadu vecumā',      'Negaidīti pārstāja spēlēt 1983. gadā, 26 gadu vecumā; atradās karjeras virsotnē, taču vēlējās pamest sportu.'),
('a0000000-0000-0000-0000-000000000272','Björn Borg fashion label',          'lv','Björn Borg modes zīmols',             'Nodibināja modes uzņēmumu Björn Borg 1990. gados; zīmols šodien ir vislabāk pazīstams ar apakšveļu un sporta apģērbu.'),

-- lt
('a0000000-0000-0000-0000-000000000272','Born in Södertälje',              'lt','Gimė Södertäljėje',                   'Gimė 1956 m. birželio 6 d. Södertäljėje; susipažino su tenisu būdamas devynerių, kai jo tėvas laimėjo stalo teniso raketę kaip prizą.'),
('a0000000-0000-0000-0000-000000000272','Turned professional at 16',        'lt','Tapo profesionalu būdamas 16',         'Tapo profesionaliu tenisininku 1972 m., sulaukęs 16 metų; buvo jauniausias žaidėjas, kada nors įtrauktas į Švedijos Daviso taurės komandą.'),
('a0000000-0000-0000-0000-000000000272','Five consecutive Wimbledon titles', 'lt','Penki iš eilės Vimbldono titulai',    'Laimėjo Vimbldone penkis kartus iš eilės nuo 1976 iki 1980 m. — pasiekimas, laikomas vienu didžiausių teniso istorijoje.'),
('a0000000-0000-0000-0000-000000000272','Six French Open titles',            'lt','Šeši Prancūzijos atvirojo čempionato titulai','Laimėjo Prancūzijos atvirąjį šešis kartus (1974–1975, 1978–1981); jo dominavimas moliniame korte padarė jį neginčijamu Rolano Garoso karaliumi.'),
('a0000000-0000-0000-0000-000000000272','Retired at 26',                     'lt','Pasitraukė sulaukęs 26',               'Netikėtai pasitraukė 1983 m., sulaukęs 26 metų; buvo karjeros viršūnėje, tačiau norėjo palikti sportą.'),
('a0000000-0000-0000-0000-000000000272','Björn Borg fashion label',          'lt','Björn Borg mados prekės ženklas',     'Įkūrė mados įmonę Björn Borg 1990-aisiais; prekės ženklas šiandien labiausiai žinomas dėl apatinių drabužių ir sportinės aprangos.'),

-- nl
('a0000000-0000-0000-0000-000000000272','Born in Södertälje',              'nl','Geboren in Södertälje',                'Geboren op 6 juni 1956 in Södertälje; ontdekte tennis op negenjarige leeftijd toen zijn vader een tafeltennisracket als prijs won.'),
('a0000000-0000-0000-0000-000000000272','Turned professional at 16',        'nl','Professioneel op 16-jarige leeftijd',  'Werd in 1972 op 16-jarige leeftijd professioneel tennisser; was de jongste speler die ooit in het Zweedse Davis Cup-team werd opgesteld.'),
('a0000000-0000-0000-0000-000000000272','Five consecutive Wimbledon titles', 'nl','Vijf opeenvolgende Wimbledon-titels',  'Won Wimbledon vijf keer op rij van 1976 tot 1980 — een prestatie die als een van de grootste in de tennisgeschiedenis wordt beschouwd.'),
('a0000000-0000-0000-0000-000000000272','Six French Open titles',            'nl','Zes Roland Garros-titels',             'Won de French Open zes keer (1974–1975, 1978–1981); zijn dominantie op gravel maakte hem tot de onbetwiste koning van Roland Garros.'),
('a0000000-0000-0000-0000-000000000272','Retired at 26',                     'nl','Met pensioen op 26-jarige leeftijd',   'Trok zich in 1983 verrassend terug op 26-jarige leeftijd; stond op het hoogtepunt van zijn carrière maar wilde de sport achter zich laten.'),
('a0000000-0000-0000-0000-000000000272','Björn Borg fashion label',          'nl','Björn Borg modelabel',                 'Richtte in de jaren negentig het modebedrijf Björn Borg op; het merk is nu het meest bekend om ondergoed en sportkleding.'),

-- fr
('a0000000-0000-0000-0000-000000000272','Born in Södertälje',              'fr','Né à Södertälje',                      'Né le 6 juin 1956 à Södertälje ; a découvert le tennis à neuf ans lorsque son père a gagné une raquette de tennis de table en prix.'),
('a0000000-0000-0000-0000-000000000272','Turned professional at 16',        'fr','Professionnel à 16 ans',               'Devenu joueur de tennis professionnel en 1972 à 16 ans ; a été le plus jeune joueur à être sélectionné dans l''équipe suédoise de Coupe Davis.'),
('a0000000-0000-0000-0000-000000000272','Five consecutive Wimbledon titles', 'fr','Cinq titres consécutifs à Wimbledon',  'A remporté Wimbledon cinq fois de suite de 1976 à 1980 — un exploit considéré comme l''un des plus grands de l''histoire du tennis.'),
('a0000000-0000-0000-0000-000000000272','Six French Open titles',            'fr','Six titres à Roland-Garros',           'A remporté Roland-Garros six fois (1974–1975, 1978–1981) ; sa domination sur terre battue a fait de lui le roi incontesté de Roland-Garros.'),
('a0000000-0000-0000-0000-000000000272','Retired at 26',                     'fr','Retraite à 26 ans',                    'S''est retiré de manière inattendue en 1983 à 26 ans ; était au sommet de sa carrière mais souhaitait tourner la page.'),
('a0000000-0000-0000-0000-000000000272','Björn Borg fashion label',          'fr','Marque de mode Björn Borg',            'A fondé l''entreprise de mode Björn Borg dans les années 1990 ; la marque est aujourd''hui surtout connue pour ses sous-vêtements et vêtements de sport.'),

-- es
('a0000000-0000-0000-0000-000000000272','Born in Södertälje',              'es','Nacido en Södertälje',                 'Nacido el 6 de junio de 1956 en Södertälje; descubrió el tenis a los nueve años cuando su padre ganó una raqueta de tenis de mesa como premio.'),
('a0000000-0000-0000-0000-000000000272','Turned professional at 16',        'es','Profesional a los 16 años',            'Se convirtió en tenista profesional en 1972 a los 16 años; fue el jugador más joven en ser seleccionado para el equipo sueco de Copa Davis.'),
('a0000000-0000-0000-0000-000000000272','Five consecutive Wimbledon titles', 'es','Cinco títulos consecutivos en Wimbledon','Ganó Wimbledon cinco veces seguidas de 1976 a 1980 — una hazaña considerada una de las más grandes en la historia del tenis.'),
('a0000000-0000-0000-0000-000000000272','Six French Open titles',            'es','Seis títulos en Roland Garros',        'Ganó Roland Garros seis veces (1974–1975, 1978–1981); su dominio en tierra batida lo convirtió en el rey indiscutible de Roland Garros.'),
('a0000000-0000-0000-0000-000000000272','Retired at 26',                     'es','Retirado a los 26 años',               'Se retiró inesperadamente en 1983 a los 26 años; estaba en la cima de su carrera pero quería dejar el deporte.'),
('a0000000-0000-0000-0000-000000000272','Björn Borg fashion label',          'es','Marca de moda Björn Borg',             'Fundó la empresa de moda Björn Borg en los años 90; la marca es conocida hoy principalmente por su ropa interior y ropa deportiva.'),

-- it
('a0000000-0000-0000-0000-000000000272','Born in Södertälje',              'it','Nato a Södertälje',                    'Nato il 6 giugno 1956 a Södertälje; scoprì il tennis a nove anni quando suo padre vinse una racchetta da ping-pong come premio.'),
('a0000000-0000-0000-0000-000000000272','Turned professional at 16',        'it','Professionista a 16 anni',             'Diventò tennista professionista nel 1972 a 16 anni; fu il giocatore più giovane ad essere selezionato nella squadra svedese di Coppa Davis.'),
('a0000000-0000-0000-0000-000000000272','Five consecutive Wimbledon titles', 'it','Cinque titoli Wimbledon consecutivi',  'Vinse Wimbledon cinque volte di fila dal 1976 al 1980 — un''impresa considerata una delle più grandi nella storia del tennis.'),
('a0000000-0000-0000-0000-000000000272','Six French Open titles',            'it','Sei titoli al Roland Garros',          'Vinse il Roland Garros sei volte (1974–1975, 1978–1981); il suo dominio sulla terra rossa lo rese il re indiscusso del Roland Garros.'),
('a0000000-0000-0000-0000-000000000272','Retired at 26',                     'it','Ritirato a 26 anni',                   'Si ritirò inaspettatamente nel 1983 a 26 anni; era all''apice della carriera ma voleva lasciare lo sport.'),
('a0000000-0000-0000-0000-000000000272','Björn Borg fashion label',          'it','Marchio di moda Björn Borg',           'Fondò l''azienda di moda Björn Borg negli anni ''90; il marchio è oggi noto soprattutto per intimo e abbigliamento sportivo.'),

-- da
('a0000000-0000-0000-0000-000000000272','Born in Södertälje',              'da','Født i Södertälje',                    'Født den 6. juni 1956 i Södertälje; opdagede tennis som ni-årig, da hans far vandt en bordtennisracket som præmie.'),
('a0000000-0000-0000-0000-000000000272','Turned professional at 16',        'da','Professionel som 16-årig',             'Blev professionel tennisspiller i 1972 som 16-årig; var den yngste spiller, der nogensinde var blevet udtaget til det svenske Davis Cup-hold.'),
('a0000000-0000-0000-0000-000000000272','Five consecutive Wimbledon titles', 'da','Fem Wimbledon-titler i træk',          'Vandt Wimbledon fem gange i træk fra 1976 til 1980 — en bedrift, der betragtes som en af de største i tennishistorien.'),
('a0000000-0000-0000-0000-000000000272','Six French Open titles',            'da','Seks Roland Garros-titler',            'Vandt French Open seks gange (1974–1975, 1978–1981); hans dominans på grus gjorde ham til den ubestridte konge af Roland Garros.'),
('a0000000-0000-0000-0000-000000000272','Retired at 26',                     'da','Gik på pension som 26-årig',           'Trak sig uventet tilbage i 1983 som 26-årig; stod på toppen af karrieren men ønskede at forlade sporten.'),
('a0000000-0000-0000-0000-000000000272','Björn Borg fashion label',          'da','Björn Borg modevirksomhed',            'Grundlagde modevirksomheden Björn Borg i 1990''erne; mærket er i dag bedst kendt for undertøj og sportstøj.'),

-- pl
('a0000000-0000-0000-0000-000000000272','Born in Södertälje',              'pl','Urodzony w Södertälje',                'Urodzony 6 czerwca 1956 roku w Södertälje; odkrył tenis w wieku dziewięciu lat, gdy jego ojciec wygrał jako nagrodę rakietę do tenisa stołowego.'),
('a0000000-0000-0000-0000-000000000272','Turned professional at 16',        'pl','Zawodowiec w wieku 16 lat',            'Został zawodowym tenisistą w 1972 roku, mając 16 lat; był najmłodszym graczem, jaki kiedykolwiek znalazł się w szwedzkiej drużynie Pucharu Davisa.'),
('a0000000-0000-0000-0000-000000000272','Five consecutive Wimbledon titles', 'pl','Pięć kolejnych tytułów Wimbledonu',   'Wygrał Wimbledon pięć razy z rzędu od 1976 do 1980 roku — wyczyn uznawany za jeden z największych w historii tenisa.'),
('a0000000-0000-0000-0000-000000000272','Six French Open titles',            'pl','Sześć tytułów French Open',           'Wygrał French Open sześć razy (1974–1975, 1978–1981); jego dominacja na mączce uczyniła go niekwestionowanym królem Roland Garros.'),
('a0000000-0000-0000-0000-000000000272','Retired at 26',                     'pl','Zakończył karierę w wieku 26 lat',    'Niespodziewanie wycofał się ze sportu w 1983 roku, mając 26 lat; był u szczytu kariery, ale chciał zostawić sport za sobą.'),
('a0000000-0000-0000-0000-000000000272','Björn Borg fashion label',          'pl','Marka modowa Björn Borg',             'Założył firmę modową Björn Borg w latach 90.; marka znana jest dziś głównie z bielizny i odzieży sportowej.'),

-- cs
('a0000000-0000-0000-0000-000000000272','Born in Södertälje',              'cs','Narozen v Södertälje',                 'Narozen 6. června 1956 v Södertälje; objevil tenis v devíti letech, když jeho otec vyhrál jako cenu stolní tenisovou raketu.'),
('a0000000-0000-0000-0000-000000000272','Turned professional at 16',        'cs','Profesionál v 16 letech',             'Stal se profesionálním tenistou v roce 1972 ve věku 16 let; byl nejmladším hráčem, který kdy byl zařazen do švédského týmu Davis Cupu.'),
('a0000000-0000-0000-0000-000000000272','Five consecutive Wimbledon titles', 'cs','Pět po sobě jdoucích titulů ve Wimbledonu','Vyhrál Wimbledon pětkrát za sebou od roku 1976 do roku 1980 — výkon považovaný za jeden z největších v historii tenisu.'),
('a0000000-0000-0000-0000-000000000272','Six French Open titles',            'cs','Šest titulů French Open',             'Vyhrál French Open šestkrát (1974–1975, 1978–1981); jeho dominance na antuce z něj udělala nesporného krále Roland Garros.'),
('a0000000-0000-0000-0000-000000000272','Retired at 26',                     'cs','Odešel do důchodu v 26 letech',       'Nečekaně se stáhl ze sportu v roce 1983 ve věku 26 let; byl na vrcholu kariéry, ale chtěl sport opustit.'),
('a0000000-0000-0000-0000-000000000272','Björn Borg fashion label',          'cs','Módní značka Björn Borg',             'Založil módní firmu Björn Borg v 90. letech; značka je dnes nejznámější svým spodním prádlem a sportovním oblečením.'),

-- ══════════════════════════════════════════════════════════════
-- Zlatan Ibrahimović (273)
-- Events: Born in Malmö · Malmö FF and Ajax · Juventus and Inter Milan ·
--   Barcelona, AC Milan, PSG · Manchester United and LA Galaxy ·
--   Swedish international career
-- ══════════════════════════════════════════════════════════════

-- de
('a0000000-0000-0000-0000-000000000273','Born in Malmö',                   'de','Geboren in Malmö',                    'Am 3. Oktober 1981 in Malmö geboren; wuchs im Arbeiterviertel Rosengård auf; seine Eltern waren bosnische und kroatische Einwanderer.'),
('a0000000-0000-0000-0000-000000000273','Malmö FF and Ajax',               'de','Malmö FF und Ajax',                   'Begann bei Malmö FF, bevor er 2001 zu Ajax wechselte; wurde Stammspieler und gewann den Eredivisie-Titel.'),
('a0000000-0000-0000-0000-000000000273','Juventus and Inter Milan',        'de','Juventus und Inter Mailand',          'Wechselte 2004 zu Juventus und 2006 zu Inter Mailand; gewann vier aufeinanderfolgende Serie-A-Titel und wurde achtmal zum schwedischen Fußballer des Jahres gewählt.'),
('a0000000-0000-0000-0000-000000000273','Barcelona, AC Milan, PSG',        'de','Barcelona, AC Mailand, PSG',          'Hatte ein schwieriges Jahr bei Barcelona unter Guardiola; danach zu AC Mailand, dann wurde er Hauptstar bei PSG und gewann vier Ligue-1-Titel.'),
('a0000000-0000-0000-0000-000000000273','Manchester United and LA Galaxy', 'de','Manchester United und LA Galaxy',     'Wechselte 2016 zu Manchester United; zog 2018 zur LA Galaxy, wo er zum Kultstar wurde, bevor er zu AC Mailand zurückkehrte und 2023 seine Karriere beendete.'),
('a0000000-0000-0000-0000-000000000273','Swedish international career',    'de','Schwedische Nationalmannschaftskarriere','Erzielte 62 Tore in 120 Spielen für Schweden — nationaler Allzeitrekord; trat 2016 zurück, kehrte jedoch 2021–2022 zurück.'),

-- sv
('a0000000-0000-0000-0000-000000000273','Born in Malmö',                   'sv','Född i Malmö',                        'Född den 3 oktober 1981 i Malmö; växte upp i arbetarklasskvarteret Rosengård; föräldrar var bosniska och kroatiska invandrare.'),
('a0000000-0000-0000-0000-000000000273','Malmö FF and Ajax',               'sv','Malmö FF och Ajax',                   'Började på Malmö FF innan han gick till Ajax 2001; blev en nyckelspelare och vann Eredivisie-titeln.'),
('a0000000-0000-0000-0000-000000000273','Juventus and Inter Milan',        'sv','Juventus och Inter Milan',            'Gick till Juventus 2004 och Inter Milan 2006; vann fyra Seriemästerskapen i rad och utsågs åtta gånger till Årets svenska fotbollsspelare.'),
('a0000000-0000-0000-0000-000000000273','Barcelona, AC Milan, PSG',        'sv','Barcelona, AC Milan, PSG',            'Hade ett besvärligt år på Barcelona under Guardiola; sedan till AC Milan och sedan PSG:s största stjärna, med fyra Ligue 1-titlar.'),
('a0000000-0000-0000-0000-000000000273','Manchester United and LA Galaxy', 'sv','Manchester United och LA Galaxy',     'Gick till Manchester United 2016; flyttade till LA Galaxy 2018 och blev en kulthjälte innan han återvände till AC Milan och gick i pension 2023.'),
('a0000000-0000-0000-0000-000000000273','Swedish international career',    'sv','Landslagskarriär',                    'Gjorde 62 mål på 120 matcher för Sverige — nationellt all-time-rekord; drog sig tillbaka 2016 men återkom 2021–2022.'),

-- no
('a0000000-0000-0000-0000-000000000273','Born in Malmö',                   'no','Født i Malmø',                        'Født 3. oktober 1981 i Malmø; vokste opp i arbeiderklassekvartalet Rosengård; foreldre var bosniske og kroatiske innvandrere.'),
('a0000000-0000-0000-0000-000000000273','Malmö FF and Ajax',               'no','Malmø FF og Ajax',                    'Startet i Malmø FF før han ble med Ajax i 2001; ble nøkkelspiller og vant Eredivisie-tittelen.'),
('a0000000-0000-0000-0000-000000000273','Juventus and Inter Milan',        'no','Juventus og Inter Milano',            'Flyttet til Juventus i 2004, deretter til Inter Milano i 2006; vant fire påfølgende Serie A-titler og ble kåret til Årets svenske fotballspiller åtte ganger.'),
('a0000000-0000-0000-0000-000000000273','Barcelona, AC Milan, PSG',        'no','Barcelona, AC Milan, PSG',            'Hadde et vanskelig år i Barcelona under Guardiola; deretter til AC Milan, og siden PSGs største stjerne med fire Ligue 1-titler.'),
('a0000000-0000-0000-0000-000000000273','Manchester United and LA Galaxy', 'no','Manchester United og LA Galaxy',      'Kom til Manchester United i 2016; flyttet til LA Galaxy i 2018 og ble en kulthelt, før han vendte tilbake til AC Milan og pensjonerte seg i 2023.'),
('a0000000-0000-0000-0000-000000000273','Swedish international career',    'no','Karriere på det svenske landslaget',  'Scoret 62 mål i 120 kamper for Sverige — all-time nasjonal rekord; trakk seg i 2016, men vendte tilbake 2021–2022.'),

-- fi
('a0000000-0000-0000-0000-000000000273','Born in Malmö',                   'fi','Syntynyt Malmössä',                   'Syntyi 3. lokakuuta 1981 Malmössä; kasvoi työväenluokan Rosengårdin kaupunginosassa; vanhemmat olivat bosnialaisia ja kroatialaisia maahanmuuttajia.'),
('a0000000-0000-0000-0000-000000000273','Malmö FF and Ajax',               'fi','Malmö FF ja Ajax',                    'Aloitti Malmö FF:ssä ennen siirtymistään Ajaxiin vuonna 2001; nousi avainpelaajan rooliin ja voitti Eredivisie-mestaruuden.'),
('a0000000-0000-0000-0000-000000000273','Juventus and Inter Milan',        'fi','Juventus ja Inter Milan',             'Siirtyi Juventukseen 2004 ja Inter Milaniin 2006; voitti neljä peräkkäistä Serie A -mestaruutta ja valittiin kahdeksan kertaa Ruotsin vuoden jalkapalloilijaksi.'),
('a0000000-0000-0000-0000-000000000273','Barcelona, AC Milan, PSG',        'fi','Barcelona, AC Milan, PSG',            'Vietti vaikean vuoden Barcelonassa Guardiolan alaisuudessa; siirtyi sitten AC Milaniin ja nousi PSG:n suurimmaksi tähdeksi voittaen neljä Ligue 1 -mestaruutta.'),
('a0000000-0000-0000-0000-000000000273','Manchester United and LA Galaxy', 'fi','Manchester United ja LA Galaxy',      'Liittyi Manchester Unitediin 2016; siirtyi LA Galaxyyn 2018, jossa hänestä tuli kultti-idoli ennen paluutaan AC Milaniin ja eläkkeelle 2023.'),
('a0000000-0000-0000-0000-000000000273','Swedish international career',    'fi','Ruotsin maajoukkueura',               'Teki 62 maalia 120 ottelussa Ruotsille — kansallinen kaikkien aikojen ennätys; lopetti maajoukkueuransa 2016, mutta palasi 2021–2022.'),

-- lv
('a0000000-0000-0000-0000-000000000273','Born in Malmö',                   'lv','Dzimis Malmē',                        'Dzimis 1981. gada 3. oktobrī Malmē; uzauga strādnieku klases Rosengård rajonā; vecāki bija bosniešu un horvātu imigranti.'),
('a0000000-0000-0000-0000-000000000273','Malmö FF and Ajax',               'lv','Malmö FF un Ajax',                    'Sāka Malmö FF pirms pievienošanās Ajax 2001. gadā; kļuva par galveno spēlētāju un izcīnīja Eredivisie titulu.'),
('a0000000-0000-0000-0000-000000000273','Juventus and Inter Milan',        'lv','Juventus un Inter Milano',            'Pārcēlās uz Juventus 2004. gadā un uz Inter Milano 2006. gadā; izcīnīja četrus secīgus Serie A titulus un astoņas reizes tika atzīts par Zviedrijas gada futbolistu.'),
('a0000000-0000-0000-0000-000000000273','Barcelona, AC Milan, PSG',        'lv','Barselona, AC Milan, PSG',            'Pavadīja sarežģītu gadu Barselonā Guardiolas vadībā; pēc tam uz AC Milan, tad kļuva par PSG galveno zvaigzni, uzvarot četros Ligue 1 titulos.'),
('a0000000-0000-0000-0000-000000000273','Manchester United and LA Galaxy', 'lv','Mančestras United un LA Galaxy',      'Pievienojās Mančestras United 2016. gadā; pārcēlās uz LA Galaxy 2018. gadā un kļuva par kulta varoni, pirms atgriezās AC Milan un 2023. gadā pabeidza karjeru.'),
('a0000000-0000-0000-0000-000000000273','Swedish international career',    'lv','Karjera Zviedrijas izlasē',           'Guvuši 62 vārtus 120 spēlēs Zviedrijai — visu laiku nacionālais rekords; paziņoja par aiziešanu 2016. gadā, bet atgriezās 2021.–2022. gadā.'),

-- lt
('a0000000-0000-0000-0000-000000000273','Born in Malmö',                   'lt','Gimė Malmėje',                        'Gimė 1981 m. spalio 3 d. Malmėje; užaugo darbininkų klasės Rosengård kvartale; tėvai buvo bosnių ir kroatų imigrantai.'),
('a0000000-0000-0000-0000-000000000273','Malmö FF and Ajax',               'lt','Malmö FF ir Ajax',                    'Pradėjo Malmö FF, o 2001 m. perėjo į Ajax; tapo pagrindiniu žaidėju ir laimėjo Eredivisie titulą.'),
('a0000000-0000-0000-0000-000000000273','Juventus and Inter Milan',        'lt','Juventus ir Inter Milanas',           'Persikėlė į Juventus 2004 m. ir Inter Milaną 2006 m.; laimėjo keturis iš eilės Serie A titulus ir aštuonis kartus buvo išrinktas Švedijos metų futbolininku.'),
('a0000000-0000-0000-0000-000000000273','Barcelona, AC Milan, PSG',        'lt','Barselona, AC Milanas, PSG',          'Praleido sunkų metus Barselonoje pas Guardiolą; vėliau į AC Milaną, tada tapo PSG didžiausia žvaigžde, laimėdamas keturis Ligue 1 titulus.'),
('a0000000-0000-0000-0000-000000000273','Manchester United and LA Galaxy', 'lt','Mančesteris United ir LA Galaxy',     'Prisijungė prie Mančesterio United 2016 m.; persikėlė į LA Galaxy 2018 m. ir tapo kulto herojumi prieš grįžtant į AC Milaną ir 2023 m. baigiant karjerą.'),
('a0000000-0000-0000-0000-000000000273','Swedish international career',    'lt','Švedijos rinktinės karjera',          'Pelniusi 62 įvarčius per 120 rungtynių Švedijai — visų laikų nacionalinis rekordas; 2016 m. pasitraukė, tačiau 2021–2022 m. sugrįžo.'),

-- nl
('a0000000-0000-0000-0000-000000000273','Born in Malmö',                   'nl','Geboren in Malmö',                    'Geboren op 3 oktober 1981 in Malmö; opgegroeid in de arbeiderswijk Rosengård; ouders waren Bosnische en Kroatische immigranten.'),
('a0000000-0000-0000-0000-000000000273','Malmö FF and Ajax',               'nl','Malmö FF en Ajax',                    'Begon bij Malmö FF voordat hij in 2001 naar Ajax overstapte; werd een sleutelspeler en won de Eredivisie-titel.'),
('a0000000-0000-0000-0000-000000000273','Juventus and Inter Milan',        'nl','Juventus en Inter Milan',             'Stapte in 2004 over naar Juventus en in 2006 naar Inter Milan; won vier opeenvolgende Serie A-titels en werd acht keer uitgeroepen tot Zweeds voetballer van het jaar.'),
('a0000000-0000-0000-0000-000000000273','Barcelona, AC Milan, PSG',        'nl','Barcelona, AC Milan, PSG',            'Had een moeizaam jaar bij Barcelona onder Guardiola; daarna naar AC Milan, vervolgens PSG''s grootste ster met vier Ligue 1-titels.'),
('a0000000-0000-0000-0000-000000000273','Manchester United and LA Galaxy', 'nl','Manchester United en LA Galaxy',      'Sloot zich in 2016 aan bij Manchester United; vertrok in 2018 naar LA Galaxy waar hij een cultheld werd, voordat hij terugkeerde naar AC Milan en in 2023 stopte.'),
('a0000000-0000-0000-0000-000000000273','Swedish international career',    'nl','Zweedse nationale carrière',          'Scoorde 62 doelpunten in 120 interlands voor Zweden — het nationale record aller tijden; nam in 2016 afscheid maar keerde terug in 2021–2022.'),

-- fr
('a0000000-0000-0000-0000-000000000273','Born in Malmö',                   'fr','Né à Malmö',                          'Né le 3 octobre 1981 à Malmö ; a grandi dans le quartier ouvrier de Rosengård ; ses parents étaient des immigrants bosniens et croates.'),
('a0000000-0000-0000-0000-000000000273','Malmö FF and Ajax',               'fr','Malmö FF et Ajax',                    'A commencé à Malmö FF avant de rejoindre l''Ajax en 2001 ; est devenu un joueur clé et a remporté le titre de l''Eredivisie.'),
('a0000000-0000-0000-0000-000000000273','Juventus and Inter Milan',        'fr','Juventus et l''Inter Milan',           'A rejoint la Juventus en 2004, puis l''Inter Milan en 2006 ; a remporté quatre titres consécutifs de Serie A et a été élu footballeur suédois de l''année à huit reprises.'),
('a0000000-0000-0000-0000-000000000273','Barcelona, AC Milan, PSG',        'fr','Barcelone, l''AC Milan, le PSG',       'A vécu une année difficile à Barcelone sous Guardiola ; puis à l''AC Milan, enfin plus grande star du PSG avec quatre titres de Ligue 1.'),
('a0000000-0000-0000-0000-000000000273','Manchester United and LA Galaxy', 'fr','Manchester United et LA Galaxy',       'A rejoint Manchester United en 2016 ; déménagé à LA Galaxy en 2018 où il est devenu une icône avant de revenir à l''AC Milan et de prendre sa retraite en 2023.'),
('a0000000-0000-0000-0000-000000000273','Swedish international career',    'fr','Carrière internationale suédoise',     'A inscrit 62 buts en 120 sélections avec la Suède — record national de tous les temps ; a pris sa retraite internationale en 2016, puis est revenu en 2021–2022.'),

-- es
('a0000000-0000-0000-0000-000000000273','Born in Malmö',                   'es','Nacido en Malmö',                     'Nacido el 3 de octubre de 1981 en Malmö; creció en el barrio obrero de Rosengård; sus padres eran inmigrantes bosnios y croatas.'),
('a0000000-0000-0000-0000-000000000273','Malmö FF and Ajax',               'es','Malmö FF y Ajax',                     'Comenzó en el Malmö FF antes de unirse al Ajax en 2001; se convirtió en un jugador clave y ganó el título de la Eredivisie.'),
('a0000000-0000-0000-0000-000000000273','Juventus and Inter Milan',        'es','Juventus e Inter de Milán',            'Se trasladó a la Juventus en 2004 y al Inter de Milán en 2006; ganó cuatro títulos consecutivos de la Serie A y fue elegido futbolista sueco del año ocho veces.'),
('a0000000-0000-0000-0000-000000000273','Barcelona, AC Milan, PSG',        'es','Barcelona, AC Milan, PSG',             'Tuvo un difícil año en el Barcelona bajo Guardiola; luego al AC Milan y después estrella del PSG con cuatro títulos de Ligue 1.'),
('a0000000-0000-0000-0000-000000000273','Manchester United and LA Galaxy', 'es','Manchester United y LA Galaxy',        'Se unió al Manchester United en 2016; se trasladó a LA Galaxy en 2018 donde se convirtió en un ídolo antes de regresar al AC Milan y retirarse en 2023.'),
('a0000000-0000-0000-0000-000000000273','Swedish international career',    'es','Carrera internacional sueca',          'Marcó 62 goles en 120 partidos con Suecia — el récord nacional de todos los tiempos; se retiró en 2016 pero regresó en 2021–2022.'),

-- it
('a0000000-0000-0000-0000-000000000273','Born in Malmö',                   'it','Nato a Malmö',                         'Nato il 3 ottobre 1981 a Malmö; cresciuto nel quartiere operaio di Rosengård; i genitori erano immigrati bosniaci e croati.'),
('a0000000-0000-0000-0000-000000000273','Malmö FF and Ajax',               'it','Malmö FF e Ajax',                      'Iniziò al Malmö FF prima di unirsi all''Ajax nel 2001; divenne un giocatore chiave e vinse il titolo dell''Eredivisie.'),
('a0000000-0000-0000-0000-000000000273','Juventus and Inter Milan',        'it','Juventus e Inter Milan',               'Si trasferì alla Juventus nel 2004 e poi all''Inter Milan nel 2006; vinse quattro titoli consecutivi di Serie A e fu eletto calciatore svedese dell''anno per otto volte.'),
('a0000000-0000-0000-0000-000000000273','Barcelona, AC Milan, PSG',        'it','Barcellona, AC Milan, PSG',            'Trascorse un anno difficile al Barcellona sotto Guardiola; poi all''AC Milan e infine la più grande stella del PSG con quattro titoli di Ligue 1.'),
('a0000000-0000-0000-0000-000000000273','Manchester United and LA Galaxy', 'it','Manchester United e LA Galaxy',         'Si unì al Manchester United nel 2016; si trasferì alla LA Galaxy nel 2018 dove divenne un idolo prima di tornare all''AC Milan e ritirarsi nel 2023.'),
('a0000000-0000-0000-0000-000000000273','Swedish international career',    'it','Carriera nella nazionale svedese',      'Segnò 62 gol in 120 presenze con la Svezia — il record nazionale di tutti i tempi; si ritirò nel 2016, poi tornò nel 2021–2022.'),

-- da
('a0000000-0000-0000-0000-000000000273','Born in Malmö',                   'da','Født i Malmø',                         'Født 3. oktober 1981 i Malmø; voksede op i arbejderklassekvarteret Rosengård; forældre var bosniske og kroatiske indvandrere.'),
('a0000000-0000-0000-0000-000000000273','Malmö FF and Ajax',               'da','Malmø FF og Ajax',                     'Startede i Malmø FF, inden han skiftede til Ajax i 2001; blev nøglespiller og vandt Eredivisie-titlen.'),
('a0000000-0000-0000-0000-000000000273','Juventus and Inter Milan',        'da','Juventus og Inter Milano',             'Skiftede til Juventus i 2004 og til Inter Milano i 2006; vandt fire på hinanden følgende Serie A-titler og blev kåret til Årets svenske fodboldspiller otte gange.'),
('a0000000-0000-0000-0000-000000000273','Barcelona, AC Milan, PSG',        'da','Barcelona, AC Milan, PSG',             'Havde et vanskeligt år i Barcelona under Guardiola; derefter AC Milan og så PSGs største stjerne med fire Ligue 1-titler.'),
('a0000000-0000-0000-0000-000000000273','Manchester United and LA Galaxy', 'da','Manchester United og LA Galaxy',        'Skiftede til Manchester United i 2016; tog til LA Galaxy i 2018, hvor han blev en kulthelt, inden han vendte tilbage til AC Milan og gik på pension i 2023.'),
('a0000000-0000-0000-0000-000000000273','Swedish international career',    'da','Karriere på det svenske landshold',     'Scorede 62 mål i 120 kampe for Sverige — nationalrekord til alle tider; trak sig i 2016, men vendte tilbage 2021–2022.'),

-- pl
('a0000000-0000-0000-0000-000000000273','Born in Malmö',                   'pl','Urodzony w Malmö',                     'Urodzony 3 października 1981 roku w Malmö; dorastał w robotniczej dzielnicy Rosengård; rodzice byli bośniackimi i chorwackimi imigrantami.'),
('a0000000-0000-0000-0000-000000000273','Malmö FF and Ajax',               'pl','Malmö FF i Ajax',                      'Zaczynał w Malmö FF przed przejściem do Ajaxu w 2001 roku; stał się kluczowym zawodnikiem i zdobył tytuł Eredivisie.'),
('a0000000-0000-0000-0000-000000000273','Juventus and Inter Milan',        'pl','Juventus i Inter Mediolan',             'Przeniósł się do Juventusu w 2004 roku i do Interu Mediolan w 2006; zdobył cztery kolejne tytuły Serie A i osiem razy wybrano go szwedzkim piłkarzem roku.'),
('a0000000-0000-0000-0000-000000000273','Barcelona, AC Milan, PSG',        'pl','Barcelona, AC Milan, PSG',              'Spędził trudny rok w Barcelonie pod Guardiolą; potem AC Milan i następnie największa gwiazda PSG z czterema tytułami Ligue 1.'),
('a0000000-0000-0000-0000-000000000273','Manchester United and LA Galaxy', 'pl','Manchester United i LA Galaxy',          'Dołączył do Manchesteru United w 2016; przeniósł się do LA Galaxy w 2018, gdzie stał się kultową postacią, nim wrócił do AC Milan i zakończył karierę w 2023.'),
('a0000000-0000-0000-0000-000000000273','Swedish international career',    'pl','Kariera w reprezentacji Szwecji',        'Zdobył 62 gole w 120 meczach dla Szwecji — krajowy rekord wszech czasów; zakończył karierę w 2016, po czym wrócił w 2021–2022.'),

-- cs
('a0000000-0000-0000-0000-000000000273','Born in Malmö',                   'cs','Narozen v Malmö',                      'Narozen 3. října 1981 v Malmö; vyrůstal v dělnické čtvrti Rosengård; rodiče byli bosenskí a chorvatští přistěhovalci.'),
('a0000000-0000-0000-0000-000000000273','Malmö FF and Ajax',               'cs','Malmö FF a Ajax',                      'Začínal v Malmö FF, než v roce 2001 přestoupil do Ajaxu; stal se klíčovým hráčem a vyhrál titul Eredivisie.'),
('a0000000-0000-0000-0000-000000000273','Juventus and Inter Milan',        'cs','Juventus a Inter Milán',               'Přestoupil do Juventusu v roce 2004 a do Interu Milán v roce 2006; vyhrál čtyři po sobě jdoucí tituly Serie A a osmkrát byl zvolen švédským fotbalistou roku.'),
('a0000000-0000-0000-0000-000000000273','Barcelona, AC Milan, PSG',        'cs','Barcelona, AC Milán, PSG',             'Strávil obtížný rok v Barceloně pod Guardiolou; poté AC Milán a pak největší hvězda PSG se čtyřmi tituly Ligue 1.'),
('a0000000-0000-0000-0000-000000000273','Manchester United and LA Galaxy', 'cs','Manchester United a LA Galaxy',         'Přestoupil do Manchesteru United v roce 2016; přešel do LA Galaxy v roce 2018, kde se stal kultovní postavou, než se vrátil do AC Milán a v roce 2023 ukončil kariéru.'),
('a0000000-0000-0000-0000-000000000273','Swedish international career',    'cs','Kariéra ve švédské reprezentaci',       'Vstřelil 62 gólů ve 120 zápasech za Švédsko — národní rekord všech dob; v roce 2016 ukončil reprezentační kariéru, ale v letech 2021–2022 se vrátil.'),

-- ══════════════════════════════════════════════════════════════
-- Greta Thunberg (274)
-- Events: Born in Stockholm · School strike for climate ·
--   Fridays for Future movement · COP24 and UN speeches ·
--   Time Person of the Year 2019
-- ══════════════════════════════════════════════════════════════

-- de
('a0000000-0000-0000-0000-000000000274','Born in Stockholm',               'de','Geboren in Stockholm',                'Am 3. Januar 2003 in Stockholm geboren; Tochter der Opernsängerin Malena Ernman und des Schauspielers Svante Thunberg.'),
('a0000000-0000-0000-0000-000000000274','School strike for climate',       'de','Schulstreik für das Klima',           'Begann am 20. August 2018, vor dem schwedischen Parlament zu sitzen; zeigte ein handgemachtes Schild mit der Aufschrift „Skolstrejk för klimatet" und kehrte bis zu den Wahlen nicht zur Schule zurück.'),
('a0000000-0000-0000-0000-000000000274','Fridays for Future movement',     'de','Fridays for Future',                  'Ihre wöchentlichen Streiks inspirierten Millionen Schülerinnen und Schüler weltweit; die von ihr ausgelöste Bewegung organisierte im September 2019 einen globalen Klimastreik mit über 4 Millionen Teilnehmenden.'),
('a0000000-0000-0000-0000-000000000274','COP24 and UN speeches',           'de','COP24- und UN-Reden',                 'Sprach auf der COP24 in Kattowitz (2018) und beim UN-Klimagipfel in New York (2019), wo sie die berühmte „How dare you"-Rede hielt.'),
('a0000000-0000-0000-0000-000000000274','Time Person of the Year 2019',   'de','Time Person des Jahres 2019',         'Von Time als Person des Jahres 2019 ausgezeichnet — die jüngste Person, die diese Ehrung je erhalten hat.'),

-- sv
('a0000000-0000-0000-0000-000000000274','Born in Stockholm',               'sv','Född i Stockholm',                    'Född den 3 januari 2003 i Stockholm; dotter till operasångerskan Malena Ernman och skådespelaren Svante Thunberg.'),
('a0000000-0000-0000-0000-000000000274','School strike for climate',       'sv','Skolstrejk för klimatet',             'Påbörjade den 20 augusti 2018 sin strejk utanför svenska riksdagen; höll ett hemlagat skyltar med texten "Skolstrejk för klimatet" och återvände inte till skolan förrän Sverige höll riksdagsval.'),
('a0000000-0000-0000-0000-000000000274','Fridays for Future movement',     'sv','Fridays for Future',                  'Hennes veckovisa strejker inspirerade miljoner elever världen över; rörelsen hon satte igång organiserade en global klimatstrejk i september 2019 med över 4 miljoner deltagare.'),
('a0000000-0000-0000-0000-000000000274','COP24 and UN speeches',           'sv','COP24 och FN-tal',                    'Talade vid COP24 i Katowice (2018) och vid FN:s klimataktionsmöte i New York (2019), där hon höll det ikoniska "How dare you"-talet.'),
('a0000000-0000-0000-0000-000000000274','Time Person of the Year 2019',   'sv','Time Årets person 2019',              'Utsedd till Time magazines Årets person 2019 — den yngsta person som någonsin fått den utmärkelsen.'),

-- no
('a0000000-0000-0000-0000-000000000274','Born in Stockholm',               'no','Født i Stockholm',                    'Født 3. januar 2003 i Stockholm; datter av operasanger Malena Ernman og skuespiller Svante Thunberg.'),
('a0000000-0000-0000-0000-000000000274','School strike for climate',       'no','Skolestreik for klimaet',             'Begynte 20. august 2018 å sitte utenfor det svenske parlamentet; holdt et hjemmelaget skilt med teksten "Skolstrejk för klimatet" og vendte ikke tilbake til skolen før Sverige holdt valg.'),
('a0000000-0000-0000-0000-000000000274','Fridays for Future movement',     'no','Fridays for Future',                  'Hennes ukentlige streiker inspirerte millioner av skoleelever globalt; bevegelsen hun satte i gang organiserte en global klimastreik i september 2019 med over 4 millioner deltakere.'),
('a0000000-0000-0000-0000-000000000274','COP24 and UN speeches',           'no','COP24- og FN-taler',                  'Talte på COP24 i Katowice (2018) og på FNs klimaaksjonstoppmøte i New York (2019), der hun holdt den ikoniske "How dare you"-talen.'),
('a0000000-0000-0000-0000-000000000274','Time Person of the Year 2019',   'no','Times Person of the Year 2019',       'Kåret til Times Person of the Year 2019 — den yngste personen som noensinne har fått denne utmerkelsen.'),

-- fi
('a0000000-0000-0000-0000-000000000274','Born in Stockholm',               'fi','Syntynyt Tukholmassa',                'Syntyi 3. tammikuuta 2003 Tukholmassa; oopperalaulaja Malena Ernmanin ja näyttelijä Svante Thunbergin tytär.'),
('a0000000-0000-0000-0000-000000000274','School strike for climate',       'fi','Koulustreikki ilmaston puolesta',     'Aloitti 20. elokuuta 2018 istua Ruotsin parlamentin edessä; piti käsintehdyä kylttiä, jossa luki "Skolstrejk för klimatet", eikä palannut kouluun ennen Ruotsin vaaleja.'),
('a0000000-0000-0000-0000-000000000274','Fridays for Future movement',     'fi','Fridays for Future -liike',           'Hänen viikoittaiset lakkonsa innostivat miljoonia oppilaita ympäri maailmaa; hänen käynnistämänsä liike järjesti syyskuussa 2019 globaalin ilmastolakon, johon osallistui yli 4 miljoonaa ihmistä.'),
('a0000000-0000-0000-0000-000000000274','COP24 and UN speeches',           'fi','COP24- ja YK-puheet',                 'Puhui COP24:ssä Katowicessa (2018) ja YK:n ilmastokokouksessa New Yorkissa (2019), jossa hän piti ikonisen "How dare you" -puheensa.'),
('a0000000-0000-0000-0000-000000000274','Time Person of the Year 2019',   'fi','Time-lehden vuoden henkilö 2019',     'Nimettiin Time-lehden vuoden henkilöksi 2019 — nuorin henkilö, joka on koskaan saanut tämän tunnustuksen.'),

-- lv
('a0000000-0000-0000-0000-000000000274','Born in Stockholm',               'lv','Dzimusi Stokholmā',                   'Dzimusi 2003. gada 3. janvārī Stokholmā; operas dziedātājas Malenas Ērnmanes un aktiera Svantas Tūnberga meita.'),
('a0000000-0000-0000-0000-000000000274','School strike for climate',       'lv','Skolas streiks klimata labā',         '2018. gada 20. augustā sāka sēdēt pie Zviedrijas parlamenta; turēja rokām darinātu plakātu ar uzrakstu "Skolstrejk för klimatet" un neatgriezās skolā līdz Zviedrijas vēlēšanām.'),
('a0000000-0000-0000-0000-000000000274','Fridays for Future movement',     'lv','Fridays for Future kustība',         'Viņas ikstundas streiki iedvesmoja miljonus skolēnu visā pasaulē; 2019. gada septembrī viņas aizsāktā kustība organizēja globālu klimata streiku ar vairāk nekā 4 miljoniem dalībnieku.'),
('a0000000-0000-0000-0000-000000000274','COP24 and UN speeches',           'lv','COP24 un ANO runas',                  'Uzstājās COP24 Katovicē (2018) un ANO Klimata rīcības samitā Ņujorkā (2019), kur teica ikonisko "How dare you" runu.'),
('a0000000-0000-0000-0000-000000000274','Time Person of the Year 2019',   'lv','Time gada personība 2019',            'Nosaukta par Time gada personību 2019 — jaunākā persona, kas jebkad saņēmusi šo godu.'),

-- lt
('a0000000-0000-0000-0000-000000000274','Born in Stockholm',               'lt','Gimė Stokholme',                      'Gimė 2003 m. sausio 3 d. Stokholme; operos dainininkės Malenos Ernman ir aktoriaus Svantės Thunbergo dukra.'),
('a0000000-0000-0000-0000-000000000274','School strike for climate',       'lt','Mokyklos streikas dėl klimato',       '2018 m. rugpjūčio 20 d. pradėjo sėdėti prie Švedijos parlamento; laikė rankų darbo plakatą su užrašu "Skolstrejk för klimatet" ir negrįžo į mokyklą, kol Švedija surengė rinkimus.'),
('a0000000-0000-0000-0000-000000000274','Fridays for Future movement',     'lt','Fridays for Future judėjimas',        'Jos savaitiniai streikai įkvėpė milijonus mokinių visame pasaulyje; 2019 m. rugsėjį jos pradėtas judėjimas surengė pasaulinį klimato streiką, kuriame dalyvavo daugiau nei 4 milijonai žmonių.'),
('a0000000-0000-0000-0000-000000000274','COP24 and UN speeches',           'lt','COP24 ir JT kalbos',                  'Kalbėjo COP24 Katovicuose (2018) ir JT klimato veiksmų aukščiausiojo lygio susitikime Niujorke (2019), kur pasakė ikoninę "How dare you" kalbą.'),
('a0000000-0000-0000-0000-000000000274','Time Person of the Year 2019',   'lt','Time metų asmenybė 2019',             'Pavadinta Time žurnalo metų asmenybe 2019 — jauniausia asmuo, kada nors gavęs šį apdovanojimą.'),

-- nl
('a0000000-0000-0000-0000-000000000274','Born in Stockholm',               'nl','Geboren in Stockholm',                'Geboren op 3 januari 2003 in Stockholm; dochter van operazangeres Malena Ernman en acteur Svante Thunberg.'),
('a0000000-0000-0000-0000-000000000274','School strike for climate',       'nl','Schoolstaking voor het klimaat',      'Begon op 20 augustus 2018 voor het Zweedse parlement te zitten; droeg een zelfgemaakt bord met "Skolstrejk för klimatet" en keerde niet terug naar school totdat Zweden verkiezingen hield.'),
('a0000000-0000-0000-0000-000000000274','Fridays for Future movement',     'nl','Fridays for Future',                  'Haar wekelijkse stakingen inspireerden miljoenen leerlingen wereldwijd; de beweging die ze op gang bracht organiseerde in september 2019 een mondiale klimaatstaking met meer dan 4 miljoen deelnemers.'),
('a0000000-0000-0000-0000-000000000274','COP24 and UN speeches',           'nl','COP24- en VN-toespraken',             'Sprak op COP24 in Katowice (2018) en de VN-klimaattop in New York (2019), waar ze de iconische "How dare you"-toespraak hield.'),
('a0000000-0000-0000-0000-000000000274','Time Person of the Year 2019',   'nl','Time Persoon van het Jaar 2019',      'Benoemd tot Time''s Persoon van het Jaar 2019 — de jongste persoon die deze eer ooit te beurt viel.'),

-- fr
('a0000000-0000-0000-0000-000000000274','Born in Stockholm',               'fr','Née à Stockholm',                     'Née le 3 janvier 2003 à Stockholm ; fille de la chanteuse d''opéra Malena Ernman et de l''acteur Svante Thunberg.'),
('a0000000-0000-0000-0000-000000000274','School strike for climate',       'fr','Grève scolaire pour le climat',       'A commencé le 20 août 2018 à s''asseoir devant le parlement suédois ; tenait une pancarte faite main avec la mention "Skolstrejk för klimatet" et n''est pas retournée à l''école avant les élections suédoises.'),
('a0000000-0000-0000-0000-000000000274','Fridays for Future movement',     'fr','Mouvement Fridays for Future',        'Ses grèves hebdomadaires ont inspiré des millions d''élèves dans le monde ; le mouvement qu''elle a catalysé a organisé une grève mondiale pour le climat en septembre 2019 avec plus de 4 millions de participants.'),
('a0000000-0000-0000-0000-000000000274','COP24 and UN speeches',           'fr','Discours à la COP24 et à l''ONU',     'A pris la parole à la COP24 à Katowice (2018) et au Sommet de l''ONU sur l''action climatique à New York (2019), où elle a prononcé le discours iconique "How dare you".'),
('a0000000-0000-0000-0000-000000000274','Time Person of the Year 2019',   'fr','Personnalité de l''année 2019 selon Time','Nommée Personnalité de l''année 2019 par Time — la plus jeune personne à avoir jamais reçu cette distinction.'),

-- es
('a0000000-0000-0000-0000-000000000274','Born in Stockholm',               'es','Nacida en Estocolmo',                 'Nacida el 3 de enero de 2003 en Estocolmo; hija de la cantante de ópera Malena Ernman y del actor Svante Thunberg.'),
('a0000000-0000-0000-0000-000000000274','School strike for climate',       'es','Huelga escolar por el clima',         'Comenzó el 20 de agosto de 2018 a sentarse frente al parlamento sueco; sostenía un cartel hecho a mano con la leyenda "Skolstrejk för klimatet" y no volvió a la escuela hasta que Suecia celebró elecciones.'),
('a0000000-0000-0000-0000-000000000274','Fridays for Future movement',     'es','Movimiento Fridays for Future',       'Sus huelgas semanales inspiraron a millones de estudiantes en todo el mundo; el movimiento que catalizó organizó una huelga climática mundial en septiembre de 2019 con más de 4 millones de participantes.'),
('a0000000-0000-0000-0000-000000000274','COP24 and UN speeches',           'es','Discursos en la COP24 y la ONU',      'Habló ante líderes mundiales en la COP24 en Katowice (2018) y en la Cumbre de Acción Climática de la ONU en Nueva York (2019), donde pronunció el icónico discurso "How dare you".'),
('a0000000-0000-0000-0000-000000000274','Time Person of the Year 2019',   'es','Persona del Año de Time 2019',        'Nombrada Persona del Año de la revista Time en 2019 — la persona más joven en recibir este honor.'),

-- it
('a0000000-0000-0000-0000-000000000274','Born in Stockholm',               'it','Nata a Stoccolma',                    'Nata il 3 gennaio 2003 a Stoccolma; figlia della cantante lirica Malena Ernman e dell''attore Svante Thunberg.'),
('a0000000-0000-0000-0000-000000000274','School strike for climate',       'it','Sciopero scolastico per il clima',    'Ha iniziato il 20 agosto 2018 a sedersi davanti al parlamento svedese; teneva un cartello fatto a mano con la scritta "Skolstrejk för klimatet" e non è tornata a scuola fino alle elezioni svedesi.'),
('a0000000-0000-0000-0000-000000000274','Fridays for Future movement',     'it','Movimento Fridays for Future',        'I suoi scioperi settimanali hanno ispirato milioni di studenti in tutto il mondo; il movimento da lei catalizzato ha organizzato uno sciopero climatico globale nel settembre 2019 con oltre 4 milioni di partecipanti.'),
('a0000000-0000-0000-0000-000000000274','COP24 and UN speeches',           'it','Discorsi alla COP24 e all''ONU',      'Ha preso la parola alla COP24 a Katowice (2018) e al Vertice delle Nazioni Unite sull''azione per il clima a New York (2019), dove ha pronunciato il celebre discorso "How dare you".'),
('a0000000-0000-0000-0000-000000000274','Time Person of the Year 2019',   'it','Persona dell''anno di Time 2019',     'Nominata Persona dell''anno 2019 da Time — la persona più giovane ad aver mai ricevuto questo riconoscimento.'),

-- da
('a0000000-0000-0000-0000-000000000274','Born in Stockholm',               'da','Født i Stockholm',                    'Født den 3. januar 2003 i Stockholm; datter af operasanger Malena Ernman og skuespiller Svante Thunberg.'),
('a0000000-0000-0000-0000-000000000274','School strike for climate',       'da','Skolestreik for klimaet',             'Begyndte den 20. august 2018 at sidde foran det svenske parlament; holdt et hjemmelavet skilt med teksten "Skolstrejk för klimatet" og vendte ikke tilbage til skolen, før Sverige afholdt valg.'),
('a0000000-0000-0000-0000-000000000274','Fridays for Future movement',     'da','Fridays for Future',                  'Hendes ugentlige strejker inspirerede millioner af skoleelever verden over; den bevægelse, hun satte i gang, organiserede i september 2019 en global klimastrejke med over 4 millioner deltagere.'),
('a0000000-0000-0000-0000-000000000274','COP24 and UN speeches',           'da','COP24- og FN-taler',                  'Talte på COP24 i Katowice (2018) og ved FN''s klimatopmøde i New York (2019), hvor hun holdt den ikoniske "How dare you"-tale.'),
('a0000000-0000-0000-0000-000000000274','Time Person of the Year 2019',   'da','Times Person of the Year 2019',       'Udnævnt til Times Person of the Year 2019 — den yngste person, der nogensinde har modtaget denne ære.'),

-- pl
('a0000000-0000-0000-0000-000000000274','Born in Stockholm',               'pl','Urodzona w Sztokholmie',              'Urodzona 3 stycznia 2003 roku w Sztokholmie; córka śpiewaczki operowej Maleny Ernman i aktora Svantego Thunberga.'),
('a0000000-0000-0000-0000-000000000274','School strike for climate',       'pl','Szkolny strajk klimatyczny',          'Zaczęła siedzieć przed szwedzkim parlamentem 20 sierpnia 2018 roku; trzymała ręcznie napisany transparent z napisem "Skolstrejk för klimatet" i nie wróciła do szkoły aż do wyborów w Szwecji.'),
('a0000000-0000-0000-0000-000000000274','Fridays for Future movement',     'pl','Ruch Fridays for Future',             'Jej cotygodniowe strajki zainspirowały miliony uczniów na całym świecie; ruch, który zapoczątkowała, zorganizował w wrześniu 2019 roku globalny strajk klimatyczny z udziałem ponad 4 milionów osób.'),
('a0000000-0000-0000-0000-000000000274','COP24 and UN speeches',           'pl','Przemówienia na COP24 i w ONZ',       'Przemawiała na COP24 w Katowicach (2018) i na Szczycie Działań Klimatycznych ONZ w Nowym Jorku (2019), gdzie wygłosiła ikoniczne przemówienie "How dare you".'),
('a0000000-0000-0000-0000-000000000274','Time Person of the Year 2019',   'pl','Człowiek Roku magazynu Time 2019',   'Ogłoszona Człowiekiem Roku magazynu Time w 2019 — najmłodsza osoba, która kiedykolwiek otrzymała to wyróżnienie.'),

-- cs
('a0000000-0000-0000-0000-000000000274','Born in Stockholm',               'cs','Narozena ve Stockholmu',              'Narozena 3. ledna 2003 ve Stockholmu; dcera operní zpěvačky Maleny Ernman a herce Svanteho Thunberga.'),
('a0000000-0000-0000-0000-000000000274','School strike for climate',       'cs','Školní stávka za klima',              'Začala 20. srpna 2018 sedět před švédským parlamentem; držela ručně vyrobený transparent s nápisem "Skolstrejk för klimatet" a nevrátila se do školy, dokud Švédsko neuspořádalo volby.'),
('a0000000-0000-0000-0000-000000000274','Fridays for Future movement',     'cs','Hnutí Fridays for Future',            'Její týdenní stávky inspirovaly miliony studentů po celém světě; hnutí, které spustila, uspořádalo v září 2019 globální klimatickou stávku s více než 4 miliony účastníků.'),
('a0000000-0000-0000-0000-000000000274','COP24 and UN speeches',           'cs','Projevy na COP24 a OSN',              'Promluvila na COP24 v Katovicích (2018) a na Summitu OSN o klimatické akci v New Yorku (2019), kde přednesla ikonický projev "How dare you".'),
('a0000000-0000-0000-0000-000000000274','Time Person of the Year 2019',   'cs','Osobnost roku 2019 podle Time',      'Jmenována Osobností roku 2019 podle Time — nejmladší osoba, která kdy toto ocenění obdržela.'),

-- ══════════════════════════════════════════════════════════════
-- Avicii / Tim Bergling (275)
-- Events: Born in Stockholm · Levels and international breakthrough ·
--   Wake Me Up — massive hit · Acute pancreatitis ·
--   Retired from touring · Died in Muscat, Oman
-- ══════════════════════════════════════════════════════════════

-- de
('a0000000-0000-0000-0000-000000000275','Born in Stockholm',               'de','Geboren in Stockholm',                'Am 8. September 1989 als Tim Bergling in Stockholm geboren; begann als Teenager, elektronische Musik auf seinem Laptop zu produzieren.'),
('a0000000-0000-0000-0000-000000000275','Levels and international breakthrough','de','Levels und internationaler Durchbruch','Veröffentlichte 2011 Levels; der euphorische Track wurde eine der prägendsten Songs der EDM-Ära und katapultierte ihn zu weltweitem Ruhm.'),
('a0000000-0000-0000-0000-000000000275','Wake Me Up — massive hit',        'de','Wake Me Up — riesiger Hit',           'Wake Me Up (2013) verband Country und EDM und erreichte Platz 1 in 22 Ländern; sprengte Genregrenzen und vergrößerte sein Publikum erheblich.'),
('a0000000-0000-0000-0000-000000000275','Acute pancreatitis',              'de','Akute Pankreatitis',                  'Litt ab 2012 unter schwerer akuter Pankreatitis durch starken Alkoholkonsum; hatte 2014 eine Notoperation an der Gallenblase; sein Gesundheitszustand verschlechterte sich stetig.'),
('a0000000-0000-0000-0000-000000000275','Retired from touring',            'de','Rücktritt vom Tournen',               'Trat 2016 öffentlich aus gesundheitlichen Gründen vom Live-Tournen zurück; produzierte weiterhin Musik aus der Ferne.'),
('a0000000-0000-0000-0000-000000000275','Died in Muscat, Oman',            'de','Gestorben in Maskat, Oman',           'Am 20. April 2018 tot in Maskat, Oman, aufgefunden; 28 Jahre alt; Tod als Suizid eingestuft; weltweit betrauert.'),

-- sv
('a0000000-0000-0000-0000-000000000275','Born in Stockholm',               'sv','Född i Stockholm',                    'Född som Tim Bergling den 8 september 1989 i Stockholm; började producera elektronisk musik på sin laptop som tonåring.'),
('a0000000-0000-0000-0000-000000000275','Levels and international breakthrough','sv','Levels och det internationella genombrottet','Släppte Levels 2011; den euforiska låten blev en av EDM-erans definierande låtar och katapulterade honom till global stjärnstatus.'),
('a0000000-0000-0000-0000-000000000275','Wake Me Up — massive hit',        'sv','Wake Me Up — enormt genombrott',      'Wake Me Up (2013) blandade country och EDM och nådde listtoppen i 22 länder; utmanade genregränser och expanderade hans publik enormt.'),
('a0000000-0000-0000-0000-000000000275','Acute pancreatitis',              'sv','Akut pankreatit',                     'Drabbades av svår akut pankreatit från 2012 på grund av hög alkoholkonsumtion; genomgick akut gallblåseoperation 2014; hälsan försämrades stadigt.'),
('a0000000-0000-0000-0000-000000000275','Retired from touring',            'sv','Drog sig tillbaka från turnéer',      'Drog sig offentligt tillbaka från liveturnerande 2016 av hälsoskäl; fortsatte att producera musik på distans.'),
('a0000000-0000-0000-0000-000000000275','Died in Muscat, Oman',            'sv','Avled i Muscat, Oman',               'Hittades död i Muscat, Oman, den 20 april 2018, 28 år gammal; dödsorsaken fastställdes som självmord; sörjdes världen över.'),

-- no
('a0000000-0000-0000-0000-000000000275','Born in Stockholm',               'no','Født i Stockholm',                    'Født Tim Bergling 8. september 1989 i Stockholm; begynte å produsere elektronisk musikk på laptopen som tenåring.'),
('a0000000-0000-0000-0000-000000000275','Levels and international breakthrough','no','Levels og det internasjonale gjennombruddet','Slapp Levels i 2011; den euforiske låten ble en av EDM-eraens definerende sanger og skjøt ham til global stjernestatus.'),
('a0000000-0000-0000-0000-000000000275','Wake Me Up — massive hit',        'no','Wake Me Up — enorm hit',              'Wake Me Up (2013) blandet country og EDM og nådde førsteplass i 22 land; utfordret sjangergrenser og utvidet publikummet hans enormt.'),
('a0000000-0000-0000-0000-000000000275','Acute pancreatitis',              'no','Akutt pankreatitt',                   'Fikk alvorlig akutt pankreatitt fra 2012 på grunn av høyt alkoholforbruk; hadde akutt galleblæreoperasjon i 2014; helsen forverret seg jevnt.'),
('a0000000-0000-0000-0000-000000000275','Retired from touring',            'no','Trakk seg fra turneer',               'Trakk seg offentlig fra live-turnevirksomhet i 2016 av helsemessige årsaker; fortsatte å produsere musikk på avstand.'),
('a0000000-0000-0000-0000-000000000275','Died in Muscat, Oman',            'no','Døde i Muskat, Oman',                'Funnet død i Muskat, Oman, 20. april 2018, 28 år gammel; dødsfallet ble klassifisert som selvmord; sørget over verden over.'),

-- fi
('a0000000-0000-0000-0000-000000000275','Born in Stockholm',               'fi','Syntynyt Tukholmassa',                'Syntyi Tim Berglingina 8. syyskuuta 1989 Tukholmassa; alkoi tuottaa elektronista musiikkia kannettavallaan teini-ikäisenä.'),
('a0000000-0000-0000-0000-000000000275','Levels and international breakthrough','fi','Levels ja kansainvälinen läpimurto',  'Julkaisi Levelsin vuonna 2011; euforinen kappale nousi yhdeksi EDM-aikakauden määrittävistä hiteistä ja ampaisee hänet maailmanmaineeseen.'),
('a0000000-0000-0000-0000-000000000275','Wake Me Up — massive hit',        'fi','Wake Me Up — massiivinen hitti',      'Wake Me Up (2013) yhdisti countryn ja EDM:n, nousi listaykköseksi 22 maassa ja laajensi hänen yleisöään huomattavasti.'),
('a0000000-0000-0000-0000-000000000275','Acute pancreatitis',              'fi','Akuutti haimatulehdus',               'Kärsi vakavasta akuutista haimatulehduksesta vuodesta 2012 alkaen runsaan alkoholin käytön vuoksi; sappirakko poistettiin hätäleikkauksessa 2014; terveys heikkeni tasaisesti.'),
('a0000000-0000-0000-0000-000000000275','Retired from touring',            'fi','Lopetti kiertueilla esiintymisen',    'Ilmoitti julkisesti vetäytyvänsä liveesiintymisestä 2016 terveydellisistä syistä; jatkoi musiikin tuottamista etänä.'),
('a0000000-0000-0000-0000-000000000275','Died in Muscat, Oman',            'fi','Kuoli Muscatissa, Omanissa',         'Löydettiin kuolleena Muscatista, Omanista, 20. huhtikuuta 2018, 28-vuotiaana; kuolema luokiteltiin itsemurhaksi; maailma suri häntä.'),

-- lv
('a0000000-0000-0000-0000-000000000275','Born in Stockholm',               'lv','Dzimis Stokholmā',                   'Dzimis kā Tims Berglins 1989. gada 8. septembrī Stokholmā; teenis gados sāka producēt elektronisko mūziku uz klēpjdatora.'),
('a0000000-0000-0000-0000-000000000275','Levels and international breakthrough','lv','Levels un starptautiskais izrāviens','Izlaida Levels 2011. gadā; eiforiskais dziesmas kļuva par vienu no EDM laikmeta noteicošajiem hitiem un katapultēja viņu pasaules slavā.'),
('a0000000-0000-0000-0000-000000000275','Wake Me Up — massive hit',        'lv','Wake Me Up — milzīgs hits',           'Wake Me Up (2013) apvienoja country un EDM, ieņēma pirmo vietu 22 valstīs un krasi paplašināja viņa auditoriju.'),
('a0000000-0000-0000-0000-000000000275','Acute pancreatitis',              'lv','Akūts pankreatīts',                   'No 2012. gada cieta no smagas akūta pankreatīta intensīva alkohola patēriņa dēļ; 2014. gadā tika veikta akūta žultspūšļa operācija; veselība pasliktinājās vienmērīgi.'),
('a0000000-0000-0000-0000-000000000275','Retired from touring',            'lv','Pārtrauca turnejas',                  '2016. gadā publiski paziņoja par aiziešanu no dzīvajiem koncerti veselības apsvērumu dēļ; turpināja producēt mūziku attālināti.'),
('a0000000-0000-0000-0000-000000000275','Died in Muscat, Oman',            'lv','Miris Maskatas, Omānā',              'Atrasts miris Maskatā, Omānā, 2018. gada 20. aprīlī, 28 gadu vecumā; nāve klasificēta kā pašnāvība; tika sērotas visā pasaulē.'),

-- lt
('a0000000-0000-0000-0000-000000000275','Born in Stockholm',               'lt','Gimė Stokholme',                      'Gimė Timu Berglingu 1989 m. rugsėjo 8 d. Stokholme; paauglystėje pradėjo gaminti elektroninę muziką nešiojamajame kompiuteryje.'),
('a0000000-0000-0000-0000-000000000275','Levels and international breakthrough','lt','Levels ir tarptautinis proveržis',   'Išleido Levels 2011 m.; euforinis kūrinys tapo vienu iš EDM eros apibrėžiančių hitų ir katapultavo jį į pasaulinę šlovę.'),
('a0000000-0000-0000-0000-000000000275','Wake Me Up — massive hit',        'lt','Wake Me Up — masinis hitas',          'Wake Me Up (2013) sumaišė country ir EDM, užėmė pirmą vietą 22 šalių topuose ir gerokai išplėtė jo auditoriją.'),
('a0000000-0000-0000-0000-000000000275','Acute pancreatitis',              'lt','Ūminis pankreatitas',                 'Nuo 2012 m. kentėjo nuo sunkaus ūminio pankreatito dėl gausaus alkoholio vartojimo; 2014 m. atliko skubią tulžies pūslės operaciją; sveikata nuolat blogėjo.'),
('a0000000-0000-0000-0000-000000000275','Retired from touring',            'lt','Atsisakė gastrolia',                  '2016 m. viešai paskelbė pasitraukiantis iš gyvo pasirodymo dėl sveikatos priežasčių; toliau kūrė muziką nuotoliniu būdu.'),
('a0000000-0000-0000-0000-000000000275','Died in Muscat, Oman',            'lt','Mirė Maskate, Omane',                'Rastas miręs Maskate, Omane, 2018 m. balandžio 20 d., 28 metų amžiaus; mirtis kvalifikuota kaip savižudybė; gedėjo visas pasaulis.'),

-- nl
('a0000000-0000-0000-0000-000000000275','Born in Stockholm',               'nl','Geboren in Stockholm',                'Geboren als Tim Bergling op 8 september 1989 in Stockholm; begon als tiener elektronische muziek te produceren op zijn laptop.'),
('a0000000-0000-0000-0000-000000000275','Levels and international breakthrough','nl','Levels en internationale doorbraak','Bracht Levels uit in 2011; het euforische nummer werd een van de bepalende nummers van het EDM-tijdperk en schoot hem naar wereldroem.'),
('a0000000-0000-0000-0000-000000000275','Wake Me Up — massive hit',        'nl','Wake Me Up — enorme hit',             'Wake Me Up (2013) combineerde country en EDM, bereikte de eerste plek in 22 landen en vergrootte zijn publiek aanzienlijk.'),
('a0000000-0000-0000-0000-000000000275','Acute pancreatitis',              'nl','Acute pancreatitis',                  'Leed vanaf 2012 aan ernstige acute pancreatitis door overmatig alcoholgebruik; onderging in 2014 een noodoperatie aan de galblaas; zijn gezondheid verslechterde gestaag.'),
('a0000000-0000-0000-0000-000000000275','Retired from touring',            'nl','Gestopt met touren',                  'Kondigde in 2016 publiekelijk aan te stoppen met live optreden om gezondheidsredenen; bleef op afstand muziek produceren.'),
('a0000000-0000-0000-0000-000000000275','Died in Muscat, Oman',            'nl','Overleden in Muscat, Oman',           'Op 20 april 2018 dood aangetroffen in Muscat, Oman; 28 jaar oud; dood geclassificeerd als zelfmoord; wereldwijd betreurd.'),

-- fr
('a0000000-0000-0000-0000-000000000275','Born in Stockholm',               'fr','Né à Stockholm',                      'Né Tim Bergling le 8 septembre 1989 à Stockholm ; a commencé à produire de la musique électronique sur son ordinateur portable à l''adolescence.'),
('a0000000-0000-0000-0000-000000000275','Levels and international breakthrough','fr','Levels et percée internationale',   'A sorti Levels en 2011 ; ce morceau euphorique est devenu l''un des titres phares de l''ère EDM et l''a propulsé vers la gloire mondiale.'),
('a0000000-0000-0000-0000-000000000275','Wake Me Up — massive hit',        'fr','Wake Me Up — énorme succès',          'Wake Me Up (2013) a fusionné country et EDM, atteignant la première place dans 22 pays ; a bousculé les frontières des genres et considérablement élargi son public.'),
('a0000000-0000-0000-0000-000000000275','Acute pancreatitis',              'fr','Pancréatite aiguë',                   'A souffert d''une grave pancréatite aiguë à partir de 2012 due à une consommation excessive d''alcool ; a subi une opération d''urgence de la vésicule biliaire en 2014 ; sa santé s''est progressivement dégradée.'),
('a0000000-0000-0000-0000-000000000275','Retired from touring',            'fr','Arrêt des tournées',                  'A annoncé publiquement en 2016 son arrêt des concerts live pour des raisons de santé ; a continué à produire de la musique à distance.'),
('a0000000-0000-0000-0000-000000000275','Died in Muscat, Oman',            'fr','Décédé à Mascate, Oman',             'Retrouvé mort à Mascate, Oman, le 20 avril 2018, à 28 ans ; décès classé comme suicide ; pleuré dans le monde entier.'),

-- es
('a0000000-0000-0000-0000-000000000275','Born in Stockholm',               'es','Nacido en Estocolmo',                 'Nacido como Tim Bergling el 8 de septiembre de 1989 en Estocolmo; comenzó a producir música electrónica en su ordenador portátil durante la adolescencia.'),
('a0000000-0000-0000-0000-000000000275','Levels and international breakthrough','es','Levels y el éxito internacional',  'Publicó Levels en 2011; la eufórica pista se convirtió en uno de los himnos definitorios de la era EDM y lo lanzó a la fama mundial.'),
('a0000000-0000-0000-0000-000000000275','Wake Me Up — massive hit',        'es','Wake Me Up — enorme éxito',           'Wake Me Up (2013) fusionó country y EDM, alcanzando el número uno en 22 países; desafió los límites del género y amplió enormemente su audiencia.'),
('a0000000-0000-0000-0000-000000000275','Acute pancreatitis',              'es','Pancreatitis aguda',                  'Sufrió una grave pancreatitis aguda desde 2012 por un consumo excesivo de alcohol; fue operado de urgencia de la vesícula biliar en 2014; su salud se deterioró constantemente.'),
('a0000000-0000-0000-0000-000000000275','Retired from touring',            'es','Se retiró de las giras',              'Anunció públicamente en 2016 su retirada de las actuaciones en directo por motivos de salud; continuó produciendo música de forma remota.'),
('a0000000-0000-0000-0000-000000000275','Died in Muscat, Oman',            'es','Murió en Mascate, Omán',             'Encontrado muerto en Mascate, Omán, el 20 de abril de 2018, con 28 años; muerte declarada como suicidio; llorado en todo el mundo.'),

-- it
('a0000000-0000-0000-0000-000000000275','Born in Stockholm',               'it','Nato a Stoccolma',                    'Nato come Tim Bergling l''8 settembre 1989 a Stoccolma; ha iniziato a produrre musica elettronica sul suo laptop da adolescente.'),
('a0000000-0000-0000-0000-000000000275','Levels and international breakthrough','it','Levels e il successo internazionale','Ha pubblicato Levels nel 2011; il brano euforico è diventato uno degli inni più rappresentativi dell''era EDM e lo ha lanciato verso la fama mondiale.'),
('a0000000-0000-0000-0000-000000000275','Wake Me Up — massive hit',        'it','Wake Me Up — enorme successo',        'Wake Me Up (2013) ha fuso country ed EDM, raggiungendo il primo posto in 22 paesi; ha sfidato i confini del genere e ampliato enormemente il suo pubblico.'),
('a0000000-0000-0000-0000-000000000275','Acute pancreatitis',              'it','Pancreatite acuta',                   'Ha sofferto di grave pancreatite acuta dal 2012 a causa di un eccessivo consumo di alcol; ha subito un''operazione d''urgenza alla colecisti nel 2014; la salute è peggiorata costantemente.'),
('a0000000-0000-0000-0000-000000000275','Retired from touring',            'it','Ritiro dai tour',                     'Ha annunciato pubblicamente nel 2016 il ritiro dai live per motivi di salute; ha continuato a produrre musica da remoto.'),
('a0000000-0000-0000-0000-000000000275','Died in Muscat, Oman',            'it','Morto a Muscat, Oman',               'Trovato morto a Muscat, Oman, il 20 aprile 2018, all''età di 28 anni; morte classificata come suicidio; compianto in tutto il mondo.'),

-- da
('a0000000-0000-0000-0000-000000000275','Born in Stockholm',               'da','Født i Stockholm',                    'Født Tim Bergling den 8. september 1989 i Stockholm; begyndte som teenager at producere elektronisk musik på sin bærbare computer.'),
('a0000000-0000-0000-0000-000000000275','Levels and international breakthrough','da','Levels og det internationale gennembrud','Udgav Levels i 2011; det euforiske nummer blev et af EDM-æraens definerende sange og skød ham til verdensberømmelse.'),
('a0000000-0000-0000-0000-000000000275','Wake Me Up — massive hit',        'da','Wake Me Up — kæmpehit',               'Wake Me Up (2013) fusionerede country og EDM, nåede førstepladsen i 22 lande og udvidede hans publikum enormt.'),
('a0000000-0000-0000-0000-000000000275','Acute pancreatitis',              'da','Akut pankreatitis',                   'Led af alvorlig akut pankreatitis fra 2012 på grund af stort alkoholforbrug; fik akut operation af galdeblæren i 2014; helbredet forværredes støt.'),
('a0000000-0000-0000-0000-000000000275','Retired from touring',            'da','Trak sig fra turneer',                'Meddelte offentligt i 2016 at han trak sig fra liveoptrædener af helbredsmæssige årsager; fortsatte med at producere musik på afstand.'),
('a0000000-0000-0000-0000-000000000275','Died in Muscat, Oman',            'da','Døde i Muscat, Oman',                'Fundet død i Muscat, Oman, den 20. april 2018, 28 år gammel; dødsfald klassificeret som selvmord; sørget over verden over.'),

-- pl
('a0000000-0000-0000-0000-000000000275','Born in Stockholm',               'pl','Urodzony w Sztokholmie',              'Urodzony jako Tim Bergling 8 września 1989 roku w Sztokholmie; jako nastolatek zaczął produkować muzykę elektroniczną na laptopie.'),
('a0000000-0000-0000-0000-000000000275','Levels and international breakthrough','pl','Levels i międzynarodowy przełom',   'Wydał Levels w 2011 roku; euforyczny utwór stał się jednym z definiujących hitów ery EDM i wyniósł go do światowej sławy.'),
('a0000000-0000-0000-0000-000000000275','Wake Me Up — massive hit',        'pl','Wake Me Up — ogromny hit',            'Wake Me Up (2013) połączył country z EDM, zajął pierwsze miejsce w 22 krajach i znacznie rozszerzył jego publiczność.'),
('a0000000-0000-0000-0000-000000000275','Acute pancreatitis',              'pl','Ostre zapalenie trzustki',            'Od 2012 roku cierpiał na ciężkie ostre zapalenie trzustki spowodowane nadmiernym spożyciem alkoholu; w 2014 roku przeszedł pilną operację woreczka żółciowego; jego zdrowie stale się pogarszało.'),
('a0000000-0000-0000-0000-000000000275','Retired from touring',            'pl','Zakończył karierę koncertową',        'W 2016 roku publicznie ogłosił rezygnację z tras koncertowych ze względów zdrowotnych; kontynuował produkcję muzyki zdalnie.'),
('a0000000-0000-0000-0000-000000000275','Died in Muscat, Oman',            'pl','Zmarł w Maskacie w Omanie',           'Znaleziony martwy w Maskacie w Omanie 20 kwietnia 2018 roku, w wieku 28 lat; śmierć zakwalifikowana jako samobójstwo; opłakiwany na całym świecie.'),

-- cs
('a0000000-0000-0000-0000-000000000275','Born in Stockholm',               'cs','Narozen ve Stockholmu',               'Narozen jako Tim Bergling 8. září 1989 ve Stockholmu; jako teenager začal produkovat elektronickou hudbu na svém laptopu.'),
('a0000000-0000-0000-0000-000000000275','Levels and international breakthrough','cs','Levels a mezinárodní průlom',       'Vydal Levels v roce 2011; euforický track se stal jedním z definujících hitů éry EDM a katapultoval ho ke světové slávě.'),
('a0000000-0000-0000-0000-000000000275','Wake Me Up — massive hit',        'cs','Wake Me Up — obrovský hit',           'Wake Me Up (2013) spojil country a EDM, dosáhl první příčky v 22 zemích a výrazně rozšířil jeho publikum.'),
('a0000000-0000-0000-0000-000000000275','Acute pancreatitis',              'cs','Akutní pankreatitida',                'Od roku 2012 trpěl těžkou akutní pankreatitidou způsobenou nadměrnou konzumací alkoholu; v roce 2014 podstoupil nouzovou operaci žlučníku; jeho zdraví se neustále zhoršovalo.'),
('a0000000-0000-0000-0000-000000000275','Retired from touring',            'cs','Ukončil turné',                       'V roce 2016 veřejně oznámil ukončení živých vystoupení ze zdravotních důvodů; nadále produkoval hudbu na dálku.'),
('a0000000-0000-0000-0000-000000000275','Died in Muscat, Oman',            'cs','Zemřel v Maskatu, Omán',             'Nalezen mrtvý v Maskatu, Omán, dne 20. dubna 2018, ve věku 28 let; smrt klasifikována jako sebevražda; oplakáván po celém světě.');

-- ── Backfill persona_event_id for newly inserted rows ────────
-- Matches on (persona_id, trim+lower title) — same logic as migration 040.
UPDATE public.persona_event_translations pet
SET    persona_event_id = pe.id
FROM   public.persona_events pe
WHERE  pet.persona_event_id IS NULL
  AND  pet.persona_id            = pe.persona_id
  AND  trim(lower(pet.title_en)) = trim(lower(pe.title));
