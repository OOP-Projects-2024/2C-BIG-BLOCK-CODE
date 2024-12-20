-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2024 at 09:34 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `survey_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `questions_tbl`
--

CREATE TABLE `questions_tbl` (
  `question_id` int(11) NOT NULL,
  `survey_id` int(11) DEFAULT NULL,
  `question_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `responses_tbl`
--

CREATE TABLE `responses_tbl` (
  `response_id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `response_text` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `surveys_tbl`
--

CREATE TABLE `surveys_tbl` (
  `survey_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_tbl`
--

CREATE TABLE `users_tbl` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `Token` varchar(255) DEFAULT NULL,
  `isdeleted` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `questions_tbl`
--
ALTER TABLE `questions_tbl`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `questions-survey` (`survey_id`);

--
-- Indexes for table `responses_tbl`
--
ALTER TABLE `responses_tbl`
  ADD PRIMARY KEY (`response_id`),
  ADD KEY `response-question` (`question_id`);

--
-- Indexes for table `surveys_tbl`
--
ALTER TABLE `surveys_tbl`
  ADD PRIMARY KEY (`survey_id`),
  ADD KEY `survey->user` (`user_id`);

--
-- Indexes for table `users_tbl`
--
ALTER TABLE `users_tbl`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `questions_tbl`
--
ALTER TABLE `questions_tbl`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `responses_tbl`
--
ALTER TABLE `responses_tbl`
  MODIFY `response_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `surveys_tbl`
--
ALTER TABLE `surveys_tbl`
  MODIFY `survey_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_tbl`
--
ALTER TABLE `users_tbl`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `questions_tbl`
--
ALTER TABLE `questions_tbl`
  ADD CONSTRAINT `questions-survey` FOREIGN KEY (`survey_id`) REFERENCES `surveys_tbl` (`survey_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `responses_tbl`
--
ALTER TABLE `responses_tbl`
  ADD CONSTRAINT `response-question` FOREIGN KEY (`question_id`) REFERENCES `questions_tbl` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `surveys_tbl`
--
ALTER TABLE `surveys_tbl`
  ADD CONSTRAINT `survey->user` FOREIGN KEY (`user_id`) REFERENCES `users_tbl` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
