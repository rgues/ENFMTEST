-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 11, 2024 at 02:28 PM
-- Server version: 8.0.31
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `backend`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
CREATE TABLE IF NOT EXISTS `answers` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` enum('in_approval','approve') COLLATE utf8mb4_unicode_ci NOT NULL,
  `assignation_id` bigint UNSIGNED NOT NULL,
  `date_answer` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `answers_assignation_id_foreign` (`assignation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `name`, `description`, `state`, `assignation_id`, `date_answer`, `created_at`, `updated_at`) VALUES
(3, 'Ousman Ousman', 'Your need to provide a bank account detail. And also fills KYC form. Thank you!', 'approve', 5, '2024-02-12 17:38:28', '2024-02-12 17:38:28', '2024-02-12 18:45:51'),
(4, 'Marcelin Alima', 'Just follow instructions', 'approve', 6, '2024-02-12 21:04:55', '2024-02-12 21:04:55', '2024-02-12 21:07:20'),
(5, 'Ousman Ali', 'this all', 'approve', 7, '2024-02-13 02:38:41', '2024-02-13 02:38:41', '2024-02-13 02:41:03'),
(6, 'Marcelin Alima', 'Came to office.', 'approve', 9, '2024-02-13 17:29:02', '2024-02-13 17:29:02', '2024-02-13 17:32:49');

-- --------------------------------------------------------

--
-- Table structure for table `assignations`
--

DROP TABLE IF EXISTS `assignations`;
CREATE TABLE IF NOT EXISTS `assignations` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` enum('pending','evaluate','complete') COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_assignation` timestamp NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `request_id` bigint UNSIGNED NOT NULL,
  `sender_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assignations_user_id_foreign` (`user_id`),
  KEY `assignations_request_id_foreign` (`request_id`),
  KEY `assignations_sender_id_foreign` (`sender_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assignations`
--

INSERT INTO `assignations` (`id`, `comment`, `state`, `date_assignation`, `user_id`, `request_id`, `sender_id`, `created_at`, `updated_at`) VALUES
(5, 'Please find a response for this customer.', 'complete', '2024-02-12 17:16:00', 17, 7, 16, '2024-02-12 17:16:00', '2024-02-12 18:45:52'),
(6, 'Please help this customer.', 'complete', '2024-02-12 18:24:42', 19, 7, 16, '2024-02-12 18:24:42', '2024-02-12 21:07:20'),
(7, 'please answer this customer', 'complete', '2024-02-13 02:36:15', 17, 8, 16, '2024-02-13 02:36:15', '2024-02-13 02:41:03'),
(8, 'Give an idea to this guy.', 'pending', '2024-02-13 16:28:16', 20, 9, 16, '2024-02-13 16:28:16', '2024-02-13 16:28:16'),
(9, 'Please your coleague is not avalaible look this.', 'complete', '2024-02-13 17:26:47', 19, 9, 16, '2024-02-13 17:26:47', '2024-02-13 17:32:49');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'General', 'Dolor iusto odio earum sed. Consectetur quasi explicabo fuga doloremque eaque eius molestiae et. Sapiente possimus beatae quia fugit. Et quia quam a aut.', '2024-02-07 07:21:07', '2024-02-07 07:21:07'),
(2, 'Bugs', 'Dolorem laboriosam est ullam consequatur voluptas minima. Laudantium eos iste itaque aspernatur rerum. Aut placeat mollitia aliquid vero aut.', '2024-02-07 07:21:07', '2024-02-07 07:21:07'),
(3, 'Assistance', 'Assumenda ullam praesentium iusto sapiente ut impedit est. Iste porro assumenda inventore. Dolores voluptates aut assumenda atque omnis culpa atque.', '2024-02-07 07:21:07', '2024-02-07 07:21:07'),
(4, 'Others', 'Soluta consequuntur ullam maiores. Consectetur fuga qui id deleniti. Voluptas quisquam in architecto officia sed error fuga.', '2024-02-07 07:21:07', '2024-02-07 07:21:07');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(17, '2014_02_07_083109_create_roles_table', 2),
(18, '2014_10_12_000000_create_users_table', 2),
(19, '2014_10_12_100000_create_password_reset_tokens_table', 2),
(20, '2019_08_19_000000_create_failed_jobs_table', 2),
(21, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(22, '2024_02_07_083110_create_categories_table', 2),
(23, '2024_02_07_083112_create_requests_table', 2),
(24, '2024_02_07_083113_create_assignations_table', 2),
(25, '2024_02_07_083114_create_answers_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 11, 'API TOKEN of ', 'a3443a3ca028128153b48aeeb87b7b2e167211c4816af98aca4fb750b37a1128', '[\"*\"]', NULL, NULL, '2024-02-08 00:08:54', '2024-02-08 00:08:54'),
(9, 'App\\Models\\User', 11, 'API TOKEN of ', '07dc8d9fe20b3d05683a90b203bacfd75a7afb5266e752924ef92e6a057c6a5f', '[\"*\"]', '2024-02-11 19:19:58', NULL, '2024-02-08 04:56:45', '2024-02-11 19:19:58'),
(3, 'App\\Models\\User', 11, 'API TOKEN of ', '8c30ac7d6549771b85a012ef0b63eee4097f43e26b1a283be7ed2ed57f340c87', '[\"*\"]', NULL, NULL, '2024-02-08 03:39:05', '2024-02-08 03:39:05'),
(4, 'App\\Models\\User', 11, 'API TOKEN of ', 'f6dd585b3dbbbb09bd96918ec22fcbd0307a195c711d00f4033db047d05bbccc', '[\"*\"]', NULL, NULL, '2024-02-08 03:40:44', '2024-02-08 03:40:44'),
(5, 'App\\Models\\User', 11, 'API TOKEN of ', 'd4c3788cff883ce40aa92520cbdd1a020dbdfb39616595fcc90da1a4047f393e', '[\"*\"]', NULL, NULL, '2024-02-08 03:40:47', '2024-02-08 03:40:47'),
(6, 'App\\Models\\User', 11, 'API TOKEN of ', '435add9f8e6ac701ef87c5c8cbe7d5b4fdc6b400572dd25e43ee8ea8801f1407', '[\"*\"]', NULL, NULL, '2024-02-08 03:42:42', '2024-02-08 03:42:42'),
(8, 'App\\Models\\User', 16, 'API TOKEN of Rodrigues', '8408e3b14b675d605ce18e0cd154c9d49e96df046353c62410b25b7b33f1437e', '[\"*\"]', NULL, NULL, '2024-02-08 04:40:35', '2024-02-08 04:40:35'),
(10, 'App\\Models\\User', 17, 'API TOKEN of Ousman', '30ee16079bead4a3bec08d979a39810b8de096e325525cd957513e08752f7acd', '[\"*\"]', NULL, NULL, '2024-02-08 04:57:30', '2024-02-08 04:57:30'),
(11, 'App\\Models\\User', 16, 'API TOKEN of ', '7aeedfb4f7f39c1006c0cdbb24789be1518ec0aa43d0b64ffdecadee4da8c745', '[\"*\"]', '2024-02-12 09:22:03', NULL, '2024-02-08 12:33:04', '2024-02-12 09:22:03'),
(12, 'App\\Models\\User', 17, 'API TOKEN of ', '8511ae07767023fed6668f32d5d88875ae9b3fd2a170fa37041275945e61cc55', '[\"*\"]', '2024-02-12 20:14:03', NULL, '2024-02-08 12:34:19', '2024-02-12 20:14:03'),
(13, 'App\\Models\\User', 17, 'API TOKEN of ', '69e42eb56ab489a04e003f610d93c1b91808dd3195db828a5d84830eb2727f1a', '[\"*\"]', NULL, NULL, '2024-02-09 03:07:31', '2024-02-09 03:07:31'),
(14, 'App\\Models\\User', 16, 'API TOKEN of ', '54ecf5ff573af8a77c991dad5c1acdf527a8aa5324a892e63135914702fc60cd', '[\"*\"]', NULL, NULL, '2024-02-11 10:43:56', '2024-02-11 10:43:56'),
(15, 'App\\Models\\User', 16, 'API TOKEN of ', '2f827797e4bc6cbc5abc4e71e495bb4b883ae7ea83a53afeaab0c614e701cf05', '[\"*\"]', NULL, NULL, '2024-02-11 10:49:18', '2024-02-11 10:49:18'),
(16, 'App\\Models\\User', 16, 'API TOKEN of ', '14132dd1cecb617509ca5399444da915437d499d50cc324c00a326296aa14059', '[\"*\"]', NULL, NULL, '2024-02-11 11:31:52', '2024-02-11 11:31:52'),
(17, 'App\\Models\\User', 16, 'API TOKEN of ', '9d501ff876de174a773a54eb221675e51fdcb04e0dd447854952c6f96fd084a4', '[\"*\"]', NULL, NULL, '2024-02-11 11:31:56', '2024-02-11 11:31:56'),
(18, 'App\\Models\\User', 16, 'API TOKEN of ', 'ec8e862d72accc90d8c68f977354cf8b841815b905ebe05ccb94a74e42a785d1', '[\"*\"]', NULL, NULL, '2024-02-11 12:03:53', '2024-02-11 12:03:53'),
(19, 'App\\Models\\User', 16, 'API TOKEN of ', '8845d3362e8b0ea26e10d5f1c661aeebeaff3c1f02c5d71ab462551dd84a27f5', '[\"*\"]', NULL, NULL, '2024-02-11 12:08:31', '2024-02-11 12:08:31'),
(20, 'App\\Models\\User', 16, 'API TOKEN of ', 'c5de0436bfe66ff34e80c40f0c20507481b5e0927db8ba0f792690637301bd94', '[\"*\"]', NULL, NULL, '2024-02-11 12:13:03', '2024-02-11 12:13:03'),
(21, 'App\\Models\\User', 16, 'API TOKEN of ', '019d8138beda2eeacdea84b6fee5685cc9416b38c557ab5170f17d5a09a3924f', '[\"*\"]', NULL, NULL, '2024-02-11 12:14:49', '2024-02-11 12:14:49'),
(22, 'App\\Models\\User', 16, 'API TOKEN of ', '9d9a7628ea512fb74198609271b0d784dedb774435e42eb7b0e63117fc28475e', '[\"*\"]', NULL, NULL, '2024-02-11 12:16:33', '2024-02-11 12:16:33'),
(23, 'App\\Models\\User', 16, 'API TOKEN of ', '8e04c5719b86babe1c43fd2ca7ea01ed95af2ee4ce960b70397397f37b1fce7b', '[\"*\"]', NULL, NULL, '2024-02-11 12:18:12', '2024-02-11 12:18:12'),
(24, 'App\\Models\\User', 16, 'API TOKEN of ', 'def826d83ab0a5a49048a875e78704c787800374348693dc5da3588e0b9a8edf', '[\"*\"]', NULL, NULL, '2024-02-11 12:23:46', '2024-02-11 12:23:46'),
(25, 'App\\Models\\User', 16, 'API TOKEN of ', '8b7ea4d39ce94da0d0e451032d4c15341630a7ece6f0ae1fdad64123dd68276e', '[\"*\"]', NULL, NULL, '2024-02-11 12:39:06', '2024-02-11 12:39:06'),
(26, 'App\\Models\\User', 16, 'API TOKEN of ', 'd1b36ccb63b0452c2c734ed4478080b9566c89a5228c06d4b583797facc5208d', '[\"*\"]', NULL, NULL, '2024-02-11 12:42:49', '2024-02-11 12:42:49'),
(27, 'App\\Models\\User', 16, 'API TOKEN of ', '436cafb98783175ceca8841b7e181260014f84a9754aaeb7bb2116686a5a98ca', '[\"*\"]', NULL, NULL, '2024-02-11 12:46:26', '2024-02-11 12:46:26'),
(28, 'App\\Models\\User', 16, 'API TOKEN of ', 'f44bc0af92975ee369435385984d9f89511999cde7f52d74e258fa33bfbbc93f', '[\"*\"]', NULL, NULL, '2024-02-11 13:01:48', '2024-02-11 13:01:48'),
(29, 'App\\Models\\User', 16, 'API TOKEN of ', 'ccbf32328739f009867d0244b85cfc66c71cdcd36bf76b6dade7591550478c74', '[\"*\"]', NULL, NULL, '2024-02-11 13:07:31', '2024-02-11 13:07:31'),
(31, 'App\\Models\\User', 16, 'API TOKEN of ', '83d50d2325d3cfabb22be18b8c3c01bdca353f27718c4e395df5796c963ab743', '[\"*\"]', NULL, NULL, '2024-02-11 13:21:11', '2024-02-11 13:21:11'),
(33, 'App\\Models\\User', 16, 'API TOKEN of ', '211b6480be726fc05cb4625dac3640b8fe964b85c1a294cc81afd618966afb61', '[\"*\"]', NULL, NULL, '2024-02-11 14:27:31', '2024-02-11 14:27:31'),
(34, 'App\\Models\\User', 16, 'API TOKEN of ', '6b67ffc48df975d6a6330a3b118b538df773e562166d02e5da9bf80999b10d74', '[\"*\"]', NULL, NULL, '2024-02-11 14:36:08', '2024-02-11 14:36:08'),
(36, 'App\\Models\\User', 16, 'API TOKEN of ', 'cd610ede7bf01c72301159d0e593959bd8f490ef112c7fed288812bd115bf48d', '[\"*\"]', NULL, NULL, '2024-02-11 14:42:05', '2024-02-11 14:42:05'),
(37, 'App\\Models\\User', 16, 'API TOKEN of ', '5ead358ec6815688ee9705db572bf9267ed00454f9eefb877874b7b28e90504d', '[\"*\"]', NULL, NULL, '2024-02-11 14:47:03', '2024-02-11 14:47:03'),
(38, 'App\\Models\\User', 16, 'API TOKEN of ', 'e19a86bed5a6a02afab5cb0f298014d7e42f610428573ebc9aa554d897ac2800', '[\"*\"]', NULL, NULL, '2024-02-11 15:14:01', '2024-02-11 15:14:01'),
(39, 'App\\Models\\User', 16, 'API TOKEN of ', '9d0f8bc381b294bd934865ba69ad2af68cdb676c8d88707e694d5323a56160b9', '[\"*\"]', NULL, NULL, '2024-02-11 15:15:30', '2024-02-11 15:15:30'),
(40, 'App\\Models\\User', 16, 'API TOKEN of ', '8927464c6e85ce2b0c96749c56e4c74ae1a5ecc32e368321b92f94041ce418b5', '[\"*\"]', NULL, NULL, '2024-02-11 15:17:44', '2024-02-11 15:17:44'),
(41, 'App\\Models\\User', 16, 'API TOKEN of ', '386878f1695b89cebb6d0ba12bae04645d1319338d99817d7a643cc15f647dba', '[\"*\"]', NULL, NULL, '2024-02-11 16:26:37', '2024-02-11 16:26:37'),
(42, 'App\\Models\\User', 16, 'API TOKEN of ', '862931a0fa678457c559c18f7cc26d21a9916b7a91853b35c2f086e15ebb7c53', '[\"*\"]', NULL, NULL, '2024-02-11 16:30:24', '2024-02-11 16:30:24'),
(43, 'App\\Models\\User', 16, 'API TOKEN of ', '9dd8520238a1efeaa933504be1fc0e2d4539655a8911e88fa9f8c51add23ab8c', '[\"*\"]', NULL, NULL, '2024-02-11 16:40:00', '2024-02-11 16:40:00'),
(44, 'App\\Models\\User', 16, 'API TOKEN of ', '42e071b9dec656e32be682531e1fb093bd78ff307a5b6b97e7b4ac4698d6e302', '[\"*\"]', NULL, NULL, '2024-02-11 16:40:38', '2024-02-11 16:40:38'),
(45, 'App\\Models\\User', 16, 'API TOKEN of ', '09b428b25b6b208c7bcabd6dbbfe2382c119191a59db0a76dd47a60b9665899c', '[\"*\"]', NULL, NULL, '2024-02-11 16:42:55', '2024-02-11 16:42:55'),
(46, 'App\\Models\\User', 16, 'API TOKEN of ', 'afc5e2e0837a2d782239c1f3c0e8c164569d72a9ebab926d58d6cb9bcf28c295', '[\"*\"]', NULL, NULL, '2024-02-11 16:48:24', '2024-02-11 16:48:24'),
(47, 'App\\Models\\User', 16, 'API TOKEN of ', '0121ac731187a85884f2840b7fd3e4c8657a66d55e725b9f9c1739eaa4bee994', '[\"*\"]', NULL, NULL, '2024-02-11 17:01:50', '2024-02-11 17:01:50'),
(48, 'App\\Models\\User', 16, 'API TOKEN of ', '3a10993a0e6d5f31dccd9fd91dbb0edc5a70962f444fb1c0c4bfc8322c762b47', '[\"*\"]', NULL, NULL, '2024-02-11 17:04:11', '2024-02-11 17:04:11'),
(49, 'App\\Models\\User', 16, 'API TOKEN of ', '87910c28f95ca68f640f2febe155ed32b022434c62436e1beda10ded6f0c3b00', '[\"*\"]', NULL, NULL, '2024-02-11 17:07:06', '2024-02-11 17:07:06'),
(50, 'App\\Models\\User', 16, 'API TOKEN of ', 'f164754ffc3756951b24c0c3408f74da0b851430ecb5c66923cb531c65059e1d', '[\"*\"]', NULL, NULL, '2024-02-11 17:13:34', '2024-02-11 17:13:34'),
(51, 'App\\Models\\User', 16, 'API TOKEN of ', 'd3a0f9398a032b6ccceb8cebcdfe3fe837a1b0a2d0b9926a60ff80152ad72c7e', '[\"*\"]', NULL, NULL, '2024-02-11 17:33:20', '2024-02-11 17:33:20'),
(52, 'App\\Models\\User', 16, 'API TOKEN of ', '7260340f88a46da91cef61b7a0d7fed08a11b5fb6270d0227edd28987671f93b', '[\"*\"]', NULL, NULL, '2024-02-11 17:43:40', '2024-02-11 17:43:40'),
(53, 'App\\Models\\User', 16, 'API TOKEN of ', '694cc94703c7c2872849f2e7fd0fa96fad5c32b6a28c05a0fbaf388cc5f208da', '[\"*\"]', NULL, NULL, '2024-02-11 17:47:32', '2024-02-11 17:47:32'),
(54, 'App\\Models\\User', 16, 'API TOKEN of ', '68778b56c57cff4e42cb7039d048afc089f77bfb6a99409522034a931dee5613', '[\"*\"]', NULL, NULL, '2024-02-11 18:00:08', '2024-02-11 18:00:08'),
(55, 'App\\Models\\User', 16, 'API TOKEN of ', '0e80a858d03c04ed5170a48c5c84bfce61ae7a0866d331b0b14a319161ebd505', '[\"*\"]', NULL, NULL, '2024-02-11 18:13:35', '2024-02-11 18:13:35'),
(56, 'App\\Models\\User', 16, 'API TOKEN of ', '1b9f355e1728c4c2647c38ce30f30213fc0ec21a7e05a8e175af5716812c1eed', '[\"*\"]', NULL, NULL, '2024-02-11 18:37:19', '2024-02-11 18:37:19'),
(57, 'App\\Models\\User', 16, 'API TOKEN of ', 'fd2f7b1b6970ea058985e51bcc46979ce8916c8dbded3b53c594ad429f225caf', '[\"*\"]', NULL, NULL, '2024-02-11 18:52:48', '2024-02-11 18:52:48'),
(58, 'App\\Models\\User', 16, 'API TOKEN of ', '293907cab142b2569cbafe792a7e2858521a807978ca3a122800a7d7c212a416', '[\"*\"]', NULL, NULL, '2024-02-11 19:20:59', '2024-02-11 19:20:59'),
(59, 'App\\Models\\User', 16, 'API TOKEN of ', 'f8e05820c9e6a2271e1b99d7c5f6001cc5da1f6bcecae37763e7a42d4f583a68', '[\"*\"]', NULL, NULL, '2024-02-11 19:23:51', '2024-02-11 19:23:51'),
(60, 'App\\Models\\User', 16, 'API TOKEN of ', '291f6d723671a4dd9462d5bd81ce70cc6a56b2b06222a017a1c19dcd80cfec52', '[\"*\"]', '2024-02-11 19:37:23', NULL, '2024-02-11 19:27:07', '2024-02-11 19:37:23'),
(61, 'App\\Models\\User', 16, 'API TOKEN of ', 'b30429a40531e5d4aa999debab73aa1b5a6d85c99b742e7e043669dd44012bd7', '[\"*\"]', '2024-02-11 19:44:01', NULL, '2024-02-11 19:43:31', '2024-02-11 19:44:01'),
(62, 'App\\Models\\User', 16, 'API TOKEN of ', '46a9416340ab66ca1612dfed1aa3025aeb0e50b0921098b50e6fc600eccfc77a', '[\"*\"]', '2024-02-11 19:45:35', NULL, '2024-02-11 19:45:30', '2024-02-11 19:45:35'),
(63, 'App\\Models\\User', 16, 'API TOKEN of ', '20941265112ce477d30e54642e2cec511bbd0fae49ae0ce18808d186b9adaf2e', '[\"*\"]', '2024-02-11 19:49:03', NULL, '2024-02-11 19:47:19', '2024-02-11 19:49:03'),
(64, 'App\\Models\\User', 16, 'API TOKEN of ', '2b70a3781cdb8b6097d6d8872a2e2b447c3c1b5d2266a26c7a37241eca305646', '[\"*\"]', '2024-02-11 19:58:31', NULL, '2024-02-11 19:53:32', '2024-02-11 19:58:31'),
(65, 'App\\Models\\User', 16, 'API TOKEN of ', '3c11018869ecf144d31915460c9a8b2e6758c9114648062278f5147c11385a4d', '[\"*\"]', '2024-02-11 20:06:26', NULL, '2024-02-11 20:02:13', '2024-02-11 20:06:26'),
(66, 'App\\Models\\User', 16, 'API TOKEN of ', '8ad9318802cc903e1cb2eb0b02dca264135e757afe2639c0c1d5d0f08739c66a', '[\"*\"]', '2024-02-11 20:11:06', NULL, '2024-02-11 20:09:36', '2024-02-11 20:11:06'),
(67, 'App\\Models\\User', 16, 'API TOKEN of ', '6ba1fb94dfa5897f96dfb4610882256beb934c6fdc686c5b4d9120f0bfa5e54b', '[\"*\"]', '2024-02-11 20:29:57', NULL, '2024-02-11 20:19:18', '2024-02-11 20:29:57'),
(68, 'App\\Models\\User', 16, 'API TOKEN of ', '4d79d4291a1a75afb52e32875ef96851e3f51e1a5127646464e0c434ffc058c4', '[\"*\"]', '2024-02-11 20:42:14', NULL, '2024-02-11 20:33:27', '2024-02-11 20:42:14'),
(69, 'App\\Models\\User', 16, 'API TOKEN of ', 'bef1a203ae6212cf8c26004b81e1bec42f7b5dba699423527c8cd04dcb9128b5', '[\"*\"]', '2024-02-11 20:49:23', NULL, '2024-02-11 20:42:47', '2024-02-11 20:49:23'),
(70, 'App\\Models\\User', 16, 'API TOKEN of ', '47c2cf68e6499c969178adf4986e665722dda5104ae1f7b5883a13b3ce13d58e', '[\"*\"]', '2024-02-11 21:08:08', NULL, '2024-02-11 20:52:25', '2024-02-11 21:08:08'),
(71, 'App\\Models\\User', 16, 'API TOKEN of ', 'f719fbfa24e1c8447ca9bb503b528be3dd234f77b68e4c4993ef901cf170e7e9', '[\"*\"]', '2024-02-12 05:34:14', NULL, '2024-02-12 05:34:06', '2024-02-12 05:34:14'),
(72, 'App\\Models\\User', 16, 'API TOKEN of ', 'd0973c7afee2b7725dea10be6a4c8c87a2204d1c641ab34db8acb57395640d62', '[\"*\"]', '2024-02-12 05:40:26', NULL, '2024-02-12 05:38:22', '2024-02-12 05:40:26'),
(73, 'App\\Models\\User', 16, 'API TOKEN of ', '7fc8ea93ed11bf54480e25370b506f649edccc721b622f9abaac112311c76899', '[\"*\"]', '2024-02-12 06:43:18', NULL, '2024-02-12 06:25:36', '2024-02-12 06:43:18'),
(74, 'App\\Models\\User', 18, 'API TOKEN of Issa', '2d33ce6d1dc76ae5356f1c03827d877c6a068a597177b14aad135a20a5955446', '[\"*\"]', NULL, NULL, '2024-02-12 06:33:23', '2024-02-12 06:33:23'),
(75, 'App\\Models\\User', 16, 'API TOKEN of ', '0cd4f97f486fa498801e10560cfe22c522bc1a963a08f49cdda7632337ac1885', '[\"*\"]', '2024-02-12 07:00:18', NULL, '2024-02-12 06:49:21', '2024-02-12 07:00:18'),
(76, 'App\\Models\\User', 16, 'API TOKEN of ', 'ccb7af12bbdc8bd38e4ca56ca5ca312b46a87238e81aa48547269f60e5f531fd', '[\"*\"]', '2024-02-12 07:35:14', NULL, '2024-02-12 07:28:54', '2024-02-12 07:35:14'),
(77, 'App\\Models\\User', 16, 'API TOKEN of ', '8f1caced2382b702312ef1b7b737fa52d172cb827c5acc4cddc37fb3f4d58ac4', '[\"*\"]', '2024-02-12 07:36:30', NULL, '2024-02-12 07:36:11', '2024-02-12 07:36:30'),
(78, 'App\\Models\\User', 16, 'API TOKEN of ', '3196fa9b8b984a8ea2a39e82e252fb1019a008a477491f9af7d822e7823786b6', '[\"*\"]', '2024-02-12 07:41:16', NULL, '2024-02-12 07:40:47', '2024-02-12 07:41:16'),
(79, 'App\\Models\\User', 16, 'API TOKEN of ', '41a5e03445dc4c5301d7e4aba998298263ed77d1f72a8ef72f042636125367eb', '[\"*\"]', '2024-02-12 07:55:13', NULL, '2024-02-12 07:42:39', '2024-02-12 07:55:13'),
(80, 'App\\Models\\User', 16, 'API TOKEN of ', '1ea63e13112cf5890c1b7fe273509a3037064c63c7fefd746bfe430564ba0f16', '[\"*\"]', '2024-02-12 08:17:38', NULL, '2024-02-12 08:09:22', '2024-02-12 08:17:38'),
(81, 'App\\Models\\User', 16, 'API TOKEN of ', '3dea1cf7d61b137f5bcb140b9fa9322882bcfb6370974f4efa1d403e5648fe5a', '[\"*\"]', '2024-02-12 08:45:38', NULL, '2024-02-12 08:20:25', '2024-02-12 08:45:38'),
(82, 'App\\Models\\User', 16, 'API TOKEN of ', 'beddefc46b15f01ffc9f388da47c8e91c32e6d0ffaf09a462c00fd337e4d8a3e', '[\"*\"]', '2024-02-12 09:11:06', NULL, '2024-02-12 08:48:50', '2024-02-12 09:11:06'),
(83, 'App\\Models\\User', 16, 'API TOKEN of ', '5cb88c9d1173b37356cb8625e6dedc8b58f6fe80d148125f3f2d6e2e629be76f', '[\"*\"]', '2024-02-12 09:20:29', NULL, '2024-02-12 09:12:51', '2024-02-12 09:20:29'),
(84, 'App\\Models\\User', 16, 'API TOKEN of ', 'f83a283f22a9cb8f837c6e6fb9c0459821910cd2ea0a8d36df56e240444b7b0c', '[\"*\"]', '2024-02-12 10:20:59', NULL, '2024-02-12 10:11:00', '2024-02-12 10:20:59'),
(85, 'App\\Models\\User', 16, 'API TOKEN of ', 'b510212cf465f616f50f41e679aa3c46f5651b5c5e4f5f1b4bc01c60d2c293b3', '[\"*\"]', '2024-02-12 10:51:24', NULL, '2024-02-12 10:26:45', '2024-02-12 10:51:24'),
(86, 'App\\Models\\User', 16, 'API TOKEN of ', '291792a13cc080a30791bc0f8552258e592c7d4b86b2264cd148a45b81d075b6', '[\"*\"]', '2024-02-12 12:37:43', NULL, '2024-02-12 12:37:36', '2024-02-12 12:37:43'),
(87, 'App\\Models\\User', 16, 'API TOKEN of ', '835fc5d0c1660568b51df8b1117d8f923b5832151b1fddd83fc689c90813bbac', '[\"*\"]', '2024-02-12 12:53:22', NULL, '2024-02-12 12:45:01', '2024-02-12 12:53:22'),
(97, 'App\\Models\\User', 16, 'API TOKEN of ', 'baf4ce2f6d0f7c80a9be0cd3a818f75fe067c03090aa92b3561a756540ecbf0c', '[\"*\"]', '2024-02-12 18:02:16', NULL, '2024-02-12 17:51:04', '2024-02-12 18:02:16'),
(94, 'App\\Models\\User', 19, 'API TOKEN of Marcelin', '0e7356048f90218a622fc773b4c27ab7dd1b74b4b2a5d515dd8ecd91edd7e0cb', '[\"*\"]', NULL, NULL, '2024-02-12 17:04:10', '2024-02-12 17:04:10'),
(100, 'App\\Models\\User', 19, 'API TOKEN of ', 'a6d06d969650e95c85af500e5e6e534123dfd26b66a99c1cf3cfb676d03647d1', '[\"*\"]', '2024-02-12 19:07:52', NULL, '2024-02-12 18:57:08', '2024-02-12 19:07:52'),
(109, 'App\\Models\\User', 16, 'API TOKEN of ', '202e4cb0466d87ea220de5f35dff2897e34cc86129401a3029d77630071b3ea0', '[\"*\"]', '2024-02-13 03:38:39', NULL, '2024-02-13 03:38:38', '2024-02-13 03:38:39'),
(110, 'App\\Models\\User', 16, 'API TOKEN of ', '74f986b5720d27288fad1be4a06b6da49ab92b288cb84a53e3ff958796682c20', '[\"*\"]', NULL, NULL, '2024-02-13 06:38:32', '2024-02-13 06:38:32'),
(111, 'App\\Models\\User', 16, 'API TOKEN of ', 'fe3a1a5dfb53cea0ab808578119ec87c1f3e496c1d300c58ef8c4604252e4ebb', '[\"*\"]', NULL, NULL, '2024-02-13 06:42:04', '2024-02-13 06:42:04'),
(112, 'App\\Models\\User', 16, 'API TOKEN of ', '4161a861664da3dc27057a5d034f11b4e9d12a038c9c818876e5ba7235d1c3ce', '[\"*\"]', NULL, NULL, '2024-02-13 06:52:32', '2024-02-13 06:52:32'),
(113, 'App\\Models\\User', 16, 'API TOKEN of ', '90304cb5c55b85df6d5a86c4097a2725757934e994e13d4ed540d3548f10c712', '[\"*\"]', NULL, NULL, '2024-02-13 06:52:38', '2024-02-13 06:52:38'),
(114, 'App\\Models\\User', 16, 'API TOKEN of ', '618461c7a05f42457101160cf1f5c5611a690cdaa247379b1dcef806eaad6d06', '[\"*\"]', NULL, NULL, '2024-02-13 06:52:40', '2024-02-13 06:52:40'),
(115, 'App\\Models\\User', 16, 'API TOKEN of ', '3a8dac146bf99c79985c77651aafbcc7b5f971368f6b3ef9d38f2faeecb864d7', '[\"*\"]', NULL, NULL, '2024-02-13 06:52:42', '2024-02-13 06:52:42'),
(116, 'App\\Models\\User', 16, 'API TOKEN of ', 'ca86f6a7099713f6c12a667af649123e8e324432bd0c651fc68a7617eb6a99b3', '[\"*\"]', NULL, NULL, '2024-02-13 06:52:47', '2024-02-13 06:52:47'),
(117, 'App\\Models\\User', 16, 'API TOKEN of ', 'd34bef0c183853ff278bf017ac5009c104ba622ecdc4a12a376555de99692619', '[\"*\"]', NULL, NULL, '2024-02-13 06:52:48', '2024-02-13 06:52:48'),
(118, 'App\\Models\\User', 16, 'API TOKEN of ', 'fab8f3fa2df51d28a8917b881afd8ea8aa5c165d8bcf907505dd8c9d220d4441', '[\"*\"]', NULL, NULL, '2024-02-13 06:52:57', '2024-02-13 06:52:57'),
(119, 'App\\Models\\User', 16, 'API TOKEN of ', '0e9724a2fadccdbdc5d7d6080a54ee2ad6b00dd5c3fad55fd193f70e992c9c16', '[\"*\"]', NULL, NULL, '2024-02-13 06:52:58', '2024-02-13 06:52:58'),
(120, 'App\\Models\\User', 16, 'API TOKEN of ', '0381189cd227cd40fbba50e0c3229ae228b185ba2aa9713c9e2526e9cba4e25f', '[\"*\"]', NULL, NULL, '2024-02-13 06:52:59', '2024-02-13 06:52:59'),
(121, 'App\\Models\\User', 16, 'API TOKEN of ', '582fe57367a75ec32bd30ec5ee41e0f2987c69b1ab4e5407e28ae2bb6d330c9e', '[\"*\"]', NULL, NULL, '2024-02-13 06:53:01', '2024-02-13 06:53:01'),
(123, 'App\\Models\\User', 16, 'API TOKEN of ', 'c90ab294d11712902c9fbd8d29a32b76d438ae5385cad70153ac7f23d9a6a20c', '[\"*\"]', '2024-02-13 08:14:48', NULL, '2024-02-13 08:07:41', '2024-02-13 08:14:48'),
(124, 'App\\Models\\User', 16, 'API TOKEN of ', '41d3eba0c0b06592be13c98bc19220a4810f9ab9c82e0db334aebee2ddaa6301', '[\"*\"]', '2024-02-13 08:15:51', NULL, '2024-02-13 08:15:17', '2024-02-13 08:15:51'),
(125, 'App\\Models\\User', 16, 'API TOKEN of ', '1de1debe39091a05112d10e41f74586e2831b0aeeb5189158404b51edf58261a', '[\"*\"]', '2024-02-13 09:45:05', NULL, '2024-02-13 08:17:56', '2024-02-13 09:45:05'),
(126, 'App\\Models\\User', 16, 'API TOKEN of ', '03dfc4e4eec019086e0aa8baa426fe9ed2ffc0d1bba7edff43eb8beff1c64653', '[\"*\"]', '2024-02-13 16:13:44', NULL, '2024-02-13 10:59:02', '2024-02-13 16:13:44'),
(129, 'App\\Models\\User', 16, 'API TOKEN of ', '8055828b815b1b41ea48585bbe32c1fd56685157b7485b883e9c89f7f887944e', '[\"*\"]', '2024-02-13 17:24:12', NULL, '2024-02-13 16:22:59', '2024-02-13 17:24:12'),
(130, 'App\\Models\\User', 20, 'API TOKEN of Joel', '41c50c56f598302e366571405b83b01db850a3aaa1ec90395a937093221c789a', '[\"*\"]', NULL, NULL, '2024-02-13 16:24:23', '2024-02-13 16:24:23'),
(135, 'App\\Models\\User', 16, 'API TOKEN of ', 'e3ee6947761f6e70e4e1d2ee28584df4de2605953f59169470c0292e27be08bc', '[\"*\"]', '2024-02-14 01:31:29', NULL, '2024-02-14 01:31:27', '2024-02-14 01:31:29');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
CREATE TABLE IF NOT EXISTS `requests` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('proccesing','done') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `date_request` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requests_user_id_foreign` (`user_id`),
  KEY `requests_category_id_foreign` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `title`, `description`, `status`, `user_id`, `category_id`, `date_request`, `created_at`, `updated_at`) VALUES
(7, 'T#20242121842', 'How to get a Business account ?', 'done', 18, 1, '2024-02-12 16:57:57', '2024-02-12 16:57:57', '2024-02-12 18:45:51'),
(8, 'T#20242131831', 'text anything', 'done', 18, 4, '2024-02-13 02:33:20', '2024-02-13 02:33:20', '2024-02-13 02:41:03'),
(9, 'T#20242131826', 'Please I wanna get help.', 'done', 18, 3, '2024-02-13 16:18:48', '2024-02-13 16:18:48', '2024-02-13 17:32:49');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Customer', 'CUS', 'Can create a request.', '2024-02-07 07:02:49', '2024-02-07 07:02:49'),
(2, 'Manager', 'MAN', 'Can Manage all requests.', '2024-02-07 07:02:49', '2024-02-07 07:02:49'),
(3, 'IT', 'IT', 'Can answer a request.', '2024-02-07 07:02:49', '2024-02-07 07:02:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `email_verified_at`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(19, 'Marcelin', 'Alima', 'it2@enfm.com', NULL, '$2y$12$BnrByMM2nHAeAUp1Ge6y1.r3HR7OXOngXWFnwYqC5BXPBUM69/Jyu', 3, NULL, '2024-02-12 17:04:10', '2024-02-12 17:04:10'),
(20, 'Joel', 'Lafleur', 'it3@enfm.com', NULL, '$2y$12$bWImxYFj6Yga84.VAfLLL.TAUvYwe0drMnZSnhGIJh0DkSjOaUIdy', 3, NULL, '2024-02-13 16:24:23', '2024-02-13 16:24:23'),
(16, 'Rodrigues', 'Pascal', 'manager@enfm.com', NULL, '$2y$12$NMBViJY8tcrWNVgpaNhAT.ssM4AGzJFAUzZAW8Ki.Fwp6DScI/UmW', 2, NULL, '2024-02-08 04:40:35', '2024-02-08 04:40:35'),
(17, 'Ousman', 'Ali', 'it@enfm.com', NULL, '$2y$12$54QloJYYFi4jRLyTUUoDROwXhg4c1GZmnw4ZIl67mlBNT4mcuMV0G', 3, NULL, '2024-02-08 04:57:30', '2024-02-08 04:57:30'),
(18, 'Issa', 'Hamza', 'customer@enfm.com', NULL, '$2y$12$QdB38iopHnpnKI.8cBm0G.GfLSRdfmW/b0iRzeywFWVixztsQTnQG', 1, NULL, '2024-02-12 06:33:23', '2024-02-12 06:33:23');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
