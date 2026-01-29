-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql:3306
-- Tiempo de generación: 23-01-2026 a las 17:13:27
-- Versión del servidor: 8.0.44
-- Versión de PHP: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nautik`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
                         `id` bigint NOT NULL,
                         `user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id`, `user_id`) VALUES
                                          (1, 1),
                                          (2, 2),
                                          (3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boat`
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
-- Volcado de datos para la tabla `boat`
--

INSERT INTO `boat` (`id`, `name`, `registry_number`, `length`, `beam`, `draft`, `boat_type_id`, `user_id`) VALUES
                                                                                                               (1, 'Aurora', 'ABC12345', 12.5, 4.2, 1.8, 1, 4),
                                                                                                               (2, 'Neptuno', 'DEF67890', 8.3, 2.8, 1.2, 2, 4),
                                                                                                               (3, 'Poseidón', 'GHI11223', 15.7, 5.1, 2.3, 3, 6),
                                                                                                               (4, 'Sirena', 'JKL44556', 10.2, 3.5, 1.5, 1, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boat_type`
--

CREATE TABLE `boat_type` (
                             `id` bigint NOT NULL,
                             `name` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `boat_type`
--

INSERT INTO `boat_type` (`id`, `name`) VALUES
                                           (1, 1),
                                           (2, 2),
                                           (3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `booking`
--

CREATE TABLE `booking` (
                           `id` bigint NOT NULL,
                           `start_date` date NOT NULL,
                           `end_date` date NOT NULL,
                           `total_cost` double NOT NULL,
                           `payment_method` bigint NOT NULL,
                           `boat_id` bigint NOT NULL,
                           `booking_status_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `booking`
--

INSERT INTO `booking` (`id`, `start_date`, `end_date`, `total_cost`, `payment_method`, `boat_id`, `booking_status_id`) VALUES
                                                                                                                           (1, '2026-02-01', '2026-02-07', 420, 1, 1, 2),
                                                                                                                           (2, '2026-02-10', '2026-02-15', 300, 2, 2, 2),
                                                                                                                           (3, '2026-03-01', '2026-03-10', 1350, 1, 3, 1),
                                                                                                                           (4, '2026-01-25', '2026-01-30', 375, 2, 4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `booking_booking_status`
--

CREATE TABLE `booking_booking_status` (
                                          `id` bigint NOT NULL,
                                          `booking_id` bigint NOT NULL,
                                          `booking_status_id` bigint NOT NULL,
                                          `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `booking_booking_status`
--

INSERT INTO `booking_booking_status` (`id`, `booking_id`, `booking_status_id`, `date`) VALUES
                                                                                           (1, 1, 1, '2026-01-10 10:30:00'),
                                                                                           (2, 1, 2, '2026-01-11 09:15:00'),
                                                                                           (3, 2, 1, '2026-01-12 14:20:00'),
                                                                                           (4, 2, 2, '2026-01-13 11:00:00'),
                                                                                           (5, 3, 1, '2026-01-15 16:45:00'),
                                                                                           (6, 4, 1, '2026-01-18 12:30:00'),
                                                                                           (7, 4, 2, '2026-01-19 10:00:00'),
                                                                                           (8, 4, 3, '2026-01-25 08:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `booking_check_in_mooring`
--

CREATE TABLE `booking_check_in_mooring` (
                                            `id` bigint NOT NULL,
                                            `booking_id` bigint NOT NULL,
                                            `mooring_id` bigint NOT NULL,
                                            `check_in_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `booking_check_in_mooring`
--

INSERT INTO `booking_check_in_mooring` (`id`, `booking_id`, `mooring_id`, `check_in_id`) VALUES
    (1, 4, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `booking_invoice_payment`
--

CREATE TABLE `booking_invoice_payment` (
                                           `id` bigint NOT NULL,
                                           `booking_id` bigint NOT NULL,
                                           `invoice_id` bigint NOT NULL,
                                           `payment_id` bigint NOT NULL,
                                           `user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `booking_invoice_payment`
--

INSERT INTO `booking_invoice_payment` (`id`, `booking_id`, `invoice_id`, `payment_id`, `user_id`) VALUES
                                                                                                      (1, 1, 1, 1, 4),
                                                                                                      (2, 2, 2, 2, 4),
                                                                                                      (3, 4, 4, 3, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `booking_status`
--

CREATE TABLE `booking_status` (
                                  `id` bigint NOT NULL,
                                  `status` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `booking_status`
--

INSERT INTO `booking_status` (`id`, `status`) VALUES
                                                  (1, 'Pendiente'),
                                                  (2, 'Confirmada'),
                                                  (3, 'En curso'),
                                                  (4, 'Completada'),
                                                  (5, 'Cancelada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capability`
--

CREATE TABLE `capability` (
                              `id` bigint NOT NULL,
                              `description` varchar(255) DEFAULT NULL,
                              `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `capability`
--

INSERT INTO `capability` (`id`, `description`, `name`) VALUES
                                                           (1, 'Crear, editar y eliminar usuarios', 'Manage Users'),
                                                           (2, 'Gestionar barcos', 'Manage Boats'),
                                                           (3, 'Gestionar amarres', 'Manage Moorings'),
                                                           (4, 'Gestionar reservas', 'Manage Bookings'),
                                                           (5, 'Ver informes financieros', 'View Financial Reports');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `captain`
--

CREATE TABLE `captain` (
                           `id` bigint NOT NULL,
                           `person_id` bigint NOT NULL,
                           `navigation_license` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `captain`
--

INSERT INTO `captain` (`id`, `person_id`, `navigation_license`) VALUES
                                                                    (1, 5, 1001),
                                                                    (2, 6, 1002);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `check_in`
--

CREATE TABLE `check_in` (
                            `id` bigint NOT NULL,
                            `check_in_time` time NOT NULL,
                            `check_out_time` time NOT NULL,
                            `documentation_provided` bigint NOT NULL,
                            `booking_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `check_in`
--

INSERT INTO `check_in` (`id`, `check_in_time`, `check_out_time`, `documentation_provided`, `booking_id`) VALUES
    (1, '14:30:00', '12:00:00', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `check_in_captain_owner`
--

CREATE TABLE `check_in_captain_owner` (
                                          `id` bigint NOT NULL,
                                          `check_in_id` bigint NOT NULL,
                                          `captain_id` bigint NOT NULL,
                                          `owner_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `check_in_captain_owner`
--

INSERT INTO `check_in_captain_owner` (`id`, `check_in_id`, `captain_id`, `owner_id`) VALUES
    (1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `city`
--

CREATE TABLE `city` (
                        `id` bigint NOT NULL,
                        `name` varchar(50) NOT NULL,
                        `community_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `city`
--

INSERT INTO `city` (`id`, `name`, `community_id`) VALUES
                                                      (1, 'Málaga', 1),
                                                      (2, 'Barcelona', 2),
                                                      (3, 'Valencia', 3),
                                                      (4, 'Palma de Mallorca', 4),
                                                      (5, 'Vigo', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `community`
--

CREATE TABLE `community` (
                             `id` bigint NOT NULL,
                             `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `community`
--

INSERT INTO `community` (`id`, `name`) VALUES
                                           (1, 'Andalucía'),
                                           (2, 'Cataluña'),
                                           (3, 'Comunidad Valenciana'),
                                           (4, 'Islas Baleares'),
                                           (5, 'Galicia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company`
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
-- Volcado de datos para la tabla `company`
--

INSERT INTO `company` (`id`, `name`, `vat`, `email`, `phone`, `admin`) VALUES
                                                                           (1, 'Marinas del Mediterráneo S.L.', 'B12345678', 'info@marinamed.com', '+34 951 123 456', 1),
                                                                           (2, 'Puertos de Baleares S.A.', 'A87654321', 'contacto@puertosbaleares.es', '+34 971 987 654', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company_admin`
--

CREATE TABLE `company_admin` (
                                 `admin_id` bigint NOT NULL,
                                 `id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `company_admin`
--

INSERT INTO `company_admin` (`admin_id`, `id`) VALUES
                                                   (2, 1),
                                                   (3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice`
--

CREATE TABLE `invoice` (
                           `id` bigint NOT NULL,
                           `issue_date` date NOT NULL,
                           `due_date` date NOT NULL,
                           `base_amount` double NOT NULL,
                           `tax_rate` double NOT NULL,
                           `total_amount` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `invoice`
--

INSERT INTO `invoice` (`id`, `issue_date`, `due_date`, `base_amount`, `tax_rate`, `total_amount`) VALUES
                                                                                                      (1, '2026-01-11', '2026-02-01', 347.11, 21, 420),
                                                                                                      (2, '2026-01-13', '2026-02-10', 247.93, 21, 300),
                                                                                                      (3, '2026-01-20', '2026-03-01', 1115.7, 21, 1350),
                                                                                                      (4, '2026-01-19', '2026-01-25', 309.92, 21, 375);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mooring`
--

CREATE TABLE `mooring` (
                           `id` bigint NOT NULL,
                           `number` bigint NOT NULL,
                           `mooring_category_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `mooring`
--

INSERT INTO `mooring` (`id`, `number`, `mooring_category_id`) VALUES
                                                                  (1, 101, 1),
                                                                  (2, 102, 1),
                                                                  (3, 103, 2),
                                                                  (4, 201, 3),
                                                                  (5, 202, 3),
                                                                  (6, 301, 4),
                                                                  (7, 401, 5),
                                                                  (8, 501, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mooring_category`
--

CREATE TABLE `mooring_category` (
                                    `id` bigint NOT NULL,
                                    `zone_id` bigint NOT NULL,
                                    `max_length` bigint NOT NULL,
                                    `max_beam` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `mooring_category`
--

INSERT INTO `mooring_category` (`id`, `zone_id`, `max_length`, `max_beam`) VALUES
                                                                               (1, 1, 10, 3),
                                                                               (2, 1, 12, 4),
                                                                               (3, 2, 15, 5),
                                                                               (4, 3, 20, 6),
                                                                               (5, 4, 18, 5),
                                                                               (6, 5, 25, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mooring_category_price_configuration`
--

CREATE TABLE `mooring_category_price_configuration` (
                                                        `id` bigint NOT NULL,
                                                        `mooring_category_id` bigint NOT NULL,
                                                        `price_configuration_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `mooring_category_price_configuration`
--

INSERT INTO `mooring_category_price_configuration` (`id`, `mooring_category_id`, `price_configuration_id`) VALUES
                                                                                                               (1, 1, 1),
                                                                                                               (2, 2, 2),
                                                                                                               (3, 3, 3),
                                                                                                               (4, 4, 4),
                                                                                                               (5, 5, 5),
                                                                                                               (6, 6, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mooring_mooring_status`
--

CREATE TABLE `mooring_mooring_status` (
                                          `id` bigint NOT NULL,
                                          `mooring_id` bigint NOT NULL,
                                          `mooring_status` bigint NOT NULL,
                                          `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `mooring_mooring_status`
--

INSERT INTO `mooring_mooring_status` (`id`, `mooring_id`, `mooring_status`, `date`) VALUES
                                                                                        (1, 1, 1, '2026-01-22 08:00:00'),
                                                                                        (2, 1, 2, '2026-01-22 08:00:00'),
                                                                                        (3, 1, 3, '2026-01-22 08:00:00'),
                                                                                        (4, 2, 4, '2026-01-22 08:00:00'),
                                                                                        (5, 1, 5, '2026-01-22 08:00:00'),
                                                                                        (6, 4, 6, '2026-01-22 08:00:00'),
                                                                                        (7, 3, 7, '2026-01-22 08:00:00'),
                                                                                        (8, 1, 8, '2026-01-22 08:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mooring_status`
--

CREATE TABLE `mooring_status` (
                                  `id` bigint NOT NULL,
                                  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `mooring_status`
--

INSERT INTO `mooring_status` (`id`, `status`) VALUES
                                                  (1, 'Disponible'),
                                                  (2, 'Ocupado'),
                                                  (3, 'En mantenimiento'),
                                                  (4, 'Reservado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `owner`
--

CREATE TABLE `owner` (
                         `id` bigint NOT NULL,
                         `person_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `owner`
--

INSERT INTO `owner` (`id`, `person_id`) VALUES
                                            (1, 1),
                                            (2, 2),
                                            (3, 3),
                                            (4, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment`
--

CREATE TABLE `payment` (
                           `id` bigint NOT NULL,
                           `issue_date` date NOT NULL,
                           `total_amount` double NOT NULL,
                           `last_numbers_of_card` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `payment`
--

INSERT INTO `payment` (`id`, `issue_date`, `total_amount`, `last_numbers_of_card`) VALUES
                                                                                       (1, '2026-01-11', 420, 1234),
                                                                                       (2, '2026-01-14', 300, 5678),
                                                                                       (3, '2026-01-20', 375, 4321);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `person`
--

CREATE TABLE `person` (
                          `id` bigint NOT NULL,
                          `first_name` varchar(255) NOT NULL,
                          `last_name` varchar(255) NOT NULL,
                          `identification_document` varchar(20) NOT NULL,
                          `birth_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `person`
--

INSERT INTO `person` (`id`, `first_name`, `last_name`, `identification_document`, `birth_date`) VALUES
                                                                                                    (1, 'Juan', 'Pérez', '12345678A', '1980-05-15'),
                                                                                                    (2, 'María', 'González', '87654321B', '1975-11-22'),
                                                                                                    (3, 'Pedro', 'Ramírez', '11223344C', '1985-03-10'),
                                                                                                    (4, 'Laura', 'Díaz', '44332211D', '1990-07-30'),
                                                                                                    (5, 'Sergio', 'Torres', '55667788E', '1982-09-18'),
                                                                                                    (6, 'Clara', 'Ortega', '99887766F', '1992-12-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `port`
--

CREATE TABLE `port` (
                        `id` bigint NOT NULL,
                        `name` varchar(255) NOT NULL,
                        `city_id` bigint NOT NULL,
                        `company_id` bigint NOT NULL,
                        `roles_configuration` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `port`
--

INSERT INTO `port` (`id`, `name`, `city_id`, `company_id`, `roles_configuration`) VALUES
                                                                                      (1, 'Puerto Deportivo Málaga', 1, 1, 1),
                                                                                      (2, 'Port Vell Barcelona', 2, 1, 2),
                                                                                      (3, 'Marina Real Valencia', 3, 1, 2),
                                                                                      (4, 'Club de Mar Mallorca', 4, 2, 2),
                                                                                      (5, 'Puerto Deportivo Vigo', 5, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `port_admin`
--

CREATE TABLE `port_admin` (
                              `id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `port_admin`
--

INSERT INTO `port_admin` (`id`) VALUES
    (3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

CREATE TABLE `role` (
                        `id` bigint NOT NULL,
                        `description` varchar(255) DEFAULT NULL,
                        `name` varchar(255) DEFAULT NULL,
                        `roles_configuration` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`id`, `description`, `name`, `roles_configuration`) VALUES
                                                                            (1, 'Administrador del sistema', 'Super Admin', NULL),
                                                                            (2, 'Administrador de empresa portuaria', 'Company Admin', 1),
                                                                            (3, 'Administrador de puerto', 'Port Admin', 2),
                                                                            (4, 'Usuario con barcos registrados', 'Boat Owner', NULL),
                                                                            (5, 'Capitán autorizado', 'Captain', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_capability`
--

CREATE TABLE `role_capability` (
                                   `role_id` bigint NOT NULL,
                                   `capability_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `role_capability`
--

INSERT INTO `role_capability` (`role_id`, `capability_id`) VALUES
                                                               (1, 1),
                                                               (1, 2),
                                                               (1, 3),
                                                               (1, 4),
                                                               (1, 5),
                                                               (2, 1),
                                                               (2, 2),
                                                               (2, 3),
                                                               (2, 4),
                                                               (3, 2),
                                                               (3, 3),
                                                               (3, 4),
                                                               (4, 2),
                                                               (5, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_configuration`
--

CREATE TABLE `role_configuration` (
                                      `id` bigint NOT NULL,
                                      `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `role_configuration`
--

INSERT INTO `role_configuration` (`id`, `name`) VALUES
                                                    (1, 'Configuración Puerto Principal'),
                                                    (2, 'Configuración Puerto Secundario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
                        `id` bigint NOT NULL,
                        `first_name` varchar(45) NOT NULL,
                        `last_name` varchar(45) NOT NULL,
                        `email` varchar(255) NOT NULL,
                        `password` varchar(255) NOT NULL,
                        `role_id` bigint DEFAULT NULL,
                        `created_at` datetime(6) DEFAULT NULL,
                        `user_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `password`, `role_id`, `created_at`, `user_name`) VALUES
                                                                                                                    (1, 'Carlos', 'García', 'carlos@example.com', 'hashed_password_1', 1, NULL, NULL),
                                                                                                                    (2, 'Ana', 'Martínez', 'ana@example.com', 'hashed_password_2', 2, NULL, NULL),
                                                                                                                    (3, 'Luis', 'Fernández', 'luis@example.com', 'hashed_password_3', 3, NULL, NULL),
                                                                                                                    (4, 'Elena', 'Rodríguez', 'elena@example.com', 'hashed_password_4', 4, NULL, NULL),
                                                                                                                    (5, 'David', 'Sánchez', 'david@example.com', 'hashed_password_5', 5, NULL, NULL),
                                                                                                                    (6, 'Marta', 'López', 'marta@example.com', 'hashed_password_6', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_captain`
--

CREATE TABLE `user_captain` (
                                `id` bigint NOT NULL,
                                `user_id` bigint NOT NULL,
                                `captain_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `user_captain`
--

INSERT INTO `user_captain` (`id`, `user_id`, `captain_id`) VALUES
                                                               (1, 5, 1),
                                                               (2, 6, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_owner`
--

CREATE TABLE `user_owner` (
                              `id` bigint NOT NULL,
                              `user_id` bigint NOT NULL,
                              `owner_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `user_owner`
--

INSERT INTO `user_owner` (`id`, `user_id`, `owner_id`) VALUES
                                                           (1, 4, 1),
                                                           (2, 4, 2),
                                                           (3, 6, 3),
                                                           (4, 6, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zone`
--

CREATE TABLE `zone` (
                        `id` bigint NOT NULL,
                        `name` varchar(100) NOT NULL,
                        `description` varchar(255) NOT NULL,
                        `port_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `zone`
--

INSERT INTO `zone` (`id`, `name`, `description`, `port_id`) VALUES
                                                                (1, 'Zona A', 'Amarres para embarcaciones pequeñas', 1),
                                                                (2, 'Zona B', 'Amarres para embarcaciones medianas', 1),
                                                                (3, 'Zona VIP', 'Amarres premium con servicios adicionales', 2),
                                                                (4, 'Zona Norte', 'Amarres protegidos del viento', 3),
                                                                (5, 'Zona Sur', 'Amarres con fácil acceso al mar', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zone_mooring_categories`
--

CREATE TABLE `zone_mooring_categories` (
                                           `zone_id` bigint NOT NULL,
                                           `mooring_categories_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `zone_mooring_categories`
--

INSERT INTO `zone_mooring_categories` (`zone_id`, `mooring_categories_id`) VALUES
                                                                               (1, 1),
                                                                               (1, 2),
                                                                               (2, 3),
                                                                               (3, 4),
                                                                               (4, 5),
                                                                               (5, 6);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
    ADD PRIMARY KEY (`id`,`user_id`),
  ADD UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_port_admin_user_idx` (`user_id`);

--
-- Indices de la tabla `boat`
--
ALTER TABLE `boat`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_boat_type` (`boat_type_id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indices de la tabla `boat_type`
--
ALTER TABLE `boat_type`
    ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `booking`
--
ALTER TABLE `booking`
    ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `booking_booking_status`
--
ALTER TABLE `booking_booking_status`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_booking_id` (`booking_id`),
  ADD KEY `fk_booking_status` (`booking_status_id`);

--
-- Indices de la tabla `booking_check_in_mooring`
--
ALTER TABLE `booking_check_in_mooring`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_booking_id_1` (`booking_id`),
  ADD KEY `fk_check_in_3` (`check_in_id`),
  ADD KEY `fk_mooring_1` (`mooring_id`);

--
-- Indices de la tabla `booking_invoice_payment`
--
ALTER TABLE `booking_invoice_payment`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_booking` (`booking_id`),
  ADD KEY `fk_invoice` (`invoice_id`),
  ADD KEY `fk_payment` (`payment_id`),
  ADD KEY `fk_user` (`user_id`);

--
-- Indices de la tabla `booking_status`
--
ALTER TABLE `booking_status`
    ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `capability`
--
ALTER TABLE `capability`
    ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `captain`
--
ALTER TABLE `captain`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_captain_person` (`person_id`);

--
-- Indices de la tabla `check_in`
--
ALTER TABLE `check_in`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_booking_id_check_in` (`booking_id`);

--
-- Indices de la tabla `check_in_captain_owner`
--
ALTER TABLE `check_in_captain_owner`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_check_in` (`check_in_id`),
  ADD KEY `fk_captain_id` (`captain_id`),
  ADD KEY `fk_owner` (`owner_id`);

--
-- Indices de la tabla `city`
--
ALTER TABLE `city`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_city` (`community_id`);

--
-- Indices de la tabla `community`
--
ALTER TABLE `community`
    ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `company`
--
ALTER TABLE `company`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_company_1_idx` (`admin`);

--
-- Indices de la tabla `company_admin`
--
ALTER TABLE `company_admin`
    ADD PRIMARY KEY (`admin_id`,`id`),
  ADD UNIQUE KEY `admin_id_UNIQUE` (`admin_id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_company_admin_admin_idx` (`admin_id`);

--
-- Indices de la tabla `invoice`
--
ALTER TABLE `invoice`
    ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mooring`
--
ALTER TABLE `mooring`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk_mooring_1_idx` (`mooring_category_id`);

--
-- Indices de la tabla `mooring_category`
--
ALTER TABLE `mooring_category`
    ADD PRIMARY KEY (`id`,`zone_id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FKm57tagmg18sg4l1g6vcmrisrk` (`zone_id`);

--
-- Indices de la tabla `mooring_category_price_configuration`
--
ALTER TABLE `mooring_category_price_configuration`
    ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mooring_mooring_status`
--
ALTER TABLE `mooring_mooring_status`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_mooring_id` (`mooring_status`),
  ADD KEY `fk_mooring_status` (`mooring_id`);

--
-- Indices de la tabla `mooring_status`
--
ALTER TABLE `mooring_status`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `owner`
--
ALTER TABLE `owner`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_person_id` (`person_id`);

--
-- Indices de la tabla `payment`
--
ALTER TABLE `payment`
    ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `person`
--
ALTER TABLE `person`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identification_document` (`identification_document`);

--
-- Indices de la tabla `port`
--
ALTER TABLE `port`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_port_company` (`company_id`),
  ADD KEY `fk_port_city_id` (`city_id`),
  ADD KEY `FKtknxp4lctm5f5pc30rdb5eivq` (`roles_configuration`);

--
-- Indices de la tabla `port_admin`
--
ALTER TABLE `port_admin`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `role`
--
ALTER TABLE `role`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FKba5urcrkp4ujyi33v3ntt4nn0` (`roles_configuration`);

--
-- Indices de la tabla `role_capability`
--
ALTER TABLE `role_capability`
    ADD KEY `FKm720c0rj1gb9x8boctqltnh3c` (`capability_id`),
  ADD KEY `FKdg9jxfhgbit0u34e6ql5qf9wo` (`role_id`);

--
-- Indices de la tabla `role_configuration`
--
ALTER TABLE `role_configuration`
    ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FKn82ha3ccdebhokx3a8fgdqeyy` (`role_id`);

--
-- Indices de la tabla `user_captain`
--
ALTER TABLE `user_captain`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id_1` (`user_id`),
  ADD KEY `fk_captain_id_1` (`captain_id`);

--
-- Indices de la tabla `user_owner`
--
ALTER TABLE `user_owner`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id_2` (`user_id`),
  ADD KEY `fk_owner_id_1` (`owner_id`);

--
-- Indices de la tabla `zone`
--
ALTER TABLE `zone`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_zone_port` (`port_id`);

--
-- Indices de la tabla `zone_mooring_categories`
--
ALTER TABLE `zone_mooring_categories`
    ADD UNIQUE KEY `UKka6sv9nn16tiucg2wouxrvddc` (`mooring_categories_id`),
    ADD KEY `FK4dwafm06bh31myoja3tgwtpme` (`zone_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `boat`
--
ALTER TABLE `boat`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `boat_type`
--
ALTER TABLE `boat_type`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `booking`
--
ALTER TABLE `booking`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `booking_booking_status`
--
ALTER TABLE `booking_booking_status`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `booking_check_in_mooring`
--
ALTER TABLE `booking_check_in_mooring`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `booking_invoice_payment`
--
ALTER TABLE `booking_invoice_payment`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `booking_status`
--
ALTER TABLE `booking_status`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `capability`
--
ALTER TABLE `capability`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `captain`
--
ALTER TABLE `captain`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `check_in`
--
ALTER TABLE `check_in`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `check_in_captain_owner`
--
ALTER TABLE `check_in_captain_owner`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `city`
--
ALTER TABLE `city`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `community`
--
ALTER TABLE `community`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `company`
--
ALTER TABLE `company`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `invoice`
--
ALTER TABLE `invoice`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `mooring`
--
ALTER TABLE `mooring`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `mooring_category_price_configuration`
--
ALTER TABLE `mooring_category_price_configuration`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `mooring_mooring_status`
--
ALTER TABLE `mooring_mooring_status`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `mooring_status`
--
ALTER TABLE `mooring_status`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `owner`
--
ALTER TABLE `owner`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `payment`
--
ALTER TABLE `payment`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `port`
--
ALTER TABLE `port`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `role`
--
ALTER TABLE `role`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `user_captain`
--
ALTER TABLE `user_captain`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user_owner`
--
ALTER TABLE `user_owner`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `zone`
--
ALTER TABLE `zone`
    MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `admin`
--
ALTER TABLE `admin`
    ADD CONSTRAINT `fk_port_admin_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `boat`
--
ALTER TABLE `boat`
    ADD CONSTRAINT `fk_boat_type` FOREIGN KEY (`boat_type_id`) REFERENCES `boat_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `booking_booking_status`
--
ALTER TABLE `booking_booking_status`
    ADD CONSTRAINT `fk_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_booking_status` FOREIGN KEY (`booking_status_id`) REFERENCES `booking_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `booking_check_in_mooring`
--
ALTER TABLE `booking_check_in_mooring`
    ADD CONSTRAINT `fk_booking_id_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_check_in_3` FOREIGN KEY (`check_in_id`) REFERENCES `check_in` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_mooring_1` FOREIGN KEY (`mooring_id`) REFERENCES `mooring` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `booking_invoice_payment`
--
ALTER TABLE `booking_invoice_payment`
    ADD CONSTRAINT `fk_booking` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_payment` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `captain`
--
ALTER TABLE `captain`
    ADD CONSTRAINT `fk_captain_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `check_in`
--
ALTER TABLE `check_in`
    ADD CONSTRAINT `fk_booking_id_check_in` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `check_in_captain_owner`
--
ALTER TABLE `check_in_captain_owner`
    ADD CONSTRAINT `fk_captain_id` FOREIGN KEY (`captain_id`) REFERENCES `captain` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_check_in` FOREIGN KEY (`check_in_id`) REFERENCES `check_in` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_owner` FOREIGN KEY (`owner_id`) REFERENCES `captain` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `city`
--
ALTER TABLE `city`
    ADD CONSTRAINT `fk_city` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `company`
--
ALTER TABLE `company`
    ADD CONSTRAINT `FK8encl0565j0q0yn7oglgjv7mu` FOREIGN KEY (`admin`) REFERENCES `admin` (`id`),
  ADD CONSTRAINT `fk_company_1` FOREIGN KEY (`admin`) REFERENCES `company_admin` (`id`);

--
-- Filtros para la tabla `company_admin`
--
ALTER TABLE `company_admin`
    ADD CONSTRAINT `fk_company_admin` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mooring`
--
ALTER TABLE `mooring`
    ADD CONSTRAINT `fkmrng_mn` FOREIGN KEY (`mooring_category_id`) REFERENCES `mooring_category` (`id`);

--
-- Filtros para la tabla `mooring_category`
--
ALTER TABLE `mooring_category`
    ADD CONSTRAINT `FKm57tagmg18sg4l1g6vcmrisrk` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`);

--
-- Filtros para la tabla `mooring_mooring_status`
--
ALTER TABLE `mooring_mooring_status`
    ADD CONSTRAINT `fk_mooring_id` FOREIGN KEY (`mooring_status`) REFERENCES `mooring` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_mooring_status` FOREIGN KEY (`mooring_id`) REFERENCES `mooring_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `owner`
--
ALTER TABLE `owner`
    ADD CONSTRAINT `fk_person_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `port`
--
ALTER TABLE `port`
    ADD CONSTRAINT `fk_port_city_id` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_port_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKtknxp4lctm5f5pc30rdb5eivq` FOREIGN KEY (`roles_configuration`) REFERENCES `role_configuration` (`id`);

--
-- Filtros para la tabla `role`
--
ALTER TABLE `role`
    ADD CONSTRAINT `FKba5urcrkp4ujyi33v3ntt4nn0` FOREIGN KEY (`roles_configuration`) REFERENCES `role_configuration` (`id`);

--
-- Filtros para la tabla `role_capability`
--
ALTER TABLE `role_capability`
    ADD CONSTRAINT `FKdg9jxfhgbit0u34e6ql5qf9wo` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `FKm720c0rj1gb9x8boctqltnh3c` FOREIGN KEY (`capability_id`) REFERENCES `capability` (`id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
    ADD CONSTRAINT `FKn82ha3ccdebhokx3a8fgdqeyy` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Filtros para la tabla `user_captain`
--
ALTER TABLE `user_captain`
    ADD CONSTRAINT `fk_captain_id_1` FOREIGN KEY (`captain_id`) REFERENCES `captain` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_id_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user_owner`
--
ALTER TABLE `user_owner`
    ADD CONSTRAINT `fk_owner_id_1` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_id_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `zone`
--
ALTER TABLE `zone`
    ADD CONSTRAINT `fk_zone_port` FOREIGN KEY (`port_id`) REFERENCES `port` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `zone_mooring_categories`
--
ALTER TABLE `zone_mooring_categories`
    ADD CONSTRAINT `FK4dwafm06bh31myoja3tgwtpme` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`),
  ADD CONSTRAINT `FKlv8iipr3yox41juaihbrtrfs8` FOREIGN KEY (`mooring_categories_id`) REFERENCES `mooring_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;