-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 15, 2020 at 06:49 AM
-- Server version: 5.6.47-cll-lve
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sam_upsc`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_users`
--

CREATE TABLE `app_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(245) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_cat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `user_files_cat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '3',
  `user_videos_cat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '2',
  `logged` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` int(11) DEFAULT '0',
  `verify_code` int(11) DEFAULT NULL,
  `mobile_device` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isactive` int(11) DEFAULT '0',
  `device_list` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isBlocked` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `cat_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `belong_to` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `cat_name`, `created_at`, `updated_at`, `price`, `belong_to`) VALUES
(1, 'Free PDF Package', '2020-04-05 02:09:50', '2020-04-05 02:09:50', 0, 1),
(2, 'Free Video Package', '2020-04-05 02:10:08', '2020-04-05 02:10:08', 0, 2),
(3, 'Free Files Package', '2020-04-05 02:10:25', '2020-04-05 02:10:25', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 4, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 2),
(24, 4, 'password', 'text', 'Password', 0, 1, 1, 1, 1, 1, '{}', 3),
(25, 4, 'full_name', 'text', 'Full Name', 0, 1, 1, 1, 1, 1, '{}', 4),
(26, 4, 'profile_pic', 'text', 'Profile Pic', 0, 1, 1, 1, 1, 1, '{}', 5),
(27, 4, 'mobile', 'text', 'Mobile', 0, 1, 1, 1, 1, 1, '{}', 6),
(28, 4, 'gender', 'text', 'Gender', 0, 1, 1, 1, 1, 1, '{}', 8),
(29, 4, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 9),
(30, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(31, 5, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(32, 5, 'cat_name', 'text', 'Cat Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(33, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(34, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(35, 6, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(36, 6, 'file_name', 'text', 'File Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(37, 6, 'type', 'text', 'Type', 0, 1, 1, 1, 1, 1, '{}', 3),
(38, 6, 'file', 'file', 'File', 0, 1, 1, 1, 1, 1, '{\"preserveFileUploadName\":\"yes\"}', 4),
(39, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(40, 9, 'video_name', 'text', 'Video Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(41, 9, 'type', 'text', 'Type', 0, 1, 1, 1, 1, 1, '{}', 3),
(42, 9, 'video', 'file', 'Video', 0, 1, 1, 1, 1, 1, '{\"preserveFileUploadName\":\"yes\"}', 4),
(43, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(44, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(45, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(46, 10, 'pdf_name', 'text', 'Pdf Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(47, 10, 'type', 'text', 'Type', 0, 1, 1, 1, 1, 1, '{}', 3),
(48, 10, 'pdf', 'file', 'Pdf', 0, 1, 1, 1, 1, 1, '{\"preserveFileUploadName\":\"yes\"}', 4),
(49, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(50, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(51, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(52, 11, 'user_id', 'text', 'User Id', 0, 1, 1, 0, 0, 1, '{}', 4),
(53, 11, 'category_type', 'text', 'Category Type', 0, 1, 1, 0, 0, 1, '{}', 5),
(54, 11, 'price', 'text', 'Price', 0, 1, 1, 0, 0, 1, '{}', 6),
(55, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 1, '{}', 7),
(56, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(57, 6, 'file_belongsto_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"type\",\"key\":\"id\",\"label\":\"cat_name\",\"pivot_table\":\"app_users\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(58, 9, 'video_belongsto_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"type\",\"key\":\"id\",\"label\":\"cat_name\",\"pivot_table\":\"app_users\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(59, 10, 'pdf_belongsto_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"type\",\"key\":\"id\",\"label\":\"cat_name\",\"pivot_table\":\"app_users\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(60, 11, 'payment_belongsto_app_user_relationship', 'relationship', 'User Name', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\AppUser\",\"table\":\"app_users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"full_name\",\"pivot_table\":\"app_users\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(61, 11, 'payment_belongsto_category_relationship', 'relationship', 'User Category', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_type\",\"key\":\"id\",\"label\":\"cat_name\",\"pivot_table\":\"app_users\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(62, 4, 'user_cat', 'select_multiple', 'User Cat', 0, 1, 1, 0, 0, 1, '{}', 12),
(63, 5, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, '{}', 5),
(65, 4, 'logged', 'text', 'Logged', 0, 1, 1, 1, 1, 1, '{}', 11),
(66, 4, 'verified', 'text', 'Verified', 0, 1, 1, 1, 1, 1, '{}', 13),
(67, 4, 'verify_code', 'text', 'Verify Code', 0, 1, 1, 1, 1, 1, '{}', 14),
(68, 4, 'mobile_device', 'text', 'Mobile Device', 0, 1, 1, 1, 1, 1, '{}', 15),
(70, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(71, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(77, 5, 'belong_to', 'select_dropdown', 'Belong To', 0, 1, 1, 1, 1, 1, '{}', 6),
(79, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(80, 14, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(81, 14, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(82, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(83, 5, 'category_belongsto_packagetype_relationship', 'relationship', 'type', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Packagetype\",\"table\":\"packagetypes\",\"type\":\"belongsTo\",\"column\":\"belong_to\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"app_users\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(84, 4, 'user_files_cat', 'text', 'User Files Cat', 0, 1, 1, 0, 0, 1, '{}', 11),
(85, 4, 'user_videos_cat', 'text', 'User Videos Cat', 0, 1, 1, 0, 0, 1, '{}', 12),
(86, 4, 'isactive', 'text', 'Isactive', 0, 1, 1, 1, 1, 1, '{}', 17),
(87, 4, 'device_list', 'text', 'Device List', 0, 1, 1, 1, 1, 1, '{}', 18),
(88, 4, 'isBlocked', 'select_dropdown', 'IsBlocked', 1, 1, 1, 1, 1, 1, '{\"default\":\"0\",\"options\":{\"0\":\"Unblock\",\"1\":\"Block\"}}', 19);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(4, 'app_users', 'app-users', 'App User', 'App Users', NULL, 'App\\AppUser', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-29 01:58:42', '2020-05-11 20:33:32'),
(5, 'categories', 'categories', 'Category', 'Categories', NULL, 'App\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-29 01:59:58', '2020-03-31 02:06:50'),
(6, 'files', 'files', 'File', 'Files', NULL, 'App\\File', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-29 02:01:41', '2020-03-29 00:44:00'),
(9, 'videos', 'videos', 'Video', 'Videos', NULL, 'App\\Video', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-29 02:05:52', '2020-03-29 00:44:17'),
(10, 'pdfs', 'pdfs', 'Pdf', 'Pdfs', NULL, 'App\\Pdf', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-29 02:09:55', '2020-03-29 00:42:01'),
(11, 'payments', 'payments', 'Payment', 'Payments', NULL, 'App\\Payment', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-03-02 12:54:00', '2020-03-07 16:30:14'),
(12, 'datas', 'datas', 'Data', 'Data', NULL, 'App\\Data', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-03-31 01:50:31', '2020-03-31 01:50:31'),
(14, 'packagetypes', 'packagetypes', 'Packagetype', 'Packagetypes', NULL, 'App\\Packagetype', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-03-31 02:03:13', '2020-03-31 02:03:13');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) UNSIGNED NOT NULL,
  `file_name` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(2, 'admin_user', '2020-02-29 02:15:40', '2020-02-29 02:15:40');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-02-28 12:46:53', '2020-02-28 12:46:53', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2020-02-28 12:46:53', '2020-02-28 12:46:53', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2020-02-28 12:46:53', '2020-02-28 12:46:53', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2020-02-28 12:46:53', '2020-02-28 12:46:53', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2020-02-28 12:46:53', '2020-02-28 12:46:53', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2020-02-28 12:46:53', '2020-02-28 12:46:53', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2020-02-28 12:46:53', '2020-02-28 12:46:53', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2020-02-28 12:46:53', '2020-02-28 12:46:53', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2020-02-28 12:46:53', '2020-02-28 12:46:53', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2020-02-28 12:46:53', '2020-02-28 12:46:53', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2020-02-28 12:46:53', '2020-02-28 12:46:53', 'voyager.hooks', NULL),
(12, 1, 'App Users', '', '_self', 'voyager-people', '#000000', NULL, 15, '2020-02-29 01:58:42', '2020-02-29 02:11:31', 'voyager.app-users.index', 'null'),
(13, 1, 'User Categories', '', '_self', 'voyager-data', '#000000', NULL, 16, '2020-02-29 01:59:58', '2020-03-07 16:42:05', 'voyager.categories.index', 'null'),
(14, 1, 'Files', '', '_self', 'voyager-file-text', '#000000', NULL, 17, '2020-02-29 02:01:41', '2020-02-29 02:12:38', 'voyager.files.index', 'null'),
(15, 1, 'Videos', '', '_self', 'voyager-video', '#000000', NULL, 18, '2020-02-29 02:05:53', '2020-02-29 02:12:52', 'voyager.videos.index', 'null'),
(16, 1, 'Pdfs', '', '_self', 'voyager-documentation', '#000000', NULL, 19, '2020-02-29 02:09:55', '2020-02-29 02:13:31', 'voyager.pdfs.index', 'null'),
(17, 2, 'App Users', '', '_self', 'voyager-people', '#000000', NULL, 20, '2020-02-29 02:18:40', '2020-02-29 02:18:40', 'voyager.app-users.index', 'null'),
(18, 2, 'User Categories', '', '_self', 'voyager-data', '#000000', NULL, 21, '2020-02-29 02:19:09', '2020-03-07 16:25:57', 'voyager.categories.index', 'null'),
(19, 2, 'Files', '', '_self', 'voyager-file-text', '#000000', NULL, 22, '2020-02-29 02:19:35', '2020-02-29 02:19:35', 'voyager.files.index', 'null'),
(20, 2, 'Videos', '', '_self', 'voyager-video', '#000000', NULL, 23, '2020-02-29 02:20:08', '2020-02-29 02:20:08', 'voyager.videos.index', 'null'),
(21, 2, 'Pdfs', '', '_self', 'voyager-documentation', '#000000', NULL, 24, '2020-02-29 02:20:35', '2020-02-29 02:20:35', 'voyager.pdfs.index', 'null'),
(22, 1, 'Payments', '', '_self', NULL, NULL, NULL, 25, '2020-03-02 12:54:00', '2020-03-02 12:54:00', 'voyager.payments.index', NULL),
(23, 2, 'Payments', '', '_self', 'voyager-book-download', '#000000', NULL, 26, '2020-03-07 16:39:07', '2020-03-07 16:39:07', 'voyager.payments.index', 'null'),
(26, 1, 'Packagetypes', '', '_self', NULL, NULL, NULL, 27, '2020-03-31 02:03:13', '2020-03-31 02:03:13', 'voyager.packagetypes.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `packagetypes`
--

CREATE TABLE `packagetypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packagetypes`
--

INSERT INTO `packagetypes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'PDF', '2020-03-31 02:03:26', '2020-03-31 02:03:26'),
(2, 'Videos', '2020-03-31 02:03:33', '2020-03-31 02:03:33'),
(3, 'Files', '2020-03-31 02:03:39', '2020-03-31 02:03:39');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pdfs`
--

CREATE TABLE `pdfs` (
  `id` int(10) UNSIGNED NOT NULL,
  `pdf_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdf` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(2, 'browse_bread', NULL, '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(3, 'browse_database', NULL, '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(4, 'browse_media', NULL, '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(5, 'browse_compass', NULL, '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(6, 'browse_menus', 'menus', '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(7, 'read_menus', 'menus', '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(8, 'edit_menus', 'menus', '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(9, 'add_menus', 'menus', '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(10, 'delete_menus', 'menus', '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(11, 'browse_roles', 'roles', '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(12, 'read_roles', 'roles', '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(13, 'edit_roles', 'roles', '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(14, 'add_roles', 'roles', '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(15, 'delete_roles', 'roles', '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(16, 'browse_users', 'users', '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(17, 'read_users', 'users', '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(18, 'edit_users', 'users', '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(19, 'add_users', 'users', '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(20, 'delete_users', 'users', '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(21, 'browse_settings', 'settings', '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(22, 'read_settings', 'settings', '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(23, 'edit_settings', 'settings', '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(24, 'add_settings', 'settings', '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(25, 'delete_settings', 'settings', '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(26, 'browse_hooks', NULL, '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(27, 'browse_app_users', 'app_users', '2020-02-29 01:58:42', '2020-02-29 01:58:42'),
(28, 'read_app_users', 'app_users', '2020-02-29 01:58:42', '2020-02-29 01:58:42'),
(29, 'edit_app_users', 'app_users', '2020-02-29 01:58:42', '2020-02-29 01:58:42'),
(30, 'add_app_users', 'app_users', '2020-02-29 01:58:42', '2020-02-29 01:58:42'),
(31, 'delete_app_users', 'app_users', '2020-02-29 01:58:42', '2020-02-29 01:58:42'),
(32, 'browse_categories', 'categories', '2020-02-29 01:59:58', '2020-02-29 01:59:58'),
(33, 'read_categories', 'categories', '2020-02-29 01:59:58', '2020-02-29 01:59:58'),
(34, 'edit_categories', 'categories', '2020-02-29 01:59:58', '2020-02-29 01:59:58'),
(35, 'add_categories', 'categories', '2020-02-29 01:59:58', '2020-02-29 01:59:58'),
(36, 'delete_categories', 'categories', '2020-02-29 01:59:58', '2020-02-29 01:59:58'),
(37, 'browse_files', 'files', '2020-02-29 02:01:41', '2020-02-29 02:01:41'),
(38, 'read_files', 'files', '2020-02-29 02:01:41', '2020-02-29 02:01:41'),
(39, 'edit_files', 'files', '2020-02-29 02:01:41', '2020-02-29 02:01:41'),
(40, 'add_files', 'files', '2020-02-29 02:01:41', '2020-02-29 02:01:41'),
(41, 'delete_files', 'files', '2020-02-29 02:01:41', '2020-02-29 02:01:41'),
(42, 'browse_videos', 'videos', '2020-02-29 02:05:53', '2020-02-29 02:05:53'),
(43, 'read_videos', 'videos', '2020-02-29 02:05:53', '2020-02-29 02:05:53'),
(44, 'edit_videos', 'videos', '2020-02-29 02:05:53', '2020-02-29 02:05:53'),
(45, 'add_videos', 'videos', '2020-02-29 02:05:53', '2020-02-29 02:05:53'),
(46, 'delete_videos', 'videos', '2020-02-29 02:05:53', '2020-02-29 02:05:53'),
(47, 'browse_pdfs', 'pdfs', '2020-02-29 02:09:55', '2020-02-29 02:09:55'),
(48, 'read_pdfs', 'pdfs', '2020-02-29 02:09:55', '2020-02-29 02:09:55'),
(49, 'edit_pdfs', 'pdfs', '2020-02-29 02:09:55', '2020-02-29 02:09:55'),
(50, 'add_pdfs', 'pdfs', '2020-02-29 02:09:55', '2020-02-29 02:09:55'),
(51, 'delete_pdfs', 'pdfs', '2020-02-29 02:09:55', '2020-02-29 02:09:55'),
(52, 'browse_payments', 'payments', '2020-03-02 12:54:00', '2020-03-02 12:54:00'),
(53, 'read_payments', 'payments', '2020-03-02 12:54:00', '2020-03-02 12:54:00'),
(54, 'edit_payments', 'payments', '2020-03-02 12:54:00', '2020-03-02 12:54:00'),
(55, 'add_payments', 'payments', '2020-03-02 12:54:00', '2020-03-02 12:54:00'),
(56, 'delete_payments', 'payments', '2020-03-02 12:54:00', '2020-03-02 12:54:00'),
(57, 'browse_datas', 'datas', '2020-03-31 01:50:32', '2020-03-31 01:50:32'),
(58, 'read_datas', 'datas', '2020-03-31 01:50:32', '2020-03-31 01:50:32'),
(59, 'edit_datas', 'datas', '2020-03-31 01:50:32', '2020-03-31 01:50:32'),
(60, 'add_datas', 'datas', '2020-03-31 01:50:32', '2020-03-31 01:50:32'),
(61, 'delete_datas', 'datas', '2020-03-31 01:50:32', '2020-03-31 01:50:32'),
(67, 'browse_packagetypes', 'packagetypes', '2020-03-31 02:03:13', '2020-03-31 02:03:13'),
(68, 'read_packagetypes', 'packagetypes', '2020-03-31 02:03:13', '2020-03-31 02:03:13'),
(69, 'edit_packagetypes', 'packagetypes', '2020-03-31 02:03:13', '2020-03-31 02:03:13'),
(70, 'add_packagetypes', 'packagetypes', '2020-03-31 02:03:13', '2020-03-31 02:03:13'),
(71, 'delete_packagetypes', 'packagetypes', '2020-03-31 02:03:13', '2020-03-31 02:03:13');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 5),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(27, 5),
(28, 1),
(28, 5),
(29, 1),
(29, 5),
(30, 1),
(30, 5),
(31, 1),
(31, 5),
(32, 1),
(32, 5),
(33, 1),
(33, 5),
(34, 1),
(34, 5),
(35, 1),
(35, 5),
(36, 1),
(36, 5),
(37, 1),
(37, 5),
(38, 1),
(38, 5),
(39, 1),
(39, 5),
(40, 1),
(40, 5),
(41, 1),
(41, 5),
(42, 1),
(42, 5),
(43, 1),
(43, 5),
(44, 1),
(44, 5),
(45, 1),
(45, 5),
(46, 1),
(46, 5),
(47, 1),
(47, 5),
(48, 1),
(48, 5),
(49, 1),
(49, 5),
(50, 1),
(50, 5),
(51, 1),
(51, 5),
(52, 1),
(52, 5),
(53, 1),
(53, 5),
(54, 1),
(54, 5),
(55, 1),
(55, 5),
(56, 1),
(56, 5),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(2, 'user', 'Normal User', '2020-02-28 12:46:53', '2020-02-28 12:46:53'),
(5, 'AppAdmin', 'App Admin', '2020-03-02 12:58:22', '2020-03-02 12:58:22');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Study Portal', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'UPSC', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings/March2020/TRvGDCaGB7c4BSdoVie0.jpg', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings/March2020/SutaiLKa6dmeQ4hBoQdQ.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Study Portal', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Study Portal.', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings/March2020/oxThzj7gIp88GIMl6L2z.jpg', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'admin@gmail.com', 'users/default.png', NULL, '$2y$10$Yxg.LKZLDFzgWh.4PwAJK.2demDxgbnDDQraVVwjOM8MiqCkOSPoG', 'gAsc1YunUtcXDEnvoehZEUiqfhG843NQjcKmQnsDo1mrBK5hLKlL9d76A7vt', NULL, '2020-02-28 12:47:29', '2020-02-28 12:47:29'),
(2, 5, 'Administrator', 'admin.exam@gmail.com', 'users/March2020/VfKroQhdnDNuj3WKAIbP.jpg', NULL, '$2y$10$PYbx8JrfnfY/iJIrPwKuZuQRC3qYImzGsC5jqsTAoSuue5HAqaB3y', 'LRhlJZBsccDZXmLB7wTHuYAI0jpGjwZcRQwPdkeafqcaWPiTP4UXWkUsM0wP', '{\"locale\":\"en\"}', '2020-02-29 01:40:08', '2020-03-02 13:00:14'),
(3, 5, 'admin', 'admin.new@gmail.com', 'users/default.png', NULL, '$2y$10$Q2hPOnFoHRnQI9dX.eW3lu4z074WszFe/VvJHNAwAS0V9jhztu0zK', 'jdz8c5oqjsCHKehrspWu75V7QVI5xLShMWDcArtC4IMnd3jlTL6eJsxzPwJO', '{\"locale\":\"en\"}', '2020-03-29 19:49:01', '2020-03-29 19:49:01');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(10) UNSIGNED NOT NULL,
  `video_name` text COLLATE utf8mb4_unicode_ci,
  `type` int(11) DEFAULT NULL,
  `video` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_users`
--
ALTER TABLE `app_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packagetypes`
--
ALTER TABLE `packagetypes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pdfs`
--
ALTER TABLE `pdfs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_users`
--
ALTER TABLE `app_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `packagetypes`
--
ALTER TABLE `packagetypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pdfs`
--
ALTER TABLE `pdfs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
