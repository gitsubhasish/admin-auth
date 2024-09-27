-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for authadmin
CREATE DATABASE IF NOT EXISTS `authadmin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `authadmin`;

-- Dumping structure for table authadmin.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table authadmin.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table authadmin.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table authadmin.migrations: ~0 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2024_09_26_090136_create_sessions_table', 1);

-- Dumping structure for table authadmin.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table authadmin.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table authadmin.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table authadmin.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table authadmin.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table authadmin.sessions: ~2 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('1diS2sOXl4lvR7TWUJbNosB3YQRH5FYXGu8G4iK5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidHViemNNYWQyNWM1NDBOaFFmY2haRkJjSVFndU5PTUFyMWdNTkpVaCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMToiaHR0cDovL2FkbWluYXV0aC50ZXN0L2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vYWRtaW5hdXRoLnRlc3QiO319', 1727416416),
	('hjlWtjMEjZRfJqLD1InnJdcZKGAluMSDitonHOnb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiN2tHaXpmNk9vOFJtWDN1NTE0VzJvY1ROSmFHN1BOTm9Zdlg5ZUdhayI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMToiaHR0cDovL2FkbWluYXV0aC50ZXN0L2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vYWRtaW5hdXRoLnRlc3QiO319', 1727416913),
	('yChucF82F6gwUPa9ceq3UpUCMonGU2uUEYVAyEhL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiOE14SDVpbnVTczcwVXZrUkFSMTlXMDdtaXlrdlE4WG1WdWZEMlQ2NSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727415812);

-- Dumping structure for table authadmin.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table authadmin.users: ~51 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Super Admin', 'superadmin@gmail.com', '2024-09-27 00:04:39', '$2y$12$6pppcLWSg1/Rj2Xf6OOnLeHXhZKlYaGZrJbn3V8g6.PzymllmEFRS', NULL, '2024-09-27 00:04:39', '2024-09-27 00:08:38'),
	(2, 'Daron Keebler', 'elaina57@example.com', '2024-09-27 00:04:40', '$2y$12$IOJaFHCUHYtqys3ybThLKeMqVTlGhYZAUqqeRZ0Z7LPN0GfS2s0CS', NULL, '2024-09-27 00:04:40', '2024-09-27 00:04:40'),
	(3, 'Keagan Parisian II', 'natasha.wolf@example.org', '2024-09-27 00:04:40', '$2y$12$4D9YG/VWLCuxxVs5CHcVKuPWgRFUsSk4Z2WimtwKnms8/O5gzf5Gy', NULL, '2024-09-27 00:04:40', '2024-09-27 00:04:40'),
	(4, 'Prof. Javier Trantow PhD', 'larson.francesca@example.com', '2024-09-27 00:04:40', '$2y$12$dCs7WG6ceODWtirNTSRyUOiRn28V2tqMSJdpg2EyU3RS.apnDH51S', NULL, '2024-09-27 00:04:40', '2024-09-27 00:04:40'),
	(5, 'Danny Flatley', 'wiegand.dahlia@example.com', '2024-09-27 00:04:41', '$2y$12$wNQ7ubVampJqWAYhjOtS0u0hS3pv97.GKH.afu3ZoOoq6DRM8bG3a', NULL, '2024-09-27 00:04:41', '2024-09-27 00:04:41'),
	(6, 'Coby Heathcote', 'mraz.darryl@example.com', '2024-09-27 00:04:41', '$2y$12$PIikEvcuUIm2YBcJ2HmtTuIn.4aMfUsNVCdgWSLjP2pUM11DTsSdC', NULL, '2024-09-27 00:04:41', '2024-09-27 00:04:41'),
	(7, 'Mrs. Shanna Marvin DVM', 'slindgren@example.net', '2024-09-27 00:04:41', '$2y$12$KnwD/5YasTd47Ff1iB35au9.xYp1NTAwaNgUHHx6/K.cZpJPVEuve', NULL, '2024-09-27 00:04:41', '2024-09-27 00:04:41'),
	(8, 'Miss Bailee Bartell Sr.', 'runolfsdottir.emma@example.net', '2024-09-27 00:04:42', '$2y$12$56UtVtusrELiJfWz/zfuSOdH7YfKdbO0eTArSthFUR2YWdb186f8.', NULL, '2024-09-27 00:04:42', '2024-09-27 00:04:42'),
	(9, 'Miss Adell Schowalter', 'maureen.watsica@example.com', '2024-09-27 00:04:42', '$2y$12$kM7Xh8Nf.7dIvyCIragihOgUjL0PUFaoSwUOHJBQxt9DGPMcwLNmi', NULL, '2024-09-27 00:04:42', '2024-09-27 00:04:42'),
	(10, 'Tatyana Mills', 'daisy.lind@example.org', '2024-09-27 00:04:43', '$2y$12$RvR6.jXgK9n7s8cOnIABWuqBIJ.y2kxH0mDhA3PBoad2Rlms1T4bO', NULL, '2024-09-27 00:04:43', '2024-09-27 00:04:43'),
	(11, 'Maryam Cruickshank Sr.', 'zoie.jast@example.net', '2024-09-27 00:04:43', '$2y$12$h8vCWARfvf8cieLhOAoktO74RM9hICvaPOAs9a2uGe0vTPx6Qjslu', NULL, '2024-09-27 00:04:43', '2024-09-27 00:04:43'),
	(12, 'Veronica Schulist', 'edd71@example.org', '2024-09-27 00:04:44', '$2y$12$U4HgnqWPX9VydD8Rsuzag.yxEi7NEaPshZq5sYRGDs9KRoPErdwai', NULL, '2024-09-27 00:04:44', '2024-09-27 00:04:44'),
	(13, 'Anne Blanda', 'jordy77@example.com', '2024-09-27 00:04:44', '$2y$12$nXNYjJ531viWMZRLMx7S8upuQbAxkvwl5WBhKCE90szNks4jdgqnW', NULL, '2024-09-27 00:04:44', '2024-09-27 00:04:44'),
	(14, 'America Turcotte', 'janiya31@example.com', '2024-09-27 00:04:44', '$2y$12$WCkxXrfVxBlV.wMeKynklOyO8YeBOkZ0AEJdekiS5/gP9MGsg6Lnm', NULL, '2024-09-27 00:04:44', '2024-09-27 00:04:44'),
	(15, 'Prof. Terrill Reilly PhD', 'lauren.kunze@example.com', '2024-09-27 00:04:44', '$2y$12$aigFAGopq5yB1fKcvZKH3ei8EIm4TDoPBYpHECNTpuix97TpviVd2', NULL, '2024-09-27 00:04:44', '2024-09-27 00:04:44'),
	(16, 'Nathaniel Monahan', 'priscilla49@example.com', '2024-09-27 00:04:45', '$2y$12$5SAkxWQNPWaVtK2UqX1Beu7pjPr0fG48DP1ka/IPosbGVPwCPIjpm', NULL, '2024-09-27 00:04:45', '2024-09-27 00:04:45'),
	(17, 'Tara Stroman', 'royal00@example.org', '2024-09-27 00:04:45', '$2y$12$TYxP8lOFXFiBakANxI1WA.uiZoZXoEdFP9xDDv7zBwhuaIsiismLW', NULL, '2024-09-27 00:04:45', '2024-09-27 00:04:45'),
	(18, 'Leanna Crooks Jr.', 'beryl.wunsch@example.net', '2024-09-27 00:04:45', '$2y$12$t16cvtmcQVIeecqoIirSTOV5kT.a2HWHFkLoKrmS0eSFbHeAAzCn.', NULL, '2024-09-27 00:04:45', '2024-09-27 00:04:45'),
	(19, 'Dr. Howell Wisozk Sr.', 'pearlie.cronin@example.net', '2024-09-27 00:04:46', '$2y$12$p0Y5cfYQ2P1XdJCHPYTSNOmCxpg8YUiJB3puJjmGxM17LiQ7u3BN.', NULL, '2024-09-27 00:04:46', '2024-09-27 00:04:46'),
	(20, 'Eldon Huels', 'ayana85@example.org', '2024-09-27 00:04:46', '$2y$12$lojY/g.Hw8BhWCK8Yl3OGuD.eznSH6lDtJhTuIvEEK8sDx0YGIIiC', NULL, '2024-09-27 00:04:46', '2024-09-27 00:04:46'),
	(21, 'John Kautzer IV', 'wmraz@example.com', '2024-09-27 00:04:46', '$2y$12$TIyAGsRRLr61q3uYba890.Cy3iHYgh9MdMVgMpc2QkNkaIPpjYEpW', NULL, '2024-09-27 00:04:46', '2024-09-27 00:04:46'),
	(22, 'Dr. Marvin Jacobs IV', 'ubaldo03@example.com', '2024-09-27 00:04:46', '$2y$12$5RuitA/EgYQSq8okf3bOvelxUiLFxbr/xUWF.9byaduqQf9zHwJ4e', NULL, '2024-09-27 00:04:46', '2024-09-27 00:04:46'),
	(23, 'Prof. Paxton Casper', 'darion14@example.net', '2024-09-27 00:04:47', '$2y$12$D02cUh7YBpxmkhBFMWL73Op5zGOKxqRVElRanOjajKkZcjzSoKhbq', NULL, '2024-09-27 00:04:47', '2024-09-27 00:04:47'),
	(24, 'Miss Janae Kertzmann III', 'buckridge.kathlyn@example.com', '2024-09-27 00:04:47', '$2y$12$caei7fFBlG87S4KZYjKvyu6Ge1jUwEj5OCccBleC4gl8xjl.A2Z9e', NULL, '2024-09-27 00:04:47', '2024-09-27 00:04:47'),
	(25, 'Jace Conn', 'leola98@example.org', '2024-09-27 00:04:47', '$2y$12$.irQcqlDfEC3gNd1xhpfG.nG0yXocYznhtLpf7NAy9eH6aPTQkqR2', NULL, '2024-09-27 00:04:47', '2024-09-27 00:04:47'),
	(26, 'Aditya Schuppe', 'janie.homenick@example.com', '2024-09-27 00:04:48', '$2y$12$e.lYgsYd0LxPGiXgGPO5N.yOBsS5s79wuTcPYgdEHntJs0N7o3C7C', NULL, '2024-09-27 00:04:48', '2024-09-27 00:04:48'),
	(27, 'Amina Mayert V', 'kyra20@example.org', '2024-09-27 00:04:48', '$2y$12$sSNML2I99ykTvi43XXYjU.AwvzWmNsgig.CClzR.KRQZqx4KVqsP.', NULL, '2024-09-27 00:04:48', '2024-09-27 00:04:48'),
	(28, 'Nathanial Kilback MD', 'leatha18@example.net', '2024-09-27 00:04:48', '$2y$12$wiAqJk3ynK2eKP2xnCoaAO./H6GSvr8V4gyYcvEEqq.yA8ga1jUca', NULL, '2024-09-27 00:04:48', '2024-09-27 00:04:48'),
	(29, 'Noemi Stiedemann', 'braun.annamae@example.org', '2024-09-27 00:04:49', '$2y$12$N6B4laKocZ7uQIgf6GddZuXRmDHgBlwM3WYUey3IJLzesoN/mvoqe', NULL, '2024-09-27 00:04:49', '2024-09-27 00:04:49'),
	(30, 'Aracely Toy', 'susie.wilkinson@example.net', '2024-09-27 00:04:49', '$2y$12$hEsUvKGvwfUUeBN.4C9RR.84oLjqYyF8jnpBBEEG3WZOFu/I.1DLO', NULL, '2024-09-27 00:04:49', '2024-09-27 00:04:49'),
	(31, 'Dr. Aiyana Willms PhD', 'ehayes@example.net', '2024-09-27 00:04:49', '$2y$12$ht8ymTPaG24RsS7qABtQ8OontMJPQaQtGw0oVFhoPtlZJEHQ8xeeq', NULL, '2024-09-27 00:04:49', '2024-09-27 00:04:49'),
	(32, 'Mrs. Antoinette Torphy PhD', 'maida39@example.com', '2024-09-27 00:04:49', '$2y$12$I/tWmBD3JQlZGEIbbgZR0eO.Hic3WF7lmexCDafA/slp2d53EJYvy', NULL, '2024-09-27 00:04:49', '2024-09-27 00:04:49'),
	(33, 'Gerson Maggio', 'qpacocha@example.net', '2024-09-27 00:04:50', '$2y$12$nIf.YYnM.5O6QQ3ml4FTPOVbhxF.t3fTURAriVI25Q8mbnlCPLKHG', NULL, '2024-09-27 00:04:50', '2024-09-27 00:04:50'),
	(34, 'Dr. Buster Wilderman V', 'eluettgen@example.org', '2024-09-27 00:04:50', '$2y$12$MIfN.xdGWC6mYkTc1pT3NuqDBCh32Ra7EjZG6CT/DpwxXb1tZ88ZO', NULL, '2024-09-27 00:04:50', '2024-09-27 00:04:50'),
	(35, 'Julius Williamson', 'leopoldo45@example.net', '2024-09-27 00:04:50', '$2y$12$iLGxUZ6wbeNxpkMVUBCMxer6lEo4awdHbU0f01pBNLjv8xdpOGKY6', NULL, '2024-09-27 00:04:50', '2024-09-27 00:04:50'),
	(36, 'Aric Block III', 'elsa.hessel@example.com', '2024-09-27 00:04:51', '$2y$12$KmLu7cf3SH0lCszRMAjtO.jmypPkJ9fU7T8cKRumgXPLtIKViKkiq', NULL, '2024-09-27 00:04:51', '2024-09-27 00:04:51'),
	(37, 'Mrs. Margie Treutel', 'nolan.macy@example.com', '2024-09-27 00:04:51', '$2y$12$xiooGtjyx/MAbNydHNnhC.PQiqTTJ1uGeFEA.Z/tUVwED.ZIXW4dm', NULL, '2024-09-27 00:04:51', '2024-09-27 00:04:51'),
	(38, 'Bernita Auer IV', 'huel.anderson@example.com', '2024-09-27 00:04:51', '$2y$12$Hx82y2RUTf8FvOzRFNnmQeZ2Hb4z6cl8S2GBEZKjPwiR5Gx6t.EyS', NULL, '2024-09-27 00:04:51', '2024-09-27 00:04:51'),
	(39, 'Alvah Funk', 'ureichert@example.net', '2024-09-27 00:04:51', '$2y$12$wDXM1kPv7WaYWNB6ll0I/OuNRNxiyYYJA3yV7TE8Z2ozQaQicWL/O', NULL, '2024-09-27 00:04:51', '2024-09-27 00:04:51'),
	(40, 'Olin Hagenes', 'nlowe@example.com', '2024-09-27 00:04:52', '$2y$12$/9kuw6.pFUbMFzTgPdxSVOUTZ5FBJGWRw0O1vMIGuJY9vcgncKD2S', NULL, '2024-09-27 00:04:52', '2024-09-27 00:04:52'),
	(41, 'Arne Koelpin Sr.', 'ross02@example.com', '2024-09-27 00:04:52', '$2y$12$VoC6LV8n.0Zl4aOJ1vDGt.JGFKlGGslfNruL4pF3xzBGfgAALwwNy', NULL, '2024-09-27 00:04:52', '2024-09-27 00:04:52'),
	(42, 'Torrance Volkman', 'uhowell@example.org', '2024-09-27 00:04:52', '$2y$12$xVLXU3VbQXQmFrYWGpwD2uIeKQvTpQQN1RYbcKDpq5e7F22IBG3yq', NULL, '2024-09-27 00:04:52', '2024-09-27 00:04:52'),
	(43, 'Mr. Camryn Lubowitz PhD', 'kshlerin.sonny@example.com', '2024-09-27 00:04:53', '$2y$12$vDWY9BZCxY9sQMp67o4ybetogzvY4rhnKK6nu836x8ApHpDheU76K', NULL, '2024-09-27 00:04:53', '2024-09-27 00:04:53'),
	(44, 'Ayana Olson', 'schuppe.alexanne@example.org', '2024-09-27 00:04:53', '$2y$12$4sxQtYg3k06tZIvZduWIJOHJqg/nBWaJoxicrynxUctC7fcxxs2ve', NULL, '2024-09-27 00:04:53', '2024-09-27 00:04:53'),
	(45, 'Prof. Laverna Windler I', 'nvon@example.net', '2024-09-27 00:04:53', '$2y$12$VyhPD6Bb3U8nbMbsWagsZuyVOhXfKFxo2Ceu9KtgQ9lB0AgOhyS6a', NULL, '2024-09-27 00:04:53', '2024-09-27 00:04:53'),
	(46, 'Gerald Lesch IV', 'konopelski.clara@example.org', '2024-09-27 00:04:53', '$2y$12$KcoW29NOc4OeNEGJ6gVKmObQ0S1Fl4iyGJg3BSCZOdjbAfTrcOfn.', NULL, '2024-09-27 00:04:53', '2024-09-27 00:04:53'),
	(47, 'Maria Dach', 'wlarkin@example.org', '2024-09-27 00:04:54', '$2y$12$xkWvfzUrjzodztpYYVbbU.gRSJQPE/sgeWEmJuRKMNGTraYE2pZsq', NULL, '2024-09-27 00:04:54', '2024-09-27 00:04:54'),
	(48, 'Reggie Kunze', 'nicholas41@example.com', '2024-09-27 00:04:54', '$2y$12$v/11pXn00lPOiSX.d0HFyOiLWFmkFXDRU6STAicOELSM7F/.nekm.', NULL, '2024-09-27 00:04:54', '2024-09-27 00:04:54'),
	(49, 'Jordyn Gutmann', 'spinka.vivian@example.org', '2024-09-27 00:04:54', '$2y$12$VI1fGiMN2I5BW6RttFWC2u66d8hPDkfg8gIHQizR3JODj.AQ70qUW', NULL, '2024-09-27 00:04:54', '2024-09-27 00:04:54'),
	(50, 'Misty Carter', 'donnelly.annamae@example.org', '2024-09-27 00:04:55', '$2y$12$13OOUenAwzgfnll6G8oXROLRURoCSyUrwfrnOcgVc.UWa2EVw4IoC', NULL, '2024-09-27 00:04:55', '2024-09-27 00:04:55'),
	(51, 'Laurie Nitzsche', 'dorothea88@example.org', '2024-09-27 00:04:55', '$2y$12$QTjZWd2Hcz1lHbMY3WdfQ.K4/x9LpZRNmzwzgk4BTnJym.cZYrAvO', NULL, '2024-09-27 00:04:55', '2024-09-27 00:04:55');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
