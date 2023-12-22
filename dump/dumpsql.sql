-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Dic 22, 2023 alle 12:54
-- Versione del server: 10.1.38-MariaDB
-- Versione PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cinema_2000`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `film`
--

CREATE TABLE `film` (
  `ID_film` int(11) NOT NULL,
  `titolo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `genere` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `durata` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dump dei dati per la tabella `film`
--

INSERT INTO `film` (`ID_film`, `titolo`, `genere`, `durata`) VALUES
(301, 'Inception', 'Fantascienza', '148 min'),
(302, 'Il Signore degli Anelli', 'Fantasy', '180 min'),
(303, 'La La Land', 'Musical', '128 min'),
(304, 'Inception', 'Science Fiction', '148 min'),
(305, 'Il Padrino', 'Crime', '175 min'),
(306, 'Titanic', 'Drama', '195 min'),
(307, 'Jurassic Park', 'Adventure', '127 min'),
(308, 'La forma dell acqua', 'Fantasy', '123 min'),
(309, 'Pulp Fiction', 'Crime', '154 min'),
(310, 'Forrest Gump', 'Drama', '142 min');

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazioni`
--

CREATE TABLE `prenotazioni` (
  `ID_prenotazione` int(11) NOT NULL,
  `Numero_posto` int(11) DEFAULT NULL,
  `ID_spettacolo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dump dei dati per la tabella `prenotazioni`
--

INSERT INTO `prenotazioni` (`ID_prenotazione`, `Numero_posto`, `ID_spettacolo`) VALUES
(601, 1, 501),
(602, 2, 502),
(603, 3, 503),
(604, 4, 504),
(605, 5, 505),
(606, 6, 506),
(607, 7, 507),
(608, 8, 508),
(609, 9, 509),
(610, 10, 510);

-- --------------------------------------------------------

--
-- Struttura della tabella `sale`
--

CREATE TABLE `sale` (
  `ID_sala` int(11) NOT NULL,
  `Numero_sala` int(11) DEFAULT NULL,
  `Posti_disponibili` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dump dei dati per la tabella `sale`
--

INSERT INTO `sale` (`ID_sala`, `Numero_sala`, `Posti_disponibili`) VALUES
(1, 101, 150),
(2, 102, 120),
(3, 103, 100),
(4, 104, 200),
(5, 105, 180),
(6, 106, 130),
(7, 107, 160),
(8, 108, 140),
(9, 109, 110),
(10, 110, 190);

-- --------------------------------------------------------

--
-- Struttura della tabella `spettacoli`
--

CREATE TABLE `spettacoli` (
  `ID_spettacolo` int(11) NOT NULL,
  `Data_ora` datetime DEFAULT NULL,
  `fk_ID_sala` int(11) DEFAULT NULL,
  `fk_ID_Film` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dump dei dati per la tabella `spettacoli`
--

INSERT INTO `spettacoli` (`ID_spettacolo`, `Data_ora`, `fk_ID_sala`, `fk_ID_Film`) VALUES
(501, '2023-11-23 12:00:00', 1, 301),
(502, '2023-11-23 14:30:00', 2, 302),
(503, '2023-11-23 17:00:00', 3, 303),
(504, '2023-11-24 12:00:00', 4, 304),
(505, '2023-11-24 14:30:00', 5, 305),
(506, '2023-11-24 17:00:00', 6, 306),
(507, '2023-11-25 12:00:00', 7, 307),
(508, '2023-11-25 14:30:00', 8, 308),
(509, '2023-11-25 17:00:00', 9, 309),
(510, '2023-11-26 12:00:00', 10, 310);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`ID_film`);

--
-- Indici per le tabelle `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD PRIMARY KEY (`ID_prenotazione`),
  ADD KEY `ID_spettacolo` (`ID_spettacolo`);

--
-- Indici per le tabelle `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`ID_sala`);

--
-- Indici per le tabelle `spettacoli`
--
ALTER TABLE `spettacoli`
  ADD PRIMARY KEY (`ID_spettacolo`),
  ADD KEY `fk_ID_sala` (`fk_ID_sala`),
  ADD KEY `fk_ID_Film` (`fk_ID_Film`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `film`
--
ALTER TABLE `film`
  MODIFY `ID_film` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;

--
-- AUTO_INCREMENT per la tabella `prenotazioni`
--
ALTER TABLE `prenotazioni`
  MODIFY `ID_prenotazione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=611;

--
-- AUTO_INCREMENT per la tabella `sale`
--
ALTER TABLE `sale`
  MODIFY `ID_sala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `spettacoli`
--
ALTER TABLE `spettacoli`
  MODIFY `ID_spettacolo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=511;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD CONSTRAINT `prenotazioni_ibfk_1` FOREIGN KEY (`ID_spettacolo`) REFERENCES `spettacoli` (`ID_spettacolo`);

--
-- Limiti per la tabella `spettacoli`
--
ALTER TABLE `spettacoli`
  ADD CONSTRAINT `spettacoli_ibfk_1` FOREIGN KEY (`fk_ID_sala`) REFERENCES `sale` (`ID_sala`),
  ADD CONSTRAINT `spettacoli_ibfk_2` FOREIGN KEY (`fk_ID_Film`) REFERENCES `film` (`ID_film`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
