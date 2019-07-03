-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2019 at 06:31 PM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `health_center`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `dr_id` int(11) NOT NULL,
  `speciality` varchar(155) DEFAULT NULL,
  `name` varchar(155) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`dr_id`, `speciality`, `name`) VALUES
(1598, 'Hands on Fire', 'Dr. Hot'),
(2226, 'Life saver', 'Dr. Cool'),
(3486, 'Knee repairer', 'Dr. Knee'),
(5986, 'Surgery master', 'Dr. Master');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `history_id` int(11) NOT NULL,
  `patient_sv` int(11) DEFAULT NULL,
  `symptom` text,
  `history_date` date DEFAULT NULL,
  `treatment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`history_id`, `patient_sv`, `symptom`, `history_date`, `treatment`) VALUES
(1, 423489, 'Possible death', NULL, 'No treathment possible'),
(2, 653635, 'Broken head', NULL, 'Metal implant'),
(3, 985632, '1st level burn', NULL, 'Water shower'),
(4, 245689, 'Sunburnt', NULL, 'Cream'),
(5, 213568, 'Broken ankle', NULL, 'Plaster'),
(6, 453256, 'Broken finger', NULL, 'Plaster'),
(7, 452356, 'Broken knee', NULL, 'Metal implant'),
(8, 432456, 'Fractured shoulder', NULL, 'Tightening'),
(9, 423569, 'Broken head', NULL, 'Metal implant');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_sv` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `checkin_date` date DEFAULT NULL,
  `age` tinyint(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_sv`, `unit_id`, `checkin_date`, `age`) VALUES
(213568, 1, NULL, 12),
(245689, 4, NULL, 69),
(256891, 4, NULL, 69),
(353256, 2, NULL, 91),
(423489, 1, NULL, 23),
(423497, 1, NULL, 23),
(423569, 1, NULL, 45),
(432456, 4, NULL, 33),
(452356, 3, NULL, 42),
(453256, 2, NULL, 91),
(462356, 3, NULL, 42),
(489569, 1, NULL, 45),
(562456, 4, NULL, 33),
(653344, 2, NULL, 59),
(653635, 2, NULL, 59),
(713568, 1, NULL, 12),
(985632, 3, NULL, 46),
(986321, 3, NULL, 46);

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL,
  `dr_id` int(11) DEFAULT NULL,
  `name` varchar(155) DEFAULT NULL,
  `floor` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`unit_id`, `dr_id`, `name`, `floor`) VALUES
(1, NULL, 'Burn Center', 11),
(2, NULL, 'Cardiology', 21),
(3, NULL, 'Orthopedy', 31),
(4, NULL, 'Surgery', 41);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`dr_id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `patient_sv` (`patient_sv`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_sv`),
  ADD KEY `patient_ibfk_1` (`unit_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`unit_id`),
  ADD KEY `dr_id` (`dr_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `dr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5987;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patient_sv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=986322;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`patient_sv`) REFERENCES `patient` (`patient_sv`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`unit_id`);

--
-- Constraints for table `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`dr_id`) REFERENCES `doctor` (`dr_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
