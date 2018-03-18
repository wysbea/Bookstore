-- phpMyAdmin SQL Dump
-- version 4.6.6deb1+deb.cihar.com~xenial.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 18 Mar 2018, 01:30
-- Wersja serwera: 5.7.21-0ubuntu0.16.04.1
-- Wersja PHP: 7.0.25-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `bookstore`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `authors`
--

CREATE TABLE `authors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `authors`
--

INSERT INTO `authors` (`id`, `name`, `surname`, `description`) VALUES
(1, 'Suzanne', 'Collins', ''),
(2, 'J.K.', 'Rowling', ''),
(3, 'Harper', 'Lee', ''),
(4, 'Jane', 'Austen', ''),
(5, 'Stephenie', 'Meyer', ''),
(14, 'Sławomir', 'Cenckiewicz', 'Historyk'),
(16, 'Stephen', 'King', 'Horrory');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `books`
--

CREATE TABLE `books` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `books`
--

INSERT INTO `books` (`id`, `title`, `author_id`, `description`) VALUES
(1, 'The Hunger Games', 1, 'The nation of Panem, formed from a post-apocalyptic North America, is a country that consists of a wealthy Capitol region surrounded by 12 poorer districts. Early in its history, a rebellion led by a 13th district against the Capitol resulted in its destruction and the creation of an annual televised event known as the Hunger Games. In punishment, and as a reminder of the power and grace of the Capitol, each district must yield one boy and one girl between the ages of 12 and 18 through a lottery system to participate in the games. The \'tributes\' are chosen during the annual Reaping and are forced to fight to the death, leaving only one survivor to claim victory.\r\n\r\nWhen 16-year-old Katniss\'s young sister, Prim, is selected as District 12\'s female representative, Katniss volunteers to take her place. She and her male counterpart Peeta, are pitted against bigger, stronger representatives, some of whom have trained for this their whole lives. , she sees it as a death sentence. But Katniss has been close to death before. For her, survival is second nature. '),
(2, 'Harry Potter and the Order of the Phoenix', 2, 'Harry Potter is due to start his fifth year at Hogwarts School of Witchcraft and Wizardry. His best friends Ron and Hermione have been very secretive all summer and he is desperate to get back to school and find out what has been going on. However, what Harry discovers is far more devastating than he could ever have expected...\r\n\r\nSuspense, secrets and thrilling action from the pen of J.K. Rowling ensure an electrifying adventure that is impossible to put down'),
(3, 'To Kill a Mockingbird', 3, 'The unforgettable novel of a childhood in a sleepy Southern town and the crisis of conscience that rocked it, To Kill A Mockingbird became both an instant bestseller and a critical success when it was first published in 1960. It went on to win the Pulitzer Prize in 1961 and was later made into an Academy Award-winning film, also a classic.\r\n\r\nCompassionate, dramatic, and deeply moving, To Kill A Mockingbird takes readers to the roots of human behavior - to innocence and experience, kindness and cruelty, love and hatred, humor and pathos. Now with over 18 million copies in print and translated into forty languages, this regional story by a young Alabama woman claims universal appeal. Harper Lee always considered her book to be a simple love story. Today it is regarded as a masterpiece of American literature.'),
(4, 'Pride and Prejudice', 4, '\"It is a truth universally acknowledged, that a single man in possession of a good fortune must be in want of a wife.\" So begins Pride and Prejudice, Jane Austen’s witty comedy of manners—one of the most popular novels of all time—that features splendidly civilized sparring between the proud Mr. Darcy and the prejudiced Elizabeth Bennet as they play out their spirited courtship in a series of eighteenth-century drawing-room intrigues. Renowned literary critic and historian George Saintsbury in 1894 declared it the \"most perfect, the most characteristic, the most eminently quintessential of its author’s works,\" and Eudora Welty in the twentieth century described it as \"irresistible and as nearly flawless as any fiction could be.\"\r\n--penguinrandomhouse.com'),
(5, 'Twilight', 5, 'About three things I was absolutely positive.\r\n\r\nFirst, Edward was a vampire.\r\n\r\nSecond, there was a part of him—and I didn\'t know how dominant that part might be—that thirsted for my blood.\r\n\r\nAnd third, I was unconditionally and irrevocably in love with him.\r\n\r\nIn the first book of the Twilight Saga, internationally bestselling author Stephenie Meyer introduces Bella Swan and Edward Cullen, a pair of star-crossed lovers whose forbidden relationship ripens against the backdrop of small-town suspicion and a mysterious coven of vampires. This is a love story with bite.'),
(10, 'Wałęsa. Człowiek z teczki', 16, '\"Wałęsa. Człowiek z teczki\" Sławomira Cenckiewicza to ostry, demaskatorski pamflet stanowiący kontrapunkt do filmu Andrzeja Wajdy.\n\nTym razem autor, popularny historyk, zrezygnował z opasłych naukowych tomów i napisał książkę bez przypisów, która odsłania nowe i skrywane dotąd fakty dotyczące \"naszej ikony\". Cenckiewicz w przystępnej formie opisuje jaskrawą prawdę o esbeckich źródłach mitu Wałęsy, zarzucając mu współpracę z SB. Uderza w elity III RP, oskarżając je o sprzeniewierzenie się i poniżenie narodowego ruchu \"Solidarności\".\n\nPrawda czy kłamstwo? Prawdziwa książka czy fałszywy film? Jeśli pozostajesz lojalny wobec Sierpnia \'80 i idei \"Solidarności\", wybór będzie oczywisty!\n'),
(11, 'To', 16, 'Akcja książki została podzielona na dwa tory: część opisanych wydarzeń ma miejsce w 1958 roku, gdy bohaterowie są 11-latkami, a część w 1985, gdy są już dorosłymi ludźmi niepamiętającymi zbyt wiele ze swego dzieciństwa. Wydarzenia te rozgrywają się podczas serii niewyjaśnionych morderstw w Derry, której ofiarami padają wyłącznie dzieci. W 1958 bohaterowie postanawiają odszukać i zabić tajemniczego mordercę, którym okazuje się potwór od tysiącleci żerujący w Maine – tytułowe To, przybierające często postać Pennywise\'a, Tańczącego Klowna, czasami przedstawiającego się jako Bob Grey. To potrafi zamienić się w coś, czego jego ofiara boi się najbardziej – w mumię, martwego brata, utopionych chłopców, wilkołaka. W 1985 roku Pennywise rozpoczyna kolejną serię morderstw, zmuszając dorosłych już bohaterów, aby powrócili do Derry i stawili czoła największemu koszmarowi swego dzieciństwa.\n\nAutor nie skupia się tylko na walce postaci ze złem, ale przede wszystkim na ich życiu, wewnętrznych przemianach i dojrzewaniu, malując jednocześnie barwny portret amerykańskiej prowincji.'),
(12, 'Misery', 16, 'Paul Sheldon jest popularnym autorem serii romansów o pięknej Misery Chastain. Mimo ogromnej popularności książek Sheldon jest znudzony banalnością powieści i zaszywa się w górach Kolorado, by napisać pierwszą \"poważną\" książkę, wstępnie nazwaną Szybkie samochody.\n\nWracając po pijanemu z gotowym manuskryptem przez ośnieżone drogi, Sheldon ulega wypadkowi: jego samochód zsuwa się ze zbocza i utyka w zaspie. Nieprzytomnego, rannego pisarza ratuje z wraku Annie Wilkes, była pielęgniarka, która mieszka w domku na uboczu. Stopniowo Paul odzyskuje przytomność, jednak bardzo cierpi z powodu złamanych nóg.\n\nWilkes okazuje Sheldonowi ogromną troskę i opiekę; okazuje się, że kobieta jest zagorzałą fanką powieści o Misery i jest zachwycona, że może \"gościć\" ich autora. Sheldon odbiera zachwyty niedbale, z niecierpliwością oczekuje wyzdrowienia i powrotu do Los Angeles.\n\nSytuacja zmienia się jednak, gdy Annie znajduje manuskrypt Szybkich samochodów. Akcja powieści nie przypada jej do gustu. Annie krytykuje styl i język, a kiedy Paul lekceważąco podchodzi do jej uwag, Annie karze go przez niepodanie porcji leków (dzięki którym Paul może znosić ból w zmaltretowanych nogach) oraz zmusza go do wypicia brudnej wody z kubła. Zaczyna też zamykać drzwi pokoju Sheldona na klucz. Paul zaczyna podejrzewać, że Annie jest chora psychicznie.\n\nWkrótce potem najnowsza książka o Misery pojawia się w księgarniach. Annie, która ma obsesję na punkcie bohaterki, czyta powieść w ciągu jednej nocy i odkrywa, że Sheldon uśmiercił Misery. Kobieta dostaje szału i znika w lasach na dwie doby, zostawiając Paula bez wody, jedzenia i lekarstw. Kiedy wraca, Sheldon jest bliski śmierci z wyczerpania.\n\nAnnie zmusza Paula, by spalił manuskrypt Szybkich samochodów (jedyną kopię powieści), daje mu ryzę papieru oraz maszynę do pisania i nakazuje, by napisał nową książkę o Misery, tym razem przywracając ją do życia. Annie nie ukrywa się już ze swoimi psychopatycznymi skłonnościami i otwarcie grozi Paulowi.\n\nSheldon nakłania Annie, by pojechała do miasteczka i kupiła mu lepszy papier, ponieważ ten, który ma, nie nadaje się do pisania. Annie dostaje szału ze złości, ale wsiada do samochodu i odjeżdża. Paul otwiera wytrychem drzwi pokoju i czołgając się na połamanych nogach usiłuje wydostać się z domu. Wszystkie drzwi są jednak zamknęte, a mężczyzna jest zbyt osłabiony, by próbować uciec oknem. Zrezygnowany robi krótką wycieczkę po parterze. W salonie odkrywa album z wycinkami z gazet. Ze zgrozą dowiaduje się z niego, że Annie rzeczywiście była pielęgniarką, jednak straciła zawód, ponieważ oskarżono ją o zabijanie niemowląt w szpitalach, w których pracowała. Dalsze wycinki ujawniają, że Annie jako mała dziewczynka prawdopodobnie spowodowała śmierć pięciorga sąsiadów, zabiła własnego ojca oraz - na studiach - współlokatorkę.\nPrzerażony Paul stara się zatrzeć ślady swojej obecności w domu i wraca do pokoju przed powrotem Annie. Kobieta jednak domyśla się, że Sheldon wydostał się z pokoju. Opowiada Paulowi o tradycyjnym okaleczaniu niewolników na plantacjach i odcina mu siekierą stopę, przypalając kikuty palnikiem.\n\nPaul, oszołomiony bólem, strachem i lekami, zapada w coś w rodzaju katatonii.\nW maju na posiadłość Annie przyjeżdża policjant stanu Kolorado. Ma przy sobie zdjęcia Sheldona i wypytuje o niego Annie. Kobieta twierdzi, że nigdy go nie widziała. Gdy policjant zaczyna odchodzić, Paul budzi się z szoku i zaczyna wołać o pomoc. Annie reaguje błyskawicznie i zabija policjanta, po czym ukrywa ciało.\n\nPaul zostaje zmuszony do kontynuowania pisania powieści. Jakiś czas później Annie w kolejnym przypływie furii odrąbuje Paulowi kciuk.\n\nNiedługo później Sheldon kończy powieść. Prosi Annie o wydanie uroczystej kolacji z tej okazji. Annie daje mu do zrozumienia, że wkrótce zabije Sheldona, ale zgadza się na wino i świece.\nPodczas kolacji Sheldon prosi o zapałkę, by zapalić papierosa. Ku zgrozie Annie nagle podpala manuskrypt powieści. Annie rzuca się, by ratować papier; Paul, korzystając z okazji, ogłusza kobietę, rzucając w nią maszyną do pisania. Potem wypycha kobiecie usta tlącymi się kartkami, wyczołguje się do łazienki i traci przytomność.\n\nWkrótce do domu Annie przyjeżdża dwójka policjantów, szukająca zaginionego kolegi. Znajdują oszołomionego Paula i martwą Annie - przed śmiercią zdołała wydostać się z domu i przeczołgać się do stodoły, gdzie zmarła od ran.\n\nPaul zostaje przewieziony do szpitala, gdzie zostaje otoczony troskliwą opieką. Po powrocie do zdrowia wysyła swojemu wydawcy manuskrypt Powrotu Misery: okazało się, że podczas kolacji podpalił czyste kartki, by odwrócić uwagę Annie. Powieść była bezpiecznie ukryta pod materacem. Wydawca oznajmia Sheldonowi, że książka będzie największym bestsellerem w historii. Sheldon cierpi przez dłuższy czas na psychozę i wszędzie widzi Annie, ale stopniowo wraca do równowagi. Pewnego dnia zaczyna pisać nową powieść.'),
(15, 'Carrie', 16, 'Główną bohaterką powieści jest młoda dziewczyna – Carrie White. Wychowywana jest przez samotną matkę – fanatyczkę religijną. W szkole jest nielubiana, inni młodzi ludzie dokuczają jej. Wraz z pierwszą miesiączką, dziewczyna odkrywa w sobie moce telekinetyczne (ma między innymi możliwość przesuwania przedmiotów za pomocą myśli, może częściowo kontrolować umysły innych osób). Za ich pomocą zaczyna szukać zemsty na prześladowcach.'),
(17, 'Christine', 16, 'Arnie Cunningham, zakompleksiony chłopak z amerykańskiego high-school nie ma lekkiego życia. Właściwie na każdym polu odnosi porażki – zarówno w szkole, gdzie nie odnosił sukcesów w nauce, a na dodatek doskwierała mu banda osiłków, jak i w życiu osobistym, gdyż ze względu na swój cherlawy wygląd nie ma powodzenia u dziewczyn.\n\nJego życie uległo zmianie od czasu, gdy pojawiła się w nim Christine – stary samochód marki Plymouth, który okazuje się żyć i kierować ludzkimi uczuciami . Arnie dostaje na jego punkcie obsesji – zaczyna zaniedbywać szkole, rodzinę i przyjaciół, spędzając z Christine większość czasu. Początkowo wpływ Christine wydaje się nawet korzystny: chłopak zyskuje pewność siebie, a nawet jego wygląd ulega poprawie, dzięki czemu Arnie zdobywa miłość Leigh, koleżanki ze szkoły. Jednak wtedy samochód zaczyna pokazywać swoje prawdziwe oblicze...');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT dla tabeli `books`
--
ALTER TABLE `books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `book_author` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
