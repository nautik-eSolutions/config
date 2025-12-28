-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: nautik
-- ------------------------------------------------------
-- Server version	9.5.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'd782dc28-defe-11f0-97f0-9a63c23be361:1-106';

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
                         `id` int NOT NULL AUTO_INCREMENT,
                         `user_id` int NOT NULL,
                         PRIMARY KEY (`id`,`user_id`),
                         UNIQUE KEY `user_id_UNIQUE` (`user_id`),
                         UNIQUE KEY `id_UNIQUE` (`id`),
                         KEY `fk_port_admin_user_idx` (`user_id`),
                         CONSTRAINT `fk_port_admin_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boat`
--

DROP TABLE IF EXISTS `boat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boat` (
                        `id` int NOT NULL AUTO_INCREMENT,
                        `name` varchar(255) NOT NULL,
                        `registry_number` varchar(20) NOT NULL,
                        `length` double NOT NULL,
                        `beam` double NOT NULL,
                        `draft` double NOT NULL,
                        `boat_type_id` int NOT NULL,
                        `user_id` int NOT NULL,
                        PRIMARY KEY (`id`),
                        KEY `fk_boat_type` (`boat_type_id`),
                        KEY `fk_user_id` (`user_id`),
                        CONSTRAINT `fk_boat_type` FOREIGN KEY (`boat_type_id`) REFERENCES `boat_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boat`
--

LOCK TABLES `boat` WRITE;
/*!40000 ALTER TABLE `boat` DISABLE KEYS */;
/*!40000 ALTER TABLE `boat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boat_type`
--

DROP TABLE IF EXISTS `boat_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boat_type` (
                             `id` int NOT NULL AUTO_INCREMENT,
                             `name` int NOT NULL,
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boat_type`
--

LOCK TABLES `boat_type` WRITE;
/*!40000 ALTER TABLE `boat_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `boat_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `start_date` date NOT NULL,
                           `end_date` date NOT NULL,
                           `total_cost` double NOT NULL,
                           `payment_method` int NOT NULL,
                           `boat_id` int NOT NULL,
                           `booking_status_id` int NOT NULL,
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
                                          `id` int NOT NULL AUTO_INCREMENT,
                                          `booking_id` int NOT NULL,
                                          `booking_status_id` int NOT NULL,
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
                                            `id` int NOT NULL AUTO_INCREMENT,
                                            `booking_id` int NOT NULL,
                                            `mooring_id` int NOT NULL,
                                            `check_in_id` int NOT NULL,
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
                                           `id` int NOT NULL AUTO_INCREMENT,
                                           `booking_id` int NOT NULL,
                                           `invoice_id` int NOT NULL,
                                           `payment_id` int NOT NULL,
                                           `user_id` int NOT NULL,
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
                                  `id` int NOT NULL AUTO_INCREMENT,
                                  `status` varchar(75) NOT NULL,
                                  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_status`
--

LOCK TABLES `booking_status` WRITE;
/*!40000 ALTER TABLE `booking_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captain`
--

DROP TABLE IF EXISTS `captain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `captain` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `person_id` int NOT NULL,
                           `navigation_license` bigint NOT NULL,
                           PRIMARY KEY (`id`),
                           KEY `fk_captain_person` (`person_id`),
                           CONSTRAINT `fk_captain_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captain`
--

LOCK TABLES `captain` WRITE;
/*!40000 ALTER TABLE `captain` DISABLE KEYS */;
/*!40000 ALTER TABLE `captain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_in`
--

DROP TABLE IF EXISTS `check_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check_in` (
                            `id` int NOT NULL AUTO_INCREMENT,
                            `check_in_time` time NOT NULL,
                            `check_out_time` time NOT NULL,
                            `documentation_provided` int NOT NULL,
                            `booking_id` int NOT NULL,
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
                                          `id` int NOT NULL AUTO_INCREMENT,
                                          `check_in_id` int NOT NULL,
                                          `captain_id` int NOT NULL,
                                          `owner_id` int NOT NULL,
                                          PRIMARY KEY (`id`),
                                          KEY `fk_check_in` (`check_in_id`),
                                          KEY `fk_captain_id` (`captain_id`),
                                          KEY `fk_owner` (`owner_id`),
                                          CONSTRAINT `fk_captain_id` FOREIGN KEY (`captain_id`) REFERENCES `captain` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                          CONSTRAINT `fk_check_in` FOREIGN KEY (`check_in_id`) REFERENCES `check_in` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                          CONSTRAINT `fk_owner` FOREIGN KEY (`owner_id`) REFERENCES `captain` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
                        `id` int NOT NULL AUTO_INCREMENT,
                        `name` varchar(50) NOT NULL,
                        `community_id` int NOT NULL,
                        PRIMARY KEY (`id`),
                        KEY `fk_city` (`community_id`),
                        CONSTRAINT `fk_city` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community` (
                             `id` int NOT NULL AUTO_INCREMENT,
                             `name` varchar(60) NOT NULL,
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `name` varchar(255) NOT NULL,
                           `vat` varchar(20) NOT NULL,
                           `email` varchar(100) NOT NULL,
                           `phone` varchar(100) NOT NULL,
                           `admin` int NOT NULL,
                           PRIMARY KEY (`id`),
                           KEY `fk_company_1_idx` (`admin`),
                           CONSTRAINT `fk_company_1` FOREIGN KEY (`admin`) REFERENCES `company_admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_admin`
--

DROP TABLE IF EXISTS `company_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_admin` (
                                 `admin_id` int NOT NULL,
                                 `id` int NOT NULL,
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
                           `id` int NOT NULL AUTO_INCREMENT,
                           `issue_date` date NOT NULL,
                           `due_date` date NOT NULL,
                           `base_amount` double NOT NULL,
                           `tax_rate` double NOT NULL,
                           `total_amount` int NOT NULL,
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
-- Table structure for table `mooring`
--

DROP TABLE IF EXISTS `mooring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mooring` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `number` int NOT NULL,
                           `mooring_category_id` int NOT NULL,
                           PRIMARY KEY (`id`),
                           UNIQUE KEY `id` (`id`),
                           KEY `fk_mooring_category_idx` (`mooring_category_id`),
                           CONSTRAINT `fk_mooring_category` FOREIGN KEY (`mooring_category_id`) REFERENCES `mooring_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mooring`
--

LOCK TABLES `mooring` WRITE;
/*!40000 ALTER TABLE `mooring` DISABLE KEYS */;
/*!40000 ALTER TABLE `mooring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mooring_category`
--

DROP TABLE IF EXISTS `mooring_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mooring_category` (
                                    `id` int NOT NULL AUTO_INCREMENT,
                                    `zone_id` int NOT NULL,
                                    `max_length` int NOT NULL,
                                    `max_beam` int NOT NULL,
                                    PRIMARY KEY (`id`,`zone_id`),
                                    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mooring_category`
--

LOCK TABLES `mooring_category` WRITE;
/*!40000 ALTER TABLE `mooring_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `mooring_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mooring_category_price_configuration`
--

DROP TABLE IF EXISTS `mooring_category_price_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mooring_category_price_configuration` (
                                                        `id` int NOT NULL AUTO_INCREMENT,
                                                        `mooring_category_id` int NOT NULL,
                                                        `price_configuration_id` int NOT NULL,
                                                        PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mooring_category_price_configuration`
--

LOCK TABLES `mooring_category_price_configuration` WRITE;
/*!40000 ALTER TABLE `mooring_category_price_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `mooring_category_price_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mooring_mooring_status`
--

DROP TABLE IF EXISTS `mooring_mooring_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mooring_mooring_status` (
                                          `id` int NOT NULL AUTO_INCREMENT,
                                          `mooring_id` int NOT NULL,
                                          `mooring_status` int NOT NULL,
                                          `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
                                  `id` int NOT NULL AUTO_INCREMENT,
                                  `status` varchar(255) NOT NULL,
                                  PRIMARY KEY (`id`),
                                  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mooring_status`
--

LOCK TABLES `mooring_status` WRITE;
/*!40000 ALTER TABLE `mooring_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `mooring_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
                         `id` int NOT NULL AUTO_INCREMENT,
                         `person_id` int NOT NULL,
                         PRIMARY KEY (`id`),
                         KEY `fk_person_id` (`person_id`),
                         CONSTRAINT `fk_person_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `issue_date` date NOT NULL,
                           `total_amount` double NOT NULL,
                           `last_numbers_of_card` int NOT NULL,
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
                          `id` int NOT NULL,
                          `first_name` varchar(255) NOT NULL,
                          `last_name` varchar(255) NOT NULL,
                          `identification_document` varchar(20) NOT NULL,
                          `birth_date` date NOT NULL,
                          PRIMARY KEY (`id`),
                          UNIQUE KEY `identification_document` (`identification_document`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `port`
--

DROP TABLE IF EXISTS `port`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `port` (
                        `id` int NOT NULL AUTO_INCREMENT,
                        `name` varchar(255) NOT NULL,
                        `city_id` int NOT NULL,
                        `company_id` int NOT NULL,
                        PRIMARY KEY (`id`),
                        KEY `fk_port_company` (`company_id`),
                        KEY `fk_port_city_id` (`city_id`),
                        CONSTRAINT `fk_port_city_id` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT `fk_port_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port`
--

LOCK TABLES `port` WRITE;
/*!40000 ALTER TABLE `port` DISABLE KEYS */;
/*!40000 ALTER TABLE `port` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `port_admin`
--

DROP TABLE IF EXISTS `port_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `port_admin` (
                              `id` int NOT NULL,
                              `admin_id` int NOT NULL,
                              PRIMARY KEY (`id`,`admin_id`),
                              UNIQUE KEY `id` (`id`),
                              KEY `fk_port_admin_1_idx` (`admin_id`),
                              CONSTRAINT `fk_port_admin_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
-- Table structure for table `port_admin_port`
--

DROP TABLE IF EXISTS `port_admin_port`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `port_admin_port` (
                                   `id` int NOT NULL AUTO_INCREMENT,
                                   `port_id` int NOT NULL,
                                   `port_admin_id` int NOT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `fk_port_interr_port` (`port_id`),
                                   KEY `fk_port_admin` (`port_admin_id`),
                                   CONSTRAINT `fk_port_admin` FOREIGN KEY (`port_admin_id`) REFERENCES `port_admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                   CONSTRAINT `fk_port_interr_port` FOREIGN KEY (`port_id`) REFERENCES `port` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port_admin_port`
--

LOCK TABLES `port_admin_port` WRITE;
/*!40000 ALTER TABLE `port_admin_port` DISABLE KEYS */;
/*!40000 ALTER TABLE `port_admin_port` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_configuration`
--

DROP TABLE IF EXISTS `price_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price_configuration` (
                                       `id` int NOT NULL AUTO_INCREMENT,
                                       `min_price` double NOT NULL,
                                       `start_date` date NOT NULL,
                                       `end_date` date NOT NULL,
                                       `port_admin_id` int NOT NULL,
                                       PRIMARY KEY (`id`),
                                       KEY `fk_price_port_admin` (`port_admin_id`),
                                       CONSTRAINT `fk_price_port_admin` FOREIGN KEY (`port_admin_id`) REFERENCES `port_admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_configuration`
--

LOCK TABLES `price_configuration` WRITE;
/*!40000 ALTER TABLE `price_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `price_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_admin`
--

DROP TABLE IF EXISTS `super_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `super_admin` (
                               `id` int NOT NULL AUTO_INCREMENT,
                               `admin_id` int NOT NULL,
                               PRIMARY KEY (`id`,`admin_id`),
                               UNIQUE KEY `admin_id_UNIQUE` (`admin_id`),
                               KEY `fk_super_admin_admin_idx` (`admin_id`),
                               CONSTRAINT `fk_super_admin` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_admin`
--

LOCK TABLES `super_admin` WRITE;
/*!40000 ALTER TABLE `super_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `super_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
                        `id` int NOT NULL AUTO_INCREMENT,
                        `first_name` varchar(45) NOT NULL,
                        `last_name` varchar(45) NOT NULL,
                        `email` varchar(255) NOT NULL,
                        `password` varchar(255) NOT NULL,
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_captain`
--

DROP TABLE IF EXISTS `user_captain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_captain` (
                                `id` int NOT NULL AUTO_INCREMENT,
                                `user_id` int NOT NULL,
                                `captain_id` int NOT NULL,
                                PRIMARY KEY (`id`),
                                KEY `fk_user_id_1` (`user_id`),
                                KEY `fk_captain_id_1` (`captain_id`),
                                CONSTRAINT `fk_captain_id_1` FOREIGN KEY (`captain_id`) REFERENCES `captain` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                CONSTRAINT `fk_user_id_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_captain`
--

LOCK TABLES `user_captain` WRITE;
/*!40000 ALTER TABLE `user_captain` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_captain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_owner`
--

DROP TABLE IF EXISTS `user_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_owner` (
                              `id` int NOT NULL AUTO_INCREMENT,
                              `user_id` int NOT NULL,
                              `owner_id` int NOT NULL,
                              PRIMARY KEY (`id`),
                              KEY `fk_user_id_2` (`user_id`),
                              KEY `fk_owner_id_1` (`owner_id`),
                              CONSTRAINT `fk_owner_id_1` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                              CONSTRAINT `fk_user_id_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_owner`
--

LOCK TABLES `user_owner` WRITE;
/*!40000 ALTER TABLE `user_owner` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zone` (
                        `id` int NOT NULL AUTO_INCREMENT,
                        `name` varchar(100) NOT NULL,
                        `description` varchar(255) NOT NULL,
                        `port_id` int NOT NULL,
                        PRIMARY KEY (`id`),
                        KEY `fk_zone_port` (`port_id`),
                        CONSTRAINT `fk_zone_port` FOREIGN KEY (`port_id`) REFERENCES `port` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone`
--

LOCK TABLES `zone` WRITE;
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-28 18:15:22
