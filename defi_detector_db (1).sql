-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2022 at 02:31 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `defi_detector_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `level` tinyint(4) DEFAULT NULL,
  `kind` tinyint(4) DEFAULT NULL COMMENT '1. token',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `image`, `link`, `level`, `kind`, `created_at`, `updated_at`) VALUES
(16, '16649918581664915623smartcash.gif', 'gfgtre', 2, NULL, '2022-10-05 08:44:18', '2022-10-05 08:44:18'),
(17, '16649918691664917042wealth_small.gif', 'fgdsgdsf', 3, NULL, '2022-10-05 08:44:29', '2022-10-05 08:44:29'),
(13, '16649918151664915639wealth_big.gif', 'abcdddd', 1, NULL, '2022-10-05 08:43:35', '2022-10-05 08:43:35'),
(15, '16649918461664915650bnbminer15.gif', 'dasfdsf', 1, NULL, '2022-10-05 08:44:06', '2022-10-05 08:44:06');

-- --------------------------------------------------------

--
-- Table structure for table `dapps`
--

CREATE TABLE `dapps` (
  `id` int(11) NOT NULL,
  `mining_group` varchar(100) NOT NULL,
  `mining_group_url` varchar(255) NOT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `audit` varchar(255) DEFAULT NULL,
  `contract` varchar(255) DEFAULT NULL,
  `kyc` varchar(255) DEFAULT NULL,
  `coin_token` varchar(50) DEFAULT NULL,
  `fees` varchar(50) DEFAULT NULL,
  `ages` varchar(50) DEFAULT NULL,
  `daily` varchar(50) DEFAULT NULL,
  `tvl` varchar(50) DEFAULT NULL,
  `tvl_24h` varchar(50) DEFAULT NULL,
  `show_flag` tinyint(4) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `tg_group` varchar(255) DEFAULT NULL,
  `discode_link` varchar(255) DEFAULT NULL,
  `poocoin_link` varchar(255) DEFAULT NULL,
  `twitter_link` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dapps`
--

INSERT INTO `dapps` (`id`, `mining_group`, `mining_group_url`, `logo_url`, `audit`, `contract`, `kyc`, `coin_token`, `fees`, `ages`, `daily`, `tvl`, `tvl_24h`, `show_flag`, `level`, `created_at`, `updated_at`, `tg_group`, `discode_link`, `poocoin_link`, `twitter_link`) VALUES
(19, 'DEMountain Matic', 'https://demountain.finance/', NULL, NULL, 'https://polygonscan.com/address/0x668c82f9d909fb069e03c15c890f861e6c4b275f', NULL, 'MATIC', NULL, NULL, NULL, '$', NULL, 1, 1, '2022-11-08 09:25:03', '2022-11-08 09:25:03', NULL, NULL, NULL, NULL),
(18, 'USDT Minter', 'https://usdminter.com/?ref=0x304c0825619881b455a4187b690B1733C4E5573E', NULL, NULL, 'https://polygonscan.com/address/0x36958313F23E641D3682953239E7166652Df5e39', NULL, 'USDT', NULL, NULL, NULL, '$', NULL, 1, 1, '2022-11-08 06:34:37', '2022-11-08 06:34:37', NULL, NULL, NULL, NULL),
(6, 'WCMiner BUSD', 'https://busd.wcminer.com/', 'dsf', 'https://georgestamp.xyz/2022/09/wc-miner-busd/', 'https://bscscan.com/address/0xbcae54cdf6a1b1c60ec3d44114b452179a96c1e3', 'dfasf', 'BUSD', '10%/10%', '2022-10-06', '8.5%', '$', NULL, 1, 1, '2022-10-11 12:10:47', '2022-10-11 03:10:47', 'https://t.me/WCMinerBUSD', NULL, NULL, 'https://twitter.com/WolfOfCrypto885'),
(17, 'Automate USDT', 'https://automatedusdt.capital/?ref=0xc08EC15fC1cA37Ca34b13951cA1fA6d67bd71af4', 'A', NULL, 'https://www.bscscan.com/address/0x8A317B5f8A8eEfc48D11577310A59c77E9D40a20', 'a', 'USDT', NULL, '2022-11-10', NULL, '$', NULL, 1, 1, '2022-11-09 07:55:46', '2022-11-08 22:55:46', NULL, NULL, NULL, NULL),
(20, 'AVAX KINGDOM', 'https://avaxkingdom.xyz/?utm_source=Trust_iOS_Browser?p=0xc08EC15fC1cA37Ca34b13951cA1fA6d67bd71af4', NULL, NULL, 'https://snowtrace.io/address/0xd02A4228b2C85275FcC1359da4E95E309A995A90', NULL, 'AVAX', NULL, NULL, NULL, '$', NULL, 1, 1, '2022-11-08 09:43:38', '2022-11-08 09:43:38', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `influencers`
--

CREATE TABLE `influencers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `telegram` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `influencers`
--

INSERT INTO `influencers` (`id`, `name`, `url`, `logo_url`, `youtube`, `telegram`, `twitter`, `created_at`, `updated_at`) VALUES
(1, 'John', 'https://john.com', NULL, NULL, 'https://t.me/johnson', 'https://twitter.com/abcd', '2022-10-05 04:08:42', '2022-10-05 04:08:42'),
(2, 'asdf', 'asdf', 'asdfsadf', NULL, 'dsf', 'sdf', '2022-10-10 07:56:10', '2022-10-10 07:56:10'),
(3, 'sfefs', 'sefs', NULL, NULL, 'telegram', 'twitter', '2022-10-11 16:06:40', '2022-10-11 16:06:40'),
(4, '123', '123', '123', NULL, '123', '123', '2022-10-11 16:11:42', '2022-10-11 16:11:42'),
(5, '456', '456', '456', 'youtube456', '456', '456', '2022-10-11 16:19:04', '2022-10-11 16:19:04');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `telegram` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `name`, `url`, `website`, `logo_url`, `telegram`, `twitter`, `created_at`, `updated_at`) VALUES
(1, 'George stamp', 'https://george.xyz/', NULL, NULL, 'https://t.me/georgestamp', 'https://twitter.com', '2022-10-05 04:07:38', '2022-10-05 04:07:38'),
(2, 'dfasf', 's', 'f', 'fs', 'df', 'df', '2022-10-10 08:05:52', '2022-10-10 08:05:52');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `coin` text DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `chain` varchar(30) DEFAULT NULL,
  `market_cap` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `change_24h` varchar(50) DEFAULT NULL,
  `show_flag` tinyint(4) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `audit` varchar(255) DEFAULT NULL,
  `contract` text DEFAULT NULL,
  `kyc` varchar(255) DEFAULT NULL,
  `chart` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `presale_buy` varchar(255) DEFAULT NULL,
  `telegram` varchar(255) DEFAULT NULL,
  `discord` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `launch` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `coin`, `name`, `chain`, `market_cap`, `price`, `change_24h`, `show_flag`, `level`, `created_at`, `updated_at`, `audit`, `contract`, `kyc`, `chart`, `website`, `presale_buy`, `telegram`, `discord`, `twitter`, `launch`) VALUES
(11, 'c', 'c', 'POLYGON', NULL, '3', NULL, 1, 3, '2022-10-10 06:32:22', '2022-10-10 06:32:22', NULL, 'c', 'c', NULL, 'c', NULL, NULL, NULL, NULL, NULL),
(9, 'a', 'a', 'BSC', NULL, '1', NULL, 1, 1, '2022-10-10 06:31:57', '2022-10-10 06:31:57', NULL, 'a', NULL, NULL, 'a', NULL, NULL, NULL, NULL, NULL),
(10, 'b', 'b', 'BSC', NULL, '3', NULL, 1, 2, '2022-10-10 06:32:11', '2022-10-10 06:32:11', NULL, 'b', NULL, NULL, 'b', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '', NULL, '0cc175b9c0f1b6a831c399e269772661', '$2y$10$MOH2juOlGZHP.bVTjzvUZuKcPDCLz2J81f.I.lejaSgTlKIigaw3y', NULL, '2022-11-07 22:48:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dapps`
--
ALTER TABLE `dapps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `influencers`
--
ALTER TABLE `influencers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `dapps`
--
ALTER TABLE `dapps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `influencers`
--
ALTER TABLE `influencers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
