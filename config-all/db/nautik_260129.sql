-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Feb 23, 2026 at 05:49 PM
-- Server version: 8.0.44
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nautik`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
                         `id` bigint NOT NULL,
                         `user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `user_id`) VALUES
                                          (1, 9),
                                          (2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `boat`
--

CREATE TABLE `boat` (
                        `id` bigint NOT NULL,
                        `name` varchar(255) NOT NULL,
                        `registry_number` varchar(20) NOT NULL,
                        `length` double NOT NULL,
                        `beam` double NOT NULL,
                        `draft` double NOT NULL,
                        `boat_type_id` bigint NOT NULL,
                        `user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `boat`
--

INSERT INTO `boat` (`id`, `name`, `registry_number`, `length`, `beam`, `draft`, `boat_type_id`, `user_id`) VALUES
                                                                                                               (8, 'adsfa', 'asdfasdf', 12, 12, 12, 1, 22),
                                                                                                               (9, 'adsfghfa', 'asdfaddgf', 172, 12, 12, 1, 22),
                                                                                                               (10, '12', '2', 21, 12, 2, 1, 22),
                                                                                                               (11, 'hola', '1234', 12, 3, 2, 1, 22),
                                                                                                               (12, 'barlovento', '7a234pa', 12, 3, 2, 1, 22),
                                                                                                               (13, 'barlovento', 'barlovento', 12, 12, 1, 1, 22),
                                                                                                               (14, 'sotavent', '12345', 12, 2, 2, 1, 22),
                                                                                                               (15, 'terra', '12345', 12, 2, 1, 1, 22),
                                                                                                               (16, 'bertasdf', 'berta', 6, 2, 1, 1, 25),
                                                                                                               (17, 'berta', 'berts', 2, 4, 2, 1, 25),
                                                                                                               (18, 'pescallunes', 'masd', 12, 2, 1, 1, 25),
                                                                                                               (19, 'hola', 'hola', 12, 2, 2, 1, 26),
                                                                                                               (20, 'sotavent', '7ª-293-18-23', 12, 3, 1, 1, 26),
                                                                                                               (21, 'hola', 'hola', 12, 4, 1, 1, 27),
                                                                                                               (22, 'miau', 'miaaaauuuu', 12, 3, 2, 1, 28),
                                                                                                               (23, 'alsdfjlañ', 'asdfasdf', 12, 12, 12, 1, 24),
                                                                                                               (24, 'aaaa socorroo', 'me desmayo', 2.2, 5.5, 2.2, 1, 28);

-- --------------------------------------------------------

--
-- Table structure for table `boat_type`
--

CREATE TABLE `boat_type` (
                             `id` bigint NOT NULL,
                             `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `boat_type`
--

INSERT INTO `boat_type` (`id`, `name`) VALUES
    (1, 'motor');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
                           `id` bigint NOT NULL,
                           `start_date` date NOT NULL,
                           `end_date` date NOT NULL,
                           `total_cost` double NOT NULL,
                           `boat_id` bigint NOT NULL,
                           `mooring_id` bigint NOT NULL,
                           `status` varchar(15) NOT NULL,
                           `order_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `start_date`, `end_date`, `total_cost`, `boat_id`, `mooring_id`, `status`, `order_number`) VALUES
                                                                                                                            (1450, '2026-06-02', '2026-06-09', 120, 8, 1, '', ''),
                                                                                                                            (1451, '2026-06-02', '2026-06-09', 120, 8, 2, '', ''),
                                                                                                                            (1452, '2026-06-02', '2026-06-09', 120, 8, 3, '', ''),
                                                                                                                            (1453, '2026-06-04', '2026-06-07', 120, 8, 4, '', ''),
                                                                                                                            (1454, '2026-06-07', '2026-06-13', 512, 8, 11, '', ''),
                                                                                                                            (1455, '2026-06-13', '2026-06-18', 58, 8, 11, '', ''),
                                                                                                                            (1456, '2026-06-13', '2026-06-10', 213, 8, 28, '', ''),
                                                                                                                            (1457, '2026-06-18', '2026-06-30', 213, 8, 29, '', ''),
                                                                                                                            (1458, '2026-06-02', '2026-06-10', 435, 13, 5, '', ''),
                                                                                                                            (1459, '2026-06-02', '2026-06-10', 435, 13, 6, '', ''),
                                                                                                                            (1460, '2026-06-02', '2026-06-10', 435, 13, 7, '', ''),
                                                                                                                            (1461, '2026-06-02', '2026-06-10', 435, 13, 8, '', ''),
                                                                                                                            (1462, '2026-06-02', '2026-06-10', 435, 13, 9, '', ''),
                                                                                                                            (1463, '2026-06-02', '2026-06-10', 435, 13, 10, '', ''),
                                                                                                                            (1464, '2026-06-02', '2026-06-10', 435, 13, 1, '', ''),
                                                                                                                            (1465, '2026-02-02', '2026-02-12', 435, 16, 4, '', ''),
                                                                                                                            (1466, '2026-02-02', '2026-02-11', 435, 16, 5, '', ''),
                                                                                                                            (1467, '2026-02-02', '2026-02-11', 435, 19, 8, '', ''),
                                                                                                                            (1468, '2026-02-02', '2026-02-10', 435, 19, 9, '', ''),
                                                                                                                            (1469, '2026-02-01', '2026-02-09', 435, 20, 10, '', ''),
                                                                                                                            (1470, '2026-02-25', '2026-02-28', 435, 22, 8, '', ''),
                                                                                                                            (1471, '2026-01-05', '2026-01-08', 435, 24, 4, '', ''),
                                                                                                                            (1472, '2026-02-20', '2026-02-23', 435, 22, 4, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `booking_check_in_mooring`
--

CREATE TABLE `booking_check_in_mooring` (
                                            `id` bigint NOT NULL,
                                            `booking_id` bigint NOT NULL,
                                            `mooring_id` bigint NOT NULL,
                                            `check_in_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_invoice_payment`
--

CREATE TABLE `booking_invoice_payment` (
                                           `id` bigint NOT NULL,
                                           `booking_id` bigint NOT NULL,
                                           `invoice_id` bigint NOT NULL,
                                           `payment_id` bigint NOT NULL,
                                           `user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `capability`
--

CREATE TABLE `capability` (
                              `id` bigint NOT NULL,
                              `description` varchar(255) DEFAULT NULL,
                              `name` varchar(255) DEFAULT NULL,
                              `roles_configuration_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `capability`
--

INSERT INTO `capability` (`id`, `description`, `name`, `roles_configuration_id`) VALUES
                                                                                     (1, NULL, NULL, 1),
                                                                                     (2, 'uep de sa colònia', 'cap2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `check_in`
--

CREATE TABLE `check_in` (
                            `id` bigint NOT NULL,
                            `check_in_time` time NOT NULL,
                            `check_out_time` time NOT NULL,
                            `documentation_provided` bigint NOT NULL,
                            `booking_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `check_in_captain_owner`
--

CREATE TABLE `check_in_captain_owner` (
                                          `id` bigint NOT NULL,
                                          `check_in_id` bigint NOT NULL,
                                          `captain_id` bigint NOT NULL,
                                          `owner_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
                        `id` bigint NOT NULL,
                        `name` varchar(50) NOT NULL,
                        `community_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`, `community_id`) VALUES
                                                      (1, 'palma', 1),
                                                      (2, 'alcudia', 1),
                                                      (3, 'calvia', 1);

-- --------------------------------------------------------

--
-- Table structure for table `community`
--

CREATE TABLE `community` (
                             `id` bigint NOT NULL,
                             `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `community`
--

INSERT INTO `community` (`id`, `name`) VALUES
    (1, 'islas_baleares');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
                           `id` bigint NOT NULL,
                           `name` varchar(255) NOT NULL,
                           `vat` varchar(20) NOT NULL,
                           `email` varchar(100) NOT NULL,
                           `phone` varchar(100) NOT NULL,
                           `admin` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `vat`, `email`, `phone`, `admin`) VALUES
    (1, 'mons', 'asdfasdf', 'mons@corp.com', 'b45243882', 2);

-- --------------------------------------------------------

--
-- Table structure for table `company_admin`
--

CREATE TABLE `company_admin` (
                                 `admin_id` bigint NOT NULL,
                                 `id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
                           `id` bigint NOT NULL,
                           `issue_date` date NOT NULL,
                           `due_date` date NOT NULL,
                           `base_amount` double NOT NULL,
                           `tax_rate` double NOT NULL,
                           `total_amount` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
                              `id` int UNSIGNED NOT NULL,
                              `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                              `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
    (1, '2026_01_20_175355_create_sessions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mooring`
--

CREATE TABLE `mooring` (
                           `id` bigint NOT NULL,
                           `number` bigint NOT NULL,
                           `mooring_category_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mooring`
--

INSERT INTO `mooring` (`id`, `number`, `mooring_category_id`) VALUES
                                                                  (1, 100, 1),
                                                                  (2, 101, 1),
                                                                  (3, 102, 1),
                                                                  (4, 103, 2),
                                                                  (5, 104, 2),
                                                                  (6, 105, 2),
                                                                  (7, 106, 2),
                                                                  (8, 107, 3),
                                                                  (9, 108, 3),
                                                                  (10, 110, 3),
                                                                  (11, 109, 4),
                                                                  (12, 110, 4),
                                                                  (13, 111, 4),
                                                                  (14, 112, 4),
                                                                  (15, 113, 4),
                                                                  (16, 114, 4),
                                                                  (17, 115, 4),
                                                                  (18, 116, 4),
                                                                  (19, 117, 5),
                                                                  (20, 118, 5),
                                                                  (21, 119, 5),
                                                                  (22, 120, 5),
                                                                  (23, 121, 5),
                                                                  (24, 122, 5),
                                                                  (25, 123, 5),
                                                                  (26, 124, 6),
                                                                  (27, 125, 6),
                                                                  (28, 126, 7),
                                                                  (29, 127, 7);

-- --------------------------------------------------------

--
-- Table structure for table `mooring_categories`
--

CREATE TABLE `mooring_categories` (
                                      `zone_id` bigint NOT NULL,
                                      `mooring_dimensions_id` bigint NOT NULL,
                                      `id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mooring_categories`
--

INSERT INTO `mooring_categories` (`zone_id`, `mooring_dimensions_id`, `id`) VALUES
                                                                                (1, 2, 1),
                                                                                (1, 3, 2),
                                                                                (2, 1, 3),
                                                                                (2, 2, 4),
                                                                                (2, 3, 5),
                                                                                (3, 1, 6),
                                                                                (3, 3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `mooring_category_price_configuration`
--

CREATE TABLE `mooring_category_price_configuration` (
                                                        `id` bigint NOT NULL,
                                                        `mooring_category_id` bigint NOT NULL,
                                                        `price_configuration_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mooring_category_price_configuration`
--

INSERT INTO `mooring_category_price_configuration` (`id`, `mooring_category_id`, `price_configuration_id`) VALUES
                                                                                                               (8, 1, 1),
                                                                                                               (9, 2, 2),
                                                                                                               (10, 3, 2),
                                                                                                               (11, 4, 3),
                                                                                                               (12, 5, 4),
                                                                                                               (13, 6, 5),
                                                                                                               (14, 7, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mooring_dimensions`
--

CREATE TABLE `mooring_dimensions` (
                                      `id` bigint NOT NULL,
                                      `max_length` bigint NOT NULL,
                                      `max_beam` bigint NOT NULL,
                                      `max_draft` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mooring_dimensions`
--

INSERT INTO `mooring_dimensions` (`id`, `max_length`, `max_beam`, `max_draft`) VALUES
                                                                                   (1, 12, 5, 0),
                                                                                   (2, 14, 5, 0),
                                                                                   (3, 16, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mooring_mooring_status`
--

CREATE TABLE `mooring_mooring_status` (
                                          `id` bigint NOT NULL,
                                          `mooring_id` bigint NOT NULL,
                                          `mooring_status` bigint NOT NULL DEFAULT '1',
                                          `start_date` date NOT NULL,
                                          `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mooring_status`
--

CREATE TABLE `mooring_status` (
                                  `id` bigint NOT NULL,
                                  `status` varchar(255) NOT NULL,
                                  `is_available` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mooring_status`
--

INSERT INTO `mooring_status` (`id`, `status`, `is_available`) VALUES
                                                                  (1, 'available', 1),
                                                                  (2, 'occupied', 0),
                                                                  (3, 'maintenance', 0);

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
                         `id` bigint NOT NULL,
                         `person_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`id`, `person_id`) VALUES
                                            (1, 1),
                                            (2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
                           `id` bigint NOT NULL,
                           `issue_date` date NOT NULL,
                           `total_amount` double NOT NULL,
                           `last_numbers_of_card` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
                          `id` bigint NOT NULL,
                          `first_name` varchar(255) NOT NULL,
                          `last_name` varchar(255) NOT NULL,
                          `identification_document` varchar(20) NOT NULL,
                          `birth_date` date NOT NULL,
                          `is_captain` tinyint(1) DEFAULT '0',
                          `navigation_license` varchar(45) DEFAULT NULL,
                          `is_owner` tinyint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`id`, `first_name`, `last_name`, `identification_document`, `birth_date`, `is_captain`, `navigation_license`, `is_owner`) VALUES
                                                                                                                                                    (1, 'testPErson', 'lastLaravel', 'userLaravel', '2025-10-25', NULL, NULL, NULL),
                                                                                                                                                    (2, 'personLaravel', 'personFirstName', '123123132', '2002-02-14', 1, NULL, NULL),
                                                                                                                                                    (5, 'personLaravel', 'personFirstName', '1923123132', '2002-02-14', 0, '1234567890', 0),
                                                                                                                                                    (16, 'midadasas', 'zuruasllete', 'add8da65646231', '2024-04-23', 0, 'dfahsdfasdiqdf', 0),
                                                                                                                                                    (17, 'midadasas', 'zuruasllete', 'add8da65d646231', '2024-04-23', 0, 'dfahsdfasdiqdf', 1),
                                                                                                                                                    (18, 'midadasas', 'zuruasllete', 'abd8da65d646231', '2024-04-23', 1, 'dfahsdfasdiqdf', 0),
                                                                                                                                                    (19, 'med', 'lemr', '12345jjs11234', '2002-04-14', 0, NULL, 1),
                                                                                                                                                    (21, 'devTest', 'adsf', 'adsfasdfasdf717', '2002-02-10', 0, NULL, 1),
                                                                                                                                                    (22, 'moha', 'moha', '1234567890h', '2002-10-14', 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
                                          `id` bigint NOT NULL,
                                          `token` varchar(255) DEFAULT NULL,
                                          `tokenable_id` bigint DEFAULT NULL,
                                          `name` varchar(255) DEFAULT NULL,
                                          `abilities` varchar(255) DEFAULT NULL,
                                          `last_used_at` timestamp NULL DEFAULT NULL,
                                          `created_at` timestamp NULL DEFAULT NULL,
                                          `updated_at` timestamp NULL DEFAULT NULL,
                                          `expires_at` date DEFAULT NULL,
                                          `tokenable_type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `token`, `tokenable_id`, `name`, `abilities`, `last_used_at`, `created_at`, `updated_at`, `expires_at`, `tokenable_type`) VALUES
                                                                                                                                                                          (1, 'a21ca568b81cb9b663402542afc161ea6e33550e7767078d40017fd6f44b246d', 20, '-AuthToken', '[\"*\"]', NULL, '2026-02-03 07:41:03', '2026-02-03 07:41:03', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (2, '8bfda4bd666169b17ed9dceefc4278cc48984dfedd3369e249f72a7d31704e18', 20, '-AuthToken', '[\"*\"]', NULL, '2026-02-03 07:58:49', '2026-02-03 07:58:49', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (3, '2fd35338f02e05ce318a1e2e8bf885087bfa7a9e89e686ad4770e51199ee990a', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-05 22:30:04', '2026-02-05 22:30:04', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (4, '3a26ed15512b67115818460701117b46501664633dd9643cb75c6ccd732a3c63', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-05 22:30:04', '2026-02-05 22:30:04', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (5, '78de4a31022bca87b1c5ad782c78566f01789061aa2624b57883105a0514238e', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-05 22:30:26', '2026-02-05 22:30:26', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (6, 'e9867487254a0c04cc5310115163f22cd3e0ce830baef772ecf3285d279fc4cf', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-05 22:30:50', '2026-02-05 22:30:50', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (7, 'd00ae5c2c5dc262d6084d98ec5b57581f04a2a4c096d213dff8b723f828c7a1c', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-05 22:33:49', '2026-02-05 22:33:49', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (8, '5495039022598e81ee381ab7c37d05706900e3fbdbffb53f95e96e686a4376f6', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-05 22:33:50', '2026-02-05 22:33:50', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (9, 'f1c12572996737ef9cdaa9d7f1043d97f6e3645dd9dacb801dff848915bc3980', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 07:31:19', '2026-02-06 07:31:19', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (10, '1f8288de21593a9cab06aaa8bde1e960e435ae9354885e574d647915a3876089', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 07:37:11', '2026-02-06 07:37:11', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (11, '2113386c3b22800cb1e040e909de0b4a391136f4ed0084d745d02b487763b76d', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 07:42:00', '2026-02-06 07:42:00', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (12, '09dc92c600919c5386288ad5704665639aaa21a68e15f3ee6672b4784a1dc6fd', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 07:45:29', '2026-02-06 07:45:29', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (13, '9488303ff10e99bb85f8b59d618bd9967291d7030e8f65e101261b096854cc16', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 08:40:14', '2026-02-06 08:40:14', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (14, 'c892dc7dd867bd2c91295c6b631ae56e2e07b92b5254c1bd1246f3f9c54a1099', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 08:52:45', '2026-02-06 08:52:45', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (15, '0ed395a2b6efbbd2b720bdc4ae1e9aff492cfd6c3477e2486be292379e8e4e43', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 09:08:36', '2026-02-06 09:08:36', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (16, '53fd4663da2ab3eb0ac7bf23d60f078a946b236238209380226157765e512337', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 09:09:34', '2026-02-06 09:09:34', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (17, '43244104162c1bcaa73f2de94c56dce03484c250bd0a76e18f62549ce6680137', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 09:10:18', '2026-02-06 09:10:18', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (18, '0d5afd1ad2a9fb5d2da14d403bf6843e31f9bb5b245b1da239ec759f53e659d6', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 09:10:54', '2026-02-06 09:10:54', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (19, '7895193a0176d1b95681b3c14a7ec72769756e203ca4b9bf9b6b0dcf49258088', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 10:31:02', '2026-02-06 10:31:02', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (20, '9c63c1faa003e185cd917371806e6d48c7beb9a1bc271fc1404acac1452d245c', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 12:15:38', '2026-02-06 12:15:38', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (21, 'efa3d862caa91d3195aa38b97d254bf23554f19048d9b01e62cac8061e6cda15', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 12:15:39', '2026-02-06 12:15:39', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (22, 'a0bd294eb81972dbe64b50f5175bc882283a2b2e0263fcd99ed4cc5538c262b3', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 12:18:18', '2026-02-06 12:18:18', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (23, 'c580c7b0b4fcee25296b622b0933df66aada9902591da9db10e602b393940b40', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 12:18:18', '2026-02-06 12:18:18', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (24, '6c4323407cf805dd7dd084210a97b99e43cbf9821f49402c1baf2f8d0b2c9e02', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 12:19:01', '2026-02-06 12:19:01', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (25, '20e3fc2f4658c0cae708b6eea79f2bb6774a1509eb82f99cf18d97cc9eeaaba1', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 12:19:04', '2026-02-06 12:19:04', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (26, '8840333edf6d6b85220a8bd69bc246c8cd8421e64f272a6ea151ff35db7309cd', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 12:45:44', '2026-02-06 12:45:44', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (27, '394e920af0ac4974836dd07b8906a938cd23b59e32ea1fce8ebc046669e34b4c', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 12:50:48', '2026-02-06 12:50:48', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (28, 'db84135f75626938e930d035d7c11c206c3e7ba0c3b13defc6c13df012338ef1', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 12:51:09', '2026-02-06 12:51:09', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (29, '7700a2520fba36fb1f3d55e22c99faacd745f09cc5690c6cca470ca8c0145338', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 12:51:17', '2026-02-06 12:51:17', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (30, '3c128263961658d3c432eff6973ad01fa57454b640f8fda66ccd2efec2f844a2', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 12:55:17', '2026-02-06 12:55:17', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (31, 'd4e79d896d7dad584ad90f232bd3334da92c6fb46996728bc2071bef9af028b6', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 13:20:34', '2026-02-06 13:20:34', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (32, '30da80647a3191e37c95cc13819b421aac5b9a6efe25ba9c691af14b85247355', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 13:24:05', '2026-02-06 13:24:05', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (33, 'f20355434259296114bc3e5ececef2a65d860c6ddd65f96b2a76e0c32b415206', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 13:37:49', '2026-02-06 13:37:49', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (34, 'ea5256bb5a2401aff5da4a7fb59746a240236b67f991f79d5d50350f71384374', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 14:11:12', '2026-02-06 14:11:12', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (35, '82ac0c2571671c0a26e0bd8356e671ff9eb618cf344fac8c61d08c959def0dfe', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 15:17:21', '2026-02-06 15:17:21', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (36, '9b6470e78e2ec1c88b54501389bb372c07619ea030cf99101d13704623535ecf', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 15:18:00', '2026-02-06 15:18:00', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (37, '92e49a1fee3dad0a472b631ac5067d6df6ec351e9e4dede79ef5c3fb82511cc0', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 15:19:17', '2026-02-06 15:19:17', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (38, '66c3b36ced12dd8dba3d09c4bdbc0d1477819d41ee6af1349da07141e9fbbca9', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 15:28:23', '2026-02-06 15:28:23', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (39, '17f12f5661e1312d4680beb1013829ee65ded1a638ac2b29372099667a0111d2', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 15:55:24', '2026-02-06 15:55:24', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (40, '63c126cd66325167c2409745b7ed017b2db445efa82ca73ade491d789e14d87b', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 15:56:22', '2026-02-06 15:56:22', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (41, '69d0045713a88e2f32a46398d98f3b44b3a05d2f7e88f7803f3d04c0921e7f3c', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 15:58:14', '2026-02-06 15:58:14', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (42, '0a4f973b25f587c27c82ec1ca724e231b425d7d9b1983bfbfb833a7c58843688', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 16:24:49', '2026-02-06 16:24:49', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (43, 'addf8265a7a4a9648f4017e1192557588e48012a294822ed649d096ccf1a790e', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-06 17:38:43', '2026-02-06 17:38:43', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (44, '13fdbb193c2e92a21472a43ed4e91df97c593e3942e1036dc0fa26b26eca1b72', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-07 12:12:32', '2026-02-07 12:12:32', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (45, '60c3aa97f170489a450b98572b51ca04e57622f94c1311346d535f141c0f0774', 19, '-AuthToken', '[\"*\"]', NULL, '2026-02-07 14:58:38', '2026-02-07 14:58:38', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (46, 'a121a5608a0732ac3f51aa8ba8d5eadcb9bf1d21ad50c0314c3d32146c715d6d', 21, '-AuthToken', '[\"*\"]', NULL, '2026-02-08 08:12:02', '2026-02-08 08:12:02', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (47, '36bc2954ef4f81ce49b6f11d4b2ff762444eb76e856577b4df85f74e3101bbf4', 22, '-AuthToken', '[\"*\"]', '2026-02-08 18:21:50', '2026-02-08 17:27:46', '2026-02-08 18:21:50', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (48, 'a712e70cdb823ab4cc9b4c757995400fca08810dd6b0a8d065e55d1f83a331c0', 20, '-AuthToken', '[\"*\"]', '2026-02-08 19:37:02', '2026-02-08 19:32:07', '2026-02-08 19:37:02', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (49, 'a0c62f02ee1bf57289d8e66ba9a81bc4c2a4d5c089f3acda0d595d7758e87fad', 23, '-AuthToken', '[\"*\"]', '2026-02-09 08:14:41', '2026-02-08 19:38:01', '2026-02-09 08:14:41', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (50, '3762965ded5d6f4013a12ff84ebb307c0a6be85a30aea0fb89501fc341353cca', 24, '-AuthToken', '[\"*\"]', '2026-02-09 10:37:11', '2026-02-09 10:34:25', '2026-02-09 10:37:11', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (51, '8dd8061ecb1425ed7a69ebc91cc2c9f0f8077cf955576af93a143b82439ffc76', 23, '-AuthToken', '[\"*\"]', '2026-02-09 10:43:49', '2026-02-09 10:38:34', '2026-02-09 10:43:49', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (52, 'a4ed1eb019cd7bedff0bb9559a2ed42ca4d4146004a4e9c54eb25c66d8b54cdf', 20, '-AuthToken', '[\"*\"]', NULL, '2026-02-10 19:46:44', '2026-02-10 19:46:44', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (53, '696499fbc8e2de548aa0e4aee3d893f11d8a3aa80f91251d9b4ffb12651b84e6', 25, '-AuthToken', '[\"*\"]', '2026-02-11 20:44:32', '2026-02-11 20:44:12', '2026-02-11 20:44:32', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (54, '1eb12ce631c122acaba97dce9fafe6d756f1d3aa5af426aff95f636350fb6ddf', 25, '-AuthToken', '[\"*\"]', '2026-02-11 20:46:53', '2026-02-11 20:45:32', '2026-02-11 20:46:53', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (55, '116bffb1a240981170ffc9211fae16d0457a044f978353bdd07c48ab8ced6987', 25, '-AuthToken', '[\"*\"]', '2026-02-12 07:07:01', '2026-02-11 21:14:02', '2026-02-12 07:07:01', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (56, 'b8f3fb219d805dd3196824f446e39583f6bb77e32d6413dcec43976b7dcc720a', 25, '-AuthToken', '[\"*\"]', NULL, '2026-02-12 07:28:59', '2026-02-12 07:28:59', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (57, 'b7f00a9bc20cf480c178a04c172dfa31ff7b1e262f0c4c2a47998493f249de6c', 25, '-AuthToken', '[\"*\"]', NULL, '2026-02-12 07:30:20', '2026-02-12 07:30:20', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (58, '70b468e08211bbeec0a55231034400202471cd1d2f388596ccc8783fd652442b', 25, '-AuthToken', '[\"*\"]', NULL, '2026-02-12 07:32:14', '2026-02-12 07:32:14', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (59, '2b335cca5ef07c4b0aa77ccbfa2385906294cb46a3a4c755649d574257ba3d14', 25, '-AuthToken', '[\"*\"]', NULL, '2026-02-12 07:33:05', '2026-02-12 07:33:05', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (60, '62af2a0fd33e1372a235d297d0ea254c470e88082efee68c9e0cbab0a69b3506', 25, '-AuthToken', '[\"*\"]', NULL, '2026-02-12 07:33:19', '2026-02-12 07:33:19', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (61, 'c63e738f73ec34532f4cb6567d29df3ab84d74c991ee085ef9bc88ad91af8b09', 25, '-AuthToken', '[\"*\"]', NULL, '2026-02-12 07:38:19', '2026-02-12 07:38:19', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (62, 'bd42eab9f92378eed080b1b585bab387151ba4dc871e9e87bed2ff01d3ce51f8', 25, '-AuthToken', '[\"*\"]', NULL, '2026-02-12 07:38:57', '2026-02-12 07:38:57', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (63, 'b41e37050121d8a5680d48d5cc4688e3d6881af6473d0faad751249bff8c3909', 25, '-AuthToken', '[\"*\"]', NULL, '2026-02-12 07:40:22', '2026-02-12 07:40:22', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (64, '10b9df6c47e801c481aaac5dc4f7562aedf9a0d233262ce2bfa6dab1051a1b16', 25, '-AuthToken', '[\"*\"]', NULL, '2026-02-12 07:41:05', '2026-02-12 07:41:05', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (65, 'bacc0ba921e6441deba08ea1ec65e6c4dc3304c35111d33025d1b0dec301e357', 25, '-AuthToken', '[\"*\"]', NULL, '2026-02-12 07:41:10', '2026-02-12 07:41:10', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (66, 'fa639cfc80bc6bcf12ccbca39d63788fc30c41193b33254df46d5c2062477093', 25, '-AuthToken', '[\"*\"]', NULL, '2026-02-12 07:42:15', '2026-02-12 07:42:15', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (67, 'b82c89b9977d6cbed9ce1a8bba57fe4654b467f294994c58643abc8513e82f6c', 25, '-AuthToken', '[\"*\"]', NULL, '2026-02-12 07:43:09', '2026-02-12 07:43:09', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (68, '0438eff16048059bd36d2d854b2c12ef71b3eed644aac2e9b6f30d9b56095a5c', 25, '-AuthToken', '[\"*\"]', NULL, '2026-02-12 07:54:01', '2026-02-12 07:54:01', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (69, '133c035296da2260e699b5b076562eaf4cb37cea12840dd512f9a393b9951db2', 25, '-AuthToken', '[\"*\"]', NULL, '2026-02-12 07:54:20', '2026-02-12 07:54:20', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (70, 'd2ed5dbda46bfe1634740bb2de891c29ce8581860ae8797e36e83497ba24cc8c', 25, '-AuthToken', '[\"*\"]', NULL, '2026-02-12 07:55:18', '2026-02-12 07:55:18', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (71, 'a431b02f1a48d4b8ab9091a4f348adb2cc51584dcd618a633737215b9774f100', 25, '-AuthToken', '[\"*\"]', NULL, '2026-02-12 07:55:54', '2026-02-12 07:55:54', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (72, '21fc5029b3afba3cbfefe7ecd4073aca17ba2fe5fcc1a5784f0d117b6722afef', 25, '-AuthToken', '[\"*\"]', NULL, '2026-02-12 07:56:52', '2026-02-12 07:56:52', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (73, 'cd122dd2816e766be6710e02315c83b0485e6eb85696b3d1c2792f7ef5a63524', 25, '-AuthToken', '[\"*\"]', NULL, '2026-02-12 07:56:53', '2026-02-12 07:56:53', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (74, 'b753bdc0314b37ea6a709aef8ffcc1366d7aaa9b37b330a05fa15db3ce055cdb', 25, '-AuthToken', '[\"*\"]', NULL, '2026-02-12 07:56:57', '2026-02-12 07:56:57', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (75, 'e4fb814d77cfc684fe0329b98a859129a5a9811e5097f26ada0b28ebbe86f949', 25, '-AuthToken', '[\"*\"]', NULL, '2026-02-12 07:56:58', '2026-02-12 07:56:58', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (76, 'ca74d0da8ec6b5128e3b6dfeb83071364d1b50615305185d0e1501fdb23b5361', 25, '-AuthToken', '[\"*\"]', NULL, '2026-02-12 07:57:01', '2026-02-12 07:57:01', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (77, '84cc3596464ee94a4fe9a89b271f175375696920d03102a9b29fe74ee1549ccc', 25, '-AuthToken', '[\"*\"]', NULL, '2026-02-12 07:57:14', '2026-02-12 07:57:14', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (78, 'bc2cb9e4c5595d56b209ef008db38df3a32d78b9dbba7ad6b2211d6d6a93f4b5', 25, '-AuthToken', '[\"*\"]', NULL, '2026-02-12 07:57:15', '2026-02-12 07:57:15', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (79, 'd1b1c70e0c06d51fd8b068bd5d35f58318d026de8ed8a93c5e9bc2a7f12d4364', 25, '-AuthToken', '[\"*\"]', NULL, '2026-02-12 07:57:15', '2026-02-12 07:57:15', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (80, 'b2366f2f36db3ad10c8fc96a184391f27682aeddd49394441648624c35265ad6', 25, '-AuthToken', '[\"*\"]', '2026-02-12 10:30:38', '2026-02-12 07:57:45', '2026-02-12 10:30:38', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (81, '3fa376ad532a1643305e694294e8179998756c6ffc2b7413f97157577624f823', 25, '-AuthToken', '[\"*\"]', '2026-02-15 16:51:51', '2026-02-14 11:00:36', '2026-02-15 16:51:51', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (82, '9bc2802724094c6574ed81db653fc15f5039e1909a68e48b8b23356d39e63e03', 26, '-AuthToken', '[\"*\"]', NULL, '2026-02-16 08:36:20', '2026-02-16 08:36:20', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (83, 'e26da5e0c8670f3b63fd3c009592f139c8a518e33b03c6dfb91243751fd99307', 26, '-AuthToken', '[\"*\"]', NULL, '2026-02-16 08:39:00', '2026-02-16 08:39:00', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (84, '32657c516baa2f357a7560d6cd634f593b70e4a5605163203b9711010356fade', 26, '-AuthToken', '[\"*\"]', NULL, '2026-02-16 08:47:41', '2026-02-16 08:47:41', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (85, 'ff06c873e0a8c5b1fe1f2b7adfff9cdd7635201af3443667e9b966b5a767b2dc', 26, '-AuthToken', '[\"*\"]', '2026-02-16 08:49:53', '2026-02-16 08:49:19', '2026-02-16 08:49:53', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (86, '01d12c8d33ff457e8006875dc006a1c9a13001fb4d386e40c67b37217265db8b', 26, '-AuthToken', '[\"*\"]', '2026-02-16 09:54:49', '2026-02-16 08:52:28', '2026-02-16 09:54:49', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (87, '61012b28f9ab100cdbd35804886f9f3bdea56cbc62a733d98a1379dba8028046', 26, '-AuthToken', '[\"*\"]', '2026-02-16 10:19:36', '2026-02-16 09:56:24', '2026-02-16 10:19:36', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (88, 'd895fa985d6bf0b1f1f33f850a626f72bd3804066dca389fab62e56ea74d9f39', 26, '-AuthToken', '[\"*\"]', '2026-02-16 16:41:21', '2026-02-16 13:49:23', '2026-02-16 16:41:21', NULL, 'App\\Models\\users\\User'),
                                                                                                                                                                          (89, '8da9a73db6da80eae8a77ab72aca6bec2b9bcf991cf669d6dfcf37be5639668e', 27, '-AuthToken', '[\"*\"]', '2026-02-16 17:35:54', '2026-02-16 17:16:30', '2026-02-16 17:35:54', NULL, 'App\\Models\\users\\User');

-- --------------------------------------------------------

--
-- Table structure for table `port`
--

CREATE TABLE `port` (
                        `id` bigint NOT NULL,
                        `name` varchar(255) NOT NULL,
                        `city_id` bigint NOT NULL,
                        `company_id` bigint NOT NULL,
                        `roles_configuration_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `port`
--

INSERT INTO `port` (`id`, `name`, `city_id`, `company_id`, `roles_configuration_id`) VALUES
                                                                                         (1, 'rcnp', 1, 1, NULL),
                                                                                         (2, 'adriano', 3, 1, NULL),
                                                                                         (3, 'alcudia', 2, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `port_admin`
--

CREATE TABLE `port_admin` (
                              `id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `price_configuration`
--

CREATE TABLE `price_configuration` (
                                       `id` bigint NOT NULL,
                                       `min_price` double NOT NULL,
                                       `start_date` date NOT NULL,
                                       `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `price_configuration`
--

INSERT INTO `price_configuration` (`id`, `min_price`, `start_date`, `end_date`) VALUES
                                                                                    (1, 110, '2026-06-01', '2026-06-30'),
                                                                                    (2, 150, '2026-06-01', '2026-06-30'),
                                                                                    (3, 160, '2026-06-01', '2026-06-30'),
                                                                                    (4, 180, '2026-06-01', '2026-06-30'),
                                                                                    (5, 200, '2026-06-01', '2026-06-30'),
                                                                                    (6, 320, '2026-06-01', '2026-06-30');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
                        `id` bigint NOT NULL,
                        `description` varchar(255) DEFAULT NULL,
                        `name` varchar(255) DEFAULT NULL,
                        `roles_configuration_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `description`, `name`, `roles_configuration_id`) VALUES
                                                                               (1, 'uep', 'firstRole', 1),
                                                                               (2, 'uep de sa colònia', 'firstRole', 1),
                                                                               (4, 'uep de sa colònia', 'sec', 1);

-- --------------------------------------------------------

--
-- Table structure for table `role_capability`
--

CREATE TABLE `role_capability` (
                                   `role_id` bigint NOT NULL,
                                   `capability_id` bigint NOT NULL,
                                   `id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_configuration`
--

CREATE TABLE `role_configuration` (
                                      `id` bigint NOT NULL,
                                      `name` varchar(255) DEFAULT NULL,
                                      `company_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `role_configuration`
--

INSERT INTO `role_configuration` (`id`, `name`, `company_id`) VALUES
                                                                  (1, 'firstConf', 1),
                                                                  (2, 'secondConf', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
                            `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                            `user_id` bigint UNSIGNED DEFAULT NULL,
                            `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                            `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                            `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
                                                                                                     ('3BvkTF169hMvqKn3uW7o7RvFCozSvTevY3jWKcl0', NULL, '172.16.58.89', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidEVkRkQwM3QyeExCUFNweFhlanFPVk45bUJ1M1RuUEJ3VGlUc3dnRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly8xNzIuMTYuNjIuNTU6ODA4MCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769412313),
                                                                                                     ('Cy1xjiZMUMNa9O1Zf1Y84LzYbBHuKBHbOrHnFSDx', NULL, '192.168.32.1', 'PostmanRuntime/7.49.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1FqT2NoQW1wcWQydEZmSk5vQzV1Q2xSQk9YZmliYUFJcFgyaWNnQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769096647),
                                                                                                     ('daZ2iMOqD8ycewMmppjBCJ9izstENDZjl5xQTPum', NULL, '172.16.58.89', 'Avast Antivirus', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzlBN1FiQWVna2JtbGthMDliMzJCTXlqU0tYM0l0RHhWYktwUUdOeiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly8xNzIuMTYuNjIuNTU6ODA4MCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769412268),
                                                                                                     ('GEw4GqR0y7R81BCxNzyQ5oOJRGpHNvm0c7ClhKrk', NULL, '192.168.32.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzFOTWE3Rm9PSzBIWkpZSHFwWTJCRXMxbTV3MTBscDFzY2pNQ2hEVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769333627),
                                                                                                     ('OIXyo0FbMNZGHJjLysHflgGac1S69TLQgLo4TTqX', NULL, '172.30.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzJidzdmbWhrOGc3VDRER0RzbTBpUGRJOVV5U0pyUnk4RW0wSGJDZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1768936201),
                                                                                                     ('Ps3LsLOHuUokhE2wvu9T23nt93yvN8gIgOndIMuN', NULL, '172.16.58.89', 'Avast Antivirus', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiamFTZkRaNEtmckRmMzV2MTV0TjZ2MzRqSXpGcFFpUlk2MGhpNURncCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly8xNzIuMTYuNjIuNTU6ODA4MCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769672695),
                                                                                                     ('RdDtlNDB40G8pKAFnaMOZJ4cfT8TFDtnRQCYXoFm', NULL, '192.168.32.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXRFaUc0TkRZeWNCWm1lNnRQeTNkVngzaUFhWWkwMjBlZWozamdneiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769012750),
                                                                                                     ('sEb0snI9UDl2avRQlE7iJQT194u1iDkxkxu7ElMb', NULL, '192.168.32.1', 'PostmanRuntime/7.49.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTG9EOE1kYVdkY2ZyMGo4MnVvdU82WWdiQUw4aW82b2ozT1VKTVQyYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769072335),
                                                                                                     ('TYLKzOKBrPsb7mS5vWg8UVDWYitJ2UijV1jaAaHz', NULL, '172.16.58.89', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXpkYWV3SEloRWp3b0ZmWE5CQW1UN053cHlPOXljQmRRdTFLdjBQNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly8xNzIuMTYuNjIuNTU6ODA4MCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769672740),
                                                                                                     ('WyFqvP03JuyVz40ADWMoEiAltdJFTHrANNebJVC2', NULL, '192.168.32.1', 'PostmanRuntime/7.49.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVJ1NmVDdWcxMTF5c2hrUUpzdE9NUnBOUDd5cWtDbVgwWE13S0NHaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769341156);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
                        `id` bigint NOT NULL,
                        `email` varchar(255) NOT NULL,
                        `password` varchar(255) DEFAULT NULL,
                        `role_id` bigint DEFAULT NULL,
                        `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                        `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                        `user_name` varchar(255) NOT NULL,
                        `first_name` varchar(45) DEFAULT NULL,
                        `last_name` varchar(45) DEFAULT NULL,
                        `identification_document` varchar(45) DEFAULT NULL,
                        `birth_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `role_id`, `created_at`, `updated_at`, `user_name`, `first_name`, `last_name`, `identification_document`, `birth_date`) VALUES
                                                                                                                                                                           (9, 'mons@corp.com', '1234567890', NULL, NULL, '2026-02-08 22:43:29', 'test-spring', NULL, NULL, NULL, NULL),
                                                                                                                                                                           (10, 'mons@corp.com', '747281231', NULL, NULL, '2026-01-19 20:30:26', 'midasadminoso', NULL, NULL, NULL, NULL),
                                                                                                                                                                           (15, 'laravel@nautik.com', '$2y$12$VggINPXPh2BQtQ/uajciFeFq3h90L0WS1Q/Rt.dKGWjw95Wc7VniO', NULL, '2026-01-26 18:54:53', '2026-01-26 18:54:53', 'kkddkk', NULL, NULL, NULL, NULL),
                                                                                                                                                                           (17, 'larassvel@nautik.com', 'asdkjhkjhkjf', NULL, '2026-01-26 18:56:44', '2026-01-26 18:57:11', 'kkddddkk', NULL, NULL, NULL, NULL),
                                                                                                                                                                           (18, 'mons@corp.com', '$2y$12$JnUBhPdXirrKVbGB793MR.EqhYYUZhqlXECKwv6UO3QBwr3ekeMhe', NULL, '2026-01-27 15:27:53', '2026-01-27 15:27:53', 'midass ddaadmin', NULL, NULL, NULL, NULL),
                                                                                                                                                                           (19, 'monds@corp.com', '$2y$12$Nsm8pgnaaYuxbWYlkLdODeYiN4E9IAsL8zbbrh1nrkEmurOkQh/g2', NULL, '2026-02-01 23:30:28', '2026-02-01 23:30:28', 'mddaidass ddaadmin', NULL, NULL, NULL, NULL),
                                                                                                                                                                           (20, 'testauth@mons.com', '$2y$12$pbiCuVWCIRsfblOl146uVOyUC3jd4bcm.PZ6fDiS1Zw6K5raVsE4e', NULL, '2026-02-03 07:13:29', '2026-02-03 07:13:29', 'testauth', NULL, NULL, NULL, NULL),
                                                                                                                                                                           (21, 'email@adf.com', '$2y$12$uzukUe9R/AfiC4Q78SJG0u3Q20IoRp0VRyvp98Q0jzYs7OOmYEYdW', NULL, '2026-02-08 08:12:02', '2026-02-08 08:12:02', 'moha', NULL, NULL, NULL, NULL),
                                                                                                                                                                           (22, 'adfasdf@kiko.com', '$2y$12$PFTenLyGISZjD78J9rsP5Oi4vNlOWwHfjgwK5koP.XN8ACq8mZ.ty', NULL, '2026-02-08 17:27:46', '2026-02-08 17:27:46', 'midas', NULL, NULL, NULL, NULL),
                                                                                                                                                                           (23, 'test@boats.com', '$2y$12$vGDM5jGT2QCHhfvLWoW2YOls6TB9hA7qXzhjrE00Bt6JotitS69S6', NULL, '2026-02-08 19:38:01', '2026-02-08 19:38:01', 'alvaro', NULL, NULL, NULL, NULL),
                                                                                                                                                                           (24, 'test@gmail.com.uk', '$2y$12$RJb8sInNIjFzYcVGS/ZVO.gGpmOoTAXSUwSRQaNP15iLMX9XRzLSO', NULL, '2026-02-09 10:34:25', '2026-02-09 10:34:25', 'usernameTest', NULL, NULL, NULL, NULL),
                                                                                                                                                                           (25, 'med@md.com', '$2y$12$QUCt8TLUw7Zu22xMLF1JRuGzLVK82DgPxQUp2nLMEC..yMq1CWwLq', NULL, '2026-02-11 20:44:12', '2026-02-11 20:44:12', 'jumanji', 'test', 'testest', '98765asdfasdf22', '2002-10-14'),
                                                                                                                                                                           (26, 'mlemrissani1056@alumnes.politecnicllevant.cat', NULL, NULL, NULL, '2026-02-15 21:39:34', 'mlemrissani1056@alumnes.politecnicllevant.cat', 'Mohammed Lemrissani Darkaoui Ifc33b', 'Mohammed Lemrissani Darkaoui Ifc33b', NULL, NULL),
                                                                                                                                                                           (27, 'aasdf@gmail.com', '$2y$12$jIxnX3aeqz2sr81RFvOPZeJ9ikCn1L2365WP4NMfTiJB2AF/goFKm', NULL, '2026-02-16 17:16:30', '2026-02-16 17:16:30', 'masd', 'gdx', 'lmer', 'asdfasdf', '2002-10-12'),
                                                                                                                                                                           (28, 'prubio82@alumnes.politecnicllevant.cat', '$2a$10$FEPC5Mn7iVTPnbbVAJ..OuznGbq2vdNCyNKKEIJrkCv11bOcf5ZIK', NULL, NULL, '2026-02-19 09:10:27', 'pedrito', 'Pedro Rubio', 'Rigo Ifc33b', 'asdfasdfasdf', '0543-04-23');

-- --------------------------------------------------------

--
-- Table structure for table `user_person`
--

CREATE TABLE `user_person` (
                               `id` int NOT NULL,
                               `user_id` bigint NOT NULL,
                               `person_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_person`
--

INSERT INTO `user_person` (`id`, `user_id`, `person_id`) VALUES
                                                             (1, 9, NULL),
                                                             (2, 9, NULL),
                                                             (3, 9, NULL),
                                                             (4, 9, NULL),
                                                             (5, 9, NULL),
                                                             (6, 9, 17),
                                                             (9, 9, 18),
                                                             (10, 22, 19),
                                                             (11, 23, 21),
                                                             (12, 24, 22);

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

CREATE TABLE `zone` (
                        `id` bigint NOT NULL,
                        `name` varchar(100) NOT NULL,
                        `description` varchar(255) NOT NULL,
                        `port_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `zone`
--

INSERT INTO `zone` (`id`, `name`, `description`, `port_id`) VALUES
                                                                (1, 'zone1', 'normal', 1),
                                                                (2, 'zone2', 'lux', 1),
                                                                (3, 'zone3', 'extralux', 1),
                                                                (4, 'lux', 'lux', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
    ADD PRIMARY KEY (`id`,`user_id`),
  ADD UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_port_admin_user_idx` (`user_id`);

--
-- Indexes for table `boat`
--
ALTER TABLE `boat`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_boat_type` (`boat_type_id`),
  ADD KEY `fk_boat_1_idx` (`user_id`);

--
-- Indexes for table `boat_type`
--
ALTER TABLE `boat_type`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_booking_1_idx` (`boat_id`),
  ADD KEY `fk_bookinghjkljhhjkkjh_2_idx` (`mooring_id`);

--
-- Indexes for table `booking_check_in_mooring`
--
ALTER TABLE `booking_check_in_mooring`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_booking_id_1` (`booking_id`),
  ADD KEY `fk_check_in_3` (`check_in_id`),
  ADD KEY `fk_mooring_1` (`mooring_id`);

--
-- Indexes for table `booking_invoice_payment`
--
ALTER TABLE `booking_invoice_payment`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_booking` (`booking_id`),
  ADD KEY `fk_invoice` (`invoice_id`),
  ADD KEY `fk_payment` (`payment_id`),
  ADD KEY `fk_user` (`user_id`);

--
-- Indexes for table `capability`
--
ALTER TABLE `capability`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FKt7hhnnatxko48b59syhftut1p` (`roles_configuration_id`);

--
-- Indexes for table `check_in`
--
ALTER TABLE `check_in`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_booking_id_check_in` (`booking_id`);

--
-- Indexes for table `check_in_captain_owner`
--
ALTER TABLE `check_in_captain_owner`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_check_in` (`check_in_id`),
  ADD KEY `fk_captain_id_idx` (`captain_id`),
  ADD KEY `fk_owner_idx` (`owner_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_city` (`community_id`);

--
-- Indexes for table `community`
--
ALTER TABLE `community`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_company_1_idx` (`admin`);

--
-- Indexes for table `company_admin`
--
ALTER TABLE `company_admin`
    ADD PRIMARY KEY (`admin_id`,`id`),
  ADD UNIQUE KEY `admin_id_UNIQUE` (`admin_id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_company_admin_admin_idx` (`admin_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mooring`
--
ALTER TABLE `mooring`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk_mooring_1jjkj_idx` (`mooring_category_id`);

--
-- Indexes for table `mooring_categories`
--
ALTER TABLE `mooring_categories`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FK4dwafm06bh31myoja3tgwtpme` (`zone_id`),
  ADD KEY `fk_zone_mooring_categories_1_idx` (`mooring_dimensions_id`);

--
-- Indexes for table `mooring_category_price_configuration`
--
ALTER TABLE `mooring_category_price_configuration`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_mooring_zone_price_configuration_1_idx` (`mooring_category_id`),
  ADD KEY `fk_mooring_zone_price_configuration_2_idx` (`price_configuration_id`);

--
-- Indexes for table `mooring_dimensions`
--
ALTER TABLE `mooring_dimensions`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `mooring_mooring_status`
--
ALTER TABLE `mooring_mooring_status`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_mooring_id` (`mooring_status`),
  ADD KEY `fk_mooring_status` (`mooring_id`);

--
-- Indexes for table `mooring_status`
--
ALTER TABLE `mooring_status`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_owner_person_idx` (`person_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identification_document` (`identification_document`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `port`
--
ALTER TABLE `port`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_port_company` (`company_id`),
  ADD KEY `fk_port_city_id` (`city_id`);

--
-- Indexes for table `port_admin`
--
ALTER TABLE `port_admin`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `price_configuration`
--
ALTER TABLE `price_configuration`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FKf5crarhs701vni8h5klxvaos6` (`roles_configuration_id`);

--
-- Indexes for table `role_capability`
--
ALTER TABLE `role_capability`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FKm720c0rj1gb9x8boctqltnh3c` (`capability_id`),
  ADD KEY `FKdg9jxfhgbit0u34e6ql5qf9wo` (`role_id`);

--
-- Indexes for table `role_configuration`
--
ALTER TABLE `role_configuration`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FKo61tfkyw0otu3p3gq1vtfytqc` (`company_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
    ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  ADD KEY `FKn82ha3ccdebhokx3a8fgdqeyy` (`role_id`);

--
-- Indexes for table `user_person`
--
ALTER TABLE `user_person`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_person_1_idx` (`person_id`),
  ADD KEY `fk_user_person_2_idx` (`user_id`);

--
-- Indexes for table `zone`
--
ALTER TABLE `zone`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_zone_port` (`port_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `boat`
--
ALTER TABLE `boat`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `boat_type`
--
ALTER TABLE `boat_type`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1473;

--
-- AUTO_INCREMENT for table `booking_check_in_mooring`
--
ALTER TABLE `booking_check_in_mooring`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_invoice_payment`
--
ALTER TABLE `booking_invoice_payment`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `capability`
--
ALTER TABLE `capability`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `check_in`
--
ALTER TABLE `check_in`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `check_in_captain_owner`
--
ALTER TABLE `check_in_captain_owner`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `community`
--
ALTER TABLE `community`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
    MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mooring`
--
ALTER TABLE `mooring`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `mooring_categories`
--
ALTER TABLE `mooring_categories`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mooring_category_price_configuration`
--
ALTER TABLE `mooring_category_price_configuration`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `mooring_dimensions`
--
ALTER TABLE `mooring_dimensions`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mooring_mooring_status`
--
ALTER TABLE `mooring_mooring_status`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mooring_status`
--
ALTER TABLE `mooring_status`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `port`
--
ALTER TABLE `port`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `price_configuration`
--
ALTER TABLE `price_configuration`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role_capability`
--
ALTER TABLE `role_capability`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `role_configuration`
--
ALTER TABLE `role_configuration`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user_person`
--
ALTER TABLE `user_person`
    MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `zone`
--
ALTER TABLE `zone`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
    ADD CONSTRAINT `fk_port_admin_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `boat`
--
ALTER TABLE `boat`
    ADD CONSTRAINT `fk_boat_type` FOREIGN KEY (`boat_type_id`) REFERENCES `boat_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
    ADD CONSTRAINT `fk_booking_1` FOREIGN KEY (`boat_id`) REFERENCES `boat` (`id`),
  ADD CONSTRAINT `fk_booking_2` FOREIGN KEY (`mooring_id`) REFERENCES `mooring` (`id`);

--
-- Constraints for table `booking_check_in_mooring`
--
ALTER TABLE `booking_check_in_mooring`
    ADD CONSTRAINT `fk_booking_id_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`),
  ADD CONSTRAINT `fk_check_in_3` FOREIGN KEY (`check_in_id`) REFERENCES `check_in` (`id`),
  ADD CONSTRAINT `fk_mooring_1` FOREIGN KEY (`mooring_id`) REFERENCES `mooring` (`id`);

--
-- Constraints for table `booking_invoice_payment`
--
ALTER TABLE `booking_invoice_payment`
    ADD CONSTRAINT `fk_booking` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`),
  ADD CONSTRAINT `fk_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`),
  ADD CONSTRAINT `fk_payment` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `capability`
--
ALTER TABLE `capability`
    ADD CONSTRAINT `FKt7hhnnatxko48b59syhftut1p` FOREIGN KEY (`roles_configuration_id`) REFERENCES `role_configuration` (`id`);

--
-- Constraints for table `check_in`
--
ALTER TABLE `check_in`
    ADD CONSTRAINT `fk_booking_id_check_in` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`);

--
-- Constraints for table `check_in_captain_owner`
--
ALTER TABLE `check_in_captain_owner`
    ADD CONSTRAINT `fk_captain_id` FOREIGN KEY (`captain_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_check_in` FOREIGN KEY (`check_in_id`) REFERENCES `check_in` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_owner` FOREIGN KEY (`owner_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `city`
--
ALTER TABLE `city`
    ADD CONSTRAINT `fk_city` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `company`
--
ALTER TABLE `company`
    ADD CONSTRAINT `FK8encl0565j0q0yn7oglgjv7mu` FOREIGN KEY (`admin`) REFERENCES `admin` (`id`);

--
-- Constraints for table `company_admin`
--
ALTER TABLE `company_admin`
    ADD CONSTRAINT `fk_company_admin` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mooring`
--
ALTER TABLE `mooring`
    ADD CONSTRAINT `fk_mooring_1jjkj` FOREIGN KEY (`mooring_category_id`) REFERENCES `mooring_categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `mooring_categories`
--
ALTER TABLE `mooring_categories`
    ADD CONSTRAINT `FK4dwafm06bh31myoja3tgwtpme` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`),
  ADD CONSTRAINT `fk_zone_mooring_categories_1` FOREIGN KEY (`mooring_dimensions_id`) REFERENCES `mooring_dimensions` (`id`);

--
-- Constraints for table `mooring_category_price_configuration`
--
ALTER TABLE `mooring_category_price_configuration`
    ADD CONSTRAINT `fk_mooring_zone_price_configuration_1` FOREIGN KEY (`mooring_category_id`) REFERENCES `mooring_categories` (`id`),
  ADD CONSTRAINT `fk_mooring_zone_price_configuration_2` FOREIGN KEY (`price_configuration_id`) REFERENCES `price_configuration` (`id`);

--
-- Constraints for table `mooring_mooring_status`
--
ALTER TABLE `mooring_mooring_status`
    ADD CONSTRAINT `fk_mooring_id` FOREIGN KEY (`mooring_status`) REFERENCES `mooring` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_mooring_status` FOREIGN KEY (`mooring_id`) REFERENCES `mooring_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `owner`
--
ALTER TABLE `owner`
    ADD CONSTRAINT `fk_owner_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`);

--
-- Constraints for table `port`
--
ALTER TABLE `port`
    ADD CONSTRAINT `fk_port_city_id` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_port_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role`
--
ALTER TABLE `role`
    ADD CONSTRAINT `FKf5crarhs701vni8h5klxvaos6` FOREIGN KEY (`roles_configuration_id`) REFERENCES `role_configuration` (`id`);

--
-- Constraints for table `role_capability`
--
ALTER TABLE `role_capability`
    ADD CONSTRAINT `FKdg9jxfhgbit0u34e6ql5qf9wo` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `FKm720c0rj1gb9x8boctqltnh3c` FOREIGN KEY (`capability_id`) REFERENCES `capability` (`id`);

--
-- Constraints for table `role_configuration`
--
ALTER TABLE `role_configuration`
    ADD CONSTRAINT `FKo61tfkyw0otu3p3gq1vtfytqc` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
    ADD CONSTRAINT `FKn82ha3ccdebhokx3a8fgdqeyy` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `user_person`
--
ALTER TABLE `user_person`
    ADD CONSTRAINT `fk_user_person_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_user_person_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `zone`
--
ALTER TABLE `zone`
    ADD CONSTRAINT `fk_zone_port` FOREIGN KEY (`port_id`) REFERENCES `port` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;