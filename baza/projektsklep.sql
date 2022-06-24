
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Baza danych: `projektsklep`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategorie`
--

CREATE TABLE `kategorie` (
  `id_kategorii` int(11) NOT NULL,
  `nazwa` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `opis` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `kategorie`
--

INSERT INTO `kategorie` (`id_kategorii`, `nazwa`, `opis`) VALUES
(1, 'Bezkofeinowa', ''),
(2, 'Do domu', ''),
(3, 'Do biura\r\n', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `logi`
--

CREATE TABLE `logi` (
  `id_logu` int(11) NOT NULL,
  `id_usera` int(11) NOT NULL,
  `data` date NOT NULL,
  `a_co_to_to` text NOT NULL,
  `info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkty`
--

CREATE TABLE `produkty` (
  `id_produktu` int(11) NOT NULL,
  `nazwa` text COLLATE utf8_polish_ci NOT NULL,
  `cena` double NOT NULL,
  `obrazek` text COLLATE utf8_polish_ci NOT NULL,
  `ilosc` int(11) NOT NULL,
  `opis` text COLLATE utf8_polish_ci NOT NULL,
  `kategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `produkty`
--

INSERT INTO `produkty` (`id_produktu`, `nazwa`, `cena`, `obrazek`, `ilosc`, `opis`, `kategoria`) VALUES
(48, 'Tarrazu Yellow Honey 250g ST: III', 19.99, 'kawa1.jpg', 10, 'Mott Coffe Tarrazu Yellow Honey jest średnio paloną kawą pochodzącą z Kostaryki, jest to arabika w stu procentach. Jej ziarna poddane zostały specjalnej obróbce. Kawa przeznaczona jest do espresso ,co pozwala odkryć prawdziwy ,bardzo cytrusowy smak Mott Coffe Tarrazu Honey. Kawa zachwycą się miłośnicy napoju o intensywnej kwasowości. Gotowe espresso jest orzeźwiające ,w smaku wyczuwa się nutę owoców cytrusowych.', 1),
(49, 'Tarrazu Yellow Honey 500g ST: III', 39.99, 'kawa2.jpg', 10, 'Mott Coffe Tarrazu Yellow Honey jest średnio paloną kawą pochodzącą z Kostaryki, jest to arabika w stu procentach. Jej ziarna poddane zostały specjalnej obróbce. Kawa przeznaczona jest do espresso ,co pozwala odkryć prawdziwy ,bardzo cytrusowy smak Mott Coffe Tarrazu Honey. Kawa zachwycą się miłośnicy napoju o intensywnej kwasowości. Gotowe espresso jest orzeźwiające ,w smaku wyczuwa się nutę owoców cytrusowych.', 1),
(50, 'Tarrazu Yellow Honey 1000g ST: III', 79.99, 'kawa3.jpg', 10, 'Mott Coffe Tarrazu Yellow Honey jest średnio paloną kawą pochodzącą z Kostaryki, jest to arabika w stu procentach. Jej ziarna poddane zostały specjalnej obróbce. Kawa przeznaczona jest do espresso ,co pozwala odkryć prawdziwy ,bardzo cytrusowy smak Mott Coffe Tarrazu Honey. Kawa zachwycą się miłośnicy napoju o intensywnej kwasowości. Gotowe espresso jest orzeźwiające ,w smaku wyczuwa się nutę owoców cytrusowych.', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sprzedaz`
--

CREATE TABLE `sprzedaz` (
  `id_sprzedazy` int(11) NOT NULL,
  `id_zamowienia` int(11) NOT NULL COMMENT 'Id jednego zamówienia. Kilka produktów może mieć takie samo id, bo moga byc zamawiane na raz',
  `id_uzytkownika` int(11) NOT NULL,
  `id_produktu` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL,
  `data` date NOT NULL,
  `typ_wysylki` text NOT NULL,
  `potwierdzenie` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL COMMENT 'tak - potwierdzone, czeka - w trakcie przetwarzania, nowe - jeszcze nie potwierdzone, blocked - odrzucone',
  `id_pracownika_co_weryfikowal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `sprzedaz`
--

INSERT INTO `sprzedaz` (`id_sprzedazy`, `id_zamowienia`, `id_uzytkownika`, `id_produktu`, `ilosc`, `data`, `typ_wysylki`, `potwierdzenie`, `id_pracownika_co_weryfikowal`) VALUES
(6, 1656535119, 17, 48, 1, '2022-06-22', 'poczta polska', 'nowy', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `id` int(11) NOT NULL,
  `login` text COLLATE utf8_polish_ci NOT NULL,
  `haslo` text COLLATE utf8_polish_ci NOT NULL,
  `imie` text COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` text COLLATE utf8_polish_ci NOT NULL,
  `typ` text COLLATE utf8_polish_ci NOT NULL,
  `email` text COLLATE utf8_polish_ci NOT NULL,
  `adres` text COLLATE utf8_polish_ci NOT NULL,
  `miasto` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`id`, `login`, `haslo`, `imie`, `nazwisko`, `typ`, `email`, `adres`, `miasto`) VALUES
(1, 'test', 'test', 'Jan', 'Kowalski', 'p', 'test@test.pl', 'Warszawska 20', 'Warszawa'),
(17, 'paskudaam', 'paskudaam', 'Wojtek', 'Golędzinowski', 'u', 'paskudaam@gmail.com', '', '');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`id_kategorii`),
  ADD KEY `id_kategorii` (`id_kategorii`),
  ADD KEY `id_kategorii_2` (`id_kategorii`);

--
-- Indeksy dla tabeli `logi`
--
ALTER TABLE `logi`
  ADD PRIMARY KEY (`id_logu`);

--
-- Indeksy dla tabeli `produkty`
--
ALTER TABLE `produkty`
  ADD PRIMARY KEY (`id_produktu`),
  ADD KEY `kategoria` (`kategoria`),
  ADD KEY `kategoria_2` (`kategoria`);

--
-- Indeksy dla tabeli `sprzedaz`
--
ALTER TABLE `sprzedaz`
  ADD PRIMARY KEY (`id_sprzedazy`),
  ADD KEY `id_uzytkownika` (`id_uzytkownika`),
  ADD KEY `id_produktu` (`id_produktu`),
  ADD KEY `id_pracownika_co_weryfikowal` (`id_pracownika_co_weryfikowal`);

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `id_kategorii` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `logi`
--
ALTER TABLE `logi`
  MODIFY `id_logu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `produkty`
--
ALTER TABLE `produkty`
  MODIFY `id_produktu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT dla tabeli `sprzedaz`
--
ALTER TABLE `sprzedaz`
  MODIFY `id_sprzedazy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
