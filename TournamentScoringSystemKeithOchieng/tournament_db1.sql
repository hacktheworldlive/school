-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 10, 2024 at 10:08 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tournament_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `event_type` enum('individual','team') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `event_name`, `event_type`) VALUES
(15, 'Tennis', 'individual'),
(16, 'singing', 'individual'),
(17, 'math', 'individual'),
(18, 'Basketball', 'individual'),
(19, 'Hockey', 'individual'),
(20, 'arts', 'team'),
(21, 'singing', 'team'),
(22, 'wrestling', 'team'),
(23, 'chess', 'team'),
(24, 'performing', 'team');

-- --------------------------------------------------------

--
-- Table structure for table `individuals_points`
--

CREATE TABLE `individuals_points` (
  `id` int(11) NOT NULL,
  `individual_name` varchar(255) DEFAULT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `points` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matchups`
--

CREATE TABLE `matchups` (
  `id` int(11) NOT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `type` enum('team','individual') DEFAULT NULL,
  `team1` varchar(255) DEFAULT NULL,
  `team2` varchar(255) DEFAULT NULL,
  `participant1` varchar(255) DEFAULT NULL,
  `participant2` varchar(255) DEFAULT NULL,
  `winner` varchar(255) DEFAULT NULL,
  `result` enum('win','draw','loss') DEFAULT NULL,
  `round` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `matchups`
--

INSERT INTO `matchups` (`id`, `event_name`, `type`, `team1`, `team2`, `participant1`, `participant2`, `winner`, `result`, `round`) VALUES
(1, 'Basketball', NULL, 'SSSS', 'nico', NULL, NULL, NULL, NULL, 1),
(2, 'Basketball', NULL, 'wow', 'wiwiw', NULL, NULL, NULL, NULL, 1),
(3, 'Basketball', NULL, NULL, NULL, 'leo', 'tom', NULL, NULL, 1),
(4, 'Basketball', NULL, NULL, NULL, 'mathew', 'zack', NULL, NULL, 1),
(5, 'Basketball', NULL, NULL, NULL, 'andrew', 'tom', NULL, NULL, 1),
(6, 'Basketball', NULL, NULL, NULL, 'eeee', 'eeeee', NULL, NULL, 1),
(7, 'Basketball', NULL, NULL, NULL, 'sfdddd', 'sfffff', NULL, NULL, 1),
(8, 'Basketball', NULL, NULL, NULL, 'rrfdd', 'srfds', NULL, NULL, 1),
(9, 'Basketball', NULL, NULL, NULL, 'tttddd', 'srgrefe', NULL, NULL, 1),
(10, 'Basketball', NULL, NULL, NULL, 'effgrfefef', 'dedrrewe', NULL, NULL, 1),
(11, 'Basketball', NULL, NULL, NULL, 'drfrefe', 'drtr4re', NULL, NULL, 1),
(12, 'Basketball', NULL, NULL, NULL, '2wr4r', 'serew', NULL, NULL, 1),
(13, 'Soccer', NULL, 'SSSS', 'nico', NULL, NULL, NULL, NULL, 1),
(14, 'Soccer', NULL, 'wow', 'wiwiw', NULL, NULL, NULL, NULL, 1),
(15, 'Soccer', NULL, NULL, NULL, 'leo', 'tom', NULL, NULL, 1),
(16, 'Soccer', NULL, NULL, NULL, 'mathew', 'zack', NULL, NULL, 1),
(17, 'Soccer', NULL, NULL, NULL, 'andrew', 'tom', NULL, NULL, 1),
(18, 'Soccer', NULL, NULL, NULL, 'eeee', 'eeeee', NULL, NULL, 1),
(19, 'Soccer', NULL, NULL, NULL, 'sfdddd', 'sfffff', NULL, NULL, 1),
(20, 'Soccer', NULL, NULL, NULL, 'rrfdd', 'srfds', NULL, NULL, 1),
(21, 'Soccer', NULL, NULL, NULL, 'tttddd', 'srgrefe', NULL, NULL, 1),
(22, 'Soccer', NULL, NULL, NULL, 'effgrfefef', 'dedrrewe', NULL, NULL, 1),
(23, 'Soccer', NULL, NULL, NULL, 'drfrefe', 'drtr4re', NULL, NULL, 1),
(24, 'Soccer', NULL, NULL, NULL, '2wr4r', 'serew', NULL, NULL, 1),
(25, 'Math Quiz', NULL, 'SSSS', 'nico', NULL, NULL, NULL, NULL, 1),
(26, 'Math Quiz', NULL, 'wow', 'wiwiw', NULL, NULL, NULL, NULL, 1),
(27, 'Math Quiz', NULL, NULL, NULL, 'leo', 'tom', NULL, NULL, 1),
(28, 'Math Quiz', NULL, NULL, NULL, 'mathew', 'zack', NULL, NULL, 1),
(29, 'Math Quiz', NULL, NULL, NULL, 'andrew', 'tom', NULL, NULL, 1),
(30, 'Math Quiz', NULL, NULL, NULL, 'eeee', 'eeeee', NULL, NULL, 1),
(31, 'Math Quiz', NULL, NULL, NULL, 'sfdddd', 'sfffff', NULL, NULL, 1),
(32, 'Math Quiz', NULL, NULL, NULL, 'rrfdd', 'srfds', NULL, NULL, 1),
(33, 'Math Quiz', NULL, NULL, NULL, 'tttddd', 'srgrefe', NULL, NULL, 1),
(34, 'Math Quiz', NULL, NULL, NULL, 'effgrfefef', 'dedrrewe', NULL, NULL, 1),
(35, 'Math Quiz', NULL, NULL, NULL, 'drfrefe', 'drtr4re', NULL, NULL, 1),
(36, 'Math Quiz', NULL, NULL, NULL, '2wr4r', 'serew', NULL, NULL, 1),
(37, 'Science Quiz', NULL, 'SSSS', 'nico', NULL, NULL, NULL, NULL, 1),
(38, 'Science Quiz', NULL, 'wow', 'wiwiw', NULL, NULL, NULL, NULL, 1),
(39, 'Science Quiz', NULL, NULL, NULL, 'leo', 'tom', NULL, NULL, 1),
(40, 'Science Quiz', NULL, NULL, NULL, 'mathew', 'zack', NULL, NULL, 1),
(41, 'Science Quiz', NULL, NULL, NULL, 'andrew', 'tom', NULL, NULL, 1),
(42, 'Science Quiz', NULL, NULL, NULL, 'eeee', 'eeeee', NULL, NULL, 1),
(43, 'Science Quiz', NULL, NULL, NULL, 'sfdddd', 'sfffff', NULL, NULL, 1),
(44, 'Science Quiz', NULL, NULL, NULL, 'rrfdd', 'srfds', NULL, NULL, 1),
(45, 'Science Quiz', NULL, NULL, NULL, 'tttddd', 'srgrefe', NULL, NULL, 1),
(46, 'Science Quiz', NULL, NULL, NULL, 'effgrfefef', 'dedrrewe', NULL, NULL, 1),
(47, 'Science Quiz', NULL, NULL, NULL, 'drfrefe', 'drtr4re', NULL, NULL, 1),
(48, 'Science Quiz', NULL, NULL, NULL, '2wr4r', 'serew', NULL, NULL, 1),
(49, 'Relay Race', NULL, 'SSSS', 'nico', NULL, NULL, NULL, NULL, 1),
(50, 'Relay Race', NULL, 'wow', 'wiwiw', NULL, NULL, NULL, NULL, 1),
(51, 'Relay Race', NULL, NULL, NULL, 'leo', 'tom', NULL, NULL, 1),
(52, 'Relay Race', NULL, NULL, NULL, 'mathew', 'zack', NULL, NULL, 1),
(53, 'Relay Race', NULL, NULL, NULL, 'andrew', 'tom', NULL, NULL, 1),
(54, 'Relay Race', NULL, NULL, NULL, 'eeee', 'eeeee', NULL, NULL, 1),
(55, 'Relay Race', NULL, NULL, NULL, 'sfdddd', 'sfffff', NULL, NULL, 1),
(56, 'Relay Race', NULL, NULL, NULL, 'rrfdd', 'srfds', NULL, NULL, 1),
(57, 'Relay Race', NULL, NULL, NULL, 'tttddd', 'srgrefe', NULL, NULL, 1),
(58, 'Relay Race', NULL, NULL, NULL, 'effgrfefef', 'dedrrewe', NULL, NULL, 1),
(59, 'Relay Race', NULL, NULL, NULL, 'drfrefe', 'drtr4re', NULL, NULL, 1),
(60, 'Relay Race', NULL, NULL, NULL, '2wr4r', 'serew', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `points` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`id`, `name`, `type`, `points`) VALUES
(1, 'leo', 'individual', 0),
(2, 'tom', 'individual', 6),
(3, 'mathew', 'individual', 0),
(4, 'zack', 'individual', 3),
(5, 'andrew', 'individual', 0),
(6, 'tom', 'individual', 6),
(7, 'eeee', 'individual', 0),
(8, 'eeeee', 'individual', 0),
(9, 'sfdddd', 'individual', 0),
(10, 'sfffff', 'individual', 0),
(11, 'rrfdd', 'individual', 0),
(12, 'srfds', 'individual', 0),
(13, 'tttddd', 'individual', 0),
(14, 'srgrefe', 'individual', 0),
(15, 'effgrfefef', 'individual', 0),
(16, 'dedrrewe', 'individual', 0),
(17, 'drfrefe', 'individual', 0),
(18, 'drtr4re', 'individual', 0),
(19, '2wr4r', 'individual', 0),
(20, 'serew', 'individual', 0);

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `id` int(11) NOT NULL,
  `event` varchar(255) NOT NULL,
  `participant_name` varchar(255) NOT NULL,
  `round` int(11) NOT NULL,
  `points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `team_name` varchar(255) NOT NULL,
  `members` varchar(255) DEFAULT NULL,
  `points` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `team_name`, `members`, `points`) VALUES
(1, 'SSSS', 'leo,tom,nicko,andrew,isaac', 6),
(2, 'nico', 'leo,tom,nicko,andrew,isaac', 0),
(3, 'wow', 'leo,tom,nicko,andrew,isaac', 0),
(4, 'wiwiw', 'leo,tom,nicko,andrew,isaac', 3);

-- --------------------------------------------------------

--
-- Table structure for table `teams_points`
--

CREATE TABLE `teams_points` (
  `id` int(11) NOT NULL,
  `team_name` varchar(255) DEFAULT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `points` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `individuals_points`
--
ALTER TABLE `individuals_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matchups`
--
ALTER TABLE `matchups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams_points`
--
ALTER TABLE `teams_points`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `individuals_points`
--
ALTER TABLE `individuals_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matchups`
--
ALTER TABLE `matchups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `teams_points`
--
ALTER TABLE `teams_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
