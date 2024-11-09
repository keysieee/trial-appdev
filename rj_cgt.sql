-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2024 at 05:00 AM
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
-- Database: `rj_cgt`
--

-- --------------------------------------------------------

--
-- Table structure for table `discount_promotions`
--

CREATE TABLE `discount_promotions` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `discount` decimal(5,2) DEFAULT NULL,
  `price_after_discount` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_refunds`
--

CREATE TABLE `return_refunds` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `reason` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(50) DEFAULT NULL,
  `task_description` text NOT NULL,
  `task_date` date NOT NULL,
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `employee_id`, `task_description`, `task_date`, `remarks`) VALUES
(1, NULL, 'hshs', '0000-00-00', '04/29/2024');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_no` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('employee','admin') NOT NULL DEFAULT 'employee',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_no`, `name`, `password`, `role`, `createdAt`, `updatedAt`) VALUES
('1234', 'lea', '$2a$10$9WGFEmiZVVHcaUlb7omE4OwLpURPoZgsUKief8mq7LwMG2zKTtjXy', 'employee', '2024-11-08 15:26:32', '2024-11-08 15:26:32'),
('2893', 'Alvin Villaverde', '$2a$10$zzhVz2lcal9G6ehuTDVz1.2LSV358m1vzdeZMjrZfR9EFoNvBkxGu', 'employee', '2024-11-09 02:19:47', '2024-11-09 02:19:47'),
('456', 'las', '$2a$10$prPJuEEiEZOS4KhjHdlvU.c54yYaClmORD2VW8RTLEOagmEllUsJy', 'employee', '2024-10-28 23:17:17', '2024-10-28 23:17:17'),
('567', 'SOYII', '$2a$10$7zxsEYFLzWJEJvih9fx64u8rpvWfoDJFSAqmk0I4KQ3t2DeJ.79gm', 'employee', '2024-10-30 06:44:28', '2024-10-30 06:44:28'),
('789', 'rey', '$2a$10$N1pEr/jm3BFrNV4Nv4Dnbe/2VCIf6rOZBKcYGN0kf6zT8kFEXYqbC', 'admin', '2024-10-29 06:03:35', '2024-10-29 06:20:34'),
('ED123', 'Alvin Villaverde', '$2a$10$7ftiWhtz5nvwWNf496JDg.JvYg6ZlDvwad9etSkJoX7lzFmjz0ztq', 'employee', '2024-10-30 00:37:37', '2024-10-30 00:37:37'),
('HI111', 'Abby', '$2a$10$XUlcOs96uKwCiVb9RYyyJuEJhbmITz1K8Z1ujvgpgQu6HF5c..C76', 'employee', '2024-10-30 03:58:14', '2024-10-30 03:58:14'),
('KC123', 'keysie', '$2a$10$5ArwuBJAr6m45d5Ul4WO5u/PBhFzuA23Gqqqb/sqe3614eZPKio/W', 'employee', '2024-10-30 06:36:12', '2024-10-30 06:36:12'),
('SE204', 'FORCIA LHYAM C. DE GUZMAN', '$2a$10$S2HKKrNU41dpkz7i6wx2meKNbfTLxOSnrieL.gBLrb73WGW7G1JfW', 'employee', '2024-10-29 08:25:03', '2024-10-29 08:25:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `discount_promotions`
--
ALTER TABLE `discount_promotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_refunds`
--
ALTER TABLE `return_refunds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `discount_promotions`
--
ALTER TABLE `discount_promotions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_refunds`
--
ALTER TABLE `return_refunds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `users` (`id_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
