-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 05, 2025 at 11:53 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car-rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  `car_type` varchar(255) NOT NULL,
  `daily_rent_price` decimal(65,2) NOT NULL,
  `availability` tinyint(1) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `name`, `brand`, `model`, `year`, `car_type`, `daily_rent_price`, `availability`, `image`, `created_at`, `updated_at`) VALUES
(25, 'Noah 456f', 'Toyota', '456f', 2000, 'Petrol', 2390.00, 1, 'images/YXU7qFLysB3rD36v5WUaaRE42Vb4qZQpbXGBGBwp.jpg', '2025-03-03 00:20:29', '2025-03-03 00:20:29'),
(26, 'Nissan 765f', 'Nissan', '35uf', 2006, 'Gassolin', 2000.00, 1, 'images/Ils0L8zRCXqwFmFxKtk3o5wnvY5LlRRyiVrUNN9g.jpg', '2025-03-03 00:22:13', '2025-03-03 00:22:13'),
(27, 'Voxy 6er', 'Voxy', '6er', 2012, 'Electric', 4000.00, 1, 'images/xnEPn75SRfABtNjJ9VeexZDR5Ix8clm9nHRsPifQ.jpg', '2025-03-03 00:23:47', '2025-03-03 00:23:47'),
(28, 'Monera 553r', 'Monera', '553r', 2012, 'Hybrid', 5000.00, 0, 'images/DJWCTQ5NRT3sZnb19OPh0eJjkD4ncv1EM22qbwFH.jpg', '2025-03-03 00:25:59', '2025-03-08 00:18:30'),
(29, 'Toyota 63tr', 'Toyota', '63tr', 2013, 'Petrol', 3000.00, 1, 'images/eMASiK4S89ZMzY3AbKfP9ITCrXoMSOgx7tGnxJGU.jpg', '2025-03-03 00:27:20', '2025-03-03 00:27:20'),
(30, 'ToyotaPro 63tr', 'Toyota', '63tr', 2013, 'Gasolin', 3000.00, 1, 'images/MGpIouVOZMHZRjh1fdsnP7qLfosc5m5NPuUnQhyz.jpg', '2025-03-03 00:27:57', '2025-03-03 00:27:57'),
(31, 'Zilmil 5trr', 'Zilmil', '5trr', 2013, 'Hybrid', 4000.00, 1, 'images/WNq7VMjYPxaQcreTxHjOMxaMFHAgjlhf4jN8njXX.jpg', '2025-03-03 00:29:10', '2025-03-06 09:01:26');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2025_02_16_051456_create_cars_table', 1),
(4, '2025_02_16_054504_create_rentals_table', 1),
(5, '2025_03_01_024045_add_column_to_rentals', 2),
(6, '2025_03_02_085010_add_column_to_users', 3);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rentals`
--

CREATE TABLE `rentals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `car_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `total_cost` decimal(65,2) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rentals`
--

INSERT INTO `rentals` (`id`, `user_id`, `car_id`, `start_date`, `end_date`, `total_cost`, `status`, `created_at`, `updated_at`) VALUES
(10, 1, 25, '2025-03-03', '2025-03-04', 4780.00, 'Ongoing', '2025-03-03 00:32:38', '2025-03-06 23:06:29'),
(12, 1, 27, '2025-03-07', '2025-03-08', 3.00, 'Completed', '2025-03-03 00:34:37', '2025-03-06 23:10:59'),
(14, 2, 28, '2025-03-13', '2025-03-15', 10000.00, 'Ongoing', '2025-03-03 00:38:26', '2025-03-06 22:50:51'),
(17, 2, 31, '2025-03-09', '2025-03-10', 8.00, 'Completed', '2025-03-03 00:40:50', '2025-03-03 00:40:50'),
(19, 1, 30, '2025-03-09', '2025-03-12', 12000.00, 'Pending', '2025-03-05 23:42:34', '2025-03-05 23:42:34'),
(26, 1, 27, '2025-03-10', '2025-03-12', 12000.00, 'Pending', '2025-03-09 19:12:37', '2025-03-09 19:12:37'),
(27, 1, 25, '2025-03-10', '2025-03-15', 14340.00, 'Pending', '2025-03-09 19:22:11', '2025-03-09 19:22:11'),
(28, 4, 26, '2025-03-10', '2025-03-12', 6000.00, 'Completed', '2025-03-09 19:50:29', '2025-03-09 19:51:56'),
(29, 4, 27, '2025-03-13', '2025-03-15', 12000.00, 'Pending', '2025-03-12 18:41:53', '2025-03-12 18:41:53'),
(30, 5, 31, '2025-03-13', '2025-03-15', 12000.00, 'Completed', '2025-03-12 18:45:38', '2025-03-12 18:57:12'),
(33, 5, 25, '2025-03-16', '2025-03-17', 4780.00, 'Pending', '2025-03-12 20:09:11', '2025-03-12 20:09:11'),
(34, 5, 25, '2025-03-19', '2025-03-20', 4780.00, 'Pending', '2025-03-12 20:10:09', '2025-03-12 20:10:09'),
(35, 29, 25, '2025-03-30', '2025-03-31', 4780.00, 'Completed', '2025-03-30 03:42:14', '2025-03-30 03:50:31'),
(37, 2, 25, '2025-04-01', '2025-04-04', 9560.00, 'Completed', '2025-03-30 04:26:59', '2025-03-30 04:29:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'customer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`, `updated_at`, `phone`, `address`) VALUES
(1, 'Saiful', 'saiful@gmail.com', '$2y$10$le7RmH/MIdvEQfHO1bCKrOkJLn0GFHvarkhct8NTQUUkBDEyLjJhu', 'admin', '2025-02-16 04:15:42', '2025-03-30 09:48:10', '019687384', 'Naryanganj,Rupganj'),
(2, 'Raihan', 'raihan@gmail.com', '$2y$10$wsdSOUmUs0SCT85FuwdMiuYgygazevhfoWvZHkSwjnWcjcIbMTi2u', 'customer', '2025-03-01 21:55:05', '2025-03-30 09:57:22', '0930430', 'Moulabobazar,Sylhet'),
(4, 'jibon', 'jibon@gmail.com', '$2y$12$UQ.tT0vcff3KPOy/QwSd6uwantDOvuIGctAWGHhcKSdsqKBk/wbzG', 'admin', '2025-03-09 00:07:18', '2025-03-10 01:45:25', '403034534', 'Bola'),
(5, 'asha', 'asha@gmail.com', '$2y$12$NF05VpkHmZK7cEUgV/K54OHBWFiJcKoNhOeGJpYsVDLzTThXVmK4m', 'customer', '2025-03-09 00:11:53', '2025-03-09 00:11:53', '403034534', 'Bola'),
(6, 'sifat', 'sifat@gmail.com', '$2y$12$Nux4WzdeIjnL50mEpI3zRu6qPnWZcrkGMjK/iHgagvZqj.hqxTsC6', 'customer', '2025-03-09 00:38:43', '2025-03-09 00:38:43', '76472332', 'bagdad'),
(8, 'zunu', 'zunu@gmail.com', '$2y$12$W2QvumRRuJ3y/RPft2sLIOhjX7t5rkxf.HfrdQNcUWdRirrKHV4qO', 'customer', '2025-03-09 00:39:40', '2025-03-09 00:39:40', '762t3762', 'bagda'),
(9, 'moha', 'moha@gmail.com', '$2y$12$zwvZ.hdBYaLvkcDy59XB0O8sT9E3ousAIQgEWnmo0wEBNjL5iTc7m', 'customer', '2025-03-09 00:42:21', '2025-03-09 00:42:21', '242', 'sd'),
(10, 'mila', 'mila@gmail.com', '$2y$12$yQIEaQBtpEY03SEPtHGLe.P53rK2.MVOPNKtpJ56rwIWRK.xRO2oa', 'customer', '2025-03-09 02:09:56', '2025-03-09 02:09:56', '243', 'dfs'),
(12, 'mila5', 'mila3@gmail.com', '$2y$12$KrRCyLZcmKLWDjlppqBiHOpm2dW/2HfYJNkFJMX.NVtTP3tN4ulIu', 'customer', '2025-03-09 02:11:20', '2025-03-09 02:11:20', '243', 'dfs'),
(13, 'mila53', 'mila323@gmail.com', '$2y$12$AvyztoJh7IFCDf027pqW3..ZadKBwikVrSwiN4unaDz8H4iB8NOzy', 'customer', '2025-03-09 02:11:53', '2025-03-09 02:11:53', '243', 'dfs'),
(14, 'mierla53', 'milawe323@gmail.com', '$2y$12$ABnGs4X4Q/2OXVYkU776j.S5FfGFs76YMj2jY6vL4oVHxf4SlBVuC', 'customer', '2025-03-09 02:17:17', '2025-03-09 02:17:17', '243', 'dfs'),
(15, 'suba', 'suba@gmail.com', '$2y$12$5VwDFlsH9tatYgxxP46l5eh7sx9INg2qDE0lUTyruGKJFsrtD0Iwq', 'customer', '2025-03-09 02:46:02', '2025-03-09 02:46:02', '242', 'ds'),
(16, 'd', 'd@gmail.com', '$2y$12$bJ3HLl2dDWWZ98FpyUBypuKP4M9Mmzb4wAewKDoOQnYjueefPwb3S', 'customer', '2025-03-09 02:48:54', '2025-03-09 02:48:54', '232', '2sad'),
(17, 'h', 'h@gmail.com', '$2y$12$k7DcqPJ29Enl9HJJIODc/u9v07tfnAxxKMwnhvOmvWJQyi30h5iYi', 'customer', '2025-03-09 02:51:32', '2025-03-09 02:51:32', '234123', 'ad'),
(18, 'a', 'a@gmail.com', '$2y$12$iAck/DMiXdrhQ7/Gwn6UW.MMt3FSPxG5vfQZZxWNm1E.uZcIGiJqa', 'customer', '2025-03-09 02:52:14', '2025-03-09 02:52:14', '23', 'dad'),
(19, 'a2', '2a@gmail.com', '$2y$12$3fJwLa.s/U0.bIVevIO.1eNXK1Z4.XZxRitb9R0/KYWSq8TDNITau', 'customer', '2025-03-09 02:53:26', '2025-03-09 02:53:26', '23', 'dad'),
(20, 'v', 'b@gmail.com', '$2y$12$nMxMTREIBB1PsoqcZ5SqYOwZR8rtTMmdna8rlOjWE1t2HumihQamC', 'customer', '2025-03-09 03:06:11', '2025-03-09 03:06:11', '32423', 'd'),
(21, 've', 'be@gmail.com', '$2y$12$5kWSj3aEgvtKT5WLG8Afw.pO1OWU633hQCxDNEXHDVYZ279ivj6qK', 'customer', '2025-03-09 03:09:19', '2025-03-09 03:09:19', '32423', 'd'),
(22, 'mina', 'mina@gmail', '$2y$12$qK1n3C410KDK2anTKWb4k.L.YKHGsHu8fXu8LfiPLPwmqP1d7pyJm', 'customer', '2025-03-09 03:18:35', '2025-03-09 03:18:35', '234', 'ds'),
(23, 'esha', 'esha@gmail.com', '$2y$12$crQsbu8RZxiW.8xib0gG0.tYVKyeoIBB/m2xv1b2.TyaiJhGbii/m', 'customer', '2025-03-09 03:20:13', '2025-03-09 03:20:13', '23', 'sd'),
(24, 'jina', 'jina@gmail.com', '$2y$12$bbU486dwNroHmluGFMwMDu5gc1g0BpXxxn.7fMBR01jFMHkOMLZly', 'customer', '2025-03-09 03:23:51', '2025-03-09 03:23:51', '223', 'as'),
(25, 'df', 'dfy@gmail.com', '$2y$12$UzvvEEdYcVNpFCmw9ur6e.khTMMxB6BQt4KSyo74wrBkDMUe5tx7.', 'customer', '2025-03-09 03:25:30', '2025-03-09 03:25:30', '2321', 'qeew'),
(26, 'madon', 'madon@gmail.com', '$2y$12$Oo2oK/G880Ud9XATgk2MouyOrB97eeGw9uT1RLJlzHbHIDT.Bghfu', 'customer', '2025-03-09 03:26:25', '2025-03-09 03:26:25', '2323', 'dcx'),
(27, 'billal', 'billal@gmail.com', '$2y$12$1PrTyoxhu8I6.rKCpnlymOQ9KZIpDYAQwVKwYCV4YuZ4AJW1r4alC', 'customer', '2025-03-09 03:34:32', '2025-03-09 03:34:32', '1232', 'dds'),
(29, 'minu', 'minu@gmail.com', '$2y$12$5J.Lzcd6AUKgeSgYDJwX3OQ9Rkwi8zPBjPk9aYVVdPTqK1NwqI.sS', 'customer', '2025-03-30 03:41:07', '2025-03-30 03:41:07', '039399893839', 'Tengrartek gram,300 feet road(beside purbachal petrol pump),Rupganj,Narayanganj');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `rentals`
--
ALTER TABLE `rentals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rentals_user_id_foreign` (`user_id`),
  ADD KEY `rentals_car_id_foreign` (`car_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rentals`
--
ALTER TABLE `rentals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rentals`
--
ALTER TABLE `rentals`
  ADD CONSTRAINT `rentals_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rentals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
