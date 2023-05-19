-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2023 at 10:14 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatbot_application`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `pwd`) VALUES
(1, 'admin@gmail.com', 'admin'),
(2, 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `feed_back`
--

CREATE TABLE `feed_back` (
  `id` int(255) NOT NULL,
  `feed_back_msg` varchar(255) NOT NULL,
  `feed_back_type` varchar(255) NOT NULL,
  `user_text` varchar(255) NOT NULL,
  `bot_response` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feed_back`
--

INSERT INTO `feed_back` (`id`, `feed_back_msg`, `feed_back_type`, `user_text`, `bot_response`) VALUES
(10, 'positive feedback', 'true', 'Hello', 'Hi there, how can I help?'),
(11, 'positive feedback', 'true', 'How are you?', 'Hello, thanks for asking, How are you'),
(12, 'positive feedback', 'true', 'How are you?', 'Hello, thanks for asking, How are you'),
(13, 'positive feedback', 'true', 'How are you?', 'Hello, thanks for asking, How are you'),
(14, 'negative feedback', 'false', 'How are You?', 'Hello, thanks for asking, How are you');

-- --------------------------------------------------------

--
-- Table structure for table `new_query_data`
--

CREATE TABLE `new_query_data` (
  `id` int(255) NOT NULL,
  `feed_back_id` varchar(255) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `patterns` varchar(255) NOT NULL,
  `responses` varchar(255) NOT NULL,
  `context` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `new_query_data`
--

INSERT INTO `new_query_data` (`id`, `feed_back_id`, `tag`, `patterns`, `responses`, `context`) VALUES
(2, '', 'new_tag', 'Hello', 'positive feedback', 'new_context');

-- --------------------------------------------------------

--
-- Table structure for table `queries`
--

CREATE TABLE `queries` (
  `id` int(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `user_text` varchar(255) NOT NULL,
  `chatbot_response` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `queries`
--

INSERT INTO `queries` (`id`, `user_id`, `user_text`, `chatbot_response`) VALUES
(1, 'adnansami@gmail.com', 'বাংলা ', 'This chatbot contains NSTU based information queries,please try do to valid question,Thank you'),
(2, 'adnansami@gmail.com', 'Hello Every One', 'Hello, thanks for asking, How are you'),
(3, 'adnansami@gmail.com', 'Hi', 'Hello, thanks for asking, How are you'),
(4, 'adnansami@gmail.com', 'নোয়াখালী ', 'This chatbot contains NSTU based information queries,please try do to valid question,Thank you'),
(5, 'adnansami@gmail.com', 'এগ্রি', 'এগ্রি এর পূর্ণরূপ হচ্ছে এগ্রিকালচার।'),
(6, 'adnansami@gmail.com', 'hi', 'Hello, thanks for asking, How are you'),
(7, 'adnansami@gmail.com', 'Hi', 'Hi there, how can I help?'),
(8, 'adnansami@gmail.com', 'nstu', 'The central mosque of  NSTU is located on the way to the library building and front of the MEdical Center Nstu. See more details in map: https://vymaps.com/BD/Nstu-Central-Mosque-O8343189241/'),
(9, 'adnansami@gmail.com', 'hi', 'Hello, thanks for asking, How are you'),
(10, 'adnansami@gmail.com', 'Hi', 'Hi there, how can I help?'),
(11, 'adnansami@gmail.com', 'hi', 'Hi there, how can I help?'),
(12, 'adnansami@gmail.com', 'hello', 'Hello, thanks for asking, How are you'),
(13, 'adnansami@gmail.com', 'bye', 'Have a nice day'),
(14, 'adnansami@gmail.com', 'এগ্রি', 'এগ্রি এর পূর্ণরূপ হচ্ছে এগ্রিকালচার।'),
(15, 'adnansami@gmail.com', 'এনএসটিইউ  ল্যাব', 'প্রত্যেক ডিপার্টমেন্ট এবং ইন্সটিটিউট এর নিজ নিজ ল্যাব সুবিধা রয়েছে।'),
(16, 'adnansami@gmail.com', 'iit', 'Total 13 teachers are in IIT.See more in details: https://www.nstu.edu.bd/IIT.html'),
(17, 'adnansami@gmail.com', 'hi', 'Hi there, how can I help?'),
(18, 'adnansami@gmail.com', 'hi', 'Hello, thanks for asking, How are you'),
(19, 'adnansami@gmail.com', 'hi', 'Hi there, how can I help?'),
(20, 'adnansami@gmail.com', 'bye', 'Bye! Come back again soon.'),
(21, 'adnansami@gmail.com', 'iit', 'Total 13 teachers are in IIT.See more in details: https://www.nstu.edu.bd/IIT.html'),
(22, 'adnansami@gmail.com', 'hi', 'Hello, thanks for asking, How are you'),
(23, 'adnansami@gmail.com', 'hello', 'Hello, thanks for asking, How are you'),
(24, 'adnansami@gmail.com', 'iit', 'Total 13 teachers are in IIT.See more in details: https://www.nstu.edu.bd/IIT.html'),
(25, 'adnansami@gmail.com', 'nstu', 'The central mosque of  NSTU is located on the way to the library building and front of the MEdical Center Nstu. See more details in map: https://vymaps.com/BD/Nstu-Central-Mosque-O8343189241/'),
(26, 'adnansami@gmail.com', 'nstu', 'The central mosque of  NSTU is located on the way to the library building and front of the MEdical Center Nstu. See more details in map: https://vymaps.com/BD/Nstu-Central-Mosque-O8343189241/'),
(27, 'adnansami@gmail.com', 'iit', 'Total 13 teachers are in IIT.See more in details: https://www.nstu.edu.bd/IIT.html'),
(28, 'adnansami@gmail.com', 'hello', 'Hello, thanks for asking, How are you'),
(29, 'adnansami@gmail.com', 'nstue', 'This chatbot contains NSTU based information queries,please try do to valid question,Thank you'),
(30, 'adnansami@gmail.com', 'nstu', 'The central mosque of  NSTU is located on the way to the library building and front of the MEdical Center Nstu. See more details in map: https://vymaps.com/BD/Nstu-Central-Mosque-O8343189241/'),
(31, 'adnansami@gmail.com', 'mosque', 'The central mosque of  NSTU is located on the way to the library building and front of the MEdical Center Nstu. See more details in map: https://vymaps.com/BD/Nstu-Central-Mosque-O8343189241/'),
(32, 'adnansami@gmail.com', 'hi', 'Hello, thanks for asking, How are you'),
(33, 'adnansami@gmail.com', 'bye', 'Bye! Come back again soon.'),
(34, 'adnansami@gmail.com', 'greetings', 'This chatbot contains NSTU based information queries,please try do to valid question,Thank you'),
(35, 'adnansami@gmail.com', 'hello', 'Hello, thanks for asking, How are you'),
(36, 'adnansami@gmail.com', 'Hi', 'Hello, thanks for asking, How are you'),
(37, 'adnansami@gmail.com', 'Hello', 'Hi there, how can I help?'),
(38, 'adnansami@gmail.com', 'hi', 'Hi there, how can I help?'),
(39, 'adnansami@gmail.com', 'hi', 'Hello, thanks for asking, How are you'),
(40, 'adnansami@gmail.com', 'hello', 'Hi there, how can I help?'),
(41, 'adnansami@gmail.com', 'nstu', 'The central mosque of  NSTU is located on the way to the library building and front of the MEdical Center Nstu. See more details in map: https://vymaps.com/BD/Nstu-Central-Mosque-O8343189241/'),
(42, 'adnansami@gmail.com', 'hi', 'Hello, thanks for asking, How are you'),
(43, 'adnansami@gmail.com', 'nstue', 'This chatbot contains NSTU based information queries,please try do to valid question,Thank you'),
(44, 'adnansami@gmail.com', 'nstu', 'The central mosque of  NSTU is located on the way to the library building and front of the MEdical Center Nstu. See more details in map: https://vymaps.com/BD/Nstu-Central-Mosque-O8343189241/'),
(45, 'adnansami@gmail.com', 'nstue', 'This chatbot contains NSTU based information queries,please try do to valid question,Thank you'),
(46, 'adnansami@gmail.com', 'nstu', 'The central mosque of  NSTU is located on the way to the library building and front of the MEdical Center Nstu. See more details in map: https://vymaps.com/BD/Nstu-Central-Mosque-O8343189241/'),
(47, 'adnansami@gmail.com', 'hi', 'Hello, thanks for asking, How are you'),
(48, 'adnansami@gmail.com', 'Hello', 'Hello, thanks for asking, How are you'),
(49, 'adnansami@gmail.com', 'Hi', 'Hello, thanks for asking, How are you'),
(50, 'adnansami@gmail.com', 'Hello', 'Hello, thanks for asking, How are you'),
(51, 'adnansami@gmail.com', 'nstu', 'The central mosque of  NSTU is located on the way to the library building and front of the MEdical Center Nstu. See more details in map: https://vymaps.com/BD/Nstu-Central-Mosque-O8343189241/'),
(52, 'adnansami@gmail.com', 'Hi', 'Hi there, how can I help?'),
(53, 'adnansami@gmail.com', 'sntu', 'This chatbot contains NSTU based information queries,please try do to valid question,Thank you'),
(54, 'adnansami@gmail.com', 'Hi', 'Hello, thanks for asking, How are you'),
(55, 'adnansami@gmail.com', 'hello', 'Hello, thanks for asking, How are you'),
(56, 'adnansami@gmail.com', 'Hi', 'Hi there, how can I help?'),
(57, 'adnansami@gmail.com', 'Hello', 'Hi there, how can I help?'),
(58, 'adnansami@gmail.com', 'Hello', 'Hello, thanks for asking, How are you'),
(59, 'adnansami@gmail.com', 'Hi', 'Hi there, how can I help?'),
(60, 'adnansami@gmail.com', 'Hi', 'Hi there, how can I help?'),
(61, 'adnansami@gmail.com', 'Hi', 'Hello, thanks for asking, How are you'),
(62, 'adnansami@gmail.com', 'Hi', 'Hi there, how can I help?'),
(63, 'adnansami@gmail.com', 'Hi', 'Hi there, how can I help?'),
(64, 'adnansami@gmail.com', 'Hello', 'Hi there, how can I help?'),
(65, 'adnansami@gmail.com', 'Hello', 'Hello, thanks for asking, How are you'),
(66, 'adnansami@gmail.com', 'hi', 'Hi there, how can I help?'),
(67, 'adnansami@gmail.com', 'Hello', 'Hello, thanks for asking, How are you'),
(68, 'adnansami@gmail.com', 'Hi', 'Hi there, how can I help?'),
(69, 'adnansami@gmail.com', 'Hello', 'Hello, thanks for asking, How are you'),
(70, 'adnansami@gmail.com', 'Hi', 'Hello, thanks for asking, How are you'),
(71, 'adnansami@gmail.com', 'Hello', 'Hello, thanks for asking, How are you'),
(72, 'adnansami@gmail.com', 'Hello', 'Hi there, how can I help?'),
(73, 'adnansami@gmail.com', 'iit', 'Total 13 teachers are in IIT.See more in details: https://www.nstu.edu.bd/IIT.html'),
(74, 'adnansami@gmail.com', 'ifti', 'This chatbot contains NSTU based information queries,please try do to valid question,Thank you'),
(75, 'adnansami@gmail.com', 'nstu', 'The central mosque of  NSTU is located on the way to the library building and front of the MEdical Center Nstu. See more details in map: https://vymaps.com/BD/Nstu-Central-Mosque-O8343189241/'),
(76, 'adnansami@gmail.com', 'ল্যাব সুবিধা', 'বিএমএস ডিপার্টেমেন্টে কোনো নির্দিষ্ট ল্যাব নেই।'),
(77, 'adnansami@gmail.com', 'বিএমএস ', 'বিএমএস এর পূর্ণরূপ হচ্ছে বাংলাদেশ এন্ড মুক্তিযুদ্ধ স্টাডিজ।'),
(78, 'adnansami@gmail.com', 'hi', 'Hello, thanks for asking, How are you'),
(79, 'adnansami@gmail.com', 'ল্যাব সুবিধা', 'বিএমএস ডিপার্টেমেন্টে কোনো নির্দিষ্ট ল্যাব নেই।'),
(80, 'adnansami@gmail.com', 'Hi', 'Hello, thanks for asking, How are you'),
(81, 'adnansami@gmail.com', 'Hello', 'Hello, thanks for asking, How are you'),
(82, 'adnansami@gmail.com', 'Hi', 'Hello, thanks for asking, How are you'),
(83, 'adnansami@gmail.com', 'িপার্ট্মেন্ট অব বিজনেস এডমিনিস্ট্রেশন', 'This chatbot contains NSTU based information queries,please try do to valid question,Thank you'),
(84, 'adnansami@gmail.com', 'বিজনেস এডমিনিস্ট্রেশন', 'This chatbot contains NSTU based information queries,please try do to valid question,Thank you'),
(85, 'adnansami@gmail.com', 'এডমিনিস্ট্রেশন', 'This chatbot contains NSTU based information queries,please try do to valid question,Thank you'),
(86, 'adnansami@gmail.com', 'পূর্ণরূপ কি', 'বিএমএস এর পূর্ণরূপ হচ্ছে বাংলাদেশ এন্ড মুক্তিযুদ্ধ স্টাডিজ।'),
(87, 'adnansami@gmail.com', 'পূর্ণরূপ কি', 'বিএমএস এর পূর্ণরূপ হচ্ছে বাংলাদেশ এন্ড মুক্তিযুদ্ধ স্টাডিজ।'),
(88, 'adnansami@gmail.com', 'পূর্ণরূপ কিপূর্ণরূপ কি', 'বিএমএস এর পূর্ণরূপ হচ্ছে বাংলাদেশ এন্ড মুক্তিযুদ্ধ স্টাডিজ।'),
(89, 'adnansami@gmail.com', 'পূর্ণরূপ কি', 'বিএমএস এর পূর্ণরূপ হচ্ছে বাংলাদেশ এন্ড মুক্তিযুদ্ধ স্টাডিজ।'),
(90, 'adnansami@gmail.com', 'পূর্ণরূ', 'This chatbot contains NSTU based information queries,please try do to valid question,Thank you'),
(91, 'adnansami@gmail.com', 'পূর্ণরূপ কি', 'বিএমএস এর পূর্ণরূপ হচ্ছে বাংলাদেশ এন্ড মুক্তিযুদ্ধ স্টাডিজ।'),
(92, 'adnansami@gmail.com', 'বাংলাদেশ ', 'This chatbot contains NSTU based information queries,please try do to valid question,Thank you'),
(93, 'adnansami@gmail.com', 'এমআইএস', 'এমআইএস এর পূর্ণরূপ হচ্ছে ম্যানেজমেন্ট ইনফরমেশন সিস্টেমস।'),
(94, 'adnansami@gmail.com', 'Hello', 'Hello, thanks for asking, How are you'),
(95, 'adnansami@gmail.com', 'how are you?', 'Hi there, how can I help?'),
(96, 'adnansami@gmail.com', 'বাই', 'আবারো দেখা হবে,ভালো থাকবেন।'),
(97, 'adnansami@gmail.com', 'Hello', 'Hello, thanks for asking, How are you'),
(98, 'adnansami@gmail.com', 'what about you?', 'Hello, thanks for asking, How are you'),
(99, 'adnansami@gmail.com', 'Hello', 'Hi there, how can I help?'),
(100, 'adnansami@gmail.com', 'Hello', 'Hello, thanks for asking, How are you'),
(101, 'adnansami@gmail.com', 'How are you', 'Hi there, how can I help?'),
(102, 'adnansami@gmail.com', 'Hello', 'Hello, thanks for asking, How are you'),
(103, 'adnansami@gmail.com', 'How are you', 'Hello, thanks for asking, How are you'),
(104, 'adnansami@gmail.com', 'Hello', 'Hello, thanks for asking, How are you'),
(105, 'adnansami@gmail.com', 'Hello', 'Hello, thanks for asking, How are you'),
(106, 'adnansami@gmail.com', 'Hello', 'Hi there, how can I help?'),
(107, 'adnansami@gmail.com', 'Hello', 'Hello, thanks for asking, How are you'),
(108, 'adnansami@gmail.com', 'How are You', 'Hello, thanks for asking, How are you'),
(109, 'adnansami@gmail.com', 'Hello', 'Hi there, how can I help?'),
(110, 'adnansami@gmail.com', 'How are you?', 'Hello, thanks for asking, How are you'),
(111, 'adnansami@gmail.com', 'How are you?', 'Hello, thanks for asking, How are you'),
(112, 'adnansami@gmail.com', 'How are you?', 'Hello, thanks for asking, How are you'),
(113, 'adnansami@gmail.com', 'How are You?', 'Hello, thanks for asking, How are you'),
(114, 'adnansami@gmail.com', 'বাই', 'আবারো দেখা হবে,ভালো থাকবেন।'),
(115, 'adnansami@gmail.com', 'Hello', 'Hi there, how can I help?'),
(116, 'adnansami@gmail.com', 'How are you', 'Hello, thanks for asking, How are you'),
(117, 'adnansami@gmail.com', 'thanks', 'My pleasure'),
(118, 'adnansami@gmail.com', 'বাই', 'আবারো দেখা হবে,ভালো থাকবেন।'),
(119, 'adnansami@gmail.com', 'এসিসিই ফুলফর্', 'এসিসিই এর পূর্ণরূপ হচ্ছে এপ্লাইড কেমিস্ট্রি এন্ড কেমিক্যাল ইঞ্জিনিয়ারিং।');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fname`, `lname`, `email`, `pwd`) VALUES
(1, 'Al', 'Adnan', 'adnansami@gmail.com', '12345'),
(2, 'Adnan', 'Sami', 'adnansami@gmail.com', '12345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feed_back`
--
ALTER TABLE `feed_back`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `new_query_data`
--
ALTER TABLE `new_query_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `queries`
--
ALTER TABLE `queries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `feed_back`
--
ALTER TABLE `feed_back`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `new_query_data`
--
ALTER TABLE `new_query_data`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `queries`
--
ALTER TABLE `queries`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
