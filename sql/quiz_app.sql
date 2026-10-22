-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 22, 2026 at 09:44 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int NOT NULL,
  `question_id` int NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `question_id`, `label`, `is_correct`) VALUES
(1, 1, 'Sydney', 0),
(2, 1, 'Canberra', 1),
(3, 1, 'Melbourne', 0),
(4, 1, 'Brisbane', 0),
(5, 2, 'Michel-Ange', 0),
(6, 2, 'Raphaël', 0),
(7, 2, 'Léonard de Vinci', 1),
(8, 2, 'Botticelli', 0),
(9, 3, 'Océan Atlantique', 0),
(10, 3, 'Océan Pacifique', 1),
(11, 3, 'Océan Indien', 0),
(12, 3, 'Océan Arctique', 0),
(13, 4, '1961', 0),
(14, 4, '1965', 0),
(15, 4, '1969', 1),
(16, 4, '1972', 0),
(17, 5, 'La Seine', 0),
(18, 5, 'Le Rhône', 0),
(19, 5, 'La Garonne', 0),
(20, 5, 'La Loire', 1),
(21, 6, '54', 0),
(22, 6, '56', 1),
(23, 6, '58', 0),
(24, 6, '64', 0),
(25, 7, '10', 0),
(26, 7, '11', 0),
(27, 7, '12', 1),
(28, 7, '14', 0),
(29, 8, '32', 0),
(30, 8, '42', 1),
(31, 8, '43', 0),
(32, 8, '52', 0),
(33, 9, '57', 0),
(34, 9, '63', 1),
(35, 9, '67', 0),
(36, 9, '73', 0),
(37, 10, '18', 0),
(38, 10, '72', 0),
(39, 10, '81', 1),
(40, 10, '99', 0),
(41, 11, '30 000 km/s', 0),
(42, 11, '150 000 km/s', 0),
(43, 11, '300 000 km/s', 1),
(44, 11, '3 000 000 km/s', 0),
(45, 12, '1,62 m/s²', 0),
(46, 12, '3,71 m/s²', 0),
(47, 12, '9,81 m/s²', 1),
(48, 12, '24,8 m/s²', 0),
(49, 13, '−100 °C', 0),
(50, 13, '0 °C', 0),
(51, 13, '−273,15 °C', 1),
(52, 13, '−460 °C', 0),
(53, 14, '6,022 × 10¹⁹ mol⁻¹', 0),
(54, 14, '6,022 × 10²³ mol⁻¹', 1),
(55, 14, '3,141 × 10²³ mol⁻¹', 0),
(56, 14, '9,81 × 10²³ mol⁻¹', 0),
(57, 15, '6,626 × 10⁻³⁴ J·s', 1),
(58, 15, '6,626 × 10⁻²⁴ J·s', 0),
(59, 15, '1,602 × 10⁻¹⁹ J·s', 0),
(60, 15, '9,109 × 10⁻³¹ J·s', 0);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int NOT NULL,
  `quiz_id` int NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `quiz_id`, `label`) VALUES
(1, 1, 'Quelle est la capitale de l\'Australie ?'),
(2, 1, 'Qui a peint la Joconde ?'),
(3, 1, 'Quel est le plus grand océan du monde ?'),
(4, 1, 'En quelle année l\'homme a-t-il marché sur la Lune pour la première fois ?'),
(5, 1, 'Quel est le plus long fleuve de France ?'),
(6, 2, 'Combien font 7 × 8 ?'),
(7, 2, 'Combien font 144 ÷ 12 ?'),
(8, 2, 'Combien font 15 + 27 ?'),
(9, 2, 'Combien font 100 − 37 ?'),
(10, 2, 'Combien font 9² ?'),
(11, 3, 'Quelle est la vitesse de la lumière dans le vide (environ) ?'),
(12, 3, 'Quelle est la valeur de l\'accélération de la pesanteur à la surface de la Terre ?'),
(13, 3, 'Quelle est la valeur du zéro absolu en degrés Celsius ?'),
(14, 3, 'Quelle est la valeur approximative du nombre d\'Avogadro ?'),
(15, 3, 'Quelle est la valeur approximative de la constante de Planck h ?');

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` int NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `title`, `description`) VALUES
(1, 'Culture générale', 'Géographie, art et histoire : teste ta culture !'),
(2, 'Arithmétique simple', 'Du calcul mental, rapide et sans calculatrice.'),
(3, 'Constantes physiques', 'Vitesse de la lumière, Avogadro, Planck... les connais-tu ?');

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `quiz_id` int NOT NULL,
  `score` int NOT NULL,
  `total` int NOT NULL,
  `played_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `pseudo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pseudo` (`pseudo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `scores_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
