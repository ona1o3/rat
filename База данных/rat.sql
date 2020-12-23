-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 23, 2020 at 10:40 PM
-- Server version: 8.0.15
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rat`
--

-- --------------------------------------------------------

--
-- Table structure for table `medicaments`
--

CREATE TABLE `medicaments` (
  `ID` int(25) NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicaments`
--

INSERT INTO `medicaments` (`ID`, `Name`) VALUES
(1, 'Codein'),
(2, 'Perkaset'),
(3, 'Xanny'),
(4, 'Weed'),
(5, 'Aspirin'),
(6, 'Spirt');

-- --------------------------------------------------------

--
-- Table structure for table `posetiteli`
--

CREATE TABLE `posetiteli` (
  `ID` int(25) NOT NULL,
  `Login` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Number` varchar(13) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posetiteli`
--

INSERT INTO `posetiteli` (`ID`, `Login`, `Number`) VALUES
(1, 'Vladik', '380995557788'),
(2, 'Rusik', '380714567891'),
(3, 'Maximka', '380714569273');

-- --------------------------------------------------------

--
-- Table structure for table `rabotniki`
--

CREATE TABLE `rabotniki` (
  `ID` int(25) NOT NULL,
  `Login` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Number` varchar(13) COLLATE utf8mb4_general_ci NOT NULL,
  `Position` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rabotniki`
--

INSERT INTO `rabotniki` (`ID`, `Login`, `Number`, `Position`) VALUES
(1, 'Stas', '3809988855547', 'Security'),
(2, 'Anton', '380916557788', 'Kassir'),
(3, 'Marina', '380710000000', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `zakazi`
--

CREATE TABLE `zakazi` (
  `ID` int(25) NOT NULL,
  `Buyer` int(25) NOT NULL,
  `Medicaments` int(25) NOT NULL,
  `Kassir` int(25) NOT NULL,
  `Price` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zakazi`
--

INSERT INTO `zakazi` (`ID`, `Buyer`, `Medicaments`, `Kassir`, `Price`) VALUES
(1, 3, 4, 2, '555'),
(2, 2, 1, 2, '999'),
(3, 1, 3, 2, '85546');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `medicaments`
--
ALTER TABLE `medicaments`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `posetiteli`
--
ALTER TABLE `posetiteli`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `rabotniki`
--
ALTER TABLE `rabotniki`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `zakazi`
--
ALTER TABLE `zakazi`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Buyer` (`Buyer`,`Medicaments`,`Kassir`),
  ADD KEY `Kassir` (`Kassir`),
  ADD KEY `Medicaments` (`Medicaments`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `medicaments`
--
ALTER TABLE `medicaments`
  MODIFY `ID` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `posetiteli`
--
ALTER TABLE `posetiteli`
  MODIFY `ID` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rabotniki`
--
ALTER TABLE `rabotniki`
  MODIFY `ID` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `zakazi`
--
ALTER TABLE `zakazi`
  MODIFY `ID` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `zakazi`
--
ALTER TABLE `zakazi`
  ADD CONSTRAINT `zakazi_ibfk_1` FOREIGN KEY (`Kassir`) REFERENCES `rabotniki` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zakazi_ibfk_2` FOREIGN KEY (`Medicaments`) REFERENCES `medicaments` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zakazi_ibfk_3` FOREIGN KEY (`Buyer`) REFERENCES `posetiteli` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
