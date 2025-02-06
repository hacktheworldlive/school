-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 17, 2024 at 09:12 PM
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
-- Table structure for table `matchups`
--

CREATE TABLE `matchups` (
  `id` int(11) NOT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `winner` varchar(255) DEFAULT NULL,
  `result` enum('win','draw','loss') DEFAULT NULL,
  `round` int(11) DEFAULT 1,
  `status` enum('completed','pending') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `matchups`
--

INSERT INTO `matchups` (`id`, `event_name`, `winner`, `result`, `round`, `status`) VALUES
(1, 'Basketball', NULL, NULL, 1, 'pending'),
(2, 'Basketball', NULL, NULL, 1, 'pending'),
(3, 'Basketball', NULL, NULL, 1, 'pending'),
(4, 'Basketball', NULL, NULL, 1, 'pending'),
(5, 'Basketball', NULL, NULL, 1, 'pending'),
(6, 'Basketball', NULL, NULL, 1, 'pending'),
(7, 'Basketball', NULL, NULL, 1, 'pending'),
(8, 'Basketball', NULL, NULL, 1, 'pending'),
(9, 'Basketball', NULL, NULL, 1, 'pending'),
(10, 'Basketball', NULL, NULL, 1, 'pending'),
(11, 'Basketball', NULL, NULL, 1, 'pending'),
(12, 'Basketball', NULL, NULL, 1, 'pending'),
(13, 'Soccer', NULL, NULL, 1, 'pending'),
(14, 'Soccer', NULL, NULL, 1, 'pending'),
(15, 'Soccer', NULL, NULL, 1, 'pending'),
(16, 'Soccer', NULL, NULL, 1, 'pending'),
(17, 'Soccer', NULL, NULL, 1, 'pending'),
(18, 'Soccer', NULL, NULL, 1, 'pending'),
(19, 'Soccer', NULL, NULL, 1, 'pending'),
(20, 'Soccer', NULL, NULL, 1, 'pending'),
(21, 'Soccer', NULL, NULL, 1, 'pending'),
(22, 'Soccer', NULL, NULL, 1, 'pending'),
(23, 'Soccer', NULL, NULL, 1, 'pending'),
(24, 'Soccer', NULL, NULL, 1, 'pending'),
(25, 'Math Quiz', NULL, NULL, 1, 'pending'),
(26, 'Math Quiz', NULL, NULL, 1, 'pending'),
(27, 'Math Quiz', NULL, NULL, 1, 'pending'),
(28, 'Math Quiz', NULL, NULL, 1, 'pending'),
(29, 'Math Quiz', NULL, NULL, 1, 'pending'),
(30, 'Math Quiz', NULL, NULL, 1, 'pending'),
(31, 'Math Quiz', NULL, NULL, 1, 'pending'),
(32, 'Math Quiz', NULL, NULL, 1, 'pending'),
(33, 'Math Quiz', NULL, NULL, 1, 'pending'),
(34, 'Math Quiz', NULL, NULL, 1, 'pending'),
(35, 'Math Quiz', NULL, NULL, 1, 'pending'),
(36, 'Math Quiz', NULL, NULL, 1, 'pending'),
(37, 'Science Quiz', NULL, NULL, 1, 'pending'),
(38, 'Science Quiz', NULL, NULL, 1, 'pending'),
(39, 'Science Quiz', NULL, NULL, 1, 'pending'),
(40, 'Science Quiz', NULL, NULL, 1, 'pending'),
(41, 'Science Quiz', NULL, NULL, 1, 'pending'),
(42, 'Science Quiz', NULL, NULL, 1, 'pending'),
(43, 'Science Quiz', NULL, NULL, 1, 'pending'),
(44, 'Science Quiz', NULL, NULL, 1, 'pending'),
(45, 'Science Quiz', NULL, NULL, 1, 'pending'),
(46, 'Science Quiz', NULL, NULL, 1, 'pending'),
(47, 'Science Quiz', NULL, NULL, 1, 'pending'),
(48, 'Science Quiz', NULL, NULL, 1, 'pending'),
(49, 'Relay Race', NULL, NULL, 1, 'pending'),
(50, 'Relay Race', NULL, NULL, 1, 'pending'),
(51, 'Relay Race', NULL, NULL, 1, 'pending'),
(52, 'Relay Race', NULL, NULL, 1, 'pending'),
(53, 'Relay Race', NULL, NULL, 1, 'pending'),
(54, 'Relay Race', NULL, NULL, 1, 'pending'),
(55, 'Relay Race', NULL, NULL, 1, 'pending'),
(56, 'Relay Race', NULL, NULL, 1, 'pending'),
(57, 'Relay Race', NULL, NULL, 1, 'pending'),
(58, 'Relay Race', NULL, NULL, 1, 'pending'),
(59, 'Relay Race', NULL, NULL, 1, 'pending'),
(60, 'Relay Race', NULL, NULL, 1, 'pending');

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
  `event` varchar(100) DEFAULT NULL,
  `participant_name` varchar(100) DEFAULT NULL,
  `round` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`id`, `event`, `participant_name`, `round`, `points`) VALUES
(1, 'arts', 'SSSS', NULL, 3),
(2, 'arts', 'nico', NULL, 0),
(3, 'arts', 'SSSS', NULL, 3),
(4, 'arts', 'wow', NULL, 0),
(5, 'arts', 'SSSS', NULL, 3),
(6, 'arts', 'wiwiw', NULL, 0),
(7, 'arts', 'nico', NULL, 3),
(8, 'arts', 'wow', NULL, 0),
(9, 'arts', 'nico', NULL, 3),
(10, 'arts', 'wiwiw', NULL, 0),
(11, 'arts', 'wow', NULL, 3),
(12, 'arts', 'wiwiw', NULL, 0);

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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `event` (`event`,`participant_name`,`round`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
