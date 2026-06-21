-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jun 21, 2026 at 06:41 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projekt`
--

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id` int(11) NOT NULL,
  `ime` varchar(32) NOT NULL,
  `prezime` varchar(32) NOT NULL,
  `korisnicko_ime` varchar(32) NOT NULL,
  `lozinka` varchar(255) NOT NULL,
  `razina` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `ime`, `prezime`, `korisnicko_ime`, `lozinka`, `razina`) VALUES
(1, 'Luka', 'Gavran', 'lgavran', '$2y$10$u4qwS28ctDRaqCbkT2FXc..DuFEeiUBcGuU2vZi5dAyOTnZV.HWXO', 1),
(2, 'Test', 'Testis', 'tester', '$2y$10$pEfHxTy9R67qri.vrAF.yOUJ9YpvCQcRJwIJn7I9c6cvPbkmQU7OG', 0),
(3, 'obican', 'user', 'user', '$2y$10$f7w1qABGjTErqF0HQ7xQ/OdDVG2yM.tVxVzj2qeX.ZpEy71vihBC2', 0),
(4, 'Admin', 'Admin', 'admin', '$2y$10$CyWDoCbHOVk5toSu97A31.Em4UpoyBvWoNkunb1cUWSP1lB6ea.Ra', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vijesti`
--

CREATE TABLE `vijesti` (
  `id` int(11) NOT NULL,
  `datum` datetime DEFAULT current_timestamp(),
  `naslov` varchar(255) NOT NULL,
  `sazetak` text NOT NULL,
  `tekst` text NOT NULL,
  `slika` varchar(255) NOT NULL,
  `kategorija` varchar(50) NOT NULL,
  `arhiva` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vijesti`
--

INSERT INTO `vijesti` (`id`, `datum`, `naslov`, `sazetak`, `tekst`, `slika`, `kategorija`, `arhiva`) VALUES
(5, '2026-06-20 20:05:15', 'Anonimni čitatelj kupio ženi Tau vojsku, kutije još uvijek netaknute', 'Jedan anonimni čitatelj odlučio je napraviti hrabar, možda i opasan potez: kupio je svojoj ženi Tau vojsku. Iako je gesta dočekana kao romantičan iskorak u smjeru zajedničkog hobija, situacija ima jedan ozbiljan problem — kutije još uvijek nisu otvorene, a ni kodeks nije pročitan.', 'U svijetu Warhammera, gdje ljudi često troše razumne količine novca na male plastične vojnike, jedan anonimni čitatelj podigao je ljestvicu i odlučio svojoj ženi kupiti cijelu Tau vojsku. Prema izvorima bliskima slučaju, riječ je o potezu koji balansira između bračne romantike, hobističkog nagovaranja i financijske neodgovornosti.\r\n\r\nNa prvi pogled, priča djeluje kao dokaz prave ljubavi. Umjesto cvijeća, parfema ili vikend putovanja, anonimni donator odabrao je nešto dublje — futurističku vojnu silu, borbene oklope i dovoljno pulsnog naoružanja da se susjedstvu objasni što znači borba za Više Dobro. Međutim, razvoj događaja nije ispunio početna očekivanja.\r\n\r\nKljučni detalj koji je uznemirio lokalnu zajednicu hobista jest činjenica da kutije još uvijek nisu otvorene.\r\n\r\nDa, dobro ste pročitali. Vojska je kupljena. Kutije postoje. Fizički su prisutne. Ali plastični okviri i dalje mirno leže u ambalaži, netaknuti, neizrezani i potpuno lišeni boje. Još ozbiljnije od toga, prema neslužbenim informacijama, ni kodeks nije pročitan. Pravila nisu proučena, jedinice nisu analizirane, a zapovjedna struktura Tau vojske zasad postoji samo kao teorijska mogućnost.\r\n\r\nAnalitičari smatraju da se trenutno nalazimo u osjetljivoj fazi procesa. S jedne strane, kupnja Tau vojske mogla bi predstavljati početak zdravog zajedničkog hobija, budućih partija i možda čak zajedničkog slaganja vojske. S druge strane, postoji realna opasnost da kutije završe u kategoriji lijepih namjera i provedu mjesece, a možda i godine, čekajući svoj trenutak.\r\n\r\nPosebno je zanimljivo što anonimni čitatelj navodno i dalje vjeruje da je sve pod kontrolom. Prema svjedocima, izjavio je da “nema razloga za paniku” i da je “bitno da vojska postoji”. Neki iskusniji promatrači ipak upozoravaju da sama prisutnost zatvorenih kutija u stanu ne predstavlja stvarni napredak, koliko god se vlasnik trudio drugačije prikazati situaciju.\r\n\r\nDodatnu simboliku cijeloj priči daje i izbor frakcije. Tau su poznati po disciplini, tehnologiji i preciznom ratovanju, ali trenutno se čini da je njihova najveća taktička operacija jednostavno preživjeti na polici dovoljno dugo da ih netko napokon otvori. Do tada, njihova borba za Više Dobro ostaje ograničena na kartonsku ambalažu i povremene poglede pune nade.\r\n\r\nUnatoč svemu, javnost ne gubi vjeru. Mnogi smatraju da još nije kasno. Ako se otvori samo jedna kutija, ako se izreže samo jedan plastični okvir i ako se sastavi barem jedan borbeni oklop, ovaj slučaj mogao bi prijeći iz područja zabrinjavajuće pasivnosti u područje stvarnog hobističkog napretka.\r\n\r\nDo tada, slučaj anonimnog čitatelja i njegove Tau vojske ostaje upozorenje ali i inspiracija hobi krugovima u okolici. Ljubav je možda stvarno u malim stvarima — ali u ovom slučaju, te male stvari dolaze u velikim kutijama, uz nepročitani kodeks, i još uvijek čekaju da budu otvorene.', 'img/1781978715_Warhammer-40k-Tau-Wal-Hor-how-to-play-guide-codex-rules.webp', 'News', 0),
(13, '2026-06-21 14:48:27', 'Novi Munitorum Field Manual teško pogodio Sisterice', 'Novi bodovni update donio je neugodne promjene za Sisterice. Castigatori su poskupjeli, Sacresanct + Hospitaller blok sada je jako skup, a Miracle Dice sustav dodatno je oslabljen.', 'Novi Munitorum Field Manual nije bio blag prema igračima Sisterica. Nakon posljednjih promjena, dojam među igračima je prilično jasan: vojska je postala skuplja, fleksibilnost lista je smanjena, a najvažniji resurs frakcije — Miracle Dice — više nema istu snagu kao prije.\r\n\r\nNajviše pažnje privuklo je poskupljenje Castigatora, jedne od najpouzdanijih vatrenih platformi u listama Sisterica. Castigator je već dulje vrijeme bio popularan izbor jer je nudio solidnu kombinaciju izdržljivosti, dometa i konzistentne štete. S novom cijenom, međutim, više nije automatski izbor. Igrači sada moraju ozbiljnije razmisliti žele li ulagati bodove u tenkove ili ih preusmjeriti u više pješaštva, misijske jedinice i podršku.\r\n\r\nPosebno bolan udarac je i cijena Sacresanct + Hospitaller bloka. Taj paket je prije imao jasnu ulogu: čvrst centralni blok koji može držati prostor, preživjeti pritisak i prisiliti protivnika da uloži ozbiljne resurse u njegovo uklanjanje. Sada je taj blok toliko skup da postaje pitanje isplati li se uopće graditi listu oko njega. Kada obrambeni alat pojede prevelik dio ukupnih bodova, ostatak liste ostaje tanji na misijama, mobilnosti i vatrenoj podršci.\r\n\r\nProblem nije samo u jednoj jedinici. Širi osjećaj je da je gotovo sve što je bilo učinkovito postalo skuplje. Sisterice su i prije igrale na tankoj margini između agresije, kontrole misija i pametnog trošenja resursa. Kada nekoliko ključnih jedinica poskupi istovremeno, liste brzo izgube prostor za dodatne alate. Ono što je prije stalo u listu sada zahtijeva kompromise.\r\n\r\nJoš veći udarac dolazi kroz nerf Miracle Dice sustava. Miracle Dice su temelj identiteta ove frakcije: omogućuju planiranje ključnih trenutaka, sigurnije chargeove, važne saveove i pouzdanije damage rollove. Kada se taj mehanizam oslabi, Sisterice ne gube samo matematičku učinkovitost, nego i dio svoje taktičke osobnosti. Vojska postaje manje predvidljivo eksplozivna i više ovisna o običnim rollovima.\r\n\r\nTo ne znači da je frakcija mrtva. Sisterice i dalje imaju jake alate, dobre datasheetove i sposobnost kažnjavanja protivnika koji pogriješi u pozicioniranju. Međutim, novi update ih tjera na discipliniraniju gradnju lista. Više neće biti dovoljno samo ubaciti najefikasnije jedinice i osloniti se na Miracle Dice da poprave ključne trenutke. Sada će svaka jedinica morati opravdati svoju cijenu.\r\n\r\nNajveći gubitnici su vjerojatno liste koje su se oslanjale na više Castigatora, Sacresanct + Hospitaller blok i snažnu ekonomiju Miracle Diceova. Takve liste će morati rezati luksuzne izbore ili potpuno promijeniti plan igre. Umjesto čiste efikasnosti, naglasak bi se mogao prebaciti na fleksibilnije jedinice, bolju kontrolu objektiva i pažljivije čuvanje resursa.\r\n\r\nZaključak je jednostavan: novi Munitorum Field Manual nije uništio Sisterice, ali ih je jasno spustio. Castigatori su skuplji, Sacresanct + Hospitaller blok sada je ozbiljna investicija, Miracle Dice su slabiji, a cijela vojska djeluje manje opraštajuće. Igrači Sisterica morat će ponovno otvoriti svoje liste, zbrojiti bodove i prihvatiti neugodnu istinu — vjera je i dalje jaka, ali sada košta više.', 'img/1782046107_warhammer-40k-sisters-of-battle-adepta-sororitas-paragon-warsuits.jpg', 'News', 0),
(14, '2026-06-21 15:00:31', 'Dolazak 11. edicije Warhammera najavljuje novo razdoblje nemira za igrače', 'Dolazak 11. edicije Warhammera izazvao je veliko zanimanje među igračima. Dok jedni očekuju čišća pravila i svjež početak, drugi s opravdanom zabrinutošću gledaju prema svojim policama, listama i vojskama koje bi uskoro mogle ponovno trebati temeljito prilagođavanje.', 'U hobi zajednici ponovno se osjeća poznata napetost. Dolazak 11. edicije Warhammera sve je bliže, a s njim dolazi i ona posebna kombinacija uzbuđenja, straha i tihe financijske zabrinutosti koju poznaju svi dugogodišnji igrači. Nova edicija nikada nije samo nova knjiga pravila. Ona je događaj koji može promijeniti način igre, vrijednost jedinica, izgled vojski i unutarnji mir svakoga tko je upravo dovršio svoju listu.\r\n\r\nZa neke igrače, nova edicija predstavlja priliku za svjež početak. Pravila se mogu pojednostaviti, stare nelogičnosti mogu nestati, a vojske koje su dugo bile zapostavljene možda ponovno dobiju priliku zasjati na stolu. U idealnom svijetu, 11. edicija mogla bi donijeti jasnije igre, bolje balansirane frakcije i manje rasprava oko svake druge rečenice u pravilima.\r\n\r\nMeđutim, iskusniji hobisti znaju da svaka nova edicija sa sobom nosi i određenu količinu kaosa. Ono što je jučer bilo temelj svake liste, sutra može postati preskupo, preslabo ili jednostavno neupotrebljivo. Jedinice koje su godinama strpljivo čekale na polici mogle bi iznenada postati ključne, dok modeli koji su nedavno kupljeni, sastavljeni i obojeni mogu završiti u kategoriji “pričekat ćemo sljedeći bodovni update”.\r\n\r\nPosebnu zabrinutost izaziva pitanje postojećih kodeksa. Igrači se s razlogom pitaju koliko će dugo sadašnje knjige ostati relevantne, hoće li pravila biti zamijenjena privremenim indeksima i koliko će vremena proći prije nego svaka frakcija dobije svoj puni tretman u novoj ediciji. Za mnoge je to već viđen ciklus: najprije oduševljenje, zatim čitanje novih pravila, zatim zbunjenost, a na kraju ponovno slaganje vojske od nule.\r\n\r\nIpak, teško je poreći da nova edicija donosi i snažan osjećaj obnove. Stari igrači ponovno otvaraju kutije koje su godinama stajale po strani, novi igrači dobivaju lakšu ulaznu točku, a rasprave o tome koja će frakcija biti najjača počinju i prije nego što su pravila uopće u potpunosti pročitana. To je možda najvjerniji znak da Warhammer zajednica funkcionira točno onako kako se od nje očekuje.\r\n\r\nDolazak 11. edicije zato nije samo promjena pravila, nego i društveni događaj. Počinju nove rasprave, nova predviđanja, novi popisi vojski i novi pokušaji da se vlastita frakcija prikaže kao ozbiljno ugrožena, čak i kada objektivno stoji sasvim dobro. Svaki igrač već sada ima barem jednu jedinicu za koju se nada da će pojeftiniti i barem jednu protivničku jedinicu za koju smatra da hitno mora poskupjeti.\r\n\r\nNajveće pitanje ostaje hoće li 11. edicija uspjeti donijeti ravnotežu između svježine i stabilnosti. Igračima treba promjena, ali ne takva da im potpuno izbriše osjećaj kontinuiteta. Trebaju nova pravila, ali ne i osjećaj da je sve što su naučili preko noći postalo nevažno. Trebaju novi početak, ali po mogućnosti bez potrebe da ponovno kupe pola vojske.\r\n\r\nZaključak je jednostavan: 11. edicija dolazi, a s njom dolaze nada, sumnja i velika količina ponovnog računanja bodova. Neki će je dočekati raširenih ruku, neki s oprezom, a neki s pogledom prema polici punoj neobojanih modela. No jedno je sigurno — mirno razdoblje završava. Rat se nastavlja, samo ovaj put s novom knjigom pravila.', 'img/1782046831_warhammer-40k-11th-edition-armageddon-guide.jpg', 'News', 0),
(15, '2026-06-21 15:03:31', 'Lokalni Warhammer turnir završio bez većih pravnih posljedica', 'Lokalni Warhammer turnir okupio je više igrača nego što je itko očekivao, a unatoč napetim partijama, spornim pravilima i nekoliko dramatičnih bacanja kockica, događaj je završio mirno i bez ozbiljnijih incidenata.', 'Lokalni Warhammer turnir održan je proteklog vikenda u atmosferi koja se može opisati kao kombinacija strateške ozbiljnosti, plastičnog nasilja i kontrolirane društvene napetosti. Igrači su stigli s pažljivo složenim vojskama, isprintanim listama, mjernim trakama i izrazima lica ljudi koji su uvjereni da su noć prije pronašli savršenu kombinaciju pravila.\r\n\r\nVeć od prvog kola bilo je jasno da se neće raditi o opuštenom druženju. Stolovi su brzo postali bojišta, objektivi su mijenjali vlasnike, a prijateljski razgovori zamijenjeni su preciznim mjerenjem udaljenosti i rečenicama poput: “mislim da si pola inča prekratak”. Upravo u tim trenucima vidjela se prava priroda natjecateljskog Warhammera — igra u kojoj se prijateljstvo održava, ali samo dok protivnik ne pokuša sumnjivo naplatiti charge.\r\n\r\nPosebnu pažnju izazvala je treća partija, u kojoj je jedan igrač izgubio ključnu jedinicu nakon serije bacanja koja se, prema svjedocima, “statistički nije smjela dogoditi”. Iako je kratko gledao u kockice kao da su ga osobno izdale, nastavio je igru dostojanstveno, uz tek nekoliko komentara o tome kako je sustav očito nepravedan.\r\n\r\nOrganizatori su izrazili zadovoljstvo odazivom i ponašanjem sudionika. Unatoč nekoliko rasprava oko pravila, sve nejasnoće riješene su mirno, uz pomoć pravilnika, dogovora i povremenog dubokog uzdaha. Nije zabilježeno prevrtanje stolova, bacanje modela ni trajno narušavanje prijateljstava, što se u turnirskim okolnostima može smatrati ozbiljnim uspjehom.\r\n\r\nPobjednik turnira pokazao je stabilnu igru, dobro pozicioniranje i zabrinjavajuću količinu pripreme. Njegova vojska djelovala je kao da je složena s jasnom namjerom, što je kod dijela sudionika izazvalo divljenje, a kod drugih tihu sumnju da je riječ o pretjerivanju.\r\n\r\nTurnir je završio podjelom rezultata, kratkom analizom partija i poznatim obećanjima igrača da će “idući put sigurno donijeti bolju listu”. Nekoliko sudionika već je najavilo promjene u svojim vojskama, iako još nije jasno radi li se o stvarnoj strategiji ili samo o emocionalnoj reakciji na poraz.\r\n\r\nZaključak je jednostavan: lokalna scena je živa, natjecateljski duh je snažan, a kockice i dalje nemaju osjećaja za ljudsku patnju. Turnir je prošao uspješno, ali ostavio je za sobom ono što svaki dobar Warhammer događaj mora ostaviti — nove planove, stare zamjerke i barem tri igrača koji tvrde da su izgubili isključivo zbog loše sreće.', 'img/1782047011_nothing-a-good-krumping-cant-fix-dreadanon-v0-bW81amQ0eXhuN2xiMenpsLc54_ehpjtplKzeudjUb2teX3MsHreZGlSdNhn6.webp', 'Tournaments', 0),
(16, '2026-06-21 15:05:07', 'Najavljen novi Warhammer turnir, igrači već tvrde da dolaze samo radi zabave', 'Novi Warhammer turnir najavljen je za nadolazeće razdoblje, a igrači su već počeli pripremati vojske. Iako većina tvrdi da dolazi isključivo radi druženja, količina testiranja lista upućuje na znatno ozbiljnije namjere.', 'Najava novog Warhammer turnira ponovno je pokrenula poznati ciklus među lokalnim igračima: javno opušten stav, privatno panično slaganje lista i dugotrajno proučavanje bodova. Organizatori su potvrdili da će se turnir održati uskoro, a interes zajednice već je dovoljno velik da se može govoriti o ozbiljnom natjecateljskom događaju.\r\n\r\nSlužbeno, većina igrača tvrdi da dolazi “samo radi zabave”. Neslužbeno, isti ti igrači već nekoliko dana provjeravaju kombinacije jedinica, uspoređuju rezultate s prošlih partija i pokušavaju pronaći način da njihova vojska bude “opuštena”, ali ipak dovoljno jaka da ne izgubi prvu partiju do drugog kruga.\r\n\r\nPosebno zanimljiv dio priprema odnosi se na izbor vojski. Neki igrači ostaju vjerni svojim dugogodišnjim frakcijama, bez obzira na trenutnu snagu pravila. Drugi su, sasvim slučajno, upravo sada odlučili igrati vojsku koja se trenutačno smatra iznimno učinkovitom. Na pitanje je li riječ o taktičkom izboru ili čistoj ljubavi prema estetici frakcije, odgovori su uglavnom bili neuvjerljivi.\r\n\r\nOrganizatori najavljuju strukturiran događaj s jasnim rasporedom, definiranim misijama i naglaskom na sportsko ponašanje. To znači da će se od igrača očekivati pošteno mjerenje, jasna komunikacija i prihvaćanje činjenice da protivnik također zna čitati pravila. Takva očekivanja možda djeluju osnovno, ali u napetim turnirskim partijama često postaju ozbiljan test karaktera.\r\n\r\nNajveća nepoznanica za sada ostaje kakve će se liste pojaviti na stolovima. Nakon posljednjih promjena u bodovima i pravilima, dio igrača pokušava prilagoditi postojeće vojske, dok drugi razmatraju potpunu promjenu pristupa. U zraku se osjeća kombinacija optimizma i straha, osobito među onima koji su nedavno obojili jedinice koje su u međuvremenu poskupjele.\r\n\r\nTurnir bi mogao biti važan pokazatelj stanja lokalne scene. Osim samog rezultata, vidjet će se koje frakcije trenutno imaju najviše uspjeha, koji stilovi igre dominiraju i koliko su igrači spremni prilagoditi se novim okolnostima. Naravno, vidjet će se i tko će nakon prve izgubljene partije početi tvrditi da njegova lista ionako nije bila ozbiljna.\r\n\r\nDo početka turnira ostaje dovoljno vremena za pripreme, promjene lista i donošenje loših odluka u zadnji trenutak. Jedno je sigurno: kada se modeli konačno postave na stol, tvrdnje o opuštenoj igri brzo će nestati, a zamijenit će ih precizno mjerenje, ozbiljna lica i rečenica koju nitko ne želi čuti — “mislim da to ne možeš vidjeti”.', 'img/1782047107_brplpp47gj3vbtg2.jpg', 'Tournaments', 0),
(17, '2026-06-21 15:06:26', 'Turnirska meta ponovno uzdrmana, igrači najavljuju prilagodbe i umjereno nezadovoljstvo', 'Nakon novih promjena u pravilima i bodovima, turnirska scena ponovno ulazi u fazu prilagodbe. Igrači analiziraju liste, mijenjaju planove i pokušavaju odrediti koje će vojske dominirati nadolazećim događajima.', 'Turnirska scena Warhammera ponovno se nalazi u razdoblju promjena. Nakon novih bodovnih prilagodbi i izmjena pravila, igrači su prisiljeni preispitati svoje liste, navike i, u nekim slučajevima, vlastite životne odluke vezane uz kupnju određenih jedinica.\r\n\r\nPromjene su posebno pogodile igrače koji su svoje vojske gradili oko nekoliko ključnih izbora. Ono što je donedavno bilo učinkovito i stabilno sada može biti preskupo, dok jedinice koje su mjesecima skupljale prašinu na polici odjednom ponovno izgledaju zanimljivo. Takva dinamika stvara poznatu turnirsku napetost: nitko nije potpuno siguran što je najbolje, ali svi imaju vrlo snažno mišljenje o tome što bi trebalo oslabiti.\r\n\r\nU lokalnoj zajednici već su počele rasprave o novoj meti. Neki vjeruju da će agresivne vojske ponovno preuzeti inicijativu, dok drugi smatraju da će kontrola objektiva i izdržljive jedinice biti ključ uspjeha. Treća skupina, najglasnija od svih, tvrdi da je njihova frakcija nepravedno pogođena i da je situacija ozbiljna, iako su istu stvar govorili i prije posljednje tri promjene pravila.\r\n\r\nZa organizatore turnira, ovakva razdoblja često su najzanimljivija. Kada se pravila promijene, igrači dolaze s manje sigurnosti i više eksperimentiranja. To može dovesti do raznovrsnijih lista, neočekivanih rezultata i partija u kojima nitko nije sasvim siguran je li izgubio zbog loše odluke, loše sreće ili zato što je njegova vojska sada jednostavno preskupa.\r\n\r\nPosebno važan dio priprema bit će ponovno računanje bodova. Mnoge liste više ne stanu u zadani format bez rezanja jedinica, promjene opreme ili odustajanja od omiljenih kombinacija. Taj proces rijetko prolazi mirno. U pravilu uključuje tablice, kalkulatore, glasno razmišljanje i konačnu izjavu da je “ovo zapravo možda i bolje”, iako nitko u to nije potpuno uvjeren.\r\n\r\nNadolazeći turniri zato će imati dodatnu težinu. Neće se gledati samo tko pobjeđuje, nego i koje se ideje pokazuju održivima u novim uvjetima. Svaka uspješna lista mogla bi postati predmet kopiranja, analize i sumnjičavih komentara. Svaka neuspješna lista, s druge strane, bit će objašnjena kao testiranje, a ne kao stvarni pokušaj pobjede.\r\n\r\nZaključak je da se turnirska scena ponovno pokrenula. Promjene su donijele nesigurnost, ali i novu energiju. Igrači će se žaliti, prilagoditi, ponovno žaliti i zatim se pojaviti na turniru s listom za koju tvrde da nije ozbiljna. Upravo zato će nadolazeći događaji biti zanimljivi: nitko još ne zna što je najbolje, ali svi su uvjereni da će to otkriti prije protivnika.', 'img/1782047186_tabletop-battle-1024x768.webp', 'Tournaments', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `korisnicko_ime` (`korisnicko_ime`);

--
-- Indexes for table `vijesti`
--
ALTER TABLE `vijesti`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vijesti`
--
ALTER TABLE `vijesti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
