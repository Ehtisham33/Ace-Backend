-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2025 at 09:00 AM
-- Server version: 10.11.10-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u401728080_ace_community`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_messages`
--

CREATE TABLE `activity_messages` (
  `id` bigint(20) NOT NULL,
  `content` longtext NOT NULL,
  `file` varchar(100) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `activity_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_messages`
--

INSERT INTO `activity_messages` (`id`, `content`, `file`, `timestamp`, `is_read`, `activity_id`, `sender_id`) VALUES
(1, 'Activity message', '', '2025-07-18 12:19:43.194555', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `age_groups`
--

CREATE TABLE `age_groups` (
  `id` bigint(20) NOT NULL,
  `label` varchar(255) NOT NULL,
  `min_age` tinyint(3) DEFAULT NULL,
  `max_age` tinyint(3) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `age_groups`
--

INSERT INTO `age_groups` (`id`, `label`, `min_age`, `max_age`, `created_at`, `updated_at`) VALUES
(1, 'Child', 1, 17, '2025-06-13 08:06:30', '2025-06-13 08:06:30'),
(2, 'Adult', 18, 20, '2025-06-13 08:06:30', '2025-06-13 08:06:30'),
(3, 'Men', 21, 40, '2025-06-13 08:06:30', '2025-06-13 08:06:30'),
(4, 'Senior', 41, NULL, '2025-06-13 08:06:30', '2025-06-13 08:06:30');

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add Token', 7, 'add_token'),
(26, 'Can change Token', 7, 'change_token'),
(27, 'Can delete Token', 7, 'delete_token'),
(28, 'Can view Token', 7, 'view_token'),
(29, 'Can add Token', 8, 'add_tokenproxy'),
(30, 'Can change Token', 8, 'change_tokenproxy'),
(31, 'Can delete Token', 8, 'delete_tokenproxy'),
(32, 'Can view Token', 8, 'view_tokenproxy'),
(33, 'Can add age groups', 9, 'add_agegroups'),
(34, 'Can change age groups', 9, 'change_agegroups'),
(35, 'Can delete age groups', 9, 'delete_agegroups'),
(36, 'Can view age groups', 9, 'view_agegroups'),
(37, 'Can add availability day courts', 10, 'add_availabilitydaycourts'),
(38, 'Can change availability day courts', 10, 'change_availabilitydaycourts'),
(39, 'Can delete availability day courts', 10, 'delete_availabilitydaycourts'),
(40, 'Can view availability day courts', 10, 'view_availabilitydaycourts'),
(41, 'Can add availability day durations', 11, 'add_availabilitydaydurations'),
(42, 'Can change availability day durations', 11, 'change_availabilitydaydurations'),
(43, 'Can delete availability day durations', 11, 'delete_availabilitydaydurations'),
(44, 'Can view availability day durations', 11, 'view_availabilitydaydurations'),
(45, 'Can add availability day intervals', 12, 'add_availabilitydayintervals'),
(46, 'Can change availability day intervals', 12, 'change_availabilitydayintervals'),
(47, 'Can delete availability day intervals', 12, 'delete_availabilitydayintervals'),
(48, 'Can view availability day intervals', 12, 'view_availabilitydayintervals'),
(49, 'Can add availability days', 13, 'add_availabilitydays'),
(50, 'Can change availability days', 13, 'change_availabilitydays'),
(51, 'Can delete availability days', 13, 'delete_availabilitydays'),
(52, 'Can view availability days', 13, 'view_availabilitydays'),
(53, 'Can add cache', 14, 'add_cache'),
(54, 'Can change cache', 14, 'change_cache'),
(55, 'Can delete cache', 14, 'delete_cache'),
(56, 'Can view cache', 14, 'view_cache'),
(57, 'Can add cache locks', 15, 'add_cachelocks'),
(58, 'Can change cache locks', 15, 'change_cachelocks'),
(59, 'Can delete cache locks', 15, 'delete_cachelocks'),
(60, 'Can view cache locks', 15, 'view_cachelocks'),
(61, 'Can add club banner images', 16, 'add_clubbannerimages'),
(62, 'Can change club banner images', 16, 'change_clubbannerimages'),
(63, 'Can delete club banner images', 16, 'delete_clubbannerimages'),
(64, 'Can view club banner images', 16, 'view_clubbannerimages'),
(65, 'Can add club check in settings', 17, 'add_clubcheckinsettings'),
(66, 'Can change club check in settings', 17, 'change_clubcheckinsettings'),
(67, 'Can delete club check in settings', 17, 'delete_clubcheckinsettings'),
(68, 'Can view club check in settings', 17, 'view_clubcheckinsettings'),
(69, 'Can add club level systems', 18, 'add_clublevelsystems'),
(70, 'Can change club level systems', 18, 'change_clublevelsystems'),
(71, 'Can delete club level systems', 18, 'delete_clublevelsystems'),
(72, 'Can view club level systems', 18, 'view_clublevelsystems'),
(73, 'Can add club opening hours', 19, 'add_clubopeninghours'),
(74, 'Can change club opening hours', 19, 'change_clubopeninghours'),
(75, 'Can delete club opening hours', 19, 'delete_clubopeninghours'),
(76, 'Can view club opening hours', 19, 'view_clubopeninghours'),
(77, 'Can add clubs', 20, 'add_clubs'),
(78, 'Can change clubs', 20, 'change_clubs'),
(79, 'Can delete clubs', 20, 'delete_clubs'),
(80, 'Can view clubs', 20, 'view_clubs'),
(81, 'Can add clubs additional information', 21, 'add_clubsadditionalinformation'),
(82, 'Can change clubs additional information', 21, 'change_clubsadditionalinformation'),
(83, 'Can delete clubs additional information', 21, 'delete_clubsadditionalinformation'),
(84, 'Can view clubs additional information', 21, 'view_clubsadditionalinformation'),
(85, 'Can add club sports', 22, 'add_clubsports'),
(86, 'Can change club sports', 22, 'change_clubsports'),
(87, 'Can delete club sports', 22, 'delete_clubsports'),
(88, 'Can view club sports', 22, 'view_clubsports'),
(89, 'Can add coach activity contents', 23, 'add_coachactivitycontents'),
(90, 'Can change coach activity contents', 23, 'change_coachactivitycontents'),
(91, 'Can delete coach activity contents', 23, 'delete_coachactivitycontents'),
(92, 'Can view coach activity contents', 23, 'view_coachactivitycontents'),
(93, 'Can add coaches', 24, 'add_coaches'),
(94, 'Can change coaches', 24, 'change_coaches'),
(95, 'Can delete coaches', 24, 'delete_coaches'),
(96, 'Can view coaches', 24, 'view_coaches'),
(97, 'Can add court booking banners', 25, 'add_courtbookingbanners'),
(98, 'Can change court booking banners', 25, 'change_courtbookingbanners'),
(99, 'Can delete court booking banners', 25, 'delete_courtbookingbanners'),
(100, 'Can view court booking banners', 25, 'view_courtbookingbanners'),
(101, 'Can add court booking courts', 26, 'add_courtbookingcourts'),
(102, 'Can change court booking courts', 26, 'change_courtbookingcourts'),
(103, 'Can delete court booking courts', 26, 'delete_courtbookingcourts'),
(104, 'Can view court booking courts', 26, 'view_courtbookingcourts'),
(105, 'Can add court booking descriptions', 27, 'add_courtbookingdescriptions'),
(106, 'Can change court booking descriptions', 27, 'change_courtbookingdescriptions'),
(107, 'Can delete court booking descriptions', 27, 'delete_courtbookingdescriptions'),
(108, 'Can view court booking descriptions', 27, 'view_courtbookingdescriptions'),
(109, 'Can add court bookings', 28, 'add_courtbookings'),
(110, 'Can change court bookings', 28, 'change_courtbookings'),
(111, 'Can delete court bookings', 28, 'delete_courtbookings'),
(112, 'Can view court bookings', 28, 'view_courtbookings'),
(113, 'Can add court booking templates', 29, 'add_courtbookingtemplates'),
(114, 'Can change court booking templates', 29, 'change_courtbookingtemplates'),
(115, 'Can delete court booking templates', 29, 'delete_courtbookingtemplates'),
(116, 'Can view court booking templates', 29, 'view_courtbookingtemplates'),
(117, 'Can add courts', 30, 'add_courts'),
(118, 'Can change courts', 30, 'change_courts'),
(119, 'Can delete courts', 30, 'delete_courts'),
(120, 'Can view courts', 30, 'view_courts'),
(121, 'Can add court slot durations', 31, 'add_courtslotdurations'),
(122, 'Can change court slot durations', 31, 'change_courtslotdurations'),
(123, 'Can delete court slot durations', 31, 'delete_courtslotdurations'),
(124, 'Can view court slot durations', 31, 'view_courtslotdurations'),
(125, 'Can add currencies', 32, 'add_currencies'),
(126, 'Can change currencies', 32, 'change_currencies'),
(127, 'Can delete currencies', 32, 'delete_currencies'),
(128, 'Can view currencies', 32, 'view_currencies'),
(129, 'Can add failed jobs', 33, 'add_failedjobs'),
(130, 'Can change failed jobs', 33, 'change_failedjobs'),
(131, 'Can delete failed jobs', 33, 'delete_failedjobs'),
(132, 'Can view failed jobs', 33, 'view_failedjobs'),
(133, 'Can add group categories', 34, 'add_groupcategories'),
(134, 'Can change group categories', 34, 'change_groupcategories'),
(135, 'Can delete group categories', 34, 'delete_groupcategories'),
(136, 'Can view group categories', 34, 'view_groupcategories'),
(137, 'Can add groups', 35, 'add_groups'),
(138, 'Can change groups', 35, 'change_groups'),
(139, 'Can delete groups', 35, 'delete_groups'),
(140, 'Can view groups', 35, 'view_groups'),
(141, 'Can add job batches', 36, 'add_jobbatches'),
(142, 'Can change job batches', 36, 'change_jobbatches'),
(143, 'Can delete job batches', 36, 'delete_jobbatches'),
(144, 'Can view job batches', 36, 'view_jobbatches'),
(145, 'Can add jobs', 37, 'add_jobs'),
(146, 'Can change jobs', 37, 'change_jobs'),
(147, 'Can delete jobs', 37, 'delete_jobs'),
(148, 'Can view jobs', 37, 'view_jobs'),
(149, 'Can add levels', 38, 'add_levels'),
(150, 'Can change levels', 38, 'change_levels'),
(151, 'Can delete levels', 38, 'delete_levels'),
(152, 'Can view levels', 38, 'view_levels'),
(153, 'Can add migrations', 39, 'add_migrations'),
(154, 'Can change migrations', 39, 'change_migrations'),
(155, 'Can delete migrations', 39, 'delete_migrations'),
(156, 'Can view migrations', 39, 'view_migrations'),
(157, 'Can add oauth access tokens', 40, 'add_oauthaccesstokens'),
(158, 'Can change oauth access tokens', 40, 'change_oauthaccesstokens'),
(159, 'Can delete oauth access tokens', 40, 'delete_oauthaccesstokens'),
(160, 'Can view oauth access tokens', 40, 'view_oauthaccesstokens'),
(161, 'Can add oauth auth codes', 41, 'add_oauthauthcodes'),
(162, 'Can change oauth auth codes', 41, 'change_oauthauthcodes'),
(163, 'Can delete oauth auth codes', 41, 'delete_oauthauthcodes'),
(164, 'Can view oauth auth codes', 41, 'view_oauthauthcodes'),
(165, 'Can add oauth clients', 42, 'add_oauthclients'),
(166, 'Can change oauth clients', 42, 'change_oauthclients'),
(167, 'Can delete oauth clients', 42, 'delete_oauthclients'),
(168, 'Can view oauth clients', 42, 'view_oauthclients'),
(169, 'Can add oauth personal access clients', 43, 'add_oauthpersonalaccessclients'),
(170, 'Can change oauth personal access clients', 43, 'change_oauthpersonalaccessclients'),
(171, 'Can delete oauth personal access clients', 43, 'delete_oauthpersonalaccessclients'),
(172, 'Can view oauth personal access clients', 43, 'view_oauthpersonalaccessclients'),
(173, 'Can add oauth refresh tokens', 44, 'add_oauthrefreshtokens'),
(174, 'Can change oauth refresh tokens', 44, 'change_oauthrefreshtokens'),
(175, 'Can delete oauth refresh tokens', 44, 'delete_oauthrefreshtokens'),
(176, 'Can view oauth refresh tokens', 44, 'view_oauthrefreshtokens'),
(177, 'Can add permissions', 45, 'add_permissions'),
(178, 'Can change permissions', 45, 'change_permissions'),
(179, 'Can delete permissions', 45, 'delete_permissions'),
(180, 'Can view permissions', 45, 'view_permissions'),
(181, 'Can add players', 46, 'add_players'),
(182, 'Can change players', 46, 'change_players'),
(183, 'Can delete players', 46, 'delete_players'),
(184, 'Can view players', 46, 'view_players'),
(185, 'Can add player sport levels', 47, 'add_playersportlevels'),
(186, 'Can change player sport levels', 47, 'change_playersportlevels'),
(187, 'Can delete player sport levels', 47, 'delete_playersportlevels'),
(188, 'Can view player sport levels', 47, 'view_playersportlevels'),
(189, 'Can add questionnaire responses', 48, 'add_questionnaireresponses'),
(190, 'Can change questionnaire responses', 48, 'change_questionnaireresponses'),
(191, 'Can delete questionnaire responses', 48, 'delete_questionnaireresponses'),
(192, 'Can view questionnaire responses', 48, 'view_questionnaireresponses'),
(193, 'Can add questionnaires', 49, 'add_questionnaires'),
(194, 'Can change questionnaires', 49, 'change_questionnaires'),
(195, 'Can delete questionnaires', 49, 'delete_questionnaires'),
(196, 'Can view questionnaires', 49, 'view_questionnaires'),
(197, 'Can add roles', 50, 'add_roles'),
(198, 'Can change roles', 50, 'change_roles'),
(199, 'Can delete roles', 50, 'delete_roles'),
(200, 'Can view roles', 50, 'view_roles'),
(201, 'Can add specialties', 51, 'add_specialties'),
(202, 'Can change specialties', 51, 'change_specialties'),
(203, 'Can delete specialties', 51, 'delete_specialties'),
(204, 'Can view specialties', 51, 'view_specialties'),
(205, 'Can add sports', 52, 'add_sports'),
(206, 'Can change sports', 52, 'change_sports'),
(207, 'Can delete sports', 52, 'delete_sports'),
(208, 'Can view sports', 52, 'view_sports'),
(209, 'Can add user availabilities', 53, 'add_useravailabilities'),
(210, 'Can change user availabilities', 53, 'change_useravailabilities'),
(211, 'Can delete user availabilities', 53, 'delete_useravailabilities'),
(212, 'Can view user availabilities', 53, 'view_useravailabilities'),
(213, 'Can add user availability day duration prices', 54, 'add_useravailabilitydaydurationprices'),
(214, 'Can change user availability day duration prices', 54, 'change_useravailabilitydaydurationprices'),
(215, 'Can delete user availability day duration prices', 54, 'delete_useravailabilitydaydurationprices'),
(216, 'Can view user availability day duration prices', 54, 'view_useravailabilitydaydurationprices'),
(217, 'Can add users', 55, 'add_users'),
(218, 'Can change users', 55, 'change_users'),
(219, 'Can delete users', 55, 'delete_users'),
(220, 'Can view users', 55, 'view_users'),
(221, 'Can add user specialties', 56, 'add_userspecialties'),
(222, 'Can change user specialties', 56, 'change_userspecialties'),
(223, 'Can delete user specialties', 56, 'delete_userspecialties'),
(224, 'Can view user specialties', 56, 'view_userspecialties'),
(225, 'Can add user sports', 57, 'add_usersports'),
(226, 'Can change user sports', 57, 'change_usersports'),
(227, 'Can delete user sports', 57, 'delete_usersports'),
(228, 'Can view user sports', 57, 'view_usersports'),
(229, 'Can add category group', 58, 'add_categorygroup'),
(230, 'Can change category group', 58, 'change_categorygroup'),
(231, 'Can delete category group', 58, 'delete_categorygroup'),
(232, 'Can view category group', 58, 'view_categorygroup'),
(233, 'Can add model has permissions', 59, 'add_modelhaspermissions'),
(234, 'Can change model has permissions', 59, 'change_modelhaspermissions'),
(235, 'Can delete model has permissions', 59, 'delete_modelhaspermissions'),
(236, 'Can view model has permissions', 59, 'view_modelhaspermissions'),
(237, 'Can add model has roles', 60, 'add_modelhasroles'),
(238, 'Can change model has roles', 60, 'change_modelhasroles'),
(239, 'Can delete model has roles', 60, 'delete_modelhasroles'),
(240, 'Can view model has roles', 60, 'view_modelhasroles'),
(241, 'Can add role has permissions', 61, 'add_rolehaspermissions'),
(242, 'Can change role has permissions', 61, 'change_rolehaspermissions'),
(243, 'Can delete role has permissions', 61, 'delete_rolehaspermissions'),
(244, 'Can view role has permissions', 61, 'view_rolehaspermissions'),
(245, 'Can add message', 62, 'add_message'),
(246, 'Can change message', 62, 'change_message'),
(247, 'Can delete message', 62, 'delete_message'),
(248, 'Can view message', 62, 'view_message'),
(249, 'Can add log entry', 2, 'add_logentry'),
(250, 'Can change log entry', 2, 'change_logentry'),
(251, 'Can delete log entry', 2, 'delete_logentry'),
(252, 'Can view log entry', 2, 'view_logentry'),
(253, 'Can add permission', 3, 'add_permission'),
(254, 'Can change permission', 3, 'change_permission'),
(255, 'Can delete permission', 3, 'delete_permission'),
(256, 'Can view permission', 3, 'view_permission'),
(257, 'Can add group', 4, 'add_group'),
(258, 'Can change group', 4, 'change_group'),
(259, 'Can delete group', 4, 'delete_group'),
(260, 'Can view group', 4, 'view_group'),
(261, 'Can add user', 5, 'add_user'),
(262, 'Can change user', 5, 'change_user'),
(263, 'Can delete user', 5, 'delete_user'),
(264, 'Can view user', 5, 'view_user'),
(265, 'Can add content type', 1, 'add_contenttype'),
(266, 'Can change content type', 1, 'change_contenttype'),
(267, 'Can delete content type', 1, 'delete_contenttype'),
(268, 'Can view content type', 1, 'view_contenttype'),
(269, 'Can add auth group', 10, 'add_authgroup'),
(270, 'Can change auth group', 10, 'change_authgroup'),
(271, 'Can delete auth group', 10, 'delete_authgroup'),
(272, 'Can view auth group', 10, 'view_authgroup'),
(273, 'Can add auth group permissions', 11, 'add_authgrouppermissions'),
(274, 'Can change auth group permissions', 11, 'change_authgrouppermissions'),
(275, 'Can delete auth group permissions', 11, 'delete_authgrouppermissions'),
(276, 'Can view auth group permissions', 11, 'view_authgrouppermissions'),
(277, 'Can add auth permission', 12, 'add_authpermission'),
(278, 'Can change auth permission', 12, 'change_authpermission'),
(279, 'Can delete auth permission', 12, 'delete_authpermission'),
(280, 'Can view auth permission', 12, 'view_authpermission'),
(281, 'Can add authtoken token', 13, 'add_authtokentoken'),
(282, 'Can change authtoken token', 13, 'change_authtokentoken'),
(283, 'Can delete authtoken token', 13, 'delete_authtokentoken'),
(284, 'Can view authtoken token', 13, 'view_authtokentoken'),
(285, 'Can add auth user', 14, 'add_authuser'),
(286, 'Can change auth user', 14, 'change_authuser'),
(287, 'Can delete auth user', 14, 'delete_authuser'),
(288, 'Can view auth user', 14, 'view_authuser'),
(289, 'Can add auth user groups', 15, 'add_authusergroups'),
(290, 'Can change auth user groups', 15, 'change_authusergroups'),
(291, 'Can delete auth user groups', 15, 'delete_authusergroups'),
(292, 'Can view auth user groups', 15, 'view_authusergroups'),
(293, 'Can add auth user user permissions', 16, 'add_authuseruserpermissions'),
(294, 'Can change auth user user permissions', 16, 'change_authuseruserpermissions'),
(295, 'Can delete auth user user permissions', 16, 'delete_authuseruserpermissions'),
(296, 'Can view auth user user permissions', 16, 'view_authuseruserpermissions'),
(297, 'Can add availability day courts', 17, 'add_availabilitydaycourts'),
(298, 'Can change availability day courts', 17, 'change_availabilitydaycourts'),
(299, 'Can delete availability day courts', 17, 'delete_availabilitydaycourts'),
(300, 'Can view availability day courts', 17, 'view_availabilitydaycourts'),
(301, 'Can add availability day durations', 18, 'add_availabilitydaydurations'),
(302, 'Can change availability day durations', 18, 'change_availabilitydaydurations'),
(303, 'Can delete availability day durations', 18, 'delete_availabilitydaydurations'),
(304, 'Can view availability day durations', 18, 'view_availabilitydaydurations'),
(305, 'Can add availability day intervals', 19, 'add_availabilitydayintervals'),
(306, 'Can change availability day intervals', 19, 'change_availabilitydayintervals'),
(307, 'Can delete availability day intervals', 19, 'delete_availabilitydayintervals'),
(308, 'Can view availability day intervals', 19, 'view_availabilitydayintervals'),
(309, 'Can add availability days', 20, 'add_availabilitydays'),
(310, 'Can change availability days', 20, 'change_availabilitydays'),
(311, 'Can delete availability days', 20, 'delete_availabilitydays'),
(312, 'Can view availability days', 20, 'view_availabilitydays'),
(313, 'Can add cache', 21, 'add_cache'),
(314, 'Can change cache', 21, 'change_cache'),
(315, 'Can delete cache', 21, 'delete_cache'),
(316, 'Can view cache', 21, 'view_cache'),
(317, 'Can add cache locks', 22, 'add_cachelocks'),
(318, 'Can change cache locks', 22, 'change_cachelocks'),
(319, 'Can delete cache locks', 22, 'delete_cachelocks'),
(320, 'Can view cache locks', 22, 'view_cachelocks'),
(321, 'Can add category group', 23, 'add_categorygroup'),
(322, 'Can change category group', 23, 'change_categorygroup'),
(323, 'Can delete category group', 23, 'delete_categorygroup'),
(324, 'Can view category group', 23, 'view_categorygroup'),
(325, 'Can add club banner images', 24, 'add_clubbannerimages'),
(326, 'Can change club banner images', 24, 'change_clubbannerimages'),
(327, 'Can delete club banner images', 24, 'delete_clubbannerimages'),
(328, 'Can view club banner images', 24, 'view_clubbannerimages'),
(329, 'Can add club branches', 25, 'add_clubbranches'),
(330, 'Can change club branches', 25, 'change_clubbranches'),
(331, 'Can delete club branches', 25, 'delete_clubbranches'),
(332, 'Can view club branches', 25, 'view_clubbranches'),
(333, 'Can add club check in settings', 26, 'add_clubcheckinsettings'),
(334, 'Can change club check in settings', 26, 'change_clubcheckinsettings'),
(335, 'Can delete club check in settings', 26, 'delete_clubcheckinsettings'),
(336, 'Can view club check in settings', 26, 'view_clubcheckinsettings'),
(337, 'Can add club court configurations', 27, 'add_clubcourtconfigurations'),
(338, 'Can change club court configurations', 27, 'change_clubcourtconfigurations'),
(339, 'Can delete club court configurations', 27, 'delete_clubcourtconfigurations'),
(340, 'Can view club court configurations', 27, 'view_clubcourtconfigurations'),
(341, 'Can add club currency', 28, 'add_clubcurrency'),
(342, 'Can change club currency', 28, 'change_clubcurrency'),
(343, 'Can delete club currency', 28, 'delete_clubcurrency'),
(344, 'Can view club currency', 28, 'view_clubcurrency'),
(345, 'Can add club latest activities', 29, 'add_clublatestactivities'),
(346, 'Can change club latest activities', 29, 'change_clublatestactivities'),
(347, 'Can delete club latest activities', 29, 'delete_clublatestactivities'),
(348, 'Can view club latest activities', 29, 'view_clublatestactivities'),
(349, 'Can add club level systems', 30, 'add_clublevelsystems'),
(350, 'Can change club level systems', 30, 'change_clublevelsystems'),
(351, 'Can delete club level systems', 30, 'delete_clublevelsystems'),
(352, 'Can view club level systems', 30, 'view_clublevelsystems'),
(353, 'Can add club opening hours', 31, 'add_clubopeninghours'),
(354, 'Can change club opening hours', 31, 'change_clubopeninghours'),
(355, 'Can delete club opening hours', 31, 'delete_clubopeninghours'),
(356, 'Can view club opening hours', 31, 'view_clubopeninghours'),
(357, 'Can add clubs', 32, 'add_clubs'),
(358, 'Can change clubs', 32, 'change_clubs'),
(359, 'Can delete clubs', 32, 'delete_clubs'),
(360, 'Can view clubs', 32, 'view_clubs'),
(361, 'Can add clubs additional information', 33, 'add_clubsadditionalinformation'),
(362, 'Can change clubs additional information', 33, 'change_clubsadditionalinformation'),
(363, 'Can delete clubs additional information', 33, 'delete_clubsadditionalinformation'),
(364, 'Can view clubs additional information', 33, 'view_clubsadditionalinformation'),
(365, 'Can add club sport courts', 34, 'add_clubsportcourts'),
(366, 'Can change club sport courts', 34, 'change_clubsportcourts'),
(367, 'Can delete club sport courts', 34, 'delete_clubsportcourts'),
(368, 'Can view club sport courts', 34, 'view_clubsportcourts'),
(369, 'Can add club sports', 35, 'add_clubsports'),
(370, 'Can change club sports', 35, 'change_clubsports'),
(371, 'Can delete club sports', 35, 'delete_clubsports'),
(372, 'Can view club sports', 35, 'view_clubsports'),
(373, 'Can add coaches', 36, 'add_coaches'),
(374, 'Can change coaches', 36, 'change_coaches'),
(375, 'Can delete coaches', 36, 'delete_coaches'),
(376, 'Can view coaches', 36, 'view_coaches'),
(377, 'Can add countries', 37, 'add_countries'),
(378, 'Can change countries', 37, 'change_countries'),
(379, 'Can delete countries', 37, 'delete_countries'),
(380, 'Can view countries', 37, 'view_countries'),
(381, 'Can add court booking banners', 38, 'add_courtbookingbanners'),
(382, 'Can change court booking banners', 38, 'change_courtbookingbanners'),
(383, 'Can delete court booking banners', 38, 'delete_courtbookingbanners'),
(384, 'Can view court booking banners', 38, 'view_courtbookingbanners'),
(385, 'Can add court booking courts', 39, 'add_courtbookingcourts'),
(386, 'Can change court booking courts', 39, 'change_courtbookingcourts'),
(387, 'Can delete court booking courts', 39, 'delete_courtbookingcourts'),
(388, 'Can view court booking courts', 39, 'view_courtbookingcourts'),
(389, 'Can add court booking descriptions', 40, 'add_courtbookingdescriptions'),
(390, 'Can change court booking descriptions', 40, 'change_courtbookingdescriptions'),
(391, 'Can delete court booking descriptions', 40, 'delete_courtbookingdescriptions'),
(392, 'Can view court booking descriptions', 40, 'view_courtbookingdescriptions'),
(393, 'Can add court bookings', 41, 'add_courtbookings'),
(394, 'Can change court bookings', 41, 'change_courtbookings'),
(395, 'Can delete court bookings', 41, 'delete_courtbookings'),
(396, 'Can view court bookings', 41, 'view_courtbookings'),
(397, 'Can add court booking templates', 42, 'add_courtbookingtemplates'),
(398, 'Can change court booking templates', 42, 'change_courtbookingtemplates'),
(399, 'Can delete court booking templates', 42, 'delete_courtbookingtemplates'),
(400, 'Can view court booking templates', 42, 'view_courtbookingtemplates'),
(401, 'Can add courts', 43, 'add_courts'),
(402, 'Can change courts', 43, 'change_courts'),
(403, 'Can delete courts', 43, 'delete_courts'),
(404, 'Can view courts', 43, 'view_courts'),
(405, 'Can add court slot durations', 44, 'add_courtslotdurations'),
(406, 'Can change court slot durations', 44, 'change_courtslotdurations'),
(407, 'Can delete court slot durations', 44, 'delete_courtslotdurations'),
(408, 'Can view court slot durations', 44, 'view_courtslotdurations'),
(409, 'Can add currencies', 45, 'add_currencies'),
(410, 'Can change currencies', 45, 'change_currencies'),
(411, 'Can delete currencies', 45, 'delete_currencies'),
(412, 'Can view currencies', 45, 'view_currencies'),
(413, 'Can add failed jobs', 46, 'add_failedjobs'),
(414, 'Can change failed jobs', 46, 'change_failedjobs'),
(415, 'Can delete failed jobs', 46, 'delete_failedjobs'),
(416, 'Can view failed jobs', 46, 'view_failedjobs'),
(417, 'Can add group categories', 47, 'add_groupcategories'),
(418, 'Can change group categories', 47, 'change_groupcategories'),
(419, 'Can delete group categories', 47, 'delete_groupcategories'),
(420, 'Can view group categories', 47, 'view_groupcategories'),
(421, 'Can add groups', 48, 'add_groups'),
(422, 'Can change groups', 48, 'change_groups'),
(423, 'Can delete groups', 48, 'delete_groups'),
(424, 'Can view groups', 48, 'view_groups'),
(425, 'Can add job batches', 49, 'add_jobbatches'),
(426, 'Can change job batches', 49, 'change_jobbatches'),
(427, 'Can delete job batches', 49, 'delete_jobbatches'),
(428, 'Can view job batches', 49, 'view_jobbatches'),
(429, 'Can add jobs', 50, 'add_jobs'),
(430, 'Can change jobs', 50, 'change_jobs'),
(431, 'Can delete jobs', 50, 'delete_jobs'),
(432, 'Can view jobs', 50, 'view_jobs'),
(433, 'Can add levels', 51, 'add_levels'),
(434, 'Can change levels', 51, 'change_levels'),
(435, 'Can delete levels', 51, 'delete_levels'),
(436, 'Can view levels', 51, 'view_levels'),
(437, 'Can add migrations', 52, 'add_migrations'),
(438, 'Can change migrations', 52, 'change_migrations'),
(439, 'Can delete migrations', 52, 'delete_migrations'),
(440, 'Can view migrations', 52, 'view_migrations'),
(441, 'Can add model has permissions', 53, 'add_modelhaspermissions'),
(442, 'Can change model has permissions', 53, 'change_modelhaspermissions'),
(443, 'Can delete model has permissions', 53, 'delete_modelhaspermissions'),
(444, 'Can view model has permissions', 53, 'view_modelhaspermissions'),
(445, 'Can add model has roles', 54, 'add_modelhasroles'),
(446, 'Can change model has roles', 54, 'change_modelhasroles'),
(447, 'Can delete model has roles', 54, 'delete_modelhasroles'),
(448, 'Can view model has roles', 54, 'view_modelhasroles'),
(449, 'Can add oauth access tokens', 55, 'add_oauthaccesstokens'),
(450, 'Can change oauth access tokens', 55, 'change_oauthaccesstokens'),
(451, 'Can delete oauth access tokens', 55, 'delete_oauthaccesstokens'),
(452, 'Can view oauth access tokens', 55, 'view_oauthaccesstokens'),
(453, 'Can add oauth auth codes', 56, 'add_oauthauthcodes'),
(454, 'Can change oauth auth codes', 56, 'change_oauthauthcodes'),
(455, 'Can delete oauth auth codes', 56, 'delete_oauthauthcodes'),
(456, 'Can view oauth auth codes', 56, 'view_oauthauthcodes'),
(457, 'Can add oauth clients', 57, 'add_oauthclients'),
(458, 'Can change oauth clients', 57, 'change_oauthclients'),
(459, 'Can delete oauth clients', 57, 'delete_oauthclients'),
(460, 'Can view oauth clients', 57, 'view_oauthclients'),
(461, 'Can add oauth personal access clients', 58, 'add_oauthpersonalaccessclients'),
(462, 'Can change oauth personal access clients', 58, 'change_oauthpersonalaccessclients'),
(463, 'Can delete oauth personal access clients', 58, 'delete_oauthpersonalaccessclients'),
(464, 'Can view oauth personal access clients', 58, 'view_oauthpersonalaccessclients'),
(465, 'Can add oauth refresh tokens', 59, 'add_oauthrefreshtokens'),
(466, 'Can change oauth refresh tokens', 59, 'change_oauthrefreshtokens'),
(467, 'Can delete oauth refresh tokens', 59, 'delete_oauthrefreshtokens'),
(468, 'Can view oauth refresh tokens', 59, 'view_oauthrefreshtokens'),
(469, 'Can add permissions', 60, 'add_permissions'),
(470, 'Can change permissions', 60, 'change_permissions'),
(471, 'Can delete permissions', 60, 'delete_permissions'),
(472, 'Can view permissions', 60, 'view_permissions'),
(473, 'Can add players', 61, 'add_players'),
(474, 'Can change players', 61, 'change_players'),
(475, 'Can delete players', 61, 'delete_players'),
(476, 'Can view players', 61, 'view_players'),
(477, 'Can add player sport levels', 62, 'add_playersportlevels'),
(478, 'Can change player sport levels', 62, 'change_playersportlevels'),
(479, 'Can delete player sport levels', 62, 'delete_playersportlevels'),
(480, 'Can view player sport levels', 62, 'view_playersportlevels'),
(481, 'Can add questionnaire responses', 63, 'add_questionnaireresponses'),
(482, 'Can change questionnaire responses', 63, 'change_questionnaireresponses'),
(483, 'Can delete questionnaire responses', 63, 'delete_questionnaireresponses'),
(484, 'Can view questionnaire responses', 63, 'view_questionnaireresponses'),
(485, 'Can add questionnaires', 64, 'add_questionnaires'),
(486, 'Can change questionnaires', 64, 'change_questionnaires'),
(487, 'Can delete questionnaires', 64, 'delete_questionnaires'),
(488, 'Can view questionnaires', 64, 'view_questionnaires'),
(489, 'Can add role has permissions', 65, 'add_rolehaspermissions'),
(490, 'Can change role has permissions', 65, 'change_rolehaspermissions'),
(491, 'Can delete role has permissions', 65, 'delete_rolehaspermissions'),
(492, 'Can view role has permissions', 65, 'view_rolehaspermissions'),
(493, 'Can add roles', 66, 'add_roles'),
(494, 'Can change roles', 66, 'change_roles'),
(495, 'Can delete roles', 66, 'delete_roles'),
(496, 'Can view roles', 66, 'view_roles'),
(497, 'Can add specialties', 67, 'add_specialties'),
(498, 'Can change specialties', 67, 'change_specialties'),
(499, 'Can delete specialties', 67, 'delete_specialties'),
(500, 'Can view specialties', 67, 'view_specialties'),
(501, 'Can add sports', 68, 'add_sports'),
(502, 'Can change sports', 68, 'change_sports'),
(503, 'Can delete sports', 68, 'delete_sports'),
(504, 'Can view sports', 68, 'view_sports'),
(505, 'Can add timezones', 69, 'add_timezones'),
(506, 'Can change timezones', 69, 'change_timezones'),
(507, 'Can delete timezones', 69, 'delete_timezones'),
(508, 'Can view timezones', 69, 'view_timezones'),
(509, 'Can add user availabilities', 70, 'add_useravailabilities'),
(510, 'Can change user availabilities', 70, 'change_useravailabilities'),
(511, 'Can delete user availabilities', 70, 'delete_useravailabilities'),
(512, 'Can view user availabilities', 70, 'view_useravailabilities'),
(513, 'Can add user availability day duration prices', 71, 'add_useravailabilitydaydurationprices'),
(514, 'Can change user availability day duration prices', 71, 'change_useravailabilitydaydurationprices'),
(515, 'Can delete user availability day duration prices', 71, 'delete_useravailabilitydaydurationprices'),
(516, 'Can view user availability day duration prices', 71, 'view_useravailabilitydaydurationprices'),
(517, 'Can add users', 72, 'add_users'),
(518, 'Can change users', 72, 'change_users'),
(519, 'Can delete users', 72, 'delete_users'),
(520, 'Can view users', 72, 'view_users'),
(521, 'Can add user specialties', 73, 'add_userspecialties'),
(522, 'Can change user specialties', 73, 'change_userspecialties'),
(523, 'Can delete user specialties', 73, 'delete_userspecialties'),
(524, 'Can view user specialties', 73, 'view_userspecialties'),
(525, 'Can add user sports', 74, 'add_usersports'),
(526, 'Can change user sports', 74, 'change_usersports'),
(527, 'Can delete user sports', 74, 'delete_usersports'),
(528, 'Can view user sports', 74, 'view_usersports'),
(529, 'Can add community', 75, 'add_community'),
(530, 'Can change community', 75, 'change_community'),
(531, 'Can delete community', 75, 'delete_community'),
(532, 'Can view community', 75, 'view_community'),
(533, 'Can add community post', 76, 'add_communitypost'),
(534, 'Can change community post', 76, 'change_communitypost'),
(535, 'Can delete community post', 76, 'delete_communitypost'),
(536, 'Can view community post', 76, 'view_communitypost'),
(537, 'Can add marketplace item', 77, 'add_marketplaceitem'),
(538, 'Can change marketplace item', 77, 'change_marketplaceitem'),
(539, 'Can delete marketplace item', 77, 'delete_marketplaceitem'),
(540, 'Can view marketplace item', 77, 'view_marketplaceitem'),
(541, 'Can add community message', 78, 'add_communitymessage'),
(542, 'Can change community message', 78, 'change_communitymessage'),
(543, 'Can delete community message', 78, 'delete_communitymessage'),
(544, 'Can view community message', 78, 'view_communitymessage'),
(545, 'Can add community membership', 79, 'add_communitymembership'),
(546, 'Can change community membership', 79, 'change_communitymembership'),
(547, 'Can delete community membership', 79, 'delete_communitymembership'),
(548, 'Can view community membership', 79, 'view_communitymembership'),
(549, 'Can add community favorite', 80, 'add_communityfavorite'),
(550, 'Can change community favorite', 80, 'change_communityfavorite'),
(551, 'Can delete community favorite', 80, 'delete_communityfavorite'),
(552, 'Can view community favorite', 80, 'view_communityfavorite'),
(553, 'Can add activity message', 81, 'add_activitymessage'),
(554, 'Can change activity message', 81, 'change_activitymessage'),
(555, 'Can delete activity message', 81, 'delete_activitymessage'),
(556, 'Can view activity message', 81, 'view_activitymessage'),
(557, 'Can add user follower', 82, 'add_userfollower'),
(558, 'Can change user follower', 82, 'change_userfollower'),
(559, 'Can delete user follower', 82, 'delete_userfollower'),
(560, 'Can view user follower', 82, 'view_userfollower'),
(561, 'Can add post like', 83, 'add_postlike'),
(562, 'Can change post like', 83, 'change_postlike'),
(563, 'Can delete post like', 83, 'delete_postlike'),
(564, 'Can view post like', 83, 'view_postlike'),
(565, 'Can add post comment', 84, 'add_postcomment'),
(566, 'Can change post comment', 84, 'change_postcomment'),
(567, 'Can delete post comment', 84, 'delete_postcomment'),
(568, 'Can view post comment', 84, 'view_postcomment'),
(569, 'Can add message', 85, 'add_message'),
(570, 'Can change message', 85, 'change_message'),
(571, 'Can delete message', 85, 'delete_message'),
(572, 'Can view message', 85, 'view_message'),
(573, 'Can add marketplace message', 86, 'add_marketplacemessage'),
(574, 'Can change marketplace message', 86, 'change_marketplacemessage'),
(575, 'Can delete marketplace message', 86, 'delete_marketplacemessage'),
(576, 'Can view marketplace message', 86, 'view_marketplacemessage'),
(577, 'Can add community report', 87, 'add_communityreport'),
(578, 'Can change community report', 87, 'change_communityreport'),
(579, 'Can delete community report', 87, 'delete_communityreport'),
(580, 'Can view community report', 87, 'view_communityreport');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `availability_days`
--

CREATE TABLE `availability_days` (
  `id` bigint(20) NOT NULL,
  `user_availability_id` bigint(20) NOT NULL,
  `day` enum('monday','tuesday','wednesday','thursday','friday','saturday','sunday') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `availability_days`
--

INSERT INTO `availability_days` (`id`, `user_availability_id`, `day`, `created_at`, `updated_at`) VALUES
(18, 18, 'monday', '2025-06-20 12:43:32', '2025-06-20 12:43:32'),
(19, 18, 'wednesday', '2025-06-20 12:43:32', '2025-06-20 12:43:32'),
(20, 19, 'monday', '2025-06-20 12:50:51', '2025-06-20 12:50:51'),
(21, 20, 'monday', '2025-06-20 13:04:49', '2025-06-20 13:04:49'),
(22, 21, 'tuesday', '2025-06-20 13:08:25', '2025-06-20 13:08:25'),
(23, 22, 'monday', '2025-06-20 13:32:08', '2025-06-20 13:32:08');

-- --------------------------------------------------------

--
-- Table structure for table `availability_day_courts`
--

CREATE TABLE `availability_day_courts` (
  `id` bigint(20) NOT NULL,
  `availability_day_id` bigint(20) NOT NULL,
  `court_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `availability_day_courts`
--

INSERT INTO `availability_day_courts` (`id`, `availability_day_id`, `court_id`) VALUES
(32, 18, 2),
(33, 18, 3),
(34, 19, 2),
(35, 19, 3),
(36, 20, 3),
(37, 21, 3),
(38, 22, 3),
(39, 23, 3);

-- --------------------------------------------------------

--
-- Table structure for table `availability_day_durations`
--

CREATE TABLE `availability_day_durations` (
  `id` bigint(20) NOT NULL,
  `availability_day_id` bigint(20) NOT NULL,
  `duration` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `availability_day_durations`
--

INSERT INTO `availability_day_durations` (`id`, `availability_day_id`, `duration`) VALUES
(5, 18, 60),
(6, 18, 90),
(7, 19, 120),
(8, 20, 60),
(9, 20, 90),
(10, 20, 120),
(11, 21, 60),
(12, 21, 90),
(13, 21, 120),
(14, 22, 60),
(15, 22, 90),
(16, 23, 60);

-- --------------------------------------------------------

--
-- Table structure for table `availability_day_intervals`
--

CREATE TABLE `availability_day_intervals` (
  `id` bigint(20) NOT NULL,
  `availability_day_id` bigint(20) NOT NULL,
  `interval_number` tinyint(3) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `discount_percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `availability_day_intervals`
--

INSERT INTO `availability_day_intervals` (`id`, `availability_day_id`, `interval_number`, `start_time`, `end_time`, `discount_percent`, `created_at`, `updated_at`) VALUES
(13, 18, 1, '08:00:00', '10:00:00', 0.00, '2025-06-20 12:43:32', '2025-06-20 12:43:32'),
(14, 18, 2, '14:00:00', '16:00:00', 0.00, '2025-06-20 12:43:32', '2025-06-20 12:43:32'),
(15, 19, 1, '12:00:00', '14:00:00', 0.00, '2025-06-20 12:43:32', '2025-06-20 12:43:32'),
(16, 20, 1, '04:00:00', '06:00:00', 0.00, '2025-06-20 12:50:51', '2025-06-20 12:50:51'),
(17, 20, 2, '07:00:00', '08:00:00', 0.00, '2025-06-20 12:50:51', '2025-06-20 12:50:51'),
(18, 21, 1, '05:30:00', '06:00:00', 0.00, '2025-06-20 13:04:49', '2025-06-20 13:04:49'),
(19, 21, 2, '07:00:00', '08:00:00', 0.00, '2025-06-20 13:04:49', '2025-06-20 13:04:49'),
(20, 22, 1, '03:30:00', '06:30:00', 0.00, '2025-06-20 13:08:25', '2025-06-20 13:08:25'),
(21, 22, 2, '07:00:00', '08:00:00', 0.00, '2025-06-20 13:08:25', '2025-06-20 13:08:25'),
(22, 23, 1, '01:30:00', '02:30:00', 0.00, '2025-06-20 13:32:08', '2025-06-20 13:32:08');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('ace_community_cache_spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:14:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:8:\"Bookings\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:9:\"Satistics\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:24:\"My_Club_Tab_and_Sub_Tabs\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:12:\"News_Posting\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:11:\"Communities\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:6;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:14:\"Ads_Management\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:6;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:10:\"Accounting\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:6;}}i:7;a:3:{s:1:\"a\";i:13;s:1:\"b\";s:8:\"Booking \";s:1:\"c\";s:3:\"api\";}i:8;a:3:{s:1:\"a\";i:14;s:1:\"b\";s:14:\"Ads_Management\";s:1:\"c\";s:3:\"api\";}i:9;a:3:{s:1:\"a\";i:17;s:1:\"b\";s:26:\"My_Club_Tab_and_Sub_Tabs\r\n\";s:1:\"c\";s:3:\"api\";}i:10;a:3:{s:1:\"a\";i:18;s:1:\"b\";s:12:\"News_Posting\";s:1:\"c\";s:3:\"api\";}i:11;a:3:{s:1:\"a\";i:19;s:1:\"b\";s:11:\"Communities\";s:1:\"c\";s:3:\"api\";}i:12;a:3:{s:1:\"a\";i:20;s:1:\"b\";s:10:\"Accounting\";s:1:\"c\";s:3:\"api\";}i:13;a:3:{s:1:\"a\";i:21;s:1:\"b\";s:9:\"Satistics\";s:1:\"c\";s:3:\"api\";}}s:5:\"roles\";a:5:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:5:\"admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:3;s:1:\"b\";s:5:\"coach\";s:1:\"c\";s:3:\"web\";}i:2;a:3:{s:1:\"a\";i:5;s:1:\"b\";s:17:\"analytics_manager\";s:1:\"c\";s:3:\"web\";}i:3;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:10:\"club_owner\";s:1:\"c\";s:3:\"web\";}i:4;a:3:{s:1:\"a\";i:6;s:1:\"b\";s:4:\"club\";s:1:\"c\";s:3:\"web\";}}}', 1752643949);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_group`
--

CREATE TABLE `category_group` (
  `group_category_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_group`
--

INSERT INTO `category_group` (`group_category_id`, `group_id`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `chat_customtoken`
--

CREATE TABLE `chat_customtoken` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_customtoken`
--

INSERT INTO `chat_customtoken` (`key`, `created`, `user_id`) VALUES
('42f80a7c6f9e29f71d9680b20e8f536b8afd42e3', '2025-07-22 12:00:16.561576', 54),
('e10b53f39998fcdfe6badda5f578d359033769e3', '2025-07-22 12:18:24.415581', 263);

-- --------------------------------------------------------

--
-- Table structure for table `chat_userfollower`
--

CREATE TABLE `chat_userfollower` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `follower_id` bigint(20) NOT NULL,
  `following_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clubs`
--

CREATE TABLE `clubs` (
  `id` bigint(20) NOT NULL,
  `name` varchar(64) NOT NULL,
  `short_name` varchar(32) DEFAULT NULL,
  `no_of_branches` int(11) NOT NULL DEFAULT 0,
  `user_id` bigint(20) NOT NULL,
  `organisation_name` varchar(64) DEFAULT NULL,
  `organisation_no` varchar(16) DEFAULT NULL,
  `license_number` varchar(16) DEFAULT NULL,
  `is_parent_club` tinyint(1) NOT NULL DEFAULT 0,
  `parent_club_id` bigint(20) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `about_the_hall` text DEFAULT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `contact_email` varchar(64) DEFAULT NULL,
  `contact_phone_number` varchar(64) DEFAULT NULL,
  `whatsapp` varchar(64) DEFAULT NULL,
  `telephone` varchar(16) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `threads` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `is_user_location_same` int(11) NOT NULL DEFAULT 1,
  `location_id` varchar(255) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  `timezone_id` bigint(20) DEFAULT NULL,
  `cafe_restaurant` tinyint(1) NOT NULL DEFAULT 0,
  `conference_rooms` tinyint(1) NOT NULL DEFAULT 0,
  `dressing_room` tinyint(1) NOT NULL DEFAULT 0,
  `free_parking` tinyint(1) NOT NULL DEFAULT 0,
  `handicapped` tinyint(1) NOT NULL DEFAULT 0,
  `rental` tinyint(1) NOT NULL DEFAULT 0,
  `shop` tinyint(1) NOT NULL DEFAULT 0,
  `accessible_restrooms` tinyint(1) NOT NULL DEFAULT 0,
  `showers` tinyint(1) NOT NULL DEFAULT 0,
  `lockers` tinyint(1) NOT NULL DEFAULT 0,
  `no_of_followers` int(11) NOT NULL DEFAULT 0,
  `allow_child_credits` tinyint(1) NOT NULL DEFAULT 0,
  `allow_membership` tinyint(1) NOT NULL DEFAULT 0,
  `allow_player_matches` tinyint(1) NOT NULL DEFAULT 0,
  `accepts_freelance_coaches` tinyint(1) NOT NULL DEFAULT 0,
  `default_cancellation_time_booking` bigint(20) NOT NULL DEFAULT 21600000,
  `default_future_booking_days` int(11) NOT NULL DEFAULT 7,
  `status` enum('pending','pending_email_verification','email_verified','profile_draft','profile_submitted','under_review','approved','rejected','active','provisioned','renewal_pending','inactive','banned','archived') NOT NULL DEFAULT 'pending',
  `reason` text DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `waiver_notice` varchar(255) DEFAULT NULL,
  `require_waiver_acceptance` tinyint(1) NOT NULL DEFAULT 0,
  `profile_submission_deadline_hours` int(11) NOT NULL DEFAULT 48,
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clubs`
--

INSERT INTO `clubs` (`id`, `name`, `short_name`, `no_of_branches`, `user_id`, `organisation_name`, `organisation_no`, `license_number`, `is_parent_club`, `parent_club_id`, `logo_url`, `about_the_hall`, `timezone`, `contact_email`, `contact_phone_number`, `whatsapp`, `telephone`, `website`, `linkedin`, `facebook`, `twitter`, `threads`, `instagram`, `is_user_location_same`, `location_id`, `latitude`, `longitude`, `postal_code`, `address`, `city`, `state`, `country`, `country_id`, `timezone_id`, `cafe_restaurant`, `conference_rooms`, `dressing_room`, `free_parking`, `handicapped`, `rental`, `shop`, `accessible_restrooms`, `showers`, `lockers`, `no_of_followers`, `allow_child_credits`, `allow_membership`, `allow_player_matches`, `accepts_freelance_coaches`, `default_cancellation_time_booking`, `default_future_booking_days`, `status`, `reason`, `is_admin`, `waiver_notice`, `require_waiver_acceptance`, `profile_submission_deadline_hours`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'Universal Club', NULL, 0, 4, 'Glaxit', NULL, '6788989', 1, NULL, NULL, 'This is new constructed club', NULL, 'waqar.glaxit@gmail.com', '1234567891111', NULL, NULL, 'https://website.com', 'https://linkedin/abc', 'https://facebook.com', 'https://twitter-or-x.com', NULL, 'https://instagram.com', 1, 'YuiTReg886KgIr', 74.35870000, 31.52040000, '34543', 'Ganhara plaza near taxila museum taxila', 'Taxila', 'Punjab', 'Barbados', 20, 37, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 21600000, 12, 'active', 'This is not a good person', 1, NULL, 0, 48, NULL, '2025-07-04 08:05:28', '2025-07-12 08:47:34', NULL),
(5, 'New-Ace', NULL, 0, 2, 'New-Community', NULL, '6788989', 0, NULL, NULL, 'This is new constructed club', NULL, 'waqar.glaxit@gmail.com', '1234567891111', NULL, NULL, 'https://website.com', 'https://linkedin/abc', 'https://facebook.com', 'https://twitter-or-x.com', NULL, 'https://instagram.com', 1, 'YuiTReg886KgIr', 74.35870000, 31.52040000, '34543', 'Ganhara plaza near taxila museum taxila', 'Taxila', 'Punjab', 'Afghanistan', 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 21600000, 12, 'active', NULL, 1, NULL, 0, 48, NULL, '2025-06-27 08:18:43', '2025-07-07 15:06:32', NULL),
(8, 'Universal Club', NULL, 0, 161, 'Glaxit', NULL, '6788989', 1, NULL, NULL, 'This is new constructed club', NULL, 'waqar.glaxit@gmail.com', '1234567891111', NULL, NULL, 'https://website.com', 'https://linkedin/abc', 'https://facebook.com', 'https://twitter-or-x.com', NULL, 'https://instagram.com', 1, 'YuiTReg886KgIr', 74.35870000, 31.52040000, '34543', 'Ganhara plaza near taxila museum taxila', 'Taxila', 'Punjab', 'Barbados', 20, 37, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 21600000, 12, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-04 08:08:00', '2025-07-04 08:08:00', NULL),
(10, 'qwerty club', NULL, 0, 163, 'Qwerty&Co.', NULL, '1234567890987', 1, NULL, NULL, '12324wqertyui sdfghjkl xcvbnm,', NULL, 'test.support@gmail.com', '922134567898', '921234567898', NULL, 'https://abc.com', 'https://linkedin.com', 'https://abc.com', 'https://abc.com', 'https://threads.com', 'https://instagram.com', 0, '0', NULL, NULL, '34543', 'Ingen Adress / en annan adress', 'Qwa-Qwa', NULL, 'Argentina', 10, 60, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 1, 'pending', NULL, 1, NULL, 0, 48, NULL, '2025-07-04 11:24:12', '2025-07-04 11:24:12', NULL),
(12, 'Universal Club', NULL, 0, 165, 'Glaxit', NULL, '6788989', 1, NULL, NULL, 'This is new constructed club', NULL, 'waqar.glaxit@gmail.com', '1234567891111', NULL, NULL, 'https://website.com', 'https://linkedin/abc', 'https://facebook.com', 'https://twitter-or-x.com', NULL, 'https://instagram.com', 1, 'YuiTReg886KgIr', 74.35870000, 31.52040000, '34543', 'Ganhara plaza near taxila museum taxila', 'Taxila', 'Punjab', 'Barbados', 20, 37, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 21600000, 14, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-04 11:49:50', '2025-07-04 11:49:50', NULL),
(16, 'qwert', NULL, 0, 183, 'qwertyui', NULL, '43567890987654', 1, NULL, NULL, '12312es', NULL, 'test.support@gmail.com', '927654321436', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, '0000', '12343werteyuiu mjhggffds zxcbnm', 'West Palm Beach, FL', NULL, 'Armenia', 11, 290, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 2, 'active', NULL, 1, NULL, 0, 48, NULL, '2025-07-04 15:00:22', '2025-07-12 14:10:46', NULL),
(40, 'Club8', NULL, 2, 192, 'New Organization', NULL, '2342324434532', 0, NULL, 'https://ace-community.hyglaxit.com/storage/images/club/logo/4152573e-2506-42f2-bfca-da674a03f555.png', 'MYbIO', NULL, 'akram123@gmail.com', '8937149874234', 'whatsapp', 'telephone', 'website', 'linkedin', 'facebook', 'twitter', 'threads', 'instagram', 1, NULL, NULL, NULL, '1232', 'This is my first addrss', 'Taxila', NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 15840, 14, 'email_verified', NULL, 0, NULL, 0, 48, NULL, '2025-07-06 07:02:32', '2025-07-17 06:17:08', NULL),
(41, 'Universal Club', NULL, 0, 194, 'Glaxit', NULL, '6788989', 1, NULL, NULL, 'This is new constructed club', NULL, 'waqar.glaxit@gmail.com', '1234567891111', NULL, '234567893453', 'https://website.com', 'https://linkedin/abc', 'https://facebook.com', 'https://twitter-or-x.com', NULL, 'https://instagram.com', 1, 'YuiTReg886KgIr', 74.35870000, 31.52040000, '34543', 'Ganhara plaza near taxila museum taxila', 'Taxila', 'Punjab', 'Barbados', 20, 37, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 21600000, 14, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 08:20:37', '2025-07-07 08:20:37', NULL),
(44, 'Unique Club', NULL, 0, 197, 'Usman&Co.', NULL, '21345678909', 1, NULL, NULL, '123123qwertyuio sadfghjkl xcvbnm,', NULL, 'usman.support@gmail.com', '921234567890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, '23454', 'Europe/Stockholm/Sweden', 'Qwa-Qwa', NULL, 'Aruba', 12, 70, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 1, 'active', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 10:30:20', '2025-07-12 14:09:03', NULL),
(45, 'qwert', NULL, 0, 198, 'qwertyui', NULL, '2345678909876', 1, NULL, NULL, '2134wertyuio sdfghjk xcvbnm,', NULL, 'test.support@gmail.com', '922345678987', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, '0000', 'Ingen Adress / en annan adress', 'Qwa-Qwa', NULL, 'Afghanistan', 1, 242, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 1, 'rejected', 'the given data is not correct', 1, NULL, 0, 48, NULL, '2025-07-07 10:44:03', '2025-07-12 13:52:03', NULL),
(46, 'qwert', NULL, 0, 199, 'qwertyui', NULL, '876543', 1, NULL, NULL, '123456wqertyuiop sdfghjkl xzcvbnm,.', NULL, 'test.support@gmail.com', '922345678908', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, '23454', 'Ingen Adress / en annan adress', 'Qwa-Qwa', NULL, 'Algeria', 3, 4, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 2, 'rejected', 'the given data is wrong', 1, NULL, 0, 48, NULL, '2025-07-07 11:04:57', '2025-07-12 13:36:11', NULL),
(47, 'Universal Club', NULL, 0, 200, 'Glaxit', NULL, '6788989', 1, NULL, NULL, 'This is new constructed club', NULL, 'waqar.glaxit@gmail.com', '1234567891111', NULL, '234567893453', 'https://website.com', 'https://linkedin/abc', 'https://facebook.com', 'https://twitter-or-x.com', NULL, 'https://instagram.com', 1, 'YuiTReg886KgIr', 74.35870000, 31.52040000, '34543', 'Ganhara plaza near taxila museum taxila', 'Taxila', 'Punjab', 'Barbados', 20, 37, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 21600000, 14, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 12:11:03', '2025-07-07 12:11:03', NULL),
(48, 'Universal Club', NULL, 0, 202, 'Glaxit', NULL, '6788989', 1, NULL, NULL, 'This is new constructed club', NULL, 'waqar.glaxit@gmail.com', '1234567891111', NULL, '234567893453', 'https://website.com', 'https://linkedin/abc', 'https://facebook.com', 'https://twitter-or-x.com', NULL, 'https://instagram.com', 1, 'YuiTReg886KgIr', 74.35870000, 31.52040000, '34543', 'Ganhara plaza near taxila museum taxila', 'Taxila', 'Punjab', 'Barbados', 20, 37, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 21600000, 14, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 12:53:40', '2025-07-07 12:53:40', NULL),
(59, 'qwert', NULL, 0, 213, 'qwertyui', NULL, '23452313132', 1, NULL, NULL, '21345wertyuio sdfghjkl xcvbnm', NULL, 'test.support@gmail.com', '923123213132', NULL, NULL, 'https://abc.com', 'https://linkedin.com', 'https://abc.com', 'https://abc.com', 'https://threads.com', 'https://instagram.com', 0, '0', NULL, NULL, '34543', 'Ingen Adress / en annan adress', 'Qwa-Qwa', NULL, 'Argentina', 10, 60, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 21600000, 0, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 13:48:54', '2025-07-07 13:48:54', NULL),
(60, 'qwert', NULL, 0, 214, 'Usman&Co.', NULL, '23456789', 1, NULL, NULL, '12345wqetuiop', NULL, 'test.support@gmail.com', '922134567890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, '23454', 'Ingen Adress / en annan adress', 'Stockholm', NULL, 'Aruba', 12, 70, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 0, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 13:52:06', '2025-07-07 13:52:06', NULL),
(61, 'Lillith Roman', NULL, 0, 215, 'Mcdonald Bright Trading', NULL, '877', 1, NULL, NULL, 'Cupiditate aute debitis est consectetur nostrud harum ut illum', NULL, 'vorosibomi@mailinator.com', '921234567890', NULL, NULL, 'https://www.tejoperutocozoz.me', 'https://www.vasi.ws', 'https://www.zyfilolatanam.tv', 'https://www.nodatapanutewi.me.uk', 'https://www.zuweludawyx.org.uk', 'https://www.xalabapylyguqy.org', 0, '0', NULL, NULL, '54', 'Iste illum adipisci', 'Pariatur Tenetur no', NULL, 'Guadeloupe', 89, 110, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 0, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 13:55:41', '2025-07-07 13:55:41', NULL),
(63, 'Universal Club', NULL, 0, 220, 'Glaxit', NULL, '6788989', 1, NULL, NULL, 'This is new constructed club', NULL, 'waqar.glaxit@gmail.com', '1234567891111', NULL, '234567893453', 'https://website.com', 'https://linkedin/abc', 'https://facebook.com', 'https://twitter-or-x.com', NULL, 'https://instagram.com', 1, 'YuiTReg886KgIr', 74.35870000, 31.52040000, '34543', 'Ganhara plaza near taxila museum taxila', 'Taxila', 'Punjab', 'Barbados', 20, 37, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 21600000, 14, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 14:04:14', '2025-07-07 14:04:14', NULL),
(64, 'Universal Club', NULL, 0, 221, 'Glaxit', NULL, '6788989', 1, NULL, NULL, 'This is new constructed club', NULL, 'waqar.glaxit@gmail.com', '1234567891111', NULL, '234567893453', 'https://website.com', 'https://linkedin/abc', 'https://facebook.com', 'https://twitter-or-x.com', NULL, 'https://instagram.com', 1, 'YuiTReg886KgIr', 74.35870000, 31.52040000, '34543', 'Ganhara plaza near taxila museum taxila', 'Taxila', 'Punjab', 'Barbados', 20, 37, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 21600000, 14, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 14:05:31', '2025-07-07 14:05:31', NULL),
(65, 'Universal Club', NULL, 0, 222, 'Glaxit', NULL, '6788989', 1, NULL, NULL, 'This is new constructed club', NULL, 'waqar.glaxit@gmail.com', '1234567891111', NULL, '234567893453', 'https://website.com', 'https://linkedin/abc', 'https://facebook.com', 'https://twitter-or-x.com', NULL, 'https://instagram.com', 1, 'YuiTReg886KgIr', 74.35870000, 31.52040000, '34543', 'Ganhara plaza near taxila museum taxila', 'Taxila', 'Punjab', 'Barbados', 20, 37, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 21600000, 14, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 14:06:19', '2025-07-07 14:06:19', NULL),
(67, 'Macy Nichols', NULL, 0, 224, 'Madden Palmer Associates', NULL, '305', 1, NULL, NULL, 'In quia accusamus et soluta illum duis qui qui vitae inventore voluptas tempore modi fugit est quas dolorum fuga', NULL, 'sepug@mailinator.com', '922134567890', NULL, NULL, 'https://www.nuhymena.mobi', 'https://www.qatepomykewes.cc', 'https://www.motasuhefyza.us', 'https://www.revusipyba.org.au', 'https://www.pycomebediwov.org.uk', 'https://www.ladun.org.uk', 0, '0', NULL, NULL, '41', 'Omnis reiciendis id', 'Laborum consequatur', NULL, 'Eritrea', 69, 5, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 0, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 14:13:32', '2025-07-07 14:13:32', NULL),
(68, 'Macy Nichols', NULL, 0, 225, 'Madden Palmer Associates', NULL, '305', 1, NULL, NULL, 'In quia accusamus et soluta illum duis qui qui vitae inventore voluptas tempore modi fugit est quas dolorum fuga', NULL, 'sepug@mailinator.com', '922134567890', NULL, NULL, 'https://www.nuhymena.mobi', 'https://www.qatepomykewes.cc', 'https://www.motasuhefyza.us', 'https://www.revusipyba.org.au', 'https://www.pycomebediwov.org.uk', 'https://www.ladun.org.uk', 0, '0', NULL, NULL, '41', 'Omnis reiciendis id', 'Laborum consequatur', NULL, 'Eritrea', 69, 5, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 0, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 14:14:09', '2025-07-07 14:14:09', NULL),
(69, 'Macy Nichols', NULL, 0, 226, 'Madden Palmer Associates', NULL, '305', 1, NULL, NULL, 'In quia accusamus et soluta illum duis qui qui vitae inventore voluptas tempore modi fugit est quas dolorum fuga', NULL, 'sepug@mailinator.com', '922134567890', NULL, NULL, 'https://www.nuhymena.mobi', 'https://www.qatepomykewes.cc', 'https://www.motasuhefyza.us', 'https://www.revusipyba.org.au', 'https://www.pycomebediwov.org.uk', 'https://www.ladun.org.uk', 0, '0', NULL, NULL, '41', 'Omnis reiciendis id', 'Laborum consequatur', NULL, 'Eritrea', 69, 5, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 0, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 14:17:39', '2025-07-07 14:17:39', NULL),
(70, 'Macy Nichols', NULL, 0, 227, 'Madden Palmer Associates', NULL, '305', 1, NULL, NULL, 'In quia accusamus et soluta illum duis qui qui vitae inventore voluptas tempore modi fugit est quas dolorum fuga', NULL, 'sepug@mailinator.com', '922134567890', NULL, NULL, 'https://www.nuhymena.mobi', 'https://www.qatepomykewes.cc', 'https://www.motasuhefyza.us', 'https://www.revusipyba.org.au', 'https://www.pycomebediwov.org.uk', 'https://www.ladun.org.uk', 0, '0', NULL, NULL, '41', 'Omnis reiciendis id', 'Laborum consequatur', NULL, 'Eritrea', 69, 5, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 0, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 14:17:54', '2025-07-07 14:17:54', NULL),
(71, 'Macy Nichols', NULL, 0, 228, 'Madden Palmer Associates', NULL, '305', 1, NULL, NULL, 'In quia accusamus et soluta illum duis qui qui vitae inventore voluptas tempore modi fugit est quas dolorum fuga', NULL, 'sepug@mailinator.com', '922134567890', NULL, NULL, 'https://www.nuhymena.mobi', 'https://www.qatepomykewes.cc', 'https://www.motasuhefyza.us', 'https://www.revusipyba.org.au', 'https://www.pycomebediwov.org.uk', 'https://www.ladun.org.uk', 0, '0', NULL, NULL, '41', 'Omnis reiciendis id', 'Laborum consequatur', NULL, 'Eritrea', 69, 5, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 0, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 14:18:03', '2025-07-07 14:18:03', NULL),
(72, 'New-Ace', NULL, 0, 229, 'New-Community', NULL, '305', 1, NULL, NULL, 'In quia accusamus et soluta illum duis qui qui vitae inventore voluptas tempore modi fugit est quas dolorum fuga', NULL, 'sepug@mailinator.com', '922134567890', NULL, NULL, 'https://www.nuhymena.mobi', 'https://www.qatepomykewes.cc', 'https://www.motasuhefyza.us', 'https://www.revusipyba.org.au', 'https://www.pycomebediwov.org.uk', 'https://www.ladun.org.uk', 0, '0', NULL, NULL, '41', 'Omnis reiciendis id', 'Laborum consequatur', NULL, 'Eritrea', 69, 5, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 0, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 14:18:46', '2025-07-09 12:12:06', NULL),
(73, 'Macy Nichols', NULL, 0, 230, 'Madden Palmer Associates', NULL, '305', 1, NULL, NULL, 'In quia accusamus et soluta illum duis qui qui vitae inventore voluptas tempore modi fugit est quas dolorum fuga', NULL, 'sepug@mailinator.com', '922134567890', NULL, NULL, 'https://www.nuhymena.mobi', 'https://www.qatepomykewes.cc', 'https://www.motasuhefyza.us', 'https://www.revusipyba.org.au', 'https://www.pycomebediwov.org.uk', 'https://www.ladun.org.uk', 0, '0', NULL, NULL, '41', 'Omnis reiciendis id', 'Laborum consequatur', NULL, 'Eritrea', 69, 5, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 0, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 14:19:03', '2025-07-07 14:19:03', NULL),
(74, 'Macy Nichols', NULL, 0, 231, 'Madden Palmer Associates', NULL, '305', 1, NULL, NULL, 'In quia accusamus et soluta illum duis qui qui vitae inventore voluptas tempore modi fugit est quas dolorum fuga', NULL, 'sepug@mailinator.com', '922134567890', NULL, NULL, 'https://www.nuhymena.mobi', 'https://www.qatepomykewes.cc', 'https://www.motasuhefyza.us', 'https://www.revusipyba.org.au', 'https://www.pycomebediwov.org.uk', 'https://www.ladun.org.uk', 0, '0', NULL, NULL, '41', 'Omnis reiciendis id', 'Laborum consequatur', NULL, 'Eritrea', 69, 5, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 0, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 14:19:21', '2025-07-07 14:19:21', NULL),
(75, 'Macy Nichols', NULL, 0, 232, 'Madden Palmer Associates', NULL, '305', 1, NULL, NULL, 'In quia accusamus et soluta illum duis qui qui vitae inventore voluptas tempore modi fugit est quas dolorum fuga', NULL, 'sepug@mailinator.com', '922134567890', NULL, NULL, 'https://www.nuhymena.mobi', 'https://www.qatepomykewes.cc', 'https://www.motasuhefyza.us', 'https://www.revusipyba.org.au', 'https://www.pycomebediwov.org.uk', 'https://www.ladun.org.uk', 0, '0', NULL, NULL, '41', 'Omnis reiciendis id', 'Laborum consequatur', NULL, 'Eritrea', 69, 5, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 0, 'pending_email_verification', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 14:19:43', '2025-07-09 05:38:45', NULL),
(76, 'Macy Nichols', NULL, 0, 233, 'Madden Palmer Associates', NULL, '305', 1, NULL, NULL, 'In quia accusamus et soluta illum duis qui qui vitae inventore voluptas tempore modi fugit est quas dolorum fuga', NULL, 'sepug@mailinator.com', '922134567890', NULL, NULL, 'https://www.nuhymena.mobi', 'https://www.qatepomykewes.cc', 'https://www.motasuhefyza.us', 'https://www.revusipyba.org.au', 'https://www.pycomebediwov.org.uk', 'https://www.ladun.org.uk', 0, '0', NULL, NULL, '41', 'Omnis reiciendis id', 'Laborum consequatur', NULL, 'Eritrea', 69, 5, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 0, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 14:20:33', '2025-07-07 14:20:33', NULL),
(77, 'Sage Garrett', NULL, 0, 234, 'Workman Byrd Traders', NULL, '2852345678', 1, NULL, NULL, 'Dicta ut fuga Est laborum soluta architecto dolor', NULL, 'dusuluny@mailinator.com', '219345654321', NULL, NULL, 'https://www.curiqokag.ca', 'https://www.povafebo.com', 'https://www.zucig.ws', 'https://www.jycehohom.cm', 'https://www.sozunurytada.me.uk', 'https://www.vuzopihitiqonu.com.au', 0, '0', NULL, NULL, '31231', 'Magna quasi ratione', 'Cillum temporibus ev', NULL, 'Gabon', 80, 32, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 0, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 14:22:16', '2025-07-07 14:22:16', NULL),
(85, 'Universal Club', NULL, 0, 242, 'Glaxit', NULL, '6788989', 1, NULL, 'storage/clubs/logos/7cff7508-cbf6-4d0c-9aab-63236e57a7a0.jfif', 'This is new constructed club', NULL, 'waqar.glaxit@gmail.com', '1234567891111', NULL, '234567893453', 'https://website.com', 'https://linkedin/abc', 'https://facebook.com', 'https://twitter-or-x.com', NULL, 'https://instagram.com', 1, 'YuiTReg886KgIr', 74.35870000, 31.52040000, '34543', 'Ganhara plaza near taxila museum taxila', 'Taxila', 'Punjab', 'Barbados', 20, 37, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 21600000, 14, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 14:39:47', '2025-07-07 14:39:47', NULL),
(86, 'Wynne Dickerson', NULL, 0, 243, 'Davis and Schmidt LLC', NULL, '217654', 1, NULL, NULL, 'Deserunt veritatis libero est voluptatem ut dolore', NULL, 'noca@mailinator.com', '921234567890', NULL, NULL, 'https://www.ditihyzepufu.biz', 'https://www.rijukedo.com', 'https://www.tinunygomoja.ca', 'https://www.zexehevo.com', 'https://www.hukidorunotider.ca', 'https://www.qygozy.info', 0, '0', NULL, NULL, '92321', 'Ut deserunt odit con', 'Labore dolor cumque', NULL, 'Tonga', 227, 416, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 21600000, 0, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 14:41:23', '2025-07-07 14:41:23', NULL),
(87, 'Byron Castillo', NULL, 0, 244, 'Alston Little LLC', NULL, '363', 1, NULL, 'https://ace-community.hyglaxit.com/storage/clubs/logos/232b49d8-127c-4136-ba04-d9325fae0e71.jpg', 'Minima in ex magnam eligendi eveniet deserunt doloribus neque veniam quia', NULL, 'lybe@mailinator.com', '221934567890901', NULL, NULL, 'https://www.zifoge.ws', 'https://www.qyxukeg.org.uk', 'https://www.colih.us', 'https://www.jebaxixenatuxep.in', 'https://www.piwaveqatolapal.us', 'https://www.hedojibanujy.info', 0, '0', NULL, NULL, '4', 'Ut magni quia quia q', 'Dolores eaque quas a', NULL, 'Cape Verde', 41, 294, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 0, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 15:14:58', '2025-07-07 15:14:58', NULL),
(88, 'Universal Club', NULL, 0, 245, 'Glaxit', NULL, '6788989', 1, NULL, 'https://ace-community.hyglaxit.com/storage/images/club/logo/3598d557-f182-4411-b4f4-5a7f5ae086af.jfif', 'This is new constructed club', NULL, 'waqar.glaxit@gmail.com', '1234567891111', NULL, '234567893453', 'https://website.com', 'https://linkedin/abc', 'https://facebook.com', 'https://twitter-or-x.com', NULL, 'https://instagram.com', 1, 'YuiTReg886KgIr', 74.35870000, 31.52040000, '34543', 'Ganhara plaza near taxila museum taxila', 'Taxila', 'Punjab', 'Barbados', 20, 37, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 21600000, 14, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-07 15:23:18', '2025-07-07 15:23:19', NULL),
(89, 'Quinn Edwards', NULL, 0, 246, 'Lang Hess Traders', NULL, '1402134567', 1, NULL, 'https://ace-community.hyglaxit.com/storage/images/club/logo/16c537e2-aa07-4354-9e24-fd4d56836124.jpg', 'Accusantium deserunt accusantium excepteur quasi fugit laborum odio dolor sapiente nesciunt molestias', NULL, 'cihunerab@mailinator.com', '11548257821', NULL, NULL, 'https://www.xuqyqil.me', 'https://www.todylesaqymoqu.mobi', 'https://www.punopinywavugek.us', 'https://www.faf.com', 'https://www.zuwykiqilow.ws', 'https://www.cyryvovyn.net', 0, '0', NULL, NULL, '29124', 'Doloribus eu repudia', 'Exercitationem quas', NULL, 'Slovakia', 204, 318, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 2, 'active', NULL, 1, NULL, 0, 48, NULL, '2025-07-08 12:11:29', '2025-07-08 12:38:13', NULL),
(90, 'Ori Pruitt', NULL, 0, 247, 'Park and Webster Plc', NULL, '2541234565', 1, NULL, 'https://ace-community.hyglaxit.com/storage/images/club/logo/153d8575-e1de-4f8d-9032-40fbdab52adb.jpg', 'Dolor proident quis repellendus Sit ipsam lorem voluptas fugiat pariatur Expedita nostrud quae corporis commodo id non', NULL, 'suvyf@mailinator.com', '18249933294', NULL, NULL, 'https://www.zufalybukosu.co', 'https://www.kyg.me', 'https://www.note.org.au', 'https://www.qoq.ws', 'https://www.bimipi.co', 'https://www.rivagokypol.mobi', 0, '0', NULL, NULL, '91234', 'Maxime dignissimos u', 'Quaerat odio eos qui', NULL, 'Tanzania, United Republic of', 222, 18, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 1, 'active', NULL, 1, NULL, 0, 48, NULL, '2025-07-08 12:39:11', '2025-07-08 12:39:39', NULL),
(91, 'Troy Ballard', NULL, 0, 250, 'undefined', NULL, '992', 0, NULL, 'https://ace-community.hyglaxit.com/storage/images/club/logo/6fbe52f7-51f0-48be-9341-385dae60bbfa.png', 'Ut ea nisi esse deleniti laboriosam sit qui omnis aperiam velit corporis laboris recusandae Mollit distinctio Ullam aliquip', NULL, 'pahitara@mailinator.com', '19259397347', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'undefined', 0.00000000, 0.00000000, '7', 'Harum sit voluptatem', 'Molestiae ex volupta', 'undefined', NULL, NULL, 242, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 14, 'email_verified', NULL, 0, NULL, 0, 48, NULL, '2025-07-10 04:51:49', '2025-07-17 06:35:39', NULL),
(100, 'Universal Club', NULL, 0, 262, 'Glaxit', NULL, '6788989', 1, NULL, NULL, 'This is new constructed club', NULL, 'waqar.glaxit@gmail.com', '1234567891111', NULL, NULL, 'https://website.com', 'https://linkedin/abc', 'https://facebook.com', 'https://twitter-or-x.com', NULL, 'https://instagram.com', 1, 'YuiTReg886KgIr', 74.35870000, 31.52040000, '34543', 'Ganhara plaza near taxila museum taxila', 'Taxila', 'Punjab', 'Barbados', 20, 37, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 21600000, 14, 'provisioned', NULL, 1, NULL, 0, 48, NULL, '2025-07-10 12:32:45', '2025-07-10 12:32:45', NULL),
(101, 'Hayley Watts', NULL, 0, 263, 'Todd and Emerson Plc', NULL, '259123456789', 1, NULL, 'clubs/logos/3a04b5fe-1908-4354-98a6-ad6455956ba8.jpg', 'Et dolorem qui aut unde', NULL, 'qetoxetav@mailinator.com', '15914174113', NULL, NULL, 'https://www.timodihyziwoze.ws', 'https://www.zetaf.com', 'https://www.cofo.net', 'https://www.wumekydi.cc', 'https://www.cujezuhunuxyped.net', 'https://www.gihokogihor.com.au', 0, '0', NULL, NULL, '55', 'Unde commodo dolor q', 'Voluptate iusto labo', NULL, 'Estonia', 70, 359, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 1, 'active', NULL, 1, NULL, 0, 48, NULL, '2025-07-10 12:34:12', '2025-07-10 12:40:30', NULL),
(102, 'Ivan Dean', NULL, 0, 264, 'Reynolds and Mosley Traders', NULL, '271234567890', 1, NULL, 'clubs/logos/8e053f20-7088-4a42-a9a5-a8040d073a6b.jpg', 'Earum eius magnam cillum incididunt est odio', NULL, 'wukykuc@mailinator.com', '15059573344', NULL, NULL, 'https://www.mogunyq.com.au', 'https://www.xijoqixedixyga.org', 'https://www.gudexujani.com.au', 'https://www.domy.mobi', 'https://www.rohuxudo.org', 'https://www.saxydimis.in', 0, '0', NULL, NULL, '63121', 'Iusto fugiat labore', 'Nihil nisi nulla sin', NULL, 'Mexico', 142, 116, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 1, 'active', NULL, 1, NULL, 0, 48, NULL, '2025-07-10 12:39:10', '2025-07-10 12:39:20', NULL),
(116, 'Brendan Ingram', NULL, 0, 278, 'Mccall and Barrett Co', NULL, '8751234212', 1, NULL, 'https://ace-community.hyglaxit.com/storage/images/club/logo/83abf7a9-22d2-4056-83d2-1ccdac6785c8.jpg', 'Nesciunt quos debitis sunt vitae non nostrud eaque laborum Cupidatat quos consequatur alias', NULL, 'zumuz@mailinator.com', '12657686423', NULL, NULL, 'https://www.bibumotyzyve.org', 'https://www.dehobabyjyre.biz', 'https://www.sucy.mobi', 'https://www.fogegyfa.me.uk', 'https://www.tije.biz', 'https://www.fufidepylajiw.org', 0, '0', NULL, NULL, '55122', 'Cumque dolor non et', 'Consectetur neque si', NULL, 'Norway', 167, 345, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 1, 'active', NULL, 1, NULL, 0, 48, NULL, '2025-07-11 11:49:04', '2025-07-11 11:49:57', NULL),
(117, 'Vanna Hartman', NULL, 0, 282, 'Bartlett and Adams Traders', NULL, '61921345678', 1, NULL, 'https://ace-community.hyglaxit.com/storage/images/club/logo/dacec006-6d6d-453e-b0c3-d8c42e46ac9d.jpg', 'Enim assumenda unde consequat Unde sed officia et nihil', NULL, 'wanory@mailinator.com', '17943845537', NULL, NULL, 'https://www.byh.info', 'https://www.make.cm', 'https://www.danulewif.ca', 'https://www.bemanyvudeq.ca', 'https://www.dacaqa.ca', 'https://www.liqy.org.uk', 0, '0', NULL, NULL, '71123', 'Molestiae ipsam eius', 'Reprehenderit', NULL, 'Iraq', 106, 216, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 1, 'active', NULL, 1, NULL, 0, 48, NULL, '2025-07-14 12:00:34', '2025-07-14 12:02:33', NULL),
(118, 'Ursa Johns', NULL, 0, 283, 'Weeks and Steele Plc', NULL, '430123112345', 1, NULL, 'https://ace-community.hyglaxit.com/storage/images/club/logo/8e30b8af-c868-4a2e-8d98-6e4ae22a4557.jpg', 'Animi libero vitae amet exercitation sed', NULL, 'fuwe@mailinator.com', '11124951325', NULL, NULL, 'https://www.jipuxadixel.com', 'https://www.gylid.cm', 'https://www.qogacecagenotit.org.uk', 'https://www.vofysysahunemo.com.au', 'https://www.lupoxiwuqydydyb.tv', 'https://www.letehoqux.org.uk', 0, '0', NULL, NULL, '312343', 'Id aut facilis nisi', 'Itaque quas ab digni', NULL, 'Trinidad and Tobago', 228, 165, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 2, 'pending', NULL, 1, NULL, 0, 48, NULL, '2025-07-14 13:21:27', '2025-07-14 13:21:27', NULL),
(119, 'Amber Stephenson', NULL, 0, 284, 'Glass and Page Co', NULL, '63712412112124', 1, NULL, 'https://ace-community.hyglaxit.com/storage/images/club/logo/7f7bb802-1e4e-4a21-b53a-97dd264b760a.jpg', 'Consequatur autem facilis in amet sit rerum quia quia quam irure quia laudantium laboriosam mollit pariatur Non', NULL, 'helah@mailinator.com', '13988565944', NULL, NULL, 'https://www.xyki.com.au', 'https://www.jowafuhedy.com', 'https://www.kuka.org', 'https://www.wihoxab.biz', 'https://www.bocizaqurucyre.co.uk', 'https://www.hedepyrepegyni.biz', 0, '0', NULL, NULL, '512312321', 'Possimus dolores an', 'Occaecat non do veli', NULL, 'Denmark', 61, 324, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 1, 'pending', NULL, 1, NULL, 0, 48, NULL, '2025-07-14 13:35:28', '2025-07-14 13:35:28', NULL),
(123, 'Jerry Mcdowell', NULL, 0, 288, 'Conway Zimmerman LLC', NULL, '491231231121', 1, NULL, 'https://ace-community.hyglaxit.com/storage/images/club/logo/a1812b81-3976-4854-a538-bf2aad42b4a0.jpg', 'Impedit eos ex dolorem non exercitationem earum omnis et qui dolor', NULL, 'vucyjuno@mailinator.com', '18169939188', NULL, NULL, 'https://www.xiqofokaliz.tv', 'https://www.qewisipexur.in', 'https://www.menet.tv', 'https://www.cica.org', 'https://www.xyfap.com', 'https://www.jiqimuh.co', 0, '0', NULL, NULL, '7412345', 'Nulla impedit liber', 'Ut placeat iusto ve', NULL, 'Virgin Islands, British', 245, 191, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 3, 'pending', NULL, 1, NULL, 0, 48, NULL, '2025-07-15 05:32:29', '2025-07-15 05:32:29', NULL),
(126, 'Elvis Moody', NULL, 0, 291, 'Tyson and Wilcox Inc', NULL, '89123245675', 1, NULL, 'https://ace-community.hyglaxit.com/storage/images/club/logo/d6b65fbc-b12a-454a-9803-b90c31097d03.jpg', 'Tempore est accusantium consequuntur ut distinctio Voluptates laborum nostrum sint sunt ullam et porro sint obcaecati', NULL, 'jyxib@mailinator.com', '15082142165', NULL, NULL, 'https://www.hymefijiqag.info', 'https://www.tufetyj.me.uk', 'https://www.tydu.mobi', 'https://www.ricucefi.ws', 'https://www.lydifucid.cm', 'https://www.syreli.ca', 0, '0', NULL, NULL, '73123', 'Adipisicing numquam', 'Ut est id ad ut ull', NULL, 'Macao', 130, 252, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 21600000, 3, 'active', NULL, 1, NULL, 0, 48, NULL, '2025-07-15 06:49:16', '2025-07-15 06:54:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `clubs_additional_information`
--

CREATE TABLE `clubs_additional_information` (
  `id` bigint(20) NOT NULL,
  `club_id` bigint(20) NOT NULL,
  `feature_name` varchar(255) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clubs_additional_information`
--

INSERT INTO `clubs_additional_information` (`id`, `club_id`, `feature_name`, `is_available`, `created_at`, `updated_at`) VALUES
(19, 41, 'Abc', 1, '2025-07-07 08:20:37', '2025-07-07 08:20:37'),
(20, 41, 'Def', 0, '2025-07-07 08:20:37', '2025-07-07 08:20:37'),
(21, 44, 'GYm', 1, '2025-07-07 10:30:20', '2025-07-07 10:30:20'),
(22, 45, 'Gym', 1, '2025-07-07 10:44:03', '2025-07-07 10:44:03'),
(23, 47, 'Abc', 1, '2025-07-07 12:11:03', '2025-07-07 12:11:03'),
(24, 47, 'Def', 0, '2025-07-07 12:11:03', '2025-07-07 12:11:03'),
(25, 48, 'Abc', 1, '2025-07-07 12:53:40', '2025-07-07 12:53:40'),
(26, 48, 'Def', 0, '2025-07-07 12:53:40', '2025-07-07 12:53:40'),
(27, 63, 'Abc', 1, '2025-07-07 14:04:14', '2025-07-07 14:04:14'),
(28, 63, 'Def', 0, '2025-07-07 14:04:14', '2025-07-07 14:04:14'),
(29, 64, 'Abc', 1, '2025-07-07 14:05:31', '2025-07-07 14:05:31'),
(30, 64, 'Def', 0, '2025-07-07 14:05:31', '2025-07-07 14:05:31'),
(31, 65, 'Abc', 1, '2025-07-07 14:06:19', '2025-07-07 14:06:19'),
(32, 65, 'Def', 0, '2025-07-07 14:06:19', '2025-07-07 14:06:19'),
(47, 85, 'Abc', 1, '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(48, 85, 'Def', 0, '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(52, 88, 'Abc', 1, '2025-07-07 15:23:19', '2025-07-07 15:23:19'),
(53, 88, 'Def', 0, '2025-07-07 15:23:19', '2025-07-07 15:23:19'),
(54, 89, 'Gym', 1, '2025-07-08 12:11:29', '2025-07-08 12:11:29'),
(55, 90, 'Gym', 1, '2025-07-08 12:39:11', '2025-07-08 12:39:11'),
(56, 40, 'Abc', 1, '2025-07-09 06:50:20', '2025-07-09 06:50:20'),
(57, 40, 'Def', 0, '2025-07-09 06:50:20', '2025-07-09 06:50:20'),
(58, 40, 'Def', 1, '2025-07-09 06:50:20', '2025-07-09 06:50:20'),
(92, 72, 'Abc', 1, '2025-07-09 12:14:41', '2025-07-09 12:14:41'),
(93, 72, 'Def', 0, '2025-07-09 12:14:41', '2025-07-09 12:14:41'),
(94, 72, 'Def', 1, '2025-07-09 12:14:41', '2025-07-09 12:14:41'),
(119, 100, 'Abc', 1, '2025-07-10 12:32:45', '2025-07-10 12:32:45'),
(120, 100, 'Def', 0, '2025-07-10 12:32:45', '2025-07-10 12:32:45'),
(131, 103, 'Abc', 1, '2025-07-11 06:17:42', '2025-07-11 06:17:42'),
(132, 103, 'Def', 0, '2025-07-11 06:17:42', '2025-07-11 06:17:42'),
(133, 104, 'Abc', 1, '2025-07-11 06:24:42', '2025-07-11 06:24:42'),
(134, 104, 'Def', 0, '2025-07-11 06:24:42', '2025-07-11 06:24:42'),
(135, 105, 'Abc', 1, '2025-07-11 06:29:20', '2025-07-11 06:29:20'),
(136, 105, 'Def', 0, '2025-07-11 06:29:20', '2025-07-11 06:29:20'),
(139, 107, 'Abc', 1, '2025-07-11 06:36:17', '2025-07-11 06:36:17'),
(140, 107, 'Def', 0, '2025-07-11 06:36:17', '2025-07-11 06:36:17'),
(141, 108, 'Abc', 1, '2025-07-11 06:47:44', '2025-07-11 06:47:44'),
(142, 108, 'Def', 0, '2025-07-11 06:47:44', '2025-07-11 06:47:44'),
(143, 109, 'Abc', 1, '2025-07-11 06:55:38', '2025-07-11 06:55:38'),
(144, 109, 'Def', 0, '2025-07-11 06:55:38', '2025-07-11 06:55:38'),
(145, 110, 'Abc', 1, '2025-07-11 06:57:01', '2025-07-11 06:57:01'),
(146, 110, 'Def', 0, '2025-07-11 06:57:01', '2025-07-11 06:57:01'),
(147, 111, 'Abc', 1, '2025-07-11 06:57:30', '2025-07-11 06:57:30'),
(148, 111, 'Def', 0, '2025-07-11 06:57:30', '2025-07-11 06:57:30'),
(149, 112, 'Abc', 1, '2025-07-11 06:59:33', '2025-07-11 06:59:33'),
(150, 112, 'Def', 0, '2025-07-11 06:59:33', '2025-07-11 06:59:33'),
(151, 113, 'Abc', 1, '2025-07-11 07:00:31', '2025-07-11 07:00:31'),
(152, 113, 'Def', 0, '2025-07-11 07:00:31', '2025-07-11 07:00:31'),
(202, 5, 'Abc', 1, '2025-07-14 09:24:44', '2025-07-14 09:24:44'),
(203, 5, 'Def', 0, '2025-07-14 09:24:44', '2025-07-14 09:24:44'),
(204, 5, 'Def', 1, '2025-07-14 09:24:44', '2025-07-14 09:24:44'),
(207, 118, 'Deserunt earum dolor', 1, '2025-07-14 13:21:27', '2025-07-14 13:21:27'),
(208, 119, 'Necessitatibus quis', 1, '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(217, 101, 'Gym', 1, '2025-07-15 04:53:13', '2025-07-15 04:53:13'),
(218, 101, 'Swimming Pool', 1, '2025-07-15 04:53:13', '2025-07-15 04:53:13'),
(225, 117, 'swimming pool', 1, '2025-07-15 05:06:36', '2025-07-15 05:06:36'),
(226, 117, 'gym', 1, '2025-07-15 05:06:36', '2025-07-15 05:06:36'),
(235, 123, 'Veniam', 1, '2025-07-15 05:32:29', '2025-07-15 05:32:29'),
(236, 123, 'qwertyu', 1, '2025-07-15 05:32:29', '2025-07-15 05:32:29'),
(239, 116, 'Gym', 1, '2025-07-15 06:33:52', '2025-07-15 06:33:52'),
(242, 126, 'Asperiores commodi q', 1, '2025-07-15 07:41:27', '2025-07-15 07:41:27'),
(243, 102, 'Gym', 1, '2025-07-15 07:42:28', '2025-07-15 07:42:28'),
(244, 102, 'Swimming Pool', 1, '2025-07-15 07:42:28', '2025-07-15 07:42:28');

-- --------------------------------------------------------

--
-- Table structure for table `club_banner_images`
--

CREATE TABLE `club_banner_images` (
  `id` bigint(20) NOT NULL,
  `club_id` bigint(20) NOT NULL,
  `banner_img` varchar(255) NOT NULL,
  `banner_img_cropped` varchar(255) DEFAULT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `club_banner_images`
--

INSERT INTO `club_banner_images` (`id`, `club_id`, `banner_img`, `banner_img_cropped`, `is_primary`, `created_at`, `updated_at`) VALUES
(3, 85, 'storage/clubs/banner-images/b3fb79b5-d530-44ef-85f7-6acf0cdf3b69.jfif', NULL, 1, '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(4, 87, 'https://ace-community.hyglaxit.com/storage/clubs/banner-images/5e2b85d9-32ad-484d-8a82-1feb8683063b.jpg', NULL, 1, '2025-07-07 15:14:58', '2025-07-07 15:14:58'),
(5, 88, 'https://ace-community.hyglaxit.com/storage/images/club/banner_images/7edf1012-9567-4467-b68e-8b5ce027dbb6.jfif', NULL, 1, '2025-07-07 15:23:19', '2025-07-07 15:23:19'),
(7, 89, 'https://ace-community.hyglaxit.com/storage/images/club/banner_images/7fe98689-9003-46bd-ba3c-a1e127476363.jpg', NULL, 1, '2025-07-08 12:11:29', '2025-07-08 12:11:29'),
(8, 90, 'https://ace-community.hyglaxit.com/storage/images/club/banner_images/9067361f-f117-4016-9257-2eb3f4289afa.jpg', NULL, 1, '2025-07-08 12:39:11', '2025-07-08 12:39:11'),
(12, 101, 'clubs/banner-images/29c2ca61-c16e-4ee5-a143-57b8c56d54e2.jpg', NULL, 1, '2025-07-10 12:34:12', '2025-07-10 12:34:12'),
(13, 102, 'clubs/banner-images/75604372-c41c-4f61-a346-7117b3744854.jpg', NULL, 1, '2025-07-10 12:39:10', '2025-07-10 12:39:10'),
(24, 116, 'https://ace-community.hyglaxit.com/storage/images/club/banner_image/d5d76a39-47d7-47f1-9335-f8cd54458696.jpg', NULL, 1, '2025-07-11 11:49:04', '2025-07-11 11:49:04'),
(26, 117, 'https://ace-community.hyglaxit.com/storage/images/club/banner_image/989a70f2-87f5-4721-a325-c460e41a0a2e.jpg', NULL, 1, '2025-07-14 12:00:34', '2025-07-14 12:00:34'),
(28, 118, 'https://ace-community.hyglaxit.com/storage/images/club/banner_image/6c36e758-a9e1-42f6-8abf-377c90dd7886.jpg', NULL, 1, '2025-07-14 13:21:27', '2025-07-14 13:21:27'),
(29, 119, 'https://ace-community.hyglaxit.com/storage/images/club/banner_image/b8ab33fa-afe2-4c63-a98a-4886c3707563.jpg', NULL, 1, '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(30, 123, 'https://ace-community.hyglaxit.com/storage/images/club/banner_image/5145efd6-7d2e-4c8e-b066-d4d737ae1a30.jpg', NULL, 1, '2025-07-15 05:32:29', '2025-07-15 05:32:29'),
(31, 126, 'https://ace-community.hyglaxit.com/storage/images/club/banner_image/8ef4d8ed-e185-40ee-a0be-241117b54994.jpg', NULL, 1, '2025-07-15 06:49:16', '2025-07-15 06:49:16'),
(48, 40, 'https://ace-community.hyglaxit.com/storage/images/club/banner_image/247ca821-b536-4d41-b505-059bb547dd49.png', NULL, 1, '2025-07-17 06:17:08', '2025-07-17 06:17:08'),
(53, 91, 'https://ace-community.hyglaxit.com/storage/images/club/banner_image/980a2ac6-1934-4aec-a251-e898b3688c2b.png', NULL, 1, '2025-07-17 06:35:39', '2025-07-17 06:35:39');

-- --------------------------------------------------------

--
-- Table structure for table `club_branches`
--

CREATE TABLE `club_branches` (
  `id` bigint(20) NOT NULL,
  `club_id` bigint(20) NOT NULL,
  `name` varchar(128) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `club_branches`
--

INSERT INTO `club_branches` (`id`, `club_id`, `name`, `created_at`, `updated_at`) VALUES
(13, 8, 'ACBranch', '2025-07-04 08:08:00', '2025-07-04 08:08:00'),
(14, 8, 'DEBranch', '2025-07-04 08:08:00', '2025-07-04 08:08:00'),
(15, 8, 'NorthSideBranch', '2025-07-04 08:08:00', '2025-07-04 08:08:00'),
(18, 10, 'qwerty-islamabad', '2025-07-04 11:24:12', '2025-07-04 11:24:12'),
(19, 10, 'qwerty-taxila', '2025-07-04 11:24:12', '2025-07-04 11:24:12'),
(23, 12, 'ACBranch', '2025-07-04 11:49:50', '2025-07-04 11:49:50'),
(24, 12, 'DEBranch', '2025-07-04 11:49:50', '2025-07-04 11:49:50'),
(25, 12, 'NorthSideBranch', '2025-07-04 11:49:50', '2025-07-04 11:49:50'),
(30, 16, 'branches-1', '2025-07-04 15:00:22', '2025-07-04 15:00:22'),
(31, 40, 'ACBranch', '2025-07-07 08:20:37', '2025-07-07 08:20:37'),
(32, 40, 'DEBranch', '2025-07-07 08:20:37', '2025-07-07 08:20:37'),
(33, 40, 'NorthSideBranch', '2025-07-07 08:20:37', '2025-07-07 08:20:37'),
(38, 44, 'branches-1', '2025-07-07 10:30:20', '2025-07-07 10:30:20'),
(39, 44, 'branches-3', '2025-07-07 10:30:20', '2025-07-07 10:30:20'),
(40, 45, 'branches-1', '2025-07-07 10:44:03', '2025-07-07 10:44:03'),
(41, 45, 'branches-2', '2025-07-07 10:44:03', '2025-07-07 10:44:03'),
(42, 46, 'tasjda-1', '2025-07-07 11:04:57', '2025-07-07 11:04:57'),
(43, 46, 'glac-1', '2025-07-07 11:04:57', '2025-07-07 11:04:57'),
(44, 47, 'ACBranch', '2025-07-07 12:11:03', '2025-07-07 12:11:03'),
(45, 47, 'DEBranch', '2025-07-07 12:11:03', '2025-07-07 12:11:03'),
(46, 47, 'NorthSideBranch', '2025-07-07 12:11:03', '2025-07-07 12:11:03'),
(47, 48, 'ACBranch', '2025-07-07 12:53:40', '2025-07-07 12:53:40'),
(48, 48, 'DEBranch', '2025-07-07 12:53:40', '2025-07-07 12:53:40'),
(49, 48, 'NorthSideBranch', '2025-07-07 12:53:40', '2025-07-07 12:53:40'),
(70, 59, 'demo-1', '2025-07-07 13:48:54', '2025-07-07 13:48:54'),
(71, 59, 'demo-2', '2025-07-07 13:48:54', '2025-07-07 13:48:54'),
(72, 60, 'branches-1', '2025-07-07 13:52:06', '2025-07-07 13:52:06'),
(76, 63, 'ACBranch', '2025-07-07 14:04:14', '2025-07-07 14:04:14'),
(77, 63, 'DEBranch', '2025-07-07 14:04:14', '2025-07-07 14:04:14'),
(78, 63, 'NorthSideBranch', '2025-07-07 14:04:14', '2025-07-07 14:04:14'),
(79, 64, 'ACBranch', '2025-07-07 14:05:31', '2025-07-07 14:05:31'),
(80, 64, 'DEBranch', '2025-07-07 14:05:31', '2025-07-07 14:05:31'),
(81, 64, 'NorthSideBranch', '2025-07-07 14:05:31', '2025-07-07 14:05:31'),
(82, 65, 'ACBranch', '2025-07-07 14:06:19', '2025-07-07 14:06:19'),
(83, 65, 'DEBranch', '2025-07-07 14:06:19', '2025-07-07 14:06:19'),
(84, 65, 'NorthSideBranch', '2025-07-07 14:06:19', '2025-07-07 14:06:19'),
(85, 67, 'Saep-1', '2025-07-07 14:13:32', '2025-07-07 14:13:32'),
(86, 67, 'seap-2', '2025-07-07 14:13:32', '2025-07-07 14:13:32'),
(87, 68, 'Saep-1', '2025-07-07 14:14:09', '2025-07-07 14:14:09'),
(88, 68, 'seap-2', '2025-07-07 14:14:09', '2025-07-07 14:14:09'),
(89, 69, 'Saep-1', '2025-07-07 14:17:39', '2025-07-07 14:17:39'),
(90, 69, 'seap-2', '2025-07-07 14:17:39', '2025-07-07 14:17:39'),
(91, 70, 'Saep-1', '2025-07-07 14:17:54', '2025-07-07 14:17:54'),
(92, 70, 'seap-2', '2025-07-07 14:17:54', '2025-07-07 14:17:54'),
(93, 71, 'Saep-1', '2025-07-07 14:18:03', '2025-07-07 14:18:03'),
(94, 71, 'seap-2', '2025-07-07 14:18:03', '2025-07-07 14:18:03'),
(95, 72, 'Saep-1', '2025-07-07 14:18:46', '2025-07-07 14:18:46'),
(96, 72, 'seap-2', '2025-07-07 14:18:46', '2025-07-07 14:18:46'),
(97, 73, 'Saep-1', '2025-07-07 14:19:03', '2025-07-07 14:19:03'),
(98, 73, 'seap-2', '2025-07-07 14:19:03', '2025-07-07 14:19:03'),
(99, 74, 'Saep-1', '2025-07-07 14:19:21', '2025-07-07 14:19:21'),
(100, 74, 'seap-2', '2025-07-07 14:19:21', '2025-07-07 14:19:21'),
(101, 75, 'Saep-1', '2025-07-07 14:19:43', '2025-07-07 14:19:43'),
(102, 75, 'seap-2', '2025-07-07 14:19:43', '2025-07-07 14:19:43'),
(103, 76, 'Saep-1', '2025-07-07 14:20:33', '2025-07-07 14:20:33'),
(104, 76, 'seap-2', '2025-07-07 14:20:33', '2025-07-07 14:20:33'),
(105, 77, 'Exercitationem ad et', '2025-07-07 14:22:16', '2025-07-07 14:22:16'),
(106, 77, 'branches-1', '2025-07-07 14:22:16', '2025-07-07 14:22:16'),
(128, 85, 'ACBranch', '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(129, 85, 'DEBranch', '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(130, 85, 'NorthSideBranch', '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(131, 86, 'Quibusdam-1', '2025-07-07 14:41:24', '2025-07-07 14:41:24'),
(132, 86, 'branches-2', '2025-07-07 14:41:24', '2025-07-07 14:41:24'),
(133, 87, 'branches-1', '2025-07-07 15:14:58', '2025-07-07 15:14:58'),
(134, 88, 'ACBranch', '2025-07-07 15:23:18', '2025-07-07 15:23:18'),
(135, 88, 'DEBranch', '2025-07-07 15:23:19', '2025-07-07 15:23:19'),
(136, 88, 'NorthSideBranch', '2025-07-07 15:23:19', '2025-07-07 15:23:19'),
(137, 90, 'branches-1', '2025-07-08 12:39:11', '2025-07-08 12:39:11'),
(138, 90, 'branches-2', '2025-07-08 12:39:11', '2025-07-08 12:39:11'),
(139, 40, 'ACBranch', '2025-07-09 10:23:57', '2025-07-09 10:23:57'),
(140, 40, 'DEBranch', '2025-07-09 10:23:57', '2025-07-09 10:23:57'),
(141, 40, 'NorthSideBranch', '2025-07-09 10:23:57', '2025-07-09 10:23:57'),
(142, 40, 'ACBranch', '2025-07-10 05:36:11', '2025-07-10 05:36:11'),
(143, 40, 'DEBranch', '2025-07-10 05:36:11', '2025-07-10 05:36:11'),
(144, 40, 'NorthSideBranch', '2025-07-10 05:36:11', '2025-07-10 05:36:11'),
(145, 40, 'ACBranch', '2025-07-10 05:48:43', '2025-07-10 05:48:43'),
(146, 40, 'DEBranch', '2025-07-10 05:48:43', '2025-07-10 05:48:43'),
(147, 40, 'NorthSideBranch', '2025-07-10 05:48:43', '2025-07-10 05:48:43'),
(154, 100, 'ACBranch', '2025-07-10 12:32:45', '2025-07-10 12:32:45'),
(155, 100, 'DEBranch', '2025-07-10 12:32:45', '2025-07-10 12:32:45'),
(156, 100, 'NorthSideBranch', '2025-07-10 12:32:45', '2025-07-10 12:32:45'),
(195, 40, 'ACBranch', '2025-07-12 07:16:14', '2025-07-12 07:16:14'),
(196, 40, 'DEBranch', '2025-07-12 07:16:14', '2025-07-12 07:16:14'),
(197, 40, 'NorthSideBranch', '2025-07-12 07:16:14', '2025-07-12 07:16:14'),
(200, 118, 'Minima-1', '2025-07-14 13:21:27', '2025-07-14 13:21:27'),
(201, 118, 'minima-2', '2025-07-14 13:21:27', '2025-07-14 13:21:27'),
(202, 119, 'Aut-2', '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(203, 119, 'aut-4', '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(212, 101, 'Numquam-1', '2025-07-15 04:53:13', '2025-07-15 04:53:13'),
(213, 101, 'branches-2', '2025-07-15 04:53:13', '2025-07-15 04:53:13'),
(220, 117, 'Pariatur-1', '2025-07-15 05:06:36', '2025-07-15 05:06:36'),
(221, 117, 'tyuera-2', '2025-07-15 05:06:36', '2025-07-15 05:06:36'),
(227, 123, 'Doloribus-1', '2025-07-15 05:32:29', '2025-07-15 05:32:29'),
(228, 123, 'dobi-2', '2025-07-15 05:32:29', '2025-07-15 05:32:29'),
(232, 116, 'Accusantium-1', '2025-07-15 06:33:52', '2025-07-15 06:33:52'),
(235, 126, 'Blanditiis-1', '2025-07-15 07:41:27', '2025-07-15 07:41:27'),
(236, 102, 'Omnis-1', '2025-07-15 07:42:28', '2025-07-15 07:42:28'),
(237, 102, 'omni-2', '2025-07-15 07:42:28', '2025-07-15 07:42:28'),
(238, 40, 'ACBranch', '2025-07-17 04:56:27', '2025-07-17 04:56:27'),
(239, 40, 'DEBranch', '2025-07-17 04:56:27', '2025-07-17 04:56:27'),
(240, 40, 'NorthSideBranch', '2025-07-17 04:56:27', '2025-07-17 04:56:27'),
(241, 40, 'ACBranch', '2025-07-17 04:58:14', '2025-07-17 04:58:14'),
(242, 40, 'DEBranch', '2025-07-17 04:58:14', '2025-07-17 04:58:14'),
(243, 40, 'NorthSideBranch', '2025-07-17 04:58:14', '2025-07-17 04:58:14'),
(244, 40, 'ACBranch', '2025-07-17 06:17:08', '2025-07-17 06:17:08'),
(245, 40, 'DEBranch', '2025-07-17 06:17:08', '2025-07-17 06:17:08'),
(246, 40, 'NorthSideBranch', '2025-07-17 06:17:08', '2025-07-17 06:17:08');

-- --------------------------------------------------------

--
-- Table structure for table `club_check_in_settings`
--

CREATE TABLE `club_check_in_settings` (
  `id` bigint(20) NOT NULL,
  `club_id` bigint(20) NOT NULL,
  `type` enum('booking','tournament','training','match') NOT NULL,
  `open_ms_before` int(11) NOT NULL DEFAULT 3600000,
  `close_ms_after` int(11) NOT NULL DEFAULT 3600000,
  `default_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `club_check_in_settings`
--

INSERT INTO `club_check_in_settings` (`id`, `club_id`, `type`, `open_ms_before`, `close_ms_after`, `default_active`, `created_at`, `updated_at`) VALUES
(13, 4, 'booking', 21600000, 3600000, 1, '2025-06-16 16:02:37', '2025-06-16 16:02:37'),
(14, 4, 'tournament', 21600000, 3600000, 0, '2025-06-16 16:02:37', '2025-06-16 16:02:37'),
(15, 4, 'training', 3600000, 3600000, 0, '2025-06-16 16:02:37', '2025-06-16 16:02:37'),
(16, 4, 'match', 3600000, 3600000, 0, '2025-06-16 16:02:37', '2025-06-16 16:02:37'),
(17, 5, 'booking', 21, 45, 0, '2025-06-16 16:05:50', '2025-06-16 16:05:50'),
(18, 5, 'tournament', 21, 86, 0, '2025-06-16 16:05:50', '2025-06-16 16:05:50'),
(19, 5, 'training', 36, 36, 0, '2025-06-16 16:05:50', '2025-06-16 16:05:50'),
(20, 5, 'match', 36, 36, 0, '2025-06-16 16:05:50', '2025-06-16 16:05:50'),
(21, 6, 'booking', 21, 45, 0, '2025-06-16 16:34:39', '2025-06-16 16:34:39'),
(22, 6, 'tournament', 21, 86, 0, '2025-06-16 16:34:39', '2025-06-16 16:34:39'),
(23, 6, 'training', 36, 36, 0, '2025-06-16 16:34:39', '2025-06-16 16:34:39'),
(24, 6, 'match', 36, 36, 0, '2025-06-16 16:34:39', '2025-06-16 16:34:39');

-- --------------------------------------------------------

--
-- Table structure for table `club_court_configurations`
--

CREATE TABLE `club_court_configurations` (
  `id` bigint(20) NOT NULL,
  `club_id` bigint(20) NOT NULL,
  `type` enum('indoor','outdoor','single','double','football_5b5','football_6b6','football_7b7','football_11b11','basketball_full','basketball_half') NOT NULL,
  `count` tinyint(3) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `club_court_configurations`
--

INSERT INTO `club_court_configurations` (`id`, `club_id`, `type`, `count`, `status`, `created_at`, `updated_at`) VALUES
(31, 8, 'indoor', 1, 'active', '2025-07-04 08:08:00', '2025-07-04 08:08:00'),
(32, 8, 'outdoor', 1, 'active', '2025-07-04 08:08:00', '2025-07-04 08:08:00'),
(33, 8, 'single', 1, 'active', '2025-07-04 08:08:00', '2025-07-04 08:08:00'),
(34, 8, 'double', 1, 'active', '2025-07-04 08:08:00', '2025-07-04 08:08:00'),
(35, 8, 'football_5b5', 1, 'active', '2025-07-04 08:08:00', '2025-07-04 08:08:00'),
(36, 8, 'football_6b6', 1, 'active', '2025-07-04 08:08:00', '2025-07-04 08:08:00'),
(37, 8, 'football_7b7', 1, 'active', '2025-07-04 08:08:00', '2025-07-04 08:08:00'),
(38, 8, 'football_11b11', 1, 'active', '2025-07-04 08:08:00', '2025-07-04 08:08:00'),
(39, 8, 'basketball_full', 1, 'active', '2025-07-04 08:08:00', '2025-07-04 08:08:00'),
(40, 8, 'basketball_half', 1, 'active', '2025-07-04 08:08:00', '2025-07-04 08:08:00'),
(66, 12, 'football_6b6', 1, 'active', '2025-07-04 11:49:50', '2025-07-04 11:49:50'),
(67, 12, 'football_7b7', 1, 'active', '2025-07-04 11:49:50', '2025-07-04 11:49:50'),
(68, 12, 'football_11b11', 1, 'active', '2025-07-04 11:49:50', '2025-07-04 11:49:50'),
(69, 12, 'basketball_full', 1, 'active', '2025-07-04 11:49:50', '2025-07-04 11:49:50'),
(70, 12, 'basketball_half', 1, 'active', '2025-07-04 11:49:50', '2025-07-04 11:49:50'),
(87, 16, 'indoor', 2, 'active', '2025-07-04 15:00:22', '2025-07-04 15:00:22'),
(88, 16, 'outdoor', 2, 'active', '2025-07-04 15:00:22', '2025-07-04 15:00:22'),
(89, 16, 'single', 2, 'active', '2025-07-04 15:00:22', '2025-07-04 15:00:22'),
(90, 16, 'double', 2, 'active', '2025-07-04 15:00:22', '2025-07-04 15:00:22'),
(91, 16, 'football_5b5', 0, 'inactive', '2025-07-04 15:00:22', '2025-07-04 15:00:22'),
(92, 16, 'football_6b6', 0, 'inactive', '2025-07-04 15:00:22', '2025-07-04 15:00:22'),
(93, 16, 'football_7b7', 0, 'inactive', '2025-07-04 15:00:22', '2025-07-04 15:00:22'),
(94, 16, 'football_11b11', 0, 'inactive', '2025-07-04 15:00:22', '2025-07-04 15:00:22'),
(95, 16, 'basketball_full', 0, 'inactive', '2025-07-04 15:00:22', '2025-07-04 15:00:22'),
(96, 16, 'basketball_half', 0, 'inactive', '2025-07-04 15:00:22', '2025-07-04 15:00:22'),
(97, 40, 'indoor', 1, 'active', '2025-07-06 09:22:37', '2025-07-06 09:22:37'),
(98, 40, 'outdoor', 1, 'active', '2025-07-06 09:22:37', '2025-07-06 09:22:37'),
(99, 40, 'single', 1, 'active', '2025-07-06 09:22:37', '2025-07-06 09:22:37'),
(100, 40, 'double', 1, 'active', '2025-07-06 09:22:37', '2025-07-06 09:22:37'),
(101, 40, 'football_5b5', 1, 'active', '2025-07-06 09:22:37', '2025-07-06 09:22:37'),
(102, 40, 'football_6b6', 1, 'active', '2025-07-06 09:22:37', '2025-07-06 09:22:37'),
(103, 40, 'football_7b7', 1, 'active', '2025-07-06 09:22:37', '2025-07-06 09:22:37'),
(104, 40, 'football_11b11', 1, 'active', '2025-07-06 09:22:37', '2025-07-06 09:22:37'),
(105, 40, 'basketball_full', 1, 'active', '2025-07-06 09:22:37', '2025-07-06 09:22:37'),
(106, 40, 'basketball_half', 1, 'active', '2025-07-06 09:22:37', '2025-07-06 09:22:37'),
(107, 40, 'indoor', 1, 'active', '2025-07-06 09:28:42', '2025-07-06 09:28:42'),
(108, 40, 'outdoor', 1, 'active', '2025-07-06 09:28:42', '2025-07-06 09:28:42'),
(109, 40, 'single', 1, 'active', '2025-07-06 09:28:42', '2025-07-06 09:28:42'),
(110, 40, 'double', 1, 'active', '2025-07-06 09:28:42', '2025-07-06 09:28:42'),
(111, 40, 'football_5b5', 1, 'active', '2025-07-06 09:28:42', '2025-07-06 09:28:42'),
(112, 40, 'football_6b6', 1, 'active', '2025-07-06 09:28:42', '2025-07-06 09:28:42'),
(113, 40, 'football_7b7', 1, 'active', '2025-07-06 09:28:42', '2025-07-06 09:28:42'),
(114, 40, 'football_11b11', 1, 'active', '2025-07-06 09:28:42', '2025-07-06 09:28:42'),
(115, 40, 'basketball_full', 1, 'active', '2025-07-06 09:28:42', '2025-07-06 09:28:42'),
(116, 40, 'basketball_half', 1, 'active', '2025-07-06 09:28:42', '2025-07-06 09:28:42'),
(117, 40, 'indoor', 1, 'active', '2025-07-06 09:30:01', '2025-07-06 09:30:01'),
(118, 40, 'outdoor', 1, 'active', '2025-07-06 09:30:01', '2025-07-06 09:30:01'),
(119, 40, 'single', 1, 'active', '2025-07-06 09:30:01', '2025-07-06 09:30:01'),
(120, 40, 'double', 1, 'active', '2025-07-06 09:30:01', '2025-07-06 09:30:01'),
(121, 40, 'football_5b5', 1, 'active', '2025-07-06 09:30:01', '2025-07-06 09:30:01'),
(122, 40, 'football_6b6', 1, 'active', '2025-07-06 09:30:01', '2025-07-06 09:30:01'),
(123, 40, 'football_7b7', 1, 'active', '2025-07-06 09:30:01', '2025-07-06 09:30:01'),
(124, 40, 'football_11b11', 1, 'active', '2025-07-06 09:30:01', '2025-07-06 09:30:01'),
(125, 40, 'basketball_full', 1, 'active', '2025-07-06 09:30:01', '2025-07-06 09:30:01'),
(126, 40, 'basketball_half', 1, 'active', '2025-07-06 09:30:01', '2025-07-06 09:30:01'),
(127, 40, 'indoor', 1, 'active', '2025-07-06 09:31:16', '2025-07-06 09:31:16'),
(128, 40, 'outdoor', 1, 'active', '2025-07-06 09:31:16', '2025-07-06 09:31:16'),
(129, 40, 'single', 1, 'active', '2025-07-06 09:31:16', '2025-07-06 09:31:16'),
(130, 40, 'double', 1, 'active', '2025-07-06 09:31:16', '2025-07-06 09:31:16'),
(131, 40, 'football_5b5', 1, 'active', '2025-07-06 09:31:16', '2025-07-06 09:31:16'),
(132, 40, 'football_6b6', 1, 'active', '2025-07-06 09:31:16', '2025-07-06 09:31:16'),
(133, 40, 'football_7b7', 1, 'active', '2025-07-06 09:31:16', '2025-07-06 09:31:16'),
(134, 40, 'football_11b11', 1, 'active', '2025-07-06 09:31:16', '2025-07-06 09:31:16'),
(135, 40, 'basketball_full', 1, 'active', '2025-07-06 09:31:16', '2025-07-06 09:31:16'),
(136, 40, 'basketball_half', 1, 'active', '2025-07-06 09:31:16', '2025-07-06 09:31:16'),
(137, 40, 'indoor', 1, 'active', '2025-07-06 09:31:34', '2025-07-06 09:31:34'),
(138, 40, 'outdoor', 1, 'active', '2025-07-06 09:31:34', '2025-07-06 09:31:34'),
(139, 40, 'single', 1, 'active', '2025-07-06 09:31:34', '2025-07-06 09:31:34'),
(140, 40, 'double', 1, 'active', '2025-07-06 09:31:34', '2025-07-06 09:31:34'),
(141, 40, 'football_5b5', 1, 'active', '2025-07-06 09:31:34', '2025-07-06 09:31:34'),
(142, 40, 'football_6b6', 1, 'active', '2025-07-06 09:31:34', '2025-07-06 09:31:34'),
(143, 40, 'football_7b7', 1, 'active', '2025-07-06 09:31:34', '2025-07-06 09:31:34'),
(144, 40, 'football_11b11', 1, 'active', '2025-07-06 09:31:34', '2025-07-06 09:31:34'),
(145, 40, 'basketball_full', 1, 'active', '2025-07-06 09:31:34', '2025-07-06 09:31:34'),
(146, 40, 'basketball_half', 1, 'active', '2025-07-06 09:31:34', '2025-07-06 09:31:34'),
(147, 40, 'indoor', 1, 'active', '2025-07-06 09:36:03', '2025-07-06 09:36:03'),
(148, 40, 'outdoor', 1, 'active', '2025-07-06 09:36:03', '2025-07-06 09:36:03'),
(149, 40, 'single', 1, 'active', '2025-07-06 09:36:03', '2025-07-06 09:36:03'),
(150, 40, 'double', 1, 'active', '2025-07-06 09:36:03', '2025-07-06 09:36:03'),
(151, 40, 'football_5b5', 1, 'active', '2025-07-06 09:36:03', '2025-07-06 09:36:03'),
(152, 40, 'football_6b6', 1, 'active', '2025-07-06 09:36:03', '2025-07-06 09:36:03'),
(153, 40, 'football_7b7', 1, 'active', '2025-07-06 09:36:03', '2025-07-06 09:36:03'),
(154, 40, 'football_11b11', 1, 'active', '2025-07-06 09:36:03', '2025-07-06 09:36:03'),
(155, 40, 'basketball_full', 1, 'active', '2025-07-06 09:36:03', '2025-07-06 09:36:03'),
(156, 40, 'basketball_half', 1, 'active', '2025-07-06 09:36:03', '2025-07-06 09:36:03'),
(157, 40, 'indoor', 1, 'active', '2025-07-06 09:39:44', '2025-07-06 09:39:44'),
(158, 40, 'outdoor', 1, 'active', '2025-07-06 09:39:44', '2025-07-06 09:39:44'),
(159, 40, 'single', 1, 'active', '2025-07-06 09:39:44', '2025-07-06 09:39:44'),
(160, 40, 'double', 1, 'active', '2025-07-06 09:39:44', '2025-07-06 09:39:44'),
(161, 40, 'football_5b5', 1, 'active', '2025-07-06 09:39:44', '2025-07-06 09:39:44'),
(162, 40, 'football_6b6', 1, 'active', '2025-07-06 09:39:44', '2025-07-06 09:39:44'),
(163, 40, 'football_7b7', 1, 'active', '2025-07-06 09:39:44', '2025-07-06 09:39:44'),
(164, 40, 'football_11b11', 1, 'active', '2025-07-06 09:39:44', '2025-07-06 09:39:44'),
(165, 40, 'basketball_full', 1, 'active', '2025-07-06 09:39:44', '2025-07-06 09:39:44'),
(166, 40, 'basketball_half', 1, 'active', '2025-07-06 09:39:44', '2025-07-06 09:39:44'),
(167, 40, 'indoor', 1, 'active', '2025-07-06 09:39:52', '2025-07-06 09:39:52'),
(168, 40, 'outdoor', 1, 'active', '2025-07-06 09:39:52', '2025-07-06 09:39:52'),
(169, 40, 'single', 1, 'active', '2025-07-06 09:39:52', '2025-07-06 09:39:52'),
(170, 40, 'double', 1, 'active', '2025-07-06 09:39:52', '2025-07-06 09:39:52'),
(171, 40, 'football_5b5', 1, 'active', '2025-07-06 09:39:52', '2025-07-06 09:39:52'),
(172, 40, 'football_6b6', 1, 'active', '2025-07-06 09:39:52', '2025-07-06 09:39:52'),
(173, 40, 'football_7b7', 1, 'active', '2025-07-06 09:39:52', '2025-07-06 09:39:52'),
(174, 40, 'football_11b11', 1, 'active', '2025-07-06 09:39:52', '2025-07-06 09:39:52'),
(175, 40, 'basketball_full', 1, 'active', '2025-07-06 09:39:52', '2025-07-06 09:39:52'),
(176, 40, 'basketball_half', 1, 'active', '2025-07-06 09:39:52', '2025-07-06 09:39:52'),
(177, 40, 'indoor', 1, 'active', '2025-07-06 09:43:23', '2025-07-06 09:43:23'),
(178, 40, 'outdoor', 1, 'active', '2025-07-06 09:43:23', '2025-07-06 09:43:23'),
(179, 40, 'single', 1, 'active', '2025-07-06 09:43:23', '2025-07-06 09:43:23'),
(180, 40, 'double', 1, 'active', '2025-07-06 09:43:23', '2025-07-06 09:43:23'),
(181, 40, 'football_5b5', 1, 'active', '2025-07-06 09:43:23', '2025-07-06 09:43:23'),
(182, 40, 'football_6b6', 1, 'active', '2025-07-06 09:43:23', '2025-07-06 09:43:23'),
(183, 40, 'football_7b7', 1, 'active', '2025-07-06 09:43:23', '2025-07-06 09:43:23'),
(184, 40, 'football_11b11', 1, 'active', '2025-07-06 09:43:23', '2025-07-06 09:43:23'),
(185, 40, 'basketball_full', 1, 'active', '2025-07-06 09:43:23', '2025-07-06 09:43:23'),
(186, 40, 'basketball_half', 1, 'active', '2025-07-06 09:43:23', '2025-07-06 09:43:23'),
(187, 40, 'indoor', 1, 'active', '2025-07-06 09:45:52', '2025-07-06 09:45:52'),
(188, 40, 'outdoor', 1, 'active', '2025-07-06 09:45:52', '2025-07-06 09:45:52'),
(189, 40, 'single', 1, 'active', '2025-07-06 09:45:52', '2025-07-06 09:45:52'),
(190, 40, 'double', 1, 'active', '2025-07-06 09:45:52', '2025-07-06 09:45:52'),
(191, 40, 'football_5b5', 1, 'active', '2025-07-06 09:45:52', '2025-07-06 09:45:52'),
(192, 40, 'football_6b6', 1, 'active', '2025-07-06 09:45:52', '2025-07-06 09:45:52'),
(193, 40, 'football_7b7', 1, 'active', '2025-07-06 09:45:52', '2025-07-06 09:45:52'),
(194, 40, 'football_11b11', 1, 'active', '2025-07-06 09:45:52', '2025-07-06 09:45:52'),
(195, 40, 'basketball_full', 1, 'active', '2025-07-06 09:45:52', '2025-07-06 09:45:52'),
(196, 40, 'basketball_half', 1, 'active', '2025-07-06 09:45:52', '2025-07-06 09:45:52'),
(197, 40, 'indoor', 1, 'active', '2025-07-06 09:46:41', '2025-07-06 09:46:41'),
(198, 40, 'outdoor', 1, 'active', '2025-07-06 09:46:41', '2025-07-06 09:46:41'),
(199, 40, 'single', 1, 'active', '2025-07-06 09:46:41', '2025-07-06 09:46:41'),
(200, 40, 'double', 1, 'active', '2025-07-06 09:46:41', '2025-07-06 09:46:41'),
(201, 40, 'football_5b5', 1, 'active', '2025-07-06 09:46:41', '2025-07-06 09:46:41'),
(202, 40, 'football_6b6', 1, 'active', '2025-07-06 09:46:41', '2025-07-06 09:46:41'),
(203, 40, 'football_7b7', 1, 'active', '2025-07-06 09:46:41', '2025-07-06 09:46:41'),
(204, 40, 'football_11b11', 1, 'active', '2025-07-06 09:46:41', '2025-07-06 09:46:41'),
(205, 40, 'basketball_full', 1, 'active', '2025-07-06 09:46:41', '2025-07-06 09:46:41'),
(206, 40, 'basketball_half', 1, 'active', '2025-07-06 09:46:41', '2025-07-06 09:46:41'),
(207, 40, 'indoor', 1, 'active', '2025-07-06 09:49:22', '2025-07-06 09:49:22'),
(208, 40, 'outdoor', 1, 'active', '2025-07-06 09:49:22', '2025-07-06 09:49:22'),
(209, 40, 'single', 1, 'active', '2025-07-06 09:49:22', '2025-07-06 09:49:22'),
(210, 40, 'double', 1, 'active', '2025-07-06 09:49:22', '2025-07-06 09:49:22'),
(211, 40, 'football_5b5', 1, 'active', '2025-07-06 09:49:22', '2025-07-06 09:49:22'),
(212, 40, 'football_6b6', 1, 'active', '2025-07-06 09:49:22', '2025-07-06 09:49:22'),
(213, 40, 'football_7b7', 1, 'active', '2025-07-06 09:49:22', '2025-07-06 09:49:22'),
(214, 40, 'football_11b11', 1, 'active', '2025-07-06 09:49:22', '2025-07-06 09:49:22'),
(215, 40, 'basketball_full', 1, 'active', '2025-07-06 09:49:22', '2025-07-06 09:49:22'),
(216, 40, 'basketball_half', 1, 'active', '2025-07-06 09:49:22', '2025-07-06 09:49:22'),
(217, 40, 'indoor', 1, 'active', '2025-07-06 10:02:23', '2025-07-06 10:02:23'),
(218, 40, 'outdoor', 1, 'active', '2025-07-06 10:02:23', '2025-07-06 10:02:23'),
(219, 40, 'single', 1, 'active', '2025-07-06 10:02:23', '2025-07-06 10:02:23'),
(220, 40, 'double', 1, 'active', '2025-07-06 10:02:23', '2025-07-06 10:02:23'),
(221, 40, 'football_5b5', 1, 'active', '2025-07-06 10:02:23', '2025-07-06 10:02:23'),
(222, 40, 'football_6b6', 1, 'active', '2025-07-06 10:02:23', '2025-07-06 10:02:23'),
(223, 40, 'football_7b7', 1, 'active', '2025-07-06 10:02:23', '2025-07-06 10:02:23'),
(224, 40, 'football_11b11', 1, 'active', '2025-07-06 10:02:23', '2025-07-06 10:02:23'),
(225, 40, 'basketball_full', 1, 'active', '2025-07-06 10:02:23', '2025-07-06 10:02:23'),
(226, 40, 'basketball_half', 1, 'active', '2025-07-06 10:02:23', '2025-07-06 10:02:23'),
(227, 40, 'indoor', 1, 'active', '2025-07-06 10:04:21', '2025-07-06 10:04:21'),
(228, 40, 'outdoor', 1, 'active', '2025-07-06 10:04:21', '2025-07-06 10:04:21'),
(229, 40, 'single', 1, 'active', '2025-07-06 10:04:21', '2025-07-06 10:04:21'),
(230, 40, 'double', 1, 'active', '2025-07-06 10:04:21', '2025-07-06 10:04:21'),
(231, 40, 'football_5b5', 1, 'active', '2025-07-06 10:04:21', '2025-07-06 10:04:21'),
(232, 40, 'football_6b6', 1, 'active', '2025-07-06 10:04:21', '2025-07-06 10:04:21'),
(233, 40, 'football_7b7', 1, 'active', '2025-07-06 10:04:21', '2025-07-06 10:04:21'),
(234, 40, 'football_11b11', 1, 'active', '2025-07-06 10:04:21', '2025-07-06 10:04:21'),
(235, 40, 'basketball_full', 1, 'active', '2025-07-06 10:04:21', '2025-07-06 10:04:21'),
(236, 40, 'basketball_half', 1, 'active', '2025-07-06 10:04:21', '2025-07-06 10:04:21'),
(237, 40, 'indoor', 1, 'active', '2025-07-06 15:32:39', '2025-07-06 15:32:39'),
(238, 40, 'outdoor', 1, 'active', '2025-07-06 15:32:39', '2025-07-06 15:32:39'),
(239, 40, 'single', 1, 'active', '2025-07-06 15:32:39', '2025-07-06 15:32:39'),
(240, 40, 'double', 1, 'active', '2025-07-06 15:32:39', '2025-07-06 15:32:39'),
(241, 40, 'football_5b5', 1, 'active', '2025-07-06 15:32:39', '2025-07-06 15:32:39'),
(242, 40, 'football_6b6', 1, 'active', '2025-07-06 15:32:39', '2025-07-06 15:32:39'),
(243, 40, 'football_7b7', 1, 'active', '2025-07-06 15:32:39', '2025-07-06 15:32:39'),
(244, 40, 'football_11b11', 1, 'active', '2025-07-06 15:32:39', '2025-07-06 15:32:39'),
(245, 40, 'basketball_full', 1, 'active', '2025-07-06 15:32:39', '2025-07-06 15:32:39'),
(246, 40, 'basketball_half', 1, 'active', '2025-07-06 15:32:39', '2025-07-06 15:32:39'),
(247, 40, 'indoor', 1, 'active', '2025-07-06 15:36:22', '2025-07-06 15:36:22'),
(248, 40, 'outdoor', 1, 'active', '2025-07-06 15:36:22', '2025-07-06 15:36:22'),
(249, 40, 'single', 1, 'active', '2025-07-06 15:36:22', '2025-07-06 15:36:22'),
(250, 40, 'double', 1, 'active', '2025-07-06 15:36:22', '2025-07-06 15:36:22'),
(251, 40, 'football_5b5', 1, 'active', '2025-07-06 15:36:22', '2025-07-06 15:36:22'),
(252, 40, 'football_6b6', 1, 'active', '2025-07-06 15:36:22', '2025-07-06 15:36:22'),
(253, 40, 'football_7b7', 1, 'active', '2025-07-06 15:36:22', '2025-07-06 15:36:22'),
(254, 40, 'football_11b11', 1, 'active', '2025-07-06 15:36:22', '2025-07-06 15:36:22'),
(255, 40, 'basketball_full', 1, 'active', '2025-07-06 15:36:22', '2025-07-06 15:36:22'),
(256, 40, 'basketball_half', 1, 'active', '2025-07-06 15:36:22', '2025-07-06 15:36:22'),
(277, 40, 'indoor', 1, 'active', '2025-07-06 15:48:26', '2025-07-06 15:48:26'),
(278, 40, 'outdoor', 1, 'active', '2025-07-06 15:48:26', '2025-07-06 15:48:26'),
(279, 40, 'single', 1, 'active', '2025-07-06 15:48:26', '2025-07-06 15:48:26'),
(280, 40, 'double', 1, 'active', '2025-07-06 15:48:26', '2025-07-06 15:48:26'),
(281, 40, 'football_5b5', 1, 'active', '2025-07-06 15:48:26', '2025-07-06 15:48:26'),
(282, 40, 'football_6b6', 1, 'active', '2025-07-06 15:48:26', '2025-07-06 15:48:26'),
(283, 40, 'football_7b7', 1, 'active', '2025-07-06 15:48:26', '2025-07-06 15:48:26'),
(284, 40, 'football_11b11', 1, 'active', '2025-07-06 15:48:26', '2025-07-06 15:48:26'),
(285, 40, 'basketball_full', 1, 'active', '2025-07-06 15:48:26', '2025-07-06 15:48:26'),
(286, 40, 'basketball_half', 1, 'active', '2025-07-06 15:48:26', '2025-07-06 15:48:26'),
(287, 41, 'indoor', 1, 'active', '2025-07-07 08:20:37', '2025-07-07 08:20:37'),
(288, 41, 'outdoor', 1, 'active', '2025-07-07 08:20:37', '2025-07-07 08:20:37'),
(289, 41, 'single', 1, 'active', '2025-07-07 08:20:37', '2025-07-07 08:20:37'),
(290, 41, 'double', 1, 'active', '2025-07-07 08:20:37', '2025-07-07 08:20:37'),
(291, 41, 'football_5b5', 1, 'active', '2025-07-07 08:20:37', '2025-07-07 08:20:37'),
(292, 41, 'football_6b6', 1, 'active', '2025-07-07 08:20:37', '2025-07-07 08:20:37'),
(293, 41, 'football_7b7', 1, 'active', '2025-07-07 08:20:37', '2025-07-07 08:20:37'),
(294, 41, 'football_11b11', 1, 'active', '2025-07-07 08:20:37', '2025-07-07 08:20:37'),
(295, 41, 'basketball_full', 1, 'active', '2025-07-07 08:20:37', '2025-07-07 08:20:37'),
(296, 41, 'basketball_half', 1, 'active', '2025-07-07 08:20:37', '2025-07-07 08:20:37'),
(317, 44, 'indoor', 5, 'active', '2025-07-07 10:30:20', '2025-07-07 10:30:20'),
(318, 44, 'outdoor', 5, 'active', '2025-07-07 10:30:20', '2025-07-07 10:30:20'),
(319, 44, 'single', 5, 'active', '2025-07-07 10:30:20', '2025-07-07 10:30:20'),
(320, 44, 'double', 5, 'active', '2025-07-07 10:30:20', '2025-07-07 10:30:20'),
(321, 44, 'football_5b5', 0, 'inactive', '2025-07-07 10:30:20', '2025-07-07 10:30:20'),
(322, 44, 'football_6b6', 0, 'inactive', '2025-07-07 10:30:20', '2025-07-07 10:30:20'),
(323, 44, 'football_7b7', 0, 'inactive', '2025-07-07 10:30:20', '2025-07-07 10:30:20'),
(324, 44, 'football_11b11', 0, 'inactive', '2025-07-07 10:30:20', '2025-07-07 10:30:20'),
(325, 44, 'basketball_full', 5, 'active', '2025-07-07 10:30:20', '2025-07-07 10:30:20'),
(326, 44, 'basketball_half', 5, 'active', '2025-07-07 10:30:20', '2025-07-07 10:30:20'),
(327, 45, 'indoor', 5, 'active', '2025-07-07 10:44:03', '2025-07-07 10:44:03'),
(328, 45, 'outdoor', 5, 'active', '2025-07-07 10:44:03', '2025-07-07 10:44:03'),
(329, 45, 'single', 5, 'active', '2025-07-07 10:44:03', '2025-07-07 10:44:03'),
(330, 45, 'double', 5, 'active', '2025-07-07 10:44:03', '2025-07-07 10:44:03'),
(331, 45, 'football_5b5', 0, 'inactive', '2025-07-07 10:44:03', '2025-07-07 10:44:03'),
(332, 45, 'football_6b6', 0, 'inactive', '2025-07-07 10:44:03', '2025-07-07 10:44:03'),
(333, 45, 'football_7b7', 0, 'inactive', '2025-07-07 10:44:03', '2025-07-07 10:44:03'),
(334, 45, 'football_11b11', 0, 'inactive', '2025-07-07 10:44:03', '2025-07-07 10:44:03'),
(335, 45, 'basketball_full', 0, 'inactive', '2025-07-07 10:44:03', '2025-07-07 10:44:03'),
(336, 45, 'basketball_half', 0, 'inactive', '2025-07-07 10:44:03', '2025-07-07 10:44:03'),
(337, 46, 'indoor', 5, 'active', '2025-07-07 11:04:57', '2025-07-07 11:04:57'),
(338, 46, 'outdoor', 5, 'active', '2025-07-07 11:04:57', '2025-07-07 11:04:57'),
(339, 46, 'single', 5, 'active', '2025-07-07 11:04:57', '2025-07-07 11:04:57'),
(340, 46, 'double', 5, 'active', '2025-07-07 11:04:57', '2025-07-07 11:04:57'),
(341, 46, 'football_5b5', 0, 'inactive', '2025-07-07 11:04:57', '2025-07-07 11:04:57'),
(342, 46, 'football_6b6', 0, 'inactive', '2025-07-07 11:04:57', '2025-07-07 11:04:57'),
(343, 46, 'football_7b7', 0, 'inactive', '2025-07-07 11:04:57', '2025-07-07 11:04:57'),
(344, 46, 'football_11b11', 0, 'inactive', '2025-07-07 11:04:57', '2025-07-07 11:04:57'),
(345, 46, 'basketball_full', 0, 'inactive', '2025-07-07 11:04:57', '2025-07-07 11:04:57'),
(346, 46, 'basketball_half', 0, 'inactive', '2025-07-07 11:04:57', '2025-07-07 11:04:57'),
(347, 47, 'indoor', 1, 'active', '2025-07-07 12:11:03', '2025-07-07 12:11:03'),
(348, 47, 'outdoor', 1, 'active', '2025-07-07 12:11:03', '2025-07-07 12:11:03'),
(349, 47, 'single', 1, 'active', '2025-07-07 12:11:03', '2025-07-07 12:11:03'),
(350, 47, 'double', 1, 'active', '2025-07-07 12:11:03', '2025-07-07 12:11:03'),
(351, 47, 'football_5b5', 1, 'active', '2025-07-07 12:11:03', '2025-07-07 12:11:03'),
(352, 47, 'football_6b6', 1, 'active', '2025-07-07 12:11:03', '2025-07-07 12:11:03'),
(353, 47, 'football_7b7', 1, 'active', '2025-07-07 12:11:03', '2025-07-07 12:11:03'),
(354, 47, 'football_11b11', 1, 'active', '2025-07-07 12:11:03', '2025-07-07 12:11:03'),
(355, 47, 'basketball_full', 1, 'active', '2025-07-07 12:11:03', '2025-07-07 12:11:03'),
(356, 47, 'basketball_half', 1, 'active', '2025-07-07 12:11:03', '2025-07-07 12:11:03'),
(357, 48, 'indoor', 1, 'active', '2025-07-07 12:53:40', '2025-07-07 12:53:40'),
(358, 48, 'outdoor', 1, 'active', '2025-07-07 12:53:40', '2025-07-07 12:53:40'),
(359, 48, 'single', 1, 'active', '2025-07-07 12:53:40', '2025-07-07 12:53:40'),
(360, 48, 'double', 1, 'active', '2025-07-07 12:53:40', '2025-07-07 12:53:40'),
(361, 48, 'football_5b5', 1, 'active', '2025-07-07 12:53:40', '2025-07-07 12:53:40'),
(362, 48, 'football_6b6', 1, 'active', '2025-07-07 12:53:40', '2025-07-07 12:53:40'),
(363, 48, 'football_7b7', 1, 'active', '2025-07-07 12:53:40', '2025-07-07 12:53:40'),
(364, 48, 'football_11b11', 1, 'active', '2025-07-07 12:53:40', '2025-07-07 12:53:40'),
(365, 48, 'basketball_full', 1, 'active', '2025-07-07 12:53:40', '2025-07-07 12:53:40'),
(366, 48, 'basketball_half', 1, 'active', '2025-07-07 12:53:40', '2025-07-07 12:53:40'),
(467, 59, 'indoor', 4, 'active', '2025-07-07 13:48:54', '2025-07-07 13:48:54'),
(468, 59, 'outdoor', 4, 'active', '2025-07-07 13:48:54', '2025-07-07 13:48:54'),
(469, 59, 'single', 4, 'active', '2025-07-07 13:48:54', '2025-07-07 13:48:54'),
(470, 59, 'double', 4, 'active', '2025-07-07 13:48:54', '2025-07-07 13:48:54'),
(471, 59, 'football_5b5', 0, 'inactive', '2025-07-07 13:48:54', '2025-07-07 13:48:54'),
(472, 59, 'football_6b6', 0, 'inactive', '2025-07-07 13:48:54', '2025-07-07 13:48:54'),
(473, 59, 'football_7b7', 0, 'inactive', '2025-07-07 13:48:54', '2025-07-07 13:48:54'),
(474, 59, 'football_11b11', 0, 'inactive', '2025-07-07 13:48:54', '2025-07-07 13:48:54'),
(475, 59, 'basketball_full', 0, 'inactive', '2025-07-07 13:48:54', '2025-07-07 13:48:54'),
(476, 59, 'basketball_half', 0, 'inactive', '2025-07-07 13:48:54', '2025-07-07 13:48:54'),
(477, 60, 'indoor', 4, 'active', '2025-07-07 13:52:06', '2025-07-07 13:52:06'),
(478, 60, 'outdoor', 4, 'active', '2025-07-07 13:52:06', '2025-07-07 13:52:06'),
(479, 60, 'single', 4, 'active', '2025-07-07 13:52:06', '2025-07-07 13:52:06'),
(480, 60, 'double', 4, 'active', '2025-07-07 13:52:06', '2025-07-07 13:52:06'),
(481, 60, 'football_5b5', 0, 'inactive', '2025-07-07 13:52:06', '2025-07-07 13:52:06'),
(482, 60, 'football_6b6', 0, 'inactive', '2025-07-07 13:52:06', '2025-07-07 13:52:06'),
(483, 60, 'football_7b7', 0, 'inactive', '2025-07-07 13:52:06', '2025-07-07 13:52:06'),
(484, 60, 'football_11b11', 0, 'inactive', '2025-07-07 13:52:06', '2025-07-07 13:52:06'),
(485, 60, 'basketball_full', 0, 'inactive', '2025-07-07 13:52:07', '2025-07-07 13:52:07'),
(486, 60, 'basketball_half', 0, 'inactive', '2025-07-07 13:52:07', '2025-07-07 13:52:07'),
(487, 61, 'indoor', 4, 'active', '2025-07-07 13:55:41', '2025-07-07 13:55:41'),
(488, 61, 'outdoor', 4, 'active', '2025-07-07 13:55:41', '2025-07-07 13:55:41'),
(489, 61, 'single', 4, 'active', '2025-07-07 13:55:41', '2025-07-07 13:55:41'),
(490, 61, 'double', 4, 'active', '2025-07-07 13:55:41', '2025-07-07 13:55:41'),
(491, 61, 'football_5b5', 0, 'inactive', '2025-07-07 13:55:41', '2025-07-07 13:55:41'),
(492, 61, 'football_6b6', 0, 'inactive', '2025-07-07 13:55:41', '2025-07-07 13:55:41'),
(493, 61, 'football_7b7', 0, 'inactive', '2025-07-07 13:55:41', '2025-07-07 13:55:41'),
(494, 61, 'football_11b11', 0, 'inactive', '2025-07-07 13:55:41', '2025-07-07 13:55:41'),
(495, 61, 'basketball_full', 0, 'inactive', '2025-07-07 13:55:41', '2025-07-07 13:55:41'),
(496, 61, 'basketball_half', 0, 'inactive', '2025-07-07 13:55:41', '2025-07-07 13:55:41'),
(497, 63, 'indoor', 1, 'active', '2025-07-07 14:04:14', '2025-07-07 14:04:14'),
(498, 63, 'outdoor', 1, 'active', '2025-07-07 14:04:14', '2025-07-07 14:04:14'),
(499, 63, 'single', 1, 'active', '2025-07-07 14:04:14', '2025-07-07 14:04:14'),
(500, 63, 'double', 1, 'active', '2025-07-07 14:04:14', '2025-07-07 14:04:14'),
(501, 63, 'football_5b5', 1, 'active', '2025-07-07 14:04:14', '2025-07-07 14:04:14'),
(502, 63, 'football_6b6', 1, 'active', '2025-07-07 14:04:14', '2025-07-07 14:04:14'),
(503, 63, 'football_7b7', 1, 'active', '2025-07-07 14:04:14', '2025-07-07 14:04:14'),
(504, 63, 'football_11b11', 1, 'active', '2025-07-07 14:04:14', '2025-07-07 14:04:14'),
(505, 63, 'basketball_full', 1, 'active', '2025-07-07 14:04:14', '2025-07-07 14:04:14'),
(506, 63, 'basketball_half', 1, 'active', '2025-07-07 14:04:14', '2025-07-07 14:04:14'),
(507, 64, 'indoor', 1, 'active', '2025-07-07 14:05:31', '2025-07-07 14:05:31'),
(508, 64, 'outdoor', 1, 'active', '2025-07-07 14:05:31', '2025-07-07 14:05:31'),
(509, 64, 'single', 1, 'active', '2025-07-07 14:05:31', '2025-07-07 14:05:31'),
(510, 64, 'double', 1, 'active', '2025-07-07 14:05:31', '2025-07-07 14:05:31'),
(511, 64, 'football_5b5', 1, 'active', '2025-07-07 14:05:31', '2025-07-07 14:05:31'),
(512, 64, 'football_6b6', 1, 'active', '2025-07-07 14:05:31', '2025-07-07 14:05:31'),
(513, 64, 'football_7b7', 1, 'active', '2025-07-07 14:05:31', '2025-07-07 14:05:31'),
(514, 64, 'football_11b11', 1, 'active', '2025-07-07 14:05:31', '2025-07-07 14:05:31'),
(515, 64, 'basketball_full', 1, 'active', '2025-07-07 14:05:31', '2025-07-07 14:05:31'),
(516, 64, 'basketball_half', 1, 'active', '2025-07-07 14:05:31', '2025-07-07 14:05:31'),
(517, 65, 'indoor', 1, 'active', '2025-07-07 14:06:19', '2025-07-07 14:06:19'),
(518, 65, 'outdoor', 1, 'active', '2025-07-07 14:06:19', '2025-07-07 14:06:19'),
(519, 65, 'single', 1, 'active', '2025-07-07 14:06:19', '2025-07-07 14:06:19'),
(520, 65, 'double', 1, 'active', '2025-07-07 14:06:19', '2025-07-07 14:06:19'),
(521, 65, 'football_5b5', 1, 'active', '2025-07-07 14:06:19', '2025-07-07 14:06:19'),
(522, 65, 'football_6b6', 1, 'active', '2025-07-07 14:06:19', '2025-07-07 14:06:19'),
(523, 65, 'football_7b7', 1, 'active', '2025-07-07 14:06:19', '2025-07-07 14:06:19'),
(524, 65, 'football_11b11', 1, 'active', '2025-07-07 14:06:19', '2025-07-07 14:06:19'),
(525, 65, 'basketball_full', 1, 'active', '2025-07-07 14:06:19', '2025-07-07 14:06:19'),
(526, 65, 'basketball_half', 1, 'active', '2025-07-07 14:06:19', '2025-07-07 14:06:19'),
(527, 67, 'indoor', 4, 'active', '2025-07-07 14:13:32', '2025-07-07 14:13:32'),
(528, 67, 'outdoor', 4, 'active', '2025-07-07 14:13:32', '2025-07-07 14:13:32'),
(529, 67, 'single', 4, 'active', '2025-07-07 14:13:32', '2025-07-07 14:13:32'),
(530, 67, 'double', 4, 'active', '2025-07-07 14:13:32', '2025-07-07 14:13:32'),
(531, 67, 'football_5b5', 0, 'inactive', '2025-07-07 14:13:32', '2025-07-07 14:13:32'),
(532, 67, 'football_6b6', 0, 'inactive', '2025-07-07 14:13:32', '2025-07-07 14:13:32'),
(533, 67, 'football_7b7', 0, 'inactive', '2025-07-07 14:13:32', '2025-07-07 14:13:32'),
(534, 67, 'football_11b11', 0, 'inactive', '2025-07-07 14:13:32', '2025-07-07 14:13:32'),
(535, 67, 'basketball_full', 0, 'inactive', '2025-07-07 14:13:32', '2025-07-07 14:13:32'),
(536, 67, 'basketball_half', 0, 'inactive', '2025-07-07 14:13:32', '2025-07-07 14:13:32'),
(537, 68, 'indoor', 4, 'active', '2025-07-07 14:14:09', '2025-07-07 14:14:09'),
(538, 68, 'outdoor', 4, 'active', '2025-07-07 14:14:09', '2025-07-07 14:14:09'),
(539, 68, 'single', 4, 'active', '2025-07-07 14:14:09', '2025-07-07 14:14:09'),
(540, 68, 'double', 4, 'active', '2025-07-07 14:14:09', '2025-07-07 14:14:09'),
(541, 68, 'football_5b5', 0, 'inactive', '2025-07-07 14:14:09', '2025-07-07 14:14:09'),
(542, 68, 'football_6b6', 0, 'inactive', '2025-07-07 14:14:09', '2025-07-07 14:14:09'),
(543, 68, 'football_7b7', 0, 'inactive', '2025-07-07 14:14:09', '2025-07-07 14:14:09'),
(544, 68, 'football_11b11', 0, 'inactive', '2025-07-07 14:14:09', '2025-07-07 14:14:09'),
(545, 68, 'basketball_full', 0, 'inactive', '2025-07-07 14:14:09', '2025-07-07 14:14:09'),
(546, 68, 'basketball_half', 0, 'inactive', '2025-07-07 14:14:09', '2025-07-07 14:14:09'),
(547, 69, 'indoor', 4, 'active', '2025-07-07 14:17:39', '2025-07-07 14:17:39'),
(548, 69, 'outdoor', 4, 'active', '2025-07-07 14:17:39', '2025-07-07 14:17:39'),
(549, 69, 'single', 4, 'active', '2025-07-07 14:17:39', '2025-07-07 14:17:39'),
(550, 69, 'double', 4, 'active', '2025-07-07 14:17:39', '2025-07-07 14:17:39'),
(551, 69, 'football_5b5', 0, 'inactive', '2025-07-07 14:17:39', '2025-07-07 14:17:39'),
(552, 69, 'football_6b6', 0, 'inactive', '2025-07-07 14:17:39', '2025-07-07 14:17:39'),
(553, 69, 'football_7b7', 0, 'inactive', '2025-07-07 14:17:39', '2025-07-07 14:17:39'),
(554, 69, 'football_11b11', 0, 'inactive', '2025-07-07 14:17:39', '2025-07-07 14:17:39'),
(555, 69, 'basketball_full', 0, 'inactive', '2025-07-07 14:17:39', '2025-07-07 14:17:39'),
(556, 69, 'basketball_half', 0, 'inactive', '2025-07-07 14:17:39', '2025-07-07 14:17:39'),
(557, 70, 'indoor', 4, 'active', '2025-07-07 14:17:54', '2025-07-07 14:17:54'),
(558, 70, 'outdoor', 4, 'active', '2025-07-07 14:17:54', '2025-07-07 14:17:54'),
(559, 70, 'single', 4, 'active', '2025-07-07 14:17:54', '2025-07-07 14:17:54'),
(560, 70, 'double', 4, 'active', '2025-07-07 14:17:54', '2025-07-07 14:17:54'),
(561, 70, 'football_5b5', 0, 'inactive', '2025-07-07 14:17:54', '2025-07-07 14:17:54'),
(562, 70, 'football_6b6', 0, 'inactive', '2025-07-07 14:17:54', '2025-07-07 14:17:54'),
(563, 70, 'football_7b7', 0, 'inactive', '2025-07-07 14:17:54', '2025-07-07 14:17:54'),
(564, 70, 'football_11b11', 0, 'inactive', '2025-07-07 14:17:54', '2025-07-07 14:17:54'),
(565, 70, 'basketball_full', 0, 'inactive', '2025-07-07 14:17:54', '2025-07-07 14:17:54'),
(566, 70, 'basketball_half', 0, 'inactive', '2025-07-07 14:17:54', '2025-07-07 14:17:54'),
(567, 71, 'indoor', 4, 'active', '2025-07-07 14:18:03', '2025-07-07 14:18:03'),
(568, 71, 'outdoor', 4, 'active', '2025-07-07 14:18:03', '2025-07-07 14:18:03'),
(569, 71, 'single', 4, 'active', '2025-07-07 14:18:03', '2025-07-07 14:18:03'),
(570, 71, 'double', 4, 'active', '2025-07-07 14:18:03', '2025-07-07 14:18:03'),
(571, 71, 'football_5b5', 0, 'inactive', '2025-07-07 14:18:03', '2025-07-07 14:18:03'),
(572, 71, 'football_6b6', 0, 'inactive', '2025-07-07 14:18:03', '2025-07-07 14:18:03'),
(573, 71, 'football_7b7', 0, 'inactive', '2025-07-07 14:18:03', '2025-07-07 14:18:03'),
(574, 71, 'football_11b11', 0, 'inactive', '2025-07-07 14:18:03', '2025-07-07 14:18:03'),
(575, 71, 'basketball_full', 0, 'inactive', '2025-07-07 14:18:03', '2025-07-07 14:18:03'),
(576, 71, 'basketball_half', 0, 'inactive', '2025-07-07 14:18:03', '2025-07-07 14:18:03'),
(577, 72, 'indoor', 4, 'active', '2025-07-07 14:18:46', '2025-07-07 14:18:46'),
(578, 72, 'outdoor', 4, 'active', '2025-07-07 14:18:46', '2025-07-07 14:18:46'),
(579, 72, 'single', 4, 'active', '2025-07-07 14:18:46', '2025-07-07 14:18:46'),
(580, 72, 'double', 4, 'active', '2025-07-07 14:18:46', '2025-07-07 14:18:46'),
(581, 72, 'football_5b5', 0, 'inactive', '2025-07-07 14:18:46', '2025-07-07 14:18:46'),
(582, 72, 'football_6b6', 0, 'inactive', '2025-07-07 14:18:46', '2025-07-07 14:18:46'),
(583, 72, 'football_7b7', 0, 'inactive', '2025-07-07 14:18:46', '2025-07-07 14:18:46'),
(584, 72, 'football_11b11', 0, 'inactive', '2025-07-07 14:18:46', '2025-07-07 14:18:46'),
(585, 72, 'basketball_full', 0, 'inactive', '2025-07-07 14:18:46', '2025-07-07 14:18:46'),
(586, 72, 'basketball_half', 0, 'inactive', '2025-07-07 14:18:46', '2025-07-07 14:18:46'),
(587, 73, 'indoor', 4, 'active', '2025-07-07 14:19:03', '2025-07-07 14:19:03'),
(588, 73, 'outdoor', 4, 'active', '2025-07-07 14:19:03', '2025-07-07 14:19:03'),
(589, 73, 'single', 4, 'active', '2025-07-07 14:19:03', '2025-07-07 14:19:03'),
(590, 73, 'double', 4, 'active', '2025-07-07 14:19:03', '2025-07-07 14:19:03'),
(591, 73, 'football_5b5', 0, 'inactive', '2025-07-07 14:19:03', '2025-07-07 14:19:03'),
(592, 73, 'football_6b6', 0, 'inactive', '2025-07-07 14:19:03', '2025-07-07 14:19:03'),
(593, 73, 'football_7b7', 0, 'inactive', '2025-07-07 14:19:03', '2025-07-07 14:19:03'),
(594, 73, 'football_11b11', 0, 'inactive', '2025-07-07 14:19:03', '2025-07-07 14:19:03'),
(595, 73, 'basketball_full', 0, 'inactive', '2025-07-07 14:19:03', '2025-07-07 14:19:03'),
(596, 73, 'basketball_half', 0, 'inactive', '2025-07-07 14:19:03', '2025-07-07 14:19:03'),
(597, 74, 'indoor', 4, 'active', '2025-07-07 14:19:21', '2025-07-07 14:19:21'),
(598, 74, 'outdoor', 4, 'active', '2025-07-07 14:19:21', '2025-07-07 14:19:21'),
(599, 74, 'single', 4, 'active', '2025-07-07 14:19:21', '2025-07-07 14:19:21'),
(600, 74, 'double', 4, 'active', '2025-07-07 14:19:21', '2025-07-07 14:19:21'),
(601, 74, 'football_5b5', 0, 'inactive', '2025-07-07 14:19:21', '2025-07-07 14:19:21'),
(602, 74, 'football_6b6', 0, 'inactive', '2025-07-07 14:19:21', '2025-07-07 14:19:21'),
(603, 74, 'football_7b7', 0, 'inactive', '2025-07-07 14:19:21', '2025-07-07 14:19:21'),
(604, 74, 'football_11b11', 0, 'inactive', '2025-07-07 14:19:21', '2025-07-07 14:19:21'),
(605, 74, 'basketball_full', 0, 'inactive', '2025-07-07 14:19:21', '2025-07-07 14:19:21'),
(606, 74, 'basketball_half', 0, 'inactive', '2025-07-07 14:19:21', '2025-07-07 14:19:21'),
(607, 75, 'indoor', 4, 'active', '2025-07-07 14:19:43', '2025-07-07 14:19:43'),
(608, 75, 'outdoor', 4, 'active', '2025-07-07 14:19:43', '2025-07-07 14:19:43'),
(609, 75, 'single', 4, 'active', '2025-07-07 14:19:43', '2025-07-07 14:19:43'),
(610, 75, 'double', 4, 'active', '2025-07-07 14:19:43', '2025-07-07 14:19:43'),
(611, 75, 'football_5b5', 0, 'inactive', '2025-07-07 14:19:43', '2025-07-07 14:19:43'),
(612, 75, 'football_6b6', 0, 'inactive', '2025-07-07 14:19:43', '2025-07-07 14:19:43'),
(613, 75, 'football_7b7', 0, 'inactive', '2025-07-07 14:19:43', '2025-07-07 14:19:43'),
(614, 75, 'football_11b11', 0, 'inactive', '2025-07-07 14:19:43', '2025-07-07 14:19:43'),
(615, 75, 'basketball_full', 0, 'inactive', '2025-07-07 14:19:43', '2025-07-07 14:19:43'),
(616, 75, 'basketball_half', 0, 'inactive', '2025-07-07 14:19:43', '2025-07-07 14:19:43'),
(617, 76, 'indoor', 4, 'active', '2025-07-07 14:20:33', '2025-07-07 14:20:33'),
(618, 76, 'outdoor', 4, 'active', '2025-07-07 14:20:33', '2025-07-07 14:20:33'),
(619, 76, 'single', 4, 'active', '2025-07-07 14:20:33', '2025-07-07 14:20:33'),
(620, 76, 'double', 4, 'active', '2025-07-07 14:20:33', '2025-07-07 14:20:33'),
(621, 76, 'football_5b5', 0, 'inactive', '2025-07-07 14:20:33', '2025-07-07 14:20:33'),
(622, 76, 'football_6b6', 0, 'inactive', '2025-07-07 14:20:33', '2025-07-07 14:20:33'),
(623, 76, 'football_7b7', 0, 'inactive', '2025-07-07 14:20:33', '2025-07-07 14:20:33'),
(624, 76, 'football_11b11', 0, 'inactive', '2025-07-07 14:20:33', '2025-07-07 14:20:33'),
(625, 76, 'basketball_full', 0, 'inactive', '2025-07-07 14:20:33', '2025-07-07 14:20:33'),
(626, 76, 'basketball_half', 0, 'inactive', '2025-07-07 14:20:33', '2025-07-07 14:20:33'),
(627, 77, 'indoor', 4, 'active', '2025-07-07 14:22:16', '2025-07-07 14:22:16'),
(628, 77, 'outdoor', 4, 'active', '2025-07-07 14:22:16', '2025-07-07 14:22:16'),
(629, 77, 'single', 4, 'active', '2025-07-07 14:22:16', '2025-07-07 14:22:16'),
(630, 77, 'double', 4, 'active', '2025-07-07 14:22:16', '2025-07-07 14:22:16'),
(631, 77, 'football_5b5', 0, 'inactive', '2025-07-07 14:22:16', '2025-07-07 14:22:16'),
(632, 77, 'football_6b6', 0, 'inactive', '2025-07-07 14:22:16', '2025-07-07 14:22:16'),
(633, 77, 'football_7b7', 0, 'inactive', '2025-07-07 14:22:16', '2025-07-07 14:22:16'),
(634, 77, 'football_11b11', 0, 'inactive', '2025-07-07 14:22:16', '2025-07-07 14:22:16'),
(635, 77, 'basketball_full', 0, 'inactive', '2025-07-07 14:22:16', '2025-07-07 14:22:16'),
(636, 77, 'basketball_half', 0, 'inactive', '2025-07-07 14:22:16', '2025-07-07 14:22:16'),
(707, 85, 'indoor', 1, 'active', '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(708, 85, 'outdoor', 1, 'active', '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(709, 85, 'single', 1, 'active', '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(710, 85, 'double', 1, 'active', '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(711, 85, 'football_5b5', 1, 'active', '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(712, 85, 'football_6b6', 1, 'active', '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(713, 85, 'football_7b7', 1, 'active', '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(714, 85, 'football_11b11', 1, 'active', '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(715, 85, 'basketball_full', 1, 'active', '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(716, 85, 'basketball_half', 1, 'active', '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(717, 86, 'indoor', 4, 'active', '2025-07-07 14:41:24', '2025-07-07 14:41:24'),
(718, 86, 'outdoor', 4, 'active', '2025-07-07 14:41:24', '2025-07-07 14:41:24'),
(719, 86, 'single', 4, 'active', '2025-07-07 14:41:24', '2025-07-07 14:41:24'),
(720, 86, 'double', 4, 'active', '2025-07-07 14:41:24', '2025-07-07 14:41:24'),
(721, 86, 'football_5b5', 0, 'inactive', '2025-07-07 14:41:24', '2025-07-07 14:41:24'),
(722, 86, 'football_6b6', 0, 'inactive', '2025-07-07 14:41:24', '2025-07-07 14:41:24'),
(723, 86, 'football_7b7', 0, 'inactive', '2025-07-07 14:41:24', '2025-07-07 14:41:24'),
(724, 86, 'football_11b11', 0, 'inactive', '2025-07-07 14:41:24', '2025-07-07 14:41:24'),
(725, 86, 'basketball_full', 0, 'inactive', '2025-07-07 14:41:24', '2025-07-07 14:41:24'),
(726, 86, 'basketball_half', 0, 'inactive', '2025-07-07 14:41:24', '2025-07-07 14:41:24'),
(727, 87, 'indoor', 4, 'active', '2025-07-07 15:14:58', '2025-07-07 15:14:58'),
(728, 87, 'outdoor', 4, 'active', '2025-07-07 15:14:58', '2025-07-07 15:14:58'),
(729, 87, 'single', 4, 'active', '2025-07-07 15:14:58', '2025-07-07 15:14:58'),
(730, 87, 'double', 4, 'active', '2025-07-07 15:14:58', '2025-07-07 15:14:58'),
(731, 87, 'football_5b5', 0, 'inactive', '2025-07-07 15:14:58', '2025-07-07 15:14:58'),
(732, 87, 'football_6b6', 0, 'inactive', '2025-07-07 15:14:58', '2025-07-07 15:14:58'),
(733, 87, 'football_7b7', 0, 'inactive', '2025-07-07 15:14:58', '2025-07-07 15:14:58'),
(734, 87, 'football_11b11', 0, 'inactive', '2025-07-07 15:14:58', '2025-07-07 15:14:58'),
(735, 87, 'basketball_full', 4, 'active', '2025-07-07 15:14:58', '2025-07-07 15:14:58'),
(736, 87, 'basketball_half', 4, 'active', '2025-07-07 15:14:58', '2025-07-07 15:14:58'),
(737, 88, 'indoor', 1, 'active', '2025-07-07 15:23:19', '2025-07-07 15:23:19'),
(738, 88, 'outdoor', 1, 'active', '2025-07-07 15:23:19', '2025-07-07 15:23:19'),
(739, 88, 'single', 1, 'active', '2025-07-07 15:23:19', '2025-07-07 15:23:19'),
(740, 88, 'double', 1, 'active', '2025-07-07 15:23:19', '2025-07-07 15:23:19'),
(741, 88, 'football_5b5', 1, 'active', '2025-07-07 15:23:19', '2025-07-07 15:23:19'),
(742, 88, 'football_6b6', 1, 'active', '2025-07-07 15:23:19', '2025-07-07 15:23:19'),
(743, 88, 'football_7b7', 1, 'active', '2025-07-07 15:23:19', '2025-07-07 15:23:19'),
(744, 88, 'football_11b11', 1, 'active', '2025-07-07 15:23:19', '2025-07-07 15:23:19'),
(745, 88, 'basketball_full', 1, 'active', '2025-07-07 15:23:19', '2025-07-07 15:23:19'),
(746, 88, 'basketball_half', 1, 'active', '2025-07-07 15:23:19', '2025-07-07 15:23:19'),
(747, 40, 'indoor', 1, 'active', '2025-07-08 07:54:15', '2025-07-08 07:54:15'),
(748, 40, 'outdoor', 1, 'active', '2025-07-08 07:54:15', '2025-07-08 07:54:15'),
(749, 40, 'single', 1, 'active', '2025-07-08 07:54:15', '2025-07-08 07:54:15'),
(750, 40, 'double', 1, 'active', '2025-07-08 07:54:15', '2025-07-08 07:54:15'),
(751, 40, 'football_5b5', 1, 'active', '2025-07-08 07:54:15', '2025-07-08 07:54:15'),
(752, 40, 'football_6b6', 1, 'active', '2025-07-08 07:54:15', '2025-07-08 07:54:15'),
(753, 40, 'football_7b7', 1, 'active', '2025-07-08 07:54:15', '2025-07-08 07:54:15'),
(754, 40, 'football_11b11', 1, 'active', '2025-07-08 07:54:15', '2025-07-08 07:54:15'),
(755, 40, 'basketball_full', 1, 'active', '2025-07-08 07:54:15', '2025-07-08 07:54:15'),
(756, 40, 'basketball_half', 1, 'active', '2025-07-08 07:54:15', '2025-07-08 07:54:15'),
(757, 89, 'indoor', 3, 'active', '2025-07-08 12:11:29', '2025-07-08 12:11:29'),
(758, 89, 'outdoor', 3, 'active', '2025-07-08 12:11:29', '2025-07-08 12:11:29'),
(759, 89, 'single', 3, 'active', '2025-07-08 12:11:29', '2025-07-08 12:11:29'),
(760, 89, 'double', 3, 'active', '2025-07-08 12:11:29', '2025-07-08 12:11:29'),
(761, 89, 'football_5b5', 0, 'inactive', '2025-07-08 12:11:29', '2025-07-08 12:11:29'),
(762, 89, 'football_6b6', 0, 'inactive', '2025-07-08 12:11:29', '2025-07-08 12:11:29'),
(763, 89, 'football_7b7', 0, 'inactive', '2025-07-08 12:11:29', '2025-07-08 12:11:29'),
(764, 89, 'football_11b11', 0, 'inactive', '2025-07-08 12:11:29', '2025-07-08 12:11:29'),
(765, 89, 'basketball_full', 0, 'inactive', '2025-07-08 12:11:29', '2025-07-08 12:11:29'),
(766, 89, 'basketball_half', 0, 'inactive', '2025-07-08 12:11:29', '2025-07-08 12:11:29'),
(767, 90, 'indoor', 12, 'active', '2025-07-08 12:39:11', '2025-07-08 12:39:11'),
(768, 90, 'outdoor', 12, 'active', '2025-07-08 12:39:11', '2025-07-08 12:39:11'),
(769, 90, 'single', 12, 'active', '2025-07-08 12:39:11', '2025-07-08 12:39:11'),
(770, 90, 'double', 12, 'active', '2025-07-08 12:39:11', '2025-07-08 12:39:11'),
(771, 90, 'football_5b5', 0, 'inactive', '2025-07-08 12:39:11', '2025-07-08 12:39:11'),
(772, 90, 'football_6b6', 0, 'inactive', '2025-07-08 12:39:11', '2025-07-08 12:39:11'),
(773, 90, 'football_7b7', 0, 'inactive', '2025-07-08 12:39:11', '2025-07-08 12:39:11'),
(774, 90, 'football_11b11', 0, 'inactive', '2025-07-08 12:39:11', '2025-07-08 12:39:11'),
(775, 90, 'basketball_full', 1, 'active', '2025-07-08 12:39:11', '2025-07-08 12:39:11'),
(776, 90, 'basketball_half', 1, 'active', '2025-07-08 12:39:11', '2025-07-08 12:39:11');

-- --------------------------------------------------------

--
-- Table structure for table `club_currency`
--

CREATE TABLE `club_currency` (
  `club_id` bigint(20) NOT NULL,
  `currency_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `club_currency`
--

INSERT INTO `club_currency` (`club_id`, `currency_id`) VALUES
(3, 2),
(3, 3),
(3, 5),
(5, 3),
(8, 2),
(8, 3),
(8, 5),
(10, 1),
(10, 2),
(10, 3),
(12, 2),
(12, 3),
(12, 5),
(16, 2),
(16, 3),
(40, 1),
(41, 2),
(41, 3),
(41, 5),
(44, 1),
(44, 2),
(44, 3),
(45, 1),
(45, 2),
(45, 3),
(46, 1),
(46, 2),
(47, 2),
(47, 3),
(47, 5),
(48, 1),
(48, 2),
(48, 3),
(48, 5),
(59, 1),
(59, 4),
(60, 2),
(61, 1),
(63, 2),
(63, 3),
(63, 5),
(64, 2),
(64, 3),
(64, 5),
(65, 2),
(65, 3),
(65, 5),
(67, 1),
(67, 2),
(68, 1),
(68, 2),
(69, 1),
(69, 2),
(70, 1),
(70, 2),
(71, 1),
(71, 2),
(72, 1),
(72, 2),
(73, 1),
(73, 2),
(74, 1),
(74, 2),
(75, 1),
(75, 2),
(76, 1),
(76, 2),
(77, 1),
(77, 2),
(85, 2),
(85, 3),
(85, 5),
(86, 1),
(86, 2),
(87, 1),
(87, 3),
(88, 2),
(88, 3),
(88, 5),
(89, 1),
(89, 3),
(90, 1),
(90, 2),
(91, 2),
(100, 2),
(100, 3),
(100, 5),
(101, 3),
(102, 2),
(116, 5),
(117, 6),
(118, 1),
(118, 3),
(119, 1),
(119, 3),
(123, 1),
(123, 2),
(126, 5);

-- --------------------------------------------------------

--
-- Table structure for table `club_latest_activities`
--

CREATE TABLE `club_latest_activities` (
  `id` bigint(20) NOT NULL,
  `club_id` bigint(20) NOT NULL,
  `activity_type` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `performed_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `club_latest_activities`
--

INSERT INTO `club_latest_activities` (`id`, `club_id`, `activity_type`, `description`, `performed_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'create_club_by_admin', 'Account type: Demo - Universal Club has been registered by Ace Community Team', 1, '2025-06-26 13:44:06', '2025-06-26 13:44:06'),
(2, 5, 'update_club_by_system_admin', 'club_owner:first_name??arsal=>arsal,last_name??bajwa=>bajwa,phone_number??+92335687233=>+92335687233,city??kandahar=>kandahar,::CLUB INFO: \nname??New-Ace=>New-Ace,organisation_name??New-Community=>New-Community,::court_sports_with_configurations::currencies::features::sport_levels::operating_hours::System Admin', 1, '2025-06-27 08:18:43', '2025-07-14 09:24:44'),
(3, 6, 'create_club_by_admin', 'Account type: Demo - Universal Club has been registered by Ace Community Team', 1, '2025-06-27 09:49:04', '2025-06-27 09:49:04'),
(4, 7, 'create_club_by_admin', 'Account type: Demo - Universal Club has been registered by Ace Community Team', 1, '2025-06-27 11:19:51', '2025-06-27 11:19:51'),
(5, 8, 'create_club_by_admin', 'Account type: Live - Hamza Club has been registered by Ace Community Team', 1, '2025-06-27 14:43:17', '2025-06-27 14:43:17'),
(6, 9, 'create_club_by_admin', 'Account type: Live - tftyc0987 has been registered by Ace Community Team', 1, '2025-06-27 15:15:47', '2025-06-27 15:15:47'),
(7, 10, 'create_club_by_admin', 'Account type: Live - Ehtisham Club has been registered by Ace Community Team', 1, '2025-06-27 15:37:32', '2025-06-27 15:37:32'),
(8, 11, 'create_club_by_admin', 'Account type: Live - Test12 has been registered by Ace Community Team', 1, '2025-06-27 15:41:56', '2025-06-27 15:41:56'),
(9, 12, 'create_club_by_admin', 'Account type: Live - Ehtisham Club has been registered by Ace Community Team', 1, '2025-06-27 15:42:57', '2025-06-27 15:42:57'),
(10, 13, 'create_club_by_admin', 'Account type: Live - New Club has been registered by Ace Community Team', 1, '2025-06-27 15:53:05', '2025-06-27 15:53:05'),
(11, 14, 'create_club_by_admin', 'Account type: Live - my full name has been registered by Ace Community Team', 1, '2025-06-28 06:41:48', '2025-06-28 06:41:48'),
(12, 15, 'create_club_by_admin', 'Account type: Live - Spaid has been registered by Ace Community Team', 1, '2025-06-28 12:09:36', '2025-06-28 12:09:36'),
(13, 16, 'create_club_by_admin', 'Account type: Live - Neil Booker has been registered by Ace Community Team', 1, '2025-06-28 12:17:24', '2025-06-28 12:17:24'),
(14, 17, 'create_club_by_admin', 'Account type: Live - Usman Club has been registered by Ace Community Team', 1, '2025-06-30 04:47:15', '2025-06-30 04:47:15'),
(15, 18, 'create_club_by_admin', 'Account type: Live - Universal Club has been registered by Ace Community Team', 1, '2025-06-30 08:35:47', '2025-06-30 08:35:47'),
(16, 19, 'create_club_by_admin', 'Account type: Live - Yasir Club has been registered by Ace Community Team', 1, '2025-06-30 12:00:46', '2025-06-30 12:00:46'),
(17, 20, 'create_club_by_admin', 'Account type: Live - Yasir Club has been registered by Ace Community Team', 1, '2025-06-30 13:01:47', '2025-06-30 13:01:47'),
(18, 21, 'create_club_by_admin', 'Account type: Live - Diamond has been registered by Ace Community Team', 1, '2025-06-30 14:36:46', '2025-06-30 14:36:46'),
(19, 22, 'create_club_by_admin', 'Account type: Live - MyClub has been registered by Ace Community Team', 1, '2025-06-30 15:15:54', '2025-06-30 15:15:54'),
(20, 24, 'create_club_by_admin', 'Account type: Live - Universal Club has been registered by Ace Community Team', 1, '2025-06-30 15:29:08', '2025-06-30 15:29:08'),
(21, 25, 'create_club_by_admin', 'Account type: Live - Universal Club has been registered by Ace Community Team', 1, '2025-06-30 15:39:00', '2025-06-30 15:39:00'),
(22, 26, 'create_club_by_admin', 'Account type: Live - Universal Club has been registered by Ace Community Team', 1, '2025-06-30 15:42:26', '2025-06-30 15:42:26'),
(23, 27, 'create_club_by_admin', 'Account type: Live - Universal Club has been registered by Ace Community Team', 1, '2025-06-30 16:00:39', '2025-06-30 16:00:39'),
(24, 28, 'create_club_by_admin', 'Account type: Live - Usman Club has been registered by Ace Community Team', 1, '2025-06-30 16:02:08', '2025-06-30 16:02:08'),
(25, 29, 'create_club_by_admin', 'Account type: Live - Usman Club has been registered by Ace Community Team', 1, '2025-07-01 08:11:14', '2025-07-01 08:11:14'),
(26, 30, 'create_club_by_admin', 'Account type: Live - Unique Club has been registered by Ace Community Team', 1, '2025-07-01 09:03:38', '2025-07-01 09:03:38'),
(27, 31, 'create_club_by_admin', 'Account type: Live - testing Club has been registered by Ace Community Team', 1, '2025-07-01 10:15:51', '2025-07-01 10:15:51'),
(28, 32, 'create_club_by_admin', 'Account type: Live - Universal Club has been registered by Ace Community Team', 1, '2025-07-01 10:31:36', '2025-07-01 10:31:36'),
(29, 33, 'create_club_by_admin', 'Account type: Live - qwerty has been registered by Ace Community Team', 1, '2025-07-01 10:43:27', '2025-07-01 10:43:27'),
(30, 34, 'create_club_by_admin', 'Account type: Live - wqertyu has been registered by Ace Community Team', 1, '2025-07-01 10:46:51', '2025-07-01 10:46:51'),
(31, 35, 'create_club_by_admin', 'Account type: Live - jgfdsaqw has been registered by Ace Community Team', 1, '2025-07-01 10:50:15', '2025-07-01 10:50:15'),
(32, 36, 'create_club_by_admin', 'Account type: Live - testing Club has been registered by Ace Community Team', 1, '2025-07-01 14:29:19', '2025-07-01 14:29:19'),
(33, 37, 'create_club_by_admin', 'Account type: Live - Berk Poole has been registered by Ace Community Team', 1, '2025-07-02 10:19:57', '2025-07-02 10:19:57'),
(34, 38, 'create_club_by_admin', 'Account type: Live - Christopher Wright has been registered by Ace Community Team', 1, '2025-07-02 11:09:05', '2025-07-02 11:09:05'),
(35, 8, 'create_club_by_admin', 'Account type: Demo - Universal Club has been registered by Ace Community Team', 1, '2025-07-04 08:08:00', '2025-07-04 08:08:00'),
(36, 10, 'create_club_by_admin', 'Account type: Live - qwerty club has been registered by Ace Community Team', 1, '2025-07-04 11:24:12', '2025-07-04 11:24:12'),
(37, 12, 'create_club_by_admin', 'Account type: Demo - Universal Club has been registered by Ace Community Team', 1, '2025-07-04 11:49:50', '2025-07-04 11:49:50'),
(38, 16, 'create_club_by_admin', 'Account type: Live - qwert has been registered by Ace Community Team', 1, '2025-07-04 15:00:22', '2025-07-04 15:00:22'),
(40, 40, 'update_club_by_admin', ' CLUB OWNER: \n1. changed **ahmadali43a2@gmail.com** → areebabashir333@gmail.com\n2. changed **arsal** → arsal\n3. changed **bajwa** → bajwa\n4. changed **+92335687233** → +92335687233\n5. changed **kandahar** → kandahar\nCLUB INFO: \n1. changed **Club8** → New-Ace\n2. changed **New Organization** → New-Community\nSPORTS: \n changed \nAdditional Information: \n changed \nOPERATING HOURS: \n changed \n', 1, '2025-07-06 15:36:22', '2025-07-09 06:50:20'),
(41, 41, 'create_club_by_admin', 'Account type: Demo - Universal Club has been registered by Ace Community Team', 1, '2025-07-07 08:20:38', '2025-07-07 08:20:38'),
(42, 44, 'create_club_by_admin', 'Account type: Live - Unique Club has been registered by Ace Community Team', 1, '2025-07-07 10:30:20', '2025-07-07 10:30:20'),
(43, 45, 'create_club_by_admin', 'Account type: Live - qwert has been registered by Ace Community Team', 1, '2025-07-07 10:44:03', '2025-07-07 10:44:03'),
(44, 46, 'create_club_by_admin', 'Account type: Live - qwert has been registered by Ace Community Team', 1, '2025-07-07 11:04:57', '2025-07-07 11:04:57'),
(45, 47, 'create_club_by_admin', 'Account type: Demo - Universal Club has been registered by Ace Community Team', 1, '2025-07-07 12:11:03', '2025-07-07 12:11:03'),
(46, 48, 'create_club_by_admin', 'Account type: Demo - Universal Club has been registered by Ace Community Team', 1, '2025-07-07 12:53:40', '2025-07-07 12:53:40'),
(50, 85, 'create_club_by_admin', 'Account type: Demo - Universal Club has been registered by Ace Community Team', 1, '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(51, 86, 'create_club_by_admin', 'Account type: Demo - Wynne Dickerson has been registered by Ace Community Team', 1, '2025-07-07 14:41:24', '2025-07-07 14:41:24'),
(52, 87, 'create_club_by_admin', 'Account type: Demo - Byron Castillo has been registered by Ace Community Team', 1, '2025-07-07 15:14:58', '2025-07-07 15:14:58'),
(53, 88, 'create_club_by_admin', 'Account type: Demo - Universal Club has been registered by Ace Community Team', 1, '2025-07-07 15:23:19', '2025-07-07 15:23:19'),
(54, 40, 'update_club_by_admin', ' CLUB OWNER: \n1. changed **ahmadali43a2@gmail.com** → areebabashir333@gmail.com\n2. changed **arsal** → arsal\n3. changed **bajwa** → bajwa\n4. changed **+92335687233** → +92335687233\n5. changed **kandahar** → kandahar\nCLUB INFO: \n1. changed **Club8** → New-Ace\n2. changed **New Organization** → New-Community\nSPORTS: \n changed \nAdditional Information: \n changed \nOPERATING HOURS: \n changed \n', 1, '2025-07-08 07:54:15', '2025-07-09 06:50:20'),
(55, 89, 'create_club_by_admin', 'Account type: Live - Quinn Edwards has been registered by Ace Community Team', 1, '2025-07-08 12:11:29', '2025-07-08 12:11:29'),
(56, 90, 'create_club_by_admin', 'Account type: Live - Ori Pruitt has been registered by Ace Community Team', 1, '2025-07-08 12:39:11', '2025-07-08 12:39:11'),
(57, 40, 'Email Verified & Profile Submitted', 'Club8 verified their email and submitted profile data for approval.', 1, '2025-07-09 10:23:57', '2025-07-09 10:23:57'),
(58, 100, 'create_club_by_admin', 'Account type: Demo - Universal Club has been registered by Ace Community Team', 1, '2025-07-10 12:32:45', '2025-07-10 12:32:45'),
(59, 101, 'update_club_by_system_admin', 'currencies::pre_branches::features::sport_levels::operating_hours::System Admin', 1, '2025-07-10 12:34:12', '2025-07-15 04:53:13'),
(60, 102, 'update_club_by_system_admin', 'currencies::pre_branches::features::sport_levels::operating_hours::System Admin', 1, '2025-07-10 12:39:11', '2025-07-15 07:42:28'),
(61, 103, 'create_club_by_admin', 'Account type: Demo - Universal Club has been registered by Ace Community Team', 1, '2025-07-11 06:17:42', '2025-07-11 06:17:42'),
(62, 104, 'create_club_by_admin', 'Account type: Demo - Universal Club has been registered by Ace Community Team', 1, '2025-07-11 06:24:42', '2025-07-11 06:24:42'),
(63, 105, 'create_club_by_admin', 'Account type: Demo - Universal Club has been registered by Ace Community Team', 1, '2025-07-11 06:29:20', '2025-07-11 06:29:20'),
(64, 107, 'create_club_by_admin', 'Account type: Demo - Universal Club has been registered by Ace Community Team', 1, '2025-07-11 06:36:17', '2025-07-11 06:36:17'),
(65, 108, 'create_club_by_admin', 'Account type: Demo - Universal Club has been registered by Ace Community Team', 1, '2025-07-11 06:47:44', '2025-07-11 06:47:44'),
(66, 109, 'create_club_by_admin', 'Account type: Demo - Universal Club has been registered by Ace Community Team', 1, '2025-07-11 06:55:38', '2025-07-11 06:55:38'),
(67, 110, 'create_club_by_admin', 'Account type: Demo - Universal Club has been registered by Ace Community Team', 1, '2025-07-11 06:57:01', '2025-07-11 06:57:01'),
(68, 111, 'create_club_by_admin', 'Account type: Demo - Universal Club has been registered by Ace Community Team', 1, '2025-07-11 06:57:30', '2025-07-11 06:57:30'),
(69, 112, 'create_club_by_admin', 'Account type: Demo - Universal Club has been registered by Ace Community Team', 1, '2025-07-11 06:59:33', '2025-07-11 06:59:33'),
(70, 113, 'create_club_by_admin', 'Account type: Demo - Universal Club has been registered by Ace Community Team', 1, '2025-07-11 07:00:31', '2025-07-11 07:00:31'),
(71, 116, 'update_club_by_system_admin', 'currencies::pre_branches::features::sport_levels::operating_hours::System Admin', 1, '2025-07-11 11:49:04', '2025-07-15 06:33:52'),
(72, 117, 'update_club_by_system_admin', 'currencies::pre_branches::features::sport_levels::operating_hours::System Admin', 1, '2025-07-14 12:00:34', '2025-07-15 05:06:36'),
(73, 118, 'create_club_by_admin', 'Account type: Live - Ursa Johns has been registered by Ace Community Team', 1, '2025-07-14 13:21:27', '2025-07-14 13:21:27'),
(74, 119, 'create_club_by_admin', 'Account type: Live - Amber Stephenson has been registered by Ace Community Team', 1, '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(75, 123, 'create_club_by_admin', 'Account type: Live - Jerry Mcdowell has been registered by Ace Community Team', 1, '2025-07-15 05:32:29', '2025-07-15 05:32:29'),
(76, 126, 'update_club_by_system_admin', 'currencies::pre_branches::features::sport_levels::operating_hours::System Admin', 1, '2025-07-15 06:49:16', '2025-07-15 07:41:27'),
(77, 91, 'Email Verified & Profile Submitted', 'Justin Mckay verified their email and submitted profile data for approval.', 1, '2025-07-17 05:01:50', '2025-07-17 05:01:50'),
(78, 91, 'Email Verified & Profile Submitted', 'Tahir Club verified their email and submitted profile data for approval.', 1, '2025-07-17 05:20:24', '2025-07-17 05:20:24'),
(79, 91, 'Email Verified & Profile Submitted', 'Barclay Hood verified their email and submitted profile data for approval.', 1, '2025-07-17 05:40:48', '2025-07-17 05:40:48'),
(80, 91, 'Email Verified & Profile Submitted', 'Theodore Kane verified their email and submitted profile data for approval.', 1, '2025-07-17 06:12:25', '2025-07-17 06:12:25'),
(81, 91, 'Email Verified & Profile Submitted', 'Emery Knapp verified their email and submitted profile data for approval.', 1, '2025-07-17 06:19:00', '2025-07-17 06:19:00'),
(82, 91, 'Email Verified & Profile Submitted', 'Troy Ballard verified their email and submitted profile data for approval.', 1, '2025-07-17 06:35:08', '2025-07-17 06:35:08');

-- --------------------------------------------------------

--
-- Table structure for table `club_level_systems`
--

CREATE TABLE `club_level_systems` (
  `id` bigint(20) NOT NULL,
  `club_id` bigint(20) NOT NULL,
  `sport_id` bigint(20) NOT NULL,
  `level_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `club_level_systems`
--

INSERT INTO `club_level_systems` (`id`, `club_id`, `sport_id`, `level_id`, `created_at`, `updated_at`) VALUES
(9, 4, 2, 5, NULL, NULL),
(10, 4, 5, 4, NULL, NULL),
(13, 6, 1, 3, NULL, NULL),
(14, 6, 4, 5, NULL, NULL),
(21, 6, 1, 10, '2025-06-27 09:49:04', '2025-06-27 09:49:04'),
(22, 6, 3, 10, '2025-06-27 09:49:04', '2025-06-27 09:49:04'),
(23, 7, 1, 10, '2025-06-27 11:19:51', '2025-06-27 11:19:51'),
(24, 7, 3, 10, '2025-06-27 11:19:51', '2025-06-27 11:19:51'),
(25, 8, 1, 10, '2025-06-27 14:43:17', '2025-06-27 14:43:17'),
(26, 8, 2, 10, '2025-06-27 14:43:17', '2025-06-27 14:43:17'),
(27, 8, 5, 10, '2025-06-27 14:43:17', '2025-06-27 14:43:17'),
(28, 9, 2, 10, '2025-06-27 15:15:47', '2025-06-27 15:15:47'),
(29, 9, 3, 10, '2025-06-27 15:15:47', '2025-06-27 15:15:47'),
(30, 9, 5, 10, '2025-06-27 15:15:47', '2025-06-27 15:15:47'),
(31, 10, 1, 10, '2025-06-27 15:37:32', '2025-06-27 15:37:32'),
(32, 10, 4, 10, '2025-06-27 15:37:32', '2025-06-27 15:37:32'),
(33, 11, 2, 10, '2025-06-27 15:41:56', '2025-06-27 15:41:56'),
(34, 12, 1, 10, '2025-06-27 15:42:57', '2025-06-27 15:42:57'),
(35, 12, 4, 10, '2025-06-27 15:42:57', '2025-06-27 15:42:57'),
(36, 13, 2, 10, '2025-06-27 15:53:05', '2025-06-27 15:53:05'),
(37, 13, 3, 10, '2025-06-27 15:53:05', '2025-06-27 15:53:05'),
(38, 13, 5, 10, '2025-06-27 15:53:05', '2025-06-27 15:53:05'),
(39, 14, 1, 10, '2025-06-28 06:41:48', '2025-06-28 06:41:48'),
(40, 14, 2, 10, '2025-06-28 06:41:48', '2025-06-28 06:41:48'),
(41, 14, 3, 10, '2025-06-28 06:41:48', '2025-06-28 06:41:48'),
(42, 14, 4, 10, '2025-06-28 06:41:48', '2025-06-28 06:41:48'),
(43, 15, 5, 10, '2025-06-28 12:09:36', '2025-06-28 12:09:36'),
(44, 16, 5, 10, '2025-06-28 12:17:24', '2025-06-28 12:17:24'),
(45, 17, 1, 10, '2025-06-30 04:47:15', '2025-06-30 04:47:15'),
(46, 17, 2, 10, '2025-06-30 04:47:15', '2025-06-30 04:47:15'),
(47, 17, 3, 10, '2025-06-30 04:47:15', '2025-06-30 04:47:15'),
(48, 17, 4, 10, '2025-06-30 04:47:15', '2025-06-30 04:47:15'),
(49, 18, 1, 10, '2025-06-30 08:35:47', '2025-06-30 08:35:47'),
(50, 18, 3, 10, '2025-06-30 08:35:47', '2025-06-30 08:35:47'),
(51, 19, 1, 10, '2025-06-30 12:00:46', '2025-06-30 12:00:46'),
(52, 19, 3, 10, '2025-06-30 12:00:46', '2025-06-30 12:00:46'),
(53, 19, 4, 10, '2025-06-30 12:00:46', '2025-06-30 12:00:46'),
(54, 20, 1, 10, '2025-06-30 13:01:47', '2025-06-30 13:01:47'),
(55, 20, 2, 10, '2025-06-30 13:01:47', '2025-06-30 13:01:47'),
(56, 20, 3, 10, '2025-06-30 13:01:47', '2025-06-30 13:01:47'),
(57, 21, 2, 10, '2025-06-30 14:36:46', '2025-06-30 14:36:46'),
(58, 21, 3, 10, '2025-06-30 14:36:46', '2025-06-30 14:36:46'),
(59, 22, 1, 10, '2025-06-30 15:15:54', '2025-06-30 15:15:54'),
(60, 22, 2, 10, '2025-06-30 15:15:54', '2025-06-30 15:15:54'),
(61, 22, 3, 10, '2025-06-30 15:15:54', '2025-06-30 15:15:54'),
(64, 24, 1, 10, '2025-06-30 15:29:08', '2025-06-30 15:29:08'),
(65, 24, 3, 10, '2025-06-30 15:29:08', '2025-06-30 15:29:08'),
(66, 25, 1, 10, '2025-06-30 15:39:00', '2025-06-30 15:39:00'),
(67, 25, 3, 10, '2025-06-30 15:39:00', '2025-06-30 15:39:00'),
(68, 26, 1, 10, '2025-06-30 15:42:26', '2025-06-30 15:42:26'),
(69, 26, 3, 10, '2025-06-30 15:42:26', '2025-06-30 15:42:26'),
(70, 27, 1, 10, '2025-06-30 16:00:39', '2025-06-30 16:00:39'),
(71, 27, 3, 10, '2025-06-30 16:00:39', '2025-06-30 16:00:39'),
(72, 28, 1, 10, '2025-06-30 16:02:08', '2025-06-30 16:02:08'),
(73, 29, 1, 10, '2025-07-01 08:11:14', '2025-07-01 08:11:14'),
(74, 29, 3, 10, '2025-07-01 08:11:14', '2025-07-01 08:11:14'),
(75, 29, 4, 10, '2025-07-01 08:11:14', '2025-07-01 08:11:14'),
(76, 30, 1, 10, '2025-07-01 09:03:38', '2025-07-01 09:03:38'),
(77, 30, 3, 10, '2025-07-01 09:03:38', '2025-07-01 09:03:38'),
(78, 31, 3, 10, '2025-07-01 10:15:51', '2025-07-01 10:15:51'),
(79, 32, 1, 10, '2025-07-01 10:31:36', '2025-07-01 10:31:36'),
(80, 32, 3, 10, '2025-07-01 10:31:36', '2025-07-01 10:31:36'),
(81, 33, 3, 10, '2025-07-01 10:43:27', '2025-07-01 10:43:27'),
(82, 34, 1, 10, '2025-07-01 10:46:51', '2025-07-01 10:46:51'),
(83, 35, 3, 10, '2025-07-01 10:50:15', '2025-07-01 10:50:15'),
(84, 36, 1, 10, '2025-07-01 14:29:19', '2025-07-01 14:29:19'),
(85, 37, 1, 10, '2025-07-02 10:19:57', '2025-07-02 10:19:57'),
(86, 37, 2, 10, '2025-07-02 10:19:57', '2025-07-02 10:19:57'),
(87, 37, 3, 10, '2025-07-02 10:19:57', '2025-07-02 10:19:57'),
(88, 37, 4, 10, '2025-07-02 10:19:57', '2025-07-02 10:19:57'),
(89, 37, 5, 10, '2025-07-02 10:19:57', '2025-07-02 10:19:57'),
(90, 37, 44, 10, '2025-07-02 10:19:57', '2025-07-02 10:19:57'),
(91, 38, 1, 10, '2025-07-02 11:09:05', '2025-07-02 11:09:05'),
(92, 38, 2, 10, '2025-07-02 11:09:05', '2025-07-02 11:09:05'),
(93, 38, 3, 10, '2025-07-02 11:09:05', '2025-07-02 11:09:05'),
(94, 38, 4, 10, '2025-07-02 11:09:05', '2025-07-02 11:09:05'),
(95, 38, 5, 10, '2025-07-02 11:09:05', '2025-07-02 11:09:05'),
(96, 38, 44, 10, '2025-07-02 11:09:05', '2025-07-02 11:09:05'),
(105, 40, 1, 10, NULL, NULL),
(142, 5, 1, 10, '2025-07-14 09:24:44', '2025-07-14 09:24:44'),
(143, 5, 3, 10, '2025-07-14 09:24:44', '2025-07-14 09:24:44'),
(156, 101, 1, 10, '2025-07-15 04:53:13', '2025-07-15 04:53:13'),
(157, 101, 2, 10, '2025-07-15 04:53:13', '2025-07-15 04:53:13'),
(158, 101, 3, 10, '2025-07-15 04:53:13', '2025-07-15 04:53:13'),
(166, 117, 1, 10, '2025-07-15 05:06:36', '2025-07-15 05:06:36'),
(167, 117, 2, 10, '2025-07-15 05:06:36', '2025-07-15 05:06:36'),
(171, 116, 1, 10, '2025-07-15 06:33:52', '2025-07-15 06:33:52'),
(172, 116, 2, 10, '2025-07-15 06:33:52', '2025-07-15 06:33:52'),
(176, 126, 1, 10, '2025-07-15 07:41:27', '2025-07-15 07:41:27'),
(177, 126, 2, 10, '2025-07-15 07:41:27', '2025-07-15 07:41:27'),
(178, 126, 3, 10, '2025-07-15 07:41:27', '2025-07-15 07:41:27'),
(179, 102, 1, 10, '2025-07-15 07:42:28', '2025-07-15 07:42:28'),
(180, 102, 2, 10, '2025-07-15 07:42:28', '2025-07-15 07:42:28'),
(181, 102, 3, 10, '2025-07-15 07:42:28', '2025-07-15 07:42:28');

-- --------------------------------------------------------

--
-- Table structure for table `club_opening_hours`
--

CREATE TABLE `club_opening_hours` (
  `id` bigint(20) NOT NULL,
  `club_id` bigint(20) NOT NULL,
  `day` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `opening_time` time DEFAULT NULL,
  `closing_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `club_opening_hours`
--

INSERT INTO `club_opening_hours` (`id`, `club_id`, `day`, `is_closed`, `opening_time`, `closing_time`, `created_at`, `updated_at`) VALUES
(22, 4, 'Monday', 0, '11:00:00', '05:00:00', NULL, NULL),
(23, 4, 'Tuesday', 1, '08:00:00', '18:00:00', NULL, NULL),
(24, 4, 'Wednesday', 1, '08:00:00', '18:00:00', NULL, NULL),
(25, 4, 'Thursday', 1, '08:00:00', '18:00:00', NULL, NULL),
(26, 4, 'Friday', 1, '08:00:00', '22:00:00', NULL, NULL),
(27, 4, 'Saturday', 1, '10:00:00', '22:00:00', NULL, NULL),
(28, 4, 'Sunday', 1, '10:00:00', '16:00:00', NULL, NULL),
(36, 6, 'Monday', 0, '08:00:00', '18:00:00', NULL, NULL),
(37, 6, 'Tuesday', 0, '08:00:00', '18:00:00', NULL, NULL),
(38, 6, 'Wednesday', 0, '08:00:00', '18:00:00', NULL, NULL),
(39, 6, 'Thursday', 0, '08:00:00', '18:00:00', NULL, NULL),
(40, 6, 'Friday', 0, '08:00:00', '22:00:00', NULL, NULL),
(41, 6, 'Saturday', 0, '10:00:00', '22:00:00', NULL, NULL),
(42, 6, 'Sunday', 0, '10:00:00', '16:00:00', NULL, NULL),
(43, 1, 'Monday', 0, '11:00:00', '05:00:00', NULL, NULL),
(44, 1, 'Tuesday', 0, '08:00:00', '18:00:00', NULL, NULL),
(45, 1, 'Wednesday', 0, '08:00:00', '18:00:00', NULL, NULL),
(46, 1, 'Thursday', 1, '08:00:00', '18:00:00', NULL, NULL),
(47, 1, 'Friday', 1, '08:00:00', '22:00:00', NULL, NULL),
(48, 1, 'Saturday', 1, '10:00:00', '22:00:00', NULL, NULL),
(49, 1, 'Sunday', 1, '10:00:00', '16:00:00', NULL, NULL),
(71, 6, 'Monday', 0, '11:00:00', '05:00:00', '2025-06-27 09:49:04', '2025-06-27 09:49:04'),
(72, 6, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-06-27 09:49:04', '2025-06-27 09:49:04'),
(73, 6, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-06-27 09:49:04', '2025-06-27 09:49:04'),
(74, 6, 'Thursday', 1, '08:00:00', '18:00:00', '2025-06-27 09:49:04', '2025-06-27 09:49:04'),
(75, 6, 'Friday', 1, '08:00:00', '22:00:00', '2025-06-27 09:49:04', '2025-06-27 09:49:04'),
(76, 6, 'Saturday', 1, '10:00:00', '22:00:00', '2025-06-27 09:49:04', '2025-06-27 09:49:04'),
(77, 6, 'Sunday', 1, '10:00:00', '16:00:00', '2025-06-27 09:49:04', '2025-06-27 09:49:04'),
(78, 7, 'Monday', 0, '11:00:00', '05:00:00', '2025-06-27 11:19:51', '2025-06-27 11:19:51'),
(79, 7, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-06-27 11:19:51', '2025-06-27 11:19:51'),
(80, 7, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-06-27 11:19:51', '2025-06-27 11:19:51'),
(81, 7, 'Thursday', 1, '08:00:00', '18:00:00', '2025-06-27 11:19:51', '2025-06-27 11:19:51'),
(82, 7, 'Friday', 1, '08:00:00', '22:00:00', '2025-06-27 11:19:51', '2025-06-27 11:19:51'),
(83, 7, 'Saturday', 1, '10:00:00', '22:00:00', '2025-06-27 11:19:51', '2025-06-27 11:19:51'),
(84, 7, 'Sunday', 1, '10:00:00', '16:00:00', '2025-06-27 11:19:51', '2025-06-27 11:19:51'),
(85, 8, 'Monday', 0, '09:00:00', '16:00:00', '2025-06-27 14:43:17', '2025-06-27 14:43:17'),
(86, 8, 'Tuesday', 0, '09:00:00', '16:00:00', '2025-06-27 14:43:17', '2025-06-27 14:43:17'),
(87, 8, 'Wednesday', 0, '09:00:00', '16:00:00', '2025-06-27 14:43:17', '2025-06-27 14:43:17'),
(88, 8, 'Thursday', 0, '09:00:00', '16:00:00', '2025-06-27 14:43:17', '2025-06-27 14:43:17'),
(89, 8, 'Friday', 0, '09:00:00', '16:00:00', '2025-06-27 14:43:17', '2025-06-27 14:43:17'),
(90, 8, 'Saturday', 1, NULL, NULL, '2025-06-27 14:43:17', '2025-06-27 14:43:17'),
(91, 8, 'Sunday', 1, NULL, NULL, '2025-06-27 14:43:17', '2025-06-27 14:43:17'),
(92, 9, 'Monday', 0, '09:00:00', '18:00:00', '2025-06-27 15:15:47', '2025-06-27 15:15:47'),
(93, 9, 'Tuesday', 1, NULL, NULL, '2025-06-27 15:15:47', '2025-06-27 15:15:47'),
(94, 9, 'Wednesday', 0, '03:30:00', '18:00:00', '2025-06-27 15:15:47', '2025-06-27 15:15:47'),
(95, 9, 'Thursday', 1, NULL, NULL, '2025-06-27 15:15:47', '2025-06-27 15:15:47'),
(96, 9, 'Friday', 0, '03:30:00', '18:00:00', '2025-06-27 15:15:47', '2025-06-27 15:15:47'),
(97, 9, 'Saturday', 1, NULL, NULL, '2025-06-27 15:15:47', '2025-06-27 15:15:47'),
(98, 9, 'Sunday', 1, NULL, NULL, '2025-06-27 15:15:47', '2025-06-27 15:15:47'),
(99, 10, 'Monday', 0, '02:00:00', '03:30:00', '2025-06-27 15:37:32', '2025-06-27 15:37:32'),
(100, 10, 'Tuesday', 0, '02:00:00', '03:30:00', '2025-06-27 15:37:32', '2025-06-27 15:37:32'),
(101, 10, 'Wednesday', 0, '02:00:00', '03:30:00', '2025-06-27 15:37:32', '2025-06-27 15:37:32'),
(102, 10, 'Thursday', 0, '02:00:00', '03:30:00', '2025-06-27 15:37:32', '2025-06-27 15:37:32'),
(103, 10, 'Friday', 0, '02:00:00', '03:30:00', '2025-06-27 15:37:32', '2025-06-27 15:37:32'),
(104, 10, 'Saturday', 1, NULL, NULL, '2025-06-27 15:37:32', '2025-06-27 15:37:32'),
(105, 10, 'Sunday', 1, NULL, NULL, '2025-06-27 15:37:32', '2025-06-27 15:37:32'),
(106, 11, 'Monday', 0, '09:00:00', '05:00:00', '2025-06-27 15:41:56', '2025-06-27 15:41:56'),
(107, 11, 'Tuesday', 0, '09:00:00', '05:00:00', '2025-06-27 15:41:56', '2025-06-27 15:41:56'),
(108, 11, 'Wednesday', 1, NULL, NULL, '2025-06-27 15:41:56', '2025-06-27 15:41:56'),
(109, 11, 'Thursday', 1, NULL, NULL, '2025-06-27 15:41:56', '2025-06-27 15:41:56'),
(110, 11, 'Friday', 1, NULL, NULL, '2025-06-27 15:41:56', '2025-06-27 15:41:56'),
(111, 11, 'Saturday', 1, NULL, NULL, '2025-06-27 15:41:56', '2025-06-27 15:41:56'),
(112, 11, 'Sunday', 1, NULL, NULL, '2025-06-27 15:41:56', '2025-06-27 15:41:56'),
(113, 12, 'Monday', 0, '02:00:00', '03:30:00', '2025-06-27 15:42:57', '2025-06-27 15:42:57'),
(114, 12, 'Tuesday', 0, '02:00:00', '03:30:00', '2025-06-27 15:42:57', '2025-06-27 15:42:57'),
(115, 12, 'Wednesday', 0, '02:00:00', '03:30:00', '2025-06-27 15:42:57', '2025-06-27 15:42:57'),
(116, 12, 'Thursday', 0, '02:00:00', '03:30:00', '2025-06-27 15:42:57', '2025-06-27 15:42:57'),
(117, 12, 'Friday', 0, '02:00:00', '03:30:00', '2025-06-27 15:42:57', '2025-06-27 15:42:57'),
(118, 12, 'Saturday', 1, NULL, NULL, '2025-06-27 15:42:57', '2025-06-27 15:42:57'),
(119, 12, 'Sunday', 1, NULL, NULL, '2025-06-27 15:42:57', '2025-06-27 15:42:57'),
(120, 13, 'Monday', 0, '09:00:00', '17:00:00', '2025-06-27 15:53:05', '2025-06-27 15:53:05'),
(121, 13, 'Tuesday', 1, NULL, NULL, '2025-06-27 15:53:05', '2025-06-27 15:53:05'),
(122, 13, 'Wednesday', 0, '09:00:00', '17:00:00', '2025-06-27 15:53:05', '2025-06-27 15:53:05'),
(123, 13, 'Thursday', 1, NULL, NULL, '2025-06-27 15:53:05', '2025-06-27 15:53:05'),
(124, 13, 'Friday', 0, '09:00:00', '17:00:00', '2025-06-27 15:53:05', '2025-06-27 15:53:05'),
(125, 13, 'Saturday', 1, NULL, NULL, '2025-06-27 15:53:05', '2025-06-27 15:53:05'),
(126, 13, 'Sunday', 1, NULL, NULL, '2025-06-27 15:53:05', '2025-06-27 15:53:05'),
(127, 14, 'Monday', 1, NULL, NULL, '2025-06-28 06:41:48', '2025-06-28 06:41:48'),
(128, 14, 'Tuesday', 1, NULL, NULL, '2025-06-28 06:41:48', '2025-06-28 06:41:48'),
(129, 14, 'Wednesday', 1, NULL, NULL, '2025-06-28 06:41:48', '2025-06-28 06:41:48'),
(130, 14, 'Thursday', 1, NULL, NULL, '2025-06-28 06:41:48', '2025-06-28 06:41:48'),
(131, 14, 'Friday', 1, NULL, NULL, '2025-06-28 06:41:48', '2025-06-28 06:41:48'),
(132, 14, 'Saturday', 1, NULL, NULL, '2025-06-28 06:41:48', '2025-06-28 06:41:48'),
(133, 14, 'Sunday', 1, NULL, NULL, '2025-06-28 06:41:48', '2025-06-28 06:41:48'),
(134, 15, 'Monday', 0, '08:00:00', '22:00:00', '2025-06-28 12:09:36', '2025-06-28 12:09:36'),
(135, 15, 'Tuesday', 1, NULL, NULL, '2025-06-28 12:09:36', '2025-06-28 12:09:36'),
(136, 15, 'Wednesday', 1, NULL, NULL, '2025-06-28 12:09:36', '2025-06-28 12:09:36'),
(137, 15, 'Thursday', 0, '08:00:00', '22:00:00', '2025-06-28 12:09:36', '2025-06-28 12:09:36'),
(138, 15, 'Friday', 1, NULL, NULL, '2025-06-28 12:09:36', '2025-06-28 12:09:36'),
(139, 15, 'Saturday', 1, NULL, NULL, '2025-06-28 12:09:36', '2025-06-28 12:09:36'),
(140, 15, 'Sunday', 0, '08:00:00', '16:00:00', '2025-06-28 12:09:36', '2025-06-28 12:09:36'),
(141, 16, 'Monday', 0, '04:00:00', '23:00:00', '2025-06-28 12:17:24', '2025-06-28 12:17:24'),
(142, 16, 'Tuesday', 0, '00:30:00', '06:00:00', '2025-06-28 12:17:24', '2025-06-28 12:17:24'),
(143, 16, 'Wednesday', 1, NULL, NULL, '2025-06-28 12:17:24', '2025-06-28 12:17:24'),
(144, 16, 'Thursday', 1, NULL, NULL, '2025-06-28 12:17:24', '2025-06-28 12:17:24'),
(145, 16, 'Friday', 0, '07:00:00', '16:30:00', '2025-06-28 12:17:24', '2025-06-28 12:17:24'),
(146, 16, 'Saturday', 0, '04:30:00', '04:30:00', '2025-06-28 12:17:24', '2025-06-28 12:17:24'),
(147, 16, 'Sunday', 1, NULL, NULL, '2025-06-28 12:17:24', '2025-06-28 12:17:24'),
(148, 17, 'Monday', 0, '11:00:00', '20:00:00', '2025-06-30 04:47:15', '2025-06-30 04:47:15'),
(149, 17, 'Tuesday', 0, '11:00:00', '20:00:00', '2025-06-30 04:47:15', '2025-06-30 04:47:15'),
(150, 17, 'Wednesday', 0, '11:00:00', '20:00:00', '2025-06-30 04:47:15', '2025-06-30 04:47:15'),
(151, 17, 'Thursday', 0, '11:00:00', '20:00:00', '2025-06-30 04:47:15', '2025-06-30 04:47:15'),
(152, 17, 'Friday', 0, '11:00:00', '20:00:00', '2025-06-30 04:47:15', '2025-06-30 04:47:15'),
(153, 17, 'Saturday', 1, NULL, NULL, '2025-06-30 04:47:15', '2025-06-30 04:47:15'),
(154, 17, 'Sunday', 1, NULL, NULL, '2025-06-30 04:47:15', '2025-06-30 04:47:15'),
(155, 18, 'Monday', 0, '11:00:00', '05:00:00', '2025-06-30 08:35:47', '2025-06-30 08:35:47'),
(156, 18, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-06-30 08:35:47', '2025-06-30 08:35:47'),
(157, 18, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-06-30 08:35:47', '2025-06-30 08:35:47'),
(158, 18, 'Thursday', 1, '08:00:00', '18:00:00', '2025-06-30 08:35:47', '2025-06-30 08:35:47'),
(159, 18, 'Friday', 1, '08:00:00', '22:00:00', '2025-06-30 08:35:47', '2025-06-30 08:35:47'),
(160, 18, 'Saturday', 1, '10:00:00', '22:00:00', '2025-06-30 08:35:47', '2025-06-30 08:35:47'),
(161, 18, 'Sunday', 1, '10:00:00', '16:00:00', '2025-06-30 08:35:47', '2025-06-30 08:35:47'),
(162, 19, 'Monday', 0, '09:00:00', '20:00:00', '2025-06-30 12:00:46', '2025-06-30 12:00:46'),
(163, 19, 'Tuesday', 0, '09:00:00', '20:00:00', '2025-06-30 12:00:46', '2025-06-30 12:00:46'),
(164, 19, 'Wednesday', 0, '09:00:00', '20:00:00', '2025-06-30 12:00:46', '2025-06-30 12:00:46'),
(165, 19, 'Thursday', 0, '09:00:00', '20:00:00', '2025-06-30 12:00:46', '2025-06-30 12:00:46'),
(166, 19, 'Friday', 0, '15:00:00', '22:00:00', '2025-06-30 12:00:46', '2025-06-30 12:00:46'),
(167, 19, 'Saturday', 1, NULL, NULL, '2025-06-30 12:00:46', '2025-06-30 12:00:46'),
(168, 19, 'Sunday', 1, NULL, NULL, '2025-06-30 12:00:46', '2025-06-30 12:00:46'),
(169, 20, 'Monday', 0, '09:00:00', '20:00:00', '2025-06-30 13:01:47', '2025-06-30 13:01:47'),
(170, 20, 'Tuesday', 0, '09:00:00', '20:00:00', '2025-06-30 13:01:47', '2025-06-30 13:01:47'),
(171, 20, 'Wednesday', 0, '09:00:00', '20:00:00', '2025-06-30 13:01:47', '2025-06-30 13:01:47'),
(172, 20, 'Thursday', 0, '09:00:00', '20:00:00', '2025-06-30 13:01:47', '2025-06-30 13:01:47'),
(173, 20, 'Friday', 0, '09:00:00', '20:00:00', '2025-06-30 13:01:47', '2025-06-30 13:01:47'),
(174, 20, 'Saturday', 1, NULL, NULL, '2025-06-30 13:01:47', '2025-06-30 13:01:47'),
(175, 20, 'Sunday', 1, NULL, NULL, '2025-06-30 13:01:47', '2025-06-30 13:01:47'),
(176, 21, 'Monday', 1, NULL, NULL, '2025-06-30 14:36:46', '2025-06-30 14:36:46'),
(177, 21, 'Tuesday', 1, NULL, NULL, '2025-06-30 14:36:46', '2025-06-30 14:36:46'),
(178, 21, 'Wednesday', 1, NULL, NULL, '2025-06-30 14:36:46', '2025-06-30 14:36:46'),
(179, 21, 'Thursday', 0, '13:30:00', '21:00:00', '2025-06-30 14:36:46', '2025-06-30 14:36:46'),
(180, 21, 'Friday', 1, NULL, NULL, '2025-06-30 14:36:46', '2025-06-30 14:36:46'),
(181, 21, 'Saturday', 0, '16:00:00', '23:00:00', '2025-06-30 14:36:46', '2025-06-30 14:36:46'),
(182, 21, 'Sunday', 1, NULL, NULL, '2025-06-30 14:36:46', '2025-06-30 14:36:46'),
(183, 22, 'Monday', 0, '01:00:00', '01:00:00', '2025-06-30 15:15:54', '2025-06-30 15:15:54'),
(184, 22, 'Tuesday', 0, '01:00:00', '00:30:00', '2025-06-30 15:15:54', '2025-06-30 15:15:54'),
(185, 22, 'Wednesday', 0, '01:00:00', '01:00:00', '2025-06-30 15:15:54', '2025-06-30 15:15:54'),
(186, 22, 'Thursday', 1, NULL, NULL, '2025-06-30 15:15:54', '2025-06-30 15:15:54'),
(187, 22, 'Friday', 1, NULL, NULL, '2025-06-30 15:15:54', '2025-06-30 15:15:54'),
(188, 22, 'Saturday', 1, NULL, NULL, '2025-06-30 15:15:54', '2025-06-30 15:15:54'),
(189, 22, 'Sunday', 1, NULL, NULL, '2025-06-30 15:15:54', '2025-06-30 15:15:54'),
(197, 24, 'Monday', 0, '11:00:00', '05:00:00', '2025-06-30 15:29:08', '2025-06-30 15:29:08'),
(198, 24, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-06-30 15:29:08', '2025-06-30 15:29:08'),
(199, 24, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-06-30 15:29:08', '2025-06-30 15:29:08'),
(200, 24, 'Thursday', 1, '08:00:00', '18:00:00', '2025-06-30 15:29:08', '2025-06-30 15:29:08'),
(201, 24, 'Friday', 1, '08:00:00', '22:00:00', '2025-06-30 15:29:08', '2025-06-30 15:29:08'),
(202, 24, 'Saturday', 1, '10:00:00', '22:00:00', '2025-06-30 15:29:08', '2025-06-30 15:29:08'),
(203, 24, 'Sunday', 1, '10:00:00', '16:00:00', '2025-06-30 15:29:08', '2025-06-30 15:29:08'),
(204, 25, 'Monday', 0, '11:00:00', '05:00:00', '2025-06-30 15:39:00', '2025-06-30 15:39:00'),
(205, 25, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-06-30 15:39:00', '2025-06-30 15:39:00'),
(206, 25, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-06-30 15:39:00', '2025-06-30 15:39:00'),
(207, 25, 'Thursday', 1, '08:00:00', '18:00:00', '2025-06-30 15:39:00', '2025-06-30 15:39:00'),
(208, 25, 'Friday', 1, '08:00:00', '22:00:00', '2025-06-30 15:39:00', '2025-06-30 15:39:00'),
(209, 25, 'Saturday', 1, '10:00:00', '22:00:00', '2025-06-30 15:39:00', '2025-06-30 15:39:00'),
(210, 25, 'Sunday', 1, '10:00:00', '16:00:00', '2025-06-30 15:39:00', '2025-06-30 15:39:00'),
(211, 26, 'Monday', 0, '11:00:00', '05:00:00', '2025-06-30 15:42:26', '2025-06-30 15:42:26'),
(212, 26, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-06-30 15:42:26', '2025-06-30 15:42:26'),
(213, 26, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-06-30 15:42:26', '2025-06-30 15:42:26'),
(214, 26, 'Thursday', 1, '08:00:00', '18:00:00', '2025-06-30 15:42:26', '2025-06-30 15:42:26'),
(215, 26, 'Friday', 1, '08:00:00', '22:00:00', '2025-06-30 15:42:26', '2025-06-30 15:42:26'),
(216, 26, 'Saturday', 1, '10:00:00', '22:00:00', '2025-06-30 15:42:26', '2025-06-30 15:42:26'),
(217, 26, 'Sunday', 1, '10:00:00', '16:00:00', '2025-06-30 15:42:26', '2025-06-30 15:42:26'),
(218, 27, 'Monday', 0, '11:00:00', '05:00:00', '2025-06-30 16:00:39', '2025-06-30 16:00:39'),
(219, 27, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-06-30 16:00:39', '2025-06-30 16:00:39'),
(220, 27, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-06-30 16:00:39', '2025-06-30 16:00:39'),
(221, 27, 'Thursday', 1, '08:00:00', '18:00:00', '2025-06-30 16:00:39', '2025-06-30 16:00:39'),
(222, 27, 'Friday', 1, '08:00:00', '22:00:00', '2025-06-30 16:00:39', '2025-06-30 16:00:39'),
(223, 27, 'Saturday', 1, '10:00:00', '22:00:00', '2025-06-30 16:00:39', '2025-06-30 16:00:39'),
(224, 27, 'Sunday', 1, '10:00:00', '16:00:00', '2025-06-30 16:00:39', '2025-06-30 16:00:39'),
(225, 28, 'Monday', 0, '01:00:00', '03:00:00', '2025-06-30 16:02:08', '2025-06-30 16:02:08'),
(226, 28, 'Tuesday', 1, NULL, NULL, '2025-06-30 16:02:08', '2025-06-30 16:02:08'),
(227, 28, 'Wednesday', 1, NULL, NULL, '2025-06-30 16:02:08', '2025-06-30 16:02:08'),
(228, 28, 'Thursday', 1, NULL, NULL, '2025-06-30 16:02:08', '2025-06-30 16:02:08'),
(229, 28, 'Friday', 1, NULL, NULL, '2025-06-30 16:02:08', '2025-06-30 16:02:08'),
(230, 28, 'Saturday', 1, NULL, NULL, '2025-06-30 16:02:08', '2025-06-30 16:02:08'),
(231, 28, 'Sunday', 1, NULL, NULL, '2025-06-30 16:02:08', '2025-06-30 16:02:08'),
(232, 29, 'Monday', 0, '09:00:00', '18:00:00', '2025-07-01 08:11:14', '2025-07-01 08:11:14'),
(233, 29, 'Tuesday', 0, '09:00:00', '18:00:00', '2025-07-01 08:11:14', '2025-07-01 08:11:14'),
(234, 29, 'Wednesday', 0, '09:00:00', '18:00:00', '2025-07-01 08:11:14', '2025-07-01 08:11:14'),
(235, 29, 'Thursday', 0, '09:00:00', '18:00:00', '2025-07-01 08:11:14', '2025-07-01 08:11:14'),
(236, 29, 'Friday', 0, '15:00:00', '22:00:00', '2025-07-01 08:11:14', '2025-07-01 08:11:14'),
(237, 29, 'Saturday', 1, NULL, NULL, '2025-07-01 08:11:14', '2025-07-01 08:11:14'),
(238, 29, 'Sunday', 1, NULL, NULL, '2025-07-01 08:11:14', '2025-07-01 08:11:14'),
(239, 30, 'Monday', 0, '09:00:00', '15:00:00', '2025-07-01 09:03:38', '2025-07-01 09:03:38'),
(240, 30, 'Tuesday', 0, '09:00:00', '15:00:00', '2025-07-01 09:03:38', '2025-07-01 09:03:38'),
(241, 30, 'Wednesday', 0, '09:00:00', '15:00:00', '2025-07-01 09:03:38', '2025-07-01 09:03:38'),
(242, 30, 'Thursday', 0, '09:00:00', '15:00:00', '2025-07-01 09:03:38', '2025-07-01 09:03:38'),
(243, 30, 'Friday', 0, '09:00:00', '15:00:00', '2025-07-01 09:03:38', '2025-07-01 09:03:38'),
(244, 30, 'Saturday', 1, NULL, NULL, '2025-07-01 09:03:38', '2025-07-01 09:03:38'),
(245, 30, 'Sunday', 1, NULL, NULL, '2025-07-01 09:03:38', '2025-07-01 09:03:38'),
(246, 31, 'Monday', 0, '09:00:00', '20:00:00', '2025-07-01 10:15:51', '2025-07-01 10:15:51'),
(247, 31, 'Tuesday', 0, '09:00:00', '20:00:00', '2025-07-01 10:15:51', '2025-07-01 10:15:51'),
(248, 31, 'Wednesday', 0, '09:00:00', '20:00:00', '2025-07-01 10:15:51', '2025-07-01 10:15:51'),
(249, 31, 'Thursday', 1, NULL, NULL, '2025-07-01 10:15:51', '2025-07-01 10:15:51'),
(250, 31, 'Friday', 1, NULL, NULL, '2025-07-01 10:15:51', '2025-07-01 10:15:51'),
(251, 31, 'Saturday', 1, NULL, NULL, '2025-07-01 10:15:51', '2025-07-01 10:15:51'),
(252, 31, 'Sunday', 1, NULL, NULL, '2025-07-01 10:15:51', '2025-07-01 10:15:51'),
(260, 33, 'Monday', 0, '04:30:00', '22:00:00', '2025-07-01 10:43:27', '2025-07-01 10:43:27'),
(261, 33, 'Tuesday', 1, NULL, NULL, '2025-07-01 10:43:27', '2025-07-01 10:43:27'),
(262, 33, 'Wednesday', 1, NULL, NULL, '2025-07-01 10:43:27', '2025-07-01 10:43:27'),
(263, 33, 'Thursday', 1, NULL, NULL, '2025-07-01 10:43:27', '2025-07-01 10:43:27'),
(264, 33, 'Friday', 1, NULL, NULL, '2025-07-01 10:43:27', '2025-07-01 10:43:27'),
(265, 33, 'Saturday', 1, NULL, NULL, '2025-07-01 10:43:27', '2025-07-01 10:43:27'),
(266, 33, 'Sunday', 1, NULL, NULL, '2025-07-01 10:43:27', '2025-07-01 10:43:27'),
(267, 34, 'Monday', 0, '02:30:00', '11:00:00', '2025-07-01 10:46:51', '2025-07-01 10:46:51'),
(268, 34, 'Tuesday', 1, NULL, NULL, '2025-07-01 10:46:51', '2025-07-01 10:46:51'),
(269, 34, 'Wednesday', 1, NULL, NULL, '2025-07-01 10:46:51', '2025-07-01 10:46:51'),
(270, 34, 'Thursday', 1, NULL, NULL, '2025-07-01 10:46:51', '2025-07-01 10:46:51'),
(271, 34, 'Friday', 1, NULL, NULL, '2025-07-01 10:46:51', '2025-07-01 10:46:51'),
(272, 34, 'Saturday', 1, NULL, NULL, '2025-07-01 10:46:51', '2025-07-01 10:46:51'),
(273, 34, 'Sunday', 1, NULL, NULL, '2025-07-01 10:46:51', '2025-07-01 10:46:51'),
(274, 35, 'Monday', 0, '03:30:00', '10:00:00', '2025-07-01 10:50:15', '2025-07-01 10:50:15'),
(275, 35, 'Tuesday', 1, NULL, NULL, '2025-07-01 10:50:15', '2025-07-01 10:50:15'),
(276, 35, 'Wednesday', 1, NULL, NULL, '2025-07-01 10:50:15', '2025-07-01 10:50:15'),
(277, 35, 'Thursday', 1, NULL, NULL, '2025-07-01 10:50:15', '2025-07-01 10:50:15'),
(278, 35, 'Friday', 1, NULL, NULL, '2025-07-01 10:50:15', '2025-07-01 10:50:15'),
(279, 35, 'Saturday', 1, NULL, NULL, '2025-07-01 10:50:15', '2025-07-01 10:50:15'),
(280, 35, 'Sunday', 1, NULL, NULL, '2025-07-01 10:50:15', '2025-07-01 10:50:15'),
(281, 36, 'Monday', 0, '03:00:00', '14:00:00', '2025-07-01 14:29:19', '2025-07-01 14:29:19'),
(282, 36, 'Tuesday', 1, NULL, NULL, '2025-07-01 14:29:19', '2025-07-01 14:29:19'),
(283, 36, 'Wednesday', 1, NULL, NULL, '2025-07-01 14:29:19', '2025-07-01 14:29:19'),
(284, 36, 'Thursday', 1, NULL, NULL, '2025-07-01 14:29:19', '2025-07-01 14:29:19'),
(285, 36, 'Friday', 1, NULL, NULL, '2025-07-01 14:29:19', '2025-07-01 14:29:19'),
(286, 36, 'Saturday', 1, NULL, NULL, '2025-07-01 14:29:19', '2025-07-01 14:29:19'),
(287, 36, 'Sunday', 1, NULL, NULL, '2025-07-01 14:29:19', '2025-07-01 14:29:19'),
(288, 37, 'Monday', 0, '04:30:00', '09:00:00', '2025-07-02 10:19:57', '2025-07-02 10:19:57'),
(289, 37, 'Tuesday', 0, '04:30:00', '05:30:00', '2025-07-02 10:19:57', '2025-07-02 10:19:57'),
(290, 37, 'Wednesday', 0, '05:00:00', '18:00:00', '2025-07-02 10:19:57', '2025-07-02 10:19:57'),
(291, 37, 'Thursday', 0, '09:30:00', '22:00:00', '2025-07-02 10:19:57', '2025-07-02 10:19:57'),
(292, 37, 'Friday', 0, '11:00:00', '13:30:00', '2025-07-02 10:19:57', '2025-07-02 10:19:57'),
(293, 37, 'Saturday', 0, '12:00:00', '02:30:00', '2025-07-02 10:19:57', '2025-07-02 10:19:57'),
(294, 37, 'Sunday', 0, '00:00:00', '16:30:00', '2025-07-02 10:19:57', '2025-07-02 10:19:57'),
(295, 38, 'Monday', 1, NULL, NULL, '2025-07-02 11:09:05', '2025-07-02 11:09:05'),
(296, 38, 'Tuesday', 1, NULL, NULL, '2025-07-02 11:09:05', '2025-07-02 11:09:05'),
(297, 38, 'Wednesday', 1, NULL, NULL, '2025-07-02 11:09:05', '2025-07-02 11:09:05'),
(298, 38, 'Thursday', 1, NULL, NULL, '2025-07-02 11:09:05', '2025-07-02 11:09:05'),
(299, 38, 'Friday', 1, NULL, NULL, '2025-07-02 11:09:05', '2025-07-02 11:09:05'),
(300, 38, 'Saturday', 0, '20:00:00', '23:00:00', '2025-07-02 11:09:05', '2025-07-02 11:09:05'),
(301, 38, 'Sunday', 1, NULL, NULL, '2025-07-02 11:09:05', '2025-07-02 11:09:05'),
(603, 32, 'Monday', 0, '11:00:00', '15:00:00', '2025-07-03 13:56:55', '2025-07-03 13:56:55'),
(604, 32, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-03 13:56:55', '2025-07-03 13:56:55'),
(605, 32, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-03 13:56:55', '2025-07-03 13:56:55'),
(606, 32, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-03 13:56:55', '2025-07-03 13:56:55'),
(607, 32, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-03 13:56:55', '2025-07-03 13:56:55'),
(608, 32, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-03 13:56:55', '2025-07-03 13:56:55'),
(609, 32, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-03 13:56:55', '2025-07-03 13:56:55'),
(610, 8, 'Monday', 0, '11:00:00', '05:00:00', '2025-07-04 08:08:00', '2025-07-04 08:08:00'),
(611, 8, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-04 08:08:00', '2025-07-04 08:08:00'),
(612, 8, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-04 08:08:00', '2025-07-04 08:08:00'),
(613, 8, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-04 08:08:00', '2025-07-04 08:08:00'),
(614, 8, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-04 08:08:00', '2025-07-04 08:08:00'),
(615, 8, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-04 08:08:00', '2025-07-04 08:08:00'),
(616, 8, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-04 08:08:00', '2025-07-04 08:08:00'),
(617, 10, 'Monday', 0, '09:00:00', '18:00:00', '2025-07-04 11:24:12', '2025-07-04 11:24:12'),
(618, 10, 'Tuesday', 0, '09:00:00', '18:00:00', '2025-07-04 11:24:12', '2025-07-04 11:24:12'),
(619, 10, 'Wednesday', 0, '09:00:00', '18:00:00', '2025-07-04 11:24:12', '2025-07-04 11:24:12'),
(620, 10, 'Thursday', 0, '09:00:00', '18:00:00', '2025-07-04 11:24:12', '2025-07-04 11:24:12'),
(621, 10, 'Friday', 0, '09:00:00', '18:00:00', '2025-07-04 11:24:12', '2025-07-04 11:24:12'),
(622, 10, 'Saturday', 1, NULL, NULL, '2025-07-04 11:24:12', '2025-07-04 11:24:12'),
(623, 10, 'Sunday', 1, NULL, NULL, '2025-07-04 11:24:12', '2025-07-04 11:24:12'),
(631, 12, 'Monday', 0, '11:00:00', '05:00:00', '2025-07-04 11:49:50', '2025-07-04 11:49:50'),
(632, 12, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-04 11:49:50', '2025-07-04 11:49:50'),
(633, 12, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-04 11:49:50', '2025-07-04 11:49:50'),
(634, 12, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-04 11:49:50', '2025-07-04 11:49:50'),
(635, 12, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-04 11:49:50', '2025-07-04 11:49:50'),
(636, 12, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-04 11:49:50', '2025-07-04 11:49:50'),
(637, 12, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-04 11:49:50', '2025-07-04 11:49:50'),
(638, 16, 'Monday', 0, '00:30:00', '06:00:00', '2025-07-04 15:00:22', '2025-07-04 15:00:22'),
(639, 16, 'Tuesday', 0, '00:30:00', '06:00:00', '2025-07-04 15:00:22', '2025-07-04 15:00:22'),
(640, 16, 'Wednesday', 0, '00:30:00', '06:00:00', '2025-07-04 15:00:22', '2025-07-04 15:00:22'),
(641, 16, 'Thursday', 1, NULL, NULL, '2025-07-04 15:00:22', '2025-07-04 15:00:22'),
(642, 16, 'Friday', 1, NULL, NULL, '2025-07-04 15:00:22', '2025-07-04 15:00:22'),
(643, 16, 'Saturday', 1, NULL, NULL, '2025-07-04 15:00:22', '2025-07-04 15:00:22'),
(644, 16, 'Sunday', 1, NULL, NULL, '2025-07-04 15:00:22', '2025-07-04 15:00:22'),
(813, 41, 'Monday', 0, '11:00:00', '05:00:00', '2025-07-07 08:20:37', '2025-07-07 08:20:37'),
(814, 41, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-07 08:20:37', '2025-07-07 08:20:37'),
(815, 41, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-07 08:20:37', '2025-07-07 08:20:37'),
(816, 41, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-07 08:20:37', '2025-07-07 08:20:37'),
(817, 41, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-07 08:20:37', '2025-07-07 08:20:37'),
(818, 41, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-07 08:20:37', '2025-07-07 08:20:37'),
(819, 41, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-07 08:20:37', '2025-07-07 08:20:37'),
(820, 44, 'Monday', 0, '09:00:00', '20:00:00', '2025-07-07 10:30:20', '2025-07-07 10:30:20'),
(821, 44, 'Tuesday', 0, '09:00:00', '20:00:00', '2025-07-07 10:30:20', '2025-07-07 10:30:20'),
(822, 44, 'Wednesday', 0, '09:00:00', '20:00:00', '2025-07-07 10:30:20', '2025-07-07 10:30:20'),
(823, 44, 'Thursday', 0, '09:00:00', '20:00:00', '2025-07-07 10:30:20', '2025-07-07 10:30:20'),
(824, 44, 'Friday', 0, '09:00:00', '20:00:00', '2025-07-07 10:30:20', '2025-07-07 10:30:20'),
(825, 44, 'Saturday', 1, NULL, NULL, '2025-07-07 10:30:20', '2025-07-07 10:30:20'),
(826, 44, 'Sunday', 1, NULL, NULL, '2025-07-07 10:30:20', '2025-07-07 10:30:20'),
(827, 45, 'Monday', 0, '09:00:00', '20:00:00', '2025-07-07 10:44:03', '2025-07-07 10:44:03'),
(828, 45, 'Tuesday', 0, '09:00:00', '20:00:00', '2025-07-07 10:44:03', '2025-07-07 10:44:03'),
(829, 45, 'Wednesday', 0, '09:00:00', '20:00:00', '2025-07-07 10:44:03', '2025-07-07 10:44:03'),
(830, 45, 'Thursday', 0, '09:00:00', '20:00:00', '2025-07-07 10:44:03', '2025-07-07 10:44:03'),
(831, 45, 'Friday', 0, '09:00:00', '20:00:00', '2025-07-07 10:44:03', '2025-07-07 10:44:03'),
(832, 45, 'Saturday', 1, NULL, NULL, '2025-07-07 10:44:03', '2025-07-07 10:44:03'),
(833, 45, 'Sunday', 1, NULL, NULL, '2025-07-07 10:44:03', '2025-07-07 10:44:03'),
(834, 46, 'Monday', 0, '00:30:00', '13:00:00', '2025-07-07 11:04:57', '2025-07-07 11:04:57'),
(835, 46, 'Tuesday', 0, '00:30:00', '13:00:00', '2025-07-07 11:04:57', '2025-07-07 11:04:57'),
(836, 46, 'Wednesday', 0, '00:30:00', '13:00:00', '2025-07-07 11:04:57', '2025-07-07 11:04:57'),
(837, 46, 'Thursday', 1, NULL, NULL, '2025-07-07 11:04:57', '2025-07-07 11:04:57'),
(838, 46, 'Friday', 1, NULL, NULL, '2025-07-07 11:04:57', '2025-07-07 11:04:57'),
(839, 46, 'Saturday', 1, NULL, NULL, '2025-07-07 11:04:57', '2025-07-07 11:04:57'),
(840, 46, 'Sunday', 1, NULL, NULL, '2025-07-07 11:04:57', '2025-07-07 11:04:57'),
(841, 47, 'Monday', 0, '11:00:00', '05:00:00', '2025-07-07 12:11:03', '2025-07-07 12:11:03'),
(842, 47, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-07 12:11:03', '2025-07-07 12:11:03'),
(843, 47, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-07 12:11:03', '2025-07-07 12:11:03'),
(844, 47, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-07 12:11:03', '2025-07-07 12:11:03'),
(845, 47, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-07 12:11:03', '2025-07-07 12:11:03'),
(846, 47, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-07 12:11:03', '2025-07-07 12:11:03'),
(847, 47, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-07 12:11:03', '2025-07-07 12:11:03'),
(848, 48, 'Monday', 0, '11:00:00', '05:00:00', '2025-07-07 12:53:40', '2025-07-07 12:53:40'),
(849, 48, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-07 12:53:40', '2025-07-07 12:53:40'),
(850, 48, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-07 12:53:40', '2025-07-07 12:53:40'),
(851, 48, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-07 12:53:40', '2025-07-07 12:53:40'),
(852, 48, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-07 12:53:40', '2025-07-07 12:53:40'),
(853, 48, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-07 12:53:40', '2025-07-07 12:53:40'),
(854, 48, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-07 12:53:40', '2025-07-07 12:53:40'),
(925, 59, 'Monday', 0, '03:00:00', '14:00:00', '2025-07-07 13:48:54', '2025-07-07 13:48:54'),
(926, 59, 'Tuesday', 1, NULL, NULL, '2025-07-07 13:48:54', '2025-07-07 13:48:54'),
(927, 59, 'Wednesday', 0, '03:00:00', '14:00:00', '2025-07-07 13:48:54', '2025-07-07 13:48:54'),
(928, 59, 'Thursday', 1, NULL, NULL, '2025-07-07 13:48:54', '2025-07-07 13:48:54'),
(929, 59, 'Friday', 1, NULL, NULL, '2025-07-07 13:48:54', '2025-07-07 13:48:54'),
(930, 59, 'Saturday', 1, NULL, NULL, '2025-07-07 13:48:54', '2025-07-07 13:48:54'),
(931, 59, 'Sunday', 1, NULL, NULL, '2025-07-07 13:48:54', '2025-07-07 13:48:54'),
(932, 60, 'Monday', 0, '02:00:00', '11:00:00', '2025-07-07 13:52:07', '2025-07-07 13:52:07'),
(933, 60, 'Tuesday', 1, NULL, NULL, '2025-07-07 13:52:07', '2025-07-07 13:52:07'),
(934, 60, 'Wednesday', 1, NULL, NULL, '2025-07-07 13:52:07', '2025-07-07 13:52:07'),
(935, 60, 'Thursday', 1, NULL, NULL, '2025-07-07 13:52:07', '2025-07-07 13:52:07'),
(936, 60, 'Friday', 1, NULL, NULL, '2025-07-07 13:52:07', '2025-07-07 13:52:07'),
(937, 60, 'Saturday', 1, NULL, NULL, '2025-07-07 13:52:07', '2025-07-07 13:52:07'),
(938, 60, 'Sunday', 1, NULL, NULL, '2025-07-07 13:52:07', '2025-07-07 13:52:07'),
(939, 61, 'Monday', 0, '01:00:00', '19:30:00', '2025-07-07 13:55:41', '2025-07-07 13:55:41'),
(940, 61, 'Tuesday', 1, NULL, NULL, '2025-07-07 13:55:41', '2025-07-07 13:55:41'),
(941, 61, 'Wednesday', 1, NULL, NULL, '2025-07-07 13:55:41', '2025-07-07 13:55:41'),
(942, 61, 'Thursday', 1, NULL, NULL, '2025-07-07 13:55:41', '2025-07-07 13:55:41'),
(943, 61, 'Friday', 1, NULL, NULL, '2025-07-07 13:55:41', '2025-07-07 13:55:41'),
(944, 61, 'Saturday', 1, NULL, NULL, '2025-07-07 13:55:41', '2025-07-07 13:55:41'),
(945, 61, 'Sunday', 1, NULL, NULL, '2025-07-07 13:55:41', '2025-07-07 13:55:41'),
(946, 63, 'Monday', 0, '11:00:00', '05:00:00', '2025-07-07 14:04:14', '2025-07-07 14:04:14'),
(947, 63, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-07 14:04:14', '2025-07-07 14:04:14'),
(948, 63, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-07 14:04:14', '2025-07-07 14:04:14'),
(949, 63, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-07 14:04:14', '2025-07-07 14:04:14'),
(950, 63, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-07 14:04:14', '2025-07-07 14:04:14'),
(951, 63, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-07 14:04:14', '2025-07-07 14:04:14'),
(952, 63, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-07 14:04:14', '2025-07-07 14:04:14'),
(953, 64, 'Monday', 0, '11:00:00', '05:00:00', '2025-07-07 14:05:31', '2025-07-07 14:05:31'),
(954, 64, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-07 14:05:31', '2025-07-07 14:05:31'),
(955, 64, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-07 14:05:31', '2025-07-07 14:05:31'),
(956, 64, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-07 14:05:31', '2025-07-07 14:05:31'),
(957, 64, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-07 14:05:31', '2025-07-07 14:05:31'),
(958, 64, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-07 14:05:31', '2025-07-07 14:05:31'),
(959, 64, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-07 14:05:31', '2025-07-07 14:05:31'),
(960, 65, 'Monday', 0, '11:00:00', '05:00:00', '2025-07-07 14:06:19', '2025-07-07 14:06:19'),
(961, 65, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-07 14:06:19', '2025-07-07 14:06:19'),
(962, 65, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-07 14:06:19', '2025-07-07 14:06:19'),
(963, 65, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-07 14:06:19', '2025-07-07 14:06:19'),
(964, 65, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-07 14:06:19', '2025-07-07 14:06:19'),
(965, 65, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-07 14:06:19', '2025-07-07 14:06:19'),
(966, 65, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-07 14:06:19', '2025-07-07 14:06:19'),
(967, 67, 'Monday', 0, '01:30:00', '15:30:00', '2025-07-07 14:13:32', '2025-07-07 14:13:32'),
(968, 67, 'Tuesday', 0, '01:30:00', '15:30:00', '2025-07-07 14:13:32', '2025-07-07 14:13:32'),
(969, 67, 'Wednesday', 1, NULL, NULL, '2025-07-07 14:13:32', '2025-07-07 14:13:32'),
(970, 67, 'Thursday', 1, NULL, NULL, '2025-07-07 14:13:32', '2025-07-07 14:13:32'),
(971, 67, 'Friday', 1, NULL, NULL, '2025-07-07 14:13:32', '2025-07-07 14:13:32'),
(972, 67, 'Saturday', 1, NULL, NULL, '2025-07-07 14:13:32', '2025-07-07 14:13:32'),
(973, 67, 'Sunday', 1, NULL, NULL, '2025-07-07 14:13:32', '2025-07-07 14:13:32'),
(974, 68, 'Monday', 0, '01:30:00', '15:30:00', '2025-07-07 14:14:09', '2025-07-07 14:14:09'),
(975, 68, 'Tuesday', 0, '01:30:00', '15:30:00', '2025-07-07 14:14:09', '2025-07-07 14:14:09'),
(976, 68, 'Wednesday', 1, NULL, NULL, '2025-07-07 14:14:09', '2025-07-07 14:14:09'),
(977, 68, 'Thursday', 1, NULL, NULL, '2025-07-07 14:14:09', '2025-07-07 14:14:09'),
(978, 68, 'Friday', 1, NULL, NULL, '2025-07-07 14:14:09', '2025-07-07 14:14:09'),
(979, 68, 'Saturday', 1, NULL, NULL, '2025-07-07 14:14:09', '2025-07-07 14:14:09'),
(980, 68, 'Sunday', 1, NULL, NULL, '2025-07-07 14:14:09', '2025-07-07 14:14:09'),
(981, 69, 'Monday', 0, '01:30:00', '15:30:00', '2025-07-07 14:17:39', '2025-07-07 14:17:39'),
(982, 69, 'Tuesday', 0, '01:30:00', '15:30:00', '2025-07-07 14:17:39', '2025-07-07 14:17:39'),
(983, 69, 'Wednesday', 1, NULL, NULL, '2025-07-07 14:17:39', '2025-07-07 14:17:39'),
(984, 69, 'Thursday', 1, NULL, NULL, '2025-07-07 14:17:39', '2025-07-07 14:17:39'),
(985, 69, 'Friday', 1, NULL, NULL, '2025-07-07 14:17:39', '2025-07-07 14:17:39'),
(986, 69, 'Saturday', 1, NULL, NULL, '2025-07-07 14:17:39', '2025-07-07 14:17:39'),
(987, 69, 'Sunday', 1, NULL, NULL, '2025-07-07 14:17:39', '2025-07-07 14:17:39'),
(988, 70, 'Monday', 0, '01:30:00', '15:30:00', '2025-07-07 14:17:54', '2025-07-07 14:17:54'),
(989, 70, 'Tuesday', 0, '01:30:00', '15:30:00', '2025-07-07 14:17:54', '2025-07-07 14:17:54'),
(990, 70, 'Wednesday', 1, NULL, NULL, '2025-07-07 14:17:54', '2025-07-07 14:17:54'),
(991, 70, 'Thursday', 1, NULL, NULL, '2025-07-07 14:17:54', '2025-07-07 14:17:54'),
(992, 70, 'Friday', 1, NULL, NULL, '2025-07-07 14:17:54', '2025-07-07 14:17:54'),
(993, 70, 'Saturday', 1, NULL, NULL, '2025-07-07 14:17:54', '2025-07-07 14:17:54'),
(994, 70, 'Sunday', 1, NULL, NULL, '2025-07-07 14:17:54', '2025-07-07 14:17:54'),
(995, 71, 'Monday', 0, '01:30:00', '15:30:00', '2025-07-07 14:18:03', '2025-07-07 14:18:03'),
(996, 71, 'Tuesday', 0, '01:30:00', '15:30:00', '2025-07-07 14:18:03', '2025-07-07 14:18:03'),
(997, 71, 'Wednesday', 1, NULL, NULL, '2025-07-07 14:18:03', '2025-07-07 14:18:03'),
(998, 71, 'Thursday', 1, NULL, NULL, '2025-07-07 14:18:03', '2025-07-07 14:18:03'),
(999, 71, 'Friday', 1, NULL, NULL, '2025-07-07 14:18:03', '2025-07-07 14:18:03'),
(1000, 71, 'Saturday', 1, NULL, NULL, '2025-07-07 14:18:03', '2025-07-07 14:18:03'),
(1001, 71, 'Sunday', 1, NULL, NULL, '2025-07-07 14:18:03', '2025-07-07 14:18:03'),
(1009, 73, 'Monday', 0, '01:30:00', '15:30:00', '2025-07-07 14:19:03', '2025-07-07 14:19:03'),
(1010, 73, 'Tuesday', 0, '01:30:00', '15:30:00', '2025-07-07 14:19:03', '2025-07-07 14:19:03'),
(1011, 73, 'Wednesday', 1, NULL, NULL, '2025-07-07 14:19:03', '2025-07-07 14:19:03'),
(1012, 73, 'Thursday', 1, NULL, NULL, '2025-07-07 14:19:03', '2025-07-07 14:19:03'),
(1013, 73, 'Friday', 1, NULL, NULL, '2025-07-07 14:19:03', '2025-07-07 14:19:03'),
(1014, 73, 'Saturday', 1, NULL, NULL, '2025-07-07 14:19:03', '2025-07-07 14:19:03'),
(1015, 73, 'Sunday', 1, NULL, NULL, '2025-07-07 14:19:03', '2025-07-07 14:19:03'),
(1016, 74, 'Monday', 0, '01:30:00', '15:30:00', '2025-07-07 14:19:21', '2025-07-07 14:19:21'),
(1017, 74, 'Tuesday', 0, '01:30:00', '15:30:00', '2025-07-07 14:19:21', '2025-07-07 14:19:21'),
(1018, 74, 'Wednesday', 1, NULL, NULL, '2025-07-07 14:19:21', '2025-07-07 14:19:21'),
(1019, 74, 'Thursday', 1, NULL, NULL, '2025-07-07 14:19:21', '2025-07-07 14:19:21'),
(1020, 74, 'Friday', 1, NULL, NULL, '2025-07-07 14:19:21', '2025-07-07 14:19:21'),
(1021, 74, 'Saturday', 1, NULL, NULL, '2025-07-07 14:19:21', '2025-07-07 14:19:21'),
(1022, 74, 'Sunday', 1, NULL, NULL, '2025-07-07 14:19:21', '2025-07-07 14:19:21'),
(1023, 75, 'Monday', 0, '01:30:00', '15:30:00', '2025-07-07 14:19:43', '2025-07-07 14:19:43'),
(1024, 75, 'Tuesday', 0, '01:30:00', '15:30:00', '2025-07-07 14:19:43', '2025-07-07 14:19:43'),
(1025, 75, 'Wednesday', 1, NULL, NULL, '2025-07-07 14:19:43', '2025-07-07 14:19:43'),
(1026, 75, 'Thursday', 1, NULL, NULL, '2025-07-07 14:19:43', '2025-07-07 14:19:43'),
(1027, 75, 'Friday', 1, NULL, NULL, '2025-07-07 14:19:43', '2025-07-07 14:19:43'),
(1028, 75, 'Saturday', 1, NULL, NULL, '2025-07-07 14:19:43', '2025-07-07 14:19:43'),
(1029, 75, 'Sunday', 1, NULL, NULL, '2025-07-07 14:19:43', '2025-07-07 14:19:43'),
(1030, 76, 'Monday', 0, '01:30:00', '15:30:00', '2025-07-07 14:20:33', '2025-07-07 14:20:33'),
(1031, 76, 'Tuesday', 0, '01:30:00', '15:30:00', '2025-07-07 14:20:33', '2025-07-07 14:20:33'),
(1032, 76, 'Wednesday', 1, NULL, NULL, '2025-07-07 14:20:33', '2025-07-07 14:20:33'),
(1033, 76, 'Thursday', 1, NULL, NULL, '2025-07-07 14:20:33', '2025-07-07 14:20:33'),
(1034, 76, 'Friday', 1, NULL, NULL, '2025-07-07 14:20:33', '2025-07-07 14:20:33'),
(1035, 76, 'Saturday', 1, NULL, NULL, '2025-07-07 14:20:33', '2025-07-07 14:20:33'),
(1036, 76, 'Sunday', 1, NULL, NULL, '2025-07-07 14:20:33', '2025-07-07 14:20:33'),
(1037, 77, 'Monday', 0, '02:00:00', '16:30:00', '2025-07-07 14:22:16', '2025-07-07 14:22:16'),
(1038, 77, 'Tuesday', 1, NULL, NULL, '2025-07-07 14:22:16', '2025-07-07 14:22:16'),
(1039, 77, 'Wednesday', 0, '02:00:00', '16:30:00', '2025-07-07 14:22:16', '2025-07-07 14:22:16'),
(1040, 77, 'Thursday', 1, NULL, NULL, '2025-07-07 14:22:16', '2025-07-07 14:22:16'),
(1041, 77, 'Friday', 1, NULL, NULL, '2025-07-07 14:22:16', '2025-07-07 14:22:16'),
(1042, 77, 'Saturday', 1, NULL, NULL, '2025-07-07 14:22:16', '2025-07-07 14:22:16'),
(1043, 77, 'Sunday', 1, NULL, NULL, '2025-07-07 14:22:16', '2025-07-07 14:22:16'),
(1093, 85, 'Monday', 0, '11:00:00', '05:00:00', '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(1094, 85, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(1095, 85, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(1096, 85, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(1097, 85, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(1098, 85, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(1099, 85, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(1100, 86, 'Monday', 1, NULL, NULL, '2025-07-07 14:41:24', '2025-07-07 14:41:24'),
(1101, 86, 'Tuesday', 1, NULL, NULL, '2025-07-07 14:41:24', '2025-07-07 14:41:24'),
(1102, 86, 'Wednesday', 1, NULL, NULL, '2025-07-07 14:41:24', '2025-07-07 14:41:24'),
(1103, 86, 'Thursday', 0, '01:00:00', '18:30:00', '2025-07-07 14:41:24', '2025-07-07 14:41:24'),
(1104, 86, 'Friday', 1, NULL, NULL, '2025-07-07 14:41:24', '2025-07-07 14:41:24'),
(1105, 86, 'Saturday', 1, NULL, NULL, '2025-07-07 14:41:24', '2025-07-07 14:41:24'),
(1106, 86, 'Sunday', 1, NULL, NULL, '2025-07-07 14:41:24', '2025-07-07 14:41:24'),
(1114, 87, 'Monday', 1, NULL, NULL, '2025-07-07 15:14:58', '2025-07-07 15:14:58'),
(1115, 87, 'Tuesday', 0, '14:30:00', '19:30:00', '2025-07-07 15:14:58', '2025-07-07 15:14:58'),
(1116, 87, 'Wednesday', 0, '01:30:00', '03:00:00', '2025-07-07 15:14:58', '2025-07-07 15:14:58'),
(1117, 87, 'Thursday', 0, '01:30:00', '21:00:00', '2025-07-07 15:14:58', '2025-07-07 15:14:58'),
(1118, 87, 'Friday', 1, NULL, NULL, '2025-07-07 15:14:58', '2025-07-07 15:14:58'),
(1119, 87, 'Saturday', 0, '00:00:00', '09:30:00', '2025-07-07 15:14:58', '2025-07-07 15:14:58'),
(1120, 87, 'Sunday', 0, '15:30:00', '10:30:00', '2025-07-07 15:14:58', '2025-07-07 15:14:58'),
(1121, 88, 'Monday', 0, '11:00:00', '05:00:00', '2025-07-07 15:23:19', '2025-07-07 15:23:19'),
(1122, 88, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-07 15:23:19', '2025-07-07 15:23:19'),
(1123, 88, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-07 15:23:19', '2025-07-07 15:23:19'),
(1124, 88, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-07 15:23:19', '2025-07-07 15:23:19'),
(1125, 88, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-07 15:23:19', '2025-07-07 15:23:19'),
(1126, 88, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-07 15:23:19', '2025-07-07 15:23:19'),
(1127, 88, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-07 15:23:19', '2025-07-07 15:23:19'),
(1135, 89, 'Monday', 0, '09:00:00', '20:00:00', '2025-07-08 12:11:29', '2025-07-08 12:11:29'),
(1136, 89, 'Tuesday', 0, '02:30:00', '20:00:00', '2025-07-08 12:11:29', '2025-07-08 12:11:29'),
(1137, 89, 'Wednesday', 0, '02:30:00', '20:00:00', '2025-07-08 12:11:29', '2025-07-08 12:11:29'),
(1138, 89, 'Thursday', 0, '02:30:00', '20:00:00', '2025-07-08 12:11:29', '2025-07-08 12:11:29'),
(1139, 89, 'Friday', 0, '02:30:00', '20:00:00', '2025-07-08 12:11:29', '2025-07-08 12:11:29'),
(1140, 89, 'Saturday', 1, NULL, NULL, '2025-07-08 12:11:29', '2025-07-08 12:11:29'),
(1141, 89, 'Sunday', 1, NULL, NULL, '2025-07-08 12:11:29', '2025-07-08 12:11:29'),
(1142, 90, 'Monday', 0, '09:00:00', '18:00:00', '2025-07-08 12:39:11', '2025-07-08 12:39:11'),
(1143, 90, 'Tuesday', 0, '09:00:00', '18:00:00', '2025-07-08 12:39:11', '2025-07-08 12:39:11'),
(1144, 90, 'Wednesday', 0, '09:00:00', '18:00:00', '2025-07-08 12:39:11', '2025-07-08 12:39:11'),
(1145, 90, 'Thursday', 0, '09:00:00', '18:00:00', '2025-07-08 12:39:11', '2025-07-08 12:39:11'),
(1146, 90, 'Friday', 0, '09:00:00', '18:00:00', '2025-07-08 12:39:11', '2025-07-08 12:39:11'),
(1147, 90, 'Saturday', 1, NULL, NULL, '2025-07-08 12:39:11', '2025-07-08 12:39:11'),
(1148, 90, 'Sunday', 1, NULL, NULL, '2025-07-08 12:39:11', '2025-07-08 12:39:11'),
(1247, 72, 'Monday', 0, '11:00:00', '05:00:00', '2025-07-09 12:14:41', '2025-07-09 12:14:41'),
(1248, 72, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-09 12:14:41', '2025-07-09 12:14:41'),
(1249, 72, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-09 12:14:41', '2025-07-09 12:14:41'),
(1250, 72, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-09 12:14:41', '2025-07-09 12:14:41'),
(1251, 72, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-09 12:14:41', '2025-07-09 12:14:41'),
(1252, 72, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-09 12:14:41', '2025-07-09 12:14:41'),
(1253, 72, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-09 12:14:41', '2025-07-09 12:14:41'),
(1331, 100, 'Monday', 0, '11:00:00', '05:00:00', '2025-07-10 12:32:45', '2025-07-10 12:32:45'),
(1332, 100, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-10 12:32:45', '2025-07-10 12:32:45'),
(1333, 100, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-10 12:32:45', '2025-07-10 12:32:45'),
(1334, 100, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-10 12:32:45', '2025-07-10 12:32:45'),
(1335, 100, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-10 12:32:45', '2025-07-10 12:32:45'),
(1336, 100, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-10 12:32:45', '2025-07-10 12:32:45'),
(1337, 100, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-10 12:32:45', '2025-07-10 12:32:45'),
(1366, 103, 'Monday', 0, '11:00:00', '05:00:00', '2025-07-11 06:17:42', '2025-07-11 06:17:42'),
(1367, 103, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-11 06:17:42', '2025-07-11 06:17:42'),
(1368, 103, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-11 06:17:42', '2025-07-11 06:17:42'),
(1369, 103, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-11 06:17:42', '2025-07-11 06:17:42'),
(1370, 103, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-11 06:17:42', '2025-07-11 06:17:42'),
(1371, 103, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-11 06:17:42', '2025-07-11 06:17:42'),
(1372, 103, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-11 06:17:42', '2025-07-11 06:17:42'),
(1373, 104, 'Monday', 0, '11:00:00', '05:00:00', '2025-07-11 06:24:42', '2025-07-11 06:24:42'),
(1374, 104, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-11 06:24:42', '2025-07-11 06:24:42'),
(1375, 104, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-11 06:24:42', '2025-07-11 06:24:42'),
(1376, 104, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-11 06:24:42', '2025-07-11 06:24:42'),
(1377, 104, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-11 06:24:42', '2025-07-11 06:24:42'),
(1378, 104, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-11 06:24:42', '2025-07-11 06:24:42'),
(1379, 104, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-11 06:24:42', '2025-07-11 06:24:42'),
(1380, 105, 'Monday', 0, '11:00:00', '05:00:00', '2025-07-11 06:29:20', '2025-07-11 06:29:20'),
(1381, 105, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-11 06:29:20', '2025-07-11 06:29:20'),
(1382, 105, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-11 06:29:20', '2025-07-11 06:29:20'),
(1383, 105, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-11 06:29:20', '2025-07-11 06:29:20'),
(1384, 105, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-11 06:29:20', '2025-07-11 06:29:20'),
(1385, 105, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-11 06:29:20', '2025-07-11 06:29:20'),
(1386, 105, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-11 06:29:20', '2025-07-11 06:29:20'),
(1394, 107, 'Monday', 0, '11:00:00', '05:00:00', '2025-07-11 06:36:17', '2025-07-11 06:36:17'),
(1395, 107, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-11 06:36:17', '2025-07-11 06:36:17'),
(1396, 107, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-11 06:36:17', '2025-07-11 06:36:17'),
(1397, 107, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-11 06:36:17', '2025-07-11 06:36:17'),
(1398, 107, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-11 06:36:17', '2025-07-11 06:36:17'),
(1399, 107, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-11 06:36:17', '2025-07-11 06:36:17'),
(1400, 107, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-11 06:36:17', '2025-07-11 06:36:17'),
(1401, 108, 'Monday', 0, '11:00:00', '05:00:00', '2025-07-11 06:47:44', '2025-07-11 06:47:44'),
(1402, 108, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-11 06:47:44', '2025-07-11 06:47:44'),
(1403, 108, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-11 06:47:44', '2025-07-11 06:47:44'),
(1404, 108, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-11 06:47:44', '2025-07-11 06:47:44'),
(1405, 108, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-11 06:47:44', '2025-07-11 06:47:44'),
(1406, 108, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-11 06:47:44', '2025-07-11 06:47:44'),
(1407, 108, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-11 06:47:44', '2025-07-11 06:47:44'),
(1408, 109, 'Monday', 0, '11:00:00', '05:00:00', '2025-07-11 06:55:38', '2025-07-11 06:55:38'),
(1409, 109, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-11 06:55:38', '2025-07-11 06:55:38'),
(1410, 109, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-11 06:55:38', '2025-07-11 06:55:38'),
(1411, 109, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-11 06:55:38', '2025-07-11 06:55:38'),
(1412, 109, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-11 06:55:38', '2025-07-11 06:55:38'),
(1413, 109, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-11 06:55:38', '2025-07-11 06:55:38'),
(1414, 109, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-11 06:55:38', '2025-07-11 06:55:38'),
(1415, 110, 'Monday', 0, '11:00:00', '05:00:00', '2025-07-11 06:57:01', '2025-07-11 06:57:01'),
(1416, 110, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-11 06:57:01', '2025-07-11 06:57:01'),
(1417, 110, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-11 06:57:01', '2025-07-11 06:57:01'),
(1418, 110, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-11 06:57:01', '2025-07-11 06:57:01'),
(1419, 110, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-11 06:57:01', '2025-07-11 06:57:01'),
(1420, 110, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-11 06:57:01', '2025-07-11 06:57:01'),
(1421, 110, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-11 06:57:01', '2025-07-11 06:57:01'),
(1422, 111, 'Monday', 0, '11:00:00', '05:00:00', '2025-07-11 06:57:30', '2025-07-11 06:57:30'),
(1423, 111, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-11 06:57:30', '2025-07-11 06:57:30'),
(1424, 111, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-11 06:57:30', '2025-07-11 06:57:30'),
(1425, 111, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-11 06:57:30', '2025-07-11 06:57:30'),
(1426, 111, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-11 06:57:30', '2025-07-11 06:57:30'),
(1427, 111, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-11 06:57:30', '2025-07-11 06:57:30'),
(1428, 111, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-11 06:57:30', '2025-07-11 06:57:30'),
(1429, 112, 'Monday', 0, '11:00:00', '05:00:00', '2025-07-11 06:59:33', '2025-07-11 06:59:33'),
(1430, 112, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-11 06:59:33', '2025-07-11 06:59:33'),
(1431, 112, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-11 06:59:33', '2025-07-11 06:59:33'),
(1432, 112, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-11 06:59:33', '2025-07-11 06:59:33'),
(1433, 112, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-11 06:59:33', '2025-07-11 06:59:33'),
(1434, 112, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-11 06:59:33', '2025-07-11 06:59:33'),
(1435, 112, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-11 06:59:33', '2025-07-11 06:59:33'),
(1436, 113, 'Monday', 0, '11:00:00', '05:00:00', '2025-07-11 07:00:31', '2025-07-11 07:00:31'),
(1437, 113, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-11 07:00:31', '2025-07-11 07:00:31'),
(1438, 113, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-11 07:00:31', '2025-07-11 07:00:31'),
(1439, 113, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-11 07:00:31', '2025-07-11 07:00:31'),
(1440, 113, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-11 07:00:31', '2025-07-11 07:00:31'),
(1441, 113, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-11 07:00:31', '2025-07-11 07:00:31'),
(1442, 113, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-11 07:00:31', '2025-07-11 07:00:31'),
(1569, 5, 'Monday', 0, '11:00:00', '05:00:00', '2025-07-14 09:24:44', '2025-07-14 09:24:44'),
(1570, 5, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-14 09:24:44', '2025-07-14 09:24:44'),
(1571, 5, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-14 09:24:44', '2025-07-14 09:24:44'),
(1572, 5, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-14 09:24:44', '2025-07-14 09:24:44'),
(1573, 5, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-14 09:24:44', '2025-07-14 09:24:44'),
(1574, 5, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-14 09:24:44', '2025-07-14 09:24:44'),
(1575, 5, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-14 09:24:44', '2025-07-14 09:24:44'),
(1660, 118, 'Monday', 0, '16:00:00', '11:00:00', '2025-07-14 13:21:27', '2025-07-14 13:21:27'),
(1661, 118, 'Tuesday', 0, '12:30:00', '04:00:00', '2025-07-14 13:21:27', '2025-07-14 13:21:27'),
(1662, 118, 'Wednesday', 0, '06:00:00', '04:30:00', '2025-07-14 13:21:27', '2025-07-14 13:21:27'),
(1663, 118, 'Thursday', 1, NULL, NULL, '2025-07-14 13:21:27', '2025-07-14 13:21:27'),
(1664, 118, 'Friday', 1, NULL, NULL, '2025-07-14 13:21:27', '2025-07-14 13:21:27');
INSERT INTO `club_opening_hours` (`id`, `club_id`, `day`, `is_closed`, `opening_time`, `closing_time`, `created_at`, `updated_at`) VALUES
(1665, 118, 'Saturday', 0, '18:30:00', '17:00:00', '2025-07-14 13:21:27', '2025-07-14 13:21:27'),
(1666, 118, 'Sunday', 1, NULL, NULL, '2025-07-14 13:21:27', '2025-07-14 13:21:27'),
(1667, 119, 'Monday', 1, NULL, NULL, '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(1668, 119, 'Tuesday', 1, NULL, NULL, '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(1669, 119, 'Wednesday', 1, NULL, NULL, '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(1670, 119, 'Thursday', 0, '21:30:00', '20:30:00', '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(1671, 119, 'Friday', 0, '14:30:00', '05:00:00', '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(1672, 119, 'Saturday', 0, '21:30:00', '23:00:00', '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(1673, 119, 'Sunday', 1, NULL, NULL, '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(1702, 101, 'Monday', 0, '09:00:00', '20:00:00', '2025-07-15 04:53:13', '2025-07-15 04:53:13'),
(1703, 101, 'Tuesday', 0, '09:00:00', '20:00:00', '2025-07-15 04:53:13', '2025-07-15 04:53:13'),
(1704, 101, 'Wednesday', 0, '09:00:00', '20:00:00', '2025-07-15 04:53:13', '2025-07-15 04:53:13'),
(1705, 101, 'Thursday', 0, '09:00:00', '20:00:00', '2025-07-15 04:53:13', '2025-07-15 04:53:13'),
(1706, 101, 'Friday', 0, '09:00:00', '20:00:00', '2025-07-15 04:53:13', '2025-07-15 04:53:13'),
(1707, 101, 'Saturday', 1, NULL, NULL, '2025-07-15 04:53:13', '2025-07-15 04:53:13'),
(1708, 101, 'Sunday', 1, NULL, NULL, '2025-07-15 04:53:13', '2025-07-15 04:53:13'),
(1730, 117, 'Monday', 0, '09:00:00', '20:00:00', '2025-07-15 05:06:36', '2025-07-15 05:06:36'),
(1731, 117, 'Tuesday', 0, '09:00:00', '20:00:00', '2025-07-15 05:06:36', '2025-07-15 05:06:36'),
(1732, 117, 'Wednesday', 0, '09:00:00', '20:00:00', '2025-07-15 05:06:36', '2025-07-15 05:06:36'),
(1733, 117, 'Thursday', 0, '09:00:00', '20:00:00', '2025-07-15 05:06:36', '2025-07-15 05:06:36'),
(1734, 117, 'Friday', 0, '09:00:00', '20:00:00', '2025-07-15 05:06:36', '2025-07-15 05:06:36'),
(1735, 117, 'Saturday', 1, NULL, NULL, '2025-07-15 05:06:36', '2025-07-15 05:06:36'),
(1736, 117, 'Sunday', 1, NULL, NULL, '2025-07-15 05:06:36', '2025-07-15 05:06:36'),
(1765, 123, 'Monday', 0, '01:00:00', '07:30:00', '2025-07-15 05:32:29', '2025-07-15 05:32:29'),
(1766, 123, 'Tuesday', 1, NULL, NULL, '2025-07-15 05:32:29', '2025-07-15 05:32:29'),
(1767, 123, 'Wednesday', 1, NULL, NULL, '2025-07-15 05:32:29', '2025-07-15 05:32:29'),
(1768, 123, 'Thursday', 0, '15:30:00', '05:30:00', '2025-07-15 05:32:29', '2025-07-15 05:32:29'),
(1769, 123, 'Friday', 0, '18:00:00', '11:00:00', '2025-07-15 05:32:29', '2025-07-15 05:32:29'),
(1770, 123, 'Saturday', 0, '01:30:00', '00:00:00', '2025-07-15 05:32:29', '2025-07-15 05:32:29'),
(1771, 123, 'Sunday', 1, NULL, NULL, '2025-07-15 05:32:29', '2025-07-15 05:32:29'),
(1786, 116, 'Monday', 0, '09:00:00', '20:00:00', '2025-07-15 06:33:52', '2025-07-15 06:33:52'),
(1787, 116, 'Tuesday', 0, '09:00:00', '20:00:00', '2025-07-15 06:33:52', '2025-07-15 06:33:52'),
(1788, 116, 'Wednesday', 0, '09:00:00', '20:00:00', '2025-07-15 06:33:52', '2025-07-15 06:33:52'),
(1789, 116, 'Thursday', 0, '09:00:00', '20:00:00', '2025-07-15 06:33:52', '2025-07-15 06:33:52'),
(1790, 116, 'Friday', 0, '09:00:00', '20:00:00', '2025-07-15 06:33:52', '2025-07-15 06:33:52'),
(1791, 116, 'Saturday', 1, NULL, NULL, '2025-07-15 06:33:52', '2025-07-15 06:33:52'),
(1792, 116, 'Sunday', 1, NULL, NULL, '2025-07-15 06:33:52', '2025-07-15 06:33:52'),
(1807, 126, 'Monday', 1, NULL, NULL, '2025-07-15 07:41:27', '2025-07-15 07:41:27'),
(1808, 126, 'Tuesday', 0, '10:00:00', '03:30:00', '2025-07-15 07:41:27', '2025-07-15 07:41:27'),
(1809, 126, 'Wednesday', 0, '11:30:00', '01:00:00', '2025-07-15 07:41:27', '2025-07-15 07:41:27'),
(1810, 126, 'Thursday', 1, NULL, NULL, '2025-07-15 07:41:27', '2025-07-15 07:41:27'),
(1811, 126, 'Friday', 0, '22:30:00', '05:00:00', '2025-07-15 07:41:27', '2025-07-15 07:41:27'),
(1812, 126, 'Saturday', 0, '16:30:00', '21:00:00', '2025-07-15 07:41:27', '2025-07-15 07:41:27'),
(1813, 126, 'Sunday', 0, '19:00:00', '06:30:00', '2025-07-15 07:41:27', '2025-07-15 07:41:27'),
(1814, 102, 'Monday', 0, '09:00:00', '20:00:00', '2025-07-15 07:42:28', '2025-07-15 07:42:28'),
(1815, 102, 'Tuesday', 0, '09:00:00', '20:00:00', '2025-07-15 07:42:28', '2025-07-15 07:42:28'),
(1816, 102, 'Wednesday', 0, '09:00:00', '20:00:00', '2025-07-15 07:42:28', '2025-07-15 07:42:28'),
(1817, 102, 'Thursday', 0, '09:00:00', '20:00:00', '2025-07-15 07:42:28', '2025-07-15 07:42:28'),
(1818, 102, 'Friday', 0, '09:00:00', '20:00:00', '2025-07-15 07:42:28', '2025-07-15 07:42:28'),
(1819, 102, 'Saturday', 1, NULL, NULL, '2025-07-15 07:42:28', '2025-07-15 07:42:28'),
(1820, 102, 'Sunday', 1, NULL, NULL, '2025-07-15 07:42:28', '2025-07-15 07:42:28'),
(1954, 40, 'Monday', 0, '11:00:00', '05:00:00', '2025-07-17 06:17:08', '2025-07-17 06:17:08'),
(1955, 40, 'Tuesday', 1, '08:00:00', '18:00:00', '2025-07-17 06:17:08', '2025-07-17 06:17:08'),
(1956, 40, 'Wednesday', 1, '08:00:00', '18:00:00', '2025-07-17 06:17:08', '2025-07-17 06:17:08'),
(1957, 40, 'Thursday', 1, '08:00:00', '18:00:00', '2025-07-17 06:17:08', '2025-07-17 06:17:08'),
(1958, 40, 'Friday', 1, '08:00:00', '22:00:00', '2025-07-17 06:17:08', '2025-07-17 06:17:08'),
(1959, 40, 'Saturday', 1, '10:00:00', '22:00:00', '2025-07-17 06:17:08', '2025-07-17 06:17:08'),
(1960, 40, 'Sunday', 1, '10:00:00', '16:00:00', '2025-07-17 06:17:08', '2025-07-17 06:17:08'),
(1989, 91, 'Monday', 0, '19:08:00', '22:20:00', '2025-07-17 06:35:39', '2025-07-17 06:35:39'),
(1990, 91, 'Tuesday', 0, NULL, NULL, '2025-07-17 06:35:39', '2025-07-17 06:35:39'),
(1991, 91, 'Wednesday', 0, NULL, NULL, '2025-07-17 06:35:39', '2025-07-17 06:35:39'),
(1992, 91, 'Thursday', 0, NULL, NULL, '2025-07-17 06:35:39', '2025-07-17 06:35:39'),
(1993, 91, 'Friday', 0, NULL, NULL, '2025-07-17 06:35:39', '2025-07-17 06:35:39'),
(1994, 91, 'Saturday', 0, NULL, NULL, '2025-07-17 06:35:39', '2025-07-17 06:35:39'),
(1995, 91, 'Sunday', 0, NULL, NULL, '2025-07-17 06:35:39', '2025-07-17 06:35:39');

-- --------------------------------------------------------

--
-- Table structure for table `club_sports`
--

CREATE TABLE `club_sports` (
  `id` bigint(20) NOT NULL,
  `club_id` bigint(20) NOT NULL,
  `sport_id` bigint(20) NOT NULL,
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `club_sports`
--

INSERT INTO `club_sports` (`id`, `club_id`, `sport_id`, `membership_fee`, `created_at`, `updated_at`) VALUES
(10, 4, 2, NULL, NULL, NULL),
(11, 4, 3, NULL, NULL, NULL),
(12, 4, 5, NULL, NULL, NULL),
(13, 5, 1, NULL, NULL, NULL),
(14, 5, 4, NULL, NULL, NULL),
(15, 6, 1, NULL, NULL, NULL),
(16, 6, 4, NULL, NULL, NULL),
(19, 5, 1, NULL, NULL, NULL),
(20, 6, 1, NULL, NULL, NULL),
(21, 7, 1, NULL, NULL, NULL),
(22, 8, 1, NULL, NULL, NULL),
(23, 8, 2, NULL, NULL, NULL),
(24, 8, 5, NULL, NULL, NULL),
(25, 9, 2, NULL, NULL, NULL),
(26, 9, 3, NULL, NULL, NULL),
(27, 9, 5, NULL, NULL, NULL),
(28, 10, 1, NULL, NULL, NULL),
(29, 10, 4, NULL, NULL, NULL),
(30, 11, 2, NULL, NULL, NULL),
(31, 12, 1, NULL, NULL, NULL),
(32, 12, 4, NULL, NULL, NULL),
(33, 13, 2, NULL, NULL, NULL),
(34, 13, 3, NULL, NULL, NULL),
(35, 13, 5, NULL, NULL, NULL),
(36, 14, 1, NULL, NULL, NULL),
(37, 14, 2, NULL, NULL, NULL),
(38, 14, 3, NULL, NULL, NULL),
(39, 14, 4, NULL, NULL, NULL),
(40, 15, 5, NULL, NULL, NULL),
(41, 16, 5, NULL, NULL, NULL),
(42, 17, 1, NULL, NULL, NULL),
(43, 17, 2, NULL, NULL, NULL),
(44, 17, 3, NULL, NULL, NULL),
(45, 17, 4, NULL, NULL, NULL),
(46, 18, 1, NULL, NULL, NULL),
(47, 19, 1, NULL, NULL, NULL),
(48, 19, 3, NULL, NULL, NULL),
(49, 19, 4, NULL, NULL, NULL),
(50, 20, 1, NULL, NULL, NULL),
(51, 20, 2, NULL, NULL, NULL),
(52, 20, 3, NULL, NULL, NULL),
(53, 21, 2, NULL, NULL, NULL),
(54, 21, 3, NULL, NULL, NULL),
(55, 22, 1, NULL, NULL, NULL),
(56, 22, 2, NULL, NULL, NULL),
(57, 22, 3, NULL, NULL, NULL),
(59, 24, 1, NULL, NULL, NULL),
(60, 25, 1, NULL, NULL, NULL),
(61, 26, 1, NULL, NULL, NULL),
(62, 27, 1, NULL, NULL, NULL),
(63, 28, 1, NULL, NULL, NULL),
(64, 29, 1, NULL, NULL, NULL),
(65, 29, 3, NULL, NULL, NULL),
(66, 29, 4, NULL, NULL, NULL),
(67, 30, 1, NULL, NULL, NULL),
(68, 30, 3, NULL, NULL, NULL),
(69, 31, 3, NULL, NULL, NULL),
(71, 33, 3, NULL, NULL, NULL),
(72, 34, 1, NULL, NULL, NULL),
(73, 35, 3, NULL, NULL, NULL),
(74, 36, 1, NULL, NULL, NULL),
(75, 37, 1, NULL, NULL, NULL),
(76, 37, 2, NULL, NULL, NULL),
(77, 37, 3, NULL, NULL, NULL),
(78, 37, 4, NULL, NULL, NULL),
(79, 37, 5, NULL, NULL, NULL),
(80, 37, 44, NULL, NULL, NULL),
(81, 38, 1, NULL, NULL, NULL),
(82, 38, 2, NULL, NULL, NULL),
(83, 38, 3, NULL, NULL, NULL),
(84, 38, 4, NULL, NULL, NULL),
(85, 38, 5, NULL, NULL, NULL),
(86, 38, 44, NULL, NULL, NULL),
(87, 32, 3, NULL, NULL, NULL),
(90, 8, 1, NULL, NULL, NULL),
(92, 10, 3, NULL, NULL, NULL),
(94, 12, 1, NULL, NULL, NULL),
(105, 16, 1, NULL, NULL, NULL),
(106, 16, 4, NULL, NULL, NULL),
(107, 40, 1, NULL, NULL, NULL),
(116, 41, 1, NULL, NULL, NULL),
(125, 44, 1, NULL, NULL, NULL),
(126, 44, 2, NULL, NULL, NULL),
(127, 44, 4, NULL, NULL, NULL),
(128, 44, 5, NULL, NULL, NULL),
(129, 45, 1, NULL, NULL, NULL),
(130, 45, 2, NULL, NULL, NULL),
(131, 45, 4, NULL, NULL, NULL),
(132, 46, 2, NULL, NULL, NULL),
(133, 47, 1, NULL, NULL, NULL),
(134, 48, 1, NULL, NULL, NULL),
(155, 59, 2, NULL, NULL, NULL),
(156, 59, 4, NULL, NULL, NULL),
(157, 60, 1, NULL, NULL, NULL),
(158, 61, 2, NULL, NULL, NULL),
(160, 63, 1, NULL, NULL, NULL),
(161, 64, 1, NULL, NULL, NULL),
(162, 65, 1, NULL, NULL, NULL),
(164, 67, 1, NULL, NULL, NULL),
(165, 68, 1, NULL, NULL, NULL),
(166, 69, 1, NULL, NULL, NULL),
(167, 70, 1, NULL, NULL, NULL),
(168, 71, 1, NULL, NULL, NULL),
(169, 72, 1, NULL, NULL, NULL),
(170, 73, 1, NULL, NULL, NULL),
(171, 74, 1, NULL, NULL, NULL),
(172, 75, 1, NULL, NULL, NULL),
(173, 76, 1, NULL, NULL, NULL),
(174, 77, 2, NULL, NULL, NULL),
(182, 85, 1, NULL, NULL, NULL),
(183, 86, 2, NULL, NULL, NULL),
(184, 5, 5, NULL, NULL, NULL),
(185, 87, 1, NULL, NULL, NULL),
(186, 87, 5, NULL, NULL, NULL),
(187, 88, 1, NULL, NULL, NULL),
(188, 89, 2, NULL, NULL, NULL),
(189, 89, 4, NULL, NULL, NULL),
(190, 90, 2, NULL, NULL, NULL),
(191, 90, 5, NULL, NULL, NULL),
(192, 40, 4, NULL, NULL, NULL),
(193, 40, 5, NULL, NULL, NULL),
(195, 40, 1, NULL, '2025-07-09 10:23:57', '2025-07-09 10:23:57'),
(196, 40, 2, NULL, '2025-07-09 10:23:57', '2025-07-09 10:23:57'),
(206, 72, 2, NULL, '2025-07-09 12:12:06', '2025-07-09 12:12:06'),
(207, 40, 1, NULL, '2025-07-10 05:36:11', '2025-07-10 05:36:11'),
(208, 40, 2, NULL, '2025-07-10 05:36:11', '2025-07-10 05:36:11'),
(209, 40, 1, NULL, '2025-07-10 05:48:43', '2025-07-10 05:48:43'),
(210, 40, 2, NULL, '2025-07-10 05:48:43', '2025-07-10 05:48:43'),
(212, 5, 2, NULL, '2025-07-10 07:45:03', '2025-07-10 07:45:03'),
(213, 100, 1, NULL, '2025-07-10 12:32:45', '2025-07-10 12:32:45'),
(214, 100, 2, NULL, '2025-07-10 12:32:45', '2025-07-10 12:32:45'),
(215, 101, 1, NULL, '2025-07-10 12:34:12', '2025-07-10 12:34:12'),
(216, 101, 2, NULL, '2025-07-10 12:34:12', '2025-07-10 12:34:12'),
(217, 101, 3, NULL, '2025-07-10 12:34:12', '2025-07-10 12:34:12'),
(218, 102, 1, NULL, '2025-07-10 12:39:10', '2025-07-10 12:39:10'),
(219, 102, 2, NULL, '2025-07-10 12:39:10', '2025-07-10 12:39:10'),
(220, 102, 3, NULL, '2025-07-10 12:39:10', '2025-07-10 12:39:10'),
(221, 103, 1, NULL, '2025-07-11 06:17:42', '2025-07-11 06:17:42'),
(222, 103, 2, NULL, '2025-07-11 06:17:42', '2025-07-11 06:17:42'),
(223, 104, 1, NULL, '2025-07-11 06:24:42', '2025-07-11 06:24:42'),
(224, 104, 2, NULL, '2025-07-11 06:24:42', '2025-07-11 06:24:42'),
(225, 105, 1, NULL, '2025-07-11 06:29:20', '2025-07-11 06:29:20'),
(226, 105, 2, NULL, '2025-07-11 06:29:20', '2025-07-11 06:29:20'),
(229, 107, 1, NULL, '2025-07-11 06:36:17', '2025-07-11 06:36:17'),
(230, 107, 2, NULL, '2025-07-11 06:36:17', '2025-07-11 06:36:17'),
(231, 108, 1, NULL, '2025-07-11 06:47:44', '2025-07-11 06:47:44'),
(232, 108, 2, NULL, '2025-07-11 06:47:44', '2025-07-11 06:47:44'),
(233, 109, 1, NULL, '2025-07-11 06:55:38', '2025-07-11 06:55:38'),
(234, 109, 2, NULL, '2025-07-11 06:55:38', '2025-07-11 06:55:38'),
(235, 110, 1, NULL, '2025-07-11 06:57:01', '2025-07-11 06:57:01'),
(236, 110, 2, NULL, '2025-07-11 06:57:01', '2025-07-11 06:57:01'),
(237, 111, 1, NULL, '2025-07-11 06:57:30', '2025-07-11 06:57:30'),
(238, 111, 2, NULL, '2025-07-11 06:57:30', '2025-07-11 06:57:30'),
(239, 112, 1, NULL, '2025-07-11 06:59:33', '2025-07-11 06:59:33'),
(240, 112, 2, NULL, '2025-07-11 06:59:33', '2025-07-11 06:59:33'),
(241, 113, 1, NULL, '2025-07-11 07:00:31', '2025-07-11 07:00:31'),
(242, 113, 2, NULL, '2025-07-11 07:00:31', '2025-07-11 07:00:31'),
(243, 116, 1, NULL, '2025-07-11 11:49:04', '2025-07-11 11:49:04'),
(244, 116, 2, NULL, '2025-07-11 11:49:04', '2025-07-11 11:49:04'),
(245, 40, 1, NULL, '2025-07-12 07:16:14', '2025-07-12 07:16:14'),
(246, 40, 2, NULL, '2025-07-12 07:16:14', '2025-07-12 07:16:14'),
(247, 117, 1, NULL, '2025-07-14 12:00:34', '2025-07-14 12:00:34'),
(248, 117, 2, NULL, '2025-07-14 12:00:34', '2025-07-14 12:00:34'),
(249, 118, 2, NULL, '2025-07-14 13:21:27', '2025-07-14 13:21:27'),
(250, 118, 5, NULL, '2025-07-14 13:21:27', '2025-07-14 13:21:27'),
(251, 119, 1, NULL, '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(252, 119, 3, NULL, '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(253, 119, 4, NULL, '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(257, 123, 2, NULL, '2025-07-15 05:32:29', '2025-07-15 05:32:29'),
(258, 123, 5, NULL, '2025-07-15 05:32:29', '2025-07-15 05:32:29'),
(264, 126, 1, NULL, '2025-07-15 06:49:16', '2025-07-15 06:49:16'),
(265, 126, 2, NULL, '2025-07-15 06:49:16', '2025-07-15 06:49:16'),
(266, 126, 3, NULL, '2025-07-15 06:49:16', '2025-07-15 06:49:16');

-- --------------------------------------------------------

--
-- Table structure for table `club_sport_courts`
--

CREATE TABLE `club_sport_courts` (
  `id` bigint(20) NOT NULL,
  `club_sport_id` bigint(20) NOT NULL,
  `type` enum('indoor','outdoor','single','double','football_5b5','football_6b6','football_7b7','football_11b11','basketball_full','basketball_half') NOT NULL,
  `count` tinyint(3) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `club_sport_courts`
--

INSERT INTO `club_sport_courts` (`id`, `club_sport_id`, `type`, `count`, `status`, `created_at`, `updated_at`) VALUES
(1, 190, 'indoor', 4, 'active', NULL, NULL),
(2, 190, 'outdoor', 4, 'active', NULL, NULL),
(3, 191, 'indoor', 2, 'active', NULL, NULL),
(4, 193, 'indoor', 0, 'active', NULL, NULL),
(5, 195, 'indoor', 3, 'active', '2025-07-09 10:23:57', '2025-07-09 10:23:57'),
(6, 195, 'indoor', 1, 'active', '2025-07-09 10:23:57', '2025-07-09 10:23:57'),
(7, 196, 'indoor', 1, 'inactive', '2025-07-09 10:23:57', '2025-07-09 10:23:57'),
(17, 169, 'outdoor', 1, 'active', '2025-07-09 12:12:06', '2025-07-09 12:12:06'),
(18, 169, 'outdoor', 1, 'active', '2025-07-09 12:14:37', '2025-07-09 12:14:37'),
(19, 169, 'outdoor', 1, 'active', '2025-07-09 12:14:41', '2025-07-09 12:14:41'),
(20, 207, 'indoor', 3, 'active', '2025-07-10 05:36:11', '2025-07-10 05:36:11'),
(21, 207, 'indoor', 1, 'active', '2025-07-10 05:36:11', '2025-07-10 05:36:11'),
(22, 208, 'indoor', 1, 'inactive', '2025-07-10 05:36:11', '2025-07-10 05:36:11'),
(23, 209, 'indoor', 3, 'active', '2025-07-10 05:48:43', '2025-07-10 05:48:43'),
(24, 209, 'indoor', 1, 'active', '2025-07-10 05:48:43', '2025-07-10 05:48:43'),
(25, 210, 'indoor', 1, 'inactive', '2025-07-10 05:48:43', '2025-07-10 05:48:43'),
(27, 13, 'outdoor', 1, 'active', '2025-07-10 07:45:03', '2025-07-10 07:45:03'),
(28, 13, 'outdoor', 1, 'active', '2025-07-10 08:02:01', '2025-07-10 08:02:01'),
(29, 13, 'outdoor', 1, 'active', '2025-07-10 08:16:48', '2025-07-10 08:16:48'),
(30, 13, 'outdoor', 1, 'active', '2025-07-10 08:17:38', '2025-07-10 08:17:38'),
(31, 13, 'outdoor', 1, 'active', '2025-07-10 08:21:19', '2025-07-10 08:21:19'),
(32, 13, 'outdoor', 1, 'active', '2025-07-10 08:28:55', '2025-07-10 08:28:55'),
(33, 13, 'outdoor', 1, 'active', '2025-07-10 08:30:52', '2025-07-10 08:30:52'),
(34, 213, 'indoor', 2, 'active', '2025-07-10 12:32:45', '2025-07-10 12:32:45'),
(35, 213, 'indoor', 3, 'inactive', '2025-07-10 12:32:45', '2025-07-10 12:32:45'),
(36, 214, 'indoor', 1, 'active', '2025-07-10 12:32:45', '2025-07-10 12:32:45'),
(37, 215, 'indoor', 4, 'active', '2025-07-10 12:34:12', '2025-07-10 12:34:12'),
(38, 215, 'indoor', 4, 'active', '2025-07-10 12:34:12', '2025-07-10 12:34:12'),
(39, 215, 'indoor', 4, 'active', '2025-07-10 12:34:12', '2025-07-10 12:34:12'),
(40, 215, 'indoor', 4, 'active', '2025-07-10 12:34:12', '2025-07-10 12:34:12'),
(41, 216, 'indoor', 4, 'active', '2025-07-10 12:34:12', '2025-07-10 12:34:12'),
(42, 216, 'indoor', 4, 'active', '2025-07-10 12:34:12', '2025-07-10 12:34:12'),
(43, 216, 'indoor', 4, 'active', '2025-07-10 12:34:12', '2025-07-10 12:34:12'),
(44, 216, 'indoor', 4, 'active', '2025-07-10 12:34:12', '2025-07-10 12:34:12'),
(45, 217, 'indoor', 4, 'active', '2025-07-10 12:34:12', '2025-07-10 12:34:12'),
(46, 217, 'indoor', 4, 'active', '2025-07-10 12:34:12', '2025-07-10 12:34:12'),
(47, 217, 'indoor', 4, 'active', '2025-07-10 12:34:12', '2025-07-10 12:34:12'),
(48, 217, 'indoor', 4, 'active', '2025-07-10 12:34:12', '2025-07-10 12:34:12'),
(49, 217, 'indoor', 4, 'active', '2025-07-10 12:34:12', '2025-07-10 12:34:12'),
(50, 217, 'indoor', 4, 'active', '2025-07-10 12:34:12', '2025-07-10 12:34:12'),
(51, 218, 'indoor', 4, 'active', '2025-07-10 12:39:10', '2025-07-10 12:39:10'),
(52, 218, 'indoor', 4, 'active', '2025-07-10 12:39:10', '2025-07-10 12:39:10'),
(53, 218, 'indoor', 4, 'active', '2025-07-10 12:39:10', '2025-07-10 12:39:10'),
(54, 218, 'indoor', 4, 'active', '2025-07-10 12:39:10', '2025-07-10 12:39:10'),
(55, 219, 'indoor', 4, 'active', '2025-07-10 12:39:10', '2025-07-10 12:39:10'),
(56, 219, 'indoor', 4, 'active', '2025-07-10 12:39:10', '2025-07-10 12:39:10'),
(57, 219, 'indoor', 4, 'active', '2025-07-10 12:39:10', '2025-07-10 12:39:10'),
(58, 219, 'indoor', 4, 'active', '2025-07-10 12:39:10', '2025-07-10 12:39:10'),
(59, 220, 'indoor', 4, 'active', '2025-07-10 12:39:10', '2025-07-10 12:39:10'),
(60, 220, 'indoor', 4, 'active', '2025-07-10 12:39:10', '2025-07-10 12:39:10'),
(61, 220, 'indoor', 4, 'active', '2025-07-10 12:39:10', '2025-07-10 12:39:10'),
(62, 220, 'indoor', 4, 'active', '2025-07-10 12:39:10', '2025-07-10 12:39:10'),
(63, 220, 'indoor', 4, 'active', '2025-07-10 12:39:10', '2025-07-10 12:39:10'),
(64, 220, 'indoor', 4, 'active', '2025-07-10 12:39:10', '2025-07-10 12:39:10'),
(65, 13, 'outdoor', 1, 'active', '2025-07-10 15:01:24', '2025-07-10 15:01:24'),
(66, 13, 'outdoor', 1, 'active', '2025-07-10 15:05:02', '2025-07-10 15:05:02'),
(67, 221, 'indoor', 2, 'active', '2025-07-11 06:17:42', '2025-07-11 06:17:42'),
(68, 221, 'indoor', 3, 'inactive', '2025-07-11 06:17:42', '2025-07-11 06:17:42'),
(69, 222, 'indoor', 1, 'active', '2025-07-11 06:17:42', '2025-07-11 06:17:42'),
(70, 223, 'indoor', 2, 'active', '2025-07-11 06:24:42', '2025-07-11 06:24:42'),
(71, 223, 'indoor', 3, 'inactive', '2025-07-11 06:24:42', '2025-07-11 06:24:42'),
(72, 224, 'indoor', 1, 'active', '2025-07-11 06:24:42', '2025-07-11 06:24:42'),
(73, 225, 'indoor', 2, 'active', '2025-07-11 06:29:20', '2025-07-11 06:29:20'),
(74, 225, 'indoor', 3, 'inactive', '2025-07-11 06:29:20', '2025-07-11 06:29:20'),
(75, 226, 'indoor', 1, 'active', '2025-07-11 06:29:20', '2025-07-11 06:29:20'),
(79, 229, 'indoor', 2, 'active', '2025-07-11 06:36:17', '2025-07-11 06:36:17'),
(80, 229, 'indoor', 3, 'inactive', '2025-07-11 06:36:17', '2025-07-11 06:36:17'),
(81, 230, 'indoor', 1, 'active', '2025-07-11 06:36:17', '2025-07-11 06:36:17'),
(82, 231, 'indoor', 2, 'active', '2025-07-11 06:47:44', '2025-07-11 06:47:44'),
(83, 231, 'indoor', 3, 'inactive', '2025-07-11 06:47:44', '2025-07-11 06:47:44'),
(84, 232, 'indoor', 1, 'active', '2025-07-11 06:47:44', '2025-07-11 06:47:44'),
(85, 233, 'indoor', 2, 'active', '2025-07-11 06:55:38', '2025-07-11 06:55:38'),
(86, 233, 'indoor', 3, 'inactive', '2025-07-11 06:55:38', '2025-07-11 06:55:38'),
(87, 234, 'indoor', 1, 'active', '2025-07-11 06:55:38', '2025-07-11 06:55:38'),
(88, 235, 'indoor', 2, 'active', '2025-07-11 06:57:01', '2025-07-11 06:57:01'),
(89, 235, 'indoor', 3, 'inactive', '2025-07-11 06:57:01', '2025-07-11 06:57:01'),
(90, 236, 'indoor', 1, 'active', '2025-07-11 06:57:01', '2025-07-11 06:57:01'),
(91, 237, 'indoor', 2, 'active', '2025-07-11 06:57:30', '2025-07-11 06:57:30'),
(92, 237, 'indoor', 3, 'inactive', '2025-07-11 06:57:30', '2025-07-11 06:57:30'),
(93, 238, 'indoor', 1, 'active', '2025-07-11 06:57:30', '2025-07-11 06:57:30'),
(94, 239, 'indoor', 2, 'active', '2025-07-11 06:59:33', '2025-07-11 06:59:33'),
(95, 239, 'indoor', 3, 'inactive', '2025-07-11 06:59:33', '2025-07-11 06:59:33'),
(96, 240, 'indoor', 1, 'active', '2025-07-11 06:59:33', '2025-07-11 06:59:33'),
(97, 241, 'indoor', 2, 'active', '2025-07-11 07:00:31', '2025-07-11 07:00:31'),
(98, 241, 'indoor', 3, 'inactive', '2025-07-11 07:00:31', '2025-07-11 07:00:31'),
(99, 242, 'indoor', 1, 'active', '2025-07-11 07:00:31', '2025-07-11 07:00:31'),
(100, 243, 'indoor', 4, 'active', '2025-07-11 11:49:04', '2025-07-11 11:49:04'),
(101, 243, 'indoor', 4, 'active', '2025-07-11 11:49:04', '2025-07-11 11:49:04'),
(102, 243, 'indoor', 4, 'active', '2025-07-11 11:49:04', '2025-07-11 11:49:04'),
(103, 243, 'indoor', 4, 'active', '2025-07-11 11:49:04', '2025-07-11 11:49:04'),
(104, 244, 'indoor', 4, 'active', '2025-07-11 11:49:04', '2025-07-11 11:49:04'),
(105, 244, 'indoor', 4, 'active', '2025-07-11 11:49:04', '2025-07-11 11:49:04'),
(106, 244, 'indoor', 4, 'active', '2025-07-11 11:49:04', '2025-07-11 11:49:04'),
(107, 244, 'indoor', 4, 'active', '2025-07-11 11:49:04', '2025-07-11 11:49:04'),
(109, 13, 'outdoor', 1, 'active', '2025-07-11 11:56:24', '2025-07-11 11:56:24'),
(110, 13, 'outdoor', 1, 'active', '2025-07-11 11:56:47', '2025-07-11 11:56:47'),
(116, 13, 'outdoor', 1, 'active', '2025-07-12 06:37:01', '2025-07-12 06:37:01'),
(117, 13, 'outdoor', 1, 'active', '2025-07-12 06:42:21', '2025-07-12 06:42:21'),
(118, 13, 'outdoor', 1, 'active', '2025-07-12 06:48:10', '2025-07-12 06:48:10'),
(119, 245, 'indoor', 3, 'active', '2025-07-12 07:16:14', '2025-07-12 07:16:14'),
(120, 245, 'indoor', 1, 'active', '2025-07-12 07:16:14', '2025-07-12 07:16:14'),
(121, 246, 'indoor', 1, 'inactive', '2025-07-12 07:16:14', '2025-07-12 07:16:14'),
(122, 13, 'outdoor', 1, 'active', '2025-07-12 08:07:18', '2025-07-12 08:07:18'),
(123, 13, 'outdoor', 1, 'active', '2025-07-12 12:11:38', '2025-07-12 12:11:38'),
(124, 13, 'outdoor', 1, 'active', '2025-07-12 12:13:04', '2025-07-12 12:13:04'),
(125, 13, 'outdoor', 1, 'active', '2025-07-14 03:58:02', '2025-07-14 03:58:02'),
(126, 13, 'outdoor', 1, 'active', '2025-07-14 03:58:29', '2025-07-14 03:58:29'),
(128, 13, 'outdoor', 1, 'active', '2025-07-14 09:23:07', '2025-07-14 09:23:07'),
(129, 13, 'outdoor', 1, 'active', '2025-07-14 09:24:44', '2025-07-14 09:24:44'),
(130, 247, 'indoor', 4, 'active', '2025-07-14 12:00:34', '2025-07-14 12:00:34'),
(131, 247, 'indoor', 4, 'active', '2025-07-14 12:00:34', '2025-07-14 12:00:34'),
(132, 247, 'indoor', 4, 'active', '2025-07-14 12:00:34', '2025-07-14 12:00:34'),
(133, 247, 'indoor', 4, 'active', '2025-07-14 12:00:34', '2025-07-14 12:00:34'),
(134, 248, 'indoor', 4, 'active', '2025-07-14 12:00:34', '2025-07-14 12:00:34'),
(135, 248, 'indoor', 4, 'active', '2025-07-14 12:00:34', '2025-07-14 12:00:34'),
(136, 248, 'indoor', 4, 'active', '2025-07-14 12:00:34', '2025-07-14 12:00:34'),
(137, 248, 'indoor', 4, 'active', '2025-07-14 12:00:34', '2025-07-14 12:00:34'),
(138, 249, 'indoor', 4, 'active', '2025-07-14 13:21:27', '2025-07-14 13:21:27'),
(139, 249, 'indoor', 4, 'active', '2025-07-14 13:21:27', '2025-07-14 13:21:27'),
(140, 249, 'indoor', 4, 'active', '2025-07-14 13:21:27', '2025-07-14 13:21:27'),
(141, 249, 'indoor', 4, 'active', '2025-07-14 13:21:27', '2025-07-14 13:21:27'),
(142, 250, 'indoor', 4, 'active', '2025-07-14 13:21:27', '2025-07-14 13:21:27'),
(143, 250, 'indoor', 4, 'active', '2025-07-14 13:21:27', '2025-07-14 13:21:27'),
(144, 250, 'indoor', 4, 'active', '2025-07-14 13:21:27', '2025-07-14 13:21:27'),
(145, 250, 'indoor', 4, 'active', '2025-07-14 13:21:27', '2025-07-14 13:21:27'),
(146, 251, 'indoor', 4, 'active', '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(147, 251, 'indoor', 4, 'active', '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(148, 251, 'indoor', 4, 'active', '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(149, 251, 'indoor', 4, 'active', '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(150, 252, 'indoor', 12, 'active', '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(151, 252, 'indoor', 12, 'active', '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(152, 252, 'indoor', 4, 'active', '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(153, 252, 'indoor', 4, 'active', '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(154, 252, 'indoor', 4, 'active', '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(155, 252, 'indoor', 4, 'active', '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(156, 253, 'indoor', 4, 'active', '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(157, 253, 'indoor', 4, 'active', '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(158, 253, 'indoor', 4, 'active', '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(159, 253, 'indoor', 4, 'active', '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(172, 257, 'indoor', 6, 'active', '2025-07-15 05:32:29', '2025-07-15 05:32:29'),
(173, 257, 'indoor', 6, 'active', '2025-07-15 05:32:29', '2025-07-15 05:32:29'),
(174, 257, 'indoor', 6, 'active', '2025-07-15 05:32:29', '2025-07-15 05:32:29'),
(175, 257, 'indoor', 6, 'active', '2025-07-15 05:32:29', '2025-07-15 05:32:29'),
(176, 258, 'indoor', 6, 'active', '2025-07-15 05:32:29', '2025-07-15 05:32:29'),
(177, 258, 'indoor', 6, 'active', '2025-07-15 05:32:29', '2025-07-15 05:32:29'),
(178, 258, 'indoor', 6, 'active', '2025-07-15 05:32:29', '2025-07-15 05:32:29'),
(179, 258, 'indoor', 6, 'active', '2025-07-15 05:32:29', '2025-07-15 05:32:29'),
(200, 264, 'indoor', 4, 'active', '2025-07-15 06:49:16', '2025-07-15 06:49:16'),
(201, 264, 'indoor', 4, 'active', '2025-07-15 06:49:16', '2025-07-15 06:49:16'),
(202, 264, 'indoor', 4, 'active', '2025-07-15 06:49:16', '2025-07-15 06:49:16'),
(203, 264, 'indoor', 4, 'active', '2025-07-15 06:49:16', '2025-07-15 06:49:16'),
(204, 265, 'indoor', 4, 'active', '2025-07-15 06:49:16', '2025-07-15 06:49:16'),
(205, 265, 'indoor', 4, 'active', '2025-07-15 06:49:16', '2025-07-15 06:49:16'),
(206, 265, 'indoor', 4, 'active', '2025-07-15 06:49:16', '2025-07-15 06:49:16'),
(207, 265, 'indoor', 4, 'active', '2025-07-15 06:49:16', '2025-07-15 06:49:16'),
(208, 266, 'indoor', 4, 'active', '2025-07-15 06:49:16', '2025-07-15 06:49:16'),
(209, 266, 'indoor', 4, 'active', '2025-07-15 06:49:16', '2025-07-15 06:49:16'),
(210, 266, 'indoor', 4, 'active', '2025-07-15 06:49:16', '2025-07-15 06:49:16'),
(211, 266, 'indoor', 4, 'active', '2025-07-15 06:49:16', '2025-07-15 06:49:16'),
(212, 266, 'indoor', 4, 'active', '2025-07-15 06:49:16', '2025-07-15 06:49:16'),
(213, 266, 'indoor', 4, 'active', '2025-07-15 06:49:16', '2025-07-15 06:49:16');

-- --------------------------------------------------------

--
-- Table structure for table `coaches`
--

CREATE TABLE `coaches` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `home_address` varchar(64) DEFAULT NULL,
  `emergency_contact` varchar(16) DEFAULT NULL,
  `emergency_contact_person_name` varchar(64) DEFAULT NULL,
  `emergency_contact_person_relationship` varchar(64) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `serving_role` enum('national','international') NOT NULL DEFAULT 'national',
  `training_type` enum('private','group','all') NOT NULL DEFAULT 'group',
  `job_type` enum('freelance','associate') NOT NULL,
  `club_id` bigint(20) DEFAULT NULL,
  `can_instruct` tinyint(1) NOT NULL DEFAULT 0,
  `experience_min` tinyint(3) DEFAULT NULL,
  `experience_max` tinyint(3) DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  `can_cancel_sessions` tinyint(1) NOT NULL DEFAULT 0,
  `default_cancel_time` int(11) NOT NULL DEFAULT 3,
  `booking_days_ahead` int(11) NOT NULL DEFAULT 7,
  `min_hours_before_booking` int(11) NOT NULL DEFAULT 2,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('profile_incomplete','pending','inactive','rejected','active','invited','suspended','on_leave','probation','left','terminated') NOT NULL DEFAULT 'active',
  `ratings` decimal(3,1) NOT NULL DEFAULT 0.0,
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coaches`
--

INSERT INTO `coaches` (`id`, `user_id`, `home_address`, `emergency_contact`, `emergency_contact_person_name`, `emergency_contact_person_relationship`, `banner_image`, `bio`, `serving_role`, `training_type`, `job_type`, `club_id`, `can_instruct`, `experience_min`, `experience_max`, `is_hidden`, `can_cancel_sessions`, `default_cancel_time`, `booking_days_ahead`, `min_hours_before_booking`, `is_verified`, `status`, `ratings`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 34, NULL, NULL, NULL, NULL, NULL, 'this is the new description', 'national', 'group', 'associate', 1, 1, 0, 1, 0, 0, 3, 7, 2, 0, 'active', 0.0, NULL, '2025-06-17 07:38:17', '2025-06-20 12:50:54', NULL),
(2, 36, NULL, NULL, NULL, NULL, NULL, 'This is new john description', 'national', 'group', 'associate', 1, 1, 0, 1, 0, 0, 3, 7, 2, 0, 'active', 0.0, NULL, '2025-06-17 11:45:26', '2025-06-20 13:08:27', NULL),
(3, 46, NULL, NULL, NULL, NULL, NULL, 'Coach information - this is a test coach so dont take it serious', 'international', 'private', 'associate', 1, 1, 3, 5, 0, 0, 3, 7, 2, 0, 'profile_incomplete', 0.0, NULL, '2025-06-17 15:05:24', '2025-06-17 15:05:24', NULL),
(4, 47, NULL, NULL, NULL, NULL, NULL, 'Coach information - this is a test coach so dont take it serious', 'international', 'private', 'associate', 1, 1, 3, 5, 0, 0, 3, 7, 2, 0, 'profile_incomplete', 0.0, NULL, '2025-06-17 15:07:18', '2025-06-17 15:07:18', NULL),
(5, 61, NULL, NULL, NULL, NULL, NULL, 'Coach information - lorem ipsum', 'national', 'group', 'associate', 1, 1, 0, 1, 0, 0, 3, 7, 2, 0, 'profile_incomplete', 0.0, NULL, '2025-06-18 14:37:25', '2025-06-18 14:37:25', NULL),
(6, 62, NULL, NULL, NULL, NULL, NULL, 'Coach information - lorem ipsum', 'national', 'group', 'associate', 1, 1, 0, 1, 0, 0, 3, 7, 2, 0, 'profile_incomplete', 0.0, NULL, '2025-06-18 14:41:28', '2025-06-18 14:41:28', NULL),
(7, 63, NULL, NULL, NULL, NULL, NULL, 'Coach information - lorem ipsum', 'national', 'group', 'associate', 1, 1, 0, 1, 0, 0, 3, 7, 2, 0, 'profile_incomplete', 0.0, NULL, '2025-06-19 05:27:09', '2025-06-19 05:27:09', NULL),
(8, 66, NULL, NULL, NULL, NULL, NULL, 'Coach information - lorem ipsum', 'national', 'group', 'associate', 1, 1, 0, 1, 0, 0, 3, 7, 2, 0, 'profile_incomplete', 0.0, NULL, '2025-06-19 08:09:52', '2025-06-19 08:09:52', NULL),
(9, 68, NULL, NULL, NULL, NULL, NULL, 'Coach information - lorem ipsum', 'national', 'group', 'associate', 1, 1, 0, 1, 0, 0, 3, 7, 2, 0, 'pending', 0.0, NULL, '2025-06-19 10:31:06', '2025-06-19 10:31:06', NULL),
(11, 70, NULL, NULL, NULL, NULL, NULL, 'Coach information - lorem ipsum', 'national', 'group', 'associate', 1, 1, 0, 1, 0, 0, 3, 7, 2, 0, 'profile_incomplete', 0.0, NULL, '2025-06-19 11:06:51', '2025-06-19 11:06:51', NULL),
(12, 71, NULL, NULL, NULL, NULL, NULL, 'Coach information - lorem ipsum', 'national', 'group', 'associate', 1, 1, 0, 1, 0, 0, 3, 7, 2, 0, 'active', 0.0, NULL, '2025-06-19 11:58:05', '2025-06-19 11:58:05', NULL),
(13, 72, NULL, NULL, NULL, NULL, NULL, 'vzhz h s', 'national', 'group', 'freelance', 4, 1, 2, 5, 0, 0, 3, 7, 2, 0, 'active', 0.0, NULL, '2025-06-19 12:02:03', '2025-06-19 12:02:03', NULL),
(14, 73, NULL, NULL, NULL, NULL, NULL, 'zbsbbssss sss', 'national', 'group', 'freelance', 4, 1, 3, 6, 0, 0, 3, 7, 2, 0, 'active', 0.0, NULL, '2025-06-19 12:11:44', '2025-06-19 12:11:44', NULL),
(15, 74, NULL, NULL, NULL, NULL, NULL, 'Coach information - lorem ipsum', 'national', 'group', 'associate', 1, 1, 0, 1, 0, 0, 3, 7, 2, 0, 'active', 0.0, NULL, '2025-06-19 12:24:28', '2025-06-19 12:24:28', NULL),
(16, 75, NULL, NULL, NULL, NULL, NULL, 'bbbsnn bbbb', 'national', 'private', 'freelance', 1, 1, 4, 8, 0, 0, 3, 7, 2, 0, 'active', 0.0, NULL, '2025-06-19 12:55:42', '2025-06-19 12:55:42', NULL),
(17, 76, NULL, NULL, NULL, NULL, NULL, 'babs s sb ss', 'national', 'all', 'freelance', 4, 1, 1, 5, 0, 0, 3, 7, 2, 0, 'active', 0.0, NULL, '2025-06-19 13:41:11', '2025-06-19 13:41:11', NULL),
(18, 77, NULL, NULL, NULL, NULL, NULL, 'bsbsb s. s sbb s', 'national', 'group', 'freelance', 4, 1, 1, 4, 0, 0, 3, 7, 2, 0, 'active', 0.0, NULL, '2025-06-19 13:50:53', '2025-06-19 13:50:53', NULL),
(19, 79, NULL, NULL, NULL, NULL, NULL, 'Coach information - lorem ipsum', 'national', 'group', 'freelance', 1, 1, 0, 1, 0, 0, 3, 7, 2, 0, 'active', 0.0, NULL, '2025-06-19 14:37:32', '2025-06-19 14:37:32', NULL),
(20, 80, NULL, NULL, NULL, NULL, NULL, 'Coach information - lorem ipsum', 'national', 'group', 'freelance', NULL, 1, 0, 1, 0, 0, 3, 7, 2, 0, 'active', 0.0, NULL, '2025-06-19 14:38:47', '2025-06-19 14:38:47', NULL),
(21, 81, NULL, NULL, NULL, NULL, NULL, 'Coach information - lorem ipsum', 'national', 'group', 'associate', 1, 1, 0, 1, 0, 0, 3, 7, 2, 0, 'active', 0.0, NULL, '2025-06-19 14:42:56', '2025-06-19 14:42:56', NULL),
(22, 82, NULL, NULL, NULL, NULL, NULL, 'bsbbbbb', 'national', 'group', 'freelance', NULL, 1, 2, 4, 0, 0, 3, 7, 2, 0, 'profile_incomplete', 0.0, NULL, '2025-06-19 14:43:50', '2025-06-19 14:43:50', NULL),
(23, 83, NULL, NULL, NULL, NULL, NULL, 'znsznn', 'international', 'group', 'associate', 5, 1, 4, 6, 0, 0, 3, 7, 2, 0, 'profile_incomplete', 0.0, NULL, '2025-06-19 14:54:38', '2025-06-19 14:54:38', NULL),
(24, 84, NULL, NULL, NULL, NULL, NULL, 'bsb', 'national', 'private', 'freelance', NULL, 1, 5, 6, 0, 0, 3, 7, 2, 0, 'profile_incomplete', 0.0, NULL, '2025-06-19 15:02:25', '2025-06-19 15:02:25', NULL),
(25, 85, NULL, NULL, NULL, NULL, NULL, 'thisisbio', 'national', 'private', 'freelance', NULL, 1, 3, 4, 0, 0, 3, 7, 2, 0, 'profile_incomplete', 0.0, NULL, '2025-06-19 15:25:47', '2025-06-19 15:25:47', NULL),
(26, 86, NULL, NULL, NULL, NULL, NULL, NULL, 'national', 'group', 'freelance', 1, 1, 0, 1, 0, 0, 3, 7, 2, 0, 'profile_incomplete', 0.0, NULL, '2025-06-20 09:04:30', '2025-06-20 09:04:30', NULL),
(27, 87, NULL, NULL, NULL, NULL, NULL, 'gabb', 'national', 'all', 'associate', 4, 1, 5, 6, 0, 0, 3, 7, 2, 0, 'profile_incomplete', 0.0, NULL, '2025-06-20 09:06:15', '2025-06-20 09:06:15', NULL),
(28, 88, NULL, NULL, NULL, NULL, NULL, NULL, 'national', 'group', 'associate', 1, 1, 0, 1, 0, 0, 3, 7, 2, 0, 'profile_incomplete', 0.0, NULL, '2025-06-20 09:11:44', '2025-06-20 09:11:44', NULL),
(29, 89, NULL, NULL, NULL, NULL, NULL, 'younis gopang from Rajanpur', 'national', 'group', 'freelance', NULL, 1, 6, 7, 0, 0, 3, 7, 2, 0, 'profile_incomplete', 0.0, NULL, '2025-06-20 09:59:12', '2025-06-20 09:59:12', NULL),
(30, 90, NULL, NULL, NULL, NULL, NULL, 'this is bio data this isbio data', 'national', 'private', 'associate', 6, 1, 6, 7, 0, 0, 3, 7, 2, 0, 'profile_incomplete', 0.0, NULL, '2025-06-20 10:09:17', '2025-06-20 10:09:17', NULL),
(31, 92, NULL, NULL, NULL, NULL, NULL, 'gvihaBIUV YIAhj gbcnxpB DABCI', 'national', 'group', 'associate', 1, 1, 0, 1, 0, 0, 3, 7, 2, 0, 'active', 0.0, NULL, '2025-06-20 11:34:11', '2025-06-20 13:32:12', NULL),
(32, 95, NULL, NULL, NULL, NULL, NULL, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy', 'national', 'all', 'associate', 4, 1, 4, 5, 0, 0, 3, 7, 2, 0, 'profile_incomplete', 0.0, NULL, '2025-06-20 22:39:50', '2025-06-20 22:39:50', NULL),
(33, 96, NULL, NULL, NULL, NULL, NULL, 'bnnaas ehjbdsjbbjjnssn', 'national', 'private', 'freelance', NULL, 1, 5, 6, 0, 0, 3, 7, 2, 0, 'pending', 0.0, NULL, '2025-06-21 09:47:34', '2025-06-21 09:47:34', NULL),
(34, 97, NULL, NULL, NULL, NULL, NULL, 'bsbbdnnnsssdeeavksannnn', 'national', 'group', 'associate', 4, 1, 5, 6, 0, 0, 3, 7, 2, 0, 'profile_incomplete', 0.0, NULL, '2025-06-21 13:18:50', '2025-06-21 13:18:50', NULL),
(35, 98, NULL, NULL, NULL, NULL, NULL, 'bbbbbsbbggghjjsssbhhbbansb', 'national', 'private', 'associate', 4, 1, 6, 7, 0, 0, 3, 7, 2, 0, 'profile_incomplete', 0.0, NULL, '2025-06-21 13:43:12', '2025-06-21 13:43:12', NULL),
(36, 248, NULL, NULL, NULL, NULL, NULL, 'vsbabssbsbsbbsbbbbsbsbsbs', 'national', 'private', 'freelance', NULL, 1, 3, 4, 0, 1, 3, 7, 2, 0, 'pending', 0.0, NULL, '2025-07-08 12:48:02', '2025-07-08 12:48:02', NULL),
(37, 249, NULL, NULL, NULL, NULL, NULL, 'sbsbbbbbbsbsbbbsbbsbnbabs', 'national', 'private', 'freelance', NULL, 1, 3, 4, 0, 1, 3, 7, 2, 0, 'pending', 0.0, NULL, '2025-07-08 12:50:50', '2025-07-08 12:50:50', NULL),
(38, 255, NULL, NULL, NULL, NULL, NULL, 'Bbbsgvbhjsbbjkgfjj BBCchss', 'national', 'group', 'freelance', NULL, 1, 3, 4, 0, 1, 3, 7, 2, 0, 'pending', 0.0, NULL, '2025-07-10 08:30:33', '2025-07-10 08:30:33', NULL),
(39, 256, NULL, NULL, NULL, NULL, NULL, 'vsbbsssbbbbbbbssbbssbbn', 'national', 'private', 'freelance', NULL, 0, 1, 2, 0, 1, 3, 7, 2, 0, 'pending', 0.0, NULL, '2025-07-10 09:24:37', '2025-07-10 09:24:37', NULL),
(40, 281, NULL, NULL, NULL, NULL, NULL, 'bsnnbsakbvvvvvssaambvvcav', 'national', 'private', 'freelance', NULL, 0, 3, 4, 0, 1, 3, 7, 2, 0, 'pending', 0.0, NULL, '2025-07-14 11:53:05', '2025-07-14 11:53:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `communities`
--

CREATE TABLE `communities` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `sport` varchar(50) NOT NULL,
  `level` varchar(50) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `location` varchar(255) NOT NULL,
  `topic` varchar(100) NOT NULL,
  `requires_approval` tinyint(1) NOT NULL,
  `cover_image` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `club_id` bigint(20) NOT NULL,
  `created_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `communities`
--

INSERT INTO `communities` (`id`, `name`, `description`, `sport`, `level`, `is_private`, `location`, `topic`, `requires_approval`, `cover_image`, `created_at`, `club_id`, `created_by`) VALUES
(1, 'Padel Club', '', 'padel', 'intermediate', 0, '', '', 0, '', '2025-07-18 13:09:18.029138', 3, 1),
(2, 'Padel Club', '', 'padel', 'intermediate', 0, '', '', 0, '', '2025-07-18 13:12:28.337546', 3, 1),
(3, 'Padel Club', '', 'padel', 'intermediate', 0, '', '', 0, '', '2025-07-19 07:11:25.856634', 101, 1),
(4, 'Basket Ball Club', '', 'padel', 'intermediate', 0, '', '', 0, '', '2025-07-19 07:11:50.017837', 101, 1),
(5, 'Tennis Club', '', 'padel', 'intermediate', 0, '', '', 0, '', '2025-07-19 07:12:05.212511', 101, 1),
(6, 'Universal Club', '', 'padel', 'intermediate', 0, '', '', 0, '', '2025-07-19 07:12:33.223947', 101, 1);

-- --------------------------------------------------------

--
-- Table structure for table `community_favorites`
--

CREATE TABLE `community_favorites` (
  `id` bigint(20) NOT NULL,
  `favorited_at` datetime(6) NOT NULL,
  `community_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `community_memberships`
--

CREATE TABLE `community_memberships` (
  `id` bigint(20) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `joined_at` datetime(6) NOT NULL,
  `community_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `community_memberships`
--

INSERT INTO `community_memberships` (`id`, `is_admin`, `is_approved`, `joined_at`, `community_id`, `user_id`) VALUES
(1, 0, 1, '2025-07-19 08:02:13.762841', 3, 40),
(2, 0, 1, '2025-07-19 08:02:25.555224', 3, 41),
(3, 0, 1, '2025-07-19 08:02:34.989521', 3, 42),
(4, 0, 1, '2025-07-19 08:02:48.502166', 3, 43),
(5, 0, 1, '2025-07-19 08:02:59.084593', 3, 44),
(6, 0, 1, '2025-07-19 08:03:09.926199', 3, 45),
(7, 0, 1, '2025-07-19 08:03:22.835489', 4, 46),
(8, 0, 1, '2025-07-19 08:03:32.967852', 4, 47),
(9, 0, 1, '2025-07-19 08:03:41.899085', 4, 48),
(10, 0, 1, '2025-07-19 08:03:50.738670', 4, 49),
(11, 0, 1, '2025-07-19 08:04:17.691693', 4, 50),
(12, 0, 1, '2025-07-19 08:05:04.263078', 4, 51),
(13, 0, 1, '2025-07-19 08:05:13.374909', 4, 52),
(14, 0, 1, '2025-07-19 08:05:31.847583', 4, 53),
(15, 0, 1, '2025-07-19 08:05:47.035956', 5, 54),
(16, 0, 1, '2025-07-19 08:05:56.310171', 5, 55),
(17, 0, 1, '2025-07-19 08:06:06.798366', 5, 56),
(18, 0, 1, '2025-07-19 08:06:16.922022', 5, 57),
(19, 0, 1, '2025-07-19 08:06:25.288814', 5, 58),
(20, 0, 1, '2025-07-19 08:06:39.085401', 6, 59);

-- --------------------------------------------------------

--
-- Table structure for table `community_messages`
--

CREATE TABLE `community_messages` (
  `id` bigint(20) NOT NULL,
  `content` longtext NOT NULL,
  `file` varchar(100) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `community_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `community_posts`
--

CREATE TABLE `community_posts` (
  `id` bigint(20) NOT NULL,
  `content` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `video` varchar(100) DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  `category` varchar(100) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `location` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `community_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `community_posts`
--

INSERT INTO `community_posts` (`id`, `content`, `image`, `video`, `file`, `category`, `tags`, `is_private`, `location`, `created_at`, `author_id`, `community_id`) VALUES
(1, 'My first post!', '', '', '', 'general', 'padel,fitness', 0, 'karachi', '2025-07-19 09:26:36.545527', 1, 3),
(2, 'My first post!', '', '', '', 'general', 'padel,fitness', 0, 'karachi', '2025-07-19 09:27:17.141386', 1, 3),
(3, 'My first post!', '', '', '', 'general', 'padel,fitness', 0, 'karachi', '2025-07-19 09:27:23.258844', 1, 3),
(4, 'My first post!', '', '', '', 'general', 'padel,fitness', 0, 'karachi', '2025-07-19 09:27:28.765871', 1, 3),
(5, 'My first post!', '', '', '', 'general', 'padel,fitness', 0, 'karachi', '2025-07-19 09:27:42.044172', 1, 3),
(6, 'My First Post!', '', '', '', 'general', 'padel,fitness', 0, 'Karachi', '2025-07-19 10:57:29.034700', 263, 3),
(7, 'My First Post!', '', '', '', 'general', 'padel,fitness', 0, 'Karachi', '2025-07-19 11:16:58.821336', 263, 3),
(8, 'Hello', '', '', '', 'general', 'padel,fitness', 0, 'Karachi', '2025-07-19 11:33:46.738681', 263, 3),
(9, 'Hello', '', '', '', 'general', 'padel,fitness', 0, 'Karachi', '2025-07-19 11:33:48.504743', 263, 3),
(10, 'Hy', '', '', '', 'general', 'padel,fitness', 0, 'Karachi', '2025-07-19 11:34:40.541642', 263, 3),
(11, 'Hello Basim', '', '', '', 'general', 'padel,fitness', 0, 'Karachi', '2025-07-19 11:36:06.242006', 263, 3),
(12, 'hhhhhhhhh', '', '', '', 'general', 'padel,fitness', 0, 'Karachi', '2025-07-19 11:36:57.928086', 263, 3),
(13, 'Heelo', '', '', '', 'general', 'padel,fitness', 0, 'Karachi', '2025-07-19 11:48:10.545536', 263, 3),
(14, 'How', '', '', '', 'general', 'padel,fitness', 0, 'Karachi', '2025-07-19 11:48:38.647097', 263, 4),
(15, 'Hello', '', '', '', 'general', 'padel,fitness', 0, 'Karachi', '2025-07-19 11:55:28.219973', 263, 5),
(16, 'Testing', '', '', '', 'general', 'padel,fitness', 0, 'Unknown Location', '2025-07-21 11:55:28.045983', 263, 5),
(17, 'Testing', '', '', '', 'general', 'padel,fitness', 0, 'Unknown Location', '2025-07-21 11:55:58.118645', 263, 6),
(18, 'Hello', '', '', '', 'general', 'padel,fitness', 0, 'Unknown Location', '2025-07-21 11:59:32.027654', 263, 6),
(19, 'This is just posting', '', '', '', 'general', 'padel,fitness', 0, 'Unknown Location', '2025-07-21 12:27:51.176996', 263, 6),
(20, 'Hey', '', '', '', 'general', 'padel,fitness', 0, 'Unknown Location', '2025-07-21 12:31:26.037146', 263, 5),
(21, 'Hello', '', '', '', 'general', 'padel,fitness', 0, 'Unknown Location', '2025-07-22 08:03:41.709690', 263, 6);

-- --------------------------------------------------------

--
-- Table structure for table `community_reports`
--

CREATE TABLE `community_reports` (
  `id` bigint(20) NOT NULL,
  `reason` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `community_id` bigint(20) NOT NULL,
  `reported_by_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(2) NOT NULL,
  `phone_code` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `emoji` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`, `phone_code`, `currency`, `emoji`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'AF', NULL, NULL, NULL, NULL, NULL),
(2, 'Albania', 'AL', NULL, NULL, NULL, NULL, NULL),
(3, 'Algeria', 'DZ', NULL, NULL, NULL, NULL, NULL),
(4, 'American Samoa', 'AS', NULL, NULL, NULL, NULL, NULL),
(5, 'Andorra', 'AD', NULL, NULL, NULL, NULL, NULL),
(6, 'Angola', 'AO', NULL, NULL, NULL, NULL, NULL),
(7, 'Anguilla', 'AI', NULL, NULL, NULL, NULL, NULL),
(8, 'Antarctica', 'AQ', NULL, NULL, NULL, NULL, NULL),
(9, 'Antigua and Barbuda', 'AG', NULL, NULL, NULL, NULL, NULL),
(10, 'Argentina', 'AR', NULL, NULL, NULL, NULL, NULL),
(11, 'Armenia', 'AM', NULL, NULL, NULL, NULL, NULL),
(12, 'Aruba', 'AW', NULL, NULL, NULL, NULL, NULL),
(13, 'Asia/Pacific Region', 'AP', NULL, NULL, NULL, NULL, NULL),
(14, 'Australia', 'AU', NULL, NULL, NULL, NULL, NULL),
(15, 'Austria', 'AT', NULL, NULL, NULL, NULL, NULL),
(16, 'Azerbaijan', 'AZ', NULL, NULL, NULL, NULL, NULL),
(17, 'Bahamas', 'BS', NULL, NULL, NULL, NULL, NULL),
(18, 'Bahrain', 'BH', NULL, NULL, NULL, NULL, NULL),
(19, 'Bangladesh', 'BD', NULL, NULL, NULL, NULL, NULL),
(20, 'Barbados', 'BB', NULL, NULL, NULL, NULL, NULL),
(21, 'Belarus', 'BY', NULL, NULL, NULL, NULL, NULL),
(22, 'Belgium', 'BE', NULL, NULL, NULL, NULL, NULL),
(23, 'Belize', 'BZ', NULL, NULL, NULL, NULL, NULL),
(24, 'Benin', 'BJ', NULL, NULL, NULL, NULL, NULL),
(25, 'Bermuda', 'BM', NULL, NULL, NULL, NULL, NULL),
(26, 'Bhutan', 'BT', NULL, NULL, NULL, NULL, NULL),
(27, 'Bolivia', 'BO', NULL, NULL, NULL, NULL, NULL),
(28, 'Bonaire, Sint Eustatius and Saba', 'BQ', NULL, NULL, NULL, NULL, NULL),
(29, 'Bosnia and Herzegovina', 'BA', NULL, NULL, NULL, NULL, NULL),
(30, 'Botswana', 'BW', NULL, NULL, NULL, NULL, NULL),
(31, 'Bouvet Island', 'BV', NULL, NULL, NULL, NULL, NULL),
(32, 'Brazil', 'BR', NULL, NULL, NULL, NULL, NULL),
(33, 'British Indian Ocean Territory', 'IO', NULL, NULL, NULL, NULL, NULL),
(34, 'Brunei Darussalam', 'BN', NULL, NULL, NULL, NULL, NULL),
(35, 'Bulgaria', 'BG', NULL, NULL, NULL, NULL, NULL),
(36, 'Burkina Faso', 'BF', NULL, NULL, NULL, NULL, NULL),
(37, 'Burundi', 'BI', NULL, NULL, NULL, NULL, NULL),
(38, 'Cambodia', 'KH', NULL, NULL, NULL, NULL, NULL),
(39, 'Cameroon', 'CM', NULL, NULL, NULL, NULL, NULL),
(40, 'Canada', 'CA', NULL, NULL, NULL, NULL, NULL),
(41, 'Cape Verde', 'CV', NULL, NULL, NULL, NULL, NULL),
(42, 'Cayman Islands', 'KY', NULL, NULL, NULL, NULL, NULL),
(43, 'Central African Republic', 'CF', NULL, NULL, NULL, NULL, NULL),
(44, 'Chad', 'TD', NULL, NULL, NULL, NULL, NULL),
(45, 'Chile', 'CL', NULL, NULL, NULL, NULL, NULL),
(46, 'China', 'CN', NULL, NULL, NULL, NULL, NULL),
(47, 'Christmas Island', 'CX', NULL, NULL, NULL, NULL, NULL),
(48, 'Cocos (Keeling) Islands', 'CC', NULL, NULL, NULL, NULL, NULL),
(49, 'Colombia', 'CO', NULL, NULL, NULL, NULL, NULL),
(50, 'Comoros', 'KM', NULL, NULL, NULL, NULL, NULL),
(51, 'Congo', 'CG', NULL, NULL, NULL, NULL, NULL),
(52, 'Congo, The Democratic Republic of the', 'CD', NULL, NULL, NULL, NULL, NULL),
(53, 'Cook Islands', 'CK', NULL, NULL, NULL, NULL, NULL),
(54, 'Costa Rica', 'CR', NULL, NULL, NULL, NULL, NULL),
(55, 'Croatia', 'HR', NULL, NULL, NULL, NULL, NULL),
(56, 'Cuba', 'CU', NULL, NULL, NULL, NULL, NULL),
(57, 'Curaçao', 'CW', NULL, NULL, NULL, NULL, NULL),
(58, 'Cyprus', 'CY', NULL, NULL, NULL, NULL, NULL),
(59, 'Czech Republic', 'CZ', NULL, NULL, NULL, NULL, NULL),
(60, 'Côte dIvoire', 'CI', NULL, NULL, NULL, NULL, NULL),
(61, 'Denmark', 'DK', NULL, NULL, NULL, NULL, NULL),
(62, 'Djibouti', 'DJ', NULL, NULL, NULL, NULL, NULL),
(63, 'Dominica', 'DM', NULL, NULL, NULL, NULL, NULL),
(64, 'Dominican Republic', 'DO', NULL, NULL, NULL, NULL, NULL),
(65, 'Ecuador', 'EC', NULL, NULL, NULL, NULL, NULL),
(66, 'Egypt', 'EG', NULL, NULL, NULL, NULL, NULL),
(67, 'El Salvador', 'SV', NULL, NULL, NULL, NULL, NULL),
(68, 'Equatorial Guinea', 'GQ', NULL, NULL, NULL, NULL, NULL),
(69, 'Eritrea', 'ER', NULL, NULL, NULL, NULL, NULL),
(70, 'Estonia', 'EE', NULL, NULL, NULL, NULL, NULL),
(71, 'Ethiopia', 'ET', NULL, NULL, NULL, NULL, NULL),
(72, 'Falkland Islands (Malvinas)', 'FK', NULL, NULL, NULL, NULL, NULL),
(73, 'Faroe Islands', 'FO', NULL, NULL, NULL, NULL, NULL),
(74, 'Fiji', 'FJ', NULL, NULL, NULL, NULL, NULL),
(75, 'Finland', 'FI', NULL, NULL, NULL, NULL, NULL),
(76, 'France', 'FR', NULL, NULL, NULL, NULL, NULL),
(77, 'French Guiana', 'GF', NULL, NULL, NULL, NULL, NULL),
(78, 'French Polynesia', 'PF', NULL, NULL, NULL, NULL, NULL),
(79, 'French Southern Territories', 'TF', NULL, NULL, NULL, NULL, NULL),
(80, 'Gabon', 'GA', NULL, NULL, NULL, NULL, NULL),
(81, 'Gambia', 'GM', NULL, NULL, NULL, NULL, NULL),
(82, 'Georgia', 'GE', NULL, NULL, NULL, NULL, NULL),
(83, 'Germany', 'DE', NULL, NULL, NULL, NULL, NULL),
(84, 'Ghana', 'GH', NULL, NULL, NULL, NULL, NULL),
(85, 'Gibraltar', 'GI', NULL, NULL, NULL, NULL, NULL),
(86, 'Greece', 'GR', NULL, NULL, NULL, NULL, NULL),
(87, 'Greenland', 'GL', NULL, NULL, NULL, NULL, NULL),
(88, 'Grenada', 'GD', NULL, NULL, NULL, NULL, NULL),
(89, 'Guadeloupe', 'GP', NULL, NULL, NULL, NULL, NULL),
(90, 'Guam', 'GU', NULL, NULL, NULL, NULL, NULL),
(91, 'Guatemala', 'GT', NULL, NULL, NULL, NULL, NULL),
(92, 'Guernsey', 'GG', NULL, NULL, NULL, NULL, NULL),
(93, 'Guinea', 'GN', NULL, NULL, NULL, NULL, NULL),
(94, 'Guinea-Bissau', 'GW', NULL, NULL, NULL, NULL, NULL),
(95, 'Guyana', 'GY', NULL, NULL, NULL, NULL, NULL),
(96, 'Haiti', 'HT', NULL, NULL, NULL, NULL, NULL),
(97, 'Heard Island and Mcdonald Islands', 'HM', NULL, NULL, NULL, NULL, NULL),
(98, 'Holy See (Vatican City State)', 'VA', NULL, NULL, NULL, NULL, NULL),
(99, 'Honduras', 'HN', NULL, NULL, NULL, NULL, NULL),
(100, 'Hong Kong', 'HK', NULL, NULL, NULL, NULL, NULL),
(101, 'Hungary', 'HU', NULL, NULL, NULL, NULL, NULL),
(102, 'Iceland', 'IS', NULL, NULL, NULL, NULL, NULL),
(103, 'India', 'IN', NULL, NULL, NULL, NULL, NULL),
(104, 'Indonesia', 'ID', NULL, NULL, NULL, NULL, NULL),
(105, 'Iran, Islamic Republic Of', 'IR', NULL, NULL, NULL, NULL, NULL),
(106, 'Iraq', 'IQ', NULL, NULL, NULL, NULL, NULL),
(107, 'Ireland', 'IE', NULL, NULL, NULL, NULL, NULL),
(108, 'Isle of Man', 'IM', NULL, NULL, NULL, NULL, NULL),
(109, 'Israel', 'IL', NULL, NULL, NULL, NULL, NULL),
(110, 'Italy', 'IT', NULL, NULL, NULL, NULL, NULL),
(111, 'Jamaica', 'JM', NULL, NULL, NULL, NULL, NULL),
(112, 'Japan', 'JP', NULL, NULL, NULL, NULL, NULL),
(113, 'Jersey', 'JE', NULL, NULL, NULL, NULL, NULL),
(114, 'Jordan', 'JO', NULL, NULL, NULL, NULL, NULL),
(115, 'Kazakhstan', 'KZ', NULL, NULL, NULL, NULL, NULL),
(116, 'Kenya', 'KE', NULL, NULL, NULL, NULL, NULL),
(117, 'Kiribati', 'KI', NULL, NULL, NULL, NULL, NULL),
(118, 'Korea, Republic of', 'KR', NULL, NULL, NULL, NULL, NULL),
(119, 'Kuwait', 'KW', NULL, NULL, NULL, NULL, NULL),
(120, 'Kyrgyzstan', 'KG', NULL, NULL, NULL, NULL, NULL),
(121, 'Laos', 'LA', NULL, NULL, NULL, NULL, NULL),
(122, 'Latvia', 'LV', NULL, NULL, NULL, NULL, NULL),
(123, 'Lebanon', 'LB', NULL, NULL, NULL, NULL, NULL),
(124, 'Lesotho', 'LS', NULL, NULL, NULL, NULL, NULL),
(125, 'Liberia', 'LR', NULL, NULL, NULL, NULL, NULL),
(126, 'Libyan Arab Jamahiriya', 'LY', NULL, NULL, NULL, NULL, NULL),
(127, 'Liechtenstein', 'LI', NULL, NULL, NULL, NULL, NULL),
(128, 'Lithuania', 'LT', NULL, NULL, NULL, NULL, NULL),
(129, 'Luxembourg', 'LU', NULL, NULL, NULL, NULL, NULL),
(130, 'Macao', 'MO', NULL, NULL, NULL, NULL, NULL),
(131, 'Madagascar', 'MG', NULL, NULL, NULL, NULL, NULL),
(132, 'Malawi', 'MW', NULL, NULL, NULL, NULL, NULL),
(133, 'Malaysia', 'MY', NULL, NULL, NULL, NULL, NULL),
(134, 'Maldives', 'MV', NULL, NULL, NULL, NULL, NULL),
(135, 'Mali', 'ML', NULL, NULL, NULL, NULL, NULL),
(136, 'Malta', 'MT', NULL, NULL, NULL, NULL, NULL),
(137, 'Marshall Islands', 'MH', NULL, NULL, NULL, NULL, NULL),
(138, 'Martinique', 'MQ', NULL, NULL, NULL, NULL, NULL),
(139, 'Mauritania', 'MR', NULL, NULL, NULL, NULL, NULL),
(140, 'Mauritius', 'MU', NULL, NULL, NULL, NULL, NULL),
(141, 'Mayotte', 'YT', NULL, NULL, NULL, NULL, NULL),
(142, 'Mexico', 'MX', NULL, NULL, NULL, NULL, NULL),
(143, 'Micronesia, Federated States of', 'FM', NULL, NULL, NULL, NULL, NULL),
(144, 'Moldova, Republic of', 'MD', NULL, NULL, NULL, NULL, NULL),
(145, 'Monaco', 'MC', NULL, NULL, NULL, NULL, NULL),
(146, 'Mongolia', 'MN', NULL, NULL, NULL, NULL, NULL),
(147, 'Montenegro', 'ME', NULL, NULL, NULL, NULL, NULL),
(148, 'Montserrat', 'MS', NULL, NULL, NULL, NULL, NULL),
(149, 'Morocco', 'MA', NULL, NULL, NULL, NULL, NULL),
(150, 'Mozambique', 'MZ', NULL, NULL, NULL, NULL, NULL),
(151, 'Myanmar', 'MM', NULL, NULL, NULL, NULL, NULL),
(152, 'Namibia', 'NA', NULL, NULL, NULL, NULL, NULL),
(153, 'Nauru', 'NR', NULL, NULL, NULL, NULL, NULL),
(154, 'Nepal', 'NP', NULL, NULL, NULL, NULL, NULL),
(155, 'Netherlands', 'NL', NULL, NULL, NULL, NULL, NULL),
(156, 'Netherlands Antilles', 'AN', NULL, NULL, NULL, NULL, NULL),
(157, 'New Caledonia', 'NC', NULL, NULL, NULL, NULL, NULL),
(158, 'New Zealand', 'NZ', NULL, NULL, NULL, NULL, NULL),
(159, 'Nicaragua', 'NI', NULL, NULL, NULL, NULL, NULL),
(160, 'Niger', 'NE', NULL, NULL, NULL, NULL, NULL),
(161, 'Nigeria', 'NG', NULL, NULL, NULL, NULL, NULL),
(162, 'Niue', 'NU', NULL, NULL, NULL, NULL, NULL),
(163, 'Norfolk Island', 'NF', NULL, NULL, NULL, NULL, NULL),
(164, 'North Korea', 'KP', NULL, NULL, NULL, NULL, NULL),
(165, 'North Macedonia', 'MK', NULL, NULL, NULL, NULL, NULL),
(166, 'Northern Mariana Islands', 'MP', NULL, NULL, NULL, NULL, NULL),
(167, 'Norway', 'NO', NULL, NULL, NULL, NULL, NULL),
(168, 'Oman', 'OM', NULL, NULL, NULL, NULL, NULL),
(169, 'Pakistan', 'PK', NULL, NULL, NULL, NULL, NULL),
(170, 'Palau', 'PW', NULL, NULL, NULL, NULL, NULL),
(171, 'Palestinian Territory, Occupied', 'PS', NULL, NULL, NULL, NULL, NULL),
(172, 'Panama', 'PA', NULL, NULL, NULL, NULL, NULL),
(173, 'Papua New Guinea', 'PG', NULL, NULL, NULL, NULL, NULL),
(174, 'Paraguay', 'PY', NULL, NULL, NULL, NULL, NULL),
(175, 'Peru', 'PE', NULL, NULL, NULL, NULL, NULL),
(176, 'Philippines', 'PH', NULL, NULL, NULL, NULL, NULL),
(177, 'Pitcairn Islands', 'PN', NULL, NULL, NULL, NULL, NULL),
(178, 'Poland', 'PL', NULL, NULL, NULL, NULL, NULL),
(179, 'Portugal', 'PT', NULL, NULL, NULL, NULL, NULL),
(180, 'Puerto Rico', 'PR', NULL, NULL, NULL, NULL, NULL),
(181, 'Qatar', 'QA', NULL, NULL, NULL, NULL, NULL),
(182, 'Reunion', 'RE', NULL, NULL, NULL, NULL, NULL),
(183, 'Romania', 'RO', NULL, NULL, NULL, NULL, NULL),
(184, 'Russian Federation', 'RU', NULL, NULL, NULL, NULL, NULL),
(185, 'Rwanda', 'RW', NULL, NULL, NULL, NULL, NULL),
(186, 'Saint Barthélemy', 'BL', NULL, NULL, NULL, NULL, NULL),
(187, 'Saint Helena', 'SH', NULL, NULL, NULL, NULL, NULL),
(188, 'Saint Kitts and Nevis', 'KN', NULL, NULL, NULL, NULL, NULL),
(189, 'Saint Lucia', 'LC', NULL, NULL, NULL, NULL, NULL),
(190, 'Saint Martin', 'MF', NULL, NULL, NULL, NULL, NULL),
(191, 'Saint Pierre and Miquelon', 'PM', NULL, NULL, NULL, NULL, NULL),
(192, 'Saint Vincent and the Grenadines', 'VC', NULL, NULL, NULL, NULL, NULL),
(193, 'Samoa', 'WS', NULL, NULL, NULL, NULL, NULL),
(194, 'San Marino', 'SM', NULL, NULL, NULL, NULL, NULL),
(195, 'Sao Tome and Principe', 'ST', NULL, NULL, NULL, NULL, NULL),
(196, 'Saudi Arabia', 'SA', NULL, NULL, NULL, NULL, NULL),
(197, 'Senegal', 'SN', NULL, NULL, NULL, NULL, NULL),
(198, 'Serbia', 'RS', NULL, NULL, NULL, NULL, NULL),
(199, 'Serbia and Montenegro', 'CS', NULL, NULL, NULL, NULL, NULL),
(200, 'Seychelles', 'SC', NULL, NULL, NULL, NULL, NULL),
(201, 'Sierra Leone', 'SL', NULL, NULL, NULL, NULL, NULL),
(202, 'Singapore', 'SG', NULL, NULL, NULL, NULL, NULL),
(203, 'Sint Maarten', 'SX', NULL, NULL, NULL, NULL, NULL),
(204, 'Slovakia', 'SK', NULL, NULL, NULL, NULL, NULL),
(205, 'Slovenia', 'SI', NULL, NULL, NULL, NULL, NULL),
(206, 'Solomon Islands', 'SB', NULL, NULL, NULL, NULL, NULL),
(207, 'Somalia', 'SO', NULL, NULL, NULL, NULL, NULL),
(208, 'South Africa', 'ZA', NULL, NULL, NULL, NULL, NULL),
(209, 'South Georgia and the South Sandwich Islands', 'GS', NULL, NULL, NULL, NULL, NULL),
(210, 'South Sudan', 'SS', NULL, NULL, NULL, NULL, NULL),
(211, 'Spain', 'ES', NULL, NULL, NULL, NULL, NULL),
(212, 'Sri Lanka', 'LK', NULL, NULL, NULL, NULL, NULL),
(213, 'Sudan', 'SD', NULL, NULL, NULL, NULL, NULL),
(214, 'Suriname', 'SR', NULL, NULL, NULL, NULL, NULL),
(215, 'Svalbard and Jan Mayen', 'SJ', NULL, NULL, NULL, NULL, NULL),
(216, 'Swaziland', 'SZ', NULL, NULL, NULL, NULL, NULL),
(217, 'Sweden', 'SE', NULL, NULL, NULL, NULL, NULL),
(218, 'Switzerland', 'CH', NULL, NULL, NULL, NULL, NULL),
(219, 'Syrian Arab Republic', 'SY', NULL, NULL, NULL, NULL, NULL),
(220, 'Taiwan', 'TW', NULL, NULL, NULL, NULL, NULL),
(221, 'Tajikistan', 'TJ', NULL, NULL, NULL, NULL, NULL),
(222, 'Tanzania, United Republic of', 'TZ', NULL, NULL, NULL, NULL, NULL),
(223, 'Thailand', 'TH', NULL, NULL, NULL, NULL, NULL),
(224, 'Timor-Leste', 'TL', NULL, NULL, NULL, NULL, NULL),
(225, 'Togo', 'TG', NULL, NULL, NULL, NULL, NULL),
(226, 'Tokelau', 'TK', NULL, NULL, NULL, NULL, NULL),
(227, 'Tonga', 'TO', NULL, NULL, NULL, NULL, NULL),
(228, 'Trinidad and Tobago', 'TT', NULL, NULL, NULL, NULL, NULL),
(229, 'Tunisia', 'TN', NULL, NULL, NULL, NULL, NULL),
(230, 'Turkey', 'TR', NULL, NULL, NULL, NULL, NULL),
(231, 'Turkmenistan', 'TM', NULL, NULL, NULL, NULL, NULL),
(232, 'Turks and Caicos Islands', 'TC', NULL, NULL, NULL, NULL, NULL),
(233, 'Tuvalu', 'TV', NULL, NULL, NULL, NULL, NULL),
(234, 'Uganda', 'UG', NULL, NULL, NULL, NULL, NULL),
(235, 'Ukraine', 'UA', NULL, NULL, NULL, NULL, NULL),
(236, 'United Arab Emirates', 'AE', NULL, NULL, NULL, NULL, NULL),
(237, 'United Kingdom', 'GB', NULL, NULL, NULL, NULL, NULL),
(238, 'United States', 'US', NULL, NULL, NULL, NULL, NULL),
(239, 'United States Minor Outlying Islands', 'UM', NULL, NULL, NULL, NULL, NULL),
(240, 'Uruguay', 'UY', NULL, NULL, NULL, NULL, NULL),
(241, 'Uzbekistan', 'UZ', NULL, NULL, NULL, NULL, NULL),
(242, 'Vanuatu', 'VU', NULL, NULL, NULL, NULL, NULL),
(243, 'Venezuela', 'VE', NULL, NULL, NULL, NULL, NULL),
(244, 'Vietnam', 'VN', NULL, NULL, NULL, NULL, NULL),
(245, 'Virgin Islands, British', 'VG', NULL, NULL, NULL, NULL, NULL),
(246, 'Virgin Islands, U.S.', 'VI', NULL, NULL, NULL, NULL, NULL),
(247, 'Wallis and Futuna', 'WF', NULL, NULL, NULL, NULL, NULL),
(248, 'Western Sahara', 'EH', NULL, NULL, NULL, NULL, NULL),
(249, 'Yemen', 'YE', NULL, NULL, NULL, NULL, NULL),
(250, 'Zambia', 'ZM', NULL, NULL, NULL, NULL, NULL),
(251, 'Zimbabwe', 'ZW', NULL, NULL, NULL, NULL, NULL),
(252, 'Åland Islands', 'AX', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `courts`
--

CREATE TABLE `courts` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sport_id` bigint(20) NOT NULL,
  `club_id` bigint(20) NOT NULL,
  `surface` varchar(64) DEFAULT NULL,
  `color` varchar(32) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL,
  `court_location_type` enum('indoor','outdoor') NOT NULL,
  `court_type` enum('single','double') NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `visibility` enum('public','member_only','admin_only') NOT NULL DEFAULT 'public',
  `note` text DEFAULT NULL,
  `buffer_time_between_slots` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courts`
--

INSERT INTO `courts` (`id`, `name`, `sport_id`, `club_id`, `surface`, `color`, `image`, `status`, `court_location_type`, `court_type`, `created_by`, `visibility`, `note`, `buffer_time_between_slots`, `created_at`, `updated_at`) VALUES
(2, 'Tennis', 2, 5, 'concrete', '#298029', NULL, 'active', 'indoor', 'double', 2, 'public', NULL, 60, '2025-06-14 13:14:01', '2025-06-14 13:14:01'),
(3, 'Test Court', 3, 5, 'clay', '#298030', NULL, 'inactive', 'indoor', 'double', 2, 'member_only', NULL, 90, '2025-06-14 13:15:46', '2025-06-21 14:39:05'),
(5, 'Padel Court', 2, 5, 'Grassy', '#0033ff', '/tmp/phpuvpEEO', 'active', 'indoor', 'double', 2, 'public', NULL, 60, '2025-06-16 12:27:10', '2025-06-16 12:27:10'),
(6, 'Badminton Courts', 1, 5, 'clay', '#0075ff', '/tmp/phprCycR6', 'active', 'outdoor', 'single', 2, 'public', NULL, 90, '2025-06-16 12:46:19', '2025-06-16 12:46:19'),
(7, 'aaa', 2, 90, 'Grassy', '#00ff00', NULL, 'inactive', 'indoor', 'double', 247, 'public', NULL, 30, '2025-07-14 07:28:11', '2025-07-14 07:28:11'),
(8, 'bbb', 1, 90, 'clay', '#00ff00', NULL, 'inactive', 'indoor', 'double', 247, 'public', NULL, 30, '2025-07-14 07:52:09', '2025-07-14 07:52:09'),
(9, 'ccc', 2, 90, 'Grassy', '#00ff00', NULL, 'inactive', 'outdoor', 'single', 247, 'public', NULL, 30, '2025-07-14 07:52:41', '2025-07-14 07:52:41'),
(10, 'Padel Court', 2, 117, 'Grassy', '#00ff00', NULL, 'active', 'indoor', 'double', 282, 'public', NULL, 60, '2025-07-14 12:34:00', '2025-07-14 12:34:00');

-- --------------------------------------------------------

--
-- Table structure for table `court_bookings`
--

CREATE TABLE `court_bookings` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `activity_type` enum('booking','match','tournament','training','class','event') NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `cancellation_period` int(11) DEFAULT NULL,
  `check_in_opens_before_hours` int(11) NOT NULL DEFAULT 1,
  `check_in_closes_after_hours` int(11) NOT NULL DEFAULT 1,
  `discount_codes_applied` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`discount_codes_applied`)),
  `booking_date` date NOT NULL,
  `booking_day` enum('monday','tuesday','wednesday','thursday','friday','saturday','sunday') NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `rule` text DEFAULT NULL,
  `repeat_every` int(11) NOT NULL DEFAULT 0,
  `is_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `recurrence_order` int(11) NOT NULL DEFAULT 0,
  `follow_id` bigint(20) DEFAULT NULL,
  `customize_recurrent_activity_end_datetime` datetime DEFAULT NULL,
  `info` text DEFAULT NULL,
  `is_group_booking` tinyint(1) NOT NULL DEFAULT 0,
  `group_id` bigint(20) DEFAULT NULL,
  `post_in_group_id` bigint(20) DEFAULT NULL,
  `withdrawal_lock_hours` bigint(20) DEFAULT NULL COMMENT 'Number of hours before event start when withdrawal is locked',
  `category` enum('booking','not_available','subscription','competition','other_activity','series_game_extra','facility') NOT NULL,
  `tournament_format` enum('americano','team_americano','mexicano','tournament','external') NOT NULL,
  `type` enum('single','double','private','group','course','male','female','mixed') NOT NULL,
  `class_level` enum('beginner','intermediate','expert') DEFAULT NULL,
  `is_multi_court_booking` tinyint(1) NOT NULL DEFAULT 0,
  `is_checked_terms_and_conditions` tinyint(1) NOT NULL DEFAULT 0,
  `total_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount` int(11) DEFAULT NULL,
  `price_per_person` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_status` enum('pending','paid','failed') NOT NULL DEFAULT 'pending',
  `payment_method` varchar(50) DEFAULT NULL,
  `require_player_level` tinyint(1) NOT NULL DEFAULT 0,
  `level_off_id` bigint(20) DEFAULT NULL,
  `level_to_id` bigint(20) DEFAULT NULL,
  `automatic_cancellation` tinyint(1) NOT NULL DEFAULT 0,
  `auto_cancel_if_dhc` int(11) NOT NULL DEFAULT 0,
  `auto_cancel_if_dpnr` int(11) NOT NULL DEFAULT 0,
  `get_feedback` tinyint(1) NOT NULL DEFAULT 0,
  `hide_training_from_app` tinyint(1) NOT NULL DEFAULT 0,
  `participant_limit` int(11) DEFAULT NULL,
  `no_of_points` int(11) DEFAULT NULL,
  `is_private_tournament` tinyint(1) NOT NULL DEFAULT 0,
  `open` tinyint(1) DEFAULT NULL,
  `booking_status` enum('active','pending','cancelled','completed') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `court_bookings`
--

INSERT INTO `court_bookings` (`id`, `title`, `activity_type`, `created_by`, `cancellation_period`, `check_in_opens_before_hours`, `check_in_closes_after_hours`, `discount_codes_applied`, `booking_date`, `booking_day`, `start_time`, `end_time`, `rule`, `repeat_every`, `is_recurring`, `recurrence_order`, `follow_id`, `customize_recurrent_activity_end_datetime`, `info`, `is_group_booking`, `group_id`, `post_in_group_id`, `withdrawal_lock_hours`, `category`, `tournament_format`, `type`, `class_level`, `is_multi_court_booking`, `is_checked_terms_and_conditions`, `total_price`, `discount`, `price_per_person`, `payment_status`, `payment_method`, `require_player_level`, `level_off_id`, `level_to_id`, `automatic_cancellation`, `auto_cancel_if_dhc`, `auto_cancel_if_dpnr`, `get_feedback`, `hide_training_from_app`, `participant_limit`, `no_of_points`, `is_private_tournament`, `open`, `booking_status`, `created_at`, `updated_at`) VALUES
(1, 'This is my title for this', 'booking', 2, 2, 0, 0, NULL, '2025-06-17', 'tuesday', '02:30:31', '06:30:31', NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1200.00, 0, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-15 15:49:50', '2025-06-15 15:49:50'),
(2, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-06-23', 'monday', '02:30:52', '07:30:52', NULL, 1, 1, 0, NULL, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(3, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-06-24', 'tuesday', '02:30:52', '07:30:52', NULL, 1, 1, 1, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(4, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-06-25', 'wednesday', '02:30:52', '07:30:52', NULL, 1, 1, 2, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(5, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-06-30', 'monday', '02:30:52', '07:30:52', NULL, 1, 1, 3, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(6, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-07-01', 'tuesday', '02:30:52', '07:30:52', NULL, 1, 1, 4, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(7, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-07-02', 'wednesday', '02:30:52', '07:30:52', NULL, 1, 1, 5, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(8, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-07-07', 'monday', '02:30:52', '07:30:52', NULL, 1, 1, 6, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(9, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-07-08', 'tuesday', '02:30:52', '07:30:52', NULL, 1, 1, 7, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(10, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-07-09', 'wednesday', '02:30:52', '07:30:52', NULL, 1, 1, 8, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(11, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-07-14', 'monday', '02:30:52', '07:30:52', NULL, 1, 1, 9, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(12, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-07-15', 'tuesday', '02:30:52', '07:30:52', NULL, 1, 1, 10, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(13, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-07-16', 'wednesday', '02:30:52', '07:30:52', NULL, 1, 1, 11, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(14, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-07-21', 'monday', '02:30:52', '07:30:52', NULL, 1, 1, 12, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(15, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-07-22', 'tuesday', '02:30:52', '07:30:52', NULL, 1, 1, 13, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(16, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-07-23', 'wednesday', '02:30:52', '07:30:52', NULL, 1, 1, 14, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(17, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-07-28', 'monday', '02:30:52', '07:30:52', NULL, 1, 1, 15, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(18, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-07-29', 'tuesday', '02:30:52', '07:30:52', NULL, 1, 1, 16, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(19, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-07-30', 'wednesday', '02:30:52', '07:30:52', NULL, 1, 1, 17, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(20, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-08-04', 'monday', '02:30:52', '07:30:52', NULL, 1, 1, 18, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(21, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-08-05', 'tuesday', '02:30:52', '07:30:52', NULL, 1, 1, 19, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(22, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-08-06', 'wednesday', '02:30:52', '07:30:52', NULL, 1, 1, 20, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(23, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-08-11', 'monday', '02:30:52', '07:30:52', NULL, 1, 1, 21, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(24, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-08-12', 'tuesday', '02:30:52', '07:30:52', NULL, 1, 1, 22, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(25, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-08-13', 'wednesday', '02:30:52', '07:30:52', NULL, 1, 1, 23, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(26, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-08-18', 'monday', '02:30:52', '07:30:52', NULL, 1, 1, 24, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(27, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-08-19', 'tuesday', '02:30:52', '07:30:52', NULL, 1, 1, 25, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(28, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-08-20', 'wednesday', '02:30:52', '07:30:52', NULL, 1, 1, 26, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(29, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-08-25', 'monday', '02:30:52', '07:30:52', NULL, 1, 1, 27, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(30, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-08-26', 'tuesday', '02:30:52', '07:30:52', NULL, 1, 1, 28, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(31, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-08-27', 'wednesday', '02:30:52', '07:30:52', NULL, 1, 1, 29, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(32, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-09-01', 'monday', '02:30:52', '07:30:52', NULL, 1, 1, 30, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(33, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-09-02', 'tuesday', '02:30:52', '07:30:52', NULL, 1, 1, 31, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(34, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-09-03', 'wednesday', '02:30:52', '07:30:52', NULL, 1, 1, 32, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(35, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-09-08', 'monday', '02:30:52', '07:30:52', NULL, 1, 1, 33, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(36, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-09-09', 'tuesday', '02:30:52', '07:30:52', NULL, 1, 1, 34, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(37, '1300', 'booking', 2, 0, 0, 0, NULL, '2025-09-10', 'wednesday', '02:30:52', '07:30:52', NULL, 1, 1, 35, 2, '2025-09-09 07:30:52', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1300.00, 25, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-16 07:37:19', '2025-06-16 07:37:19'),
(38, 'This is my title', 'booking', 2, 0, 0, 0, '[\"1300\"]', '2025-06-23', 'monday', '05:30:17', '08:30:17', NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 1200.00, 0, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-20 06:23:26', '2025-06-20 06:23:26'),
(39, 'Thisis my title', 'booking', 2, 0, 0, 0, NULL, '2025-06-23', 'monday', '03:00:43', '07:00:43', NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 11300.00, 0, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-20 06:31:51', '2025-06-20 06:31:51'),
(40, 'ASDFG', 'booking', 2, 2, 0, 0, NULL, '2025-06-24', 'tuesday', '03:00:45', '07:00:45', NULL, 1, 1, 0, NULL, '2025-06-25 07:00:45', NULL, 0, NULL, NULL, NULL, 'booking', 'americano', 'single', NULL, 0, 0, 3454.00, 0, 0.00, 'pending', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 'active', '2025-06-20 07:58:41', '2025-06-20 07:58:41');

-- --------------------------------------------------------

--
-- Table structure for table `court_booking_banners`
--

CREATE TABLE `court_booking_banners` (
  `id` bigint(20) NOT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `booking_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `court_booking_courts`
--

CREATE TABLE `court_booking_courts` (
  `id` bigint(20) NOT NULL,
  `booking_id` bigint(20) NOT NULL,
  `court_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `court_booking_courts`
--

INSERT INTO `court_booking_courts` (`id`, `booking_id`, `court_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, NULL),
(2, 2, 2, NULL, NULL),
(3, 3, 2, NULL, NULL),
(4, 4, 2, NULL, NULL),
(5, 5, 2, NULL, NULL),
(6, 6, 2, NULL, NULL),
(7, 7, 2, NULL, NULL),
(8, 8, 2, NULL, NULL),
(9, 9, 2, NULL, NULL),
(10, 10, 2, NULL, NULL),
(11, 11, 2, NULL, NULL),
(12, 12, 2, NULL, NULL),
(13, 13, 2, NULL, NULL),
(14, 14, 2, NULL, NULL),
(15, 15, 2, NULL, NULL),
(16, 16, 2, NULL, NULL),
(17, 17, 2, NULL, NULL),
(18, 18, 2, NULL, NULL),
(19, 19, 2, NULL, NULL),
(20, 20, 2, NULL, NULL),
(21, 21, 2, NULL, NULL),
(22, 22, 2, NULL, NULL),
(23, 23, 2, NULL, NULL),
(24, 24, 2, NULL, NULL),
(25, 25, 2, NULL, NULL),
(26, 26, 2, NULL, NULL),
(27, 27, 2, NULL, NULL),
(28, 28, 2, NULL, NULL),
(29, 29, 2, NULL, NULL),
(30, 30, 2, NULL, NULL),
(31, 31, 2, NULL, NULL),
(32, 32, 2, NULL, NULL),
(33, 33, 2, NULL, NULL),
(34, 34, 2, NULL, NULL),
(35, 35, 2, NULL, NULL),
(36, 36, 2, NULL, NULL),
(37, 37, 2, NULL, NULL),
(38, 38, 3, NULL, NULL),
(39, 39, 5, NULL, NULL),
(40, 40, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `court_booking_descriptions`
--

CREATE TABLE `court_booking_descriptions` (
  `id` bigint(20) NOT NULL,
  `club_id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `court_booking_descriptions`
--

INSERT INTO `court_booking_descriptions` (`id`, `club_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Test Title', 'This is my descprition for saving this', '2025-06-15 15:33:06', '2025-06-15 15:33:06');

-- --------------------------------------------------------

--
-- Table structure for table `court_booking_templates`
--

CREATE TABLE `court_booking_templates` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `court_slot_durations`
--

CREATE TABLE `court_slot_durations` (
  `id` bigint(20) NOT NULL,
  `court_id` bigint(20) NOT NULL,
  `duration` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `court_slot_durations`
--

INSERT INTO `court_slot_durations` (`id`, `court_id`, `duration`, `created_at`, `updated_at`) VALUES
(4, 2, 30, NULL, NULL),
(5, 2, 20, NULL, NULL),
(6, 2, 21, NULL, NULL),
(16, 5, 60, NULL, NULL),
(17, 5, 180, NULL, NULL),
(18, 5, 300, NULL, NULL),
(19, 6, 60, NULL, NULL),
(20, 6, 150, NULL, NULL),
(21, 6, 240, NULL, NULL),
(22, 3, 30, NULL, NULL),
(23, 3, 22, NULL, NULL),
(24, 3, 20, NULL, NULL),
(25, 7, 60, NULL, NULL),
(26, 7, 90, NULL, NULL),
(27, 8, 60, NULL, NULL),
(28, 8, 90, NULL, NULL),
(29, 8, 120, NULL, NULL),
(30, 9, 60, NULL, NULL),
(31, 9, 90, NULL, NULL),
(32, 9, 120, NULL, NULL),
(33, 9, 150, NULL, NULL),
(34, 10, 60, NULL, NULL),
(35, 10, 180, NULL, NULL),
(36, 10, 300, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(5) DEFAULT NULL,
  `symbol_right` varchar(5) DEFAULT NULL,
  `decimal_place` tinyint(4) NOT NULL DEFAULT 2,
  `value` decimal(15,6) NOT NULL DEFAULT 1.000000,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `date_modified` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `is_default`, `date_modified`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', 'USD', '$', '', 2, 1.000000, 1, 1, '2025-06-13 07:36:30', NULL, NULL),
(2, 'Pound Sterling', 'GBP', 'Â£', '', 2, 0.612500, 1, 0, '2025-06-13 07:36:30', NULL, NULL),
(3, 'Euro', 'EUR', 'â‚¬', '', 2, 0.784600, 1, 0, '2025-06-13 07:36:30', NULL, NULL),
(4, 'Hong Kong Dollar', 'HKD', 'HK$', '', 2, 7.822240, 1, 0, '2025-06-13 07:36:30', NULL, NULL),
(5, 'Indian Rupee', 'INR', 'â‚¹', '', 2, 64.400000, 1, 0, '2025-06-13 07:36:30', NULL, NULL),
(6, 'Russian Ruble', 'RUB', 'â‚½', '', 2, 56.403600, 1, 0, '2025-06-13 07:36:30', NULL, NULL),
(7, 'Chinese Yuan Renminbi', 'CNY', 'Â¥', '', 2, 6.345100, 1, 0, '2025-06-13 07:36:30', NULL, NULL),
(8, 'Australian Dollar', 'AUD', '$', '', 2, 1.265440, 1, 0, '2025-06-13 07:36:30', NULL, NULL),
(9, 'updatedCurrency', '12', '$', NULL, 2, 12.000000, 0, 0, '2025-06-24 19:15:08', '2025-06-16 07:22:43', '2025-06-24 19:15:08');

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, '', 'contenttypes', 'contenttype'),
(2, '', 'admin', 'logentry'),
(3, '', 'auth', 'permission'),
(4, '', 'auth', 'group'),
(5, '', 'auth', 'user'),
(6, '', 'sessions', 'session'),
(7, '', 'authtoken', 'token'),
(8, '', 'authtoken', 'tokenproxy'),
(9, '', 'laravel_models', 'agegroups'),
(10, '', 'laravel_models', 'authgroup'),
(11, '', 'laravel_models', 'authgrouppermissions'),
(12, '', 'laravel_models', 'authpermission'),
(13, '', 'laravel_models', 'authtokentoken'),
(14, '', 'laravel_models', 'authuser'),
(15, '', 'laravel_models', 'authusergroups'),
(16, '', 'laravel_models', 'authuseruserpermissions'),
(17, '', 'laravel_models', 'availabilitydaycourts'),
(18, '', 'laravel_models', 'availabilitydaydurations'),
(19, '', 'laravel_models', 'availabilitydayintervals'),
(20, '', 'laravel_models', 'availabilitydays'),
(21, '', 'laravel_models', 'cache'),
(22, '', 'laravel_models', 'cachelocks'),
(23, '', 'laravel_models', 'categorygroup'),
(24, '', 'laravel_models', 'clubbannerimages'),
(25, '', 'laravel_models', 'clubbranches'),
(26, '', 'laravel_models', 'clubcheckinsettings'),
(27, '', 'laravel_models', 'clubcourtconfigurations'),
(28, '', 'laravel_models', 'clubcurrency'),
(29, '', 'laravel_models', 'clublatestactivities'),
(30, '', 'laravel_models', 'clublevelsystems'),
(31, '', 'laravel_models', 'clubopeninghours'),
(32, '', 'laravel_models', 'clubs'),
(33, '', 'laravel_models', 'clubsadditionalinformation'),
(34, '', 'laravel_models', 'clubsportcourts'),
(35, '', 'laravel_models', 'clubsports'),
(36, '', 'laravel_models', 'coaches'),
(37, '', 'laravel_models', 'countries'),
(38, '', 'laravel_models', 'courtbookingbanners'),
(39, '', 'laravel_models', 'courtbookingcourts'),
(40, '', 'laravel_models', 'courtbookingdescriptions'),
(41, '', 'laravel_models', 'courtbookings'),
(42, '', 'laravel_models', 'courtbookingtemplates'),
(43, '', 'laravel_models', 'courts'),
(44, '', 'laravel_models', 'courtslotdurations'),
(45, '', 'laravel_models', 'currencies'),
(46, '', 'laravel_models', 'failedjobs'),
(47, '', 'laravel_models', 'groupcategories'),
(48, '', 'laravel_models', 'groups'),
(49, '', 'laravel_models', 'jobbatches'),
(50, '', 'laravel_models', 'jobs'),
(51, '', 'laravel_models', 'levels'),
(52, '', 'laravel_models', 'migrations'),
(53, '', 'laravel_models', 'modelhaspermissions'),
(54, '', 'laravel_models', 'modelhasroles'),
(55, '', 'laravel_models', 'oauthaccesstokens'),
(56, '', 'laravel_models', 'oauthauthcodes'),
(57, '', 'laravel_models', 'oauthclients'),
(58, '', 'laravel_models', 'oauthpersonalaccessclients'),
(59, '', 'laravel_models', 'oauthrefreshtokens'),
(60, '', 'laravel_models', 'permissions'),
(61, '', 'laravel_models', 'players'),
(62, '', 'laravel_models', 'playersportlevels'),
(63, '', 'laravel_models', 'questionnaireresponses'),
(64, '', 'laravel_models', 'questionnaires'),
(65, '', 'laravel_models', 'rolehaspermissions'),
(66, '', 'laravel_models', 'roles'),
(67, '', 'laravel_models', 'specialties'),
(68, '', 'laravel_models', 'sports'),
(69, '', 'laravel_models', 'timezones'),
(70, '', 'laravel_models', 'useravailabilities'),
(71, '', 'laravel_models', 'useravailabilitydaydurationprices'),
(72, '', 'laravel_models', 'users'),
(73, '', 'laravel_models', 'userspecialties'),
(74, '', 'laravel_models', 'usersports'),
(75, '', 'chat', 'community'),
(76, '', 'chat', 'communitypost'),
(77, '', 'chat', 'marketplaceitem'),
(78, '', 'chat', 'communitymessage'),
(79, '', 'chat', 'communitymembership'),
(80, '', 'chat', 'communityfavorite'),
(81, '', 'chat', 'activitymessage'),
(82, '', 'chat', 'userfollower'),
(83, '', 'chat', 'postlike'),
(84, '', 'chat', 'postcomment'),
(85, '', 'chat', 'message'),
(86, '', 'chat', 'marketplacemessage'),
(87, '', 'chat', 'communityreport');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(25, 'laravel_models', '0001_initial', '2025-07-18 11:42:46.122753'),
(26, 'chat', '0001_initial', '2025-07-18 11:43:12.230311'),
(27, 'chat', '0002_customtoken', '2025-07-22 11:56:14.497549');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) NOT NULL,
  `club_id` bigint(20) DEFAULT NULL,
  `sport_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `information` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `max_members` int(10) DEFAULT NULL,
  `age_group_id` bigint(20) DEFAULT NULL,
  `gender_restriction` enum('male','female','other') NOT NULL DEFAULT 'male',
  `timezone` varchar(255) DEFAULT NULL,
  `visibility` enum('public','private') NOT NULL DEFAULT 'public',
  `hidden_in_feeds` tinyint(1) NOT NULL DEFAULT 0,
  `is_approval_required` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `club_id`, `sport_id`, `name`, `information`, `image`, `max_members`, `age_group_id`, `gender_restriction`, `timezone`, `visibility`, `hidden_in_feeds`, `is_approval_required`, `created_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 3, 'Kamal Glass', 'Pariatur Doloribus', NULL, 100, NULL, 'male', NULL, 'public', 0, 0, 2, 'active', '2025-07-02 12:02:41', '2025-07-02 12:02:41'),
(2, 5, 3, 'Sport Group', 'This is my information', NULL, 7, NULL, 'male', NULL, 'public', 1, 0, 2, 'active', '2025-07-15 06:26:05', '2025-07-15 06:26:05');

-- --------------------------------------------------------

--
-- Table structure for table `group_categories`
--

CREATE TABLE `group_categories` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_categories`
--

INSERT INTO `group_categories` (`id`, `name`, `slug`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Matches', 'matches', 'Talk and organize matches with the community.', 1, NULL, NULL),
(2, 'Tournaments', 'tournaments', 'All things related to tournaments and competitions.', 1, NULL, NULL),
(3, 'Trainings', 'trainings', 'Share or find training sessions and tips.', 1, NULL, NULL),
(4, 'Gadget talk', 'gadget-talk', 'Discuss equipment, gear, and new gadgets.', 1, NULL, NULL),
(5, 'Tips & Tricks', 'tips-tricks', 'Helpful hints and techniques for better gameplay.', 1, NULL, NULL),
(6, 'Technique tips', 'technique-tips', 'Improve your skills with focused technique advice.', 1, NULL, NULL),
(7, 'Buy & sell', 'buy-sell', 'Marketplace for community members.', 1, NULL, NULL),
(8, 'Discussion forum', 'discussion-forum', 'General community discussions and social talk.', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) NOT NULL,
  `reserved_at` int(10) DEFAULT NULL,
  `available_at` int(10) NOT NULL,
  `created_at` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `name`, `value`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Beginner', 1.00, 'qwertyui', NULL, '2025-07-06 15:20:28'),
(2, 'TWO', 2.00, NULL, NULL, NULL),
(3, 'THREE', 3.00, NULL, NULL, '2025-06-25 10:10:53'),
(4, 'FOUR', 4.00, NULL, NULL, NULL),
(5, 'FIVE', 5.50, 'This is my five description', NULL, '2025-06-24 10:47:38'),
(6, 'SIX', 3.50, 'This is my description', NULL, '2025-06-25 10:09:32'),
(7, 'SEVEN', 7.00, NULL, NULL, NULL),
(8, 'EIGHT', 8.00, NULL, NULL, NULL),
(9, 'NINE', 9.00, NULL, NULL, NULL),
(10, 'TEN', 10.00, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `marketplace_items`
--

CREATE TABLE `marketplace_items` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marketplace_items`
--

INSERT INTO `marketplace_items` (`id`, `title`, `description`, `price`, `image`, `created_at`) VALUES
(1, 'Tennis Racket', 'Brand new', NULL, NULL, '2025-07-18 12:20:43.627058');

-- --------------------------------------------------------

--
-- Table structure for table `marketplace_messages`
--

CREATE TABLE `marketplace_messages` (
  `id` bigint(20) NOT NULL,
  `content` longtext NOT NULL,
  `file` varchar(100) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `receiver_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) NOT NULL,
  `content` longtext NOT NULL,
  `file` varchar(100) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `receiver_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `content`, `file`, `timestamp`, `is_read`, `receiver_id`, `sender_id`) VALUES
(1, 'Hi there!', '', '2025-07-18 12:14:41.705362', 0, 1, 1),
(2, 'how are you', '', '2025-07-18 12:15:02.959563', 1, 1, 1),
(3, 'where are you', '', '2025-07-18 12:16:21.071926', 0, 1, 1),
(4, 'Hi there!', '', '2025-07-21 12:55:31.563491', 0, 54, 1),
(5, 'where are you', '', '2025-07-21 12:59:49.988783', 0, 54, 1),
(6, 'Hello world@', '', '2025-07-21 13:36:16.703816', 0, 54, 263),
(7, 'Hello world@', '', '2025-07-21 13:36:17.833499', 0, 54, 263),
(8, 'Hello world@', '', '2025-07-21 13:36:18.472606', 0, 54, 263),
(9, 'Hello world@', '', '2025-07-21 13:36:18.498597', 0, 54, 263),
(10, 'Hello world@', '', '2025-07-21 13:36:18.897345', 0, 54, 263),
(11, 'Hello world@', '', '2025-07-21 13:36:18.981037', 0, 54, 263),
(12, 'Hello world@', '', '2025-07-21 13:36:20.703923', 0, 54, 263),
(13, 'Hello world@', '', '2025-07-21 13:36:21.880706', 0, 54, 263),
(14, 'Hello world@', '', '2025-07-21 13:36:22.373820', 0, 54, 263),
(15, 'Hello world@', '', '2025-07-21 13:36:22.385393', 0, 54, 263),
(16, 'Hello world', '', '2025-07-21 13:36:37.044710', 0, 54, 263),
(17, 'Another', '', '2025-07-21 13:36:48.912183', 0, 54, 263),
(18, 'NewOne', '', '2025-07-21 13:37:00.058848', 0, 54, 263),
(19, 'Hello', '', '2025-07-21 13:38:45.133007', 0, 54, 1),
(20, 'Hello', '', '2025-07-21 13:39:02.952459', 0, 54, 1),
(21, 'Hello', '', '2025-07-21 13:39:13.009388', 0, 54, 1),
(22, 'where are you', '', '2025-07-21 13:39:57.798289', 0, 54, 1),
(23, 'Helloo kdr ho bhai', '', '2025-07-21 13:52:20.518648', 0, 54, 263),
(24, 'Hello', '', '2025-07-21 13:54:38.325034', 0, 46, 263),
(25, 'hi how are you', '', '2025-07-21 14:22:37.295163', 0, 54, 1),
(26, 'hi how are you', '', '2025-07-21 14:42:26.882675', 0, 55, 263),
(27, 'Hello', '', '2025-07-21 14:47:58.668831', 0, 54, 263),
(28, 'Hello', '', '2025-07-21 14:59:34.769635', 0, 55, 263),
(29, 'Hello', '', '2025-07-21 15:03:41.797429', 0, 46, 263),
(30, 'Hekki', '', '2025-07-21 15:05:21.162680', 0, 46, 263),
(31, 'Hello', '', '2025-07-21 15:08:54.494229', 0, 59, 263),
(32, 'Helo', '', '2025-07-21 15:10:37.747534', 0, 59, 263),
(33, 'hi hello again', '', '2025-07-21 15:11:00.021124', 0, 59, 263),
(34, 'zasdkjg', '', '2025-07-21 15:20:59.062576', 0, 59, 263),
(35, 'hi hello world', '', '2025-07-21 15:27:24.772085', 0, 54, 263),
(36, 'Hy', '', '2025-07-22 05:52:47.354402', 0, 46, 263),
(37, 'Hy', '', '2025-07-22 05:56:07.758754', 0, 46, 263),
(38, 'Hy', '', '2025-07-22 06:01:40.148222', 0, 46, 263),
(39, 'Hy', '', '2025-07-22 06:01:42.044221', 0, 46, 263),
(40, 'Hello', '', '2025-07-22 06:04:49.593679', 0, 46, 263),
(41, 'Koi issue aa rha ha', '', '2025-07-22 06:05:50.312328', 0, 46, 263),
(42, 'Hy', '', '2025-07-22 06:09:42.441609', 0, 46, 263),
(43, 'Hello', '', '2025-07-22 08:21:18.135843', 0, 54, 263),
(44, 'Hello', '', '2025-07-22 08:39:36.830745', 0, 46, 263),
(45, 'Hello', '', '2025-07-22 08:41:49.472334', 0, 46, 263),
(46, 'Hello', '', '2025-07-22 08:45:11.766961', 0, 46, 263),
(47, 'hi how are you', '', '2025-07-22 08:47:36.514676', 0, 46, 263),
(48, 'Han g kese ho', '', '2025-07-22 10:36:29.719224', 0, 54, 263),
(49, 'Han g', '', '2025-07-22 10:52:09.080708', 0, 54, 263),
(50, 'Han g', '', '2025-07-22 10:52:20.524168', 0, 54, 263),
(51, 'bhai my name is basim', '', '2025-07-22 10:52:50.765628', 0, 54, 263);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_03_03_064536_create_oauth_auth_codes_table', 1),
(5, '2025_03_03_064537_create_oauth_access_tokens_table', 1),
(6, '2025_03_03_064538_create_oauth_refresh_tokens_table', 1),
(7, '2025_03_03_064539_create_oauth_clients_table', 1),
(8, '2025_03_03_064540_create_oauth_personal_access_clients_table', 1),
(9, '2025_03_13_072217_create_permission_tables', 1),
(10, '2025_03_18_074957_create_age_groups_table', 1),
(11, '2025_03_18_075124_create_currencies_table', 1),
(12, '2025_03_18_080152_create_sports_table', 1),
(13, '2025_03_18_083205_create_levels_table', 1),
(14, '2025_03_18_112619_create_specialties_table', 1),
(15, '2025_03_18_131332_create_questionnaires_table', 1),
(16, '2025_03_18_140059_create_group_categories_table', 1),
(17, '2025_03_18_161807_create_questionnaire_responses_table', 1),
(18, '2025_03_19_062708_create_clubs_table', 1),
(19, '2025_03_19_074940_create_clubs_additional_information', 1),
(20, '2025_03_19_081818_create_club_sports_table', 1),
(21, '2025_03_24_113216_create_club_check_in_settings_table', 1),
(22, '2025_03_25_081850_create_club_banner_images_table', 1),
(23, '2025_03_25_092007_club_level_systems', 1),
(24, '2025_03_25_101049_create_club_opening_hours_table', 1),
(25, '2025_03_25_135710_create_groups_table', 1),
(26, '2025_03_26_080109_create_courts_table', 1),
(27, '2025_03_26_092235_create_court_bookings_table', 1),
(28, '2025_03_26_111454_create_court_booking_courts_table', 1),
(29, '2025_03_26_120138_create_court_slot_durations_table', 1),
(30, '2025_03_26_135312_create_court_booking_banners_table', 1),
(31, '2025_03_27_100211_create_court_booking_descriptions_table', 1),
(32, '2025_04_08_124904_create_coaches_table', 1),
(33, '2025_04_11_140923_create_category_group_table', 1),
(34, '2025_04_13_152834_create_players_table', 1),
(35, '2025_04_15_120211_create_player_sport_levels_table', 1),
(36, '2025_05_07_135116_create_court_booking_templates_table', 1),
(37, '2025_05_20_142035_create_user_availabilities_table', 1),
(38, '2025_05_20_145854_create_user_specialties_table', 1),
(39, '2025_05_27_135519_create_user_sports_table', 1),
(40, '2025_06_03_201716_create_availability_days_table', 1),
(41, '2025_06_04_175745_create_availability_day_courts_table', 1),
(42, '2025_06_04_190325_create_availability_day_intervals_table', 1),
(43, '2025_06_04_191241_create_availability_day_durations_table', 1),
(44, '2025_06_04_205229_create_user_availability_day_duration_prices_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 40),
(1, 'App\\Models\\User', 136),
(1, 'App\\Models\\User', 138),
(1, 'App\\Models\\User', 139),
(1, 'App\\Models\\User', 145),
(1, 'App\\Models\\User', 151),
(1, 'App\\Models\\User', 152),
(1, 'App\\Models\\User', 153),
(1, 'App\\Models\\User', 154),
(1, 'App\\Models\\User', 155),
(1, 'App\\Models\\User', 156),
(1, 'App\\Models\\User', 157),
(1, 'App\\Models\\User', 161),
(1, 'App\\Models\\User', 165),
(1, 'App\\Models\\User', 194),
(1, 'App\\Models\\User', 200),
(1, 'App\\Models\\User', 202),
(1, 'App\\Models\\User', 242),
(1, 'App\\Models\\User', 245),
(1, 'App\\Models\\User', 247),
(1, 'App\\Models\\User', 262),
(1, 'App\\Models\\User', 263),
(1, 'App\\Models\\User', 265),
(1, 'App\\Models\\User', 266),
(1, 'App\\Models\\User', 267),
(1, 'App\\Models\\User', 269),
(1, 'App\\Models\\User', 270),
(1, 'App\\Models\\User', 271),
(1, 'App\\Models\\User', 272),
(1, 'App\\Models\\User', 273),
(1, 'App\\Models\\User', 274),
(1, 'App\\Models\\User', 275),
(1, 'App\\Models\\User', 283),
(2, 'App\\Models\\User', 40),
(2, 'App\\Models\\User', 136),
(2, 'App\\Models\\User', 138),
(2, 'App\\Models\\User', 139),
(2, 'App\\Models\\User', 145),
(2, 'App\\Models\\User', 151),
(2, 'App\\Models\\User', 161),
(2, 'App\\Models\\User', 165),
(2, 'App\\Models\\User', 194),
(2, 'App\\Models\\User', 200),
(2, 'App\\Models\\User', 202),
(2, 'App\\Models\\User', 242),
(2, 'App\\Models\\User', 245),
(2, 'App\\Models\\User', 247),
(2, 'App\\Models\\User', 262),
(2, 'App\\Models\\User', 263),
(2, 'App\\Models\\User', 265),
(2, 'App\\Models\\User', 266),
(2, 'App\\Models\\User', 267),
(2, 'App\\Models\\User', 269),
(2, 'App\\Models\\User', 270),
(2, 'App\\Models\\User', 271),
(2, 'App\\Models\\User', 272),
(2, 'App\\Models\\User', 273),
(2, 'App\\Models\\User', 274),
(2, 'App\\Models\\User', 275),
(3, 'App\\Models\\User', 40),
(3, 'App\\Models\\User', 149),
(3, 'App\\Models\\User', 152),
(3, 'App\\Models\\User', 153),
(3, 'App\\Models\\User', 154),
(3, 'App\\Models\\User', 155),
(3, 'App\\Models\\User', 156),
(3, 'App\\Models\\User', 157),
(3, 'App\\Models\\User', 163),
(3, 'App\\Models\\User', 183),
(3, 'App\\Models\\User', 197),
(3, 'App\\Models\\User', 198),
(3, 'App\\Models\\User', 199),
(3, 'App\\Models\\User', 244),
(3, 'App\\Models\\User', 246),
(3, 'App\\Models\\User', 247),
(3, 'App\\Models\\User', 263),
(3, 'App\\Models\\User', 283),
(3, 'App\\Models\\User', 288),
(4, 'App\\Models\\User', 40),
(4, 'App\\Models\\User', 150),
(4, 'App\\Models\\User', 156),
(4, 'App\\Models\\User', 157),
(4, 'App\\Models\\User', 163),
(4, 'App\\Models\\User', 197),
(4, 'App\\Models\\User', 198),
(4, 'App\\Models\\User', 247),
(4, 'App\\Models\\User', 263),
(4, 'App\\Models\\User', 288),
(5, 'App\\Models\\User', 40),
(5, 'App\\Models\\User', 150),
(5, 'App\\Models\\User', 153),
(5, 'App\\Models\\User', 154),
(5, 'App\\Models\\User', 155),
(5, 'App\\Models\\User', 156),
(5, 'App\\Models\\User', 157),
(5, 'App\\Models\\User', 163),
(5, 'App\\Models\\User', 197),
(5, 'App\\Models\\User', 198),
(5, 'App\\Models\\User', 199),
(5, 'App\\Models\\User', 243),
(5, 'App\\Models\\User', 246),
(5, 'App\\Models\\User', 247),
(5, 'App\\Models\\User', 263),
(5, 'App\\Models\\User', 283),
(5, 'App\\Models\\User', 284),
(5, 'App\\Models\\User', 288),
(6, 'App\\Models\\User', 40),
(6, 'App\\Models\\User', 145),
(6, 'App\\Models\\User', 149),
(6, 'App\\Models\\User', 150),
(6, 'App\\Models\\User', 151),
(6, 'App\\Models\\User', 152),
(6, 'App\\Models\\User', 153),
(6, 'App\\Models\\User', 155),
(6, 'App\\Models\\User', 156),
(6, 'App\\Models\\User', 157),
(6, 'App\\Models\\User', 161),
(6, 'App\\Models\\User', 165),
(6, 'App\\Models\\User', 194),
(6, 'App\\Models\\User', 198),
(6, 'App\\Models\\User', 199),
(6, 'App\\Models\\User', 200),
(6, 'App\\Models\\User', 202),
(6, 'App\\Models\\User', 242),
(6, 'App\\Models\\User', 243),
(6, 'App\\Models\\User', 244),
(6, 'App\\Models\\User', 245),
(6, 'App\\Models\\User', 246),
(6, 'App\\Models\\User', 247),
(6, 'App\\Models\\User', 262),
(6, 'App\\Models\\User', 263),
(6, 'App\\Models\\User', 265),
(6, 'App\\Models\\User', 266),
(6, 'App\\Models\\User', 267),
(6, 'App\\Models\\User', 269),
(6, 'App\\Models\\User', 270),
(6, 'App\\Models\\User', 271),
(6, 'App\\Models\\User', 272),
(6, 'App\\Models\\User', 273),
(6, 'App\\Models\\User', 274),
(6, 'App\\Models\\User', 275),
(6, 'App\\Models\\User', 284),
(6, 'App\\Models\\User', 288),
(7, 'App\\Models\\User', 40),
(7, 'App\\Models\\User', 149),
(7, 'App\\Models\\User', 152),
(7, 'App\\Models\\User', 154),
(7, 'App\\Models\\User', 155),
(7, 'App\\Models\\User', 156),
(7, 'App\\Models\\User', 157),
(7, 'App\\Models\\User', 163),
(7, 'App\\Models\\User', 183),
(7, 'App\\Models\\User', 197),
(7, 'App\\Models\\User', 198),
(7, 'App\\Models\\User', 199),
(7, 'App\\Models\\User', 246),
(7, 'App\\Models\\User', 247),
(7, 'App\\Models\\User', 263),
(7, 'App\\Models\\User', 283),
(13, 'App\\Models\\User', 247),
(13, 'App\\Models\\User', 263),
(14, 'App\\Models\\User', 2),
(14, 'App\\Models\\User', 247),
(14, 'App\\Models\\User', 263),
(17, 'App\\Models\\User', 247),
(17, 'App\\Models\\User', 263),
(18, 'App\\Models\\User', 247),
(18, 'App\\Models\\User', 263),
(19, 'App\\Models\\User', 247),
(19, 'App\\Models\\User', 263),
(20, 'App\\Models\\User', 247),
(20, 'App\\Models\\User', 263),
(21, 'App\\Models\\User', 247),
(21, 'App\\Models\\User', 263);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(6, 'App\\Models\\User', 2),
(6, 'App\\Models\\User', 6),
(6, 'App\\Models\\User', 7),
(6, 'App\\Models\\User', 8),
(6, 'App\\Models\\User', 9),
(6, 'App\\Models\\User', 10),
(6, 'App\\Models\\User', 11),
(6, 'App\\Models\\User', 12),
(6, 'App\\Models\\User', 13),
(6, 'App\\Models\\User', 14),
(6, 'App\\Models\\User', 15),
(6, 'App\\Models\\User', 16),
(6, 'App\\Models\\User', 21),
(6, 'App\\Models\\User', 22),
(6, 'App\\Models\\User', 23),
(6, 'App\\Models\\User', 24),
(6, 'App\\Models\\User', 25),
(6, 'App\\Models\\User', 26),
(6, 'App\\Models\\User', 27),
(6, 'App\\Models\\User', 28),
(6, 'App\\Models\\User', 29),
(6, 'App\\Models\\User', 30),
(6, 'App\\Models\\User', 31),
(6, 'App\\Models\\User', 32),
(6, 'App\\Models\\User', 99),
(6, 'App\\Models\\User', 101),
(6, 'App\\Models\\User', 111),
(6, 'App\\Models\\User', 112),
(6, 'App\\Models\\User', 113),
(6, 'App\\Models\\User', 114),
(6, 'App\\Models\\User', 115),
(6, 'App\\Models\\User', 116),
(6, 'App\\Models\\User', 117),
(6, 'App\\Models\\User', 118),
(6, 'App\\Models\\User', 119),
(6, 'App\\Models\\User', 120),
(6, 'App\\Models\\User', 121),
(6, 'App\\Models\\User', 122),
(6, 'App\\Models\\User', 123),
(6, 'App\\Models\\User', 124),
(6, 'App\\Models\\User', 125),
(6, 'App\\Models\\User', 126),
(6, 'App\\Models\\User', 127),
(6, 'App\\Models\\User', 128),
(6, 'App\\Models\\User', 129),
(6, 'App\\Models\\User', 130),
(6, 'App\\Models\\User', 134),
(6, 'App\\Models\\User', 136),
(6, 'App\\Models\\User', 147),
(6, 'App\\Models\\User', 184),
(6, 'App\\Models\\User', 185),
(6, 'App\\Models\\User', 192),
(6, 'App\\Models\\User', 200),
(6, 'App\\Models\\User', 202),
(6, 'App\\Models\\User', 213),
(6, 'App\\Models\\User', 214),
(6, 'App\\Models\\User', 215),
(6, 'App\\Models\\User', 220),
(6, 'App\\Models\\User', 221),
(6, 'App\\Models\\User', 222),
(6, 'App\\Models\\User', 224),
(6, 'App\\Models\\User', 225),
(6, 'App\\Models\\User', 226),
(6, 'App\\Models\\User', 227),
(6, 'App\\Models\\User', 228),
(6, 'App\\Models\\User', 229),
(6, 'App\\Models\\User', 230),
(6, 'App\\Models\\User', 231),
(6, 'App\\Models\\User', 232),
(6, 'App\\Models\\User', 233),
(6, 'App\\Models\\User', 234),
(6, 'App\\Models\\User', 242),
(6, 'App\\Models\\User', 243),
(6, 'App\\Models\\User', 244),
(6, 'App\\Models\\User', 245),
(6, 'App\\Models\\User', 247),
(6, 'App\\Models\\User', 250),
(6, 'App\\Models\\User', 262),
(6, 'App\\Models\\User', 263),
(6, 'App\\Models\\User', 264),
(6, 'App\\Models\\User', 265),
(6, 'App\\Models\\User', 266),
(6, 'App\\Models\\User', 267),
(6, 'App\\Models\\User', 269),
(6, 'App\\Models\\User', 270),
(6, 'App\\Models\\User', 271),
(6, 'App\\Models\\User', 272),
(6, 'App\\Models\\User', 273),
(6, 'App\\Models\\User', 274),
(6, 'App\\Models\\User', 275),
(6, 'App\\Models\\User', 278),
(6, 'App\\Models\\User', 282),
(6, 'App\\Models\\User', 283),
(6, 'App\\Models\\User', 291),
(8, 'App\\Models\\User', 246),
(8, 'App\\Models\\User', 284),
(8, 'App\\Models\\User', 288);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('001d306b602915e75f27e1deb2a21d2cc37242c9b5cb933b0e89c7f72e56d69b04504d3c2e1a67dd', 145, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 16:02:10', '2025-06-30 16:02:10', '2026-06-30 16:02:10'),
('00a5ed3debe27a00ee0e790cd730ec9a9dfc0085f1b8759b3e4d3c5c45259e5a4aba59efc1265c01', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-09 15:17:30', '2025-07-09 15:17:30', '2026-07-09 15:17:30'),
('00ef790b7da4a15c3d8eb90ccdcb24ea9b09a5b1a2e8493dcd396cbf81d153f53501c9a85e428c17', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-14 12:18:43', '2025-06-14 12:18:43', '2026-06-14 12:18:43'),
('011dde9789d8fd6c6ebf735dd7d7a4544ccf1eb9641d5e30f0f53fb6d189d44f2294ce5e05998e58', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 05:21:33', '2025-07-08 05:21:33', '2026-07-08 05:21:33'),
('015a9527e462722c771a389de87c081f42bbdb4830c69101e0e4f4afd05c1695b9e9410136256794', 192, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-06 07:11:51', '2025-07-06 07:11:51', '2026-07-06 07:11:51'),
('01dddad17653e9e0e6c39a510556d8a8b7241e7bddc6243e194d50dadfd45e7468fd3f43f12ab86f', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 06:47:38', '2025-07-07 06:47:38', '2026-07-07 06:47:38'),
('022e01cce6c88132921ec5d6e17e5912dd9d3f8f6ab5b268b2a06f40dab8d0f6f53fa500496caa61', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 12:51:08', '2025-06-28 12:51:08', '2026-06-28 12:51:08'),
('02981e8ec55941240824e1256da06c35fb77d6a6d6eccf982cefe54775961d1fd97f469fc62c0527', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 08:52:12', '2025-06-24 08:52:12', '2026-06-24 08:52:12'),
('02f108fe7a870e024577baf75a9ec18cf39c5088eac30d04e053bac170a94e24829545fe825425d2', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 07:52:11', '2025-07-08 07:52:11', '2026-07-08 07:52:11'),
('0313a3075db32d75d685fc3fdce3bdf34e5b0db5f6c19c83eafe38873a5bfe879290051c85baec09', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 07:53:33', '2025-06-28 07:53:33', '2026-06-28 07:53:33'),
('03404af3ae8b5341bc6dfce6273b06cf2bf9077cc0134801b8be16a90877be8078c22e8c66279dd6', 94, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 14:50:09', '2025-06-20 14:50:09', '2026-06-20 14:50:09'),
('03590bc0bb78446ec02a9aaf78819daed55a41bd3df08c9d53320dab222ecbad864937ca19ddf2bd', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 05:27:08', '2025-06-18 05:27:08', '2026-06-18 05:27:08'),
('037d70e0a95b55b4c6abd15feef04a6c97304e7a3873ec47cb1aaa468faf9ad5d71c3696bcf2401c', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 20:57:16', '2025-06-20 20:57:16', '2026-06-20 20:57:16'),
('03cc07f154eb92c4e109938fc3d31c773f537772ddb8756a0da68e0905b9dc159074873a977f52be', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-09 05:13:08', '2025-07-09 05:13:08', '2026-07-09 05:13:08'),
('0406a088924f2a9e2aaed0b8b0c0e4b4053e6fcd7e8b71cd890811e15053b4e01b6cd67f3d582af5', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 04:57:53', '2025-06-28 04:57:53', '2026-06-28 04:57:53'),
('04605996ec79c2690a5f0e4c4d1915bc13d31970080d8c000a976640429515d34a43e64fa1b18fd9', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 10:24:46', '2025-07-07 10:24:46', '2026-07-07 10:24:46'),
('0495f5a2f85581b56521d872bf0056e8c9fd04f6795ba663c17530b0be094b16329920b21b0a1b83', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 07:48:28', '2025-06-28 07:48:28', '2026-06-28 07:48:28'),
('04c355444b34e3a635eea396248b39a402b21ed623eef6491d9453aa5c60a173e3fd4464b9dd93c1', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 10:58:36', '2025-06-28 10:58:36', '2026-06-28 10:58:36'),
('04c3f679ca770f3e685cf66f0aedcb8723df4d8a3ca20d3382fdc03ef1655bd2de1d0f2160b0a7e6', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 06:50:57', '2025-07-02 06:50:57', '2026-07-02 06:50:57'),
('050a90a7367567434b23791eff4dd2556496d5e87cb0dcfd9595a6e81ee42681203d4cde264ed262', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-03 08:28:29', '2025-07-03 08:28:29', '2026-07-03 08:28:29'),
('05d6258bde784b455fdacf74d4c6daa1ea594d795e8d2c70b10c76afeab97a01760712b3e48a5a21', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 12:46:53', '2025-07-10 12:46:53', '2026-07-10 12:46:53'),
('05dae5c702b9b1404fb2b4e30f250d53b79d6765e34703b55bb458bb3d757fa013e3207a0be147a9', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 09:25:23', '2025-06-16 09:25:23', '2026-06-16 09:25:23'),
('063c42d7d8582134da9641f84a4d8b44a3d220bf06fc76b3de192fab7b33e3aa476d8c4f7df03e9b', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-06 08:27:00', '2025-07-06 08:27:00', '2026-07-06 08:27:00'),
('06840c3bf1b746521cbd8cde2e7ac490a54327adc81d3965049b63c3e1be459adc545361a0ea0501', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 05:53:08', '2025-07-11 05:53:08', '2026-07-11 05:53:08'),
('06e0f96d64bfe0dd60a6a77b99d4640c5fe30b9a35896b1d8fa1bf3fd7cbf42ed226a09aceea7f7f', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 11:07:15', '2025-06-20 11:07:15', '2026-06-20 11:07:15'),
('073d7c3bf3962d6aa1293139b4bdbac2cb1646992bcb2dac88c936a3e26d14be59a7b77be2a71fb9', 139, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 15:49:44', '2025-06-30 15:49:44', '2026-06-30 15:49:44'),
('0742fd3dbd297d94b6a0588c2954111c1baa37f660c0971c0ce9fd218b66a213f2923e2c8c333c3a', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 13:39:12', '2025-06-19 13:39:12', '2026-06-19 13:39:12'),
('0744f0ca9a15e50a25d576e7ed471367811d0bc8fb02c2c02d1a12ee3c94d1a9c3622296ec9f8da2', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 10:14:57', '2025-06-30 10:14:57', '2026-06-30 10:14:57'),
('07a076785e1def6fba846d6ee1e1e53037c7887e75e63f7bd1624a39f20a836475e7820cbb66f86e', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-03 06:38:18', '2025-07-03 06:38:18', '2026-07-03 06:38:18'),
('07afc5be170da6c96fdfea966b37a34f89cb341d22155cb9070d3b9620ca1b4a7437d5d51d502cee', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 17:25:07', '2025-06-15 17:25:07', '2026-06-15 17:25:07'),
('07c5e84bcec6189c77dc7911f861d76b55fbde75b2d84ce774fa157e1c004168b1c13dbf262898c5', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 13:37:44', '2025-07-10 13:37:44', '2026-07-10 13:37:44'),
('07c83a3c516a1fc00f310e92622c07dafb15f3857b22b8660c66af76f0bd6ab8b92a76d0bafa7842', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 06:54:23', '2025-07-07 06:54:23', '2026-07-07 06:54:23'),
('086afa4246eb85a163a8559de1ca7fac4af04c53af8b9472c9a013685d10114f71589b2649fdc128', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 09:24:52', '2025-06-27 09:24:52', '2026-06-27 09:24:52'),
('089d144508c836e4d074184ea9256f2e58f2018a044022b29320827819e5bb9b7ee4ce4abdff24d1', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 08:53:46', '2025-06-18 08:53:46', '2026-06-18 08:53:46'),
('08ac7ce54d38ef524eaba39147cb75837e3b52f9b3ffaf0b188d07bd1d061674625de08c3d7d4d2d', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 08:48:59', '2025-06-16 08:48:59', '2026-06-16 08:48:59'),
('095a9c838d2d25e4052a85daf4c6df5dc36d3f1e822fdb9c5337f6aae477ab3967a6063ca43977c6', 94, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 14:52:35', '2025-06-20 14:52:35', '2026-06-20 14:52:35'),
('09c5b13ded9f619f04c22ec7b3e53c00b2fb581996c0917649a369872e62b948fb6bc4dd2e33f24c', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 08:29:54', '2025-06-30 08:29:54', '2026-06-30 08:29:54'),
('09dc09caf7a6220c4d70a40d47bba58178a638c9bbdd59fa876461e27690e66f43eb826b185ddcde', 139, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 15:44:55', '2025-06-30 15:44:55', '2026-06-30 15:44:55'),
('09f408756fc5dad3355127cc750a086c8f03a6a6be363c462fdda62aa3ee5aa222fa0feaa6408842', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-25 07:04:40', '2025-06-25 07:04:40', '2026-06-25 07:04:40'),
('0a1f38c7f96c588a79cd3559800e29fffc656d2c78d22ddc4572f3bbd095872f4b758ff2985fed53', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 09:11:47', '2025-07-02 09:11:47', '2026-07-02 09:11:47'),
('0a3159470e31d49f24a97b0057573136a44a67a81ac098bf0b96873a57481e82360f5391905bad77', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 11:39:39', '2025-06-28 11:39:39', '2026-06-28 11:39:39'),
('0a356d2f7061fd87feaabfbf8438bbb7cebc45c8dd37a5f9f676e5de7f5a70c0669ead1bf2951bf1', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 09:03:50', '2025-06-30 09:03:50', '2026-06-30 09:03:50'),
('0aca5dad16f2caa1972b0bc15546b897ff21ffebad00df0858dfba117b158b3716c06516c99aaa59', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 13:41:09', '2025-06-30 13:41:09', '2026-06-30 13:41:09'),
('0b1ade7490c90c6a511210e50f8f6ec512dff61397f6c7b7c67c5f7dc38dc7e0d13691fd5298763b', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 12:05:34', '2025-06-30 12:05:34', '2026-06-30 12:05:34'),
('0b6d742b3caccf8be1ce20287af7a61841790f1203e00e10d9700d48fd24537e97550d903b95596c', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 12:29:53', '2025-06-20 12:29:53', '2026-06-20 12:29:53'),
('0b7cee553426b455e120e1f3cae7a6b7f2c8dd79b1aa76e4965e380a2b657f1711c1f1b31a329c21', 249, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 12:50:50', '2025-07-08 12:50:50', '2026-07-08 12:50:50'),
('0ba216dc5f3807e254f53fd61399d7ded7638be039d515ca4dcc587eba6ab4f4ecf7f468ec833df7', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 05:38:08', '2025-06-16 05:38:08', '2026-06-16 05:38:08'),
('0baca0f74fb00bcb18ad561f55217ba98d2dd89ff60a6bd00cb7747731c73c029331e1f27b2b6d43', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-26 11:10:57', '2025-06-26 11:10:57', '2026-06-26 11:10:57'),
('0c179d4b64a9c0d8c59af36d75ab4076ee006fcf5d62c718304b4300c8879dadcff01142574d2ee6', 22, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 16:11:29', '2025-06-16 16:11:29', '2026-06-16 16:11:29'),
('0c4f4345581d25bb31f98f06fe24b5f5fe4850ea192236579974a2e6218d84c2ce89e55b3caaaed3', 183, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 13:04:36', '2025-07-10 13:04:36', '2026-07-10 13:04:36'),
('0c60c52232bd6c8816b43af95367a6a46fa4f89d25dad12be56d56b9cfde4c0f6e999e54713e9508', 98, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-21 13:43:12', '2025-06-21 13:43:12', '2026-06-21 13:43:12'),
('0d16c6c6a3a3b6ea81b84f387b38421de580bd1b91c86f49267077915104f44791e59e333167a122', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 08:07:50', '2025-07-11 08:07:50', '2026-07-11 08:07:50'),
('0d2d4995dd4a67fa93eb5e1dadb0336ef355314fc18bd169eb58b2d7f1a0bfa52c8b858aa60ae4e9', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-23 10:14:02', '2025-06-23 10:14:02', '2026-06-23 10:14:02'),
('0d422e8b457863111c411207672fc6cd66a524a1267183ccc51fbcdfc75c281e5606e8f78384820c', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 08:22:32', '2025-07-02 08:22:32', '2026-07-02 08:22:32'),
('0e6af05022394057c5c7477e0ed4e40ac23a3adf4eae4ac6d1448fd2bb9c71aa3957985822bbf4a9', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 12:04:02', '2025-06-30 12:04:02', '2026-06-30 12:04:02'),
('0f159247cd18113a112e66ae4122f215b1716003857f6c34f47d2c6f7d9f00cfbba8a336205178bf', 192, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-06 07:07:33', '2025-07-06 07:07:33', '2026-07-06 07:07:33'),
('0fb9dda902c8cf8d9cf8d518c8812856a409dd7d9fef4241d3dff873bceb166bab03cd8349c96df0', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 08:01:28', '2025-06-24 08:01:28', '2026-06-24 08:01:28'),
('10219b70991b5a3fe74a827ddc8b6725774ddf7b76e714e61a456d8cdcb79b72a60872bfec0e4c3a', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 08:39:39', '2025-07-12 08:39:39', '2026-07-12 08:39:39'),
('10405284bab9fde6f0cc060edb71af9dc1ee942638d769dfcc67ed3fb9e838465fe66e531db97a53', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 12:04:17', '2025-06-30 12:04:17', '2026-06-30 12:04:17'),
('107498f92aa357b68dafbcfe4d3c0e040a38485649e6d366c339d7bd94d2926beb71c2a2cd0d4e45', 278, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 12:52:28', '2025-07-11 12:52:28', '2026-07-11 12:52:28'),
('10c6d1915609690ad2139d0cbb501c47235cea2b8f44fa71ae84db8a6056e377c8abafc501f90afc', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 11:15:48', '2025-07-02 11:15:48', '2026-07-02 11:15:48'),
('111e9a0f057c5152f55dbdd4262446c3c008d9c955ec5914d13a3452d34e8a97442425622c7869ee', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-01 05:45:45', '2025-07-01 05:45:45', '2026-07-01 05:45:45'),
('122062c688d3f0d5936e2bf923d55aefd8a8e997ea5fa72041e18b424966ef39e9805dcc47632cc9', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 04:43:29', '2025-07-11 04:43:29', '2026-07-11 04:43:29'),
('12a7c53c90e6e477ea8f107901f258d6f48c0ce4eeb3513134e658ed26e07186c7ae11e6dd0e65c6', 40, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 13:00:01', '2025-06-17 13:00:01', '2026-06-17 13:00:01'),
('136c8fe57b6b60b5e4903acbcd44de5b98ffebf78e4329a784654f51e52a656256d97cba80f17d34', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 06:51:52', '2025-07-10 06:51:52', '2026-07-10 06:51:52'),
('137071c6b742029ca93c6f3ed128e9cf6cb8f6606859921cbfb80c49b1dc3b611c75bb18db4dbd82', 250, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 05:07:15', '2025-07-10 05:07:15', '2026-07-10 05:07:15'),
('137fa872a845d72e31d1cebe4cb1e7929f00715d02b9d45a5e8eb7cccd3858ac7c6d9cfb2ed28a44', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 13:12:53', '2025-06-17 13:12:53', '2026-06-17 13:12:53'),
('13ae92e65c55b9722fc45e10518bce6b45df125a794b7898be565e2369721460cdfc88fdd4152cee', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-06 08:29:50', '2025-07-06 08:29:50', '2026-07-06 08:29:50'),
('14a87f60814363f4106173ce918b7c4d57a58b969a834e55564b2bd6f8d7a2e1890d75e25aadf29b', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 13:11:23', '2025-06-24 13:11:23', '2026-06-24 13:11:23'),
('14c3bc35bfbecd8d649d47c593dedc7dbcdfeaa2f3b3a105bba4a8886c60d141ea8f09ed7347ab83', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 05:27:55', '2025-07-07 05:27:55', '2026-07-07 05:27:55'),
('14c401b5b1b154fdb5c2df5209bcbce44a3a2080edb75a4a3b42d3f0c56ab5e6d325c6e1c3beab75', 281, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 15:10:21', '2025-07-14 15:10:21', '2026-07-14 15:10:21'),
('14d184445d76115bd358197d8d2dee46f8c62b76c2a8edcef09dddeb399bb2ae0726c72c1c777e25', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-15 07:20:01', '2025-07-15 07:20:01', '2026-07-15 07:20:01'),
('1592460fc9292cd7ef4bf7f08e745905d31c53f55387a4eedddbd9a022ecd47e57c59b1615f2b495', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-14 19:01:32', '2025-06-14 19:01:32', '2026-06-14 19:01:32'),
('15e423534ff3ba8b5ebb5b4b576497bbfdca75912a5df3be6b6a79f95982027ecbdccd3a691fbba7', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 12:09:27', '2025-06-30 12:09:27', '2026-06-30 12:09:27'),
('1609bc7872d6799c9d9bdd962305e6e1eba8c1bb8de36c02503b1ef8635b86ba14678a3c14018410', 51, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 07:28:31', '2025-06-18 07:28:31', '2026-06-18 07:28:31'),
('161628d5c526986bc17409cd469deced16e70f9bf997fa7c7439f685f3afdfc291081937ddfcc7f4', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 11:00:12', '2025-06-17 11:00:12', '2026-06-17 11:00:12'),
('162abd74045b7d8e7a4a49b73a4c3fe10048be109ec80cff7d05bd6913c0be8926cafe057cc6de60', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 13:07:38', '2025-07-10 13:07:38', '2026-07-10 13:07:38'),
('166d8ebd3908efaebf6f99380537938cea8459ead5f0e109fcfe7711b904e0999d6e23cedeb1ea27', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-03 08:13:33', '2025-07-03 08:13:33', '2026-07-03 08:13:33'),
('17754aeafaa900229cdd6390866582ef1116b9316306e3f22fc8ffba8694381a84f5b3a90504a081', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 10:43:05', '2025-06-16 10:43:05', '2026-06-16 10:43:05'),
('179241295454daa84fef3fdd6ba5ee3f9aa5c9f738fad7ac2f4ce5f1df03756dab495c84ddfcc809', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 06:05:16', '2025-07-08 06:05:16', '2026-07-08 06:05:16'),
('179879e477479bebcd6c4f744b0ef5a3805c2ed99e4180a1352b97e514cd08040731c61024692d06', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 17:10:36', '2025-06-15 17:10:36', '2026-06-15 17:10:36'),
('17cce3c2756a3d5b851fb96232e10d56a9db63d8b094268d97378b6f3cd3f4a18beb8ef56b2ce2be', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 14:05:41', '2025-06-30 14:05:41', '2026-06-30 14:05:41'),
('18d4d98e22ae00283d3e8a791370036809accc2b16b787813f6243dfa49c63f55e2fe365a3ad642f', 278, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 14:42:46', '2025-07-11 14:42:46', '2026-07-11 14:42:46'),
('18e2ba9da48630df25e379e5c74a5ab21ed22dee2cc016e917948a9fa78daeae32ec175980ddeff1', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 10:59:46', '2025-06-24 10:59:46', '2026-06-24 10:59:46'),
('193a8d38d251a13434323ac2273aae27608b0e9b02a9a75a04d430f748c47b7e718bb80954a0e118', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 06:14:48', '2025-06-27 06:14:48', '2026-06-27 06:14:48'),
('1a0fcb6e4abc9fcb87547caa169542cb2a20ffd2200a33c43a454867c8b017d09ab379e9ec1ce9d1', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-26 09:29:00', '2025-06-26 09:29:00', '2026-06-26 09:29:00'),
('1aafeff1ac051187a681974a08e4f1802685d409bc4d7784b19818cc27b48e30c065a848feeddbe2', 278, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 13:01:20', '2025-07-11 13:01:20', '2026-07-11 13:01:20'),
('1ad886ef1e8abbc9ffb31eec573d8b98e806f2fdad5bde192e8f256af1cc1409d8e41aa6d00abdd8', 49, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 07:08:45', '2025-06-18 07:08:45', '2026-06-18 07:08:45'),
('1b4f7266c16fbdef55f14c3f8d3987336bb599d637b8d4fd1405fe9af226997add54b0861e00b28d', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 11:44:48', '2025-07-08 11:44:48', '2026-07-08 11:44:48'),
('1b96f68109c277a4a39efe96b09cd2e241b1421104e926a1531a37f6e7ffd51a2f7cfeaddfc6e79c', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 11:39:55', '2025-06-30 11:39:55', '2026-06-30 11:39:55'),
('1ba2d0139058787494c613333c2ed19f1a15b4acce5aa033a7c9e7644e8ff2fa269f9905008f2cd3', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 11:38:38', '2025-06-27 11:38:38', '2026-06-27 11:38:38'),
('1be0a29af250399b28de6424ff04a2e8f00ddf26cb6d099e343a274cb064a14dc057e0cce6a535fa', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-23 14:49:52', '2025-06-23 14:49:52', '2026-06-23 14:49:52'),
('1c26a054b41d0aeadac2b0e895a81a440d59a39b01386f9088693e912063e0b9e383b6bf7e48a273', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-15 07:34:42', '2025-07-15 07:34:42', '2026-07-15 07:34:42'),
('1c2f2986bb3cd49e0ed2092432dd7fc68b3a430356057868466dfcf75a26e25471d20416069b605f', 90, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 10:09:17', '2025-06-20 10:09:17', '2026-06-20 10:09:17'),
('1caea4c6cf6da25155fcb5ca91f2c67fc6b29b34e22fc872fc7a56702bd5a24ab8e78c8d01cf1053', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-21 08:31:49', '2025-06-21 08:31:49', '2026-06-21 08:31:49'),
('1cb53806a7abf47daf18ff9d5cf32637982589411bb4938dcce466ee7ab1f8d53bd4f24b5d96dfbd', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 06:29:12', '2025-06-30 06:29:12', '2026-06-30 06:29:12'),
('1ce643092cd53203e6c85ab462301453a164805c000b655f2216389032d825fc9dc9b792622a146e', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 08:13:32', '2025-06-28 08:13:32', '2026-06-28 08:13:32'),
('1d963cc64487cc1eeeded9501c594b4e3c1859cb79f8e6f871a4b04a2262eb8beb6aa31272608ba2', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 12:36:10', '2025-06-16 12:36:10', '2026-06-16 12:36:10'),
('1db11bd29114020ea6d119845d52fe33a8d20f41de481b2bc224a35f7543f86f7a3d5d51b0021d45', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 06:02:37', '2025-06-16 06:02:38', '2026-06-16 06:02:37'),
('1dd3bd78599b644bf3a119d42196af34da26deecac85a96546933ebd0ea448804a6ad4a2dab4ac75', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 06:57:51', '2025-07-10 06:57:51', '2026-07-10 06:57:51'),
('1eb801bf4b49aa603c3b8a6549b526829b48fcaeec3d87cfe6fd910744c0a876ced6868fabd1abbc', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-23 13:37:14', '2025-06-23 13:37:14', '2026-06-23 13:37:14'),
('1fa3fc0133324429973f6fdc26e8869881a548f06c10bfb9e1f0018e4826bd4b5c8b4860ecad0097', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 09:44:30', '2025-06-16 09:44:30', '2026-06-16 09:44:30'),
('1fbe5c2957ff075f656296f0ca083f9b89d53033dba8bdbd4bfaf5ea7f8dc18b0364abe32971bb16', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 10:41:52', '2025-06-30 10:41:52', '2026-06-30 10:41:52'),
('1ff0cb4bc2659a079f8f28b0536c969e451d2bdaaf16f2fc552ab1f30c28626e55a3d318bc5b8e6f', 136, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 15:32:43', '2025-06-30 15:32:43', '2026-06-30 15:32:43'),
('20415deeb0e71d6aeacb9be89de98c91bbca21099877ce0706df8238a8cc8b9bb86ffc0f0055794f', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 09:31:29', '2025-06-17 09:31:29', '2026-06-17 09:31:29'),
('20a7362ad7cfff59ca1e3e941760baacdf5bfc2fa4d083add1ea6b45bde908f3dd9132787d5a39da', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 16:03:13', '2025-06-16 16:03:13', '2026-06-16 16:03:13'),
('20c11d01bded596a9008b39dfefde038f45bc0b421750e46f46fe2f88290edeb8a09726036308e09', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 10:33:36', '2025-06-30 10:33:36', '2026-06-30 10:33:36'),
('20d51c7ca1434ebd2aeec1e897ee83a68ea77d5534b6c3df8528dbbb00c2ba9066f8e5e83be3688c', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 11:13:22', '2025-06-16 11:13:22', '2026-06-16 11:13:22'),
('211d168dc8bb3969e7183971b189bcaa017ee6e63747fc30e049adad272f75501e93052a1300fe1c', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 12:35:56', '2025-06-16 12:35:56', '2026-06-16 12:35:56'),
('21c7e09a228b6560e1a8e934c07da815e7df118d45246e0bfd3a6e320bdbfeb79107b0c0a68022d4', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 06:54:39', '2025-07-07 06:54:39', '2026-07-07 06:54:39'),
('21cb5cdf9d1aaf16c887208183f7f16f04bf9c99b9d0171fe6b33d752194c52cd8154a3376b0086e', 128, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 13:24:27', '2025-06-30 13:24:27', '2026-06-30 13:24:27'),
('22254e335bc33ba21bbe0fb6fde1956a51dc4a2338c72b92607287adc54cfd5d33542529c5566cd5', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-13 08:07:54', '2025-06-13 08:07:55', '2026-06-13 13:07:54'),
('225b1a4a3647912e5aba217e137ba461add3c17ab50f01f6755d39f4a3d537a26498ada81c19b704', 263, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 12:45:49', '2025-07-10 12:45:49', '2026-07-10 12:45:49'),
('22c607e3db59fb745a3ee780a31942dfc7d2960e7d568166994197bc1bc5d0e0d352b79b6b2f4dcb', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 08:12:27', '2025-06-27 08:12:27', '2026-06-27 08:12:27'),
('22e0fa8feb18968ce02a562b3df2dc35a190a4b589b479a08d3b17bb6c3bb2d9bf6828a787f82942', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-23 06:25:41', '2025-06-23 06:25:41', '2026-06-23 06:25:41'),
('235738393ce6cb42651c4860fbaac2abb269f52d2098d6a00bdf2ab4ca6462c08bc379047f872f8c', 3, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 08:12:42', '2025-06-16 08:12:42', '2026-06-16 08:12:42'),
('235892d458b3f36621af9d1b3c74bb3ceabf2a41ceb6e50f1de027c094c48fe4a5a9dc7b7f2e7b31', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-01 09:53:00', '2025-07-01 09:53:00', '2026-07-01 09:53:00'),
('236cff6c30d28b06b65b17e4a67c62b11bdb5c8a597cf01363adc40a13d76f341f9d31909c63e126', 278, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 12:53:47', '2025-07-11 12:53:47', '2026-07-11 12:53:47'),
('241730f38e8952442b5c137fe986dde5088b98e9a91a059365665349c5e671b9a9390069b520a638', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 06:42:04', '2025-07-08 06:42:04', '2026-07-08 06:42:04'),
('2451dc3cb9b2f1244b65a82998d0e3b4d200fdfefc8fe4c4d9d07d1eb37a6b39c478bc27552b0bde', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 11:44:12', '2025-06-17 11:44:12', '2026-06-17 11:44:12'),
('24c7573d9e9f8e18cf5b985f006ef12bcd4537cee57ae6db879eb7029fa00cf5f80e712a57c85001', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 16:37:25', '2025-06-15 16:37:25', '2026-06-15 16:37:25'),
('24df2f993b1ab5cb3f40f76a8093b6f6b2c2a9d028cce963e9410ca804f730fdf2e940a6f4694d8d', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 13:05:16', '2025-07-07 13:05:16', '2026-07-07 13:05:16'),
('24ee893aa9d780260460e80cb18ca89ff975d2d68d0dfca1ce67d4e33fc082410fa23c765682517d', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 11:43:43', '2025-07-11 11:43:44', '2026-07-11 11:43:43'),
('2538ad2f2993c9b5b8c35ce7be3cec4b0fd25ccd136e3bd085bce4693c0826ee7b4f49a694fa7f44', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 14:34:48', '2025-07-10 14:34:48', '2026-07-10 14:34:48'),
('257ecebf07cb1757539e78ac6dd1a6f7c888b5532f03e976e59ed3045299f045dd89474d8b52c77b', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 07:17:10', '2025-06-16 07:17:10', '2026-06-16 07:17:10'),
('25a7728716196584edf319fca767340ae7f86b59df6b804a9cc72558a45e5ebb5daa8f4d7aafb1c3', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 13:36:58', '2025-06-30 13:36:58', '2026-06-30 13:36:58'),
('25aac7684c47d5fe3ef3c2be2da065a5d53630a8b5bda09674076ddf37adae7158950a4a24fdc024', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-25 13:48:29', '2025-06-25 13:48:29', '2026-06-25 13:48:29'),
('25c0307150b009fc5f6a50efa459654e30d1c75ae78a2fe89be1ba53c67634b2d4f3cce9f958bbc7', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 14:59:42', '2025-07-10 14:59:42', '2026-07-10 14:59:42'),
('25dcac1d02039f847bbacde0eb704b9895ba4857c812f1c4e999203679265f9bfab57fbcd3dce52b', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-23 15:29:36', '2025-06-23 15:29:36', '2026-06-23 15:29:36'),
('25f136734921280232286dc68bc5a28a221a858662569b8231dc9787b48aa69f9a8ff738669bcf13', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 09:07:56', '2025-06-17 09:07:56', '2026-06-17 09:07:56'),
('2655954e46f40082d8e069440ab796ce12ce6f0a3c05b818ec59b76625501b8541242275384484ac', 54, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 07:52:09', '2025-06-18 07:52:09', '2026-06-18 07:52:09'),
('269506b2a2d0534592366b5dce8165d8aaadadef5db220fa87486725c139aff59be86a5daa14711c', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 06:42:20', '2025-07-02 06:42:20', '2026-07-02 06:42:20'),
('26ae718bed455cf44bdeedef98983e97ae60918573566a096c404f0c48b3f1ab38b927a4175aa39c', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-01 10:53:53', '2025-07-01 10:53:53', '2026-07-01 10:53:53'),
('2743c9bef8f6195287c78affe14ac425e12f52f4ee9d30fa817fff0d84e15d412711668f8af4baa0', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 09:28:45', '2025-06-17 09:28:45', '2026-06-17 09:28:45'),
('27f38e538bc28e48a89d0c8129c7a7c6a1cd8f5834a322e0eedce78b918d8aef3e42262a062bf603', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-01 14:05:28', '2025-07-01 14:05:28', '2026-07-01 14:05:28'),
('282f034d1bc62ac4350268155ddeda32bf59b847238cc0447e01b714b429ffe3c9c45ffa921a4c83', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 09:00:36', '2025-06-30 09:00:36', '2026-06-30 09:00:36'),
('283409fe7e76a4c40fe2a16d8050821441a9432f18856b07761a7e4755319d34a92092b18160a79b', 247, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 08:19:07', '2025-07-12 08:19:07', '2026-07-12 08:19:07'),
('284acf98992bb1711fc0871aba5b699d00e2b2416864d7345277c08580553e27f822e3f25c2f91c0', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 07:45:27', '2025-06-28 07:45:27', '2026-06-28 07:45:27'),
('284f35e54d18b33686b896957623d1931cf88ccc61ac09cfd9e0b9618b50a9944f4924f002904ead', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 10:14:39', '2025-06-30 10:14:39', '2026-06-30 10:14:39'),
('28ab409d10318535310ea296404a78be3dce3881badd3a5e4ce9f5ead1190b8df1ee69008908de95', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 09:24:47', '2025-06-24 09:24:47', '2026-06-24 09:24:47'),
('28cf55d697399a96dbc1c1da9b9c7075bf049903bc2e7e81533276e14c8ec0ab96861bd23ca7a29a', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 12:18:49', '2025-06-30 12:18:49', '2026-06-30 12:18:49'),
('292ade63033d8607e2f5a2b8335f3b056e9dc13af5981c9b3534fd53b81711e9f428bfd1d2fc19eb', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 15:02:40', '2025-06-27 15:02:40', '2026-06-27 15:02:40'),
('29375404b48c82e433bbf52a02fa29dcf30648764f50dff911b425d051ca1c8808fcccd214813317', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 11:55:29', '2025-06-28 11:55:29', '2026-06-28 11:55:29'),
('298cc121349367903ac203c6c5f105bc9828d6ade832a7767e49c891527b4f0271fa666e0d80e13d', 281, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 14:04:51', '2025-07-14 14:04:51', '2026-07-14 14:04:51'),
('299a51960df19c922d276b5449bba007858a825d63c327d760e8550117d5988a5bb8726a75209a2c', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 05:35:06', '2025-07-10 05:35:06', '2026-07-10 05:35:06'),
('299e7a8045e3aadeed76f1b78143db570f2d3a926a6b4123e53c561d561771c63e345cd09cc62ffa', 46, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 15:05:24', '2025-06-17 15:05:24', '2026-06-17 15:05:24'),
('29a9e8e859273fd28c9d531f625ef00abac7dd66af8b86a2ae7bac7e9912dc2c47d4fcdf119253c2', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 08:59:47', '2025-07-10 08:59:47', '2026-07-10 08:59:47'),
('2a6716fc30e29165cbfd57ad6d6f5003a6c1e6bdedfddf91e71bf55e408a7920abef57f5c12720ac', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 06:05:44', '2025-06-16 06:05:44', '2026-06-16 06:05:44'),
('2a985fcbb1459ec8196cfde9986d0f962000cbe3de319ea43d3462da1450ddf9640b546f309dff99', 65, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 06:24:52', '2025-06-19 06:24:52', '2026-06-19 06:24:52'),
('2b6495cf6023409e2e45f3acf110afbda86f83e706841e258581cac6d21cc1cd08f82a704a48bb46', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 06:17:12', '2025-06-16 06:17:12', '2026-06-16 06:17:12'),
('2b8e595c3118bb16200adeded3f98da654ca8d934d53d3b459709a020413d2884b568197ae013223', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-21 11:30:08', '2025-06-21 11:30:08', '2026-06-21 11:30:08'),
('2bbbe636cb7b67c9774ff65236caa06529f16d276571baabe0e18ba4ce132b31f5ee4433377e6fc2', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 16:57:41', '2025-06-15 16:57:41', '2026-06-15 16:57:41'),
('2bfd4f6b3a6b98bd0fbd856f1279c7ed5890b3d851a752b11ddef60d506c9d8c26f47d9776ea85e5', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 11:13:28', '2025-06-27 11:13:28', '2026-06-27 11:13:28'),
('2c5b26d8543116fac7c908a62d24f3381f4d74832f14e29e92cb9c1cb7c0690c5f76bde47505d7f4', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 13:37:59', '2025-06-30 13:37:59', '2026-06-30 13:37:59'),
('2d600ae6856be8b21625d78b68fbcf1c3f8f067c7f47096cc57b51672f4fc1d8bff23bbde7078c05', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 06:31:28', '2025-07-02 06:31:28', '2026-07-02 06:31:28'),
('2d6900a5b2d976b634b681fb11f77483fd050b2c68609618d7f946df632815497b3c555bbd5af486', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 13:08:11', '2025-07-10 13:08:11', '2026-07-10 13:08:11'),
('2e699a5e77193d76f7e87d5de4df3aae8c7730104e2ff182c935c1eb7154482193a5e5da2c2c1f8d', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 13:21:47', '2025-06-30 13:21:47', '2026-06-30 13:21:47'),
('2e6b407777b6eaa4d571466dade43858da43eb41937c1274b9b674f4ff314e1b9f8e48de1634b31c', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 11:17:40', '2025-07-11 11:17:40', '2026-07-11 11:17:40'),
('2e950644b8e66eccdba2d069c63fdfa788b32ad4e0c64968b98f743bcfa836fe3afd61dca7a3fbad', 250, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 13:58:41', '2025-07-12 13:58:41', '2026-07-12 13:58:41'),
('2edf76fee88f3e6447783c50fe01c8f7c38cb0087d56923b0cbc16ce4d08c7997a1e03fd054b9bb1', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 11:38:43', '2025-06-16 11:38:43', '2026-06-16 11:38:43'),
('2ee51a6991eb4e283d26af4ca3c14e8e84be4d456e20718a19dbd2601b111aa810570d1b076b9a6d', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-26 07:19:56', '2025-06-26 07:19:56', '2026-06-26 07:19:56'),
('2f1449e87e6ed4a753a64100477b2f11be300b5c5ceb7899b2d45dd749b4b13daf892d29836d3530', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 14:33:05', '2025-07-10 14:33:05', '2026-07-10 14:33:05'),
('2f6d93f232be3b32107f5ebe50423b9010461e3d7a6e6e45dbaf77b04593488e316a12f1dbae8dfd', 263, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-15 06:58:29', '2025-07-15 06:58:29', '2026-07-15 06:58:29'),
('2f872f96ad2d77d358b0f5ff2fd99e4ed5ace0ddf0fd2210cca66243041667221092bd6adcda83a2', 278, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 11:20:41', '2025-07-12 11:20:41', '2026-07-12 11:20:41'),
('2fd1efa07e17a622c7e8e34eabefb88cbbebc0bcb55ab24e22b1edd1f6aba812159ebc4b0c11073a', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 09:59:27', '2025-06-24 09:59:28', '2026-06-24 09:59:27'),
('2fdc0877e1b77f9720b66d87a0fbd4568fd29024577f067c0a9a6228afdb8d26382c58f57973f62c', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 08:15:59', '2025-07-02 08:16:00', '2026-07-02 08:15:59'),
('2fef012ab733a9de4677e9785a591d68da285e8d4f07072635ac97b851d8b167f784a2304c4530ed', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-21 11:12:35', '2025-06-21 11:12:35', '2026-06-21 11:12:35'),
('2ff529eda982a0f0ad78fc059e8894f8a41bca70f0eec60c93ea3c5ea090f563f90476048676a5e9', 247, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 06:33:47', '2025-07-14 06:33:47', '2026-07-14 06:33:47'),
('2ffa952ab3d5b8101e04d5ade822b653e609e606ef654f6e24e2085daeb5fff858fcc734edc831d9', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 11:06:34', '2025-07-11 11:06:34', '2026-07-11 11:06:34'),
('315f3cb802a2eeb3283fdd8d24317c33d215afa0318dca3b7983e025405c1ca2bb344a59d2aceff7', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 15:15:53', '2025-06-27 15:15:53', '2026-06-27 15:15:53'),
('31ee2b7172464efbefc35e744f6ce52ba20ffca8ab0654fd23e5df3a9c280e3b8169214271c23f72', 76, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 13:41:11', '2025-06-19 13:41:11', '2026-06-19 13:41:11'),
('32045f3f06a94d2e48554f0430dee3c9c19756384fed88ec5b4cd85983b9352dc1421617f11b75f4', 148, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-01 08:36:50', '2025-07-01 08:36:50', '2026-07-01 08:36:50'),
('328abd0c037be31463c137885e6393a986c9d5302a36010428f4fa4031d73018640c13d3440fbcab', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 06:40:08', '2025-07-02 06:40:08', '2026-07-02 06:40:08'),
('3298fa0d879a7d2dcbb96c7e8a12ad2231d6ab5b09835f0cd8fe6ce0dbabac4cad4c89b7f52c9366', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 05:20:08', '2025-06-17 05:20:08', '2026-06-17 05:20:08'),
('32b8a18d01a6d9cf191274f2d111854b4cdee96eb689ca0ae87894a306b55dc7ea1138c43d7bfe1c', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-23 10:21:59', '2025-06-23 10:21:59', '2026-06-23 10:21:59'),
('3305f434aa1f86a996a6f3d6f930ba8c8062df281e18f0ffa1dbf9a00ff5d6bbb04f01090c62d9b8', 263, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-15 07:05:34', '2025-07-15 07:05:34', '2026-07-15 07:05:34'),
('33718d385478431a6043a80d24413cbcb57f68343d196f6b568ac94501afeeb2cd073318cbf06c03', 65, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 06:30:32', '2025-06-19 06:30:32', '2026-06-19 06:30:32'),
('33894fc5459897c281fa1748815299e7e576a525ac67918decb28e03f324ffa88fbadb2b82efa023', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 08:09:00', '2025-06-16 08:09:00', '2026-06-16 08:09:00'),
('33d45e542446ec854f88e235f2ab8e94ce1e92412eef81e225d7e274a4e2efbc7b5b0cc36389cc21', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 07:16:25', '2025-06-16 07:16:25', '2026-06-16 07:16:25'),
('3403268367928e2ad9ef140726297c620904a7720f017e62d3f2cf353f037dccf348c05e52e9cee0', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 10:09:12', '2025-06-28 10:09:12', '2026-06-28 10:09:12'),
('3422488b72f479372546f68e9b7c97100e82e0938bbcfaa553fd54062cce9487522438b0d5bd66bc', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 06:11:45', '2025-07-10 06:11:45', '2026-07-10 06:11:45'),
('3471928d80469c6b874daf835802008f45c6f7b93b3a3bddf4dfbba20fe96a2f7c21ead7d1a1a55f', 87, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 09:06:15', '2025-06-20 09:06:15', '2026-06-20 09:06:15'),
('34a87ba024625e528731db3ed2e890d09eb1b29e04e9b82b2f5451e024ca70725aa4d6393c039d5b', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 13:50:01', '2025-06-30 13:50:01', '2026-06-30 13:50:01'),
('34b94ffab21065e28dc2a6002b482b65467a21faba2e6b9dbf87bae6ea409d17738b6599cf6b83be', 247, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-15 06:50:32', '2025-07-15 06:50:32', '2026-07-15 06:50:32'),
('34d7c88aea3003ecf5286d2c0086c9ccc540ea9ca2d7a251163fba3da0a892e8bf5abd28668d369c', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 04:59:28', '2025-06-20 04:59:28', '2026-06-20 04:59:28'),
('350d5da1fcc60d4bdd266a6a934c7991c196e1b8a5465d681c490c799d3a50ce8396472ed2d98850', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 14:44:19', '2025-07-10 14:44:19', '2026-07-10 14:44:19'),
('352250f188ccf01cd458ab59c89ac4a529429d874ce2911b4999e683516fdaab2d2f5fa49bebb377', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 14:47:07', '2025-06-30 14:47:07', '2026-06-30 14:47:07'),
('3542a66577267cbe6779d05bd97335d9850722b6507f48f05473dc47847ffcf9913a14cc02159d0e', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 09:05:31', '2025-07-08 09:05:31', '2026-07-08 09:05:31'),
('3562794bc766869bd6f878e58d59569380484137cea98f9a069646693cbd4f20e5ab714fb6c76d11', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 07:48:28', '2025-06-17 07:48:28', '2026-06-17 07:48:28'),
('35b7a418bf04850cd1ae6fdc9138861bc7e48143d95d8b7b1c4a39dec28a0664557967d55bd5bb0a', 247, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 12:44:40', '2025-07-08 12:44:40', '2026-07-08 12:44:40'),
('35c6e54d175c67b9adb59f3a6c8eb55b58e7fecaffb6656e0383a3618ab008603bb8e8a9df96ded7', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 15:39:24', '2025-06-16 15:39:24', '2026-06-16 15:39:24'),
('361f42680346fb871df794d686bef1ec8ccb65cb5c07b686d969c3bc00e1e0d10f5aee00ea1efba3', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 13:03:52', '2025-06-30 13:03:52', '2026-06-30 13:03:52'),
('36857235a634887648ad438acf396cb385248dda758a0f27a8d80a9d5c1a00b671d8f5ff713cbc38', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-21 14:12:54', '2025-06-21 14:12:54', '2026-06-21 14:12:54'),
('36da1592797ce49de3981828fba2aa79d1acde73ad1f433a5e7c6540c450be28eb021bdf30bbff92', 192, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-06 08:27:42', '2025-07-06 08:27:42', '2026-07-06 08:27:42'),
('36de5528577b2fe66a9f12710aa6191da9493cc9c3f50e137696dd7b04d76f0ce4028e1fbe2d88ab', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-01 10:17:46', '2025-07-01 10:17:46', '2026-07-01 10:17:46'),
('372b65d33aea8ff5a220b57e263d55eff5ac61246a0026805dee6904dca6a68a648221e87e4a8cfd', 192, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-06 15:22:33', '2025-07-06 15:22:33', '2026-07-06 15:22:33'),
('375170b83843db6c7fa798a079997ede754fff7c054b8ba0fe1e55e9257aa7b8abda41bf6b9cee8b', 114, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 11:53:01', '2025-06-27 11:53:01', '2026-06-27 11:53:01'),
('37feeb00979161fa3c44a2c782d833cfaf47a8a359a61b5e8a6fbc23949b695889301bddee5d61a6', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 12:32:04', '2025-06-30 12:32:04', '2026-06-30 12:32:04'),
('3836c3ce01a02df732da54b202cf38b85e683ae328b1f4cefab8f829816e5a6a7cb92e47a83c72a6', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-25 12:40:39', '2025-06-25 12:40:39', '2026-06-25 12:40:39'),
('38422dc689fff6013d41f4eb6139f07261c8c446362fd55ddd61ea26d20ca071d8f42977dc27fd16', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-25 12:11:39', '2025-06-25 12:11:39', '2026-06-25 12:11:39'),
('38fcd320273dc8e22dccde2acd9fb92c25e7cf4706d30f77c3229625617151eca5201e3e9c4b8c19', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 13:11:56', '2025-06-16 13:11:56', '2026-06-16 13:11:56'),
('39f50b8297d7ceeb1d81d3314855189b41bd7a3259cbbc1d509eaefbbb44abde8782a3b6b2086eba', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-15 07:00:17', '2025-07-15 07:00:17', '2026-07-15 07:00:17'),
('3a18f7d9f9abf517d3034c196dc015fc7fae95a56efa7c6be6b6be29db07699c824f0eaedf83f2f6', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-14 12:19:43', '2025-06-14 12:19:43', '2026-06-14 12:19:43'),
('3a53dd222d487eb7a866c8f0f71cdefb3066c2feeca2fb579c5317dd84612c6e5fd9b01534e33c11', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 13:22:49', '2025-07-02 13:22:49', '2026-07-02 13:22:49'),
('3a700b25ac40dca14dae546495285452d12e07fb979cd85cba8078be88dcab2750a4ff02a06050d2', 63, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 05:27:09', '2025-06-19 05:27:09', '2026-06-19 05:27:09'),
('3a7aea6af35b3c33a667e5efff492a68b71ea7a34995b6c6747536569ac3bd1c2df661b71b4e6a2f', 42, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 14:29:53', '2025-06-17 14:29:53', '2026-06-17 14:29:53'),
('3b6d0ba0ee95298822055a4c46df47a6421eea89f1115d23f487df7ef4d65aaee84e76fe3eea2934', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 06:02:07', '2025-06-16 06:02:07', '2026-06-16 06:02:07'),
('3b86aac08acc1b4a2b0fced2eacde35644c02147f6a6affdec21d1c21733fa852f3c18955f804e47', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 11:42:11', '2025-07-14 11:42:11', '2026-07-14 11:42:11'),
('3bc85869758a54e1e14443c5e0d0b96a987945dd07157780f805a61db6818e5d1ab5b888e804292c', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 04:48:46', '2025-07-08 04:48:46', '2026-07-08 04:48:46'),
('3c22b1efc713e829bdd9ff4df24691dd555633f7ce5ceebe85e20a6bd095b832b0cc89c0816ba4a5', 52, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 07:30:57', '2025-06-18 07:30:57', '2026-06-18 07:30:57'),
('3c2a8fec80e6b8c27abb58f562edc9d5ae26c749bf9c7015dbbc880d1ef894b2835474e057f992ad', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 06:21:49', '2025-07-10 06:21:49', '2026-07-10 06:21:49'),
('3c2d311d9ae7996b56b92bee243101212dd8ae490b1e0ab11d12a4868c8ed5889a571e69cc7d1c60', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 11:42:11', '2025-06-30 11:42:11', '2026-06-30 11:42:11'),
('3c58930ab0206b5e23b141af7333e6a1d0ddf175cbbbdae4d14c891195653b6043a6dd0ceebef1e5', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 09:01:45', '2025-06-24 09:01:45', '2026-06-24 09:01:45'),
('3c907c0d5f1f76d1035780068e02051693e6fdc2b56c594b438d65cc046e67f0a5457c46d3efabf5', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-25 11:01:52', '2025-06-25 11:01:52', '2026-06-25 11:01:52'),
('3cf9503b2c973679c51b0c28c6952cfab12db8726c0ad64b3220e527443bd2f485114056732f3d76', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 09:22:51', '2025-07-07 09:22:51', '2026-07-07 09:22:51'),
('3d100804d366f8088f2f10d5a9b34cde1fbfe846f2205801263edf004c05a0f5906a3cea86b355ac', 97, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-21 13:18:50', '2025-06-21 13:18:50', '2026-06-21 13:18:50'),
('3d4d3d87ef3fb5cabd901be57c11ea3c8e2b34e683e0dd7f8f1f23e6977ad6e047cd5217a15bc5a3', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 10:12:40', '2025-06-16 10:12:40', '2026-06-16 10:12:40'),
('3d4ee1905da73e9d89ae77660dab4c5adabd55539b394ca6eee7d6dbde6a4184c93868b83d999d5a', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 11:38:20', '2025-07-07 11:38:20', '2026-07-07 11:38:20'),
('3d7015dfdbc3666ff62e5369d3fc44ca628ea7fd246b17a4b1808fa2b1e93a82a4c9e0931ee2b8ce', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 05:18:56', '2025-06-30 05:18:56', '2026-06-30 05:18:56'),
('3dbc8fa8ca8559fb122b7b497271ddebcfe921da0c234bad1edc1e3091c49c4b9eb74e78bd1aa3ad', 151, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-01 10:33:25', '2025-07-01 10:33:25', '2026-07-01 10:33:25'),
('3df1501dbd07780cf69ad7f35c65bf9edbf2dafc1d14b1ba3b628bfda6d48261f69c148a18f9d613', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 11:00:31', '2025-07-02 11:00:31', '2026-07-02 11:00:31'),
('3e24a817356adad831ad3b3da85b09b882241afd60fe5e28f54b63e0af86ea86d0a2530ced8dc3c6', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 14:56:18', '2025-06-15 14:56:18', '2026-06-15 14:56:18'),
('3ebf63e73786aaee062462f9cc536c989d9b1932b5c1c13bc480e7fdd42fe3253b500c05fecd51f6', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-09 13:15:39', '2025-07-09 13:15:39', '2026-07-09 13:15:39'),
('3f5b19e0019ad206460fd4be4b9d8825ad6e2405a2e3a0b862217fe9e00fdacbf800bf54d7a8ee13', 255, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 08:30:33', '2025-07-10 08:30:33', '2026-07-10 08:30:33'),
('3face81bc4aac7c82f568d82004a8ed982d0fd6683158e3d37a44c57cac6a0e54087b5d43511c588', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 15:03:54', '2025-06-27 15:03:54', '2026-06-27 15:03:54');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('3fb0bc13a6c0749cb88df125b93c0b8e8d12a8092f11a0cf6f406414e02156eafeac2a53b53b3e6d', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-14 13:11:20', '2025-06-14 13:11:20', '2026-06-14 13:11:20'),
('3fbb42cb825f54fd7c3763b0d6472d95c4e7499513a5e89c0c4286fd9f6b1ac3c1dc26daee0308da', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 13:47:14', '2025-07-10 13:47:14', '2026-07-10 13:47:14'),
('40ffd95cacf8a92fe5252d3cf6d0c6f5eb6661748e9f8aa62b55ac4e78ba5803e564c4f2d6020336', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 06:10:24', '2025-06-16 06:10:24', '2026-06-16 06:10:24'),
('414c559ae29a9b1d261b4be781d02d590a25dbb0f9a6a0406845de51db852b9b792499f894a9ba4e', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 13:05:35', '2025-07-07 13:05:35', '2026-07-07 13:05:35'),
('41dea25d443a168482f61912b19c7523f78ce2ae8f554f2c8e3b9644a7bf21e3899cbf6d24bd5b83', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-03 06:29:20', '2025-07-03 06:29:20', '2026-07-03 06:29:20'),
('4240349a2d4444ee6f3db448e6a7610aaf8742854ba16d22a41fb5d9a0db1aef75ac6c68a1e19b7a', 163, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 12:16:52', '2025-07-07 12:16:52', '2026-07-07 12:16:52'),
('42dc8fb67dfafe4cee23e99fa956d0ec98588f134fbc49936a7d51b9ea4e8a51bad822db75bad141', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 07:23:04', '2025-07-11 07:23:04', '2026-07-11 07:23:04'),
('43093bd38e4665e07bae4f096d8f47c64e4f6bf2d1f5e1865fa90af331288138d1dfdb56e6e17cbc', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 11:45:19', '2025-06-27 11:45:19', '2026-06-27 11:45:19'),
('43439b647cfc648ec876051d4a51bf3d68b74cbfb5dc48668b3c9a15673f1bd3948cecd63f5efeed', 263, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 07:18:33', '2025-07-11 07:18:33', '2026-07-11 07:18:33'),
('4345ee97793ef9e9c3b2430b9f2a8ac83634b5b9137b935d1347ee111b6e00f01bf7905f6d2d00b4', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 13:22:31', '2025-06-30 13:22:31', '2026-06-30 13:22:31'),
('4349a644d51af17e3943415aa4c178d97bf10403dcb649fc1f9324cb31bfb74d64654e2a9037b707', 130, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 14:48:06', '2025-06-30 14:48:06', '2026-06-30 14:48:06'),
('43ef1148d8f90da9f7af9278bf85113f0ed3dcf6d95f2c694062cfa95476b9c4f7fc945ce68b11b0', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-15 07:14:02', '2025-07-15 07:14:03', '2026-07-15 07:14:02'),
('441ab7a5428d860d766215af42de3d2b370afc14af1cfc3af84be68a2b7ad41bca7321ab408a87af', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-25 09:55:04', '2025-06-25 09:55:04', '2026-06-25 09:55:04'),
('44290de79c13f4b6d899aa4d66aaf106d2e6d0067663a9403fd3de2ae9e803bfe92a493f603943fb', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-01 06:06:52', '2025-07-01 06:06:52', '2026-07-01 06:06:52'),
('444ae9267fb5bd4a0355683292467eab1f7093069539c806ed5447623ef1bc641f04b99131b4fb82', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 13:20:04', '2025-06-16 13:20:04', '2026-06-16 13:20:04'),
('44aad3af729cd1c8ea74128f3ca9ccfb6161e1cfcacca9b6ed93a18cf59079ff59608b7a391e16fb', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 08:05:22', '2025-06-27 08:05:22', '2026-06-27 08:05:22'),
('44d28f8ca6cd212cc70f217c03328acff6f487b072e959077d9c23f524b9a67f32ef45be0361d139', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 11:58:52', '2025-06-30 11:58:52', '2026-06-30 11:58:52'),
('44ed9e1eccb6070a84a63799293a8ebfc518f36d8514f02f15db72f499ef3bdc34303c04b21d58cc', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 05:31:41', '2025-06-18 05:31:41', '2026-06-18 05:31:41'),
('45180cc498ebf42a8a847014e667dbe95df51d246c41ab0827e5219a9f80272fdda0333efbb4b584', 64, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 05:31:33', '2025-06-19 05:31:33', '2026-06-19 05:31:33'),
('45970d784a79422bbb39b83eecd0f13569f173571a94f410583528c6f235764373f5c4bdd51ae6a3', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 11:42:41', '2025-06-30 11:42:41', '2026-06-30 11:42:41'),
('4632d0d56781c63ba01fe518b77a00f06a385713f6479e080c285ebcd97c1f44a0b5589d6d9b0e46', 22, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 16:11:08', '2025-06-16 16:11:08', '2026-06-16 16:11:08'),
('46406a2812ef5ef79d3dee38435d33f8941eb63c61a213ae48157c308b60eb5b99a24cb66732c7f3', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-14 12:24:46', '2025-06-14 12:24:46', '2026-06-14 12:24:46'),
('469cea08f12d6767bd233a28496211aa91457aaebe2fd4566baf01d85df5ff7d2ffc3284bba7a486', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-25 08:14:40', '2025-06-25 08:14:40', '2026-06-25 08:14:40'),
('46c17a8fa87d9c69c2d399b94d7a8ed682fb8b474b9c849be1da2669193dc4cdb1e3b222dc8c8ddc', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 12:01:34', '2025-06-16 12:01:34', '2026-06-16 12:01:34'),
('471090a055931c704eea08e145224bf11b2fd6f708966a1fa9e003ff01c3bed7f8505de93cb1fe42', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 04:41:27', '2025-06-30 04:41:27', '2026-06-30 04:41:27'),
('4718fc261c3f40a044534a79ee8e6516bdae31b393b82731d51d26cd9ac22565301ae7fb2b9b3cee', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 05:15:02', '2025-07-12 05:15:02', '2026-07-12 05:15:02'),
('477ffbcd6ca1afb0c4ba1f29094de9b52e1cef247b79ebc996827a2a819fc8f43d96348671411ace', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 12:21:14', '2025-07-12 12:21:14', '2026-07-12 12:21:14'),
('4783da3b666ae73885afb28d3c1f603e69db20363f4fcfa0704fa5446922ff6b4f6ba7561c72c922', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 05:48:54', '2025-06-28 05:48:54', '2026-06-28 05:48:54'),
('47bdd9334058a06d197d75afef4b2a70303288217be2306124eb9ef439e90a811f45e29e09edcf72', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 07:13:51', '2025-06-16 07:13:51', '2026-06-16 07:13:51'),
('480997cd1becb5e220b557a816e7acf04fc622aa97a1a2946b922455bea29ed3d580c2ff0120455f', 154, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-01 11:17:56', '2025-07-01 11:17:56', '2026-07-01 11:17:56'),
('4840dfa996e4574e9ac29292bb520225171ad20b372218dd5cd7d206c960adaf8e6fb378f748c21e', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-09 07:24:54', '2025-07-09 07:24:54', '2026-07-09 07:24:54'),
('4852f8e66fb011d4439b202a865e1abd6c5ebe404de935964b2c5bbcaf1d9dc8f82553364ed843b8', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 05:21:27', '2025-06-17 05:21:27', '2026-06-17 05:21:27'),
('4953f94df3dbbdab06ee0c2d2678e77c8fce1707e61597150946d4e06b5d93b53a8eb2c4b13d6fa6', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-09 06:20:53', '2025-07-09 06:20:53', '2026-07-09 06:20:53'),
('49826befd10869beb8d7d7124a85bf927ce55001b2a07864e75db5efbaeea60e437c48dfd60451cb', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 10:41:17', '2025-06-30 10:41:17', '2026-06-30 10:41:17'),
('4a103ca3970b7d6aff3f74eeb94d68a113a5a1131293910cac712fb60f414e70d5cbdbf9e85ca43d', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 11:10:02', '2025-06-16 11:10:02', '2026-06-16 11:10:02'),
('4baa4c50f65cb45d7aeee6a85c5e0afa12fbebbd8f67efdd382891c47d33210c5fb6e5cd35866555', 89, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 09:59:12', '2025-06-20 09:59:12', '2026-06-20 09:59:12'),
('4be74000ed1ffe54f16c63f68a1a2433a130110f3f812ca3080f30f579a8853fbe8435780b4e9742', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 10:13:31', '2025-07-07 10:13:31', '2026-07-07 10:13:31'),
('4c5455416b15ae4f33ce8c97eab1d727a548a491228982a29c8d0e31924070083a4d24804079be21', 192, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-06 07:03:05', '2025-07-06 07:03:05', '2026-07-06 07:03:05'),
('4c5a1f5e96726357661db37fb92e282cf96cf26c98b305f5dcd9d8f0910dee260b827b49a47788a1', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 10:16:19', '2025-06-30 10:16:19', '2026-06-30 10:16:19'),
('4cac46b4eeaf0a10c7120033b7c61ff65df4b8020eefa97a25cf8c76904573d2da19568cfecd7842', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 15:19:58', '2025-07-10 15:19:58', '2026-07-10 15:19:58'),
('4cc93cc43808570a393a158e50edf17b791c4a85756baa12f3015758cc7511c3f98c87727e5ce4f1', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 06:02:24', '2025-06-16 06:02:24', '2026-06-16 06:02:24'),
('4ce971e223690fe08dd1222ab623450ed9524cff80ce7e7c164c65583aadb2abefc1d833ea7b6d17', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-17 05:50:52', '2025-07-17 05:50:52', '2026-07-17 05:50:52'),
('4de0ea952eb0a965b4f5c249e386f4eb6221ef1d2a717b1629b445b34631d22c8e94c9f459532711', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 08:00:51', '2025-07-02 08:00:51', '2026-07-02 08:00:51'),
('4df149c25eaaa8a6e7e07d19e309ed6cb5ee7bf89fc00f81c6d464d6732afdef639ddeb465f448bb', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 13:53:52', '2025-07-11 13:53:52', '2026-07-11 13:53:52'),
('4df281b26b0cf95a980d7935ba83c1eb815ec63e7a8a766e9975adb2f2a65b1fec512dfc087d70ec', 282, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 12:14:33', '2025-07-14 12:14:33', '2026-07-14 12:14:33'),
('4ea3f9116344fc892690d390c9dcf6aa2fcc2916003ec32967e5ab4c72471effe99008869c9f6e03', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-21 08:22:33', '2025-06-21 08:22:33', '2026-06-21 08:22:33'),
('4ef59033c264618693ffd36074809acc45c7e3217b7a0d4b6bcafb2138accf7967a01e7f6b6bef90', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 08:04:33', '2025-06-17 08:04:33', '2026-06-17 08:04:33'),
('4f33921c0fbe9a62866c961aa26f277cbbeb0cd9171e623e4f474abe056de1af36fb0ce3732e1a0b', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 11:09:24', '2025-06-28 11:09:24', '2026-06-28 11:09:24'),
('4f8e73c725570fe43f9310c9218627cb88bc89d42907477abed992b2915c680e29e277fd193da6b7', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 15:11:04', '2025-07-10 15:11:04', '2026-07-10 15:11:04'),
('509a3db299aa0289db614822d68a44e0645eb777adff261d2d4fc2573e6d1457fcaa1f6d3922ea8f', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 11:46:40', '2025-07-08 11:46:40', '2026-07-08 11:46:40'),
('50a65ba7461a4f137ead34cd8cf16c4efc0795a2041775fb9a8f3f0c0fc1929c85839fe07ca08234', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 11:27:02', '2025-07-10 11:27:02', '2026-07-10 11:27:02'),
('50b4561c3351d6eec93f30d59832879d2dc529be692bd0dc2bff4bb4d8237d997606bb2d7bd8a36a', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 08:09:54', '2025-07-07 08:09:54', '2026-07-07 08:09:54'),
('50f073eb322aa5e7b4f46043cedc1b6345436493a336d4d815a620dd6565fe7b54d176edc237e4a5', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 11:58:23', '2025-06-27 11:58:23', '2026-06-27 11:58:23'),
('51218d35d81f8e1499b970e81b08b9fac8a853f4128810ea873763fd209aade3893caf6880c03f03', 65, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 06:16:45', '2025-06-19 06:16:45', '2026-06-19 06:16:45'),
('51551458abd26df3fb678604a6da39d91bc6db187c1f6419272e1232b516c6c52a6dce19e84c26b1', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 06:54:36', '2025-06-17 06:54:36', '2026-06-17 06:54:36'),
('51818c183a65c66e01677ad73e92d42384bba8c5139b83a7c75297850728a010bddfe678d8a613c3', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 13:10:27', '2025-07-02 13:10:27', '2026-07-02 13:10:27'),
('51bab5ec452d20612849fb7d49a0744318ad5abe0ef0417f7ded59fe1031b7395843d44b08395b78', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-09 14:29:09', '2025-07-09 14:29:09', '2026-07-09 14:29:09'),
('5228ba2d48dcd972a0564e436064cccf75b76378270f0cfbb5b59289ccf62e18c302c51607607491', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 14:00:24', '2025-06-16 14:00:24', '2026-06-16 14:00:24'),
('524935212b1e58d14acc7a751a57c6df305320439c442af239a37e5ed7de96d5d440a89e95cd611a', 37, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 12:09:38', '2025-06-24 12:09:38', '2026-06-24 12:09:38'),
('526b9b05e6b1d01131ee934d010da3983c4294eccf4cac79c778c8714c810016b48a6c4c96603afd', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 06:19:07', '2025-06-16 06:19:07', '2026-06-16 06:19:07'),
('5273558782c14bbe44afabf19cd92525cee5fde29679a963a262029261162e7bfe169110ad0d05b7', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-21 07:30:34', '2025-06-21 07:30:34', '2026-06-21 07:30:34'),
('52f3a1bdc1d5618191fb20236ffa63e856a3e400a6760c7330b40ca106abad843bc61fd8ea6905ba', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-09 11:10:00', '2025-07-09 11:10:00', '2026-07-09 11:10:00'),
('530d9c47236c5edda3b4f0004aed3bdae3de08a93a30f98af6ba61faeae9fc01b786cc0f999c5543', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 12:46:44', '2025-06-16 12:46:44', '2026-06-16 12:46:44'),
('53b44dd277432506043395affae1cfa8a2b1e4cf3d2720baa6a2d46bb8f1df958cfa95a9ccb37ada', 282, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-17 05:03:27', '2025-07-17 05:03:27', '2026-07-17 05:03:27'),
('5400837be19ec457e4c53695c412e1c21b2cdc077b45e614850bbde2519eb3533ffc8d6b3d55db5a', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 10:53:57', '2025-07-10 10:53:57', '2026-07-10 10:53:57'),
('541e5fdd85ce3248f6342463b57a6091cab575a3b8492fac0bfe6576c4f0d43ca1aaffab666a9b0a', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 13:59:42', '2025-07-12 13:59:42', '2026-07-12 13:59:42'),
('5439ea719af928377f290572be56b7b829bafc423f8fcf03fad8da5fea64e9eec5c5aad082aca2cc', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 06:55:51', '2025-06-24 06:55:51', '2026-06-24 06:55:51'),
('5488f13ce0b032d6ff7aa46b861f63898febbbf1113c1e12b47cc820e368429ad87dceb076b341cc', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-09 14:38:43', '2025-07-09 14:38:43', '2026-07-09 14:38:43'),
('54e8a3f7707fc7d9ac663513a34873e156d5fc140208b3f65ad0ae5d420ebc47ae8fa5aa7ece3091', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-21 06:52:43', '2025-06-21 06:52:43', '2026-06-21 06:52:43'),
('55175a5463a25392700c0fa4c5af465d055f83e120b10924719bd528ec9c63c081055d53393d8f4c', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 07:35:52', '2025-06-27 07:35:52', '2026-06-27 07:35:52'),
('565b62126173c22f8297177215bfdb05757b4032d6e071e991ea0f162798d8ef5c0ca215d9ce7991', 183, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 13:02:38', '2025-07-10 13:02:38', '2026-07-10 13:02:38'),
('5675bfd554cdf592cead270e81bd1c4d0ba3c7afe6c5cbb39ce9b121f5c20fca2a4d5fba02b97f7e', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 05:05:18', '2025-07-07 05:05:18', '2026-07-07 05:05:18'),
('569c4a431ef033ccf5076203501d0578ee1fbd34d5270cefe61b2c541654b65e5a6548557a777d12', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 13:49:41', '2025-06-30 13:49:41', '2026-06-30 13:49:41'),
('56ada64c86341b15c3292cd6bdfa614736d50feeb87d7372b9438c4e698d87d96dd7076c5648388d', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-26 06:57:17', '2025-06-26 06:57:17', '2026-06-26 06:57:17'),
('56b9b42000a3dec21527f0f4e6b19b7451b005ce80eda8565d46c89b0dfe39570d4e19373325f8e7', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 06:57:20', '2025-06-16 06:57:21', '2026-06-16 06:57:20'),
('56cb873d193f6d175f7d3aeadcc23242f4886e01d37d9b85778b6df82f5ab28eb1dd4e94debff72b', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 07:33:22', '2025-07-07 07:33:22', '2026-07-07 07:33:22'),
('5718d9a16ec78975889a48d846a0e1c0a529d07cedef6f1399a794836e44286bcfc7111ece57746b', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-15 06:41:05', '2025-07-15 06:41:05', '2026-07-15 06:41:05'),
('57424f50c1b3352387f6b59dce2e34098fa761f11314af529f00a8e9a29fbc24b2121272c090f7e3', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 13:44:41', '2025-06-27 13:44:41', '2026-06-27 13:44:41'),
('5758d427c5f85dada0ffeb9148dcec8bdcf1356e85594bc3550e4b23d5a3b7888c0b32313906736a', 67, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 08:10:55', '2025-06-19 08:10:55', '2026-06-19 08:10:55'),
('57c1460d79517d6495648056101be0797b4f9e8e3c3b41a0233edf0d3f7509c3aca0bbe98d443363', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 10:20:45', '2025-07-14 10:20:45', '2026-07-14 10:20:45'),
('57e3fcb08d57307ed07be72fde60bd665e10a6b16a731652b4827101d9214dca0be154a7ff9499ff', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 05:52:00', '2025-07-02 05:52:00', '2026-07-02 05:52:00'),
('57eb522a473cbfe45e11545a72ba63c6f707e31cd4b8794ac4ae09ab9e1f97ae4c1725ab2f5bc10f', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 16:01:28', '2025-06-16 16:01:28', '2026-06-16 16:01:28'),
('583a1bc9a1fa85173c58aed632ccfb3e19372dc6fc5cd9634d2b6da54ecb6b2a88140c0b86e4a38d', 35, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 08:40:57', '2025-06-19 08:40:57', '2026-06-19 08:40:57'),
('587a49f4a9c7e7e52f34777deae081262ebaba8734d578761786aa35b8cb9d2f8eeb6032a0ffca52', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 08:59:58', '2025-06-17 08:59:58', '2026-06-17 08:59:58'),
('58830ec30c6b3425fe28a6e7690112041f7fdbc8b9b30f029f87f29534f9f1b4e18698949891b7f6', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-23 13:45:40', '2025-06-23 13:45:40', '2026-06-23 13:45:40'),
('5908344226ac968b400c48cf351718442ccafdde5ae4eb08deaa7191e6e14a530348951971d6a0ac', 49, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 07:21:19', '2025-06-18 07:21:19', '2026-06-18 07:21:19'),
('59123fb7aceab281509ae1ca47b88e5779eea5057e850efaa36aae3ea18a32fe819f69825549fbba', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 12:10:15', '2025-06-20 12:10:15', '2026-06-20 12:10:15'),
('597166c3f7cf4e9a0c9fad07857722cd20e6fe69fef624416410ba7f577abebff6bd22680917f3a8', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-03 05:12:32', '2025-07-03 05:12:32', '2026-07-03 05:12:32'),
('597c81badc5d4730aff42ea3b1910f71dc380ebac187d3b174a72596b1c2009f9d62472d0b59f15b', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-09 08:09:27', '2025-07-09 08:09:27', '2026-07-09 08:09:27'),
('59894aaa81b0eca36162a88a4bb40a300f1843ff0f705fb00a3840900b98cca9a3e1e5c016322e11', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 04:31:03', '2025-07-14 04:31:03', '2026-07-14 04:31:03'),
('5a6ad7c214516e4f7805383664fb200203d7d7d5afabfa18a9d6bd10d8ec04b400dd8679a7891cbb', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 11:10:17', '2025-06-16 11:10:17', '2026-06-16 11:10:17'),
('5ab2c2bd9aab4bb6e1f5a0c028c1cee5d7fb0c777262afdc52514611ba7b56d68a0d01c1d9a585c6', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 11:59:18', '2025-07-07 11:59:18', '2026-07-07 11:59:18'),
('5acf5e54ed681bc02e4e9c87ca6fa2b6ada4b4864376867d443eea594ffffdae95bfc595da56f49d', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 11:33:32', '2025-06-18 11:33:32', '2026-06-18 11:33:32'),
('5af7098405ba12000b2ad5561ee9051393ed9e84fe2c8317ef666293163d91d29b1758a1b209c405', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 12:40:45', '2025-07-11 12:40:45', '2026-07-11 12:40:45'),
('5b3cd521401c192b2c10887fa896bff385f29ac5618055290feeaf92842944a734dfca8dddfe2bac', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 12:52:02', '2025-07-10 12:52:02', '2026-07-10 12:52:02'),
('5b4a2d7fd05859dd4e5574c823f95cc9868029e9e57db8f4f42023cedc9cc67da8ac53fd487f64c7', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 05:11:22', '2025-07-02 05:11:22', '2026-07-02 05:11:22'),
('5cf83a1746664a5c2e2d46bdc7ec6a23f22c22a8a380d2b2762212848fe1c0069686f5fd3db8160e', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 11:06:03', '2025-07-12 11:06:03', '2026-07-12 11:06:03'),
('5cfb08090dce2cf3bf7b138137090ca41d8cfe11662a3efa8e36b7bbcdb361584045399c9285e397', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 05:37:10', '2025-07-14 05:37:10', '2026-07-14 05:37:10'),
('5d10b1c889ef4893926d8b1a6f2afbdc1e9a033f1ba9d42a274d0c12af000a33b951a8558d1c1f28', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 05:38:45', '2025-06-16 05:38:45', '2026-06-16 05:38:45'),
('5d268efdbc045aa67030b18d236f72d6284b4cb2a1e562dd5005f4d500d2bcc066a096b80555ba67', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 10:51:03', '2025-07-14 10:51:03', '2026-07-14 10:51:03'),
('5d2dfee49103e0a3b79f50f881616089c4eeb6fdfb701100668044c1c9eeef939cecccce17eaa6b5', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 06:49:48', '2025-07-10 06:49:48', '2026-07-10 06:49:48'),
('5d3af8a0db6e783be72bc2b2b16dfe7b87e4b9d32ccad608ecc6664007a479532079c03272cb09a3', 138, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 15:40:15', '2025-06-30 15:40:15', '2026-06-30 15:40:15'),
('5d808296ebae18f90f7e173d1316080a379a6745ccc6c29a3f0f590f75376bf6fdfd5a33d69a087e', 281, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 14:06:42', '2025-07-14 14:06:42', '2026-07-14 14:06:42'),
('5d8c9c07609c1f8cf3f646c8c2a9cb0635b4e657cda3a5eb76dbdc98e7d7b8614ca0381ab026b368', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 06:31:20', '2025-07-10 06:31:20', '2026-07-10 06:31:20'),
('5da3cc72a40855f66b5b4d68ee6693718de1892fdc5040ee963350d7b348bf9b7656f958f306a05a', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 12:42:14', '2025-07-07 12:42:14', '2026-07-07 12:42:14'),
('5dbc8545acb7e183496bdef69f651c1ffdcfafd1af7c1da9f5d89099af88c977d1e3397271454e3a', 37, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 12:12:11', '2025-06-17 12:12:11', '2026-06-17 12:12:11'),
('5dd097d487f9fd17aad102eab0424686f015d8e95a0f5d5e671e76ba52343ecc1b06f1bd93043a44', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 12:13:12', '2025-06-30 12:13:12', '2026-06-30 12:13:12'),
('5e072d997a84ce81ac32fa30a95c435ace55dadb6870cca81fd37a78aa6e7a1266d843393b0908a7', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 13:22:14', '2025-06-19 13:22:14', '2026-06-19 13:22:14'),
('5e3505aeb7953fce4aeea15fafb067ccb8c26d0d54ba0e4a4964ad49247ac2bc87314dbfe9c8583e', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 05:59:39', '2025-06-16 05:59:39', '2026-06-16 05:59:39'),
('5e67df155eca50efd0603121974b7c06503fecbd8bf8c05c2cefbee92eb22c4dd56cf741952d97f7', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-23 07:51:49', '2025-06-23 07:51:49', '2026-06-23 07:51:49'),
('5e80a1407a6e5de79da96fe550bd20316551e54cd8ef225d3eb3b841b7c12db9a847953631a6e365', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-03 13:05:59', '2025-07-03 13:05:59', '2026-07-03 13:05:59'),
('5ebd3279467b8ff04d68290dd8c45882cf8fff062654fcc9210c2d9fde7bcc34a66b1bb5f208ac7c', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 10:20:18', '2025-07-12 10:20:18', '2026-07-12 10:20:18'),
('5ed207be4a6f4dc45b71b1224d9e60bef13f82ef7c5e16e5b56fbd683b512fa37b03a0c602d7433c', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 10:01:28', '2025-07-10 10:01:28', '2026-07-10 10:01:28'),
('5ed9182aad7e94bb84b78bf95b1c54c17c1f0be5c8b7f53ab2b9733f179834a94a2c8e9404e44402', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 06:37:57', '2025-07-11 06:37:57', '2026-07-11 06:37:57'),
('5ee18f1f2653c66ffc184e2f676a456ee696da2de00d0ff65d67386c9a13e114f8f6d7f9c61e2818', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 07:13:09', '2025-06-16 07:13:09', '2026-06-16 07:13:09'),
('5eeb53ead361ab3a575a23666593e51f50a8cfb885669f3975c40b60a722a542310f79d229f31bca', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-25 12:10:37', '2025-06-25 12:10:37', '2026-06-25 12:10:37'),
('5f09b06a4dd561544d89f2cd3e1003e4ca54b0e303862aa72b1a7d4063d98c804ed3b7be53c56fc8', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 10:55:17', '2025-06-28 10:55:17', '2026-06-28 10:55:17'),
('5f1b9c1a77a9a5030abb19017dcfb29e94346857f02f9247ac7d35401a0e1c2e67cfadb8644c8372', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 08:19:57', '2025-06-20 08:19:57', '2026-06-20 08:19:57'),
('5f736d36ab6244a277a9b32d0d07bc8fe9ad51c6323ed4a1bd9cc776c2731899a74252891abbfa84', 154, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-01 10:54:46', '2025-07-01 10:54:46', '2026-07-01 10:54:46'),
('5fdf0b3a63c4f62a2e0020c4866c2ba79aaa4e5c25c29745e7ab643223d7a5f817662e31de80a191', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-21 11:13:36', '2025-06-21 11:13:36', '2026-06-21 11:13:36'),
('60efce763a06b5d467e00513ca405b23107e8a885d0d9e80910edd3d557aec27fc736ae9d60e6891', 3, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 09:36:27', '2025-06-15 09:36:27', '2026-06-15 09:36:27'),
('6124cd6b9e461c6368a4cbaaf9a5d7fe78d90a275973d2b7d4b292f1bf03d4b0ad66b7893fe1e3d0', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 10:42:19', '2025-06-24 10:42:19', '2026-06-24 10:42:19'),
('61275f2758ef58fa303b3c2dc598714c7d4f92e5370601c68102aed91c7850cacc2f1cb2c58b7af4', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 10:00:22', '2025-07-12 10:00:22', '2026-07-12 10:00:22'),
('614fc696203af01f3c0edc21500aaa2bc80e0b0bfd54b959566b12ea44763123594ba6b80172334c', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 20:59:53', '2025-06-20 20:59:53', '2026-06-20 20:59:53'),
('6169b29230d914f3a4cc0433a189ac8126426dde9216f9e856d2b4eab8e11f8f2fa008de9195195b', 3, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 15:30:41', '2025-06-15 15:30:41', '2026-06-15 15:30:41'),
('61729be4e83b6acb6f5a6584e2a41576d5685d13f0630aea2a32b96e4efd1c31b4305f1fb71a5d6a', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-25 12:22:15', '2025-06-25 12:22:15', '2026-06-25 12:22:15'),
('61b716c4a7edaff00e78ccdbdc008a6631be25958f923487860acd25b0bf2a0d29a41726665d083c', 80, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 14:38:47', '2025-06-19 14:38:47', '2026-06-19 14:38:47'),
('625f193f8c26e70f76e16a7f79c82a1f570b5263c5652fa2f9e9dd48eb27d87c4dde6d126d825631', 65, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 05:45:49', '2025-06-19 05:45:49', '2026-06-19 05:45:49'),
('6263fc5dca448374c3a35f51c5799e7ff386fe48341b59d91fec48db4fafcd8c847054d22991fe09', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 05:00:32', '2025-07-10 05:00:32', '2026-07-10 05:00:32'),
('62eafe23ec3d22de3ab83b38b876f989b2fbe9d0e851fe4199d4e97142dd19a311de4facf25a1d84', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 16:48:47', '2025-06-15 16:48:47', '2026-06-15 16:48:47'),
('637b8f3cbd7d836961d9e8370fe03033bff59eceff451c7fdf03549e017ae205624d5a8dbcbaa5a6', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 10:41:10', '2025-06-30 10:41:10', '2026-06-30 10:41:10'),
('6422f0d354593bc0c6f24c238f02cf7862f57bbe2fffe53bde56d183010c004a2beab8089b93e558', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 14:20:21', '2025-07-10 14:20:21', '2026-07-10 14:20:21'),
('64fbe2244e9d7ce96616e9f5676009a3182f370c72364717243353f99b9b78e33b7755ddcd499ec4', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 08:27:05', '2025-06-24 08:27:05', '2026-06-24 08:27:05'),
('6531f2909bcf9c3fdf13703f9dee12a270918f31f1d94d59c231aa0442891e54b8f4ef1fe29cf117', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 05:54:31', '2025-06-16 05:54:31', '2026-06-16 05:54:31'),
('65838d4058612368a1c0e78ed17568589f7b741f95331bd4ae9dab771a3d16ce032b149e4f9ab79d', 88, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 09:11:44', '2025-06-20 09:11:44', '2026-06-20 09:11:44'),
('65d26bc9763b49b68016df6f90bedd235e63e25169c236ceea28a7e523aa8ecce4252c0a48e0bc75', 263, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-15 06:56:08', '2025-07-15 06:56:08', '2026-07-15 06:56:08'),
('660a93cc8925e3d30052c9e29390977284e38f72f314afbf818556293456592441446ab990392c5b', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 05:51:46', '2025-06-27 05:51:46', '2026-06-27 05:51:46'),
('661d7ea068988a0fbac2ee6b59d6689d4858fbbe8dd636b2d1d9e87f8b0ce383c3e5ed2c53a60518', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 11:41:38', '2025-06-28 11:41:38', '2026-06-28 11:41:38'),
('663aaade0e54c41640981e49a2e801b93737f43bf5d2abd973e0e611f6757903a02d79e3ef8d78c3', 45, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 14:59:37', '2025-06-17 14:59:37', '2026-06-17 14:59:37'),
('664a943cb93ac46399406adf2814f0798bd083bd8d05de265d742c8be1dce7d4882e754fd45b44fa', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 10:04:32', '2025-07-11 10:04:32', '2026-07-11 10:04:32'),
('6651ac230f14f2fab2e5d8efa0eb4adb1c94b777c4014a9eb91340545332d7977055351772f19d4e', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-01 07:05:49', '2025-07-01 07:05:49', '2026-07-01 07:05:49'),
('66f8553525cefb3e705c8983268bac0f12d159972f2b312f6c10e0c3a0422a9d308edaef9d0bbe1b', 278, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 12:47:43', '2025-07-11 12:47:43', '2026-07-11 12:47:43'),
('67289098b5da15bff4f04974a27cd77fbcfe61172c1a39342ab4bff6f86b98448a2d2e782cac2dc1', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 10:16:29', '2025-06-30 10:16:29', '2026-06-30 10:16:29'),
('67498457e6a1aff943aebb6faf560cdf7078c913413fbceddd0e3cfa50a4e437472611b7be6f48e1', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 10:57:40', '2025-07-12 10:57:40', '2026-07-12 10:57:40'),
('67b05acdf46d38a0939bdcf92aeb26c5d7616b4626556f5c074ab2d758eef8827674a7179e4bbd7c', 281, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 11:53:05', '2025-07-14 11:53:05', '2026-07-14 11:53:05'),
('67c17f9c4e3aa1d18bdd6076f18b448b1503d5a0c9f5c53556bde4bfe02241884847ff18963505e4', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-03 05:32:06', '2025-07-03 05:32:06', '2026-07-03 05:32:06'),
('67f0697249e8eceebcc8b0f61e4a378977dee876f34b45caf5dbbec06d8789992078dea8154bdcfa', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-09 14:28:58', '2025-07-09 14:28:58', '2026-07-09 14:28:58'),
('67f304a3d226bb921d95ca1ecda2dcb7d44ec09b31394b81bb2bf02a5b1cf04bfa1a294e084a4c71', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-01 13:33:26', '2025-07-01 13:33:26', '2026-07-01 13:33:26'),
('681ca80f1a28a4e3afedbdfccce64292011e4dc2aefea5b20f7f899a106a625730fc201fd12ae4d5', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 06:03:18', '2025-06-17 06:03:18', '2026-06-17 06:03:18'),
('682b1f040cdf74aa47466ebca4b09dbaeb71d39f4b5fcecb66da3b70aa7735f91874a4d667ee1e73', 44, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 14:49:30', '2025-06-17 14:49:30', '2026-06-17 14:49:30'),
('685f455955a34fba9716e1b0309403504fdb0c079f35fdd9c2a7267666cb50e72deac053648a6f3b', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-03 06:54:02', '2025-07-03 06:54:02', '2026-07-03 06:54:02'),
('691dc0f93ea169f095019dec01220f5fdda4858705d37b3081cc6c67cb1f16ad9ad4389b8fd68ea6', 65, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 11:32:06', '2025-06-19 11:32:06', '2026-06-19 11:32:06'),
('69414f48008f04fce572f87fd44caff2dd4c0eece7d2a79c1d371bcdc7db97690010d4b8f05f44e6', 35, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 11:12:09', '2025-06-17 11:12:09', '2026-06-17 11:12:09'),
('6948b4b1ecf95c9263b488ebf8427148fe6e9f6623bb043b7ea4ab7404b7cf5bd06d118c28b86957', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 12:31:23', '2025-06-28 12:31:23', '2026-06-28 12:31:23'),
('6951fecf95f3be8aff8b1f7ab37aaee80a798b24e1412c76528e203f1ab984cd6e72bff1c00738d0', 183, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 14:36:24', '2025-07-10 14:36:24', '2026-07-10 14:36:24'),
('69617913c8ef591b6cb4816034c45cdc5581916882da3a406ad6d27953642adc0877b4d88508e20e', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-23 10:37:14', '2025-06-23 10:37:14', '2026-06-23 10:37:14'),
('6981ab762e96234c968fb95a1fd4793191dbbd65bab5e829b2dcd95d300a38df02d576e25b87af31', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 06:03:01', '2025-07-11 06:03:01', '2026-07-11 06:03:01'),
('6985b0f5baa9a9d4791d778acd35dc32f494cf76b5822b46adc3c464690b725d0e9653a8e7c8e5f9', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 11:10:53', '2025-06-30 11:10:53', '2026-06-30 11:10:53'),
('6a0d28bcaaed22c3c8019b34aea5802347da8eda8befac27df8c33bf940404b9b69700ed14116c88', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 11:04:44', '2025-06-24 11:04:44', '2026-06-24 11:04:44'),
('6a359442c65dd1892450c434293cd8d927a45ffb3d9cd900ce953fe69a4641cd312705cb28a380e5', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-03 06:23:42', '2025-07-03 06:23:42', '2026-07-03 06:23:42'),
('6a3a85316553fa403b521736275c375ab17c0e58d51c81fbdda512cd0f86ddd85a9e82b1a8f4f45a', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 16:01:51', '2025-06-15 16:01:51', '2026-06-15 16:01:51'),
('6a4fab6bd4265ab7edd7fd37eeeb147c4c587f641a3b0b9224cee031f1ab7b659308ba3e50e64396', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 08:18:14', '2025-06-24 08:18:14', '2026-06-24 08:18:14'),
('6a7c2fb9b5e2556c780d88e998f88b8634b4e6886d71ce9a9566955f4058db176a57e6cde7784748', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 12:25:45', '2025-07-08 12:25:45', '2026-07-08 12:25:45'),
('6abc2553a9af4089072c357fbfde6e00a5281a4e80ad31dfbbebca33c3894be156f9f6a9351775bb', 148, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-01 08:12:47', '2025-07-01 08:12:47', '2026-07-01 08:12:47'),
('6b0cf8e334397405024de23905acb2dc938f3c9c332e365fde02628bd40ebb62fc88226af590fa06', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-03 12:23:24', '2025-07-03 12:23:24', '2026-07-03 12:23:24'),
('6b11701b20b441b54bb017fd7f2e190c6d7df63ff78d0ccfd366e1e61ca142457fabe1846afa0635', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 07:44:50', '2025-06-28 07:44:50', '2026-06-28 07:44:50'),
('6ba64a8669a9678a15133dcb12f51eb1d848881ca09db3638f989e7b12b053dc5963cc167b234fb1', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 10:12:23', '2025-06-19 10:12:23', '2026-06-19 10:12:23'),
('6bd5b1bc06cb1c7dfe2bf1b8d56742b99ff45e587be9037551c81c0b79b6efb067e4c09f3afc2980', 250, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 05:08:13', '2025-07-11 05:08:13', '2026-07-11 05:08:13'),
('6bf46ed3bcbde2e18fec74c931fc8262ef5ae9d001e2a13cecf1737e2774e2e5ddee8bebfea40cdf', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 16:34:06', '2025-06-15 16:34:06', '2026-06-15 16:34:06'),
('6cc0818bfce60174c2ee4a782b013286fcc3cb4ccae5e33c8ba830fb7319cbae7124e47bf34cd45a', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-23 10:27:51', '2025-06-23 10:27:51', '2026-06-23 10:27:51'),
('6d55c59237983163c79dfd25dd1e1bd37eef9badbbbdb245958bbcc9c7dd6ec9cede72ffb7eb07c6', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 10:59:40', '2025-07-02 10:59:40', '2026-07-02 10:59:40'),
('6d6e5b7d2c0e69240e26a9e5c27310e9d0a44b0db33288727fa272bada69d09384af97d69e18acda', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 14:53:39', '2025-07-10 14:53:39', '2026-07-10 14:53:39'),
('6d7ef4cb02fa695028fb64b8fa6cda6d70d6fcb232ee34fe34f693c909ed1a538ba3207921a692e7', 282, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-15 07:40:57', '2025-07-15 07:40:57', '2026-07-15 07:40:57'),
('6dc399cd63160c7ecb4d68b3e652c86b97d288350a07b2a06b8b6642cead536ae8f3779489914318', 192, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-06 08:30:19', '2025-07-06 08:30:19', '2026-07-06 08:30:19'),
('6df1189d0822d19d6a0c6062780bf69b5d3eb10e17af1ba9e716dddf8d8fc71bac96986b5d34e8d6', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 15:13:51', '2025-06-24 15:13:51', '2026-06-24 15:13:51'),
('6df964e3b651cd2527caa8bb8925c6774561dc4c848adf2306313593f8d916d709fb487b1a510f92', 247, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 11:27:07', '2025-07-12 11:27:07', '2026-07-12 11:27:07'),
('6e3f6a76e0782bacf529ee8026bc0f8b2a355ee9cdaf7777dea4a937a383a86be8a83fe5cf65d952', 248, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 12:48:02', '2025-07-08 12:48:02', '2026-07-08 12:48:02'),
('6e5551db288d7600dd92139b38eb25f3010d0cdd60b3e264c9505b78b9098e7128bc50867c7b030d', 34, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 07:38:17', '2025-06-17 07:38:17', '2026-06-17 07:38:17'),
('6e9303acb923c7cca70adb2e46bc679aeef16ef6c13e65ee988f014ea88320e1403b0bf6a1404f18', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 12:59:47', '2025-07-10 12:59:47', '2026-07-10 12:59:47'),
('6f87e1da79dac99cc5d855a37460b006bfbd1aabb112e8ecfb12ee0c835ec4d4b584fc21b4672871', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-03 12:56:03', '2025-07-03 12:56:03', '2026-07-03 12:56:03'),
('6f99819c9a0ead3aaf38d123e37cff67071b290901dd452dfc7b4a9bb345c1e1f0fa733b8a640b24', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 07:11:17', '2025-07-10 07:11:17', '2026-07-10 07:11:17'),
('7025814ba6856296c535303938f128c438c3b468fc2dd032cf54a4c8a3f4097d445537097f617f16', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 08:03:34', '2025-07-10 08:03:34', '2026-07-10 08:03:34'),
('706e5dfa71b0e4eabd1274f1fd8f06ba8948dd1f16a9f8a1ce5fa73b73affe5802303e94a0243409', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-23 13:43:34', '2025-06-23 13:43:34', '2026-06-23 13:43:34'),
('706ee5d36cb00aa8245d001fcb689739effe0ee3365841636360f44ca82bc70f5b8ff3b9bad23cc5', 139, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 15:43:36', '2025-06-30 15:43:36', '2026-06-30 15:43:36'),
('70bf4b32bb132051f464f3a2caa9bb76803b89e8f274bdac29200bef6db53a49997eeba966b819f1', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 08:09:01', '2025-06-17 08:09:01', '2026-06-17 08:09:01'),
('70d2eefc82a9c7fc67e6a835c98ca2b46a737d6ded315839f3e37d1ba5b5e418e3ff25e0304967ec', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 22:32:18', '2025-06-20 22:32:18', '2026-06-20 22:32:18'),
('70d553fecc2767d08307f5f9ad979af2a8c286bea24adc29e0b954580abc40729dc7ce250d06f748', 134, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 15:18:10', '2025-06-30 15:18:10', '2026-06-30 15:18:10'),
('7134e506173dafdb7425c211fe0498232452254e192285f7baa48ec6a91c51af385e84204c13801a', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 16:04:36', '2025-06-16 16:04:36', '2026-06-16 16:04:36'),
('7221a5b5006be714f9fcd77863c62cae356d394be8ea85ac24c5f8914efd1bd6199f7927330b5dc1', 247, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 11:53:10', '2025-07-10 11:53:10', '2026-07-10 11:53:10'),
('7235a2fee5f134318130ce9bf5f968a97e2aad97e39ea6145bade20785cc9fc7e84970d80bbc568e', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-15 07:24:39', '2025-07-15 07:24:39', '2026-07-15 07:24:39'),
('729482e7bfab84f9c675ce1db0d3ec9c204159366310e2508a723d0f4a6c812740eebef04ef20e75', 48, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 06:53:05', '2025-06-18 06:53:05', '2026-06-18 06:53:05'),
('72ecd73df8031a011f4c1f47bc37ada070f0fd530f6822c41cf49cf2d9f6f23a92d0480aafff9183', 183, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 13:00:23', '2025-07-10 13:00:23', '2026-07-10 13:00:23'),
('731fe8af7ee848babac474973ee434dbfff579424991453c68f31d68d95c706e88408a41becdc1ee', 256, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 09:24:37', '2025-07-10 09:24:37', '2026-07-10 09:24:37'),
('738cf826bd691a04db353350578f060cd9fd1e8ba44418166117b14e49098f914890f764f02e5fba', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 13:14:31', '2025-07-10 13:14:31', '2026-07-10 13:14:31'),
('73b82d020c45fccf669e7ebef0e7ca2ab573c1b222ebc37daed2f11974d34e86494b9cedc06abbd7', 81, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 14:42:56', '2025-06-19 14:42:56', '2026-06-19 14:42:56'),
('73b93082fd75d87e5d054da384b10cbcde68d5428f71edff5c3117ecbc7607757e30cf82b766e472', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 16:43:36', '2025-06-15 16:43:36', '2026-06-15 16:43:36'),
('745289a5e5841be00d20c639e85e5acffb14b0cef3b535c47931a0f3b32b854601684d6e60e95b2c', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 06:17:53', '2025-07-10 06:17:53', '2026-07-10 06:17:53'),
('74536aacb85fbe7162fa99f641063169375c04d48653baaf5bdb82e82b36f8c239a3034e250d601a', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 14:58:24', '2025-07-10 14:58:24', '2026-07-10 14:58:24'),
('747215671f8d3e8c79f788c48a950e199e62d3f1ec8dfe8878d80d89f2b60606e7c469fc625d1d41', 263, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-15 07:03:21', '2025-07-15 07:03:21', '2026-07-15 07:03:21'),
('748426dd22504a951c0edc0d002a2d52e9e27f35aa4629a874b37b602503861081615d75a3e865c8', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 13:58:56', '2025-06-16 13:58:56', '2026-06-16 13:58:56'),
('74e067bbbaad7f590ea05f7bb1f5beca540fe643add30a757f6de4b98ddb70d249ce7be7577fe3b2', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-26 08:20:37', '2025-06-26 08:20:37', '2026-06-26 08:20:37'),
('7572c6a7cc1bacd5d0e36280a0038569771b121f913a40314427f4b24a1ddea8d2b66badeb03a364', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 04:57:08', '2025-07-10 04:57:08', '2026-07-10 04:57:08'),
('763bcd62b93352eeeba5604a95285ae6b116eb2f43260905a37e91e767a85224fe1e809b702bb89e', 128, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 13:23:54', '2025-06-30 13:23:54', '2026-06-30 13:23:54'),
('7642243ec3106401dca9f0bab19d9dca6f9496a3865b284395f9ecf04eb2f889e3c09712b837b72a', 62, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 14:41:28', '2025-06-18 14:41:28', '2026-06-18 14:41:28'),
('76f029301d0b98549fc10a619a767a382566cde62838f742c170aa9d93a5365afe19363aa769893a', 278, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 11:50:51', '2025-07-11 11:50:51', '2026-07-11 11:50:51'),
('772e2910b29ec35edbf4d5bb070f9a837a766c7a3b82c3d7659f0d5d3a3a37ed0872a694757e7077', 281, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 15:51:52', '2025-07-14 15:51:52', '2026-07-14 15:51:52'),
('77ad2b091d82b0dd538fba7db1b842aec0858e2d380251df85534d6e4d6c76e9fc0dd6ba56785553', 130, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 14:46:44', '2025-06-30 14:46:44', '2026-06-30 14:46:44'),
('77dc29e1baefc8db3b27d45ae484dc5708b629c8efd2f83d416d60643cd675bfb295b7e9ad0a0c49', 14, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 14:47:36', '2025-06-16 14:47:37', '2026-06-16 14:47:36'),
('787bb1c146302ec46dd107717acdfe6da052b446f38c91d1922ef35be696507db323cbc611ce0d29', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 12:00:21', '2025-07-14 12:00:21', '2026-07-14 12:00:21'),
('78c7709b003757d409329bfdb6d9caf20a30e694d5784f06765996a0d163fb2144eb777987bd9424', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 04:48:10', '2025-07-11 04:48:10', '2026-07-11 04:48:10'),
('7917274b3289bc38cf87f89314e03906737d8496ddc766c663c278f3ef1df4c5fa0f606c26e8da67', 26, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 05:30:39', '2025-06-17 05:30:39', '2026-06-17 05:30:39'),
('793418c575f1ebf59e0df42c13b2fa68038576da6d0499830e14f1a27337e6520c854133397e7ae8', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 14:22:28', '2025-07-10 14:22:28', '2026-07-10 14:22:28'),
('796359b64c933ce44be7f6a1607f0be8b79242c4d4f37e05f15a49b108f1cab9044caca3ee8ff8b4', 250, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 06:05:12', '2025-07-14 06:05:12', '2026-07-14 06:05:12'),
('79adf3802eea2cc3139f3289acfc9551b5c505149f73acebbf1940d18aa8495797836fc96502731d', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 13:34:47', '2025-06-16 13:34:47', '2026-06-16 13:34:47'),
('79c8233e925c38de771fa3d69a8358ef66db9c3c015b3e24aa59f75822b0ad77436e5265bcca5146', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 10:53:59', '2025-07-08 10:53:59', '2026-07-08 10:53:59'),
('79ecf9ae8b708235d9edb0dd738e45c7d69ec1f5c08d5df01af776ac1d08f7cefa9a0ea1151b4a67', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 09:37:30', '2025-07-12 09:37:30', '2026-07-12 09:37:30'),
('7a1e6dbecb51c85742506b6e7830f01184c5085cfbe5ec5d58b9fd4c7ea56d6904f3cfd9fb8f5a18', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 05:59:58', '2025-07-11 05:59:58', '2026-07-11 05:59:58'),
('7a3e2f6c9e57f25a33a169c63d0cbfb158de865ad53c81788e7082f08f5347240cc16b8e83f62c03', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 06:13:41', '2025-06-20 06:13:41', '2026-06-20 06:13:41'),
('7a5ad3cb535bf8b8661fed1633f1aa897a2045324002aa4df9569c0592ac8b355f188156f5f8de6e', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-23 09:58:31', '2025-06-23 09:58:31', '2026-06-23 09:58:31'),
('7b9765842273dabf85a0f38549ea41091e0802542df58c301e9cb671d65a9f4ec47b2133f85ff7cd', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 15:02:47', '2025-07-07 15:02:47', '2026-07-07 15:02:47'),
('7bb28a7a14ecf9250adb44552ce4988604268c08b469a42d6c766231ac9b8af372c0915d10b06cd9', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 06:21:38', '2025-06-17 06:21:38', '2026-06-17 06:21:38'),
('7be0c7beb6323b7686efb6bfd1ba572825788be4dc00e90a942100f1ddb7af9841f6c5a071bd7cdb', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 11:53:17', '2025-06-30 11:53:17', '2026-06-30 11:53:17'),
('7c580102adabd788bb0e735bdfc071b8adbc3cc866805a8496ab3a95beb6838197a5299cd7d3ca7d', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 11:13:56', '2025-06-16 11:13:56', '2026-06-16 11:13:56'),
('7c60d4f725dba19d848329c0da721bb24b2f7e4ffa66a666e94a431ac0730f713285f5b488c90006', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-03 07:51:41', '2025-07-03 07:51:41', '2026-07-03 07:51:41'),
('7c9e79f6c02936294fe2dcdb9bd7f8e51738255b45321d7610775b15a001a87cf0e337499156b202', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 04:40:50', '2025-07-11 04:40:50', '2026-07-11 04:40:50');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('7ca20bdd3044f8b482ffcb735c2a361951fd734d0123637f0e8d3ea97b69f2f61ae88b9eec721978', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-03 09:11:53', '2025-07-03 09:11:53', '2026-07-03 09:11:53'),
('7d136ad8bb0393d82f15db3e07e50343dc22c7fd06dd43cdf1943a63d24e70472e1e7e1f7ea87cab', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 10:59:10', '2025-06-20 10:59:10', '2026-06-20 10:59:10'),
('7d2411e0ca174e8cdb612c9624eef3119cd31d6bc70c9593e5d861c3c082800c5eb84d01de15066b', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 13:41:45', '2025-06-24 13:41:45', '2026-06-24 13:41:45'),
('7d9e049261e7ab5fc85c7521ebe1ef20da305751db346594914d714c9f3675169214314cc3152077', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 05:24:05', '2025-06-24 05:24:06', '2026-06-24 05:24:05'),
('7daa11ba08d3395ca113150cdfcabf976ef5e6431fc8a54b4392c0ca392d4c895ebd1052eba160dc', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 11:08:23', '2025-06-27 11:08:23', '2026-06-27 11:08:23'),
('7e26165c6a5deb4375c180c0f860bd50c074a00377ea96ee3d131e90ccf89d14c292166c6f8d9909', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 10:57:48', '2025-07-11 10:57:48', '2026-07-11 10:57:48'),
('7ea18fe62e5d87b247286a3813181b26802e394ed40005e4a01827d2ddd7a76af9c4438f1d8fd48a', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-14 13:09:23', '2025-06-14 13:09:23', '2026-06-14 13:09:23'),
('7eb192ac90be228a8fb789557c6c6c5ae0123578928f50ef6b9b216f39126689a5183b3a695d825c', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 06:00:21', '2025-07-11 06:00:21', '2026-07-11 06:00:21'),
('7ebecd2dde394268c0be4a48fbe97dd5cdced7027e0db410a8070dc7efcbda45dfcb95207fe8a190', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 11:56:01', '2025-06-30 11:56:01', '2026-06-30 11:56:01'),
('7f1d457d6532480045bfc83e5cfb4e415cd3731a35af1a55318fcd042aedf9c2c0590181db8d1667', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 07:56:03', '2025-06-20 07:56:03', '2026-06-20 07:56:03'),
('7ffc0b139443c7f37003f1b4f3c2cb4d6ca1f11acdc482e51aedebcc8e79aaa4d94f8412b7bd85c5', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-14 12:52:02', '2025-06-14 12:52:02', '2026-06-14 12:52:02'),
('805bad6db324d7d914e4f8bcce2a81f09ad209167ddd0933a919736978fe72b7dd85a96cff10af79', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-03 09:08:44', '2025-07-03 09:08:44', '2026-07-03 09:08:44'),
('806b866583e56f8d373307b521e9d50d5fc71fe25ff341bd77d3c5a9fe3a81e1206794b900476369', 16, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 14:57:56', '2025-06-16 14:57:56', '2026-06-16 14:57:56'),
('8070f65de100800d2d538d6f30f2b6dc9056d5c85cb9066d7ec1bcce41d1e63e1a26be8bfe505438', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 17:09:47', '2025-06-16 17:09:47', '2026-06-16 17:09:47'),
('8087f8f7fcdc0c947e5be2e0bf02e5f303d7e9100578e7170cc27a54886e14e2efcf4b96c0f45b68', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 10:13:54', '2025-06-24 10:13:54', '2026-06-24 10:13:54'),
('80a6503ec282cf258b3a8a9dcba3766883fc18481bd51a2639e059ae16c879e1a7f19638edbf4f6d', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 06:00:10', '2025-06-16 06:00:10', '2026-06-16 06:00:10'),
('80e2f4cfc66e9f52ac8b7d7fd6fb9fa99f0c61663829eccd572cfcdc3884fd862a94917699dcf81c', 157, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 11:10:26', '2025-07-02 11:10:26', '2026-07-02 11:10:26'),
('814b0196dc09ef12005bc21833ac72357fe60abce9918d77f0fa292295fece3c4f3305f16113df57', 282, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-15 07:36:47', '2025-07-15 07:36:47', '2026-07-15 07:36:47'),
('81a2247ed8d1c97449c0316bea2f858765235a544ede7d615940e056dd61a0082e9f70578317fe85', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 13:29:47', '2025-07-10 13:29:47', '2026-07-10 13:29:47'),
('81b2d80b79425de1d68c0f789a6c6fff5b5431ca1629c288cb73fbdaf3183485d7374c5171e3cc0a', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 16:44:22', '2025-06-15 16:44:22', '2026-06-15 16:44:22'),
('81be48c5d5e9112c774771f2184c82b610b1f3be762642fb7f6ce680cfbbb0e69715483a97d54f38', 58, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 12:48:49', '2025-06-18 12:48:49', '2026-06-18 12:48:49'),
('81d38ade33809f775465bc49019f43e0161c6bcfa567442646fedff7431bffcf2f84c1c34877a0c4', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 10:34:03', '2025-06-30 10:34:03', '2026-06-30 10:34:03'),
('81f166017ec2d235f13dc1a8c3c2d504ae2e13c8bd07ec1dbbbc7223728345b4f6ff9e2f9305b689', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 09:20:53', '2025-07-02 09:20:53', '2026-07-02 09:20:53'),
('81fd5ea31254599e105b078e28d59f159079d2899f1351100aee6b27c193623d9058519dc49cae57', 263, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 12:41:20', '2025-07-10 12:41:20', '2026-07-10 12:41:20'),
('827135a468e070792d8428ae2e1558e6046246c288d62fcf122c5c636d92ca0d3485a7f46619e3f2', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-03 12:22:00', '2025-07-03 12:22:00', '2026-07-03 12:22:00'),
('8282b58b1fdc743608b75c7736df3395decc1522d48e2dd7a96a018164ea8583adc007ded666d581', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 13:08:51', '2025-07-07 13:08:51', '2026-07-07 13:08:51'),
('83853043ba4f931be6cf6f670a501390fdd06f8cb919a90d4afe7bcfa3d375bdbece5190733acee1', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 13:44:38', '2025-06-30 13:44:38', '2026-06-30 13:44:38'),
('84dd5e5bc0389eb44e6ac92d35e745983936617e8341f7501cc74d2916b66d01eb36d1acfb7ebe09', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 10:17:08', '2025-07-14 10:17:08', '2026-07-14 10:17:08'),
('84e1d6f8b390de07221ed703bd8444f464abb3023985e155c29dca0266b0924451cb3b3ee9aeb36a', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-14 12:52:32', '2025-06-14 12:52:32', '2026-06-14 12:52:32'),
('855ce4303cd348b893c32be91a4377ead3e5d3839610a640fc4cd96d492f48986f9c9e3cd0a7abb3', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 13:08:12', '2025-06-20 13:08:12', '2026-06-20 13:08:12'),
('8661b042cb835b1d23e2a3b5fdc69ff5b70770b85f00c0eed29b7864cd960f402d4faf02a742bfab', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 13:36:03', '2025-06-16 13:36:03', '2026-06-16 13:36:03'),
('86c1cadda76b61ad071c3475053d5bdac6c74a6d28c544a181fc93cc455416982d47027fd120e55b', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-01 09:55:15', '2025-07-01 09:55:15', '2026-07-01 09:55:15'),
('86c600d802db71f66b438f47272555ab4820038f3d4f1fdb27184715be32bd6b6b45c48cb230982a', 281, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 15:07:48', '2025-07-14 15:07:48', '2026-07-14 15:07:48'),
('86f8e88a2e3e4ec2501f4065c57b60759fe8a37f54e60ec43dfa67331f7fb8925f6b859b7619e2be', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 12:31:24', '2025-06-24 12:31:24', '2026-06-24 12:31:24'),
('87afb7bdc670fdd163d70a81dacc5d0bf4acbd4b1c39698309fd3dcf87ee8408ae48bd54352d5efc', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-25 12:17:25', '2025-06-25 12:17:25', '2026-06-25 12:17:25'),
('87e9db85530de3b09ff589b4140705219132b7e528117bb11e4d85c1809af778a5d2f0428976ef58', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 10:14:46', '2025-06-30 10:14:46', '2026-06-30 10:14:46'),
('88485208d760b85e3eaabd28509d9d49e45f583d78655c7b14dca477e773d7cdd4f952527acf67ff', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 08:37:50', '2025-06-17 08:37:50', '2026-06-17 08:37:50'),
('887ea86cbad2f5e8039f49593a7b361bad225d89390619550f34c799fec0407d824d7a46585c0ccb', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 13:11:59', '2025-07-10 13:11:59', '2026-07-10 13:11:59'),
('889615665731ecfc584b20955d102bd2db0f0918fe4ca4d09941f87c11c7f13df172343be75a2be6', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-14 13:09:03', '2025-06-14 13:09:03', '2026-06-14 13:09:03'),
('88c4bec289aa39129a1ce0669ef2348e3802f7f7e10270130d8bd5cb946f4e74cf046ccec0ebcf8d', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 06:05:18', '2025-06-27 06:05:18', '2026-06-27 06:05:18'),
('88cf98d3819f8d4121a973383f08bb6687102919163f76034bb31b405411b9f067e62a1c247eca04', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 13:40:39', '2025-06-30 13:40:39', '2026-06-30 13:40:39'),
('88da794dd415383d150ad098e2a82e1f23cda15b530761a7c6788fd2ebf8830bc1e6e44c002f024e', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 07:41:53', '2025-07-07 07:41:53', '2026-07-07 07:41:53'),
('89df2ebda74f3af654a39dcba87419acd5e7a5e41c10287cd19a5afdc30f078f6c124a97c7725cfe', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-09 06:47:03', '2025-07-09 06:47:03', '2026-07-09 06:47:03'),
('8a6483b76485be3eccd8a64d24f8896dd17776516113e5680edd83cc7d4c1bdfa7092ce8900c49f3', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 12:04:32', '2025-06-30 12:04:32', '2026-06-30 12:04:32'),
('8acfc931f7f0d2b1a5fe4e175776767ea8f4c85a39014404cf26735c416897d2540f4a80c14186f0', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 12:46:22', '2025-07-07 12:46:22', '2026-07-07 12:46:22'),
('8b2e954118eb9ca367933073b0c81702af0179f60f5de0effbe12bb53b358d64e707d4a4f3bdb953', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 14:01:08', '2025-06-16 14:01:08', '2026-06-16 14:01:08'),
('8bf0d061eeb4a1439d726fcad60d03ec7232c64b53d14a6d7b8870abc708dcc625a4a52430b52eaa', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 16:10:32', '2025-06-15 16:10:32', '2026-06-15 16:10:32'),
('8c3a10ad8ca74e6d92385275f17b27d503e05c5bf3077ff20d991e2486ab3f68e988383270e606eb', 79, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 14:37:32', '2025-06-19 14:37:32', '2026-06-19 14:37:32'),
('8c3dfbf16c9e479262e4e408622bcded6db5d40efdeff5bc8171c09576cc424ce4e00c9e54742a7e', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 09:16:56', '2025-06-28 09:16:56', '2026-06-28 09:16:56'),
('8d2cc583bd29f1e3afcae74ba307476ea5e8ea90bd2d14c8fb2cbfa529e5f638b911c82dd10b53e1', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 06:21:53', '2025-07-07 06:21:53', '2026-07-07 06:21:53'),
('8da64bfa60c20045043fedf275882c9042a420c028993357ee62d4c131bdd1716ae633bfa54d3beb', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 14:38:56', '2025-06-17 14:38:56', '2026-06-17 14:38:56'),
('8dca341dd158974d03ac675f8ec513ba01e08b3415e80c287f44582b5ea0b2006d86b326bccc0897', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 16:04:59', '2025-06-15 16:04:59', '2026-06-15 16:04:59'),
('8e0ab3089f3f2b20444ca5ca2a8ddc8431dfbf7d193fc8c8d54356621960052b5aa2e89e32c04506', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-01 10:44:22', '2025-07-01 10:44:22', '2026-07-01 10:44:22'),
('8e2d2a0a5c4ac3dc6104590d554fddfd880c8f40426932e4e132dc2c1d272aa8a2ece7ee3865a790', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 11:19:47', '2025-06-30 11:19:47', '2026-06-30 11:19:47'),
('8e32c522474a6e63d42b55e2de14e0ad3e07d6e54d7cde356f4fc3025e1578b77de262246ffc62a1', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 10:17:10', '2025-06-30 10:17:10', '2026-06-30 10:17:10'),
('8e369a7aa4c0785ce141c2ed1b8e98c1e0763aeaa6daeee173a64580799e9bd80844c2b634d9f4fb', 250, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-17 05:00:40', '2025-07-17 05:00:40', '2026-07-17 05:00:40'),
('8ea3a5d139f303a7dc8f5981168fdb4b485e622b618af8cca9ee25147b26b07ecd189da9e087eeb4', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 06:33:11', '2025-07-12 06:33:11', '2026-07-12 06:33:11'),
('8ed24c2c3e88f9699f7b71c12ffbaf80d32c27f218015e80d22c5b02a3b014c4c09343f5914da524', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 10:34:43', '2025-06-30 10:34:43', '2026-06-30 10:34:43'),
('8f02b8ae18a0f904b950b369aa945ce8278e7a5a8bb6098629ca2a6a05f19e0b1b5f6bc1fd7ee318', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 13:36:56', '2025-06-30 13:36:56', '2026-06-30 13:36:56'),
('8f5968048dd27837e38c3b4c6a5e661a21e06d8e39c160657d5ce558f007f43fb60ea2e7b504fac7', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 06:27:14', '2025-07-14 06:27:14', '2026-07-14 06:27:14'),
('8f90d966b89e36641afda7bad8372a38762979acbd546a9054c2582b84addc51abe2e325eae344b0', 139, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 15:54:24', '2025-06-30 15:54:24', '2026-06-30 15:54:24'),
('8fc14281726d9c43196a49c5d792204476fdb1019e6209b2bed6761447fb23d47181efb626ae8676', 43, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 14:34:07', '2025-06-17 14:34:07', '2026-06-17 14:34:07'),
('8fd10ec549f1b6971f3d7d1e59722573c609dd23d9d2e857fe9b5a81d501e38d82d0c94d7b61d500', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 08:38:47', '2025-07-07 08:38:47', '2026-07-07 08:38:47'),
('901c25fa11d4bd3233884eaaa59c3b4005dfc882d7c47606c83516f35aed5aa5edd7901b211f8326', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-09 11:52:12', '2025-07-09 11:52:12', '2026-07-09 11:52:12'),
('904e2f43600722cfcdd1970cc2570c2311ae284262d906bc58b5015e9aecbba97119f2add0990d92', 48, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 06:47:40', '2025-06-18 06:47:40', '2026-06-18 06:47:40'),
('906e17028570341d6903000303ef860c74b158f205381a1fb9474e989984d35aed6e5d6408bf1529', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 15:59:44', '2025-06-19 15:59:44', '2026-06-19 15:59:44'),
('90771d6422dd96a4e4e59f3574bba6d91eaab6aedf54bad790c4317077d6ca979c24de793e265adb', 151, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 10:52:22', '2025-07-02 10:52:22', '2026-07-02 10:52:22'),
('90ae97efb008fac14533a73284f8871697f3dcfcce7519c3a4cf9da715ff1056f6fdf4d2f2a0e109', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 12:08:14', '2025-06-30 12:08:14', '2026-06-30 12:08:14'),
('90bfaebf9f51fa348ba6863753df53f3444c96b8c0f6e445a71c8ed8b1f70365bd7a1c4f463f9b2e', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 15:07:43', '2025-06-27 15:07:43', '2026-06-27 15:07:43'),
('90c8408716c970c301bf5eee2587ae2dd9de4644a0274862eb8aebb237307f59188e98b598b4c9f7', 37, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-25 08:26:10', '2025-06-25 08:26:10', '2026-06-25 08:26:10'),
('90e30ac4aa46ee9a572251c4945224231fc631ff1e25268f256c4c13a4d9352e4b2f8cb5993de007', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 07:17:33', '2025-07-11 07:17:33', '2026-07-11 07:17:33'),
('9121527adbbea9925fe659c7fe0257fd4c52f0c72481c8519c655bb6c999ef75f70e1122f6a38d8e', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-06 06:18:09', '2025-07-06 06:18:09', '2026-07-06 06:18:09'),
('917503bebba1aed5a37986baa9c285a47983d1e111259a29e8fc430da32140351802d7f29f54b6ed', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 11:26:15', '2025-06-24 11:26:15', '2026-06-24 11:26:15'),
('917bc79830c9e9849d474484a72f566460899eff7effd5071a685d03f78877aafd43719c78248565', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 14:39:06', '2025-07-10 14:39:06', '2026-07-10 14:39:06'),
('9192be229702f1b9db4e40e5418bda334e9fe038bfc9a9a62b5057eb32067c9d3ed14d98f2eadc03', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-03 11:37:01', '2025-07-03 11:37:01', '2026-07-03 11:37:01'),
('9200b7c53625034cd387e134171c0c62a3d9e69b363b2eaab722e4b16e7d7f1a88076119335abca6', 74, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 12:24:28', '2025-06-19 12:24:28', '2026-06-19 12:24:28'),
('926a997c9e5e20fe4e49fe7743dc36d4d24401f2b366ab4ec0cf8b9a6f706e9e70e9c9cfdfaada5d', 250, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 05:05:33', '2025-07-10 05:05:33', '2026-07-10 05:05:33'),
('9279d0fcef51c852abf61ff56ac8e489ca709085cb6bbd5c020ed0efbb5ecff7f2e19f2bc95ff9e3', 47, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 15:07:18', '2025-06-17 15:07:18', '2026-06-17 15:07:18'),
('931ce714d8e2d7e18e486699e35805aa994a85ae67561c13c83069ba5100288efb19bbd0b9759096', 247, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 12:43:03', '2025-07-08 12:43:03', '2026-07-08 12:43:03'),
('93200b6778fbceac748b653f726083ab90b53af336d2cf7792b435e60e572176aa6f006eceae1089', 280, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 07:30:58', '2025-07-12 07:30:58', '2026-07-12 07:30:58'),
('9376433ef79f9b3c748bcb4fb6144228b66fd855e629c2cb0978ce1cf26a998982a66ee893433ac5', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 08:08:28', '2025-06-28 08:08:28', '2026-06-28 08:08:28'),
('9382f4aaf33080c792151a1f84f87640c563e291cac99f247869a260cc185d170de3a2bbe23a0736', 4, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 05:49:58', '2025-06-16 05:49:58', '2026-06-16 05:49:58'),
('93a23f76638a5c3f0cbd5f2f07111845e9e236b0b66d28bfd573853aa9207c28feac70d202acb41f', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 08:16:16', '2025-06-24 08:16:16', '2026-06-24 08:16:16'),
('93f75c01cecdd4ffb5eddab9a32fd07f3f7d4b64211d02c1974250841341154df02ea62e54428a76', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 13:10:58', '2025-07-12 13:10:58', '2026-07-12 13:10:58'),
('945b21168f7e71ba3c0d11fdfb3657be14f28a5eba0fc5efaae2b8e707b76fc22a37f3990ff65635', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 12:34:35', '2025-06-30 12:34:35', '2026-06-30 12:34:35'),
('9489248f7eed4a6239017b6894fbdd639b27d24b91e2cb1dc323cd57cb8c77e421e46b0757236fa0', 56, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 09:46:28', '2025-06-18 09:46:28', '2026-06-18 09:46:28'),
('94fea224ec7cbbc47f8b927a768e47f174bd7af260d643b5350624b3e338b9896c10cc6c2750c76e', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 06:11:20', '2025-07-14 06:11:20', '2026-07-14 06:11:20'),
('9557cf10d51f1f4a7e8735192d2829889f20540ea079e4fb914a5db42efb4604aedcb56543c86ffc', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 07:58:36', '2025-07-07 07:58:36', '2026-07-07 07:58:36'),
('956fb86241ef9fe67fe16aa3154e7820528081eb475d0de7440eba1c7eddd52e851fab2683f79a5b', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 14:08:44', '2025-06-16 14:08:44', '2026-06-16 14:08:44'),
('958e52327a70486bafa76f677421efbefc9fea02492279e744d154edbff9bea04c5b98928fd4a9bc', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 06:32:05', '2025-07-11 06:32:05', '2026-07-11 06:32:05'),
('95d4d8ffad36f73d271a233e6af4528a989c8645e5db9f25f5382c6fa40b63ae141f8b1c0277a7fc', 281, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 13:10:22', '2025-07-14 13:10:22', '2026-07-14 13:10:22'),
('965e91df77ebaf1ffd442ff2a0e1e2948bc672d417687acedf0fd1f1055ced884cb77521e8f0f9e4', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 11:34:30', '2025-06-28 11:34:30', '2026-06-28 11:34:30'),
('970adc87e9bda8c57154998f4aab198e0ac12b54fb4c377c11039114704c903edc3d91ba83915bcd', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-09 13:09:02', '2025-07-09 13:09:02', '2026-07-09 13:09:02'),
('972897adb1baa02dfdb3dd7965af42837357ab64dc5dcfe68bacce27395fb023215b6590cb233be1', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 05:49:49', '2025-06-16 05:49:49', '2026-06-16 05:49:49'),
('973f958d6193f68ba70589e9a999ca7d12ca5f05e7fe3a83c4f67a4f0f1c39b31e79e947c7627c83', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 10:32:40', '2025-07-10 10:32:40', '2026-07-10 10:32:40'),
('97716d17ffe3aad72bf8774d307b37efcba4463ef3d96e171dd2781860898a19ef6492f110e5f53b', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 05:31:22', '2025-07-02 05:31:22', '2026-07-02 05:31:22'),
('977ac92727e99c7d33a4c14f29c467582555731e40c98cec7ae94e09eff8343b59e77283e1ba99d3', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 12:12:59', '2025-06-30 12:12:59', '2026-06-30 12:12:59'),
('97dced916ee3e37e69949c229c247634d6fb71a077669454519b0f2aeed22172d42399519d52fa3d', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 08:20:25', '2025-06-30 08:20:25', '2026-06-30 08:20:25'),
('9870b3af1742a572efeb436bc3356d4f0356139b961ba63aaa85d1b95e8a01edb4b42c8e7d96cfa2', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-25 10:22:17', '2025-06-25 10:22:17', '2026-06-25 10:22:17'),
('990bc6a286234c4660917a35c54ecf1765edfe8e65e921455657dc40ae7521ba7f81513190f76fb2', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-14 12:21:48', '2025-06-14 12:21:48', '2026-06-14 12:21:48'),
('9929bf09934723345a29a28db681617c7ba30f366036a89d13f8658d48ce350cdecf88d00d0e5a48', 84, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 15:02:25', '2025-06-19 15:02:25', '2026-06-19 15:02:25'),
('9a454f0d81d427daaf1758a10e7edfd1ed0c309b02234567e88696c08d8adff2c28a5a3037d23f8c', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 11:10:15', '2025-07-11 11:10:15', '2026-07-11 11:10:15'),
('9abfcef1d2ee9cb80e5fb0f1d2123070769784b08f0b8ec098b724c69062bcc3b046406bbe149e18', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 17:25:59', '2025-06-15 17:25:59', '2026-06-15 17:25:59'),
('9b24d064431187c864c24b5c8839a9f1029ded8dd9e54d5278fe5e9f90b17384983c9e8c5a3b6907', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 10:38:35', '2025-07-12 10:38:35', '2026-07-12 10:38:35'),
('9b413d89c2203bc8561664e8208f8acba4b991e75305b59288fcd78b33ed880e1e3c8e80826f7b90', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 07:28:58', '2025-07-02 07:28:58', '2026-07-02 07:28:58'),
('9badcc01bbb3213a8d88d628124e7ca7c8c86d17fd81ba072826cc86fde509bb0ae0fd66693d18e2', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-09 04:31:11', '2025-07-09 04:31:11', '2026-07-09 04:31:11'),
('9c35b882daf97b252232f8a1e8a6a189be1854a030dc2bb538ea5928de97c36cbf757420301df192', 71, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 11:58:05', '2025-06-19 11:58:05', '2026-06-19 11:58:05'),
('9c4fe212c3b8e0c64b03b8cc89576250190f992f76b80550615aac9c640e240e940eab30261c4793', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 06:24:36', '2025-07-14 06:24:36', '2026-07-14 06:24:36'),
('9c563d86ee373c1af94db79db7a0e3d5efbb4594ef76b1fd4ac35510c6c98357b9cd38d7b855b3bb', 278, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 05:20:09', '2025-07-12 05:20:09', '2026-07-12 05:20:09'),
('9c67a8c00952112f335ef3a152a3393442cef906b5ef1938ccf5cb5dce91bba9cc6cd8e3285ec657', 65, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 11:08:52', '2025-06-19 11:08:52', '2026-06-19 11:08:52'),
('9c87479d54e8227568173532681cbd44ae606ab5b2a2463d4d2b392ed65c19b8ee15a705d67f499a', 278, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 13:02:16', '2025-07-11 13:02:16', '2026-07-11 13:02:16'),
('9cbcd91ad081a15e84dea23a90e7e2a5e8126056bedcfd81e3bb1d052e116c3c7cb6a1aa9013718c', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 05:50:41', '2025-07-10 05:50:41', '2026-07-10 05:50:41'),
('9cdbf9bc42ac598a81c2338533ac4748b1a43aac2a2d1a103b7810e869c06b6eeef43713c26fba62', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-26 11:47:44', '2025-06-26 11:47:44', '2026-06-26 11:47:44'),
('9d3a2387f88bf70aa684b808a0268777c7b30e01da2fee8b0c5ef49233ba0e7c00c1f5101856bcfb', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 06:08:28', '2025-07-11 06:08:28', '2026-07-11 06:08:28'),
('9d65745110f5183b4fb44a47267aaf08aa4f3608878628077116882b9f3e459161aa63a61da106bc', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 06:03:18', '2025-06-17 06:03:18', '2026-06-17 06:03:18'),
('9dba2d1bf76f643d534b545c85a5e4484c8be97d285857174b7c9b3968c504c107ee2b2acda2cc0a', 92, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 11:34:11', '2025-06-20 11:34:11', '2026-06-20 11:34:11'),
('9e146fa9a17f1b2f98acb86b86e3479f9fa004bfd2a05c0cad76290092205c6e6b9760588a88440f', 53, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 07:36:40', '2025-06-18 07:36:40', '2026-06-18 07:36:40'),
('9e158e4e57307fa4d3ef4e9874dc0c1ef55974f0ac027533439b7647ee7087d4e61b8f1de21e5c1d', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 13:08:50', '2025-07-10 13:08:50', '2026-07-10 13:08:50'),
('9e2712deccdefc68d355d79aaab9d4d4903575a2aab940290cced35553f2ad0d5919201b2043d110', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 13:42:22', '2025-06-30 13:42:22', '2026-06-30 13:42:22'),
('9e3064b9c3dc3fa2078f51f538b83ecfb54c6a7e2e921630b2e4276df9385a23c025e9de51ec6859', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 15:21:08', '2025-06-30 15:21:08', '2026-06-30 15:21:08'),
('9ee03ec9dd308813644f8b40b209a01c3ecf9c09a610f8e433613f7fe62c5b85cd2089e7302ad1e3', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-03 13:10:57', '2025-07-03 13:10:57', '2026-07-03 13:10:57'),
('9efe4cebbaf340b42e681fdb15beddc28bfac0a8058cd5cc7e3cc4d6b1bf298ddc62d5ee92d526f5', 183, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 13:37:24', '2025-07-10 13:37:24', '2026-07-10 13:37:24'),
('9f819a462004f683d8334062573e93d141dc659d53a97eba416eaa726a6c62c026006df8400dd239', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 14:32:43', '2025-07-02 14:32:43', '2026-07-02 14:32:43'),
('9faeda05f15ed2daeaca083848d2027452aff5504234aa8765137e7741dcd8cf8fd31c9246b63030', 183, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 13:05:35', '2025-07-10 13:05:35', '2026-07-10 13:05:35'),
('a061a9731ac458dbe2855bee79326b4b9b229d195b21caa2dec0d99b2c61f76171694cb1d6357287', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-25 11:52:09', '2025-06-25 11:52:09', '2026-06-25 11:52:09'),
('a09a3d9eb0dde80dbb202468d1a0dbfec26e191ec20e8d583631bcbe8178fd8e2957ee901bb5fa78', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-25 14:29:31', '2025-06-25 14:29:31', '2026-06-25 14:29:31'),
('a0e3ae2ae735846017876f13ace17e9db4c530f6810e1d3d4a13499ac12df75cf2b98848e23722a3', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-14 12:20:36', '2025-06-14 12:20:36', '2026-06-14 12:20:36'),
('a0f1f3193da27977ec4e4990093f242f54d03724e81dcea0c9338f1a9b9ceb2af2dac303ce87e85a', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 16:37:04', '2025-06-15 16:37:04', '2026-06-15 16:37:04'),
('a134bc129aed97855ccfa5fa139eeb20905c32549b21e46a50c276d96ab322c7663e6afa7e3612e5', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 08:22:43', '2025-07-02 08:22:43', '2026-07-02 08:22:43'),
('a140a7e18e89fbc585d6f741830662974f99239a717c0cd5076f03eab53128f18c4ac301892089a5', 279, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 07:17:59', '2025-07-12 07:17:59', '2026-07-12 07:17:59'),
('a16e70b0f79693675443e49fb5fc9fe1a323734b8d1e281a326766e86aa5111d8bc2874375ceae07', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 05:50:11', '2025-06-16 05:50:11', '2026-06-16 05:50:11'),
('a1acdd990fe1666348f06bf707eecbdc0f89614470de2589a2ed43e68aee021dcc162a6c28af536b', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 06:17:28', '2025-06-16 06:17:28', '2026-06-16 06:17:28'),
('a1ca820ddf248e440a6f2034b3604099f3f3002bc8c7e90dc28a73a2b8c0929e3d4437f959f0ad0c', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-09 07:49:24', '2025-07-09 07:49:24', '2026-07-09 07:49:24'),
('a1e0ba701696b14a3909afd9a57ccf1133f7413a672824ba0717a2b2cc3a3d88eeaf89873c738071', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 14:42:53', '2025-06-30 14:42:53', '2026-06-30 14:42:53'),
('a2060b0ff2418489c942655e28b20d781e2e65cfe753039fb21c73699765fcb53b1d0ebb3eb482bb', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-26 12:48:09', '2025-06-26 12:48:09', '2026-06-26 12:48:09'),
('a29c18e73ab5045c27f2fe6d174cbbe872312c0dba35f644f4174b97631f5f56156efc78ad48d1a8', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-21 11:43:09', '2025-06-21 11:43:09', '2026-06-21 11:43:09'),
('a2a2e94ce186468096e5cc088737748a710f7d73a50928246c1c842f47917dc94d7b70c783d692da', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 07:36:51', '2025-07-07 07:36:51', '2026-07-07 07:36:51'),
('a2c38a14dbb92863010d9390ca203e5968626ca53aeefb9279001685774a2039809130cc6c562d11', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 17:00:50', '2025-06-15 17:00:50', '2026-06-15 17:00:50'),
('a2f56eb15f62362f0a11a82a1be227cfa0d23c59d36b7a65c9aa004944b97e523b01c066f9d13cd7', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 13:20:43', '2025-06-30 13:20:43', '2026-06-30 13:20:43'),
('a320e298142366d52165379b425acbdc4903501326e3683dcf9eb4a616e63219cca3965a63951ff8', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 04:41:18', '2025-07-11 04:41:18', '2026-07-11 04:41:18'),
('a42998128e695e90c2feb74656c613ed02bcd0191b71aaec484f36f44c6606bbd8e8d1809be41ab3', 247, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 08:10:37', '2025-07-12 08:10:37', '2026-07-12 08:10:37'),
('a46494821016aa43d8d3e52ed61d414825e0c72500568df794812afcd177682e1bc043cb6526fa60', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-25 13:04:40', '2025-06-25 13:04:40', '2026-06-25 13:04:40'),
('a4757cf3d7d641ca6b49b35d8883cd65cc00b64905055fbf60869dd71b24e3541682913795051a3a', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 05:40:15', '2025-07-10 05:40:15', '2026-07-10 05:40:15'),
('a4d16fadacb6cfe97cc16b6c9fd20de94a7790fb35dfe7a629cb00c5ab724746d4f5d463a35087e9', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-03 06:43:30', '2025-07-03 06:43:30', '2026-07-03 06:43:30'),
('a53702255d3d0b143f7e22b5bf4a98b7790f8507a3157572f3969b0c9df9eb21b7ce8d40fd7395e5', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 08:29:14', '2025-06-28 08:29:14', '2026-06-28 08:29:14'),
('a562de78238b08749c69b64bb775602546d87182badf91290d2db573fb863122501bc751d35ba900', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-21 07:14:30', '2025-06-21 07:14:30', '2026-06-21 07:14:30'),
('a60728302cf716f84fa02ac05345aeb002098d80537560a2b85d39d9aa16b9c6200213e089aac87c', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 12:11:49', '2025-06-30 12:11:49', '2026-06-30 12:11:49'),
('a62f4b95f05d864fcf2954886f364867e1e28ec2c4801361da56e0676aac86d55bc0e1b7beabc841', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 10:23:06', '2025-07-11 10:23:06', '2026-07-11 10:23:06'),
('a6395770f22d9cc8870c0950fd200ee626ecf87158ee15833bbe36cbc4af7f8cc080ce0466501c03', 59, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 12:51:11', '2025-06-18 12:51:11', '2026-06-18 12:51:11'),
('a6675303e21ae585e34ef3b592d24a887a6dbfa2f2b58749befea4ca474ce2ee88edf785f3d650a7', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 09:03:32', '2025-06-16 09:03:32', '2026-06-16 09:03:32'),
('a6aab8547d824d9e2f6ac88f68b45d64f7cf4dea27f1e0b9d7a9abbb36214a5bf5e6548cf731ec1e', 60, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 14:19:08', '2025-06-18 14:19:08', '2026-06-18 14:19:08'),
('a6b715624bf830a77e6c4a9482acc9ad5f1bb1b1d66fd248da914a96f40a23c04b9baabe22a28076', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 15:58:02', '2025-06-15 15:58:02', '2026-06-15 15:58:02'),
('a73eb117c9b2477f81f9abfae722c2c74da576c66f6363292f1990a738130407879941eeeb02f0ef', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 12:57:10', '2025-06-27 12:57:10', '2026-06-27 12:57:10'),
('a7e51c8a948c64585abeeefc784fd262ba58356ae9d527a6a0f5660f178e77caece9650dc38b60b4', 60, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 14:18:18', '2025-06-18 14:18:18', '2026-06-18 14:18:18'),
('a80f84214ef55f67241aa43cd4788ce237e0d26bd55e0f32232dd3bf73aa4b61af116da517c512d2', 72, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 12:02:03', '2025-06-19 12:02:03', '2026-06-19 12:02:03'),
('a8853d990738e6ee92a9b42bca47975c02130e87c8597f34eec2ec5bb29bc3ca846191d7ea89bf09', 16, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 06:51:17', '2025-06-17 06:51:17', '2026-06-17 06:51:17'),
('a8c155d6586cb40f36999e0ac8a518a3ca7da93638c99322f4eb5bf7330e544698856e5ebeb3ae5d', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 16:29:58', '2025-06-15 16:29:58', '2026-06-15 16:29:58'),
('a8ec78b5492edf8c7a0d086a13d092ccc1051e72ab3eda611f18c00ead4c0f36f5760ebc82ef25fa', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 13:34:23', '2025-06-30 13:34:23', '2026-06-30 13:34:23'),
('a91d4a28ec181d831e8ad297534791d4d77d417ca5f2e122d979d5f3bd6ebb0f4f01e4edf92c6ee7', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 06:31:22', '2025-06-30 06:31:22', '2026-06-30 06:31:22'),
('a936deeb50409cd3a180085f0581a552bb6d293495ccdc5bb96bd36488f567fea36523d1617c9a20', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 18:14:52', '2025-06-17 18:14:52', '2026-06-17 18:14:52'),
('aa06ee3113510a728c034ff56fb2925e0e2f98c7a3d6f54c39fccc830cb02d965084c05a34d64d75', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 07:42:06', '2025-06-28 07:42:06', '2026-06-28 07:42:06'),
('aa0f5f3201215296c0fce588fcec9f62aba8a9332321261560493b042b436c90f7d3ce82751cfd68', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-09 06:48:39', '2025-07-09 06:48:39', '2026-07-09 06:48:39'),
('aa1f64d5efb052658d30bab474044787f2756b6a7ce1f6d656343693290c90c87a69b503f96d16ff', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-23 11:05:30', '2025-06-23 11:05:30', '2026-06-23 11:05:30'),
('aaba59c2fd9834ca3c5c21999d1a47a303e9e80b57fd923fab10fc5bfd4d1aa5c9e0018a42165687', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 11:00:33', '2025-06-27 11:00:33', '2026-06-27 11:00:33'),
('aac54cd0936eb9a8eb17df15f07c61812b73c5a16e70af8e66f51ffbd61f280ba6d58e8e636f7cb3', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 10:05:02', '2025-06-24 10:05:02', '2026-06-24 10:05:02'),
('aac92d240112e3f306d9f0897e8708cadcaf7b3f6b397374986f9daefdd337853aeefd0adca3fe79', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 05:48:22', '2025-06-28 05:48:22', '2026-06-28 05:48:22'),
('ab2b4f6cd6c353d82af801b032493f8d681ca6a77c21a320f24846a3e85c4541c4c50ef8ca667fdc', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 10:52:29', '2025-07-02 10:52:29', '2026-07-02 10:52:29'),
('ab64d09298394ba5ca0147cf02bcb9b0c7df989d0a20d83dd67b5ac4085fa7b6ce9539cbe3aa32ea', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 12:48:46', '2025-07-14 12:48:46', '2026-07-14 12:48:46'),
('ab771244865d449f9bdb11e1adbb7c789c604b15ef1904c3d583b845faa9814477a115849b6150fa', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 10:44:43', '2025-06-17 10:44:43', '2026-06-17 10:44:43'),
('ac2881ad10c5a32fc6b5f658816ffde343a0d80222ff16ade796b4b6822b53d11c3c93d672e78a64', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 07:39:19', '2025-07-12 07:39:19', '2026-07-12 07:39:19'),
('acb10e220c35b1fda7628e4535247a841e07fe5552735dddc2f615991c52cff661411707cf36aff5', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 06:55:21', '2025-07-07 06:55:21', '2026-07-07 06:55:21'),
('ad9172bd81c65baffd59b3533fe18fadfdd883a7a647bc7ec77782e0ce1b7688d29916b6493fe07f', 3, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 16:26:38', '2025-06-15 16:26:38', '2026-06-15 16:26:38'),
('adb61a3084df9ee9ee0dc77d8d07ff31dfccebffe44626dd078fcdd56eacfb1078e2e1fdd46bb465', 192, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-06 16:42:15', '2025-07-06 16:42:15', '2026-07-06 16:42:15'),
('ae18c53ba9ddd97e24da4a91b8bec17665bee35a2d39694923d22eb1d3a4cd2b18d2d6cb7eaaa5cf', 41, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 13:59:41', '2025-06-17 13:59:41', '2026-06-17 13:59:41'),
('ae349800089b97c0b60c31c890c09f9255dd56bc1112599c3412470d806696138c30412bc28651eb', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 06:44:29', '2025-07-14 06:44:29', '2026-07-14 06:44:29'),
('aefbb3a0ee7d832035fd40e8c043457cc633103a8109fab222e1f75e89c30efe60bf22a0298d79fc', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 09:10:07', '2025-06-17 09:10:07', '2026-06-17 09:10:07'),
('af556e0d7269d940de21b543c3a5d34987eef0678b59cda912252f58f97f253635523805a8684249', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 08:59:22', '2025-06-24 08:59:22', '2026-06-24 08:59:22'),
('af94b201c46ebcbe2ce02672872e955b407bde0ea5a7dc40d2e8a5b336ff466c0165029fe6a142e1', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 11:59:29', '2025-06-30 11:59:29', '2026-06-30 11:59:29'),
('afeef10efb3fe86a11eba18847769406a972b7782265d0bbb173ee18b9524c0071da6a30392ec9ac', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-26 11:41:10', '2025-06-26 11:41:10', '2026-06-26 11:41:10'),
('b080fc6123faf3bd26bd476840f941a588f9c12282afa2358bb8998a66fb72c133b959fbce1d854b', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 07:05:59', '2025-06-30 07:05:59', '2026-06-30 07:05:59'),
('b0acef62e0a46d2fe2ad12241740b1ee1b26ae6a1d225607aabbcb69791117936a361da5973e8320', 24, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 16:45:57', '2025-06-16 16:45:57', '2026-06-16 16:45:57'),
('b0d1d641b823dec63d9871bc5499dae826252f2dafb5489f8769397f5322eb37d72c2edf7a82749c', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 05:23:32', '2025-06-18 05:23:32', '2026-06-18 05:23:32'),
('b0e0e4a3354d59e2fea2564a76401e6bb952d2c3ee5a19a31dbe758716c8972a0a6e7da2a49566a4', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 12:32:04', '2025-06-27 12:32:04', '2026-06-27 12:32:04'),
('b0ebc0f27e5a7b1fdecc4017d800be13128c176d40ed8dfb7eac97bc40d725e2a965d93fd27ac87e', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-01 08:59:46', '2025-07-01 08:59:46', '2026-07-01 08:59:46'),
('b18534d903e9f2b7736c810be774ae95ce755c4216f5e804d8b2979f2831ff2ff6f3557ac9e028ea', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 14:18:04', '2025-07-10 14:18:04', '2026-07-10 14:18:04'),
('b1c6a7e076a9c254886cb4e105c5e313837432f6f3fced502627296e5ecc82ef6e62975ae26d81b8', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 09:02:16', '2025-06-16 09:02:16', '2026-06-16 09:02:16'),
('b260f7ebfc0695eaa98997ddeae02beb7d684bc36699283ddf19edb63bee9c1196f8ab0ff5de20f7', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 06:57:56', '2025-06-16 06:57:56', '2026-06-16 06:57:56'),
('b28d89702617752799b4ff97c630cfdfe77e39863c1c241237dbbb8a3438a5a76fdb9625fcdea582', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 12:40:14', '2025-07-07 12:40:14', '2026-07-07 12:40:14'),
('b29cc565e4871d1c2b0fadb66f11738ad7c463cb147e76e7807065d7c594bd9f4b02dfc3b4a2ca10', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 07:49:02', '2025-06-28 07:49:02', '2026-06-28 07:49:02'),
('b2b2fa1a597e569dd6ce5e29b75cb698b11da6bb736f5ca9ebe1a08dc2135fd5638a826f6c40c8bf', 263, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-15 06:53:11', '2025-07-15 06:53:11', '2026-07-15 06:53:11'),
('b2eb2b94e34c3d197b382c607a80f49cfe53909685c6c9831006e44a317d08df3e281362328e4fa0', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 07:51:21', '2025-06-30 07:51:21', '2026-06-30 07:51:21'),
('b30afce1e8ea64fd46f50fcc3f3b053ea69643054dd7a14ec3c83f750a2b620ee7d66b68a5fcf144', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 14:59:41', '2025-06-15 14:59:41', '2026-06-15 14:59:41'),
('b36009e7b64407001ff3b0728b658ebae5f716b4c764fb4d279132601720a43236d801f1e1680f23', 3, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 09:37:31', '2025-06-15 09:37:31', '2026-06-15 09:37:31'),
('b39163a017029a5d6dbc8ecb4e7c4169e68430064763acec994943f5ebd6e56bafc9a0a6069e27db', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 15:03:21', '2025-06-16 15:03:21', '2026-06-16 15:03:21'),
('b3b79e6aac59e1d83130eacced04cc35f4ff3326db26700c202801d7a342dfbe4fe2c666041a95be', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 06:21:42', '2025-06-20 06:21:42', '2026-06-20 06:21:42'),
('b3ef8235762883909c7c2e29ea38554766802385ef2ad54b053015306fbb47f3a494ea47af2e2543', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 13:32:36', '2025-07-12 13:32:36', '2026-07-12 13:32:36'),
('b41f7f190b8f38c427eb9c3a177b1bb38094a3fd0fe5f28ae71df3a6b5429648be3aa3ffc5fd871c', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 05:48:35', '2025-07-14 05:48:35', '2026-07-14 05:48:35'),
('b45757769f3d27d79ad73baf1c86289aa128d04adf087e0adf007bdfe190a66251a8171b7906af41', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 07:56:19', '2025-07-14 07:56:19', '2026-07-14 07:56:19'),
('b4b6a28f801a2fd8d1173e09271d0551b5ddf1cc851f42910a1ab2051763bd3c9d8c24d3387cff71', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-01 09:55:45', '2025-07-01 09:55:45', '2026-07-01 09:55:45'),
('b4bcebc3be3fb1700f2ce3bb31b3fd39960fdf649fa53c6e760399363fd6bd3bee2393e66849eebf', 151, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 12:33:56', '2025-07-02 12:33:56', '2026-07-02 12:33:56'),
('b4ec7c5a6214ab6629b7092752ad95028089d70b1196bcdf0070a3a8fd5c820a9792d5bef8163447', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 06:35:38', '2025-07-02 06:35:38', '2026-07-02 06:35:38'),
('b57e33e01464810a78cd2baac392d0ed0ff7fb656f6933d2db3b94652302102b46b4819f9a0e3570', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 11:54:09', '2025-06-30 11:54:09', '2026-06-30 11:54:09'),
('b57ec28bec08ed433e229651db6d86e319cfac477ebf3d096dd29f3f8410419b2fa466f4b0918eab', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 05:23:30', '2025-06-16 05:23:30', '2026-06-16 05:23:30'),
('b592655b03a55facf0ac9d9a186a353e4dcdb1084883d168e839bfe39c969cf66961b819aa25e513', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 16:17:26', '2025-06-15 16:17:26', '2026-06-15 16:17:26'),
('b596761d043710e16c01560cad834f43546eab4ec0ab1366a5f2904759574475c51a82274bf04b5a', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 12:59:23', '2025-06-16 12:59:23', '2026-06-16 12:59:23'),
('b65298eea1f26060c4e86835aa7f07c4f446c1c473c8f39fb886afef99af6c320b72cdaf9fd0a332', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-14 12:22:56', '2025-06-14 12:22:56', '2026-06-14 12:22:56'),
('b6a2e15689ae86b7a8737aff27f9a0589614260d8dabb2b686a3ff9077a155a74ce0e6cadcef490e', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 12:19:19', '2025-07-07 12:19:19', '2026-07-07 12:19:19'),
('b71baf0500e5c24ec6acda40a9e4f2a8c799c65cadc01d222fd8ddbdb59ee65a2d2795006d4bb704', 136, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 15:32:16', '2025-06-30 15:32:16', '2026-06-30 15:32:16'),
('b8aff04a41c838f0a1f09ec029a0b2b8507530862ee32d73143f4b115c1062f1ddde964c3c7e2298', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-26 08:46:44', '2025-06-26 08:46:44', '2026-06-26 08:46:44'),
('b8fc46c0be4a1a41dd628028d35c8fec9f1056adfcade92406b5e1554e27d05872486d4db26860fa', 192, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-06 08:28:17', '2025-07-06 08:28:17', '2026-07-06 08:28:17'),
('b90115cb879450be93f006db93ead6e8939b4fcd35df13a8dd0b44898c813abf66c1d1852d823f1c', 66, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 08:09:52', '2025-06-19 08:09:52', '2026-06-19 08:09:52'),
('b91086372633818fa791b462dc9d06d5e0c38932350d629e1c12d663aeaf000a88527605be6a250d', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 10:13:53', '2025-07-07 10:13:53', '2026-07-07 10:13:53'),
('b95e30c8b875305459e8767bbeaac74ec38eb7c3cc9ba18c8e7748966c672de6f7ec3406ffbf2842', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 12:20:14', '2025-06-16 12:20:14', '2026-06-16 12:20:14'),
('b969207ec82bf030e9424919655434a00ded2bf3f1e7148a1b028a3c735f136dcc08c2bba1851834', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 10:06:21', '2025-07-11 10:06:21', '2026-07-11 10:06:21'),
('b9cb88eb3a9e678db14316f75932ede02aba71a7ec425800913566a646abe8a84f1a2eef707d1bfa', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 15:21:06', '2025-06-15 15:21:06', '2026-06-15 15:21:06'),
('b9e588d384528ac0e2f6731db2bda3a95e40315144aae4d5aabb01cf78f82721490cc8637b5a697f', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-26 13:15:15', '2025-06-26 13:15:15', '2026-06-26 13:15:15'),
('b9e95c1a0a2e3b4f7f601095838603cfa7e194c273d9e23da2e62786b752179c9b348eab885120d4', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 11:38:46', '2025-06-16 11:38:46', '2026-06-16 11:38:46'),
('ba1a343cb0a9d8da0117354bca147e46a3a043e72dd7a2c0d3f8bc7fc33ee189b7a0a298268cffb7', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-06 08:35:22', '2025-07-06 08:35:22', '2026-07-06 08:35:22'),
('ba3a1d5f74dd770af37938cb6840e0177567718742509995c3e5bf71b1ad6d7bd3656961dd2c928f', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 10:35:04', '2025-06-30 10:35:04', '2026-06-30 10:35:04'),
('ba99100f66cf2f0140ae71db627a281c93ec6ccdbeab2aa5a78a48d36c1f4d361207f5b16f859618', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 13:09:27', '2025-06-30 13:09:27', '2026-06-30 13:09:27'),
('ba9f03eb75f194e4be7d36bbec8a99b74d06fc66b6d44bcf3ee3c78f3ef4115240e13f5d94732a5b', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 14:20:46', '2025-07-10 14:20:46', '2026-07-10 14:20:46'),
('baacbdf430d056b7b903d7a0cb127d33211d4c036bb8375820132c41d1f1b01f67761879ec4da34f', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 11:16:07', '2025-07-08 11:16:07', '2026-07-08 11:16:07'),
('baff72043a35c7f49c8989271b0521df72692e333eba51903192322f78f1fa49ab856231785c669d', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 17:44:10', '2025-06-15 17:44:10', '2026-06-15 17:44:10'),
('bb7348688394cf70b387f35d2518688ea3995b7a35e1d6f6be6ae6481e759764c73720510f2d86ef', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-03 10:22:15', '2025-07-03 10:22:15', '2026-07-03 10:22:15'),
('bbbdb18eabf6ddf28c222017507c595dc1fe3e3bb56ac4241c665f94d379a427a1074682e398334d', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 06:32:24', '2025-06-16 06:32:24', '2026-06-16 06:32:24');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('bbc65dc2d0cd1e9ef2aa03e8c5775480558973e7b06e38c64e71aaf70a8da2f8a6ea767219f97734', 163, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 05:03:55', '2025-07-08 05:03:55', '2026-07-08 05:03:55'),
('bc17a98f208c53eb2ec33c058aaf7d04847167b0253de89e3f48952daef498e9bd95efb63f54e42a', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-21 06:21:48', '2025-06-21 06:21:48', '2026-06-21 06:21:48'),
('bc33b7cdbad765e2b173df6fe8531207bb70b427ea891dd6516196ec904651944087af468e3a3d60', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 06:19:02', '2025-07-10 06:19:02', '2026-07-10 06:19:02'),
('bca5e281053323c2d3c599c006ebdeee73a374d1890f7bb9e64f63ce7dbfe5ec59a5e4fcba16675a', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 05:03:36', '2025-06-27 05:03:36', '2026-06-27 05:03:36'),
('bd72da5cf9b749a5ecf1e60bf315c1816df4e62d3fb8af2a5344f132f970f7c2e1f0863191609e7a', 85, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 15:25:47', '2025-06-19 15:25:47', '2026-06-19 15:25:47'),
('bd867c0c22576f6a3183c2cfe05cda78cbc53a752d29acfc450f2e8f53c663da9e8b6d66ee780c29', 65, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 05:57:13', '2025-06-19 05:57:13', '2026-06-19 05:57:13'),
('bddc3edc0c36ef083b253492da2488f9a61bed838f35e46406735416f4207fc3e1565755cec7b4b1', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-25 13:12:08', '2025-06-25 13:12:08', '2026-06-25 13:12:08'),
('bde2dcbeec4c96f71f4638fd80202d73faa60e864ec66ce5e9bf092a4f49c7a7bfc7e45d4e965ef8', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 08:17:04', '2025-06-16 08:17:04', '2026-06-16 08:17:04'),
('be243eb518659fd4e50f16c2f7c81a4ce1cf6c21cdb017a17820ff187e9d8530d55b6a19303baa60', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 08:24:16', '2025-07-14 08:24:16', '2026-07-14 08:24:16'),
('be8a15c8f6c0c3b4497d74f452a95c081f3963593d786c4edd4efe7056cee8e3e3d377ad977829a5', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 10:34:38', '2025-06-30 10:34:38', '2026-06-30 10:34:38'),
('bea745f12c906e0a49d805c8e2ffb962f6dcf05ba1a0fd5209f5469a10aee8afb5d8ebfe847b4f4c', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 08:47:10', '2025-07-14 08:47:10', '2026-07-14 08:47:10'),
('bed21d478e632f208e5c781bc897dd844ee964a5da36f6958eb184d3960aaca9181dc8bbc730c86a', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 12:48:03', '2025-07-10 12:48:03', '2026-07-10 12:48:03'),
('bf50cb0d4b1189d451fe35d77156947c73199c596826eb50103349dd9550690d9cd595dd63f90126', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 06:18:15', '2025-06-30 06:18:15', '2026-06-30 06:18:15'),
('bf6d3f284d042ae2b041226e4bf26f7712701303794b3cb4e8baed691ef6c860d347f5c25cf6c506', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-15 06:56:16', '2025-07-15 06:56:16', '2026-07-15 06:56:16'),
('bff6774488314d840044c8d3279b679d5c33acc3198ae8d49ebf0cc47f96d0de354f132d34b91be3', 247, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 08:14:24', '2025-07-12 08:14:24', '2026-07-12 08:14:24'),
('bffc7bfdba6dce70930cca448e5a66e0d59a4c7bd994b0efb2f1522e089ef0c7a96f04dbe9095b44', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 10:13:14', '2025-07-07 10:13:14', '2026-07-07 10:13:14'),
('c01c95ae7639e87d60e230a8132075c5f3b590adbd22b8bbd76bbcbe4a0c7c3b864901d30c22d963', 61, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 14:39:20', '2025-06-18 14:39:20', '2026-06-18 14:39:20'),
('c030ab9443115f5ec69093890dec54601748791e250111e55bca6adb006f84892565d4174fa47c8b', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 16:06:07', '2025-06-15 16:06:07', '2026-06-15 16:06:07'),
('c0d184109409c9efc532d43d1b357765811a3c8fb658f70494f9b79e43212232638e62b1d884e9af', 65, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 06:20:01', '2025-06-19 06:20:01', '2026-06-19 06:20:01'),
('c110c97efb7448d185b921c350679e5faefc62f825d967f617cc83d3e34bec7ad7da342058dd6601', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 12:50:35', '2025-06-20 12:50:35', '2026-06-20 12:50:35'),
('c131e532d8489c104fc5d1b28b4b70f3f061b54066b2d550c54bf5743ef27d5c3ea5fd04e12818d0', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 13:32:03', '2025-06-28 13:32:03', '2026-06-28 13:32:03'),
('c1929f64b97bc435175bdf8bc2e9558d0bacdcafae82952894607e5f3c489fb492a199671e0fdd1f', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-09 05:29:56', '2025-07-09 05:29:56', '2026-07-09 05:29:56'),
('c1a1394c8ae57005d2164855e9fd8140d3049b6b0066bc9fb892c188ab13e3b17e3344ca6146199e', 3, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 16:17:39', '2025-06-15 16:17:39', '2026-06-15 16:17:39'),
('c1dd80e811b0f11220130f48108839cd3131df7426344e9b462301bf7ad14afb0750a962695c1be1', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-03 09:05:37', '2025-07-03 09:05:37', '2026-07-03 09:05:37'),
('c27969e9efb7f4f0c3eae3d82faa7330c15b3364acac43e24411e9e562c5ed0330f166f1be68878d', 128, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 13:41:34', '2025-06-30 13:41:34', '2026-06-30 13:41:34'),
('c2b2d989598f2ea6ed9f41e188ae241492329d67e4f8fba7b4b276952d42906604c19c4289a1e9ce', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-21 11:32:13', '2025-06-21 11:32:13', '2026-06-21 11:32:13'),
('c2bf8823570341ccb007b03c396461d55fa26a8c0880be36af93376d1220a7da2ee58e8b264144ca', 57, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 12:44:39', '2025-06-18 12:44:39', '2026-06-18 12:44:39'),
('c3182f37673948962784917d145a937839a1426eadc2adce8ab2e0064702f625e657dd3e277c286f', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-26 13:31:24', '2025-06-26 13:31:24', '2026-06-26 13:31:24'),
('c34259f65f84a3fa2ceb34329afaa75029cbb30d8286ab9d8d185a360d63a0dc93ea99b49e416722', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-26 07:26:54', '2025-06-26 07:26:54', '2026-06-26 07:26:54'),
('c358914699fc99864f838bed718d3adc110db370450308aa51b52255b447825cad15fd2d4321f79c', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 11:43:12', '2025-07-12 11:43:12', '2026-07-12 11:43:12'),
('c3f5985710bf267596e75a6f1cbac0a61147c1598cae2641fea5a7decef619d4e278fe4fb9b0949e', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 05:26:51', '2025-07-08 05:26:51', '2026-07-08 05:26:51'),
('c4207811de3af5012c44b077853645d2776aa527a30ebaad446ec60e15dea13dac92a69e13b0f446', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-21 11:17:37', '2025-06-21 11:17:37', '2026-06-21 11:17:37'),
('c427196155916df082bb7a80620c7d5891e14e24faf535e1baaaf958b2cacdb5370a5d5c1f2176f8', 35, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 11:10:34', '2025-06-17 11:10:34', '2026-06-17 11:10:34'),
('c48e1d5f29bca6c160747da11e365807be2dafdc4079b2590f2948a52ff902b06235e2152cfc411e', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 11:14:00', '2025-07-08 11:14:00', '2026-07-08 11:14:00'),
('c52bc2bea50358027f57a50a62c460e60b58210dab72722ba48dc85ba5d579ae056429e74f9391e6', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 08:15:53', '2025-07-14 08:15:53', '2026-07-14 08:15:53'),
('c566c38a98091e83cc1ebdf8d34295557f75e2fab1c029f7810cd0f152f6b9543ea8b04b8c275cc8', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 12:10:59', '2025-07-08 12:10:59', '2026-07-08 12:10:59'),
('c57744c78c9e5bc6c7cacf8edf1a5baf9062e60e342bec7472f279538cbfde1b378f4b67efda52c4', 23, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 16:35:27', '2025-06-16 16:35:27', '2026-06-16 16:35:27'),
('c5b39eb413424aa7f15f9c674a7939a0f15ba4477888612fc27b7530404483f19c73d37c5d0fb596', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 14:22:33', '2025-06-30 14:22:33', '2026-06-30 14:22:33'),
('c60d4b655f6bab41f851523dc021cbac0eda4b52aa49e938d9bb2b07c64a3fa1974c7cc06be7584c', 183, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 14:34:03', '2025-07-10 14:34:03', '2026-07-10 14:34:03'),
('c63d4661d896131ce9862fe502655f3a4b6374c18f6af3aa45dbb7b2270673d2074fba2054a22901', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-25 10:49:46', '2025-06-25 10:49:46', '2026-06-25 10:49:46'),
('c689c1fc3cf2ff04643ca24de06350c7585302d87add87992943ff631780129db44b1a12a90dcd6a', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 06:05:27', '2025-07-11 06:05:27', '2026-07-11 06:05:27'),
('c6daee59da0661f093429ebe83db25c2c06049dd8f2becbdc7c048a9a5eb6a45a871ca8c3a8be9e3', 183, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 12:18:41', '2025-07-07 12:18:41', '2026-07-07 12:18:41'),
('c6e9933bfcb05fd73a978a0638456ef6cec31b539bd3546ef0a9c59e2bce7c84edccd5982bb59392', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 07:26:22', '2025-07-10 07:26:22', '2026-07-10 07:26:22'),
('c6f2ea18d321a11bf5c41e98b0f118d1818f87926e7e5eee36abb1954abbc22ede0b582bd667c079', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 11:40:07', '2025-06-16 11:40:07', '2026-06-16 11:40:07'),
('c71a6616da7d9e74f23d5aad484029fabe81fe0285a66031f5365e03d565b7c2fd42eabc33daa1e6', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 14:23:38', '2025-07-10 14:23:38', '2026-07-10 14:23:38'),
('c7b840ab4c3483e8775866f5c8fb90cc073f58b15c7aa9590d53823c8aa1bf3dbe8a1c59596f1a5e', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 06:54:26', '2025-06-30 06:54:26', '2026-06-30 06:54:26'),
('c80ccb716749a6064b48b1c8092c24363dd92767669588c76a3e6510045216d39d3df5d44bbce95e', 55, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 08:00:12', '2025-06-18 08:00:12', '2026-06-18 08:00:12'),
('c816760f64956a12e0d4e283e5056dc3a41aace14a6c10bc4154b8f3c0eacfc24cf95624a265f0fe', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-14 13:16:05', '2025-06-14 13:16:05', '2026-06-14 13:16:05'),
('c8207372e24f75b2d1e8e2566a189c1b4f76152a44d0c22b4033aebc91840a7f15d8ae1e933749c9', 247, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 05:31:34', '2025-07-14 05:31:34', '2026-07-14 05:31:34'),
('c828ebcfe89cc521ea06309753d5f75b4bd05b5da54fc4581b7d069b5fef570e8a6fdd308eabfa8d', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 05:38:12', '2025-06-27 05:38:12', '2026-06-27 05:38:12'),
('c84eac4cbdb71fcadb611c89883909695f31502866ea2228de798274b6a2dd42837c63dc6aa7b2f9', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 13:10:35', '2025-07-10 13:10:35', '2026-07-10 13:10:35'),
('c86b015aed6113361b689dcdc3c7568251627c6f95b43e95502423375af51de2565879f4b07e2f97', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-04 05:40:39', '2025-07-04 05:40:39', '2026-07-04 05:40:39'),
('c8df8825299273aeafd91e74e3387b2ed069ba77fe446658d9e81599422a6c6550b7355879846d71', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 14:48:36', '2025-07-10 14:48:36', '2026-07-10 14:48:36'),
('c8dff17cdfa6674ca7c695e24918cb0e19d332c3a87be7c6921b5b593218ed6db829bc66ea7738e8', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 10:15:20', '2025-07-02 10:15:20', '2026-07-02 10:15:20'),
('c943e8c2125e199d6db0635d551aec18879cf7bbfee2c162cfdd361739888ee41057e3f564890c9e', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 13:23:28', '2025-07-10 13:23:28', '2026-07-10 13:23:28'),
('c9483ba81947a48fca134d2945cebb24c21bdbe44957aed5f75f18744bbc59031d60396e3ca3464e', 65, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 06:01:53', '2025-06-19 06:01:53', '2026-06-19 06:01:53'),
('c98ede7ff4cf5427ca1fa9427e0ef90e9cbdcc081c4535a318a5f2c4d04ebbab6d332f5ce882e91b', 95, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 23:31:51', '2025-06-20 23:31:51', '2026-06-20 23:31:51'),
('c9b83cc2ca4703c9c9cd1eff129ee9c2be65f12f0a31bb7a34102988a13cdff0c1ac2a74e78cb8fe', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 11:15:42', '2025-07-14 11:15:42', '2026-07-14 11:15:42'),
('ca8cd317ae5dc5bfb764502a996cb30bbff3df5ed65871a5c5861c0cd4cd5d76c0970e876da05fa3', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 06:36:29', '2025-06-30 06:36:29', '2026-06-30 06:36:29'),
('ca9224c7125b23f78ab0db41a029b0665b1c078ba411299c0857ea305ba2d5dc5b4abaaa82ea5e1f', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 12:56:00', '2025-07-10 12:56:00', '2026-07-10 12:56:00'),
('cadd8bf55807b7eecd9aa7b717ff986cc73202b11bd6e3a9dce0f1b4283c9a7fa4c99ee051a8cf3b', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-03 06:29:31', '2025-07-03 06:29:31', '2026-07-03 06:29:31'),
('cb0a8ba7952bea518a28496c1449a21e75d7943e4164372eea66fd0a1fea84905229c4f04e839631', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 10:07:47', '2025-06-17 10:07:47', '2026-06-17 10:07:47'),
('cb611f94813c517a21c4cd6a59df2fe2b6c7adb6ae59142000580be7a481b3a3b4aab1e65fa14e42', 278, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 12:49:23', '2025-07-11 12:49:23', '2026-07-11 12:49:23'),
('cbe539774071c092eaf03fa2d3815d257e3b838109079de4e9e4c668e9d194e7aadc6c7240c40b51', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 16:13:35', '2025-06-15 16:13:35', '2026-06-15 16:13:35'),
('cbfce33f157c6775beff9337f4a726a31dbdc61b0d6fe7240f76ef9159b7a497fe2fd49a308308dd', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 07:18:20', '2025-06-16 07:18:20', '2026-06-16 07:18:20'),
('cbfe1bfc3eb211b132045548ccfb83e172dab849ad905fe628ad7575ec0ddc005878d552cb4d7b4f', 278, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 12:57:02', '2025-07-11 12:57:02', '2026-07-11 12:57:02'),
('ccf6dca576f1d91d696f3bba95bfa93cc6c436c8d1fc38912e48713ac186b7e914962c346ff2676d', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-06 06:03:16', '2025-07-06 06:03:16', '2026-07-06 06:03:16'),
('cd5a8bd1da753b4c7d0f964c8f389387afe58a9043bef7819c9d98eae6b1baac1489539d59336f87', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 11:21:58', '2025-06-24 11:21:58', '2026-06-24 11:21:58'),
('cd727ff42f7cd7359ef67eaf479a44648562e23ad93194281eecd6c75f7e3ca060d72112f3767be6', 82, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 14:43:50', '2025-06-19 14:43:50', '2026-06-19 14:43:50'),
('cdd821b6d3fc42145d92a91912cf5539dfae1c69bd376f5217ad57bafb46db5e1ceaf3b78e058bd9', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 06:23:28', '2025-06-17 06:23:28', '2026-06-17 06:23:28'),
('cdf5135935c0480911cb022f08bde50ebd282fa7d17ef2bffa902e36a82568674ed8d57c99e2715a', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 06:10:41', '2025-07-11 06:10:41', '2026-07-11 06:10:41'),
('ce0548528b39233f4b429f3d8578e02804c742674b80a320d10ba57f40bfac0b4c0bfdae6ace67cd', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 16:24:31', '2025-06-15 16:24:31', '2026-06-15 16:24:31'),
('ceae9b752467ab9fd73a182c3269fbc27a2791b5af8140de92cd0ac83ccf3a957a86661b16f05977', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 07:51:10', '2025-06-16 07:51:10', '2026-06-16 07:51:10'),
('cf0c630db43071090d0c53e9d626be696feceda8117befac024462a1550bd420c3c98006cb048a2b', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-25 12:14:23', '2025-06-25 12:14:23', '2026-06-25 12:14:23'),
('cf2123cba82b7cd8492a21a307580f032c02be2cab5dba47cf619b8ab404f886ed2acce45c82d56f', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 06:34:29', '2025-06-27 06:34:29', '2026-06-27 06:34:29'),
('cf6d3d634e65d343016f3ce8eb752cd031a4a5a10a99aaa1456303fa3db3baf319c8086b0e76c34d', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 05:52:35', '2025-07-08 05:52:35', '2026-07-08 05:52:35'),
('d04163b6bcfe2100f72b127da9619e2d46812598f74fa26d185e2e6bfcea0f51fc49ee5e304aab9d', 281, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 14:18:38', '2025-07-14 14:18:38', '2026-07-14 14:18:38'),
('d08d0251f0f35b2a544fda82b1f5a42da1b5ccd20827ce273aab387e318592f3919ec22f7494072a', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 12:49:11', '2025-06-19 12:49:11', '2026-06-19 12:49:11'),
('d1151b940600bd55e8b950dac36965910b0f54209158a26bd59c37ef73460ea405f67e41e521472b', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 08:44:21', '2025-06-18 08:44:21', '2026-06-18 08:44:21'),
('d19d8ef78ffa6da318046092ccbd9703d1d044905f4c4e8c525bcbd278d3107b0744232e635020b9', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 20:59:03', '2025-06-20 20:59:03', '2026-06-20 20:59:03'),
('d257d14e97da00e07442d5762d7b6da4ad60cfd41fa552801a0d743975b02185ae0f34d208b21ddb', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 17:06:47', '2025-06-15 17:06:47', '2026-06-15 17:06:47'),
('d2efbe3391eb9cefe7821db5688d488cdb5356ce70f5e7157edefd7e8400f88099c4ee35584ba242', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-21 06:15:46', '2025-06-21 06:15:46', '2026-06-21 06:15:46'),
('d2f7110616621b0d352b59d690fa096ddbf9ed81b947bb6da02c9917e4b47ffa82769b6ac6f2b4d3', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 08:18:27', '2025-06-30 08:18:27', '2026-06-30 08:18:27'),
('d30609f7429b35f722f77d793d2b9ed5a21447812c2bab10e45de932e614ec698cb9165ffa2ae26a', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-26 10:18:32', '2025-06-26 10:18:32', '2026-06-26 10:18:32'),
('d32cc7eebd1b5c8e46812bd80810562811bf0aa1b44e757d01cc58933e4fa2ac6838dbf13a4866e1', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-17 05:50:27', '2025-07-17 05:50:27', '2026-07-17 05:50:27'),
('d36c629ea01c0c5526ddafe7e0dbd8ffef20bc10ac08c76b74d59086f905a529babdde7a267f1eed', 93, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 14:45:31', '2025-06-20 14:45:31', '2026-06-20 14:45:31'),
('d3d56709e846722706029e7a70ee5577c8d1e1b9a726e87a6383159fdfee98a85942ffe974558f0f', 75, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 12:55:42', '2025-06-19 12:55:42', '2026-06-19 12:55:42'),
('d40c7d69303d08a45b6c1c641a371ed3fe63e525fd991dd024af44ff4e7b2ba5baa30caf0837167b', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-01 09:52:22', '2025-07-01 09:52:22', '2026-07-01 09:52:22'),
('d44c709dd60fbdd55b2bdbf0d931a9b36bf58f095699d961b42798b3b88ad9ca3394d5d369f6b2c5', 73, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 12:11:44', '2025-06-19 12:11:44', '2026-06-19 12:11:44'),
('d4c678cdb7e1a7bbea68f8ab11012bde23b83dc7542074fa14dc6807c596b861602af55a61ab72a0', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 10:15:49', '2025-06-30 10:15:49', '2026-06-30 10:15:49'),
('d4de3d07fe5b30038bcd8c86cc11a3c40e976f1369b039a69e5815c4db06e36a2a0b7c0d52e6c66b', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-15 06:28:57', '2025-07-15 06:28:57', '2026-07-15 06:28:57'),
('d519a1b7cd57a31170ab2967b3f11a1d16153904567b34a8af2e0f15bcd6328febccc3072c66884d', 86, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 09:04:30', '2025-06-20 09:04:30', '2026-06-20 09:04:30'),
('d53584b13a9e146e42b1da8f34ed66e518979edf40f57f83e650099a38e6968db04bc2ebc7623de0', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 12:08:48', '2025-06-24 12:08:48', '2026-06-24 12:08:48'),
('d5e957977d059d38b227fb3f1f5e15b6e4fc4d92e7797581ad1755b2bbf964441307832f6c201b66', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-14 13:14:22', '2025-06-14 13:14:22', '2026-06-14 13:14:22'),
('d619e5d1cfa158a46ab3a9378602f5a6b5f094c28354e4eff1f96b6edf5ff7371dd5aae1231d3615', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 12:16:20', '2025-07-08 12:16:20', '2026-07-08 12:16:20'),
('d6554f02b205318b404759153a7f92b8b70e2412d5e8e5ade2b2837411d9a4322d61607f196ce1da', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 06:34:33', '2025-07-11 06:34:33', '2026-07-11 06:34:33'),
('d691b28e1d6c018f87589e1bd65e07eb1f95f306cd671f90b9e05ccf367fc9f7f988016c4c3b8902', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 10:15:50', '2025-06-30 10:15:50', '2026-06-30 10:15:50'),
('d6cb4b1a43683a9824456ccb37d573cab7d9105c0ed5ea2f5e67cac477db82f7e07985d1c9695380', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 10:15:48', '2025-06-30 10:15:48', '2026-06-30 10:15:48'),
('d71f567d296ee4bf29cf5b0f8793f3053c0c85a98f5c4b46b5c98aab20847d5f28f0e50f20f2dda4', 151, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-03 08:21:14', '2025-07-03 08:21:14', '2026-07-03 08:21:14'),
('d767eb7d77e77f532e280100f83321f567279c4f26647d2272cdf2e1d1e69107c791ea24f016beb0', 278, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 14:46:34', '2025-07-11 14:46:34', '2026-07-11 14:46:34'),
('d7e7864132baa2a052067063b183f6f854148cc37242100c427e54e11c3baf289f5fdc2cad6ac992', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 03:34:02', '2025-07-02 03:34:02', '2026-07-02 03:34:02'),
('d86c69392eb7457f90a420357d40f32362abd614ce5975de5ca8401f5d4375109e01bfe76718c4ef', 96, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-21 09:47:34', '2025-06-21 09:47:34', '2026-06-21 09:47:34'),
('d881808b004ae6b73b43762c13218da6260af586b5d3f5be94e993742b35a9974e02d76d2d0485c6', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 05:29:16', '2025-07-08 05:29:16', '2026-07-08 05:29:16'),
('d948d5d75b48b0db1eb3c55e244031e3aaf968970cf8d9de99ba5fa8d169e7df9ae5a0bd9c19b405', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 06:21:04', '2025-07-10 06:21:04', '2026-07-10 06:21:04'),
('d94dbeb7fe04ce6f932ef04442e9f7a80a90957da9209bfdb5b975b2b856b26305e0ee49646104f7', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 15:00:37', '2025-06-27 15:00:37', '2026-06-27 15:00:37'),
('d98e4a33d6457127614ab3b19cab8fcffc7de3dca2b7731b852dd5031ca25dddc8e5825a460bf2f3', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-01 09:55:53', '2025-07-01 09:55:53', '2026-07-01 09:55:53'),
('d9c44166d44c0990a7f514045618aa366f369107db16b806bea54647be29875b6aae5c52d4c5966a', 65, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 09:50:22', '2025-06-19 09:50:22', '2026-06-19 09:50:22'),
('d9dfd068329427bc99d0e3c99f64d4123d32526962f8d96cfe89e0ade282cc5a36bd46cc747a0e75', 150, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-01 10:27:30', '2025-07-01 10:27:30', '2026-07-01 10:27:30'),
('da3fbd17db60312760a152202ac1dc00175264c93e6a9d139dee7c714f4ca6345ebd3ae0d59ce527', 77, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 13:50:53', '2025-06-19 13:50:53', '2026-06-19 13:50:53'),
('da4bdf8ad9711cce99d8ca5c4fb2afcf37253467df92c2f12b8421d3a7d7239ecb0696f47b09e463', 183, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 06:01:11', '2025-07-11 06:01:11', '2026-07-11 06:01:11'),
('daa82f5fb4a51157045fa20310e27da8dc1060d74e437007f0b5c98872cdc974df164bb0723bba05', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 09:16:21', '2025-07-14 09:16:21', '2026-07-14 09:16:21'),
('dae4ed4716e520f5fd7b227e4b86a2dd3801e537c442864ebdd5fa71de7d43054746b12be85fd931', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 12:24:02', '2025-07-07 12:24:02', '2026-07-07 12:24:02'),
('db5ede74c6ccc9bd7ab336f413c24d6da4259621f39a2990cbf307339a8209368e241fd85cbc0645', 61, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 14:37:25', '2025-06-18 14:37:25', '2026-06-18 14:37:25'),
('db6740c6c60914de48eabd82f9259519b058b00da1a55c5d7b503b77d4868d9af1c84210eca4f2df', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 06:43:18', '2025-07-02 06:43:18', '2026-07-02 06:43:18'),
('dbae852258af811041fdecf63bd012bcaf6c33d26a4e2be72d5f8fd042e8e45d930af041a2e40f2d', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 05:19:16', '2025-06-17 05:19:16', '2026-06-17 05:19:16'),
('dbe6fdd3a5acfc3c9f03607e224ccb05e7e9b6d522fe2a066ba2a991da99561c41133e6e7371541b', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-15 07:21:18', '2025-07-15 07:21:18', '2026-07-15 07:21:18'),
('dbf0ac292013cea00cbba1f391d540f486be043d62f5460ac1ec0ca321f654a214c96296f50580ef', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 06:12:41', '2025-07-11 06:12:41', '2026-07-11 06:12:41'),
('dc1879dfe6903e4db88dbb4b9acebc52ce95db185c95b9a51696695572171a2aded8fcc13d288440', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-23 07:30:11', '2025-06-23 07:30:11', '2026-06-23 07:30:11'),
('dc471977f14e306afff828b77561094eb0fb3d1130ee103364ec0b4bb47c7ccb70252388629965ec', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 15:12:21', '2025-06-16 15:12:21', '2026-06-16 15:12:21'),
('dcbc3c19aba73ec12567654d0f202cd3cad9b6a3123de433bcee233b91dd3fe29b03815d2803cccb', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 14:50:37', '2025-07-10 14:50:37', '2026-07-10 14:50:37'),
('dd34d8eae09e37fc451502fb2fabeb4a6d0fc07815c5ee43e331ae33dfe97b18d27f8f84ed73a53e', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 10:47:45', '2025-06-30 10:47:45', '2026-06-30 10:47:45'),
('ddd696ff5bc22c3a8782d088efdb6f50b76776ff1af780cbe2c429682d356c1d4f374bba9172ba69', 61, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 14:37:45', '2025-06-18 14:37:45', '2026-06-18 14:37:45'),
('dddd4e56fa8cefb5e9e1fd486082fafa6a7b5058ddb476ccb1f2224318216ca9e41e9cbb94dce655', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 04:49:11', '2025-07-11 04:49:11', '2026-07-11 04:49:11'),
('ddddb5f134313084b3296ffc3ff5ad387244b79743879ec9794d988b36bd6feecb26dfc27b302876', 70, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 11:06:51', '2025-06-19 11:06:51', '2026-06-19 11:06:51'),
('dde3d70e1b0f66ecdcaf344280817a0a5b0f3a852ba91dde87aebd9e6649b3a796ff4d0be9f338e1', 263, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 13:34:10', '2025-07-10 13:34:10', '2026-07-10 13:34:10'),
('de2a9cb55cbab392cfce64bca8abc0afc2113317abee7e9708cd4a653bf14b8d38521b520c1950f3', 247, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 12:40:45', '2025-07-08 12:40:45', '2026-07-08 12:40:45'),
('deb0f9cd18ffdd48c626947e3919aee129f287b5d4f5b680b2942d3d1572ea3d5462c22e0ca1e4fa', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 13:20:10', '2025-06-30 13:20:11', '2026-06-30 13:20:10'),
('dedc3d7713e9d855edd7d6c61c951b36f7d8ff260ca38dd8248e409112015dfc4fc9ac3c035843a1', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 04:44:15', '2025-07-11 04:44:15', '2026-07-11 04:44:15'),
('dee70728fdd192861a2c2314375107d2ca9fe953480f0ae60f9f60bdd1983b78bee0eb4f8e5433aa', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 04:49:43', '2025-07-11 04:49:43', '2026-07-11 04:49:43'),
('deef67251a13f4f8aa84c242d4ea067b955ac2db94adbc9c79b235a535a4720e0e47229384ad8ad4', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 09:39:21', '2025-07-11 09:39:21', '2026-07-11 09:39:21'),
('df40b87da2332a3232b8d3830c943f61aadcfa408f24da89d0105a5581db181ae6f18eb34b05994d', 282, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-15 07:36:07', '2025-07-15 07:36:07', '2026-07-15 07:36:07'),
('df54e32960ad3d5936c2a32772ce680e1cd01b2e188d084ba64fec1d4d79fd6690b8c377ab8e5b70', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-23 10:49:32', '2025-06-23 10:49:32', '2026-06-23 10:49:32'),
('dfb23a263823eb24bca54f5dbf47cf1c2a14783e45b7e0818e43a9011a0902011307e9a0aeab3011', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 06:09:43', '2025-07-11 06:09:43', '2026-07-11 06:09:43'),
('dfb35f390573790f7aba925eaef43804bcabed42098b762ec0366f9b13b813745b1623caf45d73ab', 39, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 12:27:17', '2025-06-17 12:27:17', '2026-06-17 12:27:17'),
('e02c464fcdb36c57a73096efa1f8e006ee5510882b720736c58afdfee2327995bad2c1119aaa19f4', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 15:14:20', '2025-06-30 15:14:20', '2026-06-30 15:14:20'),
('e113c6cd5f6ecddce16591f1b227d67a64aa5431cd34882cacdaaf31c365c3b9c2d8a51184a89cb3', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 10:14:55', '2025-06-30 10:14:55', '2026-06-30 10:14:55'),
('e17bfb5ad3144f85eab9f434f6d77bd44b17fac8d065d0c8dfa509589ea44994c9e042836e527fab', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 13:09:53', '2025-06-16 13:09:53', '2026-06-16 13:09:53'),
('e1cc6067cbcdb5bb8e76ef7e0a6d8f9a203b44172fe7c9a54618cca3cc1796855b1173d68b1338e0', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-01 06:22:36', '2025-07-01 06:22:36', '2026-07-01 06:22:36'),
('e1d854efa387653b103fee6689522b0c7f1d3ded617f9e773f8a9116f2999d794889f499df77b354', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-15 07:27:28', '2025-07-15 07:27:28', '2026-07-15 07:27:28'),
('e25fc5e1ec2356a6c7c2d0ffb5214ac6ddd0c1b112b538abf433b5e3894296b68121c8d737973917', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 15:27:16', '2025-06-30 15:27:16', '2026-06-30 15:27:16'),
('e2e5f926f060036f819cc202f6db68889605b86b59605ca73873cdcebcfa25eb343810547de223f9', 163, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 08:18:07', '2025-07-08 08:18:07', '2026-07-08 08:18:07'),
('e2ed0c39e3ba81d39c0c77b2c31a27e441f5f85a69405664c96cc62d3603dda8b818d26263b416ac', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 15:02:07', '2025-06-27 15:02:07', '2026-06-27 15:02:07'),
('e371e4cbdabfec1afac9df52a8a7cd8e9fbb98e4474d2a2f1e6fc7219a2e3092b18bc42506f94c60', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 16:13:17', '2025-06-15 16:13:17', '2026-06-15 16:13:17'),
('e429f983f49889c665e13833bf9cd8e33e807457d9ed08701ad5d4a9fb76579f927d688e5cfdfe91', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-17 06:40:11', '2025-07-17 06:40:11', '2026-07-17 06:40:11'),
('e51c92ffde2da927888e49555855c254c418e1f76eb3467ef59448ff2c5f4e2504fed61dee15069c', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-25 11:26:32', '2025-06-25 11:26:32', '2026-06-25 11:26:32'),
('e5604da61167a1c009c86ff20bd619f3a700f4ffdf950eef5c1da3289ddba4cd09e2c0a19e844ce9', 35, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 08:32:08', '2025-06-19 08:32:09', '2026-06-19 08:32:08'),
('e5b37bce22ee2168f528ad908cf53bb74f83881acb9983e0c087befac93c165725d505ac41cfd162', 68, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 10:31:06', '2025-06-19 10:31:06', '2026-06-19 10:31:06'),
('e5b6ac19c464d553a58b1019855485f79ba6c791f126b5df7d91a355687531e5591a71ab449a76b6', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-17 05:03:01', '2025-07-17 05:03:01', '2026-07-17 05:03:01'),
('e62a777b2aa9de3ba4677226cd745e1b31c930ee5074a3e99e868aea7f6443db0e090c05a1f24f48', 192, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-06 07:05:32', '2025-07-06 07:05:32', '2026-07-06 07:05:32'),
('e62bdf4573fcd59af65a7c87f23622be6c832ac0d8d6c78a4c527b4cc6c7ffd86d232c5cb08e7e4c', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 13:26:01', '2025-06-30 13:26:01', '2026-06-30 13:26:01'),
('e63354cbc365af8fd45af14b68d12ef8b9fad7d88bf6d92f6efaab078085121afc6d3896ee33bd28', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-09 08:17:03', '2025-07-09 08:17:03', '2026-07-09 08:17:03'),
('e719740e33916bee9bc223afce9eefc8dcaa2fffec5694a68fa28d4536b4aa94d0519a30b0c573dd', 36, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 11:45:26', '2025-06-17 11:45:26', '2026-06-17 11:45:26'),
('e75591c202d67ff6c383ae4cd6d44f51be69c2e058368609eb08f67250ac80c1a247863f77709531', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 06:49:58', '2025-07-02 06:49:58', '2026-07-02 06:49:58'),
('e7bc77bf2080f7542df7c7d161896237f6121ed53eb99113c085e885b15af32da98dbbfc7dec5a1a', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 08:13:57', '2025-07-10 08:13:57', '2026-07-10 08:13:57'),
('e7c90a1c03db4c53a098ba6c588ce85a043c88833d3868afd7c95c0713bb69b90248da8053c4a119', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-26 07:07:09', '2025-06-26 07:07:09', '2026-06-26 07:07:09'),
('e863833438636e80640b27bdfc5bd76b52af60769ac7030e47b2b99a3123f48b5117938fba4aaa82', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 04:39:16', '2025-07-07 04:39:16', '2026-07-07 04:39:16'),
('e86dbb86d95923ebbc7fb22d4b7834cf4e3cefb47aa4d842a22038c06be9b9c406e9c9fc43379b6a', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-14 12:33:40', '2025-06-14 12:33:40', '2026-06-14 12:33:40'),
('e8e2bcf8760cf282b563e0c1903c80197472ea865512825dcf5d424edbc839767d4c7a8bb1023e47', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 10:03:10', '2025-06-30 10:03:10', '2026-06-30 10:03:10'),
('e92252d1e2566062f9f3aa9f5623dd0aba2d328534ba7fb6f41d74f3a4297886babb8b6fb848ee9f', 192, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-06 07:05:55', '2025-07-06 07:05:55', '2026-07-06 07:05:55'),
('e9785aacd48ea9a264e19c804c7dfea28cfc4a18eed02a36ea5d3c0aca1a24027b566710c3b95b21', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 11:51:22', '2025-06-16 11:51:22', '2026-06-16 11:51:22'),
('eb5dcb4b075e7cce2b306022e0f9f6fd004b37f3b4b593ef04becbe8d768632e6917c35dc20a1ca7', 149, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-01 09:53:08', '2025-07-01 09:53:08', '2026-07-01 09:53:08'),
('ebbd04e75d6a23ffc4a08061bbb21422fdd8dad24063da2bcf89d550c9b7823f6aea5113c3bcea17', 134, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 15:19:08', '2025-06-30 15:19:08', '2026-06-30 15:19:08'),
('ec16465a0a0795189c67089043fddb35b9b4c24cbf831cb14fe695aa36923738c2cf793a5dc7dcb5', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 11:33:19', '2025-06-24 11:33:19', '2026-06-24 11:33:19'),
('ec69e4c907ca21b7afd62f6fe543d65683d0e9dd2ae98c0fc7fd93aa6c02732f97c0049add4d16d9', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 16:22:15', '2025-06-15 16:22:15', '2026-06-15 16:22:15'),
('ec78f332f065251a25836a3a1973140a69d84fbd84e27500f81ab2954215714ba985fa9c4b0efc88', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 16:21:15', '2025-06-15 16:21:15', '2026-06-15 16:21:15'),
('ec7bd727e7df69e8858c945ad3c760f595074b7da5b34f534cd14df68bfab3733e393843b7ca8b39', 151, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 12:35:50', '2025-07-02 12:35:50', '2026-07-02 12:35:50'),
('ecb90e0cf3e1478438e591d1762c5a2f972ed4f4c17ed66afa717eafa10859b3a5c282df16e98b7a', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-14 09:20:31', '2025-07-14 09:20:31', '2026-07-14 09:20:31'),
('ecc03321034882b27f643bde7387dd912738e63097a42c2ec6ec6e87a8155e0e43d44596955a6aeb', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 10:43:31', '2025-06-28 10:43:31', '2026-06-28 10:43:31'),
('ece0ee2e1a829dae3e26564b1803a2f0934a41894cfdb7c5115787b91a998a4c3fc1be9db99eb290', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-26 06:58:48', '2025-06-26 06:58:48', '2026-06-26 06:58:48'),
('ece97016c5a07fab5fff09161b8995073807f14096b8d1d29a54da1a2b67583922cd92a0868d9a3e', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 06:17:10', '2025-07-10 06:17:10', '2026-07-10 06:17:10'),
('ed325fb3082c40a7bd2060174dc5480592d87a7cc6c600a794be08b99e33cfdcd79c301e36cf1f8e', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 11:20:55', '2025-07-12 11:20:55', '2026-07-12 11:20:55'),
('ed99d3a66b01789992d45abe349443c0a9886b79c0a1c3a2e001574386c1f02182652da494a3fd3e', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-24 06:24:40', '2025-06-24 06:24:40', '2026-06-24 06:24:40'),
('ee4536b7714a2a8db8a94eebc696a9369a6bc047bc38851cead921f8f3c560457a212a0342866b16', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-25 10:08:11', '2025-06-25 10:08:11', '2026-06-25 10:08:11'),
('ee8fbd643e94dfedac3895e435acea9229e06968cfa3c57271c4cdc749935dbab73953402dc9d8ae', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-13 08:09:22', '2025-06-13 08:09:23', '2026-06-13 13:09:22'),
('ee91b875d720ef858a560c43f66f8a0f30fc441d5cd65f372dcb59b93bd16126df0c9f1349f8956a', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 11:26:37', '2025-07-02 11:26:37', '2026-07-02 11:26:37'),
('ee9ec158c0902d6f50248c0a05edf29df4fc46b3777715188ef94f2b72e73742fb9423c3ec6af462', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 15:02:02', '2025-06-30 15:02:02', '2026-06-30 15:02:02'),
('eef63c8521acc6271cbd80e1aa13a4f05978b18f609651acf0bab91d131687284c016032c2372519', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 06:11:20', '2025-06-16 06:11:20', '2026-06-16 06:11:20'),
('ef2f30ba7984636dec7d7eb00e80b54b97c0567f73b9716189299cfb9694d1cdc8e2cab367b5dd5a', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 08:32:15', '2025-07-07 08:32:15', '2026-07-07 08:32:15'),
('ef9584fd6d37d67549e3a86aa520ed19bd0d01916b1cfcdad20683ff07ee4f58bf4771c8dda0992d', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 08:58:08', '2025-06-18 08:58:08', '2026-06-18 08:58:08'),
('f009503e566a673a9bbc8b67b793bb2fed4ebace0118903f0ce4cd79c5c1db835e5ad0106415670b', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 07:11:21', '2025-07-10 07:11:21', '2026-07-10 07:11:21'),
('f06513e4f2c96adc2bec0a71f41d50b12459fd53628b75512689795b5969a3ae00bc74b670b37864', 151, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-02 12:34:41', '2025-07-02 12:34:41', '2026-07-02 12:34:41'),
('f09da1c20c3693721e6107ff0e9a8f1caac47b715565e588cb6cc337013e937986afbba8cbd3bb00', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 08:34:35', '2025-06-27 08:34:35', '2026-06-27 08:34:35'),
('f0b0b47476399a5ceff1cd1d4e53daa4016241b9b21e8dedefa4c831212972cd595196938caab26f', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 06:53:35', '2025-06-17 06:53:35', '2026-06-17 06:53:35'),
('f0cd881b140a18ff4a8aadc15ed9c3adc62274d1a7d052b92f5b56001c1a724d3cedea1225cbf348', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 13:42:00', '2025-06-30 13:42:00', '2026-06-30 13:42:00'),
('f13b64f598403a24fc9061d2b42004400e944a76c2dfcfc428277602d339b88ce4a0692ced13fd1f', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-08 08:04:11', '2025-07-08 08:04:11', '2026-07-08 08:04:11'),
('f1aaade17c80dd4f63e96b71f919ec011207305c1b0345d1d77b505328b6dbc1d2544910c44abf70', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 14:42:44', '2025-07-10 14:42:44', '2026-07-10 14:42:44'),
('f1f0be236dc2d567f549614f2f2398ce8071ddbf100c3680154f66d429589fb5e8f4cfaa8e60b142', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 14:14:18', '2025-06-27 14:14:18', '2026-06-27 14:14:18'),
('f21b682d2317c73cf68d69201d6d0ea701ff2f484f421e5da062f6a4d908757f9d1f30d1a2496a1d', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 10:02:33', '2025-06-27 10:02:33', '2026-06-27 10:02:33'),
('f25b1af55c5642ea3eba23e578660ec349ecc41bf03b050a3a87a8131fb1fa46e1bc784dca3ddacd', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-26 10:44:09', '2025-06-26 10:44:09', '2026-06-26 10:44:09'),
('f2a996e8f9a31864fe5f61945ead9126a35e64d7b9e10374cf1ffde51c0554f5c90986487356c132', 50, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-18 07:16:50', '2025-06-18 07:16:50', '2026-06-18 07:16:50'),
('f2b6a5115ab7cf66f8d7853f196b26cda0736e5c88e158fa2b95fa543decebd515f9c061eac96084', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 12:11:51', '2025-06-30 12:11:51', '2026-06-30 12:11:51'),
('f332da6c810f1a31319895ac44da63ed7fe38c31e7709d311bd6b197e1ebcfbcee9c80c912c1f192', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 12:22:33', '2025-06-30 12:22:33', '2026-06-30 12:22:33'),
('f39eaa0c9632b1f1cfa6b14a8be97828a73a663b40894766ab741b07cfd9afe13ecf6293737524c7', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 11:40:42', '2025-06-16 11:40:42', '2026-06-16 11:40:42'),
('f3aec0c24a78d190a4fd2129c5cc5585b660bdaf8ff6a042dbbe90365712daeba7f5ddd76787943a', 282, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-15 05:57:04', '2025-07-15 05:57:04', '2026-07-15 05:57:04'),
('f3c0a6215156f48185d7d1be1e4b89af9672157c8a926ff45d7d00fbd3023242d496e3f61456465a', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-27 07:28:55', '2025-06-27 07:28:55', '2026-06-27 07:28:55'),
('f42adb992e1a8f292b45a011d3b1b7972402d027c6161f1d76bfdc77343d327afb4068f3160ab42f', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 06:02:37', '2025-07-11 06:02:37', '2026-07-11 06:02:37'),
('f5cc727b3a870a55d48832612ac0ad790a4c5d73ec9aba6153a78afba7e2262ae39b9b8e358fb64b', 83, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 14:54:38', '2025-06-19 14:54:38', '2026-06-19 14:54:38'),
('f60ab983e6c2f2c3c064dc32a82c77f4bbe2f9f1e444ea3564342acc5b35249ad531197e5a6a1810', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 08:52:21', '2025-06-16 08:52:21', '2026-06-16 08:52:21'),
('f641e28d6a534984bf1e02b78af333e7c90fa6b1d6a73440806ec7c41637cb091518feea4e8eeaf7', 183, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 14:35:11', '2025-07-10 14:35:11', '2026-07-10 14:35:11'),
('f6e1c52e0497ec4e07266865787e0ec89e453f4c44bd538add89e32f3cca2dd48c20e8b7d02dce96', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 12:05:44', '2025-07-07 12:05:44', '2026-07-07 12:05:44'),
('f718bee09427f6dbdfa11ef5b83abf16fc3d9434cd6babdee210ccf1173160795b32d128707480e1', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 08:55:47', '2025-06-30 08:55:47', '2026-06-30 08:55:47'),
('f73d5d2a4d06ddd810aa704233a22e6f31e66b473b46bf4247bb945a48b0936e7d21c929f0d06d1e', 35, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 08:42:14', '2025-06-19 08:42:14', '2026-06-19 08:42:14'),
('f764206dae2a957d3b9757041d514fd76098fc4e4d17131350a5e3b212640bcce8f4a469ea40df91', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 06:42:29', '2025-07-07 06:42:29', '2026-07-07 06:42:29'),
('f875aa4796f5c0a0c4c62ed14f0eba32addf179722ddb86a5f7cb776b703d2e715ca1909c5cd0d41', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-03 04:45:40', '2025-07-03 04:45:40', '2026-07-03 04:45:40'),
('f894c5b5196f00a1087b6b6b95322f28556d5ce3d6968c882026340a2b574e51be4146a601d3ac75', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 13:12:42', '2025-06-16 13:12:42', '2026-06-16 13:12:42'),
('f8d713870e3fe1a13c04b35af092ce1deb4933280fd5760b1af712c18dc191a9ae57d0abe9256d17', 5, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 05:28:45', '2025-06-17 05:28:45', '2026-06-17 05:28:45'),
('f8f0a8089780ab5d1c78dd4d90ebe609da39a4eed5f9600407d8d676e2d26f3a46fa97d1ee6d816a', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-19 14:50:40', '2025-06-19 14:50:40', '2026-06-19 14:50:40'),
('f8f351a40ee3fed85558302a13b5690b59a549ea7d3827a2b2532401709477c0f5a87f3ab565344b', 278, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 12:56:33', '2025-07-11 12:56:33', '2026-07-11 12:56:33'),
('f93593e8b8bb9c0fadf2ae71e5cd8369362a927984d78ac0a3c27bce7bc5342cb788b4d283e93170', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-01 12:02:13', '2025-07-01 12:02:13', '2026-07-01 12:02:13'),
('f98a3f8b0b81b9691226da6bfc7067b664680e6340fea38708b04b484788805ffe1a2358343db4ee', 25, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-17 05:27:09', '2025-06-17 05:27:09', '2026-06-17 05:27:09'),
('f9e7894dd69ba75203b6377bb9b19c386d3da4b19ba17b4217ac4b13e8ac6f2fcaeca7078f054942', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 05:25:22', '2025-06-16 05:25:22', '2026-06-16 05:25:22'),
('f9f04e53486bf34ee15156895af133e8bf2377ce7fa2f931bd4ab00d02387285b12468b688c32ad0', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-15 16:33:33', '2025-06-15 16:33:33', '2026-06-15 16:33:33'),
('faaa94c1eac5d078678b4f88fb18c4f99e0443ddb5df8a22d3f3abb72455d469bd8a20fb406368f4', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 06:55:42', '2025-07-07 06:55:42', '2026-07-07 06:55:42'),
('fac8f7d579eb740d0ee399b1bac036f04ab716132bebe474633993dd2b46eb6a557dd461847d8293', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 07:49:42', '2025-06-16 07:49:42', '2026-06-16 07:49:42'),
('faf760dd78104291ecdb187bf085e48ec528e16c1dcb7b6474232646a7f29f6f064eac9b7599e0d0', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-11 11:08:29', '2025-07-11 11:08:29', '2026-07-11 11:08:29'),
('fc10a05362311d8de6980f85630cb2b56581d05a99cfccbf29a16a27a1aad36b6d241bfd07f01259', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 14:24:57', '2025-07-10 14:24:57', '2026-07-10 14:24:57'),
('fc15771aebbad361ea67b35783f988ae7c311b15ccb0b98fede449dd4ba831f72b0f032fbd534705', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 13:00:07', '2025-07-10 13:00:07', '2026-07-10 13:00:07'),
('fc2467c9367ec927eb205e6a624335256adbc26ff0a776dbdd5b44ff369caf4fd23717fcd70599d8', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-07 06:52:37', '2025-07-07 06:52:37', '2026-07-07 06:52:37'),
('fcfbe34753c0b48dbf8b2a985324a3b93a9b38ce49eddcb77897d0e8d3eb9dafd4cdd38bba85f754', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 12:19:20', '2025-06-16 12:19:20', '2026-06-16 12:19:20'),
('fd4c0c250a17fa5ff9dab80a74a1734a342bddc4ca03ba78afc073a967e88119fb32106e68f408bc', 95, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-20 22:39:50', '2025-06-20 22:39:50', '2026-06-20 22:39:50'),
('fdd6a1c0a00e380c6cf75c1504bc5cbf3141cea354680c552781b62d49e76cc3819eefffc912528b', 2, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-16 11:18:41', '2025-06-16 11:18:41', '2026-06-16 11:18:41'),
('fe57055e1ded0389d784f2f8c2a0cb6ad9066d5db6d59910a3ffbac04237ffac7049e6f6cb417d7f', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-25 09:59:33', '2025-06-25 09:59:33', '2026-06-25 09:59:33'),
('fe6abf32bf2bdc466da0f87181c9385080560920fefc64fecda67a32cf23532802aa3a4a50e32afe', 1, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-28 08:24:34', '2025-06-28 08:24:34', '2026-06-28 08:24:34'),
('fe82e951ff2e58f470089bdd8520937f582f2609beb4705aa6a6c4ac0cf11ee7db9def8668ee50e4', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-09 07:45:00', '2025-07-09 07:45:00', '2026-07-09 07:45:00'),
('feffcdcd7ef259d925ea6f229c968179a4d0fcd7a68b28fb4eb8d7bc58a2686f9cbb0be2c558f8f7', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-06-30 15:24:50', '2025-06-30 15:24:50', '2026-06-30 15:24:50');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('ff200450fdad33c3176334496933202cee3a24ecaa944c3d01916ae5f2ad5ea071e020d587db25bf', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-12 09:17:08', '2025-07-12 09:17:08', '2026-07-12 09:17:08'),
('ff206c25ccfe81120275239da35ae56e22c97e5a79b09992e55dfe5cc0edc057a04887379e1aeafb', 264, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-10 14:55:40', '2025-07-10 14:55:40', '2026-07-10 14:55:40'),
('ff495d6925b206e7985fbd093cc413f6860aaef5105ac26b4b9e27484c9edea64ebefd222568ecae', 91, '9f24b655-c107-44bc-ba7d-3e090baf3188', 'custom-auth', '[]', 0, '2025-07-17 06:13:39', '2025-07-17 06:13:39', '2026-07-17 06:13:39');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` char(36) NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` char(36) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
('9f24b63f-7dff-4f46-842d-25c7e7e7298b', NULL, 'Ace Community Personal Access Client', 'sLkYS4OrYDrSUCCN8BZc1iojF0Obf8SINlqI7ltW', NULL, 'http://localhost', 1, 0, 0, '2025-06-13 08:07:33', '2025-06-13 08:07:33'),
('9f24b64b-4e64-4515-9589-7eb5320f2f97', NULL, 'google-auth', '7uBBHJXMgPqVXIWAjXPOaUPmMChEgWshCYUrNfZ5', NULL, 'http://localhost', 1, 0, 0, '2025-06-13 08:07:40', '2025-06-13 08:07:40'),
('9f24b655-c107-44bc-ba7d-3e090baf3188', NULL, 'apple-auth', 'WbflCxV76Y068iwmu1pmEqaJDdwX5Hhky1QUsSFv', NULL, 'http://localhost', 1, 0, 0, '2025-06-13 08:07:47', '2025-06-13 08:07:47');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) NOT NULL,
  `client_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, '9f24b63f-7dff-4f46-842d-25c7e7e7298b', '2025-06-13 08:07:33', '2025-06-13 08:07:33'),
(2, '9f24b64b-4e64-4515-9589-7eb5320f2f97', '2025-06-13 08:07:40', '2025-06-13 08:07:40'),
(3, '9f24b655-c107-44bc-ba7d-3e090baf3188', '2025-06-13 08:07:47', '2025-06-13 08:07:47');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Bookings', 'web', '2025-06-13 08:06:26', '2025-06-13 08:06:26'),
(2, 'Satistics', 'web', '2025-06-13 08:06:27', '2025-06-13 08:06:27'),
(3, 'My_Club_Tab_and_Sub_Tabs', 'web', '2025-06-13 08:06:27', '2025-06-13 08:06:27'),
(4, 'News_Posting', 'web', '2025-06-13 08:06:27', '2025-06-13 08:06:27'),
(5, 'Communities', 'web', '2025-06-13 08:06:29', '2025-06-13 08:06:29'),
(6, 'Ads_Management', 'web', '2025-06-13 08:06:29', '2025-06-13 08:06:29'),
(7, 'Accounting', 'web', '2025-06-13 08:06:29', '2025-06-13 08:06:29'),
(13, 'Booking ', 'api', NULL, NULL),
(14, 'Ads_Management', 'api', NULL, NULL),
(17, 'My_Club_Tab_and_Sub_Tabs\r\n', 'api', NULL, NULL),
(18, 'News_Posting', 'api', NULL, NULL),
(19, 'Communities', 'api', NULL, NULL),
(20, 'Accounting', 'api', NULL, NULL),
(21, 'Satistics', 'api', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `age_group_id` bigint(20) DEFAULT NULL,
  `status` enum('active','inactive','pending') NOT NULL DEFAULT 'active',
  `is_premium` tinyint(4) NOT NULL DEFAULT 0,
  `blood_type` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `emergency_contact_name` varchar(255) DEFAULT NULL,
  `emergency_contact_no` varchar(255) DEFAULT NULL,
  `relationship` enum('Parent','Spouse','Sibling','Friend','Son/Daughter','Relative','Partner') DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `club_id` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `user_id`, `age_group_id`, `status`, `is_premium`, `blood_type`, `date_of_birth`, `emergency_contact_name`, `emergency_contact_no`, `relationship`, `facebook`, `twitter`, `address`, `gender`, `club_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(6, 35, 1, 'active', 0, 'O+', '2001-12-04', 'This is emergency', '1239872394', 'Partner', NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-17 11:10:34', '2025-06-17 11:10:34'),
(7, 37, 1, 'active', 0, 'O+', '2001-12-04', 'This is emergency', '1239872394', 'Partner', NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-17 12:12:11', '2025-06-17 12:12:11'),
(8, 39, NULL, 'active', 0, 'O+', '2001-12-04', 'This is emergency', '1239872394', 'Partner', NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-17 12:27:17', '2025-06-17 12:27:17'),
(9, 40, NULL, 'active', 0, 'O+', '2001-12-04', 'This is emergency', '1239872394', 'Partner', NULL, NULL, NULL, 'Male', NULL, NULL, '2025-06-17 13:00:01', '2025-06-17 13:00:01'),
(10, 41, NULL, 'active', 0, 'O+', '2001-12-04', 'This is emergency', '1239872394', 'Partner', NULL, NULL, NULL, 'Male', NULL, NULL, '2025-06-17 13:59:41', '2025-06-17 13:59:41'),
(11, 42, NULL, 'active', 0, 'o+', '2000-01-01', 'Yasir', '1239872394', 'Friend', NULL, NULL, NULL, 'Male', NULL, NULL, '2025-06-17 14:29:53', '2025-06-17 14:29:53'),
(12, 43, NULL, 'active', 0, 'B +', '2000-12-10', 'Younas', '03123456789', 'Friend', NULL, NULL, NULL, 'Male', NULL, NULL, '2025-06-17 14:34:07', '2025-06-17 14:34:07'),
(13, 44, NULL, 'active', 0, 'o+', '2000-01-01', 'Gopange', '3336677575', 'Sibling', NULL, NULL, NULL, 'Male', NULL, NULL, '2025-06-17 14:49:30', '2025-06-17 14:49:30'),
(14, 45, NULL, 'active', 0, 'B+', '2000-12-10', 'Usman Ali Awaz', '+923123456789', 'Friend', NULL, NULL, NULL, 'Male', NULL, NULL, '2025-06-17 14:59:37', '2025-06-17 14:59:37'),
(15, 48, NULL, 'active', 0, 'O+', '2000-01-01', 'Azhar', '3149486276', 'Sibling', NULL, NULL, NULL, 'Male', NULL, NULL, '2025-06-18 06:47:40', '2025-06-18 06:47:40'),
(16, 49, NULL, 'active', 0, 'B+', '2000-12-10', '&_$#@', '312;,N/()(', 'Friend', NULL, NULL, NULL, 'Male', NULL, NULL, '2025-06-18 07:08:45', '2025-06-18 07:08:45'),
(17, 50, NULL, 'active', 0, NULL, '2000-01-01', 'svba', '4994940040', 'Sibling', NULL, NULL, NULL, 'Male', NULL, NULL, '2025-06-18 07:16:50', '2025-06-18 07:16:50'),
(18, 51, NULL, 'active', 0, 'bs', '2000-01-01', 'bsbsbs', '4994949999', 'Parent', NULL, NULL, NULL, 'Male', NULL, NULL, '2025-06-18 07:28:31', '2025-06-18 07:28:31'),
(19, 52, NULL, 'active', 0, 'ja', '2000-01-01', 'bsbsbs', '9797946164', 'Spouse', NULL, NULL, NULL, 'Male', NULL, NULL, '2025-06-18 07:30:57', '2025-06-18 07:30:57'),
(20, 53, NULL, 'active', 0, 'o+', '2000-01-01', 'hdhdhs', '8464648484', 'Spouse', NULL, NULL, NULL, 'Male', NULL, NULL, '2025-06-18 07:36:40', '2025-06-18 07:36:40'),
(21, 54, NULL, 'active', 0, 'o+', '2000-01-01', 'hsbsbs', '4644994949', 'Spouse', NULL, NULL, NULL, 'Male', NULL, NULL, '2025-06-18 07:52:09', '2025-06-18 07:52:09'),
(22, 55, NULL, 'active', 0, 'hs', '2000-01-01', 'bssbsbbs', '9794949494', 'Sibling', NULL, NULL, NULL, 'Male', NULL, NULL, '2025-06-18 08:00:12', '2025-06-18 08:00:12'),
(23, 56, NULL, 'active', 0, 'O+', '2000-01-23', 'bababa a', '4994948440', 'Friend', NULL, NULL, NULL, 'Male', NULL, NULL, '2025-06-18 09:46:28', '2025-06-18 09:46:28'),
(24, 57, NULL, 'active', 0, 'O+', '2000-01-21', 'fhjkeyjb', '8955545666', 'Son/Daughter', NULL, NULL, NULL, 'Male', NULL, NULL, '2025-06-18 12:44:39', '2025-06-18 12:44:39'),
(25, 58, NULL, 'active', 0, 'O-', '2000-01-01', 'srfyfhfhhf', '8656578586', 'Friend', NULL, NULL, NULL, 'Male', NULL, NULL, '2025-06-18 12:48:49', '2025-06-18 12:48:49'),
(26, 59, NULL, 'active', 0, 'A-', '2000-01-01', 'vvvfxc', '9876684459', 'Spouse', NULL, NULL, NULL, 'Male', NULL, NULL, '2025-06-18 12:51:11', '2025-06-18 12:51:11'),
(27, 60, NULL, 'active', 0, 'AB+', '2000-01-03', 'asdf', '2222222885', 'Relative', NULL, NULL, NULL, 'Female', NULL, NULL, '2025-06-18 14:18:18', '2025-06-18 14:18:18'),
(28, 64, NULL, 'active', 0, 'O+', '2001-12-04', 'This is emergency', '1239872394', 'Partner', NULL, NULL, NULL, 'Male', NULL, NULL, '2025-06-19 05:31:33', '2025-06-19 05:31:33'),
(29, 65, NULL, 'active', 0, 'O+', '2001-12-04', 'This is emergency', '1239872394', 'Partner', NULL, NULL, NULL, 'Male', NULL, NULL, '2025-06-19 05:45:49', '2025-06-19 05:45:49'),
(30, 67, NULL, 'active', 0, 'O+', '2001-12-04', 'This is emergency', '1239872394', 'Partner', NULL, NULL, NULL, 'Male', NULL, NULL, '2025-06-19 08:10:55', '2025-06-19 08:10:55'),
(31, 91, NULL, 'active', 0, 'O+', '2000-01-23', 'Gopanghh', '3336677578', 'Friend', NULL, NULL, NULL, 'Male', NULL, NULL, '2025-06-20 10:59:10', '2025-06-20 10:59:10'),
(32, 93, NULL, 'active', 0, 'O+', '2001-12-04', 'This is emergency', '1239872394', 'Partner', NULL, NULL, NULL, 'Male', NULL, NULL, '2025-06-20 14:45:31', '2025-06-20 14:45:31'),
(33, 94, NULL, 'active', 0, 'O+', '2000-01-24', 'vhjbc', '3345684599', 'Friend', NULL, NULL, NULL, 'Male', NULL, NULL, '2025-06-20 14:50:09', '2025-06-20 14:50:09'),
(34, 279, NULL, 'active', 0, 'A-', '2000-01-25', NULL, NULL, NULL, NULL, NULL, NULL, 'Male', NULL, NULL, '2025-07-12 07:17:59', '2025-07-12 07:17:59'),
(35, 280, NULL, 'active', 0, 'B-', '2000-01-25', NULL, NULL, NULL, NULL, NULL, NULL, 'Male', NULL, NULL, '2025-07-12 07:30:58', '2025-07-12 07:30:58');

-- --------------------------------------------------------

--
-- Table structure for table `player_sport_levels`
--

CREATE TABLE `player_sport_levels` (
  `id` bigint(20) NOT NULL,
  `player_id` bigint(20) NOT NULL,
  `sport_id` bigint(20) NOT NULL,
  `rating` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `content`, `created_at`, `post_id`, `user_id`) VALUES
(1, 'Great post!', '2025-07-21 13:18:54.888830', 1, 1),
(2, 'Great', '2025-07-21 13:27:27.551252', 19, 263),
(3, 'Well Done', '2025-07-21 13:57:32.629588', 19, 263),
(4, 'Hy', '2025-07-22 08:04:28.837716', 21, 263),
(5, 'Great', '2025-07-22 08:39:14.039830', 21, 263),
(6, 'Hey', '2025-07-22 11:05:47.489012', 21, 263),
(7, 'What', '2025-07-23 07:20:00.271039', 21, 263);

-- --------------------------------------------------------

--
-- Table structure for table `post_likes`
--

CREATE TABLE `post_likes` (
  `id` bigint(20) NOT NULL,
  `liked_at` datetime(6) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_likes`
--

INSERT INTO `post_likes` (`id`, `liked_at`, `post_id`, `user_id`) VALUES
(17, '2025-07-21 06:43:53.918905', 2, 263),
(40, '2025-07-21 07:39:18.694022', 7, 263),
(48, '2025-07-21 13:57:56.680083', 19, 263),
(60, '2025-07-22 11:38:01.562570', 14, 263),
(68, '2025-07-22 13:46:25.688884', 1, 263),
(71, '2025-07-23 07:31:36.074569', 20, 263);

-- --------------------------------------------------------

--
-- Table structure for table `questionnaires`
--

CREATE TABLE `questionnaires` (
  `id` bigint(20) NOT NULL,
  `question` text NOT NULL,
  `question_for_db` text NOT NULL,
  `sport_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questionnaires`
--

INSERT INTO `questionnaires` (`id`, `question`, `question_for_db`, `sport_id`, `created_at`, `updated_at`) VALUES
(1, 'What is your current level in Padel?', 'what_is_your_current_level_in_padel', 2, NULL, NULL),
(2, 'How many years have you been playing Padel?', 'how_many_years_have_you_been_playing_padel', 2, NULL, NULL),
(3, 'Have you received or are you currently receiving training in Padel?', 'have_you_received_or_are_you_currently_receiving_training_in_padel', 2, NULL, NULL),
(4, 'Have you played in any competitive Padel leagues or tournaments?', 'have_you_played_in_any_competitive_padel_leagues_or_tournaments', 2, NULL, NULL),
(5, 'Have you won any local tournaments?', 'have_you_won_any_local_tournaments', 2, NULL, NULL),
(6, 'How would you rate your volley skills?', 'how_would_you_rate_your_volley_skills', 2, NULL, NULL),
(7, 'How would you rate your lobs?', 'how_would_you_rate_your_lobs', 2, NULL, NULL),
(8, 'What is your current level in tennis?', 'what_is_your_current_level_in_tennis', 1, NULL, NULL),
(9, 'How many years have you been playing tennis?', 'how_many_years_have_you_been_playing_tennis', 1, NULL, NULL),
(10, 'Have you participated in any competitive tennis tournaments?', 'have_you_participated_in_any_competitive_tennis_tournaments', 1, NULL, NULL),
(11, 'How would you rate your serve?', 'how_would_you_rate_your_serve', 1, NULL, NULL),
(12, 'How would you rate your net play (volleys & smashes)?', 'how_would_you_rate_your_net_play_volleys_and_smashes', 1, NULL, NULL),
(13, 'What is your current level in basketball?', 'what_is_your_current_level_in_basketball', 5, NULL, NULL),
(14, 'How many years have you been playing basketball?', 'how_many_years_have_you_been_playing_basketball', 5, NULL, NULL),
(15, 'Have you played in any competitive basketball leagues?', 'have_you_played_in_any_competitive_basketball_leagues', 5, NULL, NULL),
(16, 'How would you rate your shooting accuracy?', 'how_would_you_rate_your_shooting_accuracy', 5, NULL, NULL),
(17, 'How would you rate your defensive skills?', 'how_would_you_rate_your_defensive_skills', 5, NULL, NULL),
(18, 'What is your current level in football?', 'what_is_your_current_level_in_football', 3, NULL, NULL),
(19, 'How many years have you been playing football?', 'how_many_years_have_you_been_playing_football', 3, NULL, NULL),
(20, 'Have you played in any competitive football leagues?', 'have_you_played_in_any_competitive_football_leagues', 3, NULL, NULL),
(21, 'How would you rate your passing accuracy?', 'how_would_you_rate_your_passing_accuracy', 3, NULL, NULL),
(22, 'How would you rate your shooting ability?', 'how_would_you_rate_your_shooting_ability', 3, NULL, NULL),
(23, 'What is your current level in Pickleball?', 'what_is_your_current_level_in_pickleball', 4, NULL, NULL),
(24, 'How many years have you been playing Pickleball?', 'how_many_years_have_you_been_playing_pickleball', 4, NULL, NULL),
(25, 'Have you participated in any competitive Pickleball tournaments?', 'have_you_participated_in_any_competitive_pickleball_tournaments', 4, NULL, NULL),
(26, 'How would you rate your dinking skills (soft net game)?', 'how_would_you_rate_your_dinking_skills_soft_net_game', 4, NULL, NULL),
(27, 'How would you rate your smashing ability?', 'how_would_you_rate_your_smashing_ability', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `questionnaire_responses`
--

CREATE TABLE `questionnaire_responses` (
  `id` bigint(20) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  `answer` text NOT NULL,
  `answer_description` text DEFAULT NULL,
  `rating` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questionnaire_responses`
--

INSERT INTO `questionnaire_responses` (`id`, `question_id`, `answer`, `answer_description`, `rating`, `created_at`, `updated_at`) VALUES
(1, 1, 'Newcomer', 'Never held a racket before', 0.9, NULL, NULL),
(2, 1, 'Beginner', 'Learning the basics of Padel', 1.3, NULL, NULL),
(3, 1, 'Beginner Advanced', 'Understands the basics but struggles with ball control, especially with low and high shots', 1.5, NULL, NULL),
(4, 1, 'Intermediate', 'Has experience playing and understands tactics but struggles with consistent execution', 1.8, NULL, NULL),
(5, 1, 'Intermediate Advanced', 'Consistently executes shots, with improved net play and controlled smashes', 2, NULL, NULL),
(6, 1, 'Pro', 'Consistently executes advanced techniques, reads the game well, has solid defense and offense, and plays at a high competitive level', 3, NULL, NULL),
(7, 2, 'Never played before', NULL, 0, NULL, NULL),
(8, 2, 'Less than a year', NULL, 0.3, NULL, NULL),
(9, 2, '1 to 3 years', NULL, 0.7, NULL, NULL),
(10, 2, '3 to 5 years', NULL, 1, NULL, NULL),
(11, 2, 'More than 5 years', NULL, 1.5, NULL, NULL),
(12, 3, 'No', NULL, 0, NULL, NULL),
(13, 3, 'Yes, in the past', NULL, 0.1, NULL, NULL),
(14, 3, 'Yes, currently', NULL, 0.2, NULL, NULL),
(15, 4, 'No', NULL, 0, NULL, NULL),
(16, 4, 'Yes, local tournaments', NULL, 0.1, NULL, NULL),
(17, 4, 'Yes, national/international tournaments ', NULL, 0.3, NULL, NULL),
(18, 5, 'No', NULL, 0, NULL, NULL),
(19, 5, 'Yes, 1-2 tournaments', NULL, 0.1, NULL, NULL),
(20, 5, 'Yes, 3+ tournaments', NULL, 0.2, NULL, NULL),
(21, 6, 'Weak', 'Struggles with volley accuracy and control, making net play difficult', 0, NULL, NULL),
(22, 6, 'Average', 'Can volley but inconsistent under pressure', 0.1, NULL, NULL),
(23, 6, 'Strong', 'Confident at the net, controls placement well', 0.2, NULL, NULL),
(24, 6, 'Very strong', 'Excellent volleys, strong net play, dominant in aggressive points', 0.4, NULL, NULL),
(25, 7, 'Weak', 'Struggle with height and accuracy, lobs are easy to attack', 0, NULL, NULL),
(26, 7, 'Average', 'Can execute lobs but inconsistent in placement', 0.1, NULL, NULL),
(27, 7, 'Strong', 'Lobs are well-placed, consistently pushing opponents into a defensive position', 0.2, NULL, NULL),
(28, 7, 'Very strong', 'Consistently place deep, well-timed lobs that turn defense into offense', 0.4, NULL, NULL),
(29, 8, 'Newcomer', 'Never played tennis before', 0.9, NULL, NULL),
(30, 8, 'Beginner', 'Learning the basics (grip, forehand, backhand)', 1.5, NULL, NULL),
(31, 8, 'Intermediate', 'Can rally consistently, understands court positioning', 2.5, NULL, NULL),
(32, 8, 'Advanced', 'Can execute spin, volleys, serves, and match strategies well', 3.5, NULL, NULL),
(33, 8, 'Pro', 'Competes at a high level, strong tactical awareness, consistency in all strokes', 4.5, NULL, NULL),
(34, 9, 'Less than a year', NULL, 0.5, NULL, NULL),
(35, 9, '1 to 3 years', NULL, 1, NULL, NULL),
(36, 9, '3+ years', NULL, 1.5, NULL, NULL),
(37, 10, 'No', NULL, 0, NULL, NULL),
(38, 10, 'Yes, local tournaments', NULL, 0.2, NULL, NULL),
(39, 10, 'Yes, national/international tournaments', NULL, 0.5, NULL, NULL),
(40, 11, 'Weak', 'Struggles with control and consistency', 0, NULL, NULL),
(41, 11, 'Average', 'Can serve consistently but lacks power/accuracy', 0.2, NULL, NULL),
(42, 11, 'Strong', 'Can place serves well with good speed and spin', 0.4, NULL, NULL),
(43, 12, 'Weak', 'Avoids net play, lacks confidence', 0, NULL, NULL),
(44, 12, 'Average', 'Can volley but inconsistent', 0.2, NULL, NULL),
(45, 12, 'Strong', 'Solid net play, aggressive and consistent', 0.4, NULL, NULL),
(46, 13, 'Newcomer', 'Never played', 0.9, NULL, NULL),
(47, 13, 'Beginner', 'Learning dribbling, passing, and basic shooting', 1.5, NULL, NULL),
(48, 13, 'Intermediate', 'Comfortable with layups, shooting, and defense', 2.5, NULL, NULL),
(49, 13, 'Advanced', 'Strong ball control, shooting range, and defensive skills', 3.5, NULL, NULL),
(50, 13, 'Pro', 'High-level player with excellent game sense and execution', 4.5, NULL, NULL),
(51, 14, 'Less than a year', NULL, 0.5, NULL, NULL),
(52, 14, '1 to 3 years', NULL, 1, NULL, NULL),
(53, 14, '3+ years', NULL, 1.5, NULL, NULL),
(54, 15, 'No', NULL, 0, NULL, NULL),
(55, 15, 'Yes, local leagues', NULL, 0.2, NULL, NULL),
(56, 15, 'Yes, national/international leagues', NULL, 0.5, NULL, NULL),
(57, 16, 'Weak', 'Struggles with shot consistency', 0, NULL, NULL),
(58, 16, 'Average', 'Can shoot well but inconsistent under pressure', 0.2, NULL, NULL),
(59, 16, 'Strong', 'High shooting percentage, confident in scoring', 0.4, NULL, NULL),
(60, 17, 'Weak', 'Struggles with positioning and defending', 0, NULL, NULL),
(61, 17, 'Average', 'Can defend well but inconsistent', 0.2, NULL, NULL),
(62, 17, 'Strong', 'Great positioning, steals, blocks, and contesting shots', 0.4, NULL, NULL),
(63, 18, 'Newcomer', 'Never played or only casual games', 0.9, NULL, NULL),
(64, 18, 'Beginner', 'Basic passing, dribbling, and shooting but lacks consistency', 1.5, NULL, NULL),
(65, 18, 'Intermediate', 'Comfortable in match settings, understands positioning and tactics', 2.5, NULL, NULL),
(66, 18, 'Advanced', 'Plays in structured teams, good ball control, vision, and technique', 3.5, NULL, NULL),
(67, 18, 'Pro', 'Plays competitively with high tactical and technical awareness', 4.5, NULL, NULL),
(68, 19, 'Less than a year', NULL, 0.5, NULL, NULL),
(69, 19, '1 to 3 years', NULL, 1, NULL, NULL),
(70, 19, '3+ years', NULL, 1.5, NULL, NULL),
(71, 20, 'No', NULL, 0, NULL, NULL),
(72, 20, 'Yes, local leagues', NULL, 0.2, NULL, NULL),
(73, 20, 'Yes, national/international', NULL, 0.5, NULL, NULL),
(74, 21, 'Weak', 'Struggles with short and long passes', 0, NULL, NULL),
(75, 21, 'Average', 'Can pass accurately but inconsistent under pressure', 0.2, NULL, NULL),
(76, 21, 'Strong', 'Consistently precise and effective in passing', 0.4, NULL, NULL),
(77, 22, 'Weak', 'Struggles to generate power and accuracy', 0, NULL, NULL),
(78, 22, 'Average', 'Can shoot accurately but inconsistent', 0.2, NULL, NULL),
(79, 22, 'Strong', 'Confident and accurate in finishing chances', 0.4, NULL, NULL),
(80, 23, 'Newcomer', 'Never played', 0.9, NULL, NULL),
(81, 23, 'Beginner', 'Learning dinking, serves, and basic gameplay', 1.5, NULL, NULL),
(82, 23, 'Intermediate', 'Can sustain rallies, control dink shots, and place shots well', 2.5, NULL, NULL),
(83, 23, 'Advanced', 'Uses spins, drives, consistent volleys, and understands strategy', 3.5, NULL, NULL),
(84, 23, 'Pro', 'High-level competitive player, excellent court awareness', 4.5, NULL, NULL),
(85, 24, 'Less than a year', NULL, 0.5, NULL, NULL),
(86, 24, '1 to 3 years', NULL, 1, NULL, NULL),
(87, 24, '3+ years', NULL, 1.5, NULL, NULL),
(88, 25, 'No', NULL, 0, NULL, NULL),
(89, 25, 'Yes, local tournaments', NULL, 0.2, NULL, NULL),
(90, 25, 'Yes, national/international tournaments', NULL, 0.5, NULL, NULL),
(91, 26, 'Weak', 'Struggles with soft net play', 0, NULL, NULL),
(92, 26, 'Average', 'Can dink but inconsistent', 0.2, NULL, NULL),
(93, 26, 'Strong', 'Controls dinks, forces opponents into errors', 0.4, NULL, NULL),
(94, 27, 'Weak', 'Struggles to generate power and accuracy', 0, NULL, NULL),
(95, 27, 'Average', 'Can smash but inconsistent placement', 0.2, NULL, NULL),
(96, 27, 'Strong', 'Effective, well-placed, and powerful smashes', 0.4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2025-06-13 08:06:25', '2025-06-13 08:06:25'),
(2, 'club_owner', 'web', '2025-06-13 08:06:26', '2025-06-13 08:06:26'),
(3, 'coach', 'web', '2025-06-13 08:06:26', '2025-06-13 08:06:26'),
(4, 'player', 'web', '2025-06-13 08:06:26', '2025-06-13 08:06:26'),
(5, 'analytics_manager', 'web', '2025-06-13 08:06:26', '2025-06-13 08:06:26'),
(6, 'club', 'web', '2025-06-13 08:06:29', '2025-06-13 08:06:29'),
(7, 'club', 'api', '2025-06-13 08:08:42', '2025-06-13 08:08:42'),
(8, 'club_employee', 'web', NULL, NULL),
(10, 'club_employee', 'api', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(2, 3),
(2, 5),
(3, 1),
(3, 2),
(4, 1),
(5, 6),
(6, 6),
(7, 6);

-- --------------------------------------------------------

--
-- Table structure for table `specialties`
--

CREATE TABLE `specialties` (
  `id` bigint(20) NOT NULL,
  `name` varchar(64) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `specialties`
--

INSERT INTO `specialties` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Yoga', NULL, NULL),
(2, 'Dance', NULL, NULL),
(3, 'HIIT', NULL, NULL),
(4, 'Pilates', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sports`
--

CREATE TABLE `sports` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sports`
--

INSERT INTO `sports` (`id`, `name`, `description`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Tennis', 'A racket sport playeed on a rectangular court.', 'https://ace-community.hyglaxit.com/storage/images/sport/icon/Tennis.png', NULL, '2025-06-25 10:34:22'),
(2, 'Padel', 'A mix of tennis and squash played on an enclosed court.', 'https://ace-community.hyglaxit.com/storage/images/sport/icon/Pedal.png', NULL, '2025-06-25 10:05:51'),
(3, 'Football', 'A team sport where players aim to score goals by getting a ball into the opposing team\'s net using any part of the body except the hands and arms (except for the goalkeeper).', 'https://ace-community.hyglaxit.com/storage/images/sport/icon/Football.png', NULL, NULL),
(4, 'PickleBall', 'A paddle sport that combines elements of tennis, badminton, and ping-pong, played with a perforated plastic ball on a small court.', 'https://ace-community.hyglaxit.com/storage/images/sport/icon/PickleBall.png', NULL, NULL),
(5, 'Basketball', 'A mix of tennis and squash played on an enclosed court.', 'https://ace-community.hyglaxit.com/storage/images/sport/icon/BasketBall.png', NULL, '2025-06-19 12:52:30');

-- --------------------------------------------------------

--
-- Table structure for table `timezones`
--

CREATE TABLE `timezones` (
  `id` bigint(20) NOT NULL,
  `index` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `offset` varchar(255) NOT NULL,
  `iana` varchar(255) NOT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timezones`
--

INSERT INTO `timezones` (`id`, `index`, `name`, `offset`, `iana`, `country_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Africa/Abidjan', 'GMT+00:00', 'Africa/Abidjan', 60, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(2, 2, 'Africa/Accra', 'GMT+00:00', 'Africa/Accra', 84, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(3, 3, 'Africa/Addis Ababa', 'GMT+03:00', 'Africa/Addis_Ababa', 71, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(4, 4, 'Africa/Algiers', 'GMT+01:00', 'Africa/Algiers', 3, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(5, 5, 'Africa/Asmara', 'GMT+03:00', 'Africa/Asmara', 69, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(6, 6, 'Africa/Bamako', 'GMT+00:00', 'Africa/Bamako', 135, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(7, 7, 'Africa/Bangui', 'GMT+01:00', 'Africa/Bangui', 43, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(8, 8, 'Africa/Banjul', 'GMT+00:00', 'Africa/Banjul', 81, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(9, 9, 'Africa/Bissau', 'GMT+00:00', 'Africa/Bissau', 94, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(10, 10, 'Africa/Blantyre', 'GMT+02:00', 'Africa/Blantyre', 132, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(11, 11, 'Africa/Brazzaville', 'GMT+01:00', 'Africa/Brazzaville', 51, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(12, 12, 'Africa/Bujumbura', 'GMT+02:00', 'Africa/Bujumbura', 37, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(13, 13, 'Africa/Cairo', 'GMT+03:00', 'Africa/Cairo', 66, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(14, 14, 'Africa/Casablanca', 'GMT+01:00', 'Africa/Casablanca', 149, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(15, 15, 'Africa/Ceuta', 'GMT+02:00', 'Africa/Ceuta', 211, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(16, 16, 'Africa/Conakry', 'GMT+00:00', 'Africa/Conakry', 93, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(17, 17, 'Africa/Dakar', 'GMT+00:00', 'Africa/Dakar', 197, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(18, 18, 'Africa/Dar es Salaam', 'GMT+03:00', 'Africa/Dar_es_Salaam', 222, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(19, 19, 'Africa/Djibouti', 'GMT+03:00', 'Africa/Djibouti', 62, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(20, 20, 'Africa/Douala', 'GMT+01:00', 'Africa/Douala', 39, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(21, 21, 'Africa/El Aaiun', 'GMT+01:00', 'Africa/El_Aaiun', 248, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(22, 22, 'Africa/Freetown', 'GMT+00:00', 'Africa/Freetown', 201, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(23, 23, 'Africa/Gaborone', 'GMT+02:00', 'Africa/Gaborone', 30, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(24, 24, 'Africa/Harare', 'GMT+02:00', 'Africa/Harare', 251, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(25, 25, 'Africa/Johannesburg', 'GMT+02:00', 'Africa/Johannesburg', 208, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(26, 26, 'Africa/Juba', 'GMT+02:00', 'Africa/Juba', 210, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(27, 27, 'Africa/Kampala', 'GMT+03:00', 'Africa/Kampala', 234, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(28, 28, 'Africa/Khartoum', 'GMT+02:00', 'Africa/Khartoum', 213, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(29, 29, 'Africa/Kigali', 'GMT+02:00', 'Africa/Kigali', 185, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(30, 30, 'Africa/Kinshasa', 'GMT+01:00', 'Africa/Kinshasa', 52, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(31, 31, 'Africa/Lagos', 'GMT+01:00', 'Africa/Lagos', 161, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(32, 32, 'Africa/Libreville', 'GMT+01:00', 'Africa/Libreville', 80, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(33, 33, 'Africa/Lome', 'GMT+00:00', 'Africa/Lome', 225, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(34, 34, 'Africa/Luanda', 'GMT+01:00', 'Africa/Luanda', 6, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(35, 35, 'Africa/Lubumbashi', 'GMT+02:00', 'Africa/Lubumbashi', 52, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(36, 36, 'Africa/Lusaka', 'GMT+02:00', 'Africa/Lusaka', 250, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(37, 37, 'Africa/Malabo', 'GMT+01:00', 'Africa/Malabo', 68, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(38, 38, 'Africa/Maputo', 'GMT+02:00', 'Africa/Maputo', 150, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(39, 39, 'Africa/Maseru', 'GMT+02:00', 'Africa/Maseru', 124, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(40, 40, 'Africa/Mbabane', 'GMT+02:00', 'Africa/Mbabane', 216, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(41, 41, 'Africa/Mogadishu', 'GMT+03:00', 'Africa/Mogadishu', 207, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(42, 42, 'Africa/Monrovia', 'GMT+00:00', 'Africa/Monrovia', 125, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(43, 43, 'Africa/Nairobi', 'GMT+03:00', 'Africa/Nairobi', 116, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(44, 44, 'Africa/Ndjamena', 'GMT+01:00', 'Africa/Ndjamena', 44, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(45, 45, 'Africa/Niamey', 'GMT+01:00', 'Africa/Niamey', 160, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(46, 46, 'Africa/Nouakchott', 'GMT+00:00', 'Africa/Nouakchott', 139, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(47, 47, 'Africa/Ouagadougou', 'GMT+00:00', 'Africa/Ouagadougou', 36, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(48, 48, 'Africa/Porto-Novo', 'GMT+01:00', 'Africa/Porto-Novo', 24, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(49, 49, 'Africa/Sao Tome', 'GMT+00:00', 'Africa/Sao_Tome', 195, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(50, 50, 'Africa/Tripoli', 'GMT+02:00', 'Africa/Tripoli', 126, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(51, 51, 'Africa/Tunis', 'GMT+01:00', 'Africa/Tunis', 229, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(52, 52, 'Africa/Windhoek', 'GMT+02:00', 'Africa/Windhoek', 152, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(53, 53, 'America/Adak', 'GMT-09:00', 'America/Adak', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(54, 54, 'America/Anchorage', 'GMT-08:00', 'America/Anchorage', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(55, 55, 'America/Anguilla', 'GMT-04:00', 'America/Anguilla', 7, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(56, 56, 'America/Antigua', 'GMT-04:00', 'America/Antigua', 9, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(57, 57, 'America/Araguaina', 'GMT-03:00', 'America/Araguaina', 32, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(58, 58, 'America/Argentina/Buenos Aires', 'GMT-03:00', 'America/Argentina/Buenos_Aires', 10, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(59, 59, 'America/Argentina/Catamarca', 'GMT-03:00', 'America/Argentina/Catamarca', 10, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(60, 60, 'America/Argentina/Cordoba', 'GMT-03:00', 'America/Argentina/Cordoba', 10, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(61, 61, 'America/Argentina/Jujuy', 'GMT-03:00', 'America/Argentina/Jujuy', 10, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(62, 62, 'America/Argentina/La Rioja', 'GMT-03:00', 'America/Argentina/La_Rioja', 10, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(63, 63, 'America/Argentina/Mendoza', 'GMT-03:00', 'America/Argentina/Mendoza', 10, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(64, 64, 'America/Argentina/Rio Gallegos', 'GMT-03:00', 'America/Argentina/Rio_Gallegos', 10, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(65, 65, 'America/Argentina/Salta', 'GMT-03:00', 'America/Argentina/Salta', 10, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(66, 66, 'America/Argentina/San Juan', 'GMT-03:00', 'America/Argentina/San_Juan', 10, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(67, 67, 'America/Argentina/San Luis', 'GMT-03:00', 'America/Argentina/San_Luis', 10, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(68, 68, 'America/Argentina/Tucuman', 'GMT-03:00', 'America/Argentina/Tucuman', 10, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(69, 69, 'America/Argentina/Ushuaia', 'GMT-03:00', 'America/Argentina/Ushuaia', 10, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(70, 70, 'America/Aruba', 'GMT-04:00', 'America/Aruba', 12, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(71, 71, 'America/Asuncion', 'GMT-04:00', 'America/Asuncion', 174, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(72, 72, 'America/Atikokan', 'GMT-05:00', 'America/Atikokan', 40, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(73, 73, 'America/Bahia', 'GMT-03:00', 'America/Bahia', 32, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(74, 74, 'America/Bahia Banderas', 'GMT-06:00', 'America/Bahia_Banderas', 142, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(75, 75, 'America/Barbados', 'GMT-04:00', 'America/Barbados', 20, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(76, 76, 'America/Belem', 'GMT-03:00', 'America/Belem', 32, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(77, 77, 'America/Belize', 'GMT-06:00', 'America/Belize', 23, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(78, 78, 'America/Blanc-Sablon', 'GMT-04:00', 'America/Blanc-Sablon', 40, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(79, 79, 'America/Boa Vista', 'GMT-04:00', 'America/Boa_Vista', 32, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(80, 80, 'America/Bogota', 'GMT-05:00', 'America/Bogota', 49, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(81, 81, 'America/Boise', 'GMT-06:00', 'America/Boise', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(82, 82, 'America/Cambridge Bay', 'GMT-06:00', 'America/Cambridge_Bay', 40, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(83, 83, 'America/Campo Grande', 'GMT-04:00', 'America/Campo_Grande', 32, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(84, 84, 'America/Cancun', 'GMT-05:00', 'America/Cancun', 142, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(85, 85, 'America/Caracas', 'GMT-04:00', 'America/Caracas', 243, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(86, 86, 'America/Cayenne', 'GMT-03:00', 'America/Cayenne', 77, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(87, 87, 'America/Cayman', 'GMT-05:00', 'America/Cayman', 42, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(88, 88, 'America/Chicago', 'GMT-05:00', 'America/Chicago', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(89, 89, 'America/Chihuahua', 'GMT-06:00', 'America/Chihuahua', 142, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(90, 90, 'America/Ciudad Juarez', 'GMT-06:00', 'America/Ciudad_Juarez', 142, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(91, 91, 'America/Costa Rica', 'GMT-06:00', 'America/Costa_Rica', 54, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(92, 92, 'America/Creston', 'GMT-07:00', 'America/Creston', 40, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(93, 93, 'America/Cuiaba', 'GMT-04:00', 'America/Cuiaba', 32, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(94, 94, 'America/Curacao', 'GMT-04:00', 'America/Curacao', 57, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(95, 95, 'America/Danmarkshavn', 'GMT+00:00', 'America/Danmarkshavn', 87, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(96, 96, 'America/Dawson', 'GMT-07:00', 'America/Dawson', 40, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(97, 97, 'America/Dawson Creek', 'GMT-07:00', 'America/Dawson_Creek', 40, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(98, 98, 'America/Denver', 'GMT-06:00', 'America/Denver', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(99, 99, 'America/Detroit', 'GMT-04:00', 'America/Detroit', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(100, 100, 'America/Dominica', 'GMT-04:00', 'America/Dominica', 63, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(101, 101, 'America/Edmonton', 'GMT-06:00', 'America/Edmonton', 40, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(102, 102, 'America/Eirunepe', 'GMT-05:00', 'America/Eirunepe', 32, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(103, 103, 'America/El Salvador', 'GMT-06:00', 'America/El_Salvador', 67, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(104, 104, 'America/Fort Nelson', 'GMT-07:00', 'America/Fort_Nelson', 40, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(105, 105, 'America/Fortaleza', 'GMT-03:00', 'America/Fortaleza', 32, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(106, 106, 'America/Glace Bay', 'GMT-03:00', 'America/Glace_Bay', 40, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(107, 107, 'America/Goose Bay', 'GMT-03:00', 'America/Goose_Bay', 40, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(108, 108, 'America/Grand Turk', 'GMT-04:00', 'America/Grand_Turk', 232, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(109, 109, 'America/Grenada', 'GMT-04:00', 'America/Grenada', 88, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(110, 110, 'America/Guadeloupe', 'GMT-04:00', 'America/Guadeloupe', 89, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(111, 111, 'America/Guatemala', 'GMT-06:00', 'America/Guatemala', 91, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(112, 112, 'America/Guayaquil', 'GMT-05:00', 'America/Guayaquil', 65, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(113, 113, 'America/Guyana', 'GMT-04:00', 'America/Guyana', 95, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(114, 114, 'America/Halifax', 'GMT-03:00', 'America/Halifax', 40, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(115, 115, 'America/Havana', 'GMT-04:00', 'America/Havana', 56, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(116, 116, 'America/Hermosillo', 'GMT-07:00', 'America/Hermosillo', 142, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(117, 117, 'America/Indiana/Indianapolis', 'GMT-04:00', 'America/Indiana/Indianapolis', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(118, 118, 'America/Indiana/Knox', 'GMT-05:00', 'America/Indiana/Knox', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(119, 119, 'America/Indiana/Marengo', 'GMT-04:00', 'America/Indiana/Marengo', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(120, 120, 'America/Indiana/Petersburg', 'GMT-04:00', 'America/Indiana/Petersburg', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(121, 121, 'America/Indiana/Tell City', 'GMT-05:00', 'America/Indiana/Tell_City', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(122, 122, 'America/Indiana/Vevay', 'GMT-04:00', 'America/Indiana/Vevay', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(123, 123, 'America/Indiana/Vincennes', 'GMT-04:00', 'America/Indiana/Vincennes', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(124, 124, 'America/Indiana/Winamac', 'GMT-04:00', 'America/Indiana/Winamac', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(125, 125, 'America/Inuvik', 'GMT-06:00', 'America/Inuvik', 40, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(126, 126, 'America/Iqaluit', 'GMT-04:00', 'America/Iqaluit', 40, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(127, 127, 'America/Jamaica', 'GMT-05:00', 'America/Jamaica', 111, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(128, 128, 'America/Juneau', 'GMT-08:00', 'America/Juneau', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(129, 129, 'America/Kentucky/Louisville', 'GMT-04:00', 'America/Kentucky/Louisville', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(130, 130, 'America/Kentucky/Monticello', 'GMT-04:00', 'America/Kentucky/Monticello', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(131, 131, 'America/Kralendijk', 'GMT-04:00', 'America/Kralendijk', 28, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(132, 132, 'America/La Paz', 'GMT-04:00', 'America/La_Paz', 27, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(133, 133, 'America/Lima', 'GMT-05:00', 'America/Lima', 175, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(134, 134, 'America/Los Angeles', 'GMT-07:00', 'America/Los_Angeles', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(135, 135, 'America/Lower Princes', 'GMT-04:00', 'America/Lower_Princes', 203, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(136, 136, 'America/Maceio', 'GMT-03:00', 'America/Maceio', 32, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(137, 137, 'America/Managua', 'GMT-06:00', 'America/Managua', 159, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(138, 138, 'America/Manaus', 'GMT-04:00', 'America/Manaus', 32, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(139, 139, 'America/Marigot', 'GMT-04:00', 'America/Marigot', 190, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(140, 140, 'America/Martinique', 'GMT-04:00', 'America/Martinique', 138, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(141, 141, 'America/Matamoros', 'GMT-05:00', 'America/Matamoros', 142, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(142, 142, 'America/Mazatlan', 'GMT-07:00', 'America/Mazatlan', 142, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(143, 143, 'America/Menominee', 'GMT-05:00', 'America/Menominee', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(144, 144, 'America/Merida', 'GMT-06:00', 'America/Merida', 142, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(145, 145, 'America/Metlakatla', 'GMT-08:00', 'America/Metlakatla', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(146, 146, 'America/Mexico City', 'GMT-06:00', 'America/Mexico_City', 142, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(147, 147, 'America/Miquelon', 'GMT-02:00', 'America/Miquelon', 191, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(148, 148, 'America/Moncton', 'GMT-03:00', 'America/Moncton', 40, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(149, 149, 'America/Monterrey', 'GMT-06:00', 'America/Monterrey', 142, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(150, 150, 'America/Montevideo', 'GMT-03:00', 'America/Montevideo', 240, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(151, 151, 'America/Montserrat', 'GMT-04:00', 'America/Montserrat', 148, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(152, 152, 'America/Nassau', 'GMT-04:00', 'America/Nassau', 17, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(153, 153, 'America/New York', 'GMT-04:00', 'America/New_York', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(154, 154, 'America/Nome', 'GMT-08:00', 'America/Nome', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(155, 155, 'America/Noronha', 'GMT-02:00', 'America/Noronha', 32, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(156, 156, 'America/North Dakota/Beulah', 'GMT-05:00', 'America/North_Dakota/Beulah', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(157, 157, 'America/North Dakota/Center', 'GMT-05:00', 'America/North_Dakota/Center', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(158, 158, 'America/North Dakota/New Salem', 'GMT-05:00', 'America/North_Dakota/New_Salem', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(159, 159, 'America/Nuuk', 'GMT-01:00', 'America/Nuuk', 87, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(160, 160, 'America/Ojinaga', 'GMT-05:00', 'America/Ojinaga', 142, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(161, 161, 'America/Panama', 'GMT-05:00', 'America/Panama', 172, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(162, 162, 'America/Paramaribo', 'GMT-03:00', 'America/Paramaribo', 214, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(163, 163, 'America/Phoenix', 'GMT-07:00', 'America/Phoenix', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(164, 164, 'America/Port-au-Prince', 'GMT-04:00', 'America/Port-au-Prince', 96, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(165, 165, 'America/Port of Spain', 'GMT-04:00', 'America/Port_of_Spain', 228, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(166, 166, 'America/Porto Velho', 'GMT-04:00', 'America/Porto_Velho', 32, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(167, 167, 'America/Puerto Rico', 'GMT-04:00', 'America/Puerto_Rico', 180, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(168, 168, 'America/Punta Arenas', 'GMT-03:00', 'America/Punta_Arenas', 45, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(169, 169, 'America/Rankin Inlet', 'GMT-05:00', 'America/Rankin_Inlet', 40, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(170, 170, 'America/Recife', 'GMT-03:00', 'America/Recife', 32, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(171, 171, 'America/Regina', 'GMT-06:00', 'America/Regina', 40, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(172, 172, 'America/Resolute', 'GMT-05:00', 'America/Resolute', 40, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(173, 173, 'America/Rio Branco', 'GMT-05:00', 'America/Rio_Branco', 32, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(174, 174, 'America/Santarem', 'GMT-03:00', 'America/Santarem', 32, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(175, 175, 'America/Santiago', 'GMT-04:00', 'America/Santiago', 45, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(176, 176, 'America/Santo Domingo', 'GMT-04:00', 'America/Santo_Domingo', 64, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(177, 177, 'America/Sao Paulo', 'GMT-03:00', 'America/Sao_Paulo', 32, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(178, 178, 'America/Scoresbysund', 'GMT+00:00', 'America/Scoresbysund', 87, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(179, 179, 'America/Sitka', 'GMT-08:00', 'America/Sitka', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(180, 180, 'America/St Barthelemy', 'GMT-04:00', 'America/St_Barthelemy', 186, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(181, 181, 'America/St Johns', 'GMT-02:30', 'America/St_Johns', 40, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(182, 182, 'America/St Kitts', 'GMT-04:00', 'America/St_Kitts', 188, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(183, 183, 'America/St Lucia', 'GMT-04:00', 'America/St_Lucia', 189, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(184, 184, 'America/St Thomas', 'GMT-04:00', 'America/St_Thomas', 246, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(185, 185, 'America/St Vincent', 'GMT-04:00', 'America/St_Vincent', 192, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(186, 186, 'America/Swift Current', 'GMT-06:00', 'America/Swift_Current', 40, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(187, 187, 'America/Tegucigalpa', 'GMT-06:00', 'America/Tegucigalpa', 99, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(188, 188, 'America/Thule', 'GMT-03:00', 'America/Thule', 87, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(189, 189, 'America/Tijuana', 'GMT-07:00', 'America/Tijuana', 142, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(190, 190, 'America/Toronto', 'GMT-04:00', 'America/Toronto', 40, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(191, 191, 'America/Tortola', 'GMT-04:00', 'America/Tortola', 245, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(192, 192, 'America/Vancouver', 'GMT-07:00', 'America/Vancouver', 40, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(193, 193, 'America/Whitehorse', 'GMT-07:00', 'America/Whitehorse', 40, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(194, 194, 'America/Winnipeg', 'GMT-05:00', 'America/Winnipeg', 40, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(195, 195, 'America/Yakutat', 'GMT-08:00', 'America/Yakutat', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(196, 196, 'Antarctica/Casey', 'GMT+11:00', 'Antarctica/Casey', 8, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(197, 197, 'Antarctica/Davis', 'GMT+07:00', 'Antarctica/Davis', 8, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(198, 198, 'Antarctica/DumontDUrville', 'GMT+10:00', 'Antarctica/DumontDUrville', 8, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(199, 199, 'Antarctica/Macquarie', 'GMT+10:00', 'Antarctica/Macquarie', 14, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(200, 200, 'Antarctica/Mawson', 'GMT+05:00', 'Antarctica/Mawson', 8, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(201, 201, 'Antarctica/McMurdo', 'GMT+12:00', 'Antarctica/McMurdo', 8, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(202, 202, 'Antarctica/Palmer', 'GMT-03:00', 'Antarctica/Palmer', 8, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(203, 203, 'Antarctica/Rothera', 'GMT-03:00', 'Antarctica/Rothera', 8, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(204, 204, 'Antarctica/Syowa', 'GMT+03:00', 'Antarctica/Syowa', 8, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(205, 205, 'Antarctica/Troll', 'GMT+02:00', 'Antarctica/Troll', 8, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(206, 206, 'Antarctica/Vostok', 'GMT+06:00', 'Antarctica/Vostok', 8, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(207, 207, 'Arctic/Longyearbyen', 'GMT+02:00', 'Arctic/Longyearbyen', 215, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(208, 208, 'Asia/Aden', 'GMT+03:00', 'Asia/Aden', 249, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(209, 209, 'Asia/Almaty', 'GMT+06:00', 'Asia/Almaty', 115, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(210, 210, 'Asia/Amman', 'GMT+03:00', 'Asia/Amman', 114, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(211, 211, 'Asia/Anadyr', 'GMT+12:00', 'Asia/Anadyr', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(212, 212, 'Asia/Aqtau', 'GMT+05:00', 'Asia/Aqtau', 115, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(213, 213, 'Asia/Aqtobe', 'GMT+05:00', 'Asia/Aqtobe', 115, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(214, 214, 'Asia/Ashgabat', 'GMT+05:00', 'Asia/Ashgabat', 231, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(215, 215, 'Asia/Atyrau', 'GMT+05:00', 'Asia/Atyrau', 115, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(216, 216, 'Asia/Baghdad', 'GMT+03:00', 'Asia/Baghdad', 106, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(217, 217, 'Asia/Bahrain', 'GMT+03:00', 'Asia/Bahrain', 18, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(218, 218, 'Asia/Baku', 'GMT+04:00', 'Asia/Baku', 16, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(219, 219, 'Asia/Bangkok', 'GMT+07:00', 'Asia/Bangkok', 223, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(220, 220, 'Asia/Barnaul', 'GMT+07:00', 'Asia/Barnaul', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(221, 221, 'Asia/Beirut', 'GMT+03:00', 'Asia/Beirut', 123, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(222, 222, 'Asia/Bishkek', 'GMT+06:00', 'Asia/Bishkek', 120, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(223, 223, 'Asia/Brunei', 'GMT+08:00', 'Asia/Brunei', 34, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(224, 224, 'Asia/Chita', 'GMT+09:00', 'Asia/Chita', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(225, 225, 'Asia/Choibalsan', 'GMT+08:00', 'Asia/Choibalsan', 146, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(226, 226, 'Asia/Colombo', 'GMT+05:30', 'Asia/Colombo', 212, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(227, 227, 'Asia/Damascus', 'GMT+03:00', 'Asia/Damascus', 219, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(228, 228, 'Asia/Dhaka', 'GMT+06:00', 'Asia/Dhaka', 19, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(229, 229, 'Asia/Dili', 'GMT+09:00', 'Asia/Dili', 224, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(230, 230, 'Asia/Dubai', 'GMT+04:00', 'Asia/Dubai', 236, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(231, 231, 'Asia/Dushanbe', 'GMT+05:00', 'Asia/Dushanbe', 221, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(232, 232, 'Asia/Famagusta', 'GMT+03:00', 'Asia/Famagusta', 58, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(233, 233, 'Asia/Gaza', 'GMT+03:00', 'Asia/Gaza', 171, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(234, 234, 'Asia/Hebron', 'GMT+03:00', 'Asia/Hebron', 171, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(235, 235, 'Asia/Ho Chi Minh', 'GMT+07:00', 'Asia/Ho_Chi_Minh', 244, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(236, 236, 'Asia/Hong Kong', 'GMT+08:00', 'Asia/Hong_Kong', 100, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(237, 237, 'Asia/Hovd', 'GMT+07:00', 'Asia/Hovd', 146, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(238, 238, 'Asia/Irkutsk', 'GMT+08:00', 'Asia/Irkutsk', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(239, 239, 'Asia/Jakarta', 'GMT+07:00', 'Asia/Jakarta', 104, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(240, 240, 'Asia/Jayapura', 'GMT+09:00', 'Asia/Jayapura', 104, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(241, 241, 'Asia/Jerusalem', 'GMT+03:00', 'Asia/Jerusalem', 109, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(242, 242, 'Asia/Kabul', 'GMT+04:30', 'Asia/Kabul', 1, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(243, 243, 'Asia/Kamchatka', 'GMT+12:00', 'Asia/Kamchatka', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(244, 244, 'Asia/Karachi', 'GMT+05:00', 'Asia/Karachi', 169, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(245, 245, 'Asia/Kathmandu', 'GMT+05:45', 'Asia/Kathmandu', 154, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(246, 246, 'Asia/Khandyga', 'GMT+09:00', 'Asia/Khandyga', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(247, 247, 'Asia/Kolkata', 'GMT+05:30', 'Asia/Kolkata', 103, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(248, 248, 'Asia/Krasnoyarsk', 'GMT+07:00', 'Asia/Krasnoyarsk', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(249, 249, 'Asia/Kuala Lumpur', 'GMT+08:00', 'Asia/Kuala_Lumpur', 133, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(250, 250, 'Asia/Kuching', 'GMT+08:00', 'Asia/Kuching', 133, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(251, 251, 'Asia/Kuwait', 'GMT+03:00', 'Asia/Kuwait', 119, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(252, 252, 'Asia/Macau', 'GMT+08:00', 'Asia/Macau', 130, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(253, 253, 'Asia/Magadan', 'GMT+11:00', 'Asia/Magadan', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(254, 254, 'Asia/Makassar', 'GMT+08:00', 'Asia/Makassar', 104, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(255, 255, 'Asia/Manila', 'GMT+08:00', 'Asia/Manila', 176, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(256, 256, 'Asia/Muscat', 'GMT+04:00', 'Asia/Muscat', 168, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(257, 257, 'Asia/Nicosia', 'GMT+03:00', 'Asia/Nicosia', 58, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(258, 258, 'Asia/Novokuznetsk', 'GMT+07:00', 'Asia/Novokuznetsk', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(259, 259, 'Asia/Novosibirsk', 'GMT+07:00', 'Asia/Novosibirsk', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(260, 260, 'Asia/Omsk', 'GMT+06:00', 'Asia/Omsk', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(261, 261, 'Asia/Oral', 'GMT+05:00', 'Asia/Oral', 115, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(262, 262, 'Asia/Phnom Penh', 'GMT+07:00', 'Asia/Phnom_Penh', 38, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(263, 263, 'Asia/Pontianak', 'GMT+07:00', 'Asia/Pontianak', 104, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(264, 264, 'Asia/Pyongyang', 'GMT+09:00', 'Asia/Pyongyang', 164, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(265, 265, 'Asia/Qatar', 'GMT+03:00', 'Asia/Qatar', 181, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(266, 266, 'Asia/Qostanay', 'GMT+06:00', 'Asia/Qostanay', 115, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(267, 267, 'Asia/Qyzylorda', 'GMT+05:00', 'Asia/Qyzylorda', 115, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(268, 268, 'Asia/Riyadh', 'GMT+03:00', 'Asia/Riyadh', 196, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(269, 269, 'Asia/Sakhalin', 'GMT+11:00', 'Asia/Sakhalin', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(270, 270, 'Asia/Samarkand', 'GMT+05:00', 'Asia/Samarkand', 241, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(271, 271, 'Asia/Seoul', 'GMT+09:00', 'Asia/Seoul', 118, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(272, 272, 'Asia/Shanghai', 'GMT+08:00', 'Asia/Shanghai', 46, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(273, 273, 'Asia/Singapore', 'GMT+08:00', 'Asia/Singapore', 202, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(274, 274, 'Asia/Srednekolymsk', 'GMT+11:00', 'Asia/Srednekolymsk', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(275, 275, 'Asia/Taipei', 'GMT+08:00', 'Asia/Taipei', 220, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(276, 276, 'Asia/Tashkent', 'GMT+05:00', 'Asia/Tashkent', 241, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(277, 277, 'Asia/Tbilisi', 'GMT+04:00', 'Asia/Tbilisi', 82, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(278, 278, 'Asia/Tehran', 'GMT+03:30', 'Asia/Tehran', 105, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(279, 279, 'Asia/Thimphu', 'GMT+06:00', 'Asia/Thimphu', 26, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(280, 280, 'Asia/Tokyo', 'GMT+09:00', 'Asia/Tokyo', 112, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(281, 281, 'Asia/Tomsk', 'GMT+07:00', 'Asia/Tomsk', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(282, 282, 'Asia/Ulaanbaatar', 'GMT+08:00', 'Asia/Ulaanbaatar', 146, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(283, 283, 'Asia/Urumqi', 'GMT+06:00', 'Asia/Urumqi', 46, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(284, 284, 'Asia/Ust-Nera', 'GMT+10:00', 'Asia/Ust-Nera', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(285, 285, 'Asia/Vientiane', 'GMT+07:00', 'Asia/Vientiane', 121, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(286, 286, 'Asia/Vladivostok', 'GMT+10:00', 'Asia/Vladivostok', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(287, 287, 'Asia/Yakutsk', 'GMT+09:00', 'Asia/Yakutsk', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(288, 288, 'Asia/Yangon', 'GMT+06:30', 'Asia/Yangon', 151, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(289, 289, 'Asia/Yekaterinburg', 'GMT+05:00', 'Asia/Yekaterinburg', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(290, 290, 'Asia/Yerevan', 'GMT+04:00', 'Asia/Yerevan', 11, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(291, 291, 'Atlantic/Azores', 'GMT+00:00', 'Atlantic/Azores', 179, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(292, 292, 'Atlantic/Bermuda', 'GMT-03:00', 'Atlantic/Bermuda', 25, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(293, 293, 'Atlantic/Canary', 'GMT+01:00', 'Atlantic/Canary', 211, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(294, 294, 'Atlantic/Cape Verde', 'GMT-01:00', 'Atlantic/Cape_Verde', 41, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(295, 295, 'Atlantic/Faroe', 'GMT+01:00', 'Atlantic/Faroe', 73, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(296, 296, 'Atlantic/Madeira', 'GMT+01:00', 'Atlantic/Madeira', 179, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(297, 297, 'Atlantic/Reykjavik', 'GMT+00:00', 'Atlantic/Reykjavik', 102, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(298, 298, 'Atlantic/South Georgia', 'GMT-02:00', 'Atlantic/South_Georgia', 209, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(299, 299, 'Atlantic/St Helena', 'GMT+00:00', 'Atlantic/St_Helena', 187, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(300, 300, 'Atlantic/Stanley', 'GMT-03:00', 'Atlantic/Stanley', 72, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(301, 301, 'Australia/Adelaide', 'GMT+09:30', 'Australia/Adelaide', 14, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(302, 302, 'Australia/Brisbane', 'GMT+10:00', 'Australia/Brisbane', 14, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(303, 303, 'Australia/Broken Hill', 'GMT+09:30', 'Australia/Broken_Hill', 14, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(304, 304, 'Australia/Darwin', 'GMT+09:30', 'Australia/Darwin', 14, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(305, 305, 'Australia/Eucla', 'GMT+08:45', 'Australia/Eucla', 14, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(306, 306, 'Australia/Hobart', 'GMT+10:00', 'Australia/Hobart', 14, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(307, 307, 'Australia/Lindeman', 'GMT+10:00', 'Australia/Lindeman', 14, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(308, 308, 'Australia/Lord Howe', 'GMT+10:30', 'Australia/Lord_Howe', 14, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(309, 309, 'Australia/Melbourne', 'GMT+10:00', 'Australia/Melbourne', 14, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(310, 310, 'Australia/Perth', 'GMT+08:00', 'Australia/Perth', 14, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(311, 311, 'Australia/Sydney', 'GMT+10:00', 'Australia/Sydney', 14, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(312, 312, 'Europe/Amsterdam', 'GMT+02:00', 'Europe/Amsterdam', 155, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(313, 313, 'Europe/Andorra', 'GMT+02:00', 'Europe/Andorra', 5, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(314, 314, 'Europe/Astrakhan', 'GMT+04:00', 'Europe/Astrakhan', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(315, 315, 'Europe/Athens', 'GMT+03:00', 'Europe/Athens', 86, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(316, 316, 'Europe/Belgrade', 'GMT+02:00', 'Europe/Belgrade', 198, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(317, 317, 'Europe/Berlin', 'GMT+02:00', 'Europe/Berlin', 83, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(318, 318, 'Europe/Bratislava', 'GMT+02:00', 'Europe/Bratislava', 204, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(319, 319, 'Europe/Brussels', 'GMT+02:00', 'Europe/Brussels', 22, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(320, 320, 'Europe/Bucharest', 'GMT+03:00', 'Europe/Bucharest', 183, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(321, 321, 'Europe/Budapest', 'GMT+02:00', 'Europe/Budapest', 101, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(322, 322, 'Europe/Busingen', 'GMT+02:00', 'Europe/Busingen', 83, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(323, 323, 'Europe/Chisinau', 'GMT+03:00', 'Europe/Chisinau', 144, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(324, 324, 'Europe/Copenhagen', 'GMT+02:00', 'Europe/Copenhagen', 61, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(325, 325, 'Europe/Dublin', 'GMT+01:00', 'Europe/Dublin', 107, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(326, 326, 'Europe/Gibraltar', 'GMT+02:00', 'Europe/Gibraltar', 85, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(327, 327, 'Europe/Guernsey', 'GMT+01:00', 'Europe/Guernsey', 92, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(328, 328, 'Europe/Helsinki', 'GMT+03:00', 'Europe/Helsinki', 75, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(329, 329, 'Europe/Isle of Man', 'GMT+01:00', 'Europe/Isle_of_Man', 108, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(330, 330, 'Europe/Istanbul', 'GMT+03:00', 'Europe/Istanbul', 230, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(331, 331, 'Europe/Jersey', 'GMT+01:00', 'Europe/Jersey', 113, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(332, 332, 'Europe/Kaliningrad', 'GMT+02:00', 'Europe/Kaliningrad', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(333, 333, 'Europe/Kirov', 'GMT+03:00', 'Europe/Kirov', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(334, 334, 'Europe/Kyiv', 'GMT+03:00', 'Europe/Kyiv', 235, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(335, 335, 'Europe/Lisbon', 'GMT+01:00', 'Europe/Lisbon', 179, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(336, 336, 'Europe/Ljubljana', 'GMT+02:00', 'Europe/Ljubljana', 205, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(337, 337, 'Europe/London', 'GMT+01:00', 'Europe/London', 237, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(338, 338, 'Europe/Luxembourg', 'GMT+02:00', 'Europe/Luxembourg', 129, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(339, 339, 'Europe/Madrid', 'GMT+02:00', 'Europe/Madrid', 211, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(340, 340, 'Europe/Malta', 'GMT+02:00', 'Europe/Malta', 136, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(341, 341, 'Europe/Mariehamn', 'GMT+03:00', 'Europe/Mariehamn', 252, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(342, 342, 'Europe/Minsk', 'GMT+03:00', 'Europe/Minsk', 21, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(343, 343, 'Europe/Monaco', 'GMT+02:00', 'Europe/Monaco', 145, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(344, 344, 'Europe/Moscow', 'GMT+03:00', 'Europe/Moscow', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(345, 345, 'Europe/Oslo', 'GMT+02:00', 'Europe/Oslo', 167, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(346, 346, 'Europe/Paris', 'GMT+02:00', 'Europe/Paris', 76, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(347, 347, 'Europe/Podgorica', 'GMT+02:00', 'Europe/Podgorica', 147, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(348, 348, 'Europe/Prague', 'GMT+02:00', 'Europe/Prague', 59, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(349, 349, 'Europe/Riga', 'GMT+03:00', 'Europe/Riga', 122, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(350, 350, 'Europe/Rome', 'GMT+02:00', 'Europe/Rome', 110, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(351, 351, 'Europe/Samara', 'GMT+04:00', 'Europe/Samara', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(352, 352, 'Europe/San Marino', 'GMT+02:00', 'Europe/San_Marino', 194, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(353, 353, 'Europe/Sarajevo', 'GMT+02:00', 'Europe/Sarajevo', 29, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(354, 354, 'Europe/Saratov', 'GMT+04:00', 'Europe/Saratov', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(355, 355, 'Europe/Simferopol', 'GMT+03:00', 'Europe/Simferopol', 235, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(356, 356, 'Europe/Skopje', 'GMT+02:00', 'Europe/Skopje', 165, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(357, 357, 'Europe/Sofia', 'GMT+03:00', 'Europe/Sofia', 35, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(358, 358, 'Europe/Stockholm', 'GMT+02:00', 'Europe/Stockholm', 217, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(359, 359, 'Europe/Tallinn', 'GMT+03:00', 'Europe/Tallinn', 70, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(360, 360, 'Europe/Tirane', 'GMT+02:00', 'Europe/Tirane', 2, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(361, 361, 'Europe/Ulyanovsk', 'GMT+04:00', 'Europe/Ulyanovsk', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(362, 362, 'Europe/Vaduz', 'GMT+02:00', 'Europe/Vaduz', 127, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(363, 363, 'Europe/Vatican', 'GMT+02:00', 'Europe/Vatican', 98, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(364, 364, 'Europe/Vienna', 'GMT+02:00', 'Europe/Vienna', 15, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(365, 365, 'Europe/Vilnius', 'GMT+03:00', 'Europe/Vilnius', 128, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(366, 366, 'Europe/Volgograd', 'GMT+03:00', 'Europe/Volgograd', 184, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(367, 367, 'Europe/Warsaw', 'GMT+02:00', 'Europe/Warsaw', 178, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(368, 368, 'Europe/Zagreb', 'GMT+02:00', 'Europe/Zagreb', 55, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(369, 369, 'Europe/Zurich', 'GMT+02:00', 'Europe/Zurich', 218, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(370, 370, 'Indian/Antananarivo', 'GMT+03:00', 'Indian/Antananarivo', 131, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(371, 371, 'Indian/Chagos', 'GMT+06:00', 'Indian/Chagos', 33, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(372, 372, 'Indian/Christmas', 'GMT+07:00', 'Indian/Christmas', 47, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(373, 373, 'Indian/Cocos', 'GMT+06:30', 'Indian/Cocos', 48, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(374, 374, 'Indian/Comoro', 'GMT+03:00', 'Indian/Comoro', 50, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(375, 375, 'Indian/Kerguelen', 'GMT+05:00', 'Indian/Kerguelen', 79, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(376, 376, 'Indian/Mahe', 'GMT+04:00', 'Indian/Mahe', 200, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(377, 377, 'Indian/Maldives', 'GMT+05:00', 'Indian/Maldives', 134, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(378, 378, 'Indian/Mauritius', 'GMT+04:00', 'Indian/Mauritius', 140, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(379, 379, 'Indian/Mayotte', 'GMT+03:00', 'Indian/Mayotte', 141, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(380, 380, 'Indian/Reunion', 'GMT+04:00', 'Indian/Reunion', 182, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(381, 381, 'Pacific/Apia', 'GMT+13:00', 'Pacific/Apia', 193, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(382, 382, 'Pacific/Auckland', 'GMT+12:00', 'Pacific/Auckland', 158, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(383, 383, 'Pacific/Bougainville', 'GMT+11:00', 'Pacific/Bougainville', 173, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(384, 384, 'Pacific/Chatham', 'GMT+12:45', 'Pacific/Chatham', 158, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(385, 385, 'Pacific/Chuuk', 'GMT+10:00', 'Pacific/Chuuk', 143, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(386, 386, 'Pacific/Easter', 'GMT-06:00', 'Pacific/Easter', 45, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(387, 387, 'Pacific/Efate', 'GMT+11:00', 'Pacific/Efate', 242, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(388, 388, 'Pacific/Fakaofo', 'GMT+13:00', 'Pacific/Fakaofo', 226, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(389, 389, 'Pacific/Fiji', 'GMT+12:00', 'Pacific/Fiji', 74, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(390, 390, 'Pacific/Funafuti', 'GMT+12:00', 'Pacific/Funafuti', 233, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(391, 391, 'Pacific/Galapagos', 'GMT-06:00', 'Pacific/Galapagos', 65, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(392, 392, 'Pacific/Gambier', 'GMT-09:00', 'Pacific/Gambier', 78, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(393, 393, 'Pacific/Guadalcanal', 'GMT+11:00', 'Pacific/Guadalcanal', 206, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(394, 394, 'Pacific/Guam', 'GMT+10:00', 'Pacific/Guam', 90, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(395, 395, 'Pacific/Honolulu', 'GMT-10:00', 'Pacific/Honolulu', 238, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(396, 396, 'Pacific/Kanton', 'GMT+13:00', 'Pacific/Kanton', 117, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(397, 397, 'Pacific/Kiritimati', 'GMT+14:00', 'Pacific/Kiritimati', 117, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(398, 398, 'Pacific/Kosrae', 'GMT+11:00', 'Pacific/Kosrae', 143, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(399, 399, 'Pacific/Kwajalein', 'GMT+12:00', 'Pacific/Kwajalein', 137, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(400, 400, 'Pacific/Majuro', 'GMT+12:00', 'Pacific/Majuro', 137, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(401, 401, 'Pacific/Marquesas', 'GMT-09:30', 'Pacific/Marquesas', 78, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(402, 402, 'Pacific/Midway', 'GMT-11:00', 'Pacific/Midway', 239, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(403, 403, 'Pacific/Nauru', 'GMT+12:00', 'Pacific/Nauru', 153, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(404, 404, 'Pacific/Niue', 'GMT-11:00', 'Pacific/Niue', 162, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(405, 405, 'Pacific/Norfolk', 'GMT+11:00', 'Pacific/Norfolk', 163, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(406, 406, 'Pacific/Noumea', 'GMT+11:00', 'Pacific/Noumea', 157, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(407, 407, 'Pacific/Pago Pago', 'GMT-11:00', 'Pacific/Pago_Pago', 4, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(408, 408, 'Pacific/Palau', 'GMT+09:00', 'Pacific/Palau', 170, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(409, 409, 'Pacific/Pitcairn', 'GMT-08:00', 'Pacific/Pitcairn', 177, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(410, 410, 'Pacific/Pohnpei', 'GMT+11:00', 'Pacific/Pohnpei', 143, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(411, 411, 'Pacific/Port Moresby', 'GMT+10:00', 'Pacific/Port_Moresby', 173, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(412, 412, 'Pacific/Rarotonga', 'GMT-10:00', 'Pacific/Rarotonga', 53, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(413, 413, 'Pacific/Saipan', 'GMT+10:00', 'Pacific/Saipan', 166, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(414, 414, 'Pacific/Tahiti', 'GMT-10:00', 'Pacific/Tahiti', 78, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(415, 415, 'Pacific/Tarawa', 'GMT+12:00', 'Pacific/Tarawa', 117, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(416, 416, 'Pacific/Tongatapu', 'GMT+13:00', 'Pacific/Tongatapu', 227, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(417, 417, 'Pacific/Wake', 'GMT+12:00', 'Pacific/Wake', 239, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(418, 418, 'Pacific/Wallis', 'GMT+12:00', 'Pacific/Wallis', 247, '2025-07-02 13:41:40', '2025-07-02 13:41:40'),
(419, 419, 'UTC', 'GMT+00:00', 'UTC', NULL, '2025-07-02 13:41:40', '2025-07-02 13:41:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `user_name` varchar(120) NOT NULL,
  `uuu_id` varchar(255) NOT NULL,
  `email` varchar(96) NOT NULL,
  `first_name` varchar(32) DEFAULT NULL,
  `last_name` varchar(32) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `gender` enum('male','female','other') NOT NULL DEFAULT 'male',
  `date_of_birth` date DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `user_type` enum('system_admin','club','club_employee','coach','instructor','player','guest','analytics_manager') NOT NULL DEFAULT 'player',
  `user_type_id` bigint(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `old_password` varchar(255) DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL,
  `ip` varchar(40) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `otp_expires_at` timestamp NULL DEFAULT NULL,
  `otp_used_at` timestamp NULL DEFAULT NULL,
  `otp_attempts` tinyint(3) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `uuu_id`, `email`, `first_name`, `last_name`, `phone_number`, `gender`, `date_of_birth`, `image`, `latitude`, `longitude`, `city`, `state`, `country`, `user_type`, `user_type_id`, `password`, `old_password`, `code`, `ip`, `provider`, `provider_id`, `otp`, `otp_expires_at`, `otp_used_at`, `otp_attempts`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'aFKfEJaxetmNe7yq6zRqsZfcL2M8NNGC', 'SystemAdmin@gmail.com', 'System', 'Admin', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'system_admin', NULL, '$2y$12$ox9AZAkwTVOGw.m.0iYzSuQbTcZWm/cQqieyk6oO4eA67EoCE3tR6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(2, 'waqarbangash2', '5Jbvr3pLXmUUjdBvRg2irfuC2V48A6jp', 'waqarbangash@gmail.com', 'arsal', 'bajwa', '+92335687233', 'male', NULL, NULL, NULL, NULL, 'kandahar', NULL, 'Aruba', 'club', NULL, '$2y$12$ox9AZAkwTVOGw.m.0iYzSuQbTcZWm/cQqieyk6oO4eA67EoCE3tR6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-13 08:08:43', '2025-07-10 15:01:24'),
(8, 'MyClub1236', 'Wt6yqUD5ovtxPD0pD0yoXYHGFfTUniFU', 'MyClub123@gmail.com', 'My', 'Club', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', NULL, '$2y$12$wq3Vr2Eb9twP7/eFBf0H..RshZEe4dOxLzO/KMCdySenvTSag0Wqi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-16 13:14:22', '2025-06-16 13:14:22'),
(9, 'MyClub12ds37', 'CJotfX7R5eEZJ5K1I4IwR9mIwalkvOS9', 'MyClub12ds3@gmail.com', 'My', 'Club', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', NULL, '$2y$12$uX2gqlQc0ZwAqGUM6mJfGu8E/BwC6gZFZs4aTyUB95y1YOifqvUCm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-16 13:17:07', '2025-06-16 13:17:07'),
(10, 'MyClsdfsafs38', 'WStj9tbwKKgHxepBjRLm0jhzjmjC7WjC', 'MyClsdfsafs3@gmail.com', 'My', 'Club', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', NULL, '$2y$12$hdC/U6LnOuSuEu.yTnu58uNhodcAcalyQALJiqSAhDyGioi65HEF2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-16 13:21:52', '2025-06-16 13:21:52'),
(11, 'MyClsdfssafs39', 'V19RH8aWz93bsgEKxVgR86ODCTLAbN6n', 'MyClsdfssafs3@gmail.com', 'My', 'Club', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', NULL, '$2y$12$kQJvkYMNoEpcZLdE5tGmQOG17AFJl2ICHYNAiESymM/GGyyO2X6fK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-16 13:23:43', '2025-06-16 13:23:43'),
(16, 'ehtisham.glaxit12', 'BuVu5MvcpurldlH43wPNPa9FhbR97Xcq', 'ehtisham.glaxit@gmail.com', 'Ehtisham', 'Yaqoob', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', NULL, '$2y$12$D34GOYFS6IhMN/la11AinO5bOCJr8MQ8/sbzAAKfk/xsYb5Vyu41.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-02 10:56:36', 0, '2025-06-16 14:56:43', '2025-07-02 10:56:36'),
(21, 'main12313', 'kmuRkWugOy3nYUc0Xr4J0gKFhUoK3Sdp', 'main123@gmail.com', 'Muhammad', 'Waqar', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', NULL, '$2y$12$ox9AZAkwTVOGw.m.0iYzSuQbTcZWm/cQqieyk6oO4eA67EoCE3tR6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-16 16:02:34', '2025-06-16 16:02:34'),
(22, 'tennisClub14', 'fApCqynARgFz0SSqNXENVLfYcEkBDxNj', 'tennisClub@gmail.com', 'Tennis', 'Club', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', NULL, '$2y$12$ox9AZAkwTVOGw.m.0iYzSuQbTcZWm/cQqieyk6oO4eA67EoCE3tR6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-16 16:05:47', '2025-06-16 16:05:47'),
(23, 'yasir15', 'JGA8eJbJGCNam0qdFisL06ogLI3bZmfK', 'yasir@gmail.com', 'Tennis', 'Club', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', NULL, '$2y$12$ox9AZAkwTVOGw.m.0iYzSuQbTcZWm/cQqieyk6oO4eA67EoCE3tR6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-16 16:34:36', '2025-06-16 16:34:36'),
(24, 'usman14145016', '1q4caMEHHDxwFkGrByWB3krGEBIqOa4w', 'usma123@gmail.com', 'Usman Ali', 'Awan', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', NULL, '$2y$12$JJ06d3FbhEZF9Dc/.jNnRubt6cC8PMvKIWBCWaey1kNKpp.V.I0.W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-16 16:42:35', '2025-06-16 16:42:35'),
(25, 'arsalzaheer4917', 'mpIOBZiZgHSMwtDURaOfLVVuzgnvlxnA', 'arsalzaheer49@gmail.com', 'Arsal', 'Zaheer', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', NULL, '$2y$12$dzTCfclZdJg3ZSJr6OOTvu.Yez.l0KMLWxBONOohBwaUixZ59Iave', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-17 05:17:11', '2025-06-17 05:17:11'),
(26, 'arsalzaheer43018', 'GKeEWf2f1SPQTmTPIdRzBUFYfFKt1jne', 'arsalzaheer430@gmail.com', 'Arsal', 'Zaheer', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', NULL, '$2y$12$4Xv57hczguuQnQx8zdJ3S.ix1pcciygyx1VtH8S82/pHtz6v68KY6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-17 05:23:50', '2025-06-17 05:23:50'),
(27, 'arsalz200519', 'wa0cCTXcphuFtLZxW2YsZJLLsE8r6f6B', 'arsalz2005@gmail.com', 'Arsal', 'Zaheer', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', NULL, '$2y$12$V26GtyIWB3Yc/FhXOIPbBeBPEyyPl01wRWyoaGJPAiznEMCxxeLQy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-17 05:29:01', '2025-06-17 05:29:01'),
(28, '120', 'nFjIRfErpZJctkQvGT44jAVlYUeHUtfq', '1@g', '1', '2', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', NULL, '$2y$12$cV3./EJT8UeXew.XALQoz.zUL4dKGhw.woMJrAa38jIHIqtEpAyQu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-17 05:33:47', '2025-06-17 05:33:47'),
(29, 'arsa21', '4CHDyWDprq4sNIxtvyZ2miILBvGShe4v', 'arsa@gmail.com', 'bgdfg', 'Zaheer', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', NULL, '$2y$12$QwcWCjVv4DPwPZjkLtvnVuDsKVO19G1lFcpYRnlV/dduTfDOPcWJa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-17 05:46:14', '2025-06-17 05:46:14'),
(30, 'fsdf22', 'rnvCNtcAN0z7ynTgHTxJhJagAfTyOKDU', 'fsdf@gmail.com', 'Arsal-', 'dfgd', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', NULL, '$2y$12$krt5Pyog.Ch5Et5NE0JsMOzApMX2p3awEwcL.Kkli98aeFVh7UufC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-17 05:57:08', '2025-06-17 05:57:08'),
(31, 'arsalzaheer23', 'dBx8gGDrgMcm3m4207zulO83omTK8a2s', 'arsalzaheer@gmail.com', 'fgf', 'vbv', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', NULL, '$2y$12$mvOz1hbmp39ryJleGuaWd.4APxj4r.fyArCLeShONGRQd.fR0ZDtO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-17 06:04:50', '2025-06-17 06:04:50'),
(32, 'ara24', 'xuyJLQwORYPVqjqMz7tEvouj8J7f1KIq', 'ara@gmail.com', 'Arsal', 'gfgf-', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', NULL, '$2y$12$rbWmUnq6jzYJjfTNpxiSXe1Ztn6OKOeTQEOwIv6uDV9orjZB4MQum', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-17 06:13:28', '2025-06-17 06:13:28'),
(34, 'johndoe225', 'OhfjwvJEfr59MxhDtUMCYO8Rn2IDyVYd', 'johndoe2@gmail.com', 'John', 'Doe', '+923367899000', 'male', NULL, NULL, 33.83848300, 35.88066900, 'Beirut', NULL, 'Labanon', 'coach', 1, '$2y$12$BnyxxpCXg.Acswl.F/iQD.P8nuZmzF4tzj8K7A6NNibgYjcRKTiYe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-17 07:38:17', '2025-06-17 07:38:17'),
(35, 'Akhtar2323', 'EdXXud1aSURKUkGgMZiG8JqPHZhU350j', 'Akhtar23@gmail.com', 'Ahmad', 'Jilani', '12345678911', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$6HBDRZT.n/mGXmxxmdO7Qe9jfyqql28WsG9gF1.FDfV//1HS1/Nvm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-17 11:10:34', '2025-06-17 11:10:34'),
(36, 'johndoe8924', '7QrSj0GmIdtQnCzPmhi9PkThFNbEWjNJ', 'johndoe89@gmail.com', 'John', 'Doe', '+923367899000', 'male', '2000-12-31', NULL, 33.83848300, 35.88066900, 'Beirut', NULL, 'Labanon', 'coach', 2, '$2y$12$wL0wrVk077FlQeZDvLDNd.VR8F1daUDHxzC2GzB2drKXxG3MF1aty', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-17 11:45:26', '2025-06-17 11:45:26'),
(37, 'Aslam1225', 'ITYpvFgKfwhktOIA3voUOXmWe1nv3Sx9', 'Aslam12@gmail.com', 'Ahmad', 'Jilani', '12345678911', 'male', NULL, 'https://ace-community.hyglaxit.com/storage/images/72931744-1f70-45f7-8928-f045f809ebda.jpg', NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$TCJ0TBxh8XuCBAknU1HZ.usQUcFZXvfD1nuXQ2aeRfqdbCV1le7x2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-17 12:12:11', '2025-06-25 08:31:47'),
(39, 'Amjad1226', 'CtbzIvTrqAHRzSnKowMyAgAAkLwNRK04', 'Amjad12@gmail.com', 'Ahmad', 'Jilani', '12345678911', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$3VEnpCgTTzxUzsvd4kSnPOQgWynktkiT2mLxQzWYppZwHiTqejGv2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-17 12:27:17', '2025-06-17 12:27:17'),
(40, 'Amjad13227', 'A90Xz7TtGjr0pUpz5NsOpfaXEp6uiO4C', 'ahmadal@gmail.com', 'arsal', 'bajwa', '+92335687233', 'male', NULL, NULL, NULL, NULL, 'kandahar', NULL, 'Aruba', 'player', NULL, '$2y$12$no1gpQv4TCAMSVwzF2CkE.PiaJH5QIQApIwTVFC95H0mTKx8RlDq6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-17 13:00:01', '2025-07-06 16:36:12'),
(41, 'Amjad12328', 'JDfJkMEaeY6pziSchGUdeo01Ejj7FGeQ', 'Amjad123@gmail.com', 'Ahmad', 'Jilani', '12345678911', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$.02YghkGRadPZGHa/XAKg.3spTxuXh6q8.b/At5faouzf3kwMVcPO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-17 13:59:41', '2025-06-17 13:59:41'),
(42, 'younisgopang282829', 'ZA5BNaS19gjyO6OgHXUKN2z25oYuzO5S', 'younisgopang2828@gmail.com', 'Younis', 'Gopang', '12345678911', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$xqxfl.mAM8.LcP.qav5J5Oo3Cbw8KiI95XBV1NgLqvPcyjsSoCvwa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-17 14:29:53', '2025-06-17 14:29:53'),
(43, 'yasir.glaxit30', 'uCBPyb71h5kVIiUUZDFNA9TnyC5qp13K', 'yasir.glaxit@gmail.com', 'yasir', 'Nadeem', '+923171704895', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$xUQieioHmoQvLKOE1MW4LuxnZwgRPWNHPdzk45gVU3W0j6O/WeAvi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-17 14:34:07', '2025-06-17 14:34:07'),
(44, 'bababaah31', 'gFkSywG7PddchcbL8SjtfrS0MaydrVZI', 'bababaah@gmail.com', 'gopang', 'balouch', '1239872397', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$Ey8NSeT.jOkV.y/7SdP3TONRPPUHpjIVjS.2eExIBYsNbAmg/ehi.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-17 14:49:30', '2025-06-17 14:49:30'),
(45, 'yasir.glaxit12332', 'gW9GbpNq7KnDXccT8gQHgy4dAfruM8Mj', 'yasir.glaxit123@gmail.com', 'Yasir', 'Nadeem', '+923123434567', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$ox9AZAkwTVOGw.m.0iYzSuQbTcZWm/cQqieyk6oO4eA67EoCE3tR6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-17 14:59:37', '2025-06-17 14:59:37'),
(46, 'abidali0133', 'O3KxjuX9LAkRoarqI9vt5h08WNXLoAGQ', 'abidali01@gmail.com', 'Abid', 'Ali', '+923123456789', 'male', '2000-12-31', NULL, 33.83848300, 35.88066900, 'Islamabad', NULL, 'Pakistan', 'coach', 3, '$2y$12$ox9AZAkwTVOGw.m.0iYzSuQbTcZWm/cQqieyk6oO4eA67EoCE3tR6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-17 15:05:24', '2025-06-17 15:05:24'),
(47, 'abidali0134', 'KDwyCf270VoMAE4c39NUWGFSZlUOrqPY', 'abidali01@outlook.com', 'Abid', 'Ali', '+923123456789', 'male', '2000-12-31', NULL, 33.83848300, 35.88066900, 'Islamabad', NULL, 'Pakistan', 'coach', 4, '$2y$12$iSUzAGR1wEZD/rhW39px7.q9XrDOehyX1tgdbHFzpfGZE7kQnjDU.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-17 15:07:18', '2025-06-17 15:07:18'),
(48, 'gopang935', 'WVLujfi98yLq1BDb0EGPX177FEusmlBS', 'gopang9@gmail.com', 'younis', 'gopang balouch', '3336677575', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$fmy34R4PccBPhVZlCL1KbOQFjZVZo3aTA0dHHumPx8ugs/GQXBHre', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-18 06:47:40', '2025-06-18 06:47:40'),
(49, 'hamza36', 'CuprCPm28kRxeclAXrWV2OjgCA3a3GtE', 'hamza@outlook.com', ':;\'\"*', 'khan:682&', '3036519542', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$vbr7yuXPH1r9pVm6xpNy3.ns2U4Kve2IO7WT6tXxAKUIcNoAd/Wpa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-18 07:08:45', '2025-06-18 07:08:45'),
(50, 'wbbsanba37', '1HvsVznLf7tkSU8KIgvbWbEDFRIOCF2H', 'wbbsanba@outlook.com', 'bsbsba', 'nsnsnsb', '3336669454', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$zEIR0wZifpmplF.wN5.J0uD6Ka.FqyUoglqbFmrka/2bYfr7kKk8u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-18 07:16:50', '2025-06-18 07:16:50'),
(51, 'ddddddd38', '7HLDWMQOg4NT8b9J5aVj0JiduPiZeWQu', 'ddddddd@gmail.com', 'hdsj@?$+$', 'shsbbs', '4949949494', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$TqlobCnbmMevWx9jjAciGOSviVEnM6Prd/HMI.0be.KrtE2B/dtnC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-18 07:28:31', '2025-06-18 07:28:31'),
(52, 'bssbbansbab39', 'vSreYryBMIeLPapAmr3uNnCN0HmH7KXo', 'bssbbansbab@gmail.com', '+#+@@;', 'bsns', '4848494949', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$TXWwZjvKfWO5b31G2L.bJOoZFmoXT/ocY7N2yZVn4TyULSPOwAiie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-18 07:30:57', '2025-06-18 07:30:57'),
(53, 'bsbsbsbs40', 'kjij3wI1Qsp0FQxBQZI5w0bLkAh9ujtb', 'bsbsbsbs@gmail.com', '+##(#-', 'ahahbw', '8464618484', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$T3xaYYiQjHgXksE3wXzaqOHhacfXCPbWmQjdlHXztu6itApeLfbbu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-18 07:36:40', '2025-06-18 07:36:40'),
(54, 'sbsbsbab41', 'NWQnzkfamCcNOLnn2DwJ44Wp5X89YPdI', 'sbsbsbab@hotmail.com', 'ahahba', 'snnaanna', '4664848994', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$TTT8N5IDS/VZ2yT6MjYYlumyCQKuc25nf2JfMvs9YpzAiZ1HebL0q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-18 07:52:09', '2025-06-18 07:52:09'),
(55, 'nsnsjaja42', 'V4qe7YJM7tV2qGXtx8qv1YdraHoOL7qz', 'nsnsjaja@gmail.com', 'hebssb', 'ensjjsns', '6494949494', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$LDwAcj6.qrdyjnTUi6.2w.ASw5oIWAASgihctvaQaUqsHRtbR1KL.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-18 08:00:12', '2025-06-18 08:00:12'),
(56, 'abbakajsba43', 'B4UVBD7gzK8eaIiOK62NRmeTqInIKw3Y', 'abbakajsba@gmail.com', 'abanan', 'Bbabab', '9794944949', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$j5NEcXh4SJmhHxPJZxMgK.RwTFBeKyVS.s/Vq3Kmr4a.ohJhTz03.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-18 09:46:28', '2025-06-18 09:46:28'),
(57, 'gjfhjvx44', 'OJeMcEizMWd3EKCgHreS5P3l080BM0zO', 'gjfhjvx@gmail.com', 'gvvbhbb', 'gghjj', '7898985877', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$MOxA.OR8dJF/k20IX1GuzeLPLHswHERTf0aLRo011orqqNbOMewl6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-18 12:44:39', '2025-06-18 12:44:39'),
(58, 'hifhfchcj45', 'JUvUsBh35ZH2avqcCYfiFzDDSSGGDkhI', 'hifhfchcj@gmail.com', 'dohcvv', 'dhccuuf', '7994488459', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$HX/xNH7p0f7aM.ePFyqkU.mOZ/7gVX3clKX7LYcqIRRPm80grZ9l2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-18 12:48:49', '2025-06-18 12:48:49'),
(59, 'fjcehjj46', 'w9i2x0xGqrkJqu2esozGMiSV7qpX6oB6', 'fjcehjj@gmail.com', 'dhcxc', 'cbszbhg', '7966489988', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$A43zBpQ6jJuVlCWPd79IVe/fmtEVnqjnOba8d9EXX8jMJ/t.fyP0S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-18 12:51:11', '2025-06-18 12:51:11'),
(60, 'mkashifali54147', 'DolmRHBGykTbYfvG1zwxDe0EZu87zSQW', 'mkashifali541@gmail.com', 'younis', 'donumber', '2133333333', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$WjVNDHaSVAlLhvaGcpmxAOIA/zi2hR.06PCyLDRFGUHrC2m/bqrh2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-18 14:18:17', '2025-06-18 14:18:17'),
(61, 'younis48', 'efPrzbFzVjMPcj2PaLSW4D375aciNm2F', 'younis@gmail.com', 'John', 'Doe', '+923367899000', 'male', '2000-12-31', NULL, 33.83848300, 35.88066900, 'Beirut', NULL, 'Labanon', 'coach', 5, '$2y$12$dcvCEy9LP.2/ymj3gKHiVua2Q5n8AdGU67ymxgwjqUX5EHlq7W0J6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-18 14:37:25', '2025-06-18 14:37:25'),
(62, 'younis249', '09Hnd7SeUHjopn3fFM827nZ77A72S8Ov', 'younis2@gmail.com', 'John', 'Doe', '+923367899000', 'male', '2000-12-31', NULL, 33.83848300, 35.88066900, 'Beirut', NULL, 'Labanon', 'coach', 6, '$2y$12$WL2V5Djy0Du6qLhVn4n3PePbSbZASmKYh0hEzplNa80h0nNnX2/MC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-18 14:41:28', '2025-06-18 14:41:28'),
(63, 'younis350', '31Sf6uis5qNKWkiS8rhIxrxnsc3MQMKG', 'younis3@gmail.com', 'John', 'Doe', '+923367899000', 'male', '2000-12-31', NULL, 33.83848300, 35.88066900, 'Beirut', NULL, 'Labanon', 'coach', 7, '$2y$12$mkYOW94C95DI3ZL8aJWlyuXqn3BuN8en8PyzCm5wQntgI8SYEG0Mq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-19 05:27:09', '2025-06-19 05:27:09'),
(64, 'Amjad132451', 'Cjvicha3OAwAYgGQPBynA827fB4ol3MU', 'Amjad1324@gmail.com', 'Ahmad', 'Jilani', '12345678911', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$OX58rNzZv1YKdt8Z0SDs4uEsnweS/8l93IQCld2a7G/jwD8skQ.gK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-19 05:31:33', '2025-06-19 05:31:33'),
(65, 'irfashah52', '0AxggqyB0JxH84gNdQxTN2WJ6hrlneBR', 'irfashah@gmail.com', 'Younis', 'Gopang', '12345678911', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$yUpaYeIrL6RulfPGhKqFN.VzUbxexsb0K7JgEwBNcAJfTmOrZ1toO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-19 05:45:49', '2025-06-19 05:45:49'),
(66, 'younis453', 'nl7tmPUdL8P5ceQPfnC6KkyUZZKA4YjF', 'younis4@gmail.com', 'John', 'Doe', '+923367899000', 'male', '2000-12-31', NULL, 33.83848300, 35.88066900, 'Beirut', NULL, 'Labanon', 'coach', 8, '$2y$12$B/xeHMw0suwBgrPp.tp3geTmB7QdD4RFTPMHNOf82g5D3/OnOv62K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-19 08:09:52', '2025-06-19 08:09:52'),
(67, 'Amjad123wer54', 'OgTOwjSI6CiWuUNQJkpoLcQo5wvqv9dI', 'Amjad123wer@gmail.com', 'Ahmad', 'Jilani', '12345678911', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$jvYLLwDB.RyTA4gZYu8Sq.IZ0F.QgTkeRoObrShYqTCUW0PwBOg4e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-19 08:10:55', '2025-06-19 08:10:55'),
(68, 'youniswe455', '0Y9i9S0y1p91znhzrW8n8S3PD2kI79k9', 'youniswe4@gmail.com', 'John', 'Doe', '+923367899000', 'male', '2000-12-31', NULL, 33.83848300, 35.88066900, 'Beirut', NULL, 'Labanon', 'coach', 9, '$2y$12$a7HjJeSK7juuBalyZ9ie8.Av6GFBtlrXuqggIxqDgBSSUkrbn8dvu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-19 10:31:06', '2025-06-19 10:31:06'),
(70, 'youniswedvs456', 'A2XFCFcaPcXFpY3vqsyWVDMpDIihY9CX', 'youniswedvs4@gmail.com', 'John', 'Doe', '+923367899000', 'male', '2000-12-31', NULL, 33.83848300, 35.88066900, 'Beirut', NULL, 'Labanon', 'coach', 11, '$2y$12$IBpNkAihB.WFWhgFwFhl4O8edOBThUPM4Yfe1n79tsHXIZVoE/KEi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-19 11:06:51', '2025-06-19 11:06:51'),
(71, 'youniswedvffjhfs457', 'jDHTxNqYIeMRM3wxIKS8iGkeR6KdWDzw', 'youniswedvffjhfs4@gmail.com', 'John', 'Doe', '+923367899000', 'male', '2000-12-31', NULL, 33.83848300, 35.88066900, 'Beirut', NULL, 'Labanon', 'coach', 12, '$2y$12$T2tCZs7.G1tg9Vr02A1geOHCGtaj.RzAgtZUjItRBeshIxlhb4ini', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-19 11:58:04', '2025-06-19 11:58:05'),
(72, 'bebbwbabab58', 'v84CzhCt6PwGUb9rJfhhHwpEGqPSVuqV', 'bebbwbabab@gmail.com', 'NnBan', 'shshsb', '333 6674545', 'male', '2000-01-17', NULL, 33.83848300, 35.88066900, 'Rajanpur', NULL, 'Pakistani', 'coach', 13, '$2y$12$iGmBsHqjx31eLcQg1p2DR.4NkepvVjgxBKVSETHbAO6ZH4KV8V.DK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-19 12:02:03', '2025-06-19 12:02:03'),
(73, 'younisgopang757559', 'xxTqnClumBb4ycVngN99dz0ZbQrhRaDT', 'younisgopang7575@gmail.com', 'younis', 'gopang', '333 6677575', 'male', '2000-01-18', NULL, 33.83848300, 35.88066900, 'Rajanpur', NULL, 'Pakistan', 'coach', 14, '$2y$12$Fc1KP4hpBnv0NKpPx/LpXuBn2zesX.8rFbWzZctzV00yKWaYZ1YiW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-19 12:11:44', '2025-06-19 12:11:44'),
(74, 'younis245660', 'eSHaK22TACMqNwQayE7oa4iol9jiJlI9', 'younis2456@gmail.com', 'John', 'Doe', '+923367899000', 'male', '2000-12-31', NULL, 33.83848300, 35.88066900, 'Beirut', NULL, 'Labanon', 'coach', 15, '$2y$12$OGT0GgUzr6HB9BHo9ThtIeK5DibAh7w/.mbLfsuL3DUUt/3s4Ouhe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-19 12:24:28', '2025-06-19 12:24:28'),
(75, 'hshsbsbsa61', 'alwJx4d9wdzCUB5oXHxseD4SX0X1AU05', 'hshsbsbsa@gmail.com', 'nsnsns', 'snnsbs', '3336694545', 'male', '2000-01-18', NULL, 33.83848300, 35.88066900, 'Rawalpindi', NULL, 'Pakistan', 'coach', 16, '$2y$12$xdLdF5nsokHJcMxsPj63ueS.NvIXCOAWAcoqMISqXHRA/FKrfJAPK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-19 12:55:42', '2025-06-19 12:55:42'),
(76, 'younisvshs62', 'AHA6wxgvG0lqy2kGEVJnzT1YIsUuEppu', 'younisvshs@gmail.com', 'younis', 'younis', '3336994946', 'male', '2000-01-17', NULL, 33.83848300, 35.88066900, 'Rawalpindi', NULL, 'Pakistan', 'coach', 17, '$2y$12$3pL88Eh3jXUYnk5CvczLoOrimSabhiWHEUdT1NV9G2DQs/1cqVEqS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-19 13:41:11', '2025-06-19 13:41:11'),
(77, 'yasirglaxit63', 'qqtonQegvpRuDph5mpPzSoeZwvYq8OQc', 'yasirglaxit@gmail.com', 'yasir', 'gopang', '3336994949', 'male', '2000-01-17', NULL, 33.83848300, 35.88066900, 'Rawalpindi', NULL, 'Pakistan', 'coach', 18, '$2y$12$MsyhCu0drRMO4HYoTAbh6uvLML1dRKzdQd8l/9wNXWQhuy5vOhbjG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-19 13:50:53', '2025-06-19 13:50:53'),
(79, 'younis24569064', 'ObTN6JXbFPpw4lO7KA83TU6vDm13Wiq5', 'younis245690@gmail.com', 'John', 'Doe', '+923367899000', 'male', '2000-12-31', NULL, 33.83848300, 35.88066900, 'Beirut', NULL, 'Labanon', 'coach', 19, '$2y$12$ymptmmSHNWoCJVH00tzyPOHEi9hPiyVGgy6c/jwuG3xswV3Qu3cLm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-19 14:37:32', '2025-06-19 14:37:32'),
(80, 'younis245678065', 'WKJROlXMrPbAwtUaMwNjPFWaTFDTWRP6', 'younis2456780@gmail.com', 'John', 'Doe', '+923367899000', 'male', '2000-12-31', NULL, 33.83848300, 35.88066900, 'Beirut', NULL, 'Labanon', 'coach', 20, '$2y$12$tYASYoggTcjwvzuKf6FeP.XfXsAaYZdwoM65CA5le4eKDZg3LImUq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-19 14:38:47', '2025-06-19 14:38:47'),
(81, 'younis245343278066', '4umwojewb0ku84IHdO79VXKAH99YqGWG', 'younis2453432780@gmail.com', 'John', 'Doe', '+923367899000', 'male', '2000-12-31', NULL, 33.83848300, 35.88066900, 'Beirut', NULL, 'Labanon', 'coach', 21, '$2y$12$5vLwn3BkFNBlnpQFvaAFl.MiSmi2GCBzHEjo22DppSRWC3y5McL9O', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-19 14:42:56', '2025-06-19 14:42:56'),
(82, 'ksksbsb67', '3PxzxGSGLYqgPKJ0nUDDdn9O9pEBBxxg', 'ksksbsb@gmail.com', 'hshababa', 'bsbsbsb', '3336644545', 'male', '2000-01-26', NULL, 33.83848300, 35.88066900, 'Rawalpindi', NULL, 'Pakistan', 'coach', 22, '$2y$12$x31u6EY429LyPYKGEzP4du/uTBgZKyal5CyMHMWxseQwM49KGYxp.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-19 14:43:50', '2025-06-19 14:43:50'),
(83, 'dghsjajja68', 'fMDIfrX3ubdEgJSu0STZRxjaOxeMTOuM', 'dghsjajja@gmail.com', 'hehehe', 'jssjjasj', '3336649494', 'male', '2000-01-25', NULL, 33.83848300, 35.88066900, 'Rawalpindi', NULL, 'Pakistani', 'coach', 23, '$2y$12$UhLWaqk91jXpPZEvSCAtmOe4oMwG09Bt.iB322/o3ETsKPoGz8Tf2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-19 14:54:38', '2025-06-19 14:54:38'),
(84, 'bsbananan69', 'fKDC8FzPcIVN4XS4VHeUaGgvDe6NtTyk', 'bsbananan@gmail.com', 'bshsbsb', 'sbnsbsna', '3336949494', 'male', '2000-01-26', NULL, 33.83848300, 35.88066900, 'Rawalpindi', NULL, 'Pakistan', 'coach', 24, '$2y$12$TzsucU0XgmCrj.fo2uM/3uDFG8nU25W6dzSueIgmgwjYiKLjCSgEC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-19 15:02:25', '2025-06-19 15:02:25'),
(85, 'younisnazar70', 'UIQlOVbbQUVwS2Yc9RfewXsF6KxpQqWJ', 'younisnazar@gmail.com', 'Younis', 'Nazar', '3333362635', 'male', '2000-01-26', NULL, 33.83848300, 35.88066900, 'Islamabad', NULL, 'Pakistan', 'coach', 25, '$2y$12$Vdzto2sc5keBxlsLPPTrkOKFH24ejxPMQuW4bCPcOpNH8/bZ10HWy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-19 15:25:47', '2025-06-19 15:25:47'),
(86, 'testingcoach71', 'w2zyOlxSYJap1R4mVuGxUFNjKH6Mxtd6', 'testingcoach@gmail.com', 'John', 'Doe', '+923367899000', 'male', NULL, NULL, 33.83848300, 35.88066900, 'Beirut', NULL, 'Labanon', 'coach', 26, '$2y$12$pFgcEzqlblQbFMvPHgDB/ugVfvq/crV/katI4lwIUR5P0/FQ7e0wy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-20 09:04:30', '2025-06-20 09:04:30'),
(87, 'ksbsvsbs72', 'ZLGtaRLonKT9QZLx9X0okmXIvROim67J', 'ksbsvsbs@gmail.com', 'ababab', 'bsbsbsnslskw', '3336677575', 'male', '2000-01-25', NULL, 33.83848300, 35.88066900, 'Rawalpindi', NULL, 'Pakistan', 'coach', 27, '$2y$12$ZWajZlVSFpHxkqQ/2reQoOWGX8gqHJ.7IptxeVcvQbuPn/LYoSfIK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-20 09:06:15', '2025-06-20 09:06:15'),
(88, 'newcoachtesting73', 'sxmf4Z4ADAIl4XYcSM7hn9kDooNr199L', 'newcoachtesting@gmail.com', 'John', 'Doe', '+923367899000', 'male', NULL, NULL, 33.83848300, 35.88066900, 'Beirut', NULL, 'Labanon', 'coach', 28, '$2y$12$1dEEwInlIzVEAYziIcssoupC2rQ9q7yCMts9ycdbmp3XiysfteGg2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-20 09:11:44', '2025-06-20 09:11:44'),
(89, 'younis757574', 'cY8k1ZuSd1Zs0lA0mvK85VGwVGuzbtjb', 'younis7575@gmail.com', 'Younis', 'Gopang', '3336677575', 'male', '2000-01-25', NULL, 33.83848300, 35.88066900, 'Rajanpur', NULL, 'Pakistan', 'coach', 29, '$2y$12$yPhlhUNbw1INfqTjzH9Ln.Ry5ahEJ9KKrznzlgQsL1dEa6Erg0wku', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-20 09:59:12', '2025-06-20 09:59:12'),
(90, 'younisbin75', 'dznjC8D7OKtYLIev1GfSzEdcnKlDbse9', 'younisbin@gmail.com', 'Younis', 'Bin', '3336677979', 'male', '2000-01-24', NULL, 33.83848300, 35.88066900, 'Rawalpindi', NULL, 'Pakistan', 'coach', 30, '$2y$12$Py69w/NHjQ6y1CTwArhhgul6gFQ06.ujJRSaZ1auzSIPpAECN8YLq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-20 10:09:17', '2025-06-20 10:09:17'),
(91, 'gopang176', 'uC2sGPklP6iHbCtWmZdE6OqOVAidMnrv', 'gopang1@gmail.com', 'Gopang', 'Gopang', '3336679494', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$hCWaLkcy/GxrR.UmO/hb6OCkosIna1/3smDwh1SEvR3rAOgZqM5ue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-20 10:59:10', '2025-06-20 10:59:10'),
(92, 'johndoe77', 'pn260esFFdPfUyfICFdq9oLcxXuguvvm', 'johndoe@gmail.com', 'John', 'Doe', '+923367899000', 'male', '2000-12-31', NULL, 33.83848300, 35.88066900, 'Beirut', NULL, 'Labanon', 'coach', 31, '$2y$12$zZJE7rq6P1m/54yH4i4k6ulgYT01fDmKDq1lG9R8Z4miI4.qdzveu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-20 11:34:11', '2025-06-20 11:34:11'),
(93, 'Amjadhjk123wer78', 'hrRMkCo3FDQVIuM1Cy31Bxa4TTEJx04E', 'Amjadhjk123wer@gmail.com', 'Ahmad', 'Jilani', '12345678911', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$lNTEzx5Zifd4sQZu9Zj3b.gD26e29PaujInH2lEcv8LZW5Iu5Wg82', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-20 14:45:31', '2025-06-20 14:45:31'),
(94, 'jchxfikgvk79', 'bXnYL5wR5SFnOWXu9s4rtbRiyToQPcPd', 'jchxfikgvk@gmail.com', 'hxchfhcjcjjc', 'hchc', '3336695451', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$3frks1UbhNEYf7l31.b25eg42hJ8FdvMv3yXVLgaFhdgCa0e3TXzy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-20 14:50:09', '2025-06-20 14:50:09'),
(95, 'alibanat580', 'R37tDxi405hJwh23VaPcwPwOgOsAfMce', 'alibanat5@gmail.com', 'ali', 'banat', '3171704895', 'male', '2000-01-05', NULL, 33.83848300, 35.88066900, 'beirut', NULL, 'lebanon', 'coach', 32, '$2y$12$/ZrbtErjDx/UXG6lWfYx8.ebb6E1nFhowsfp6qeJwiChhpJyif7ry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-20 22:39:50', '2025-06-20 22:39:50'),
(96, 'nsnsnsnsnn81', 'cSnZAzw44rBsss9prJXjEvny0bFxf0nR', 'nsnsnsnsnn@gmail.com', 'bansnsnna', 'snsnnsn', '46464664', 'male', '2000-01-24', NULL, 33.83848300, 35.88066900, 'Islamabad', NULL, 'Pakistan', 'coach', 33, '$2y$12$g3qxNG.Vsg8QOTd6pUU.K.2XSRiBddnvn8DfcbET.WMS2INbdShsS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-21 09:47:34', '2025-06-21 09:47:34'),
(97, 'nsnsnnssnsnsnsnn82', '1wwQQCY2ImY95gMmK1aDfubFRg9JTvBj', 'nsnsnnssnsnsnsnn@gmail.com', 'bsnsn', 'ejndndn', '48846464', 'male', '2000-01-25', NULL, 33.83848300, 35.88066900, 'Islamabad', NULL, 'Pakistan', 'coach', 34, '$2y$12$3QUQDzrt6fGORPWMdhoyse6mtZdX6eomA/Dj4gS10JQ/DHoA95SOu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-21 13:18:50', '2025-06-21 13:18:50'),
(98, 'nsnsnsnsnsnsnn83', 'BdGv96jkpCXK661PkSoamUVmm4bg0toh', 'nsnsnsnsnsnsnn@gmail.com', 'bsbsbs', 'nsnsnsn', '64649494', 'male', '2000-01-24', NULL, 33.83848300, 35.88066900, 'Islamabad', NULL, 'Pakistan', 'coach', 35, '$2y$12$u6ugRBSkdliozaVRqek2OuTqbJTE01xeYWIEvz2tDPlQAYT91vEhK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-21 13:43:12', '2025-06-21 13:43:12'),
(99, 'ijfutyguig84', 'WkKLyKsSSjQIpw4vN2ztqlQxqJcHlrXn', 'ijfutyguig@ghvgfgc.com', 'ihjvujv', 'jb gouyuhjgi', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', NULL, '$2y$12$AfE9gMri4cZlEhbUAOywrOgZnI3mmzWSObhbYfcaQ4GprhxN8JbzG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-24 11:09:41', '2025-06-24 11:09:41'),
(101, 'waqarbh76285', 'DQSCZjKr0fTgfQpIB004E0kIeeLajEP7', 'waqarbh762@gmail.com', 'Muhammad', 'Waqar', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', NULL, '$2y$12$1VHtxlYfVRZw0AgfqMtwXeE96bhRi.s1k.6v1pT/aKA4MSsKT1QL6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-27 07:33:12', '2025-06-27 07:33:12'),
(111, 'johndoe12386', 'uvtRSdejc8VD0K0lW6bauUSozrFRdSxV', 'johndoe123@gmail.com', 'John', 'Doe', '+92445343244', 'male', NULL, NULL, 74.35870000, 31.52040000, 'Taxila', NULL, NULL, 'club', 5, '$2y$12$R7JDGGWPvau4cZtFBsSTj.0JfIFQaFosVE2Rj.cOpcWHVUCKozrNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-27 08:18:43', '2025-06-27 08:18:43'),
(112, 'johndoe1387', 'y0L88lEVJ0CAskmbhOqUEPvrVb33Au58', 'johndoe13@gmail.com', 'John', 'Doe', '+92445343244', 'male', NULL, NULL, 74.35870000, 31.52040000, 'Taxila', NULL, NULL, 'club', 6, '$2y$12$GEc4yyZVgsP8ta2mon5b.uNSMGa2sZf5ATQK27g4W/eKOQdmePx0q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-27 09:49:04', '2025-06-27 09:49:04'),
(113, 'waqarbh762388', 'vWJMkm4lVIWGYkNiln0CqhrROHA9zv2o', 'waqarbh7623@gmail.com', 'Muhammad', 'Waqar', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', NULL, '$2y$12$8PoTD4KL2K6Qem.5ogXh.eKHUwmxJmY3KmMhyJ.D.IrUhiErvPwja', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-27 10:59:07', '2025-06-27 10:59:07'),
(114, 'johndoe123489', '3ZZtvHTmvRbysBtYBKmOsP5CxXEoyRMk', 'johndoe1234@gmail.com', 'John', 'Doe', '+92445343244', 'male', NULL, NULL, 74.35870000, 31.52040000, 'Taxila', NULL, NULL, 'club', 7, '$2y$12$ox9AZAkwTVOGw.m.0iYzSuQbTcZWm/cQqieyk6oO4eA67EoCE3tR6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-27 11:19:51', '2025-06-27 11:19:51'),
(115, 'hamzakhan123490', 'ViQGkKFgZZovv3agSDouw76I4lJPHjlR', 'hamzakhan1234@gmail.com', 'Muhammad', 'Hamza', '312456781982', 'male', NULL, NULL, NULL, NULL, 'Taxila', NULL, 'Argentina', 'club', 8, '$2y$12$8rHatTHVCazUgQTf18OlLeJwjLyR80lcuKG2ENJlQ.maUkJU.5TZG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-27 14:43:17', '2025-06-27 14:43:17'),
(116, 'yasirstrte591', 'o1ndAS3k4aUvmDvTBLyCBoGary4Wzuez', 'yasirstrte5@gmail.com', 'Muhammad', 'Kashif', '121212121212', 'male', NULL, NULL, NULL, NULL, 'Taxila', NULL, 'Pakistan', 'club', 9, '$2y$12$gGkGnkpGlNAviG/btKc6qew7FuXCo5FmnJrbQtSdoYZjFxC1eMIi2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-27 15:15:47', '2025-06-27 15:15:47'),
(117, 'ehtisham1292', 'z8AjZyhLbqDW0cw6yrk9UtZZc2KZgVoJ', 'ehtisham12@gmail.com', 'Ehtisham', 'Yaqoob', '3124567819821', 'male', NULL, NULL, NULL, NULL, 'Taxila', NULL, 'Pakistan', 'club', 10, '$2y$12$IVugU35eLXK/7udGS4inkOeAu0lKRq8XxECT7Ys/9dOKhE0moug6a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-27 15:37:32', '2025-06-27 15:37:32'),
(118, 'admin93', 'SwJyHlJWdIDxG3lq62gnbhupVR07mdl4', 'admin@gmail.com', 'Test F', 'Test L', '031223443432', 'male', NULL, NULL, NULL, NULL, 'Taxila', NULL, 'Pakistan', 'club', 11, '$2y$12$LNE3iMrvE.dsQ1eSoKWjUewLjbls.SEVA18TexMcnqjJsjrsDoOya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-27 15:41:56', '2025-06-27 15:41:56'),
(119, 'ehtisham124594', 'ZOLVjcLRc8lYEZjFhNkWdTRCm26uOOxy', 'ehtisham1245@gmail.com', 'Ehtisham', 'Yaqoob', '3124567819821', 'male', NULL, NULL, NULL, NULL, 'Taxila', NULL, 'Pakistan', 'club', 12, '$2y$12$sgfcgMMH0GG9hjkKv9egoOe6wWnq6cvA2K28cApC2IDNCSz.QtUQW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-27 15:42:57', '2025-06-27 15:42:57'),
(120, 'yasir.glaxit95', 'ITiX4NVnL6BJviDXxgYcYlweZrNLmNqQ', 'yasir.glaxit@glaxit.com', 'Yasir', 'Nadeem', '031234567890', 'male', NULL, NULL, NULL, NULL, 'Porro aliqua Quidem', NULL, 'Pakistan', 'club', 13, '$2y$12$ZIAZSZPSUTkfDAAWjXXIpezgvqeTPzaPGyZq8KNKO/1FHCekb.aSC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-27 15:53:05', '2025-06-27 15:53:05'),
(121, 'me96', 'BWgKKvWdPjyTHwS1GYux8sqCWRLyqzKP', 'me@mydomain.com', 'my first name', 'my last name', '031455332083', 'male', NULL, NULL, NULL, NULL, 'city name', NULL, 'Austria', 'club', 14, '$2y$12$cNd3UjJy0whR7bdXGY9cKucfVHKoKVvzhENpK4G3c5VpA.hRftH3m', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-28 06:41:48', '2025-06-28 06:41:48'),
(122, 'mharisofficial1697', 'OP10E8UtRPfDj1xFZAMWofA5mKUgRK22', 'mharisofficial16@gmail.com', 'Muhammad', 'Haris', '030205424271', 'male', NULL, NULL, NULL, NULL, 'Taxila', NULL, 'Pakistan', 'club', 15, '$2y$12$413W6Qqo7XknNYdpeUGIWex2rJDob2dfufBk1VOwhPfDUVEFDu81q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-28 12:09:36', '2025-06-28 12:09:36'),
(123, 'aqib.glaxit98', 'WI6Ko7szXrH9hOssdUroU6kVHe2AkTsl', 'aqib.glaxit@glaxit.com', 'Carol', 'Sears', '031234567897', 'male', NULL, NULL, NULL, NULL, 'Recusandae Blanditi', NULL, 'Timor-Leste', 'club', 16, '$2y$12$LptoTbqT6gBzwRlL70CaRutQ.HD9ze.0DjPX9d75YJX.8oZuEYgXm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-28 12:17:24', '2025-06-28 12:17:24'),
(124, 'usmanaliawan79099', '1VN6qTDE1yVGcv0yqTTjOeDJDbq8415J', 'usman1234@gmail.com', 'Usman Ali', 'Awan', '031459873121', 'male', NULL, NULL, NULL, NULL, 'Hasan Abdal', NULL, 'Pakistan', 'club', 17, '$2y$12$VC9fkHk7Q4G30G7/Zs/B8OZpBaZ2s0WmmXnGW4mLkZT3j1/lhaShu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-30 04:47:15', '2025-06-30 04:47:15'),
(125, 'pakistanplay30100', 'SPFcyYjn4zDWD12eeTWQM2TiX0FWmZLx', 'pakistanplay30@gmail.com', 'John', 'Doe', '+92445343244', 'male', NULL, NULL, 74.35870000, 31.52040000, 'Taxila', NULL, NULL, 'club', 18, '$2y$12$GAKq53BPfcI15uAluPCcUOFG4RRnA5eajNE6sEpRac9dd83wHyMnK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-30 08:35:47', '2025-06-30 08:35:47'),
(126, 'usman123glaxit101', 'Ca9xBsvKVTSGJc0flqTsVHqi1BQ5Smr0', 'usman123glaxit@gmail.com', 'arsal', 'Zaheer', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', NULL, '$2y$12$R6gj8mfGhtoLNLsZrLk2A.sgmG16QzYxZjdKyfbleb2zqiIlYKPK.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-30 08:42:56', '2025-06-30 08:42:56'),
(127, 'usmaaxit102', 'QaSQlN7N2YB5mXYe882HrBqb72pbBlFg', 'usmaaxit@gmail.com', 'Muhammad', 'Waqar', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', NULL, '$2y$12$upFRa5QdGfXvzNZJl7fcAekQpLqRBO0EGYqIkf5TMNdzL1xM/Mg/i', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-30 08:51:17', '2025-06-30 08:51:17'),
(128, 'yasirnadeem5555103', 'OhP4zF5a4lMjJ6i06crF6bo3tNSPqvKe', 'ahmadali43a52@gmail.com', 'yasir', 'nadeem', '923129976841', 'male', NULL, NULL, NULL, NULL, 'Multan', NULL, 'Pakistan', 'club', 19, '$2y$12$ggYdvuVYpWDmuHzNoJICgeMpy7cEGR04DsXW.L4HUpQ.R8WvBJZlC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-30 12:00:46', '2025-06-30 13:41:11'),
(129, 'yasirnadeem5555102', 'PwO1lWGRBpEvrQofT9VKRSj1FUf6taeg', 'yasirnadeem5555@gmail.com', 'Usman Ali', 'Awan', '923129976841', 'male', NULL, NULL, NULL, NULL, 'Hasan Abdal', NULL, 'Pakistan', 'club', 20, '$2y$12$Iyc1MqhOTYwPCpVcAwtH5.TpHx.N120Xvz2k9hjhSh.c1RlveQBOC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-30 13:01:47', '2025-06-30 13:01:47'),
(130, 'chat.glaxit103', 'QRuz3B1CeA5wSyLuUVCqs8QStt9J4OyP', 'chat.glaxit@gmail.com', 'Test', 'User', '923123456789', 'male', NULL, NULL, NULL, NULL, 'Taxila', NULL, 'Pakistan', 'club', 21, '$2y$12$7OH3IdrQKqMzcTGdtZhOge76wc5HnZQb3Me6ReYstukVKnl.kSfJe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-30 14:36:46', '2025-06-30 14:45:30'),
(134, 'akram123104', 'Ra7MKT9cbanO2gCRn0cFIIFBBj5Thbp9', 'akram123@gmail.com', 'Ahmad', 'Hassan', '9234242424', 'male', NULL, NULL, NULL, NULL, 'MyCity', NULL, 'Australia', 'club', 22, '$2y$12$6lhDCLB8oMha6cHppuC7hO3loD3XAViIBw8i8yOlS7oEcwOztIQA2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-30 15:15:54', '2025-07-02 11:04:30'),
(136, 'akram128105', '499ESgK4u1FayfYyCHsMnoc5XvUFGZVB', 'akram128@gmail.com', 'John', 'Doe', '+92445343244', 'male', NULL, NULL, 74.35870000, 31.52040000, 'Taxila', NULL, NULL, 'club', 24, '$2y$12$ox9AZAkwTVOGw.m.0iYzSuQbTcZWm/cQqieyk6oO4eA67EoCE3tR6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-30 15:29:08', '2025-06-30 15:29:08'),
(138, 'nadeem123106', 'L2dKqlJ51uAFHBVb13MmXLm2bM21d6VD', 'nadeem123@gmail.com', 'John', 'Doe', '+92445343244', 'male', NULL, NULL, 74.35870000, 31.52040000, 'Taxila', NULL, NULL, 'club', 25, '$2y$12$ox9AZAkwTVOGw.m.0iYzSuQbTcZWm/cQqieyk6oO4eA67EoCE3tR6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-30 15:39:00', '2025-06-30 15:39:00'),
(146, 'ehtisham125109', '9jg5VloflxDp6v7geiIuFstraRHnaBRs', 'ehtisham125@gmail.com', 'Usman Ali', 'Waqar', '922345678956', 'male', NULL, NULL, NULL, NULL, 'Hasan Abdal', NULL, 'Australia', 'club', 28, '$2y$12$jN8Ed.br38fglTL.HL6r9uraf9aqys7YLNkHgtukI1oi5Nr1cCzcm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-06-30 16:02:08', '2025-06-30 16:02:08'),
(147, 'axb110', 'DrNiY0Fkn3EXigVg8LMEDKwqubGqX7Jp', 'axb@gmail.com', 'Arsal', 'Zaheer', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', NULL, '$2y$12$zOdtXnpNzfWOvTt5bfb7ZeE6CVPuGlyBpLEhXuuA/urruGhj5Dzs6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-01 04:37:17', '2025-07-01 04:37:17'),
(148, 'usman.glaxit111', 'MIvx2Ez8M6wzH6XGZNG3EkFBZhzgfb8X', 'myerw.glaxit@gmail.com', 'Usman Ali', 'Awan', '929876543123', 'male', NULL, NULL, NULL, NULL, 'Hasan Abdal', NULL, 'Pakistan', 'club', 29, '$2y$12$/C32Y1etM9OZXFLVbcDINu.nSzogc98VCNolZMqGbnuMN8KmQwOcO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-01 08:11:14', '2025-07-01 08:11:50'),
(149, 'usmanaliawan790112', 'yN9TCDxt1RZCOJkP3NHx7RkNI1IojmMC', 'usmanaliawan790@gmail.com', 'Muhammad', 'Ali', '929765345678', 'male', NULL, NULL, NULL, NULL, 'islamabad', NULL, 'Pakistan', 'club', 30, '$2y$12$DByL7WJmzK0UpFRFMqiE.uXLWEhvbiDULX.NLeHMwdNw7Kg7tedY2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-01 09:03:38', '2025-07-01 09:51:57'),
(150, 'usman141450113', 'Vt6VNvvLdyqYUTxsnmCtJaOVO9s4Qyr1', 'usmansdfsa@gmail.com', 'test', 'club', '925678987654', 'male', NULL, NULL, NULL, NULL, 'islamabad', NULL, 'Pakistan', 'club', 31, '$2y$12$O7/U15DmM4ZQJ4PyK7JcueX6s8ZpKcy9YtYP7kDbpi2spurSr9Shi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-01 10:15:51', '2025-07-01 10:26:46'),
(151, 'usman.glaxit114', 'PSmMbn9Dpwk9wJYqcP7G3sN9HhocwmbS', 'usman242.glaxit@gmail.com', 'John', 'Doe', '+92445343244', 'male', NULL, NULL, 74.35870000, 31.52040000, 'Taxila', NULL, NULL, 'club', 32, '$2y$12$607/A6ZBpp82JmIw4dHUzuv6aqcrQmQvmfDKufE1ZlozWJPCIdrDi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-02 12:33:47', 0, '2025-07-01 10:31:35', '2025-07-02 12:33:47'),
(152, 'usman141450115', '32brA9unbQrWDIW9Z8UtflU8M9yq9nIK', 'uasdf@gmail.com', 'qwertyu', 'wertyu', '922345678901', 'male', NULL, NULL, NULL, NULL, 'Taxila', NULL, 'Armenia', 'club', 33, '$2y$12$mo.755QBqT1Dmgw8/P0o.OMSCiugkofdKSgYECjVGKCxSbKE.cTb2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-01 10:43:27', '2025-07-01 10:43:27'),
(153, 'usman141450116', '1A9dMT6GXFiZmZ6y4Sdg23UvWyXhvbQA', 'dsfsa@gmail.com', 'wertyuio', 'sdfghjk', '929876543121', 'male', NULL, NULL, NULL, NULL, 'Hasan Abdal', NULL, 'Aruba', 'club', 34, '$2y$12$vMyTR.gsXgDO/SFMCoXaOensKkktQuQx/iQx98.BrB8LzWH00w9Ma', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-01 10:46:51', '2025-07-01 10:46:51'),
(154, 'usman141450117', '6TSaJ9UBRNrC4naCm2HlnicSPHmkVe8r', 'usman141458@gmail.com', 'Ehtisham', 'Gravi', '928765123434', 'male', NULL, NULL, NULL, NULL, 'Taxila', NULL, 'Australia', 'club', 35, '$2y$12$OlCwSiErJY0JaTh0RJ/vZ.aZj19zIbHc3IkceeqQcW3ZeJ20d14X.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-01 10:50:15', '2025-07-01 10:52:17'),
(155, 'usman.glaxit2118', 'ySoe5PBnB0quMoEckWEiBdG2YtoYsN6V', 'usman.glaxit2@gmail.com', 'John', 'Doe', '921234567890', 'male', NULL, NULL, NULL, NULL, 'Texas', NULL, 'Azerbaijan', 'club', 36, '$2y$12$fJak8C8LW4thO6Z.oVThU.sl.ZhBGbDjAL0oyMmUalU3HxY57sdPO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-01 14:29:19', '2025-07-02 03:50:29'),
(156, 'qofejaji119', 'oARvGlI7kuPjdrE4fhYdBQM6qpukJtKZ', 'qofejaji@mailinator.com', 'Oren', 'Rodriquez', '923145533208', 'male', NULL, NULL, NULL, NULL, 'Nulla libero reicien', NULL, 'Czech Republic', 'club', 37, '$2y$12$f2nAoVWiIiRFFyrt3heNWe5bCc8Nb8G4R/BQPEsHfTPYYCC.1nwK.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-02 10:19:57', '2025-07-02 10:20:19'),
(157, 'ehtishamyaqoob6120', 'bvwr3AL7vEV2twyo27d3XEwqxZ9mBnmy', 'ehtishamyaqoob6@gmail.com', 'Ehtisham', 'Yaqoob', '923145533208', 'male', NULL, NULL, NULL, NULL, 'Taxila', NULL, 'Pakistan', 'club', 38, '$2y$12$iL2r4cS.TcOgelvmm2W5/O7QVFn82.jNMKVD2vHBz6mRLcbK1K0Au', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-02 11:10:05', 0, '2025-07-02 11:09:05', '2025-07-02 11:11:57'),
(161, 'waqa7r121', 'wLKRHK8tRtiAGnENGtHt9hx9uVfCvONn', 'waqa7r@gmail.com', 'John', 'Doe', '+92445343244', 'male', NULL, NULL, 74.35870000, 31.52040000, 'Taxila', NULL, NULL, 'club', 8, '$2y$12$pX/ERYGIzdn42e1FyWyfXu9Z.NYsrkZKbSeAh/bS.fzGysY4NbCUG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-04 08:08:00', '2025-07-04 08:08:00'),
(163, 'usman.glaxit122', 'VekpgwUcLvb7XfNz9OoaKBDpJKPL3SKx', 'usman1242344.glaxit@gmail.com', 'John', 'Doe', '922345678987', 'male', NULL, NULL, NULL, NULL, 'Qwa-Qwa', NULL, 'null', 'club', 10, '$2y$12$fhpLcfeqLjr1YfOn.j1FQOhtKO5FRTJfIaoSf942sMxwwcvtb.rBm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-07 12:16:44', 0, '2025-07-04 11:24:12', '2025-07-07 12:16:44'),
(165, 'waqarr123', '4tJ0vGisWax85LQ8mC6jf52OVmQIMcoT', 'waqarr@gmail.com', 'John', 'Doe', '+92445343244', 'male', NULL, NULL, 74.35870000, 31.52040000, 'Taxila', NULL, NULL, 'club', 12, '$2y$12$E/bVxnGioJeu.ahO5n5xA.xmirYwcqY74deF6q0EBtlN7e1mmk5Z6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-04 11:49:50', '2025-07-04 11:49:50'),
(183, 'usman141450124', 'DNFOjf4KsLoP75zwwSUPmMC7UG5bWtYN', 'usman141450@gmail.com', 'John', 'Doe', '927654322345', 'male', NULL, NULL, NULL, NULL, 'West Palm Beach, FL', NULL, 'null', 'club', 16, '$2y$12$eY8AKU9qouv9Km5RPl9aJOcAGEFhjAWKm81hOrqTffl2WPEBK5F7e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-07 12:18:30', 0, '2025-07-04 15:00:22', '2025-07-07 12:18:30'),
(184, 'ahmad123125', 'UdigRYM0Odr9pO9pM433EPXJLyYYGqjM', 'ahmad123@gmail.com', 'Muhammad', 'Waqar', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', NULL, '$2y$12$8HTFebHVazjG4Mv5r8dzqu.zLdw5.vBj.PDYgmpIHHtd2y5k1juya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-06 06:38:18', '2025-07-06 06:38:18'),
(192, 'ahmadali43a5126', '82Bdqn9mc3KWwHFMdk1ZXhcPjvc58ld8', 'areebabashir333@gmail.com', 'arsal', 'bajwa', '+92335687233', 'male', NULL, NULL, NULL, NULL, 'kandahar', NULL, 'Aruba', 'club', 18, '$2y$12$OHwZmLx.TVG0RcSrnYYetuAcR/SPVWE/1BfMUHcUEo0IqzkPVMwTq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-06 07:02:32', '2025-07-09 06:50:24'),
(194, 'my123127', 'VEurOScBUVpXGOxJeitYhxnc9Vb1JYyY', 'my123@gmail.com', 'John', 'Doe', '+92445343244', 'male', NULL, NULL, 74.35870000, 31.52040000, 'Taxila', NULL, NULL, 'club', 41, '$2y$12$SfKL4J7BwHGLWH8.c7uLjOA1uV0YBE9y439WVWJvyQqx9Kx5EBEjm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 08:20:37', '2025-07-07 08:20:38'),
(197, 'usmanaliawan7128', 'hIDT4bh4XGVFHfeSN4EFcM4NwVlqWnAf', 'usmanaliawan7@gmail.com', 'John', 'Doe', '921234567890', 'male', NULL, NULL, NULL, NULL, 'Qwa-Qwa', NULL, 'null', 'club', 44, '$2y$12$rTmI33Bb3Zfi19mOGrh/WeFqhWtUQRi5UGN1vdrI5K9VGupVxdSwm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 10:30:20', '2025-07-07 10:30:20'),
(198, 'usman129', 'xEUCUES6Y5QioOlIZFro2g0r7UBXzD9f', 'usman@gmail.com', 'John', 'Doe', '922134567890', 'male', NULL, NULL, NULL, NULL, 'Qwa-Qwa', NULL, 'null', 'club', 45, '$2y$12$1wQjWFz88ydfgMuiR06YueSbk8cbbAYqU21wuxAxyBuKoNBMAbj6O', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 10:44:03', '2025-07-07 10:44:03'),
(199, 'usman.glat130', 'cLwbQf4Nd2hN8n1iSres5dwS6ubW0Igy', 'usman.glat@gmail.com', 'John', 'Gravi', '920987643234', 'male', NULL, NULL, NULL, NULL, 'Qwa-Qwa', NULL, 'null', 'club', 46, '$2y$12$pmz/n5tQM8mOacc/SGy3kODwCCzEr9UVOojAqnBux/E8czccBn4.6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 11:04:57', '2025-07-07 11:04:57'),
(200, 'steve.watsica131', 'V9OvjY8Ra9DXQlPrp7h3EIWeUdYmVHz3', 'steve.watsica@example.net', 'Myra', 'Runolfsdottir', '+1-231-583-2371', 'male', NULL, NULL, 74.35870000, 31.52040000, 'Taxila', NULL, 'Aruba', 'club', 47, '$2y$12$f5xanNp.kA9iuSmj0jmVDu3sxsFWOjCqIGo2p4zPJYg5UQ55xoGj.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 12:11:03', '2025-07-07 12:11:03'),
(202, 'kmacejkovic132', 'Rv2YKuXEw2RB7EtbHz6Vn9IIg4aeJyDY', 'kmacejkovic@example.net', 'Cullen', 'Will', '(281) 642-4040', 'male', NULL, NULL, 74.35870000, 31.52040000, 'Taxila', NULL, 'Aruba', 'club', 48, '$2y$12$IMmX7c31tAoZSRYmRTf2De.H4Va1QJtYKO8EStSbqpr6f3feEi9Ji', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 12:53:40', '2025-07-07 12:53:40'),
(213, 'madge.thiel133', 'HpVt1QfsBVjb96ldVg8amwjRxaLRm0gH', 'madge.thiel@example.org', 'Leola', 'Smith', '(785) 343-1672', 'male', NULL, NULL, NULL, NULL, 'Qwa-Qwa', NULL, 'Argentina', 'club', NULL, '$2y$12$Y/e1eYvXSn0iZBaV.u4roupYQy50s2e3mDGiOasLtOnBJwTa6.RZy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 13:48:54', '2025-07-07 13:48:54'),
(214, 'rleuschke134', '1JfkihfChyNem35q6IQ20hPfk3dHpZeM', 'rleuschke@example.org', 'Perry', 'Dibbert', '603-257-7222', 'male', NULL, NULL, NULL, NULL, 'Stockholm', NULL, 'Aruba', 'club', NULL, '$2y$12$0d4goodsUnRNw2oDq2QU.OJ/E7KceF8iw8pMyffiCeA/NKwCWch6S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 13:52:06', '2025-07-07 13:52:06'),
(215, 'jana94135', 'S1Hzp52J7B8DX1lQdIAlcJko79OU56Cf', 'jana94@example.org', 'Osvaldo', 'Keeling', '269.903.6817', 'male', NULL, NULL, NULL, NULL, 'Pariatur Tenetur no', NULL, 'Guadeloupe', 'club', NULL, '$2y$12$tTfAVJh.rj7uPWdledU43eAofh9lt8Vk9Ka74pEoItQNo9H57b/Ai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 13:55:41', '2025-07-07 13:55:41'),
(220, 'annette.pollich136', '9MIyfFjNo8xKGyCt8mIj1v5STbUMAb9z', 'annette.pollich@example.org', 'Buster', 'Mosciski', '1-223-942-9687', 'male', NULL, NULL, 74.35870000, 31.52040000, 'Taxila', NULL, 'Aruba', 'club', NULL, '$2y$12$300HFHux/x9ejBrsRMLtW.I.3bX3/ibXiPrpLN29/3FfJ5VkqNnp.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 14:04:14', '2025-07-07 14:04:14'),
(221, 'pansy.torphy137', '1DxDWspzmhXyS7ivk73USAuevNB8RbD3', 'pansy.torphy@example.net', 'Kevin', 'Lesch', '(931) 665-9525', 'male', NULL, NULL, 74.35870000, 31.52040000, 'Taxila', NULL, 'Aruba', 'club', NULL, '$2y$12$vT5EYT6q9BxbGiCzjvUwLe1RgBt44sMBaOOosFa7hGUfZkrNryG6G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 14:05:31', '2025-07-07 14:05:31'),
(222, 'haag.kelvin138', 'U2oNy9gLUdvwB4doUkLcEPw50K9HEQDI', 'haag.kelvin@example.net', 'Georgette', 'Hettinger', '+1-804-977-0681', 'male', NULL, NULL, 74.35870000, 31.52040000, 'Taxila', NULL, 'Aruba', 'club', NULL, '$2y$12$VtacVOL/H3W9085F3phaMOUDil/tAG0TMLIjwCjSNANAtM5sXIuVa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 14:06:19', '2025-07-07 14:06:19'),
(224, 'mathew.dibbert139', 'B2xrN4919YZUwn5RjwQJ8TSBaujR2Xkm', 'mathew.dibbert@example.org', 'Xavier', 'Casper', '951.920.1328', 'male', NULL, NULL, NULL, NULL, 'Laborum consequatur', NULL, 'Eritrea', 'club', NULL, '$2y$12$oKxwCmr3vzviMfYwbmKrzegwtghNixgobe4J/lZ2jaSXDLQjw.zWW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 14:13:32', '2025-07-07 14:13:32'),
(225, 'elias06140', 'x9sEMsPHXbV3FINmShcDY4ac3L7a7MFq', 'elias06@example.org', 'Freeda', 'Larson', '(657) 555-9077', 'male', NULL, NULL, NULL, NULL, 'Laborum consequatur', NULL, 'Eritrea', 'club', NULL, '$2y$12$PmnmN3r11psa7jo5N1wdQucOpbk8/9oKl6FWbSG4SG5uixRJ0FD5i', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 14:14:09', '2025-07-07 14:14:09'),
(226, 'ebecker141', 'BRpJwXTyhuFdGeyIJsdTdSOSwrdTOCGY', 'ebecker@example.com', 'Marcos', 'Lockman', '575-617-4990', 'male', NULL, NULL, NULL, NULL, 'Laborum consequatur', NULL, 'Eritrea', 'club', NULL, '$2y$12$WwSk6xlL5W.ENQ0ZR/5rUuAs3GS8T9zaVNlFPRjNq8roGvWMwqHI2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 14:17:39', '2025-07-07 14:17:39'),
(227, 'emacejkovic142', 'DocFmd6L9Tz34g3hUTQsMBfPDRoaQiok', 'emacejkovic@example.com', 'Adela', 'Russel', '732-817-5195', 'male', NULL, NULL, NULL, NULL, 'Laborum consequatur', NULL, 'Eritrea', 'club', NULL, '$2y$12$u385s05BZ4KXOxeVCQsD8OcsSBBwcznewmMiUexRstEmveBuV24qa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 14:17:54', '2025-07-07 14:17:54');
INSERT INTO `users` (`id`, `user_name`, `uuu_id`, `email`, `first_name`, `last_name`, `phone_number`, `gender`, `date_of_birth`, `image`, `latitude`, `longitude`, `city`, `state`, `country`, `user_type`, `user_type_id`, `password`, `old_password`, `code`, `ip`, `provider`, `provider_id`, `otp`, `otp_expires_at`, `otp_used_at`, `otp_attempts`, `created_at`, `updated_at`) VALUES
(228, 'beatty.keaton143', 'YhSu8aNYIQ6lFMepNCXDs1YM47mfh0OD', 'beatty.keaton@example.org', 'Virgil', 'Thompson', '+1-567-270-3864', 'male', NULL, NULL, NULL, NULL, 'Laborum consequatur', NULL, 'Eritrea', 'club', NULL, '$2y$12$lWcjdr2yJOp662XF/ExjbuqYT.OCGlqmZMIN0ivLvzY2wUmM.4XYW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 14:18:03', '2025-07-07 14:18:03'),
(229, 'hirthe.ettie144', 'yi3CEQStUjDKP32ffwOnYa5xlTAt0Egz', 'waqarbh1534@gmail.com', 'arsal', 'bajwa', '+92335687233', 'male', NULL, NULL, NULL, NULL, 'kandahar', NULL, 'Aruba', 'club', NULL, '$2y$12$p490HUkFz6Kn601EMwqV6OI7huHHFNqU8yKys7EnQ6/NdFOu7bUSO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 14:18:46', '2025-07-09 11:54:08'),
(230, 'uherman145', 'Gb9F99bANEsh9LFUVsOzHU7yhvLSV4VH', 'uherman@example.net', 'Rusty', 'Miller', '+1.463.756.8318', 'male', NULL, NULL, NULL, NULL, 'Laborum consequatur', NULL, 'Eritrea', 'club', NULL, '$2y$12$p0TORSobx7aMGghdLeS.i.88ZlV4/9o/BgHyltiK4SGv1mRPYQ1uq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 14:19:03', '2025-07-07 14:19:03'),
(231, 'kuphal.kylee146', 'XSm6wzUEyG6eCb4B1io3vK0JqO5tLAUO', 'kuphal.kylee@example.net', 'Maxime', 'Collier', '+1-646-300-5140', 'male', NULL, NULL, NULL, NULL, 'Laborum consequatur', NULL, 'Eritrea', 'club', NULL, '$2y$12$xh1zFqrf2ppo5TMBBoklluk/IBaQ3iOsJtDh4Kn3vmLVUJOLTMckq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 14:19:21', '2025-07-07 14:19:21'),
(232, 'emile.connelly147', '3OcMdeByzU1K8zfBvyiRlkkd6TNKvnKA', 'emile.connelly@example.com', 'Lavonne', 'Lueilwitz', '+1-248-904-8197', 'male', NULL, NULL, NULL, NULL, 'Laborum consequatur', NULL, 'Eritrea', 'club', NULL, '$2y$12$0JkrYv1E6B35XEIOYNTpa.voWMp17grVuXldoicSk/mic4NPzsRLe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 14:19:43', '2025-07-09 05:38:45'),
(233, 'dmraz148', 'eCfrjo2zleA7wTXAPfHbz0YUCaOkKAIo', 'dmraz@example.com', 'Lonny', 'Becker', '701-845-5613', 'male', NULL, NULL, NULL, NULL, 'Laborum consequatur', NULL, 'Eritrea', 'club', NULL, '$2y$12$c/JeJX3mOkD2oaCPs3KiRe9sUheFIL8txM2XVB08uE5Wqk8.y1aGe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 14:20:33', '2025-07-07 14:20:33'),
(234, 'effertz.lonie149', 'OUXVLHNsKLxk6SGEYwhxomFeAVMtgqTM', 'effertz.lonie@example.com', 'Elaina', 'Nienow', '1-248-699-8166', 'male', NULL, NULL, NULL, NULL, 'Cillum temporibus ev', NULL, 'Gabon', 'club', NULL, '$2y$12$CAbvwbhGO8O6xtR5LJs69uBKFdS0BbQ7DoFzWgjaCMKurjFv01som', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 14:22:16', '2025-07-07 14:22:16'),
(242, 'rau.nikko150', 'P7leX2NVIP7ITl2ufbuXRhFG3sZ2W65s', 'rau.nikko@example.com', 'Zander', 'Lang', '(956) 981-0139', 'male', NULL, NULL, 74.35870000, 31.52040000, 'Taxila', NULL, 'Aruba', 'club', 85, '$2y$12$JK.V2f4/MdjGgUHRm41h6uVqq5I6TIKh7TkkWArdNzGkmbQgd1CaG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 14:39:47', '2025-07-07 14:39:47'),
(243, 'jimmy18151', '0YXmgq1APxCCcJQ1oUJfZifzGcMmUKHX', 'jimmy18@example.com', 'Cloyd', 'Cole', '651.539.3301', 'male', NULL, NULL, NULL, NULL, 'Labore dolor cumque', NULL, 'Tonga', 'club', 86, '$2y$12$s3LfLX3VuPibUuoN6MhSCOj75H/DoQ2x0QkH3FZbwl14W5gLhaVyW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 14:41:23', '2025-07-07 14:41:24'),
(244, 'kub.coralie152', 'Y2OpKIwIR8FIrEsiNZX6SnI53F6tacrf', 'kub.coralie@example.net', 'Kenyatta', 'Veum', '1-848-835-7719', 'male', NULL, NULL, NULL, NULL, 'Dolores eaque quas a', NULL, 'Cape Verde', 'club', 87, '$2y$12$i0rkQWaIULEt/f0Wv6Xn1ekWeWuRALI4TJuzvcVljfucvlxB.w2Di', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 15:14:58', '2025-07-07 15:14:58'),
(245, 'terence.brekke153', 'pxIFtol5CozXM6U8VMnBMONX9Vcj6IVb', 'terence.brekke@example.org', 'Shania', 'Wiegand', '564.248.1327', 'male', NULL, NULL, 74.35870000, 31.52040000, 'Taxila', NULL, 'Aruba', 'club', 88, '$2y$12$hxsxKiLjFRHLTfBdaMBlsey/ekKwdXZvNAh6OGYPklXVuADds/ipq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-07 15:23:18', '2025-07-07 15:23:19'),
(246, 'usman.glaxit154', 'AZqGCdrY5CGKskZCXY8NAPNSbleUWmxk', 'usman124.glaxit@gmail.com', 'Garrett', 'Salinas', '13947686737', 'male', NULL, NULL, NULL, NULL, 'Exercitationem quas', NULL, 'Slovakia', 'club_employee', 89, '$2y$12$7JpG3AoTC4ewQAVn6PhZ8.LzYqtSUMirJgf4ZbzHbKMmHyXzeXHAC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-08 12:11:29', '2025-07-08 12:38:13'),
(247, 'svi.rpa.yasir155', 'AZjhnykNijBbFEzI9qZu3IOy3dUHF7gm', 'svi.rpa.yasir@gmail.com', 'Cathleen', 'Conley', '17519596144', 'male', NULL, NULL, NULL, NULL, 'Quaerat odio eos qui', NULL, 'Tanzania, United Republic of', 'club', 90, '$2y$12$QeDtucTMBMoxcc3biuLIs.FjfHxH8YMdCt5o5PoVBATelAw1y.trS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-08 12:39:11', '2025-07-08 12:39:39'),
(248, 'jensnsbsnns156', 'g1Vkto7E35CBfRc7CJCkNaQoXvlaL208', 'jensnsbsnns@gmail.com', 'sbbsbsbw', 'nenenwnw', '94949494', 'male', '2000-01-25', NULL, 33.83848300, 35.88066900, 'Rawalpindi', NULL, 'Pakistan', 'coach', 36, '$2y$12$cf5iuH7pECuTWlnjlbqT/u/bPZto70qmDCm47mBcFPj.GAumw1JjO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-08 12:48:02', '2025-07-08 12:48:02'),
(249, 'nwbwbw157', 'MUoPcSkPrFymvYES6xpNA3Z9IuO4iiWp', 'nwbwbw@gmail.com', 'bsbaba', 'nenwbw', '49494994', 'male', '2000-01-31', NULL, 33.83848300, 35.88066900, 'Rawalpindi', NULL, 'Pakistan', 'coach', 37, '$2y$12$DXuegMJnrF7LbD9smD2CkehGZFl6naTXr.ncTOz/qkxvhc6l.GJU6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-08 12:50:50', '2025-07-08 12:50:50'),
(250, 'tahir.glaxit156', 'ZtwxGFL0JAPj5IS1zejVyTLY5vNqwIaI', 'tahir.glaxit@gmail.com', 'Tahir', 'Shah', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'club', 91, '$2y$12$UC7itSE9ZHIn1FkO4Kf2p.1YDNSHgNZyRMQESRgkLrm80gwLgKjRa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-10 04:51:49', '2025-07-10 04:51:52'),
(255, 'sbjsksvsvag157', 'MZ46cYZOnO9yRA0h5pzqaIyR8FQltxNt', 'sbjsksvsvag@gmail.com', 'vabababa', 'sbsbsbbsbs', '64849494', 'male', '2000-01-25', NULL, 33.83848300, 35.88066900, 'Rajanpur', NULL, 'Pakistan', 'coach', 38, '$2y$12$sjlREKsREGvmNtX9RIWoOeaIVb83vMaTYAqOV9/q76xkmm2UDRQUq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-10 08:30:33', '2025-07-10 08:30:33'),
(256, 'nwnsnsnsnjaja158', 'TeEAKtN0SdyUvAYluegMByNcTOBz2pWc', 'nwnsnsnsnjaja@gmail.com', 'bsbsbsnsns', 'nwjwnwnw', '49499494', 'male', '2000-01-24', NULL, 33.83848300, 35.88066900, 'Islamabad', NULL, 'Pakistan', 'coach', 39, '$2y$12$WFCmd/Q9SGZlm.CTvV6.Cuv5kcT2DyA55IyzBHeoubPLpnaEmuiLS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-10 09:24:37', '2025-07-10 09:24:37'),
(262, 'mnicolas159', 'sd8T9K9uMmHUqLEkvCZ3iPCfewXrwZK9', 'mnicolas@example.org', 'Scot', 'Nikolaus', '+1-419-388-5286', 'male', NULL, NULL, 74.35870000, 31.52040000, 'Taxila', NULL, 'Aruba', 'club', 100, '$2y$12$sGTvdH6obbNK/SSqm5yd4u20Y5ShTkxak66HMXg9ZFtKHMjtpoGYu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-10 12:32:45', '2025-07-10 12:32:45'),
(263, 'shkb2003160', 'zgChxQt1qoUzsfInPJRI3oMbhtgDWVTj', 'shkb2003@gmail.com', 'Signe', 'Faulkner', '14066216979', 'male', NULL, NULL, NULL, NULL, 'Voluptate iusto labo', NULL, 'Estonia', 'club', 101, '$2y$12$zgmUbuC4X7FIIBBdoP/hjuBzZ6RSuGfvUcg12vLHFLWGfZxpfjg3a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-15 06:53:00', 0, '2025-07-10 12:34:12', '2025-07-15 06:53:00'),
(264, 'saqibdevdev161', 'qDDN67GQXFUhYFGqDXJKjgcOQ4YFkGYa', 'saqibdevdev@gmail.com', 'Xandra', 'Oliver', '12516878072', 'male', NULL, NULL, NULL, NULL, 'Nihil nisi nulla sin', NULL, 'Mexico', 'club', 102, '$2y$12$UWYrXKIaNW4g3y2Ti6xUgOYJsEgtcHSEH/qt644VAsy755wvbwzRm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-10 12:39:10', '2025-07-10 12:39:20'),
(278, 'usman.glaxit162', 'EGfD2OfLAeEioRVTCWiJ5cxY98UBZfLi', 'usman.glaxit@gmail.com', 'Nora', 'Torres', '16891441829', 'male', NULL, NULL, NULL, NULL, 'Consectetur neque si', NULL, 'Norway', 'club', 116, '$2y$12$1y52rWPgx0UE3g4yeGH7y.cvwQngPfdWsQOQ5VEsYdYSUEmCFnu0a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-11 11:49:04', '2025-07-11 11:49:57'),
(279, 'nsjakavsv163', 'Jiy6SjiOYjstSTBS4peKgfpLJlfJ5bRh', 'nsjakavsv@gmail.com', 'bsbsnsn', 'nsnsnsn', '4994948494', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$0SK.kNC67QqKD8tbq19x8.nVawacVX2.8rJdsMUHl2Vb.IVKoFEnG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-12 07:17:59', '2025-07-12 07:17:59'),
(280, 'nwnsnsnsnsn164', 'irmXyN0j8lL31E3RZ6RtZnUEck5coBOA', 'nwnsnsnsnsn@gmail.com', 'bsbsns', 'nsnsns', '4994949494', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'player', NULL, '$2y$12$9985Ehv8pyEHZm99aPYQSeF5b0PtdWtjrhmcOm542G2susdTXVBAq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-12 07:30:58', '2025-07-12 07:30:58'),
(281, 'coachyounis165', 'mTXqNyhNJPrzYONGw5hr8o0HDbN60OXM', 'coachyounis@gmail.com', 'hamza', 'hamza', '49949449', 'male', '2000-01-25', NULL, 33.83848300, 35.88066900, 'Rajanpur', NULL, 'Pakistan', 'coach', 40, '$2y$12$Co.8yrVIpLk2DFTPMhoYsOlGNqK4inN.DPX6y4QgGsOEwKHKu0lYe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-14 11:53:05', '2025-07-14 11:53:05'),
(282, 'usman.141450166', 'aSyB3Um1p1wGEtZGmtjLz93AmwNbe5fw', 'usman.141450@gmail.com', 'Karleigh', 'Dean', '13058072535', 'male', NULL, NULL, NULL, NULL, 'Reprehenderit', NULL, 'Iraq', 'club', 117, '$2y$12$ew4WPu6e3xqv6P0GzG5j8eAVg3lZJKnUg9H7y88V/sAsnz1N9klE2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-14 12:00:34', '2025-07-14 12:02:45'),
(283, 'zokan167', 'QaPX3foPiBaObXy5pbf4XQcxnPA8JgxI', 'zokan@mailinator.com', 'Julie', 'Love', '17716748938', 'male', NULL, NULL, NULL, NULL, 'Itaque quas ab digni', NULL, 'Trinidad and Tobago', 'club', 118, '$2y$12$qdiHeXckPsrHv9DgV.8hXuzX.1C.oQDGoRWreIsLBIQX1/wMERwEO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-14 13:21:27', '2025-07-14 13:21:27'),
(284, 'kajy168', 'qV2Uo8csxGJj3xAd0iL3mKwOQmTBCdX7', 'kajy@mailinator.com', 'Abel', 'Ryan', '12677779476', 'male', NULL, NULL, NULL, NULL, 'Occaecat non do veli', NULL, 'Denmark', 'club_employee', 119, '$2y$12$NWyVCzk2abFN3kGkjaBCku/Uq7H4mXU73746NAVALsOgVjwm90ph.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-14 13:35:28', '2025-07-14 13:35:28'),
(288, 'takih169', 'dODfIMsROvDK8A1AQQcQsH0vFyA3Xw1A', 'takih@mailinator.com', 'Buckminster', 'Summers', '11539726238', 'male', NULL, NULL, NULL, NULL, 'Ut placeat iusto ve', NULL, 'Virgin Islands, British', 'club_employee', 123, '$2y$12$9c4x.0A./PEuyfNdAukOl.2zlg.l.zt09Qw7vrdZFOD2FDd4JFLx2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-15 05:32:29', '2025-07-15 05:32:29'),
(291, 'wyrihe170', 'kuFVIpy6SCGkuOSaK461Sw3gEr1oxxX0', 'wyrihe@mailinator.com', 'Xerxes', 'Fulton', '19368837176', 'male', NULL, NULL, NULL, NULL, 'Ut est id ad ut ull', NULL, 'Macao', 'club', 126, '$2y$12$7QvkUzlG0rgR3uI38E4xQegeFqh8HxThe7jRttQjoq9/JrJisEfg.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-07-15 06:49:16', '2025-07-15 06:49:16');

-- --------------------------------------------------------

--
-- Table structure for table `user_availabilities`
--

CREATE TABLE `user_availabilities` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type` enum('primary','limited','seasonal','custom','holiday') NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_until` datetime DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `priority` tinyint(3) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_availabilities`
--

INSERT INTO `user_availabilities` (`id`, `user_id`, `type`, `title`, `valid_from`, `valid_until`, `is_default`, `is_active`, `priority`, `created_at`, `updated_at`) VALUES
(18, 70, 'limited', 'Summer Special', '2025-06-15 08:00:00', '2025-08-31 22:00:00', 1, 1, 2, '2025-06-20 12:43:32', '2025-06-20 12:43:32'),
(19, 34, 'primary', 'Default Schedule', '2025-06-20 00:00:00', '2026-06-20 00:00:00', 1, 1, 1, '2025-06-20 12:50:51', '2025-06-20 12:50:51'),
(20, 92, 'primary', 'Default Schedule', '2025-06-20 00:00:00', '2026-06-20 00:00:00', 1, 1, 1, '2025-06-20 13:04:49', '2025-06-20 13:04:49'),
(21, 36, 'primary', 'Default Schedule', '2025-06-20 00:00:00', '2026-06-20 00:00:00', 1, 1, 1, '2025-06-20 13:08:25', '2025-06-20 13:08:25'),
(22, 92, 'primary', 'Default Schedule', '2025-06-20 00:00:00', '2026-06-20 00:00:00', 1, 1, 1, '2025-06-20 13:32:08', '2025-06-20 13:32:08');

-- --------------------------------------------------------

--
-- Table structure for table `user_availability_day_duration_prices`
--

CREATE TABLE `user_availability_day_duration_prices` (
  `availability_day_duration_id` bigint(20) NOT NULL,
  `min_players` tinyint(3) NOT NULL,
  `max_players` tinyint(3) NOT NULL,
  `price` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_availability_day_duration_prices`
--

INSERT INTO `user_availability_day_duration_prices` (`availability_day_duration_id`, `min_players`, `max_players`, `price`) VALUES
(5, 1, 2, 40.00),
(5, 3, 4, 60.00),
(6, 1, 2, 55.00),
(7, 1, 4, 100.00),
(8, 1, 24, 24.00),
(9, 1, 24, 45.00),
(10, 1, 24, 53.00),
(11, 1, 24, 12.00),
(12, 1, 24, 34.00),
(13, 1, 24, 45.00),
(14, 1, 24, 23.00),
(15, 1, 24, 45.00),
(16, 12, 24, 100.00);

-- --------------------------------------------------------

--
-- Table structure for table `user_specialties`
--

CREATE TABLE `user_specialties` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `specialty_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_specialties`
--

INSERT INTO `user_specialties` (`id`, `user_id`, `specialty_id`) VALUES
(1, 34, 1),
(2, 34, 2),
(3, 36, 1),
(4, 36, 2),
(5, 46, 1),
(6, 46, 2),
(7, 47, 1),
(8, 47, 2),
(9, 61, 1),
(10, 61, 2),
(11, 62, 1),
(12, 62, 2),
(13, 63, 1),
(14, 63, 2),
(15, 66, 1),
(16, 66, 2),
(17, 68, 1),
(18, 68, 2),
(19, 70, 1),
(20, 70, 2),
(21, 71, 1),
(22, 71, 2),
(23, 71, 3),
(24, 72, 1),
(25, 72, 2),
(26, 72, 3),
(27, 73, 1),
(28, 73, 2),
(29, 74, 1),
(30, 75, 1),
(31, 75, 2),
(32, 76, 1),
(34, 76, 2),
(33, 76, 4),
(35, 77, 3),
(36, 77, 4),
(37, 79, 1),
(38, 80, 1),
(39, 81, 1),
(40, 82, 1),
(41, 82, 2),
(42, 83, 1),
(43, 83, 2),
(44, 83, 3),
(45, 83, 4),
(46, 84, 1),
(47, 84, 2),
(48, 85, 1),
(49, 85, 2),
(50, 86, 1),
(51, 87, 1),
(52, 87, 2),
(54, 87, 3),
(53, 87, 4),
(55, 88, 1),
(56, 89, 1),
(57, 89, 2),
(58, 90, 1),
(59, 90, 3),
(60, 92, 1),
(61, 95, 2),
(62, 95, 4),
(63, 96, 1),
(64, 96, 2),
(65, 97, 1),
(66, 97, 2),
(67, 98, 1),
(68, 98, 2),
(69, 248, 2),
(70, 249, 1),
(71, 255, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_sports`
--

CREATE TABLE `user_sports` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `sport_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_sports`
--

INSERT INTO `user_sports` (`id`, `user_id`, `sport_id`) VALUES
(1, 34, 1),
(2, 34, 2),
(3, 36, 1),
(4, 36, 2),
(5, 46, 1),
(6, 46, 2),
(7, 47, 1),
(8, 47, 2),
(9, 61, 1),
(10, 61, 2),
(11, 62, 1),
(12, 62, 2),
(13, 63, 1),
(14, 63, 2),
(15, 66, 1),
(16, 66, 2),
(17, 68, 1),
(18, 68, 2),
(19, 70, 1),
(20, 70, 2),
(21, 71, 1),
(22, 71, 3),
(23, 72, 1),
(24, 72, 3),
(26, 73, 1),
(25, 73, 2),
(27, 74, 1),
(29, 75, 1),
(28, 75, 2),
(31, 76, 1),
(30, 76, 2),
(33, 77, 1),
(32, 77, 2),
(34, 79, 1),
(35, 80, 1),
(36, 81, 1),
(37, 82, 2),
(38, 82, 4),
(40, 83, 1),
(39, 83, 2),
(41, 84, 2),
(42, 84, 4),
(43, 85, 2),
(44, 85, 4),
(45, 86, 1),
(46, 87, 2),
(47, 87, 4),
(48, 88, 1),
(51, 89, 2),
(49, 89, 3),
(50, 89, 4),
(52, 89, 5),
(53, 90, 1),
(54, 90, 2),
(55, 90, 3),
(56, 92, 1),
(57, 95, 2),
(58, 96, 2),
(59, 96, 4),
(60, 97, 2),
(61, 97, 5),
(62, 98, 2),
(63, 248, 1),
(64, 248, 2),
(65, 248, 4),
(66, 249, 2),
(67, 249, 4),
(69, 255, 1),
(68, 255, 2),
(70, 256, 2),
(71, 256, 4),
(73, 281, 1),
(72, 281, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_messages`
--
ALTER TABLE `activity_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_me_timesta_32a396_idx` (`timestamp`),
  ADD KEY `activity_me_activit_51c2a0_idx` (`activity_id`),
  ADD KEY `activity_me_sender__f43ccd_idx` (`sender_id`);

--
-- Indexes for table `age_groups`
--
ALTER TABLE `age_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `availability_days`
--
ALTER TABLE `availability_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `availability_days_user_availability_id_foreign` (`user_availability_id`);

--
-- Indexes for table `availability_day_courts`
--
ALTER TABLE `availability_day_courts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `availability_day_courts_availability_day_id_foreign` (`availability_day_id`),
  ADD KEY `availability_day_courts_court_id_foreign` (`court_id`);

--
-- Indexes for table `availability_day_durations`
--
ALTER TABLE `availability_day_durations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `availability_day_durations_availability_day_id_foreign` (`availability_day_id`);

--
-- Indexes for table `availability_day_intervals`
--
ALTER TABLE `availability_day_intervals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `availability_day_intervals_availability_day_id_foreign` (`availability_day_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `category_group`
--
ALTER TABLE `category_group`
  ADD PRIMARY KEY (`group_category_id`,`group_id`),
  ADD KEY `category_group_group_id_foreign` (`group_id`);

--
-- Indexes for table `chat_customtoken`
--
ALTER TABLE `chat_customtoken`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `chat_userfollower`
--
ALTER TABLE `chat_userfollower`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chat_userfollower_follower_id_following_id_84067083_uniq` (`follower_id`,`following_id`),
  ADD KEY `chat_userfollower_following_id_d979dde9_fk_users_id` (`following_id`);

--
-- Indexes for table `clubs`
--
ALTER TABLE `clubs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clubs_user_id_foreign` (`user_id`),
  ADD KEY `clubs_parent_club_id_foreign` (`parent_club_id`),
  ADD KEY `clubs_country_id_foreign` (`country_id`),
  ADD KEY `clubs_timezone_id_foreign` (`timezone_id`),
  ADD KEY `clubs_created_by_foreign` (`created_by`),
  ADD KEY `clubs_city_index` (`city`),
  ADD KEY `clubs_country_index` (`country`),
  ADD KEY `clubs_city_country_index` (`city`,`country`),
  ADD KEY `clubs_name_index` (`name`),
  ADD KEY `clubs_short_name_index` (`short_name`),
  ADD KEY `clubs_no_of_followers_index` (`no_of_followers`),
  ADD KEY `clubs_status_index` (`status`),
  ADD KEY `clubs_is_admin_index` (`is_admin`);

--
-- Indexes for table `clubs_additional_information`
--
ALTER TABLE `clubs_additional_information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clubs_additional_information_club_id_foreign` (`club_id`);

--
-- Indexes for table `club_banner_images`
--
ALTER TABLE `club_banner_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `club_banner_images_club_id_foreign` (`club_id`);

--
-- Indexes for table `club_branches`
--
ALTER TABLE `club_branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `club_branches_club_id_foreign` (`club_id`),
  ADD KEY `club_branches_name_index` (`name`);

--
-- Indexes for table `club_check_in_settings`
--
ALTER TABLE `club_check_in_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `club_check_in_settings_club_id_foreign` (`club_id`);

--
-- Indexes for table `club_court_configurations`
--
ALTER TABLE `club_court_configurations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `club_court_configurations_club_id_foreign` (`club_id`);

--
-- Indexes for table `club_currency`
--
ALTER TABLE `club_currency`
  ADD PRIMARY KEY (`club_id`,`currency_id`),
  ADD KEY `club_currency_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `club_latest_activities`
--
ALTER TABLE `club_latest_activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `club_latest_activities_club_id_foreign` (`club_id`),
  ADD KEY `club_latest_activities_performed_by_foreign` (`performed_by`);

--
-- Indexes for table `club_level_systems`
--
ALTER TABLE `club_level_systems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `club_level_systems_club_id_foreign` (`club_id`),
  ADD KEY `club_level_systems_sport_id_foreign` (`sport_id`),
  ADD KEY `club_level_systems_level_id_foreign` (`level_id`);

--
-- Indexes for table `club_opening_hours`
--
ALTER TABLE `club_opening_hours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `club_opening_hours_club_id_foreign` (`club_id`);

--
-- Indexes for table `club_sports`
--
ALTER TABLE `club_sports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `club_sports_club_id_foreign` (`club_id`),
  ADD KEY `club_sports_sport_id_foreign` (`sport_id`);

--
-- Indexes for table `club_sport_courts`
--
ALTER TABLE `club_sport_courts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `club_sport_courts_club_sport_id_foreign` (`club_sport_id`);

--
-- Indexes for table `coaches`
--
ALTER TABLE `coaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `1` (`user_id`),
  ADD KEY `coaches_club_id_foreign` (`club_id`),
  ADD KEY `coaches_created_by_foreign` (`created_by`),
  ADD KEY `coaches_status_index` (`status`);

--
-- Indexes for table `communities`
--
ALTER TABLE `communities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `communities_club_id_6124341b_fk_clubs_id` (`club_id`),
  ADD KEY `communities_created_by_ddc86fbd_fk_users_id` (`created_by`);

--
-- Indexes for table `community_favorites`
--
ALTER TABLE `community_favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `community_favorites_user_id_community_id_445259d5_uniq` (`user_id`,`community_id`),
  ADD KEY `community_favorites_community_id_73740014_fk_communities_id` (`community_id`);

--
-- Indexes for table `community_memberships`
--
ALTER TABLE `community_memberships`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `community_memberships_community_id_user_id_37203725_uniq` (`community_id`,`user_id`),
  ADD KEY `community_memberships_user_id_c17cf075_fk_users_id` (`user_id`);

--
-- Indexes for table `community_messages`
--
ALTER TABLE `community_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `community_m_timesta_1d5668_idx` (`timestamp`),
  ADD KEY `community_m_communi_40af48_idx` (`community_id`),
  ADD KEY `community_m_sender__4b73f7_idx` (`sender_id`);

--
-- Indexes for table `community_posts`
--
ALTER TABLE `community_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `community_p_communi_b83422_idx` (`community_id`),
  ADD KEY `community_p_author__16beaf_idx` (`author_id`),
  ADD KEY `community_p_created_40799e_idx` (`created_at`),
  ADD KEY `community_p_categor_22ca67_idx` (`category`),
  ADD KEY `community_p_is_priv_e0eebc_idx` (`is_private`);

--
-- Indexes for table `community_reports`
--
ALTER TABLE `community_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `community_r_communi_e1f004_idx` (`community_id`),
  ADD KEY `community_r_reporte_96c511_idx` (`reported_by_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `countries_code_unique` (`code`);

--
-- Indexes for table `courts`
--
ALTER TABLE `courts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courts_sport_id_foreign` (`sport_id`),
  ADD KEY `courts_club_id_foreign` (`club_id`),
  ADD KEY `courts_created_by_foreign` (`created_by`),
  ADD KEY `courts_status_index` (`status`),
  ADD KEY `courts_court_location_type_index` (`court_location_type`),
  ADD KEY `courts_court_type_index` (`court_type`),
  ADD KEY `courts_visibility_index` (`visibility`);

--
-- Indexes for table `court_bookings`
--
ALTER TABLE `court_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `court_bookings_created_by_foreign` (`created_by`),
  ADD KEY `court_bookings_follow_id_foreign` (`follow_id`),
  ADD KEY `court_bookings_post_in_group_id_foreign` (`post_in_group_id`),
  ADD KEY `court_bookings_level_off_id_foreign` (`level_off_id`),
  ADD KEY `court_bookings_level_to_id_foreign` (`level_to_id`),
  ADD KEY `court_bookings_booking_date_start_time_end_time_index` (`booking_date`,`start_time`,`end_time`),
  ADD KEY `court_bookings_booking_date_index` (`booking_date`),
  ADD KEY `court_bookings_start_time_index` (`start_time`),
  ADD KEY `court_bookings_end_time_index` (`end_time`),
  ADD KEY `court_bookings_booking_status_index` (`booking_status`);

--
-- Indexes for table `court_booking_banners`
--
ALTER TABLE `court_booking_banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `court_booking_banners_booking_id_foreign` (`booking_id`);

--
-- Indexes for table `court_booking_courts`
--
ALTER TABLE `court_booking_courts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `court_booking_courts_court_id_foreign` (`court_id`),
  ADD KEY `court_booking_courts_booking_id_court_id_index` (`booking_id`,`court_id`);

--
-- Indexes for table `court_booking_descriptions`
--
ALTER TABLE `court_booking_descriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `court_booking_descriptions_club_id_foreign` (`club_id`);

--
-- Indexes for table `court_booking_templates`
--
ALTER TABLE `court_booking_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `court_booking_templates_user_id_foreign` (`user_id`);

--
-- Indexes for table `court_slot_durations`
--
ALTER TABLE `court_slot_durations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `court_slot_durations_court_id_foreign` (`court_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currencies_code_unique` (`code`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groups_club_id_foreign` (`club_id`),
  ADD KEY `groups_age_group_id_foreign` (`age_group_id`),
  ADD KEY `groups_created_by_foreign` (`created_by`),
  ADD KEY `groups_sport_id_club_id_index` (`sport_id`,`club_id`);

--
-- Indexes for table `group_categories`
--
ALTER TABLE `group_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_categories_name_unique` (`name`),
  ADD UNIQUE KEY `group_categories_slug_unique` (`slug`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `levels_name_unique` (`name`),
  ADD UNIQUE KEY `levels_value_unique` (`value`);

--
-- Indexes for table `marketplace_items`
--
ALTER TABLE `marketplace_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketplace_messages`
--
ALTER TABLE `marketplace_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketplace_timesta_f58b47_idx` (`timestamp`),
  ADD KEY `marketplace_item_id_1058b9_idx` (`item_id`),
  ADD KEY `marketplace_sender__02e5bd_idx` (`sender_id`),
  ADD KEY `marketplace_receive_67a3b4_idx` (`receiver_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_timesta_ab821b_idx` (`timestamp`),
  ADD KEY `messages_sender__6ae55a_idx` (`sender_id`),
  ADD KEY `messages_receive_432d39_idx` (`receiver_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD KEY `players_user_id_foreign` (`user_id`),
  ADD KEY `players_age_group_id_foreign` (`age_group_id`),
  ADD KEY `players_club_id_foreign` (`club_id`),
  ADD KEY `players_status_index` (`status`);

--
-- Indexes for table `player_sport_levels`
--
ALTER TABLE `player_sport_levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_sport_levels_player_id_foreign` (`player_id`),
  ADD KEY `player_sport_levels_sport_id_foreign` (`sport_id`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_commen_post_id_50ec21_idx` (`post_id`),
  ADD KEY `post_commen_user_id_51989a_idx` (`user_id`),
  ADD KEY `post_commen_created_5d29e6_idx` (`created_at`);

--
-- Indexes for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_likes_post_id_user_id_4a23d35f_uniq` (`post_id`,`user_id`),
  ADD KEY `post_likes_post_id_c6421f_idx` (`post_id`),
  ADD KEY `post_likes_user_id_7d46ab_idx` (`user_id`);

--
-- Indexes for table `questionnaires`
--
ALTER TABLE `questionnaires`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questionnaires_sport_id_foreign` (`sport_id`);

--
-- Indexes for table `questionnaire_responses`
--
ALTER TABLE `questionnaire_responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questionnaire_responses_question_id_foreign` (`question_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `specialties`
--
ALTER TABLE `specialties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `specialties_name_unique` (`name`);

--
-- Indexes for table `sports`
--
ALTER TABLE `sports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sports_name_unique` (`name`);

--
-- Indexes for table `timezones`
--
ALTER TABLE `timezones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timezones_country_id_foreign` (`country_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_name_unique` (`user_name`),
  ADD UNIQUE KEY `users_uuu_id_unique` (`uuu_id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_user_name_index` (`user_name`),
  ADD KEY `users_uuu_id_index` (`uuu_id`),
  ADD KEY `users_email_index` (`email`),
  ADD KEY `users_user_type_index` (`user_type`),
  ADD KEY `users_user_type_id_index` (`user_type_id`),
  ADD KEY `users_city_index` (`city`),
  ADD KEY `users_country_index` (`country`),
  ADD KEY `users_city_country_index` (`city`,`country`);

--
-- Indexes for table `user_availabilities`
--
ALTER TABLE `user_availabilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_availabilities_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_availability_day_duration_prices`
--
ALTER TABLE `user_availability_day_duration_prices`
  ADD KEY `fk_day_duration` (`availability_day_duration_id`);

--
-- Indexes for table `user_specialties`
--
ALTER TABLE `user_specialties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_specialties_user_id_specialty_id_unique` (`user_id`,`specialty_id`),
  ADD KEY `user_specialties_specialty_id_foreign` (`specialty_id`);

--
-- Indexes for table `user_sports`
--
ALTER TABLE `user_sports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_sports_user_id_sport_id_unique` (`user_id`,`sport_id`),
  ADD KEY `user_sports_sport_id_foreign` (`sport_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_messages`
--
ALTER TABLE `activity_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `age_groups`
--
ALTER TABLE `age_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=581;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `availability_days`
--
ALTER TABLE `availability_days`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `availability_day_courts`
--
ALTER TABLE `availability_day_courts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `availability_day_durations`
--
ALTER TABLE `availability_day_durations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `availability_day_intervals`
--
ALTER TABLE `availability_day_intervals`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `chat_userfollower`
--
ALTER TABLE `chat_userfollower`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clubs`
--
ALTER TABLE `clubs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `clubs_additional_information`
--
ALTER TABLE `clubs_additional_information`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT for table `club_banner_images`
--
ALTER TABLE `club_banner_images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `club_branches`
--
ALTER TABLE `club_branches`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `club_check_in_settings`
--
ALTER TABLE `club_check_in_settings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `club_court_configurations`
--
ALTER TABLE `club_court_configurations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=777;

--
-- AUTO_INCREMENT for table `club_latest_activities`
--
ALTER TABLE `club_latest_activities`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `club_level_systems`
--
ALTER TABLE `club_level_systems`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `club_opening_hours`
--
ALTER TABLE `club_opening_hours`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1996;

--
-- AUTO_INCREMENT for table `club_sports`
--
ALTER TABLE `club_sports`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;

--
-- AUTO_INCREMENT for table `club_sport_courts`
--
ALTER TABLE `club_sport_courts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT for table `coaches`
--
ALTER TABLE `coaches`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `communities`
--
ALTER TABLE `communities`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `community_favorites`
--
ALTER TABLE `community_favorites`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `community_memberships`
--
ALTER TABLE `community_memberships`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `community_messages`
--
ALTER TABLE `community_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `community_posts`
--
ALTER TABLE `community_posts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `community_reports`
--
ALTER TABLE `community_reports`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT for table `courts`
--
ALTER TABLE `courts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `court_bookings`
--
ALTER TABLE `court_bookings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `court_booking_banners`
--
ALTER TABLE `court_booking_banners`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `court_booking_courts`
--
ALTER TABLE `court_booking_courts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `court_booking_descriptions`
--
ALTER TABLE `court_booking_descriptions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `court_booking_templates`
--
ALTER TABLE `court_booking_templates`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `court_slot_durations`
--
ALTER TABLE `court_slot_durations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `group_categories`
--
ALTER TABLE `group_categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `marketplace_items`
--
ALTER TABLE `marketplace_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `marketplace_messages`
--
ALTER TABLE `marketplace_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `player_sport_levels`
--
ALTER TABLE `player_sport_levels`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `post_likes`
--
ALTER TABLE `post_likes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `questionnaires`
--
ALTER TABLE `questionnaires`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `questionnaire_responses`
--
ALTER TABLE `questionnaire_responses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `specialties`
--
ALTER TABLE `specialties`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sports`
--
ALTER TABLE `sports`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `timezones`
--
ALTER TABLE `timezones`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=420;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=292;

--
-- AUTO_INCREMENT for table `user_availabilities`
--
ALTER TABLE `user_availabilities`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user_specialties`
--
ALTER TABLE `user_specialties`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `user_sports`
--
ALTER TABLE `user_sports`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_messages`
--
ALTER TABLE `activity_messages`
  ADD CONSTRAINT `activity_messages_activity_id_a64387d0_fk_court_bookings_id` FOREIGN KEY (`activity_id`) REFERENCES `court_bookings` (`id`),
  ADD CONSTRAINT `activity_messages_sender_id_b3dcfb93_fk_users_id` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `chat_customtoken`
--
ALTER TABLE `chat_customtoken`
  ADD CONSTRAINT `chat_customtoken_user_id_4ccecf1a_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `chat_userfollower`
--
ALTER TABLE `chat_userfollower`
  ADD CONSTRAINT `chat_userfollower_follower_id_a436690a_fk_users_id` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chat_userfollower_following_id_d979dde9_fk_users_id` FOREIGN KEY (`following_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `communities`
--
ALTER TABLE `communities`
  ADD CONSTRAINT `communities_club_id_6124341b_fk_clubs_id` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`id`),
  ADD CONSTRAINT `communities_created_by_ddc86fbd_fk_users_id` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `community_favorites`
--
ALTER TABLE `community_favorites`
  ADD CONSTRAINT `community_favorites_community_id_73740014_fk_communities_id` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`),
  ADD CONSTRAINT `community_favorites_user_id_3a462b2f_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `community_memberships`
--
ALTER TABLE `community_memberships`
  ADD CONSTRAINT `community_memberships_community_id_928874f3_fk_communities_id` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`),
  ADD CONSTRAINT `community_memberships_user_id_c17cf075_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `community_messages`
--
ALTER TABLE `community_messages`
  ADD CONSTRAINT `community_messages_community_id_72a735d7_fk_communities_id` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`),
  ADD CONSTRAINT `community_messages_sender_id_7232b184_fk_users_id` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `community_posts`
--
ALTER TABLE `community_posts`
  ADD CONSTRAINT `community_posts_author_id_75867448_fk_users_id` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `community_posts_community_id_4d2d4a9b_fk_communities_id` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`);

--
-- Constraints for table `community_reports`
--
ALTER TABLE `community_reports`
  ADD CONSTRAINT `community_reports_community_id_55153be5_fk_communities_id` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`),
  ADD CONSTRAINT `community_reports_reported_by_id_b1bdeace_fk_users_id` FOREIGN KEY (`reported_by_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `marketplace_messages`
--
ALTER TABLE `marketplace_messages`
  ADD CONSTRAINT `marketplace_messages_item_id_6571fd47_fk_marketplace_items_id` FOREIGN KEY (`item_id`) REFERENCES `marketplace_items` (`id`),
  ADD CONSTRAINT `marketplace_messages_receiver_id_956dcbcb_fk_users_id` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `marketplace_messages_sender_id_7a1b4a4a_fk_users_id` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_receiver_id_874b4e0a_fk_users_id` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `messages_sender_id_dc5a0bbd_fk_users_id` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_e17f8125_fk_community_posts_id` FOREIGN KEY (`post_id`) REFERENCES `community_posts` (`id`),
  ADD CONSTRAINT `post_comments_user_id_540f5634_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD CONSTRAINT `post_likes_post_id_b7e609e3_fk_community_posts_id` FOREIGN KEY (`post_id`) REFERENCES `community_posts` (`id`),
  ADD CONSTRAINT `post_likes_user_id_12e60720_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
