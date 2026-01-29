-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: nautik_d
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
                         `id` bigint NOT NULL AUTO_INCREMENT,
                         `user_id` bigint NOT NULL,
                         PRIMARY KEY (`id`,`user_id`),
                         UNIQUE KEY `user_id_UNIQUE` (`user_id`),
                         UNIQUE KEY `id_UNIQUE` (`id`),
                         KEY `fk_port_admin_user_idx` (`user_id`),
                         CONSTRAINT `fk_port_admin_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,9),(2,10);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boat`
--

DROP TABLE IF EXISTS `boat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boat` (
                        `id` bigint NOT NULL AUTO_INCREMENT,
                        `name` varchar(255) NOT NULL,
                        `registry_number` varchar(20) NOT NULL,
                        `length` double NOT NULL,
                        `beam` double NOT NULL,
                        `draft` double NOT NULL,
                        `boat_type_id` bigint NOT NULL,
                        `person_id` bigint NOT NULL,
                        PRIMARY KEY (`id`),
                        KEY `fk_boat_type` (`boat_type_id`),
                        KEY `fk_user_id_idx` (`person_id`),
                        CONSTRAINT `fk_boat_type` FOREIGN KEY (`boat_type_id`) REFERENCES `boat_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT `fk_user_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boat`
--

LOCK TABLES `boat` WRITE;
/*!40000 ALTER TABLE `boat` DISABLE KEYS */;
INSERT INTO `boat` VALUES (8,'adsfa','asdfasdf',12,12,12,1,17),(9,'adsfghfa','asdfaddgf',172,12,12,1,18);
/*!40000 ALTER TABLE `boat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boat_type`
--

DROP TABLE IF EXISTS `boat_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boat_type` (
                             `id` bigint NOT NULL AUTO_INCREMENT,
                             `name` varchar(255) DEFAULT NULL,
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boat_type`
--

LOCK TABLES `boat_type` WRITE;
/*!40000 ALTER TABLE `boat_type` DISABLE KEYS */;
INSERT INTO `boat_type` VALUES (1,'motor');
/*!40000 ALTER TABLE `boat_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
                           `id` bigint NOT NULL AUTO_INCREMENT,
                           `start_date` date NOT NULL,
                           `end_date` date NOT NULL,
                           `total_cost` double NOT NULL,
                           `payment_method` bigint NOT NULL,
                           `boat_id` bigint NOT NULL,
                           `booking_status_id` bigint NOT NULL,
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_booking_status`
--

DROP TABLE IF EXISTS `booking_booking_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_booking_status` (
                                          `id` bigint NOT NULL AUTO_INCREMENT,
                                          `booking_id` bigint NOT NULL,
                                          `booking_status_id` bigint NOT NULL,
                                          `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                          PRIMARY KEY (`id`),
                                          KEY `fk_booking_id` (`booking_id`),
                                          KEY `fk_booking_status` (`booking_status_id`),
                                          CONSTRAINT `fk_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                          CONSTRAINT `fk_booking_status` FOREIGN KEY (`booking_status_id`) REFERENCES `booking_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_booking_status`
--

LOCK TABLES `booking_booking_status` WRITE;
/*!40000 ALTER TABLE `booking_booking_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_booking_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_check_in_mooring`
--

DROP TABLE IF EXISTS `booking_check_in_mooring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_check_in_mooring` (
                                            `id` bigint NOT NULL AUTO_INCREMENT,
                                            `booking_id` bigint NOT NULL,
                                            `mooring_id` bigint NOT NULL,
                                            `check_in_id` bigint NOT NULL,
                                            PRIMARY KEY (`id`),
                                            KEY `fk_booking_id_1` (`booking_id`),
                                            KEY `fk_check_in_3` (`check_in_id`),
                                            KEY `fk_mooring_1` (`mooring_id`),
                                            CONSTRAINT `fk_booking_id_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                            CONSTRAINT `fk_check_in_3` FOREIGN KEY (`check_in_id`) REFERENCES `check_in` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                            CONSTRAINT `fk_mooring_1` FOREIGN KEY (`mooring_id`) REFERENCES `mooring` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_check_in_mooring`
--

LOCK TABLES `booking_check_in_mooring` WRITE;
/*!40000 ALTER TABLE `booking_check_in_mooring` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_check_in_mooring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_invoice_payment`
--

DROP TABLE IF EXISTS `booking_invoice_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_invoice_payment` (
                                           `id` bigint NOT NULL AUTO_INCREMENT,
                                           `booking_id` bigint NOT NULL,
                                           `invoice_id` bigint NOT NULL,
                                           `payment_id` bigint NOT NULL,
                                           `user_id` bigint NOT NULL,
                                           PRIMARY KEY (`id`),
                                           KEY `fk_booking` (`booking_id`),
                                           KEY `fk_invoice` (`invoice_id`),
                                           KEY `fk_payment` (`payment_id`),
                                           KEY `fk_user` (`user_id`),
                                           CONSTRAINT `fk_booking` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                           CONSTRAINT `fk_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                           CONSTRAINT `fk_payment` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                           CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_invoice_payment`
--

LOCK TABLES `booking_invoice_payment` WRITE;
/*!40000 ALTER TABLE `booking_invoice_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_invoice_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_status`
--

DROP TABLE IF EXISTS `booking_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_status` (
                                  `id` bigint NOT NULL AUTO_INCREMENT,
                                  `status` varchar(75) NOT NULL,
                                  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_status`
--

LOCK TABLES `booking_status` WRITE;
/*!40000 ALTER TABLE `booking_status` DISABLE KEYS */;
INSERT INTO `booking_status` VALUES (1,'active');
/*!40000 ALTER TABLE `booking_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capability`
--

DROP TABLE IF EXISTS `capability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capability` (
                              `id` bigint NOT NULL AUTO_INCREMENT,
                              `description` varchar(255) DEFAULT NULL,
                              `name` varchar(255) DEFAULT NULL,
                              `roles_configuration_id` bigint DEFAULT NULL,
                              PRIMARY KEY (`id`),
                              KEY `FKt7hhnnatxko48b59syhftut1p` (`roles_configuration_id`),
                              CONSTRAINT `FKt7hhnnatxko48b59syhftut1p` FOREIGN KEY (`roles_configuration_id`) REFERENCES `role_configuration` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capability`
--

LOCK TABLES `capability` WRITE;
/*!40000 ALTER TABLE `capability` DISABLE KEYS */;
INSERT INTO `capability` VALUES (1,NULL,NULL,1),(2,'uep de sa colònia','cap2',1);
/*!40000 ALTER TABLE `capability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_in`
--

DROP TABLE IF EXISTS `check_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check_in` (
                            `id` bigint NOT NULL AUTO_INCREMENT,
                            `check_in_time` time NOT NULL,
                            `check_out_time` time NOT NULL,
                            `documentation_provided` bigint NOT NULL,
                            `booking_id` bigint NOT NULL,
                            PRIMARY KEY (`id`),
                            KEY `fk_booking_id_check_in` (`booking_id`),
                            CONSTRAINT `fk_booking_id_check_in` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_in`
--

LOCK TABLES `check_in` WRITE;
/*!40000 ALTER TABLE `check_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `check_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_in_captain_owner`
--

DROP TABLE IF EXISTS `check_in_captain_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check_in_captain_owner` (
                                          `id` bigint NOT NULL AUTO_INCREMENT,
                                          `check_in_id` bigint NOT NULL,
                                          `captain_id` bigint NOT NULL,
                                          `owner_id` bigint NOT NULL,
                                          PRIMARY KEY (`id`),
                                          KEY `fk_check_in` (`check_in_id`),
                                          KEY `fk_captain_id_idx` (`captain_id`),
                                          KEY `fk_owner_idx` (`owner_id`),
                                          CONSTRAINT `fk_captain_id` FOREIGN KEY (`captain_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                          CONSTRAINT `fk_check_in` FOREIGN KEY (`check_in_id`) REFERENCES `check_in` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                          CONSTRAINT `fk_owner` FOREIGN KEY (`owner_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_in_captain_owner`
--

LOCK TABLES `check_in_captain_owner` WRITE;
/*!40000 ALTER TABLE `check_in_captain_owner` DISABLE KEYS */;
/*!40000 ALTER TABLE `check_in_captain_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
                        `id` bigint NOT NULL AUTO_INCREMENT,
                        `name` varchar(50) NOT NULL,
                        `community_id` bigint NOT NULL,
                        PRIMARY KEY (`id`),
                        KEY `fk_city` (`community_id`),
                        CONSTRAINT `fk_city` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'palma',1);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community` (
                             `id` bigint NOT NULL AUTO_INCREMENT,
                             `name` varchar(60) NOT NULL,
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
INSERT INTO `community` VALUES (1,'islas_baleares');
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
                           `id` bigint NOT NULL AUTO_INCREMENT,
                           `name` varchar(255) NOT NULL,
                           `vat` varchar(20) NOT NULL,
                           `email` varchar(100) NOT NULL,
                           `phone` varchar(100) NOT NULL,
                           `admin` bigint NOT NULL,
                           PRIMARY KEY (`id`),
                           KEY `fk_company_1_idx` (`admin`),
                           CONSTRAINT `FK8encl0565j0q0yn7oglgjv7mu` FOREIGN KEY (`admin`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'mons','asdfasdf','mons@corp.com','b45243882',2);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_admin`
--

DROP TABLE IF EXISTS `company_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_admin` (
                                 `admin_id` bigint NOT NULL,
                                 `id` bigint NOT NULL,
                                 PRIMARY KEY (`admin_id`,`id`),
                                 UNIQUE KEY `admin_id_UNIQUE` (`admin_id`),
                                 UNIQUE KEY `id_UNIQUE` (`id`),
                                 KEY `fk_company_admin_admin_idx` (`admin_id`),
                                 CONSTRAINT `fk_company_admin` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_admin`
--

LOCK TABLES `company_admin` WRITE;
/*!40000 ALTER TABLE `company_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
                           `id` bigint NOT NULL AUTO_INCREMENT,
                           `issue_date` date NOT NULL,
                           `due_date` date NOT NULL,
                           `base_amount` double NOT NULL,
                           `tax_rate` double NOT NULL,
                           `total_amount` bigint NOT NULL,
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
                              `id` int unsigned NOT NULL AUTO_INCREMENT,
                              `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `batch` int NOT NULL,
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2026_01_20_175355_create_sessions_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mooring`
--

DROP TABLE IF EXISTS `mooring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mooring` (
                           `id` bigint NOT NULL AUTO_INCREMENT,
                           `number` bigint NOT NULL,
                           `mooring_category_id` bigint NOT NULL,
                           PRIMARY KEY (`id`),
                           UNIQUE KEY `id` (`id`),
                           KEY `fk_mooring_1jjkj_idx` (`mooring_category_id`),
                           CONSTRAINT `fk_mooring_1jjkj` FOREIGN KEY (`mooring_category_id`) REFERENCES `mooring_categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mooring`
--

LOCK TABLES `mooring` WRITE;
/*!40000 ALTER TABLE `mooring` DISABLE KEYS */;
INSERT INTO `mooring` VALUES (1,100,1),(2,101,1),(3,102,1),(4,103,2),(5,104,2),(6,105,2),(7,106,2),(8,107,3),(9,108,3),(10,147,3),(11,109,4),(12,110,4),(13,111,4),(14,112,4),(15,113,4),(16,114,4),(17,115,4),(18,116,4),(19,117,5),(20,118,5),(21,119,5),(22,120,5),(23,121,5),(24,122,5),(25,123,5),(26,124,6),(27,125,6),(28,126,7),(29,127,7);
/*!40000 ALTER TABLE `mooring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mooring_booking`
--

DROP TABLE IF EXISTS `mooring_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mooring_booking` (
                                   `id` bigint NOT NULL,
                                   `mooring_id` bigint NOT NULL,
                                   `booking_id` bigint NOT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `fk_mooring_booking_1_idx` (`mooring_id`),
                                   KEY `fk_mooring_booking_2_idx` (`booking_id`),
                                   CONSTRAINT `fk_mooring_booking_1` FOREIGN KEY (`mooring_id`) REFERENCES `mooring` (`id`),
                                   CONSTRAINT `fk_mooring_booking_2` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mooring_booking`
--

LOCK TABLES `mooring_booking` WRITE;
/*!40000 ALTER TABLE `mooring_booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `mooring_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mooring_categories`
--

DROP TABLE IF EXISTS `mooring_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mooring_categories` (
                                      `zone_id` bigint NOT NULL,
                                      `mooring_dimensions_id` bigint NOT NULL,
                                      `id` bigint NOT NULL AUTO_INCREMENT,
                                      PRIMARY KEY (`id`),
                                      KEY `FK4dwafm06bh31myoja3tgwtpme` (`zone_id`),
                                      KEY `fk_zone_mooring_categories_1_idx` (`mooring_dimensions_id`),
                                      CONSTRAINT `FK4dwafm06bh31myoja3tgwtpme` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`),
                                      CONSTRAINT `fk_zone_mooring_categories_1` FOREIGN KEY (`mooring_dimensions_id`) REFERENCES `mooring_dimensions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mooring_categories`
--

LOCK TABLES `mooring_categories` WRITE;
/*!40000 ALTER TABLE `mooring_categories` DISABLE KEYS */;
INSERT INTO `mooring_categories` VALUES (1,2,1),(1,3,2),(2,1,3),(2,2,4),(2,3,5),(3,1,6),(3,3,7);
/*!40000 ALTER TABLE `mooring_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mooring_dimensions`
--

DROP TABLE IF EXISTS `mooring_dimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mooring_dimensions` (
                                      `id` bigint NOT NULL AUTO_INCREMENT,
                                      `max_length` bigint NOT NULL,
                                      `max_beam` bigint NOT NULL,
                                      PRIMARY KEY (`id`),
                                      UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mooring_dimensions`
--

LOCK TABLES `mooring_dimensions` WRITE;
/*!40000 ALTER TABLE `mooring_dimensions` DISABLE KEYS */;
INSERT INTO `mooring_dimensions` VALUES (1,12,5),(2,14,5),(3,16,7);
/*!40000 ALTER TABLE `mooring_dimensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mooring_mooring_status`
--

DROP TABLE IF EXISTS `mooring_mooring_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mooring_mooring_status` (
                                          `id` bigint NOT NULL AUTO_INCREMENT,
                                          `mooring_id` bigint NOT NULL,
                                          `mooring_status` bigint NOT NULL DEFAULT '1',
                                          `start_date` date NOT NULL,
                                          `end_date` date NOT NULL,
                                          PRIMARY KEY (`id`),
                                          KEY `fk_mooring_id` (`mooring_status`),
                                          KEY `fk_mooring_status` (`mooring_id`),
                                          CONSTRAINT `fk_mooring_id` FOREIGN KEY (`mooring_status`) REFERENCES `mooring` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                          CONSTRAINT `fk_mooring_status` FOREIGN KEY (`mooring_id`) REFERENCES `mooring_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mooring_mooring_status`
--

LOCK TABLES `mooring_mooring_status` WRITE;
/*!40000 ALTER TABLE `mooring_mooring_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `mooring_mooring_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mooring_status`
--

DROP TABLE IF EXISTS `mooring_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mooring_status` (
                                  `id` bigint NOT NULL AUTO_INCREMENT,
                                  `status` varchar(255) NOT NULL,
                                  `is_available` tinyint NOT NULL DEFAULT '0',
                                  PRIMARY KEY (`id`),
                                  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mooring_status`
--

LOCK TABLES `mooring_status` WRITE;
/*!40000 ALTER TABLE `mooring_status` DISABLE KEYS */;
INSERT INTO `mooring_status` VALUES (1,'available',1),(2,'occupied',0),(3,'maintenance',0);
/*!40000 ALTER TABLE `mooring_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mooring_zone_price_configuration`
--

DROP TABLE IF EXISTS `mooring_zone_price_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mooring_zone_price_configuration` (
                                                    `id` bigint NOT NULL AUTO_INCREMENT,
                                                    `mooring_zone_id` bigint NOT NULL,
                                                    `price_configuration_id` bigint NOT NULL,
                                                    PRIMARY KEY (`id`),
                                                    KEY `fk_mooring_zone_price_configuration_1_idx` (`mooring_zone_id`),
                                                    KEY `fk_mooring_zone_price_configuration_2_idx` (`price_configuration_id`),
                                                    CONSTRAINT `fk_mooring_zone_price_configuration_1` FOREIGN KEY (`mooring_zone_id`) REFERENCES `mooring_categories` (`id`),
                                                    CONSTRAINT `fk_mooring_zone_price_configuration_2` FOREIGN KEY (`price_configuration_id`) REFERENCES `price_configuration` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mooring_zone_price_configuration`
--

LOCK TABLES `mooring_zone_price_configuration` WRITE;
/*!40000 ALTER TABLE `mooring_zone_price_configuration` DISABLE KEYS */;
INSERT INTO `mooring_zone_price_configuration` VALUES (8,1,1),(9,2,2),(10,3,2),(11,4,3),(12,5,4),(13,6,5),(14,7,6);
/*!40000 ALTER TABLE `mooring_zone_price_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
                         `id` bigint NOT NULL AUTO_INCREMENT,
                         `person_id` bigint NOT NULL,
                         PRIMARY KEY (`id`),
                         KEY `fk_owner_person_idx` (`person_id`),
                         CONSTRAINT `fk_owner_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
                           `id` bigint NOT NULL AUTO_INCREMENT,
                           `issue_date` date NOT NULL,
                           `total_amount` double NOT NULL,
                           `last_numbers_of_card` bigint NOT NULL,
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
                          `id` bigint NOT NULL AUTO_INCREMENT,
                          `first_name` varchar(255) NOT NULL,
                          `last_name` varchar(255) NOT NULL,
                          `identification_document` varchar(20) NOT NULL,
                          `birth_date` date NOT NULL,
                          `identification_document_type` varchar(45) NOT NULL,
                          `is_captain` tinyint(1) DEFAULT '0',
                          `navigation_license` varchar(45) DEFAULT NULL,
                          `is_owner` tinyint DEFAULT '0',
                          PRIMARY KEY (`id`),
                          UNIQUE KEY `identification_document` (`identification_document`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'testPErson','lastLaravel','userLaravel','2025-10-25','DNI',NULL,NULL,NULL),(2,'personLaravel','personFirstName','123123132','2002-02-14','DNI',1,NULL,NULL),(5,'personLaravel','personFirstName','1923123132','2002-02-14','DNI',0,'1234567890',0),(16,'midadasas','zuruasllete','add8da65646231','2024-04-23','DNI',0,'dfahsdfasdiqdf',0),(17,'midadasas','zuruasllete','add8da65d646231','2024-04-23','DNI',0,'dfahsdfasdiqdf',1),(18,'midadasas','zuruasllete','abd8da65d646231','2024-04-23','DNI',1,'dfahsdfasdiqdf',0);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `port`
--

DROP TABLE IF EXISTS `port`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `port` (
                        `id` bigint NOT NULL AUTO_INCREMENT,
                        `name` varchar(255) NOT NULL,
                        `city_id` bigint NOT NULL,
                        `company_id` bigint NOT NULL,
                        `roles_configuration_id` bigint DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        KEY `fk_port_company` (`company_id`),
                        KEY `fk_port_city_id` (`city_id`),
                        CONSTRAINT `fk_port_city_id` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT `fk_port_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port`
--

LOCK TABLES `port` WRITE;
/*!40000 ALTER TABLE `port` DISABLE KEYS */;
INSERT INTO `port` VALUES (1,'rcnp',1,1,NULL);
/*!40000 ALTER TABLE `port` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `port_admin`
--

DROP TABLE IF EXISTS `port_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `port_admin` (
                              `id` bigint NOT NULL,
                              PRIMARY KEY (`id`),
                              UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port_admin`
--

LOCK TABLES `port_admin` WRITE;
/*!40000 ALTER TABLE `port_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `port_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_configuration`
--

DROP TABLE IF EXISTS `price_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price_configuration` (
                                       `id` bigint NOT NULL AUTO_INCREMENT,
                                       `min_price` double NOT NULL,
                                       `start_date` date NOT NULL,
                                       `end_date` date NOT NULL,
                                       PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_configuration`
--

LOCK TABLES `price_configuration` WRITE;
/*!40000 ALTER TABLE `price_configuration` DISABLE KEYS */;
INSERT INTO `price_configuration` VALUES (1,110,'2026-06-01','2026-06-30'),(2,150,'2026-06-01','2026-06-30'),(3,160,'2026-06-01','2026-06-30'),(4,180,'2026-06-01','2026-06-30'),(5,200,'2026-06-01','2026-06-30'),(6,320,'2026-06-01','2026-06-30');
/*!40000 ALTER TABLE `price_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
                        `id` bigint NOT NULL AUTO_INCREMENT,
                        `description` varchar(255) DEFAULT NULL,
                        `name` varchar(255) DEFAULT NULL,
                        `roles_configuration_id` bigint DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        KEY `FKf5crarhs701vni8h5klxvaos6` (`roles_configuration_id`),
                        CONSTRAINT `FKf5crarhs701vni8h5klxvaos6` FOREIGN KEY (`roles_configuration_id`) REFERENCES `role_configuration` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'uep','firstRole',1),(2,'uep de sa colònia','firstRole',1),(4,'uep de sa colònia','sec',1);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_capability`
--

DROP TABLE IF EXISTS `role_capability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_capability` (
                                   `role_id` bigint NOT NULL,
                                   `capability_id` bigint NOT NULL,
                                   `id` bigint NOT NULL AUTO_INCREMENT,
                                   PRIMARY KEY (`id`),
                                   KEY `FKm720c0rj1gb9x8boctqltnh3c` (`capability_id`),
                                   KEY `FKdg9jxfhgbit0u34e6ql5qf9wo` (`role_id`),
                                   CONSTRAINT `FKdg9jxfhgbit0u34e6ql5qf9wo` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
                                   CONSTRAINT `FKm720c0rj1gb9x8boctqltnh3c` FOREIGN KEY (`capability_id`) REFERENCES `capability` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_capability`
--

LOCK TABLES `role_capability` WRITE;
/*!40000 ALTER TABLE `role_capability` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_capability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_configuration`
--

DROP TABLE IF EXISTS `role_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_configuration` (
                                      `id` bigint NOT NULL AUTO_INCREMENT,
                                      `name` varchar(255) DEFAULT NULL,
                                      `company_id` bigint NOT NULL,
                                      PRIMARY KEY (`id`),
                                      KEY `FKo61tfkyw0otu3p3gq1vtfytqc` (`company_id`),
                                      CONSTRAINT `FKo61tfkyw0otu3p3gq1vtfytqc` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_configuration`
--

LOCK TABLES `role_configuration` WRITE;
/*!40000 ALTER TABLE `role_configuration` DISABLE KEYS */;
INSERT INTO `role_configuration` VALUES (1,'firstConf',1),(2,'secondConf',1);
/*!40000 ALTER TABLE `role_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('3BvkTF169hMvqKn3uW7o7RvFCozSvTevY3jWKcl0',NULL,'172.16.58.89','','YTozOntzOjY6Il90b2tlbiI7czo0MDoidEVkRkQwM3QyeExCUFNweFhlanFPVk45bUJ1M1RuUEJ3VGlUc3dnRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly8xNzIuMTYuNjIuNTU6ODA4MCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1769412313),('Cy1xjiZMUMNa9O1Zf1Y84LzYbBHuKBHbOrHnFSDx',NULL,'192.168.32.1','PostmanRuntime/7.49.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1FqT2NoQW1wcWQydEZmSk5vQzV1Q2xSQk9YZmliYUFJcFgyaWNnQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1769096647),('daZ2iMOqD8ycewMmppjBCJ9izstENDZjl5xQTPum',NULL,'172.16.58.89','Avast Antivirus','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzlBN1FiQWVna2JtbGthMDliMzJCTXlqU0tYM0l0RHhWYktwUUdOeiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly8xNzIuMTYuNjIuNTU6ODA4MCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1769412268),('GEw4GqR0y7R81BCxNzyQ5oOJRGpHNvm0c7ClhKrk',NULL,'192.168.32.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzFOTWE3Rm9PSzBIWkpZSHFwWTJCRXMxbTV3MTBscDFzY2pNQ2hEVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1769333627),('OIXyo0FbMNZGHJjLysHflgGac1S69TLQgLo4TTqX',NULL,'172.30.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzJidzdmbWhrOGc3VDRER0RzbTBpUGRJOVV5U0pyUnk4RW0wSGJDZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1768936201),('RdDtlNDB40G8pKAFnaMOZJ4cfT8TFDtnRQCYXoFm',NULL,'192.168.32.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXRFaUc0TkRZeWNCWm1lNnRQeTNkVngzaUFhWWkwMjBlZWozamdneiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1769012750),('sEb0snI9UDl2avRQlE7iJQT194u1iDkxkxu7ElMb',NULL,'192.168.32.1','PostmanRuntime/7.49.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTG9EOE1kYVdkY2ZyMGo4MnVvdU82WWdiQUw4aW82b2ozT1VKTVQyYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1769072335),('WyFqvP03JuyVz40ADWMoEiAltdJFTHrANNebJVC2',NULL,'192.168.32.1','PostmanRuntime/7.49.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVJ1NmVDdWcxMTF5c2hrUUpzdE9NUnBOUDd5cWtDbVgwWE13S0NHaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1769341156);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
                        `id` bigint NOT NULL AUTO_INCREMENT,
                        `first_name` varchar(45) NOT NULL,
                        `last_name` varchar(45) NOT NULL,
                        `email` varchar(255) NOT NULL,
                        `password` varchar(255) NOT NULL,
                        `role_id` bigint DEFAULT NULL,
                        `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                        `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                        `user_name` varchar(255) NOT NULL,
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `user_name_UNIQUE` (`user_name`),
                        KEY `FKn82ha3ccdebhokx3a8fgdqeyy` (`role_id`),
                        CONSTRAINT `FKn82ha3ccdebhokx3a8fgdqeyy` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (9,'Mons','b45243882','mons@corp.com','747281231',NULL,NULL,'2026-01-19 20:30:09','midass admin'),(10,'Mons','b45243882','mons@corp.com','747281231',NULL,NULL,'2026-01-19 20:30:26','midasadminoso'),(15,'djkjhjkhkhkj','ffLaravdfasdfel','laravel@nautik.com','$2y$12$VggINPXPh2BQtQ/uajciFeFq3h90L0WS1Q/Rt.dKGWjw95Wc7VniO',NULL,'2026-01-26 18:54:53','2026-01-26 18:54:53','kkddkk'),(17,'djkjhjkhkhkj','ffLaravdfasdfel','larassvel@nautik.com','asdkjhkjhkjf',NULL,'2026-01-26 18:56:44','2026-01-26 18:57:11','kkddddkk'),(18,'Mons','b45243882','mons@corp.com','$2y$12$JnUBhPdXirrKVbGB793MR.EqhYYUZhqlXECKwv6UO3QBwr3ekeMhe',NULL,'2026-01-27 15:27:53','2026-01-27 15:27:53','midass ddaadmin');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_person`
--

DROP TABLE IF EXISTS `user_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_person` (
                               `id` int NOT NULL AUTO_INCREMENT,
                               `user_id` bigint NOT NULL,
                               `person_id` bigint DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               KEY `fk_user_person_1_idx` (`person_id`),
                               KEY `fk_user_person_2_idx` (`user_id`),
                               CONSTRAINT `fk_user_person_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
                               CONSTRAINT `fk_user_person_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_person`
--

LOCK TABLES `user_person` WRITE;
/*!40000 ALTER TABLE `user_person` DISABLE KEYS */;
INSERT INTO `user_person` VALUES (1,9,NULL),(2,9,NULL),(3,9,NULL),(4,9,NULL),(5,9,NULL),(6,9,17),(9,9,18);
/*!40000 ALTER TABLE `user_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zone` (
                        `id` bigint NOT NULL AUTO_INCREMENT,
                        `name` varchar(100) NOT NULL,
                        `description` varchar(255) NOT NULL,
                        `port_id` bigint NOT NULL,
                        PRIMARY KEY (`id`),
                        KEY `fk_zone_port` (`port_id`),
                        CONSTRAINT `fk_zone_port` FOREIGN KEY (`port_id`) REFERENCES `port` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone`
--

LOCK TABLES `zone` WRITE;
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
INSERT INTO `zone` VALUES (1,'zone1','normal',1),(2,'zone2','lux',1),(3,'zone3','extralux',1);
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-29  8:18:06