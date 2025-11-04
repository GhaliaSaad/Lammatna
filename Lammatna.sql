-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 04, 2025 at 08:04 PM
-- Server version: 8.0.40
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Lammatna`
--

-- --------------------------------------------------------

--
-- Table structure for table `Gathering`
--

CREATE TABLE `Gathering` (
  `GatheringID` int NOT NULL,
  `date` date NOT NULL,
  `category` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `time` time NOT NULL,
  `joinCode` varchar(20) NOT NULL,
  `adminID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Notification`
--

CREATE TABLE `Notification` (
  `NotificationID` int NOT NULL,
  `time` varchar(10) NOT NULL,
  `UsedID` int NOT NULL,
  `GatheringID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Participant`
--

CREATE TABLE `Participant` (
  `UserID` int NOT NULL,
  `GatheringID` int NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Task`
--

CREATE TABLE `Task` (
  `TaskID` int NOT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `note` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `UserID` int NOT NULL,
  `GatheringID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Gathering`
--
ALTER TABLE `Gathering`
  ADD PRIMARY KEY (`GatheringID`),
  ADD KEY `adminID` (`adminID`);

--
-- Indexes for table `Notification`
--
ALTER TABLE `Notification`
  ADD PRIMARY KEY (`NotificationID`),
  ADD KEY `UsedID` (`UsedID`),
  ADD KEY `GatheringID` (`GatheringID`);

--
-- Indexes for table `Participant`
--
ALTER TABLE `Participant`
  ADD PRIMARY KEY (`UserID`,`GatheringID`),
  ADD KEY `GatheringID` (`GatheringID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `Task`
--
ALTER TABLE `Task`
  ADD PRIMARY KEY (`TaskID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `GatheringID` (`GatheringID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Gathering`
--
ALTER TABLE `Gathering`
  ADD CONSTRAINT `gathering_ibfk_1` FOREIGN KEY (`adminID`) REFERENCES `user` (`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `Notification`
--
ALTER TABLE `Notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`GatheringID`) REFERENCES `Gathering` (`GatheringID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`UsedID`) REFERENCES `user` (`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `Participant`
--
ALTER TABLE `Participant`
  ADD CONSTRAINT `participant_ibfk_1` FOREIGN KEY (`GatheringID`) REFERENCES `Gathering` (`GatheringID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `participant_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `Task`
--
ALTER TABLE `Task`
  ADD CONSTRAINT `task_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
