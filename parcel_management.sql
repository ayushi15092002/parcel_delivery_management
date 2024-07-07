-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2024 at 01:17 PM
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
-- Database: `parcel_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `parcels`
--

CREATE TABLE `parcels` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sender_name` varchar(100) NOT NULL,
  `recipient_name` varchar(100) NOT NULL,
  `status` enum('pending','in_transit','delivered') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `parcel_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parcels`
--

INSERT INTO `parcels` (`id`, `user_id`, `sender_name`, `recipient_name`, `status`, `created_at`, `updated_at`, `parcel_name`) VALUES
(1, 7, 'ayushi', 'archi', 'delivered', '2024-07-05 16:51:45', '2024-07-06 06:59:01', ''),
(2, 7, 'archi', 'ayushi', 'in_transit', '2024-07-05 16:53:07', '2024-07-06 07:33:19', ''),
(3, 7, 'dbsha', 'fjeif', 'in_transit', '2024-07-05 17:14:51', '2024-07-06 04:13:51', 'fnfb'),
(4, 7, 'dbsha', 'fjeif', 'delivered', '2024-07-05 17:30:22', '2024-07-06 04:13:56', 'fnfb'),
(5, 7, 'dbsha', 'fjeif', 'in_transit', '2024-07-05 17:31:10', '2024-07-06 03:42:40', 'fnfb'),
(6, 7, 'bn', 'dbf', 'delivered', '2024-07-05 17:33:54', '2024-07-06 04:02:03', 'ffb'),
(7, 7, 'jdeu', 'nccc', 'pending', '2024-07-05 18:04:20', '2024-07-05 18:04:20', 'gnjgq'),
(8, 7, 'djwnu', 'cnnc', 'delivered', '2024-07-05 18:09:12', '2024-07-06 04:05:18', 'njnj'),
(9, 7, 'djwnu', 'cnnc', 'in_transit', '2024-07-05 18:09:20', '2024-07-06 04:00:28', 'njnj'),
(10, 7, 'ashu', 'aditi', 'in_transit', '2024-07-05 18:20:10', '2024-07-06 07:32:17', 'frog'),
(11, 7, 'ashu', 'aditi', 'in_transit', '2024-07-05 18:28:26', '2024-07-06 04:02:39', 'fish'),
(12, 7, 'djfu', 'fje', 'pending', '2024-07-05 18:29:21', '2024-07-05 18:29:21', 'tree'),
(13, 7, 'djfu', 'fje', 'pending', '2024-07-05 18:29:38', '2024-07-05 18:29:38', 'trees'),
(14, 7, 'fwf', 'dfshfb', 'pending', '2024-07-05 18:29:51', '2024-07-05 18:29:51', 'lafq'),
(15, 7, 'dwd', 'dbhwb', 'in_transit', '2024-07-06 03:21:54', '2024-07-06 04:37:47', 'bh'),
(16, 7, 'aditi', 'ashu', 'in_transit', '2024-07-06 04:37:43', '2024-07-06 04:38:29', 'dog'),
(17, 7, 'jwuf', 'fewf', 'pending', '2024-07-06 05:04:05', '2024-07-06 05:04:05', 'fsnjsq'),
(18, 7, '123', '456', 'delivered', '2024-07-06 05:06:03', '2024-07-06 05:06:16', 'mobile'),
(19, 7, 'mehak', 'harsh', 'pending', '2024-07-06 05:15:33', '2024-07-06 05:15:33', 'lapop'),
(20, 7, 'mehak', 'harsh', 'pending', '2024-07-06 05:15:34', '2024-07-06 05:15:34', 'lapop'),
(21, 7, 'ayushi', 'archi', 'pending', '2024-07-06 07:02:18', '2024-07-06 07:02:18', 'table'),
(22, 7, ' f djv fj fjvafdjv', 'dwefknewknkv', 'pending', '2024-07-06 07:32:45', '2024-07-06 07:32:45', 'fnfje'),
(23, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:02:47', '2024-07-06 08:02:47', 'Package A'),
(24, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:02:47', '2024-07-06 08:02:47', 'Package B'),
(25, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:02:47', '2024-07-06 08:02:47', 'Package C'),
(26, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:02:47', '2024-07-06 08:02:47', 'Package D'),
(27, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package A'),
(28, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package B'),
(29, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package C'),
(30, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package D'),
(31, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package A'),
(32, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package B'),
(33, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package C'),
(34, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package D'),
(35, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package A'),
(36, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package B'),
(37, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package C'),
(38, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package D'),
(39, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package A'),
(40, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package B'),
(41, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package C'),
(42, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package D'),
(43, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package A'),
(44, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package B'),
(45, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package C'),
(46, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package D'),
(47, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package A'),
(48, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package B'),
(49, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package C'),
(50, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package D'),
(51, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package A'),
(52, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package B'),
(53, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package C'),
(54, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package D'),
(55, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package A'),
(56, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package B'),
(57, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package C'),
(58, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package D'),
(59, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package A'),
(60, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package B'),
(61, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package C'),
(62, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package D'),
(63, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package A'),
(64, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package B'),
(65, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package C'),
(66, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package D'),
(67, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package A'),
(68, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package B'),
(69, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package C'),
(70, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package D'),
(71, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package A'),
(72, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package B'),
(73, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package C'),
(74, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package D'),
(75, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:07', '2024-07-06 08:04:07', 'Package A'),
(76, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:08', '2024-07-06 08:04:08', 'Package B'),
(77, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:08', '2024-07-06 08:04:08', 'Package C'),
(78, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:08', '2024-07-06 08:04:08', 'Package D'),
(79, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:08', '2024-07-06 08:04:08', 'Package A'),
(80, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:08', '2024-07-06 08:04:08', 'Package B'),
(81, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:08', '2024-07-06 08:04:08', 'Package C'),
(82, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:08', '2024-07-06 08:04:08', 'Package D'),
(83, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:08', '2024-07-06 08:04:08', 'Package A'),
(84, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:08', '2024-07-06 08:04:08', 'Package B'),
(85, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:08', '2024-07-06 08:04:08', 'Package C'),
(86, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:08', '2024-07-06 08:04:08', 'Package D'),
(87, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:08', '2024-07-06 08:04:08', 'Package A'),
(88, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:08', '2024-07-06 08:04:08', 'Package B'),
(89, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:08', '2024-07-06 08:04:08', 'Package C'),
(90, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:04:08', '2024-07-06 08:04:08', 'Package D'),
(91, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package A'),
(92, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package B'),
(93, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package C'),
(94, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package D'),
(95, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package A'),
(96, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package B'),
(97, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package C'),
(98, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package D'),
(99, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package A'),
(100, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package B'),
(101, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package C'),
(102, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package D'),
(103, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package A'),
(104, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package B'),
(105, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package C'),
(106, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package D'),
(107, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package A'),
(108, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package B'),
(109, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package C'),
(110, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package D'),
(111, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package A'),
(112, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package B'),
(113, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package C'),
(114, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package D'),
(115, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package A'),
(116, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package B'),
(117, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package C'),
(118, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package D'),
(119, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package A'),
(120, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package B'),
(121, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package C'),
(122, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package D'),
(123, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package A'),
(124, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package B'),
(125, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package C'),
(126, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package D'),
(127, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package A'),
(128, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package B'),
(129, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package C'),
(130, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package D'),
(131, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package A'),
(132, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package B'),
(133, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package C'),
(134, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package D'),
(135, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package A'),
(136, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package B'),
(137, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package C'),
(138, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package D'),
(139, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package A'),
(140, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package B'),
(141, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package C'),
(142, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package D'),
(143, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package A'),
(144, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package B'),
(145, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package C'),
(146, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package D'),
(147, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package A'),
(148, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package B'),
(149, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package C'),
(150, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package D'),
(151, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package A'),
(152, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package B'),
(153, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package C'),
(154, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:23:52', '2024-07-06 08:23:52', 'Package D'),
(155, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package A'),
(156, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package B'),
(157, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package C'),
(158, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package D'),
(159, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package A'),
(160, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package B'),
(161, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package C'),
(162, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package D'),
(163, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package A'),
(164, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package B'),
(165, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package C'),
(166, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package D'),
(167, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package A'),
(168, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package B'),
(169, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package C'),
(170, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package D'),
(171, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package A'),
(172, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package B'),
(173, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package C'),
(174, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package D'),
(175, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package A'),
(176, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package B'),
(177, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package C'),
(178, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package D'),
(179, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package A'),
(180, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package B'),
(181, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package C'),
(182, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package D'),
(183, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package A'),
(184, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package B'),
(185, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package C'),
(186, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package D'),
(187, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package A'),
(188, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package B'),
(189, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package C'),
(190, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package D'),
(191, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package A'),
(192, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package B'),
(193, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package C'),
(194, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package D'),
(195, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package A'),
(196, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package B'),
(197, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package C'),
(198, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package D'),
(199, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package A'),
(200, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package B'),
(201, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package C'),
(202, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package D'),
(203, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package A'),
(204, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package B'),
(205, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package C'),
(206, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package D'),
(207, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package A'),
(208, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package B'),
(209, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package C'),
(210, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package D'),
(211, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package A'),
(212, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package B'),
(213, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package C'),
(214, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package D'),
(215, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package A'),
(216, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package B'),
(217, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package C'),
(218, 7, 'John Doe', 'Jane Smith', 'pending', '2024-07-06 08:26:34', '2024-07-06 08:26:34', 'Package D');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_logs`
--

CREATE TABLE `transaction_logs` (
  `id` int(11) NOT NULL,
  `parcel_id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_logs`
--

INSERT INTO `transaction_logs` (`id`, `parcel_id`, `action`, `created_at`) VALUES
(1, 1, 'Added parcel from ayushi to archi', '2024-07-05 16:51:45'),
(2, 2, 'Added parcel from archi to ayushi', '2024-07-05 16:53:07'),
(3, 3, 'Added parcel from dbsha to fjeif', '2024-07-05 17:14:51'),
(4, 4, 'Added parcel from dbsha to fjeif', '2024-07-05 17:30:22'),
(5, 5, 'Added parcel from dbsha to fjeif', '2024-07-05 17:31:10'),
(6, 6, 'Added parcel from bn to dbf', '2024-07-05 17:33:54'),
(7, 7, 'Added parcel from jdeu to nccc', '2024-07-05 18:04:20'),
(8, 8, 'Added parcel from djwnu to cnnc', '2024-07-05 18:09:12'),
(9, 9, 'Added parcel from djwnu to cnnc', '2024-07-05 18:09:20'),
(10, 10, 'Added parcel from ashu to aditi', '2024-07-05 18:20:10'),
(11, 11, 'Added parcel from ashu to aditi', '2024-07-05 18:28:26'),
(12, 12, 'Added parcel from djfu to fje', '2024-07-05 18:29:21'),
(13, 13, 'Added parcel from djfu to fje', '2024-07-05 18:29:38'),
(14, 14, 'Added parcel from fwf to dfshfb', '2024-07-05 18:29:51'),
(15, 10, 'Updated status to shipped', '2024-07-06 03:21:40'),
(16, 15, 'Added parcel from dwd to dbhwb', '2024-07-06 03:21:54'),
(17, 1, 'Updated status to in_transit', '2024-07-06 03:39:22'),
(18, 4, 'Updated status to delivered', '2024-07-06 03:41:35'),
(19, 5, 'Updated status to in_transit', '2024-07-06 03:42:40'),
(20, 9, 'Updated status to in_transit', '2024-07-06 04:00:28'),
(21, 6, 'Updated status to delivered', '2024-07-06 04:02:03'),
(22, 11, 'Updated status to in_transit', '2024-07-06 04:02:39'),
(23, 4, 'Updated status to in_transit', '2024-07-06 04:05:03'),
(24, 4, 'Updated status to pending', '2024-07-06 04:05:10'),
(25, 8, 'Updated status to delivered', '2024-07-06 04:05:18'),
(26, 3, 'Updated status to in_transit', '2024-07-06 04:13:51'),
(27, 4, 'Updated status to delivered', '2024-07-06 04:13:56'),
(28, 16, 'Added parcel from aditi to ashu', '2024-07-06 04:37:43'),
(29, 15, 'Updated status to in_transit', '2024-07-06 04:37:47'),
(30, 16, 'Updated status to in_transit', '2024-07-06 04:38:29'),
(31, 17, 'Added parcel from jwuf to fewf', '2024-07-06 05:04:05'),
(32, 18, 'Added parcel from 123 to 456', '2024-07-06 05:06:03'),
(33, 18, 'Updated status to in_transit', '2024-07-06 05:06:09'),
(34, 18, 'Updated status to delivered', '2024-07-06 05:06:16'),
(35, 19, 'Added parcel from mehak to harsh', '2024-07-06 05:15:33'),
(36, 20, 'Added parcel from mehak to harsh', '2024-07-06 05:15:34'),
(37, 1, 'Updated status to delivered', '2024-07-06 06:59:01'),
(38, 21, 'Added parcel from ayushi to archi', '2024-07-06 07:02:18'),
(39, 10, 'Updated status to in_transit', '2024-07-06 07:32:17'),
(40, 22, 'Added parcel from  f djv fj fjvafdjv to dwefknewknkv', '2024-07-06 07:32:45'),
(41, 2, 'Updated status to in_transit', '2024-07-06 07:33:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(100) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password_hash`, `role`) VALUES
(4, 'ayushiagg1509@gmail.com', '$2b$12$L3xU7hhR5tHAkpvJbBZ4huzcbHdVGUTBEBF01yy9jxUMAzQ6n3qD2', 'admin'),
(7, 'ayushi@gmail.com', '$2b$12$dZaYj85yrrzgL8qL0ccq8eeHjZm1m53vZeV4eW1eEDke.NCtE4Xpe', 'admin'),
(8, 'aditi@gmail.com', '$2b$12$U35gIBT/MzqwL76mBByrYutkBZ7zefGYRaVjqcM82XjsvCRiJJDqi', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `parcels`
--
ALTER TABLE `parcels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `transaction_logs`
--
ALTER TABLE `transaction_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parcel_id` (`parcel_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `parcels`
--
ALTER TABLE `parcels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT for table `transaction_logs`
--
ALTER TABLE `transaction_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `parcels`
--
ALTER TABLE `parcels`
  ADD CONSTRAINT `parcels_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `transaction_logs`
--
ALTER TABLE `transaction_logs`
  ADD CONSTRAINT `transaction_logs_ibfk_1` FOREIGN KEY (`parcel_id`) REFERENCES `parcels` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
