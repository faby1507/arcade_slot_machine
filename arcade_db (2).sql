-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Gen 11, 2026 alle 17:37
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arcade_db`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `giocatori`
--

CREATE TABLE `giocatori` (
  `id_giocatore` bigint(20) UNSIGNED NOT NULL,
  `nome_giocatore` varchar(50) NOT NULL,
  `creato_il` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `giocatori`
--

INSERT INTO `giocatori` (`id_giocatore`, `nome_giocatore`, `creato_il`) VALUES
(1, 'faby', '2025-09-11 08:17:31'),
(2, 'mario', '2025-09-12 07:48:30'),
(3, 'david', '2025-09-12 07:48:48'),
(4, 'justfaby', '2026-01-08 18:19:00');

-- --------------------------------------------------------

--
-- Struttura della tabella `punteggi`
--

CREATE TABLE `punteggi` (
  `id_punteggio` bigint(20) UNSIGNED NOT NULL,
  `id_giocatore` bigint(20) UNSIGNED NOT NULL,
  `punteggio` int(10) UNSIGNED NOT NULL,
  `giocato_il` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `punteggi`
--

INSERT INTO `punteggi` (`id_punteggio`, `id_giocatore`, `punteggio`, `giocato_il`) VALUES
(1, 4, 100, '2026-01-08 18:19:37'),
(2, 4, 100, '2026-01-11 16:06:05');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `giocatori`
--
ALTER TABLE `giocatori`
  ADD PRIMARY KEY (`id_giocatore`),
  ADD UNIQUE KEY `uq_giocatori_nome` (`nome_giocatore`);

--
-- Indici per le tabelle `punteggi`
--
ALTER TABLE `punteggi`
  ADD PRIMARY KEY (`id_punteggio`),
  ADD KEY `idx_punteggi_giocatore` (`id_giocatore`),
  ADD KEY `idx_punteggi_valore` (`punteggio`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `giocatori`
--
ALTER TABLE `giocatori`
  MODIFY `id_giocatore` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `punteggi`
--
ALTER TABLE `punteggi`
  MODIFY `id_punteggio` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `punteggi`
--
ALTER TABLE `punteggi`
  ADD CONSTRAINT `fk_punteggi_giocatore` FOREIGN KEY (`id_giocatore`) REFERENCES `giocatori` (`id_giocatore`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
