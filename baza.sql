-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2024 at 12:47 PM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baza`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `id` int(11) NOT NULL,
  `nazwa_uzytkownika` varchar(255) NOT NULL,
  `haslo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`id`, `nazwa_uzytkownika`, `haslo`) VALUES
(126, 'wowow', '$2y$10$B/1wZiDZew5hVGj.3XS7uuQZbC18/PDYkhbPX73hdENSyXRTMCZDS'),
(127, '99', '$2y$10$bcmgq/hyesml3k7cngYvfOE02ka.6rEzZtdbggKrjxxvRZzm3.cnS'),
(128, '99', '$2y$10$01CJfUJf18PwN1U/ZH3eqOSXzHRr7O3nyXM1/Uz0tXqWWR1Xdpm3m'),
(129, '77', '$2y$10$mC6Dv.41GW0L6458Yd/P3OJSNL5zruRvYtev2eMR/GhjgVB2mJyK2'),
(130, '77', '$2y$10$F6tNkJGtM/oCDDRioQwNsuisnAcYWzXOpoOQuZQa9x71iAG0akrjO'),
(131, '55', '$2y$10$jtk3a9prA8xLIbUTjpnfC.OJ0LFXm6uupcwKgwrKZyJbfyuXTdd/m'),
(132, '55', '$2y$10$Yru3lsE8LBwgNUSa/TkYaeUJ9ogP90NZ2K/4YnXjyr9mnQwzpoMOe'),
(133, '44', '$2y$10$0fMe7sR/CUUL3YN6b3Bp8.koD9D9xxWeMUDKEYd270fmo5Fg5H6ZO'),
(134, '44', '$2y$10$HqzDyN7yQxpmcw0z/lYqsuBpZOfbE.6wdzoqFUe1bKxr.nBjiNMRG'),
(135, '44', '$2y$10$OXBkOoK8b.N4iCiAfcq/ce67W/l/dW6uMeMNu.Vb7gW5BQIg39ewm'),
(136, '44', '$2y$10$LkqzgPFZ.CHNF5SD7nORAu427db4A43SH4g/qvUvYiF8g5Qqsv9TC'),
(137, '00', '$2y$10$7.RCRBOwAnfqiiY2fyoiEeWi9GXWMouymBAwNNTsa/JcB5liRQjrK'),
(138, '00', '$2y$10$qJuxRKAlqa9QhsAjJXk5Seg/exgRb6sXJChMjfapw6Ml7ApyfZeOm'),
(139, '77', '$2y$10$.5P/aXmrbR06HJR63.abyOmNsMbuniEUtpXXYKfTapxCgFHXv1QSK'),
(140, '77', '$2y$10$OH883ZCqRM3rnvzd9iZPyu/81Z/eHc9qPFs1yrLYygcxf.icuAuem'),
(141, '22', '$2y$10$EZaUi.uyc.ERVaAo4dwTFOPb8LHIsGINLX.rW0fAsM.Cvti9JHh06'),
(142, '22', '$2y$10$AC5yQBXABGqn323iKG24FeHg.ZPo/VMua6GQx7ycrER9LVsMfH1T.'),
(143, '54', '$2y$10$dhM0L3Xm8zgWeBWMlLM27ueEp4ba3jJwRF6Z7q7rMDw94ok16PO6q'),
(144, '54', '$2y$10$JEmw4UkmZsfwaX3q834HFehiy1ZYvYPQWVKViK8ijI8Lki317KBvW'),
(145, '76', '$2y$10$TJJVQU/a1FFelL.9JiXm8e6DultRkRBmsTkdU4WHOK3Ll9.ppO3km'),
(146, '76', '$2y$10$MXgjS3wmBbhIJ5JNPwtA0um8OCQu6iihbW7FwnfPXXnb6HUImBAW6'),
(147, '23', '$2y$10$G94SvzeZaWLuQ8w3m3h2eOk8VLfFPDNBnfMpoLYCAfZe8krIRSpOy'),
(148, '23', '$2y$10$acH61ds/xzvJGzHj8ZgiH.4TcKTkW.8olsGym6hP2kewDTHzVpy8m'),
(149, '77', '$2y$10$3aMjnTK0EIr1atS7J6FoMO5M4bjcuR1jPe2GSCsqwSejX3.JcrxCK'),
(150, '77', '$2y$10$lsroTyaJ.VbBtdUEUrxufu7XvIIeLnOM5mv9Lg7y8HrUKOVKzLBlC'),
(151, '0101', '$2y$10$yZiE6.jAd3GvSsVloQEJr.aj3rAkLt0/mFh9XgGQE4Uaek79B/XKe'),
(152, '0101', '$2y$10$PI0Y8E.P5.GW3cLlqeI3ue9uYZ8cX1OWLjAmuPO6B6pkVANndQQ5e'),
(153, '0101', '$2y$10$s7.m3e5lyBxXjMvr5WhShedLSqk8U9742XQtfw7Gfw3aCV369A18q'),
(154, '0101', '$2y$10$GcJ/KRID4nyT9nadczcJXukDlVl8T7cxHK.FrEfXwkDslvBZn4osS'),
(155, '67', '$2y$10$9Z3xn6q8FRKnGgPha3U5o.gkjTXrRbhY8tOajcYXpYMngsj6HHwae'),
(156, '67', '$2y$10$kjuKrq6..6LhAJCXDDxF3.FK58x2SVUwsw.enzhlkUk3qioraAejG'),
(157, '67', '$2y$10$aGuoDQe9E5n9l14Xnp1PMeFR1HqhElkqq0zxq8DELkIdOYpu.Tfoy'),
(158, '67', '$2y$10$QS1C5Pd5yc4NYOxgRx0OTe0fXLwc3GQb1SrxPg9KXOZR30PhZn.5W'),
(159, '67', '$2y$10$gsCJdpwaAe.WzC70qSNJ/eilsyf.EMondv0EjhnIQNBwa.hOUCha.'),
(160, '67', '$2y$10$H3I4FE3t5S4MunSrNxqliONf0EQQNZ7cZWjX.ycD3nv5fisDft6/m'),
(161, '67', '$2y$10$OG0IJXmpYjT.TE8X9lzwnuhbegbiHDAYZRCANesPVSF6ZmtvvDRrW'),
(162, '67', '$2y$10$/QLFmbDmdpjZtXmNbbbFweRHpCNW47ilFoG/JmdwUbiAL6P5X/iA2'),
(163, '67', '$2y$10$pUdzA0x/z8yzKTs5mqo3ReCG80c7BtiietIYvJirQP/5OBGPlZGZ6'),
(164, '67', '$2y$10$0Y7mncj/t9tPuItPwh03Q.UtuS.CGVO1wJEXPHT4Bxc.5z2uzertS'),
(165, '34', '$2y$10$rwJXlofFer47nwaJREpomOs8QPvo3vZsQNxHE31Y4JIxn/Oeydn06'),
(166, '34', '$2y$10$YZDUyGm7IQ5BGXKIa8OD1ez45uIkC4WadS2Ix3P//baTeL03YI3pi');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
