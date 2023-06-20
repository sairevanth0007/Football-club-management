-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: fdb30.awardspace.net
-- Generation Time: Jan 20, 2021 at 07:42 AM
-- Server version: 5.7.20-log
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `3718110_manutd`
--

-- --------------------------------------------------------

--
-- Table structure for table `club`
--

CREATE TABLE `club` (
  `id` int(50) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `year` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `club`
--

INSERT INTO `club` (`id`, `name`, `year`) VALUES
(1, 'Manchester United', '2021-01-05'),
(2, 'Byren', '2021-01-08');

-- --------------------------------------------------------

--
-- Table structure for table `fix`
--

CREATE TABLE `fix` (
  `id` int(50) NOT NULL,
  `com` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `home` text COLLATE utf8_unicode_ci NOT NULL,
  `away` text COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` text COLLATE utf8_unicode_ci NOT NULL,
  `sec` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fix`
--

INSERT INTO `fix` (`id`, `com`, `home`, `away`, `date`, `time`, `sec`) VALUES
(8, 'Pl', 'Man Utd', 'Byren', '2021-01-23', '10:00', 'PM');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `club_id` int(50) NOT NULL,
  `player_id` int(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `jersy_no` int(10) NOT NULL,
  `apper` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`club_id`, `player_id`, `name`, `jersy_no`, `apper`) VALUES
(1, 41, 'tarun', 0, 0),
(1, 28, 'suresh', 2, 0),
(2, 32, 'ravi', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `club_id` int(10) NOT NULL,
  `player_id` int(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `nationality` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `jersy_no` int(5) NOT NULL,
  `height` int(5) NOT NULL,
  `position` varchar(20) NOT NULL,
  `bpos` text NOT NULL,
  `apper` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`club_id`, `player_id`, `name`, `nationality`, `dob`, `jersy_no`, `height`, `position`, `bpos`, `apper`) VALUES
(2, 29, 'Fred', 'Brazil', '1996-02-24', 4, 6, 'Midfielder', 'AMF', 20),
(1, 30, 'David De Gea', 'Spain', '2017-02-09', 1, 6, 'Goal Keeper', 'GK', 0),
(2, 42, 'Maguire', 'England', '2020-12-30', 5, 5, 'Defender', 'CB', 0),
(1, 43, 'Edinson Cavani', 'France', '2021-01-15', 7, 6, 'Forward', 'CF', 0);

--
-- Triggers `players`
--
DELIMITER $$
CREATE TRIGGER `hist` BEFORE DELETE ON `players` FOR EACH ROW INSERT INTO history SET club_id=old.club_id,player_id=old.player_id,name=old.name,jersy_no=old.jersy_no,apper=old.apper
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `registered`
--

CREATE TABLE `registered` (
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `registered`
--

INSERT INTO `registered` (`username`, `password`) VALUES
('sairevanth0007@gmail.com', 'man143utd');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `club_id` int(50) NOT NULL,
  `id` int(50) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `position` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`club_id`, `id`, `name`, `dob`, `position`) VALUES
(1, 5, 'Sir Alex', '1994-07-07', 'Manage'),
(2, 9, 'Flick', '1974-07-18', 'Manager');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fix`
--
ALTER TABLE `fix`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `players_ibfk_1` (`club_id`);

--
-- Indexes for table `registered`
--
ALTER TABLE `registered`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_ibfk_1` (`club_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fix`
--
ALTER TABLE `fix`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `player_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
