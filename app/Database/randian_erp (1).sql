-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2024 at 02:04 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `randian_erp`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `application_name` varchar(75) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `url` varchar(55) DEFAULT NULL,
  `theme_color` varchar(25) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `application_name`, `description`, `url`, `theme_color`, `deleted_at`) VALUES
(1, 'RandianHRIS', 'Human Resources Information System', 'hris', '#cc004c', NULL),
(2, 'RandianCRM', 'Customer Relationship Management', 'crm', '#863402', NULL),
(3, 'RandianInventory', 'Inventory Management', 'inv', '#6460aa', NULL),
(4, 'RandianFAM', 'Fixed Asset Management', 'fam', '#2b367d', NULL),
(5, 'RandianFIN', 'Finance Management', 'fin', '#fcb711', NULL),
(6, 'RandianMFG', 'Manufacturing Management', 'mfg', '#f37021', NULL),
(7, 'RandianPM', 'Project Management', 'pm', '#865c34', NULL),
(8, 'RandianPUR', 'Purchasing Management', 'pur', '#0089d0', NULL),
(9, 'RandianSCM', 'Supply Chain Management', 'scm', '#89906e', NULL),
(10, 'RandianWMS', 'Warehouse Management System', 'wms', '#0db14b', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `address1` text DEFAULT NULL,
  `address2` text DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `state` varchar(55) DEFAULT NULL,
  `country` varchar(55) DEFAULT NULL,
  `slug_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `company_name`, `address1`, `address2`, `city`, `state`, `country`, `slug_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ABC Company', '#123 Mahagony St.', NULL, 'Alabang', 'Metro Manila', 'Philippines', 'co_FGmezp2G8V2oZ67KPxTN8g3vK', '2023-12-12 01:13:37', NULL, NULL),
(2, 'XYZ Company', NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-17 05:52:36', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company_installed_apps`
--

CREATE TABLE `company_installed_apps` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `application_id` int(11) DEFAULT NULL,
  `app_status` enum('active','inactive','cancelled') DEFAULT 'active',
  `app_slug` text DEFAULT NULL,
  `subscribed_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company_installed_apps`
--

INSERT INTO `company_installed_apps` (`id`, `company_id`, `application_id`, `app_status`, `app_slug`, `subscribed_at`, `deleted_at`) VALUES
(1, 1, 1, 'active', 'hris_GZ8tquLNZa43FUdASbnOMrgn1', '2024-02-12 11:13:01', NULL),
(2, 1, 2, 'active', 'crm_Hd9xaeJXYa34UFuBSBnOMrgn0', '2024-02-12 11:13:01', NULL),
(3, 1, 3, 'active', 'inv_GZ8tquZCVa23UFAbSBnOMrgn0', '2024-02-12 11:13:21', NULL),
(4, 1, 4, 'active', 'fam_GZ8tquZCVa23UFAbSBnOMrgn0', '2024-02-12 11:13:21', NULL),
(5, 1, 5, 'active', 'fin_GZ8tquZCVa23UFAbSBnOMrgn0', '2024-02-12 11:13:21', NULL),
(6, 1, 6, 'active', 'mfg_GZ8tquZCVa23UFAbSBnOMrgn0', '2024-02-12 11:13:21', NULL),
(7, 1, 7, 'active', 'pm_GZ8tquZCVa23UFAbSBnOMrgn0', '2024-02-12 11:13:21', NULL),
(8, 1, 8, 'active', 'pur_GZ8tquZCVa23UFAbSBnOMrgn0', '2024-02-12 11:13:21', NULL),
(9, 1, 9, 'active', 'scm_GZ8tquZCVa23UFAbSBnOMrgn0', '2024-02-12 11:13:21', NULL),
(10, 1, 10, 'active', 'wms_GZ8tquZCVa23UFAbSBnOMrgn0', '2024-02-12 11:13:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `company_id` int(20) DEFAULT NULL,
  `department` varchar(75) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `division` varchar(75) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `employee_no` varchar(25) DEFAULT NULL,
  `firstname` varchar(55) DEFAULT NULL,
  `middlename` varchar(55) DEFAULT NULL,
  `lastname` varchar(55) DEFAULT NULL,
  `name_extension` varchar(55) DEFAULT NULL,
  `employee_class_id` int(11) DEFAULT NULL,
  `paid_on_legal` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-No; 1-Yes',
  `paid_on_special` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-No; 1-Yes',
  `job_title_id` int(11) DEFAULT NULL,
  `date_hired` date DEFAULT NULL,
  `date_probationary` date DEFAULT NULL,
  `date_regularized` date DEFAULT NULL,
  `division_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `reports_to` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `lead_type` enum('individual','organization') DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `salutation_id` int(11) DEFAULT NULL,
  `firstname` varchar(75) DEFAULT NULL,
  `lastname` varchar(75) DEFAULT NULL,
  `middlename` varchar(75) DEFAULT NULL,
  `job_title_id` int(11) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `contact_person_job_title_id` int(11) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `industry_id` int(11) DEFAULT NULL,
  `messaging_app_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `website` text DEFAULT NULL,
  `mobile_number` varchar(55) DEFAULT NULL,
  `phone_number` varchar(55) DEFAULT NULL,
  `fax` varchar(55) DEFAULT NULL,
  `no_of_employees` smallint(4) DEFAULT NULL,
  `lead_source_id` int(11) DEFAULT NULL,
  `lead_status_id` int(11) DEFAULT NULL,
  `lead_owner_id` bigint(20) DEFAULT NULL,
  `street` text DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `state_province` varchar(75) DEFAULT NULL,
  `zip_code` varchar(15) DEFAULT NULL,
  `description_information` longtext DEFAULT NULL,
  `slug_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `company_id`, `lead_type`, `photo`, `salutation_id`, `firstname`, `lastname`, `middlename`, `job_title_id`, `company_name`, `contact_person`, `contact_person_job_title_id`, `email_address`, `industry_id`, `messaging_app_id`, `country_id`, `website`, `mobile_number`, `phone_number`, `fax`, `no_of_employees`, `lead_source_id`, `lead_status_id`, `lead_owner_id`, `street`, `city`, `state_province`, `zip_code`, `description_information`, `slug_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES
(1, 1, 'individual', NULL, 109, 'John', 'Doe', NULL, 2, 'ABC Company', 'Jane Doe', 23, 'john.doe@gmail.com', 81, 64, 86, 'https://www.my-website.com', '09777201020', NULL, NULL, 100, 90, 108, 1, 'Imperial Homes Subd.', 'Silang', 'Cavite', '4118', NULL, 'lead_NdxyLImDMkREwOyegxfFwQ190', '2024-02-21 05:11:24', 1, NULL, NULL, NULL, NULL),
(3, 1, 'organization', NULL, 109, '', '', NULL, 1, 'STI College', 'Jayson Sarino', 1, 'jasonsarino27@gmail.com', 78, 64, 86, 'https://www.sti.edu', '09385734511 ', '(049) 534-2719', NULL, 250, 89, 108, 1, 'Ruby Street, Santa Rosa Commercial Complex, Barangay Balibago', 'Santa Rosa ', 'Laguna', '4026', 'STI College is a private network of university/colleges and senior high schools in the Philippines. They primarily cater to computer science and information technology education, but also offer other courses, such as business management and accountancy.', 'lead_R45GlPmDMkREwOyDCffDD3jk0', '2024-02-21 05:11:24', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_process`
--

CREATE TABLE `sales_process` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `sales_process_name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `slug_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales_process`
--

INSERT INTO `sales_process` (`id`, `company_id`, `sales_process_name`, `description`, `created_by`, `slug_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 1, 'GemPhil Sales Process', 'GemPhil Sales Process', 1, 'sp_X2oXjBTKVASbXNXB6EdJ0Rsh5', '2024-02-20 05:21:28', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_process_staging`
--

CREATE TABLE `sales_process_staging` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `sales_process_id` int(11) DEFAULT NULL,
  `stage_name` varchar(255) DEFAULT NULL,
  `probability_closing` smallint(3) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `goals` text DEFAULT NULL,
  `deal_category` enum('open','closed_won','closed_lost') NOT NULL DEFAULT 'open',
  `slug_id` text DEFAULT NULL,
  `sort` smallint(2) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales_process_staging`
--

INSERT INTO `sales_process_staging` (`id`, `company_id`, `sales_process_id`, `stage_name`, `probability_closing`, `description`, `goals`, `deal_category`, `slug_id`, `sort`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(12, 1, 3, 'Initial Call', 0, 'Make first real contact with the lead', 'Schedule Demo', 'open', 'spstaging_QCgPchQFRvK2IJhQ2sTfW69e3', 0, 1, '2024-02-20 16:38:34', NULL, NULL),
(13, 1, 3, 'Make Introduction', 0, 'Quick overview of the program, try and schedule a demo', 'Schedule Demo', 'open', 'spstaging_3mVRPZ9g46iScy6aeADGDpZQH', 1, 1, '2024-02-20 16:41:45', NULL, NULL),
(14, 1, 3, 'Schedule Demo', 30, 'If the demo is not scheduled during the introduction, call back and set-up a time to go over PPT', 'If the demo is not scheduled during the introduction, call back and set-up a time to go over PPT', 'open', 'spstaging_aRTuw4BWV6VVcnhwhacgufisy', 2, 1, '2024-02-20 16:42:15', NULL, NULL),
(15, 1, 3, 'Solidify Interest', 50, 'Follow-up on PPT, answer questions, overcome objections', 'Get Commitment', 'open', 'spstaging_M7WAgljfOnaf68ab4H1ZyY2HQ', 3, 1, '2024-02-20 16:42:42', NULL, NULL),
(16, 1, 3, 'Complete Demo', 70, 'Take the lead and other contacts through the PPT, try and gain commitment', 'Take the lead and other contacts through the PPT, try and gain commitment', 'open', 'spstaging_VZfCPiZutKEvLU1j23wVDGrb0', 4, 1, '2024-02-20 16:42:58', NULL, NULL),
(17, 1, 3, 'Schedule Install', 90, 'Set up a time with the office to install either in person or remotely', 'Set up a time with the office to install either in person or remotely', 'open', 'spstaging_5gy4w75gDyOZSXkRwQy1jC7G7', 5, 1, '2024-02-20 16:43:18', NULL, NULL),
(18, 1, 3, 'Install / Deployed', 100, 'Complete install, go over application with staff', 'Establish Account', 'closed_won', 'spstaging_tvJHeWG2hLOFMifNSfAbRzEmH', 6, 1, '2024-02-20 16:43:43', NULL, NULL),
(19, 1, 3, 'Project Rejected', 0, 'Project Rejected', 'Project Rejected', 'closed_lost', 'spstaging_hv2M6Bfv27FVuUKpmSTYUA2k1', 7, 1, '2024-02-20 16:47:42', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_parameter`
--

CREATE TABLE `system_parameter` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `category` varchar(55) DEFAULT NULL,
  `parameter_name` varchar(255) DEFAULT NULL,
  `modules` text DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_parameter`
--

INSERT INTO `system_parameter` (`id`, `company_id`, `category`, `parameter_name`, `modules`, `created_by`, `created_at`, `deleted_at`) VALUES
(1, 1, 'job_title', 'Senior Programmer', '[\"hris\",\"crm\"]', 1, '2023-12-15 22:54:56', NULL),
(2, 1, 'job_title', 'Marketer', '[\"hris\",\"crm\"]', 1, '2023-12-15 22:54:56', NULL),
(3, 1, 'gender', 'Male', '[\"hris\"]', 1, '2023-12-21 06:58:26', NULL),
(4, 1, 'gender', 'Female', '[\"hris\"]', 1, '2023-12-21 06:58:26', NULL),
(11, 1, 'job_title', 'Web Developer', '[\"hris\",\"crm\"]', 1, '2024-01-08 10:59:44', NULL),
(12, 1, 'job_title', 'Virtual Assistant', '[\"hris\",\"crm\"]', 1, '2024-01-08 10:59:51', NULL),
(18, 1, 'marital_status', 'Single', '[\"hris\"]', 1, '2024-01-09 06:47:43', NULL),
(19, 1, 'marital_status', 'Married', '[\"hris\"]', 1, '2024-01-09 06:47:43', NULL),
(20, 1, 'marital_status', 'Divorced/Separated', '[\"hris\"]', 1, '2024-01-09 06:48:13', NULL),
(21, 1, 'marital_status', 'Widowed', '[\"hris\"]', 1, '2024-01-09 06:49:16', NULL),
(22, 1, 'marital_status', 'Never Married', '[\"hris\"]', 1, '2024-01-09 06:49:16', NULL),
(23, 1, 'job_title', 'Teacher', '[\"hris\",\"crm\"]', 1, '2024-01-11 10:08:25', NULL),
(24, 1, 'gender', 'Unknown1', '[\"hris\"]', 1, '2024-01-30 00:22:03', '2024-01-30 00:22:11'),
(25, 1, 'ethnicity', 'Asian', '[\"hris\"]', 1, '2024-02-05 12:22:05', NULL),
(26, 1, 'ethnicity', 'White American', '[\"hris\"]', 1, '2024-02-05 12:22:05', NULL),
(27, 1, 'ethnicity', 'Black American', '[\"hris\"]', 1, '2024-02-05 12:22:05', NULL),
(28, 1, 'ethnicity', 'Puerto Ricans', '[\"hris\"]', 1, '2024-02-05 12:22:05', NULL),
(29, 1, 'religion', 'Roman Catholic', '[\"hris\"]', 1, '2024-02-05 12:24:41', NULL),
(30, 1, 'religion', 'Iglesia Ni Cristo', '[\"hris\"]', 1, '2024-02-05 12:24:41', NULL),
(31, 1, 'religion', 'Islam', '[\"hris\"]', 1, '2024-02-05 12:24:41', NULL),
(32, 1, 'religion', 'Buddhism', '[\"hris\"]', 1, '2024-02-05 12:24:41', NULL),
(33, 1, 'religion', 'Evangelicals', '[\"hris\"]', 1, '2024-02-05 12:24:41', NULL),
(34, 1, 'religion', 'Muslim', '[\"hris\"]', 1, '2024-02-05 12:24:41', NULL),
(35, 1, 'religion', 'Philippine Independent Church', '[\"hris\"]', 1, '2024-02-05 12:24:41', NULL),
(36, 1, 'religion', 'Seventh-day Adventist', '[\"hris\"]', 1, '2024-02-05 12:24:41', NULL),
(37, 1, 'nationality', 'Filipino', '[\"hris\"]', 1, '2024-02-05 12:24:41', NULL),
(38, 1, 'nationality', 'French', '[\"hris\"]', 1, '2024-02-05 12:24:41', NULL),
(39, 1, 'nationality', 'German', '[\"hris\"]', 1, '2024-02-05 12:24:41', NULL),
(40, 1, 'nationality', 'Indian', '[\"hris\"]', 1, '2024-02-05 12:24:41', NULL),
(41, 1, 'blood_type', 'Type AB', '[\"hris\"]', 1, '2024-02-05 12:31:31', NULL),
(42, 1, 'blood_type', 'A-', '[\"hris\"]', 1, '2024-02-05 12:31:31', NULL),
(43, 1, 'blood_type', 'B', '[\"hris\"]', 1, '2024-02-05 04:32:27', NULL),
(44, 1, 'blood_type', 'B+', '[\"hris\"]', 1, '2024-02-05 04:32:33', NULL),
(45, 1, 'blood_type', 'A+', '[\"hris\"]', 1, '2024-02-05 04:32:40', NULL),
(46, 1, 'blood_type', 'O-', '[\"hris\"]', 1, '2024-02-05 04:32:47', NULL),
(47, 1, 'blood_type', 'O+', '[\"hris\"]', 1, '2024-02-05 04:32:55', NULL),
(48, 1, 'blood_type', 'A', '[\"hris\"]', 1, '2024-02-05 04:33:01', NULL),
(49, 1, 'blood_type', 'AB', '[\"hris\"]', 1, '2024-02-05 04:33:03', NULL),
(50, 1, 'blood_type', 'O', '[\"hris\"]', 1, '2024-02-05 04:33:05', NULL),
(51, 1, 'employee_status', 'Contractual', '[\"hris\"]', 1, '2024-02-05 12:31:31', NULL),
(52, 1, 'employee_status', 'Probationary', '[\"hris\"]', 1, '2024-02-05 12:31:31', NULL),
(53, 1, 'employee_status', 'Regular', '[\"hris\"]', 1, '2024-02-05 12:31:31', NULL),
(54, 1, 'employee_status', 'Terminated', '[\"hris\"]', 1, '2024-02-05 12:31:31', NULL),
(55, 1, 'training_types', 'Apprenticeship Training', '[\"hris\"]', 1, '2024-02-06 01:25:35', NULL),
(56, 1, 'training_types', 'Coaching', '[\"hris\"]', 1, '2024-02-06 01:25:35', NULL),
(57, 1, 'training_types', 'Case Studies', '[\"hris\"]', 1, '2024-02-06 01:25:35', NULL),
(58, 1, 'training_types', 'Product Training', '[\"hris\"]', 1, '2024-02-06 01:25:35', NULL),
(59, 1, 'training_types', 'Onboarding', '[\"hris\"]', 1, '2024-02-06 01:25:35', NULL),
(60, 1, 'training_types', 'Orientation', '[\"hris\"]', 1, '2024-02-06 01:25:35', NULL),
(61, 1, 'training_types', 'Leadership Development', '[\"hris\"]', 1, '2024-02-06 01:25:35', NULL),
(62, 1, 'training_types', 'Quality Training', '[\"hris\"]', 1, '2024-02-06 01:25:35', NULL),
(63, 1, 'messaging_app', 'FB messenger', '[\"crm\"]', 1, '2023-12-15 22:54:56', NULL),
(64, 1, 'messaging_app', 'Viber', '[\"crm\"]', 1, '2024-02-20 10:32:09', NULL),
(65, 1, 'messaging_app', 'Skype', '[\"crm\"]', 1, '2024-02-20 10:32:09', NULL),
(66, 1, 'messaging_app', 'Viber', '[\"crm\"]', 1, '2024-02-20 10:32:09', NULL),
(67, 1, 'messaging_app', 'LinkedIn', '[\"crm\"]', 1, '2024-02-20 10:32:09', NULL),
(68, 1, 'messaging_app', 'LinkedIn', '[\"crm\"]', 1, '2024-02-20 10:32:09', NULL),
(69, 1, 'messaging_app', 'Microsoft Teams', '[\"crm\"]', 1, '2024-02-20 10:32:09', NULL),
(70, 1, 'messaging_app', 'Telegram', '[\"crm\"]', 1, '2024-02-20 10:32:09', NULL),
(71, 1, 'messaging_app', 'WeChat', '[\"crm\"]', 1, '2024-02-20 10:32:09', NULL),
(72, 1, 'messaging_app', 'Line', '[\"crm\"]', 1, '2024-02-20 10:32:09', NULL),
(73, 1, 'messaging_app', 'Discord', '[\"crm\"]', 1, '2024-02-20 10:32:09', NULL),
(74, 1, 'messaging_app', 'Slack', '[\"crm\"]', 1, '2024-02-20 10:32:09', NULL),
(75, 1, 'messaging_app', 'N/A', '[\"crm\"]', 1, '2024-02-20 10:32:09', NULL),
(76, 1, 'industry', 'Automotive', '[\"crm\"]', 1, '2024-02-20 10:42:39', NULL),
(77, 1, 'industry', 'Manufacturing', '[\"crm\"]', 1, '2024-02-20 10:42:39', NULL),
(78, 1, 'industry', 'IT', '[\"crm\"]', 1, '2024-02-20 10:42:39', NULL),
(79, 1, 'industry', 'Telco', '[\"crm\"]', 1, '2024-02-20 10:42:39', NULL),
(80, 1, 'industry', 'NGO', '[\"crm\"]', 1, '2024-02-20 10:42:39', NULL),
(81, 1, 'industry', 'Construction', '[\"crm\"]', 1, '2024-02-20 10:42:39', NULL),
(82, 1, 'industry', 'Real Estate', '[\"crm\"]', 1, '2024-02-20 10:42:39', NULL),
(83, 1, 'industry', 'Tourism', '[\"crm\"]', 1, '2024-02-20 10:42:39', NULL),
(84, 1, 'industry', 'Agriculture', '[\"crm\"]', 1, '2024-02-20 10:42:39', NULL),
(85, 1, 'industry', 'Healthcate', '[\"crm\"]', 1, '2024-02-20 10:42:39', NULL),
(86, 1, 'country', 'Philippines', '[\"crm\"]', 1, '2024-02-20 11:57:18', NULL),
(87, 1, 'lead_source', 'Google', '[\"crm\"]', 1, '2024-02-20 11:57:18', NULL),
(88, 1, 'lead_source', '123456', '[\"crm\"]', 1, '2024-02-20 04:00:21', '2024-02-20 04:02:10'),
(89, 1, 'lead_source', 'Facebook', '[\"crm\"]', 1, '2024-02-20 04:02:45', NULL),
(90, 1, 'lead_source', 'LinkedIn', '[\"crm\"]', 1, '2024-02-20 04:02:54', NULL),
(91, 1, 'lead_source', 'Yellow Pages', '[\"crm\"]', 1, '2024-02-20 04:03:00', NULL),
(92, 1, 'lead_source', 'Employee Referral', '[\"crm\"]', 1, '2024-02-20 04:03:34', NULL),
(93, 1, 'lead_source', 'External Referral', '[\"crm\"]', 1, '2024-02-20 04:03:44', NULL),
(94, 1, 'lead_source', 'Advertisement', '[\"crm\"]', 1, '2024-02-20 04:03:51', NULL),
(95, 1, 'lead_source', 'Twitter', '[\"crm\"]', 1, '2024-02-20 04:04:04', NULL),
(96, 1, 'lead_source', 'Partner', '[\"crm\"]', 1, '2024-02-20 04:04:32', NULL),
(97, 1, 'lead_source', 'Google+', '[\"crm\"]', 1, '2024-02-20 04:04:35', NULL),
(98, 1, 'lead_source', 'Public Relations', '[\"crm\"]', 1, '2024-02-20 04:04:47', NULL),
(99, 1, 'lead_source', 'Seminar Partner', '[\"crm\"]', 1, '2024-02-20 04:05:17', NULL),
(100, 1, 'lead_source', 'Trade Show', '[\"crm\"]', 1, '2024-02-20 04:05:25', NULL),
(101, 1, 'lead_source', 'Web Research', '[\"crm\"]', 1, '2024-02-20 04:05:35', NULL),
(102, 1, 'lead_status', 'Lead Created', '[\"crm\"]', 1, '2024-02-20 04:00:21', NULL),
(103, 1, 'lead_status', 'Lead Qualified', '[\"crm\"]', 1, '2024-02-20 04:07:07', NULL),
(104, 1, 'lead_status', 'Meeting Scheduled', '[\"crm\"]', 1, '2024-02-20 04:07:19', NULL),
(105, 1, 'lead_status', 'Attempted to Contact', '[\"crm\"]', 1, '2024-02-20 04:07:42', NULL),
(106, 1, 'lead_status', 'Contact in Future', '[\"crm\"]', 1, '2024-02-20 04:07:57', NULL),
(107, 1, 'lead_status', 'Contacted', '[\"crm\"]', 1, '2024-02-20 04:08:05', NULL),
(108, 1, 'lead_status', 'Open - Not Contacted', '[\"crm\"]', 1, '2024-02-20 17:22:20', NULL),
(109, 1, 'salutation', 'Mr.', '[\"hris\",\"crm\"]', 1, '2024-02-21 03:49:51', NULL),
(110, 1, 'salutation', 'Mrs.', '[\"hris\",\"crm\"]', 1, '2024-02-21 03:49:51', NULL),
(111, 1, 'salutation', 'Ms.', '[\"hris\",\"crm\"]', 1, '2024-02-21 03:49:51', NULL),
(112, 1, 'salutation', 'Dr.', '[\"hris\",\"crm\"]', 1, '2024-02-21 03:49:51', NULL),
(113, 1, 'salutation', 'Prof.', '[\"crm\"]', 1, '2024-02-20 20:19:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `job_title_id` int(11) DEFAULT NULL,
  `user_role_id` int(11) DEFAULT NULL,
  `firstname` varchar(75) DEFAULT NULL,
  `lastname` varchar(75) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `marital_status` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile_number` varchar(55) DEFAULT NULL,
  `phone_number` varchar(55) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `slug_id` text DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `company_id`, `job_title_id`, `user_role_id`, `firstname`, `lastname`, `email_address`, `password`, `gender`, `marital_status`, `dob`, `mobile_number`, `phone_number`, `address`, `slug_id`, `photo`, `status`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 'Jayson', 'Sarino', 'jasonsarino27@gmail.com', '$2y$10$Y8NcEwRb8ZWYGEi/5GMA9eJs.9wdKv0x/2mJZ7ixNYJLT5Rdn2XMS', NULL, NULL, NULL, NULL, '', '', 'user_RFghY56UJo09', '1703155191_ba144bd2b35612061e80.png', 'active', NULL, '2023-12-15 22:55:49', NULL, NULL),
(80013, 1, 2, 2, 'Leonard', 'Zucci', 'leonard.zucci12@gmail.com', '$2y$10$KgFoz55Ae9VpOe5XtQQdH.NbfWboi4hRkcgm/QhpqEijBpavm2tRW', NULL, NULL, NULL, NULL, '', '', 'user_AQ2sZRpZKkX95Gyg9HfMMRC3O', '1703155514_6f1cf42bcaf462fd6641.png', 'active', 1, '2023-12-21 10:43:16', NULL, NULL),
(80014, 1, 1, 2, 'Fidel', 'Maceda', 'fidel.maceda@gmail.com', '$2y$10$MtkosAHdS4cJ.DUeWuwv.uBQDnNq5GSJLlthPxXwXSlAY/M/RmYFW', NULL, NULL, NULL, NULL, '', '', 'user_GZ8tquLNZa34UFuASBnOMrgn0', NULL, 'active', 1, '2023-12-21 12:09:18', NULL, NULL),
(80015, 1, 1, 2, 'Bryan', 'Hernandez', 'bryan.hernandez@gmail.com', '$2y$10$DxwkQFkj7boDSW9Cz1Ly0eCX3rQJC1O6JHpWpvJ8/LQjk4Rdg6gZG', NULL, NULL, NULL, NULL, '', '', 'user_m6OTKMVWqRET5GXwltXzFvhqE', NULL, 'active', 1, '2023-12-21 20:20:58', NULL, NULL),
(80016, 1, 1, 2, 'John', 'Doe', 'johndoe@gmail.com', '$2y$10$rOd81x1DuCE5pAH/jzw.MeIEANV1LGRPExC/v8.L7.G4H6krAoP5.', NULL, NULL, NULL, NULL, NULL, NULL, 'user_FMl0KYabzX0dNyvk5SB4OVj08', NULL, 'active', 1, '2024-01-09 23:35:17', NULL, NULL),
(80017, 1, 2, 6, 'Jane', 'Doe', 'janedoe@gmail.com', '$2y$10$tMSnb5GFfxXinpEdZGjtMuW53t88PXgm2pkJaMhlWxG/u0Nv3EcsS', 4, 18, '1989-09-27', '09777205040123', '09193297191456', 'Imperial Homes Village, Silang Cavite1111', 'user_EYE7bKmIFDg8UbYStyOlaCs8N', '1704843479_dd35b786686e7ba4fcba.png', 'active', 1, '2024-01-09 23:37:59', NULL, NULL),
(80025, NULL, NULL, NULL, 'Jerwin', 'Lalap', 'jerwin.jek@gmail.com', '$2y$10$j8VoswZuwRm1E6L0Wxli/.tkYLaXWC.yPxsrGoNAsoBJJZkI4yk6u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', NULL, '2024-03-24 13:00:15', '2024-03-24 13:00:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `role_name` varchar(55) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `permissions` longtext NOT NULL,
  `slug_id` text DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `company_id`, `role_name`, `description`, `permissions`, `slug_id`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Administrator', 'Administrator', 'fullaccess', 'role_dRt4H9KLi125', 1, '2023-12-15 22:53:52', NULL, NULL),
(2, 1, 'General Admin', 'General Admin', 'fullaccess', 'role_FgkOpe45fGV4N0', 1, '2023-12-16 22:20:05', NULL, NULL),
(5, 1, 'Office Staff', 'Office Staff Permissions', '[\"leads.view\",\"leads.add\",\"leads.delete\",\"deals.view\",\"deals.delete\"]', 'role_NdxyLImDMkREwOyegxf6Q1gLp', 1, '2023-12-21 13:41:01', NULL, NULL),
(6, 1, 'Virtual Assistant', 'Virtual Assistant', '[\"leads.view\",\"leads.add\"]', 'role_hTXmASKpVNhHvd9JzuEFwbHq1', 1, '2023-12-21 20:24:38', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `token` text DEFAULT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_installed_apps`
--
ALTER TABLE `company_installed_apps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `application_id` (`application_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `employee_class_id` (`employee_class_id`),
  ADD KEY `job_title_id` (`job_title_id`),
  ADD KEY `division_id` (`division_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `reports_to` (`reports_to`),
  ADD KEY `reports_to_2` (`reports_to`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `salutation_id` (`salutation_id`),
  ADD KEY `lead_source` (`lead_source_id`),
  ADD KEY `lead_status` (`lead_status_id`),
  ADD KEY `lead_owner` (`lead_owner_id`),
  ADD KEY `job_title_id` (`job_title_id`),
  ADD KEY `contact_person_job_title_id` (`contact_person_job_title_id`,`industry_id`,`messaging_app_id`,`country_id`,`lead_source_id`,`lead_status_id`,`lead_owner_id`),
  ADD KEY `contact_person_job_title_id_2` (`contact_person_job_title_id`,`industry_id`,`messaging_app_id`,`country_id`,`lead_source_id`,`lead_status_id`,`lead_owner_id`),
  ADD KEY `messaging_app` (`messaging_app_id`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `created_by` (`created_by`,`updated_by`,`deleted_by`),
  ADD KEY `modified_by` (`updated_by`),
  ADD KEY `deleted_by` (`deleted_by`);

--
-- Indexes for table `sales_process`
--
ALTER TABLE `sales_process`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `sales_process_staging`
--
ALTER TABLE `sales_process_staging`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `sales_process_id` (`sales_process_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `system_parameter`
--
ALTER TABLE `system_parameter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_title_id` (`job_title_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `user_role_id` (`user_role_id`),
  ADD KEY `gender` (`gender`),
  ADD KEY `marital_status` (`marital_status`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `company_installed_apps`
--
ALTER TABLE `company_installed_apps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales_process`
--
ALTER TABLE `sales_process`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales_process_staging`
--
ALTER TABLE `sales_process_staging`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `system_parameter`
--
ALTER TABLE `system_parameter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80026;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
