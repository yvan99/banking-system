-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2017 at 03:57 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `account_number` varchar(16) NOT NULL,
  `account_holder` int(8) NOT NULL,
  `account_creator` int(8) NOT NULL,
  `account_creation_time` int(10) NOT NULL,
  `balance` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`account_number`, `account_holder`, `account_creator`, `account_creation_time`, `balance`) VALUES
('150-4-15', 4, 5, 1438861600, 11000),
('189-5-15', 5, 5, 1438862523, 3000),
('308-6-15', 6, 5, 1438869664, 65000),
('-7-15', 7, 5, 1438887634, 7000),
('-8-15', 8, 5, 1438968495, 5500),
('-9-15', 9, 5, 1438968701, 1700),
('-10-15', 10, 5, 1439012906, 27000),
('-11-15', 11, 5, 1439147283, 22100),
('-12-15', 12, 5, 1439198388, 4669700),
('-13-15', 13, 5, 1439482439, 4000),
('-14-15', 14, 5, 1439482453, 1500),
('389-15-15', 15, 5, 1439555868, 3000),
('156-16-15', 16, 5, 1439556473, 6500),
('7-17-15', 17, 1, 1439557033, 5000),
('145-18-15', 18, 5, 1439744869, 1500),
('24-19-15', 19, 5, 1439750849, 20100),
('276-20-15', 20, 8, 1439752761, 20000),
('270-21-15', 21, 1, 1439757237, 2000),
('7-22-15', 22, 11, 1440267291, 1500),
('232-23-15', 23, 11, 1440330150, 5000),
('285-24-15', 24, 12, 1440434168, 14500),
('38-25-15', 25, 12, 1440434343, 78000),
('19-26-15', 26, 12, 1440434669, 6700),
('285-27-15', 27, 11, 1440444373, 10000),
('7-28-15', 28, 11, 1440522301, 49000),
('37-29-15', 29, 8, 1441916956, 1500),
('303-30-15', 30, 19, 1442046225, 9000),
('8-31-15', 31, 19, 1442046706, 20000),
('165-32-15', 32, 19, 1442050937, 25000),
('327-33-15', 33, 19, 1442051420, 67000),
('24-34-15', 34, 27, 1442238122, 2000),
('-35-15', 35, 27, 1442573181, 1500),
('-36-15', 36, 27, 1442575335, 25000),
('-37-15', 37, 27, 1442575611, 25000),
('-38-15', 38, 27, 1442575727, 25000),
('-39-15', 39, 27, 1442575906, 25000),
('-40-15', 40, 27, 1442575958, 25000),
('-41-15', 41, 27, 1442576126, 30000),
('270-42-15', 42, 27, 1442576462, 14000),
('138-43-15', 43, 27, 1442576605, 627383536),
('-44-15', 44, 27, 1442581761, 123457309),
('-45-15', 45, 27, 1442581937, 39270),
('276-46-15', 46, 27, 1442589251, 12500),
('294-47-15', 47, 27, 1442589905, 6381243),
('2-48-15', 48, 27, 1442590520, 31320),
('-49-15', 49, 27, 1442679433, 17000),
('-50-15', 50, 27, 1442680156, 5000),
('2-46-15', 46, 27, 1442829695, 12500),
('-47-17', 47, 27, 1503418585, 2000),
('2-48-17', 48, 27, 1503420014, 3000),
('76-49-17', 49, 27, 1503420658, 17000),
('303-50-17', 50, 37, 1503496320, 1500),
('8-51-17', 51, 27, 1503557794, 14500),
('120-52-17', 52, 27, 1503557922, 16000),
('-53-17', 53, 36, 1503559600, 1500);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `place` varchar(30) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `password` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `firstname`, `lastname`, `place`, `Email`, `password`) VALUES
(1, 'shamim', 'irene', 'kicukiro', 'shamim@gmail.com', 0),
(2, 'shamim', 'irene', 'kicukiro', 'irene@gmail.com', 789);

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE IF NOT EXISTS `branches` (
`branch_id` int(11) NOT NULL,
  `branch_name` text NOT NULL,
  `manager_email` varchar(50) NOT NULL,
  `manager_username` varchar(40) NOT NULL,
  `manager_password` varchar(40) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=417 ;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branch_id`, `branch_name`, `manager_email`, `manager_username`, `manager_password`) VALUES
(1, 'SACCO GITEGA', 'cyiza@yahoo.com', 'leodomil', 'cyiza123'),
(2, 'SACCO KANYINYA', 'bertin@gmail.com', 'ruhimbaza', 'bertin12345'),
(3, 'SACCO KIGALI', 'aline@yahoo.com', 'ahishakiye', 'aline1234567'),
(4, 'SACCO KIMISAGARA', 'theo@gmail.com', 'niyonzima', 'theogene123456789'),
(5, 'SACCO MAGEREGERE', 'thiery@gmail.com', 'arnoud', 'thiery12345678910'),
(6, 'SACCO MUHIMA', '', '', ''),
(7, 'SACCO NYAKABANDA', '', '', ''),
(8, 'SACCO NYAMIRAMBO', '', '', ''),
(9, 'SACCO NYARUGENGE', '', '', ''),
(10, 'SACCO RWEZAMENYO', '', '', ''),
(11, 'SACCO BUMBOGO', '', '', ''),
(12, 'SACCO GATSATA', '', '', ''),
(13, 'SACCO GIKOMERO', '', '', ''),
(14, 'SACCO GISOZI', '', '', ''),
(15, 'SACCO JABANA', '', '', ''),
(16, 'SACCO JALI', '', '', ''),
(17, 'SACCO KACYIRU', '', '', ''),
(18, 'SACCO KIMIHURURA', '', '', ''),
(19, 'SACCO KIMIRONKO', '', '', ''),
(20, 'SACCO KINYINYA', '', '', ''),
(21, 'SACCO NDERA', '', '', ''),
(22, 'SACCO NDUBA', '', '', ''),
(23, 'SACCO REMERA', '', '', ''),
(24, 'SACCO RUSORORO', '', '', ''),
(25, 'SACCO RUTUNGA', '', '', ''),
(26, 'SACCO GAHANGA', '', '', ''),
(27, 'SACCO GATENGA', '', '', ''),
(28, 'SACCO GIKONDO', '', '', ''),
(29, 'SACCO KAGARAMA', '', '', ''),
(30, 'SACCO KANOMBE', '', '', ''),
(31, 'SACCO KICUKIRO', '', '', ''),
(32, 'SACCO KIGARAMA', '', '', ''),
(33, 'SACCO MASAKA', '', '', ''),
(34, 'SACCO NIBOYE', '', '', ''),
(35, 'SACCO NYARUGUNGA', '', '', ''),
(36, 'SACCO BUSASAMANA', '', '', ''),
(37, 'SACCO BUSORO', '', '', ''),
(38, 'SACCO CYABAKAMYI', '', '', ''),
(39, 'SACCO KIBIRIZI', '', '', ''),
(40, 'SACCO KIGOMA', '', '', ''),
(41, 'SACCO MUKINGO', '', '', ''),
(42, 'SACCO MUYIRA', '', '', ''),
(43, 'SACCO NTYAZO', '', '', ''),
(44, 'SACCO NYAGISOZI', '', '', ''),
(45, 'SACCO RWABICUMA', '', '', ''),
(46, 'SACCO GIKONKO', '', '', ''),
(47, 'SACCO GISHUBI', '', '', ''),
(48, 'SACCO KANSI', '', '', ''),
(49, 'SACCO KIBILIZI', '', '', ''),
(50, 'SACCO KIGEMBE', '', '', ''),
(51, 'SACCO MAMBA', '', '', ''),
(52, 'SACCO MUGANZA', '', '', ''),
(53, 'SACCO MUGOMBWA', '', '', ''),
(54, 'SACCO MUKINDO', '', '', ''),
(55, 'SACCO MUSHA', '', '', ''),
(56, 'SACCO NDORA', '', '', ''),
(57, 'SACCO NYANZA', '', '', ''),
(58, 'SACCO SAVE', '', '', ''),
(59, 'SACCO BUSANZE', '', '', ''),
(60, 'SACCO CYAHINDA', '', '', ''),
(61, 'SACCO KIBEHO', '', '', ''),
(62, 'SACCO KIVU', '', '', ''),
(63, 'SACCO MATA', '', '', ''),
(64, 'SACCO MUGANZA', '', '', ''),
(65, 'SACCO MUNINI', '', '', ''),
(66, 'SACCO NGERA', '', '', ''),
(67, 'SACCO NGOMA', '', '', ''),
(68, 'SACCO NYABIMATA', '', '', ''),
(69, 'SACCO NYAGISOZI', '', '', ''),
(70, 'SACCO RUHERU', '', '', ''),
(71, 'SACCO RURAMBA', '', '', ''),
(72, 'SACCO RUSENGE', '', '', ''),
(73, 'SACCO GISHAMVU', '', '', ''),
(74, 'SACCO HUYE', '', '', ''),
(75, 'SACCO KARAMA', '', '', ''),
(76, 'SACCO KIGOMA', '', '', ''),
(77, 'SACCO KINAZI', '', '', ''),
(78, 'SACCO MARABA', '', '', ''),
(79, 'SACCO MBAZI', '', '', ''),
(80, 'SACCO MUKURA', '', '', ''),
(81, 'SACCO NGOMA', '', '', ''),
(82, 'SACCO RUHASHYA', '', '', ''),
(83, 'SACCO RUSATIRA', '', '', ''),
(84, 'SACCO RWANIRO', '', '', ''),
(85, 'SACCO SIMBI', '', '', ''),
(86, 'SACCO TUMBA', '', '', ''),
(87, 'SACCO BURUHUKIRO', '', '', ''),
(88, 'SACCO CYANIKA', '', '', ''),
(89, 'SACCO GASAKA', '', '', ''),
(90, 'SACCO GATARE', '', '', ''),
(91, 'SACCO KADUHA', '', '', ''),
(92, 'SACCO KAMEGELI', '', '', ''),
(93, 'SACCO KIBILIZI', '', '', ''),
(94, 'SACCO KIBUMBWE', '', '', ''),
(95, 'SACCO KITABI', '', '', ''),
(96, 'SACCO MBAZI', '', '', ''),
(97, 'SACCO MUGANO', '', '', ''),
(98, 'SACCO MUSANGE', '', '', ''),
(99, 'SACCO MUSEBEYA', '', '', ''),
(100, 'SACCO MUSHUBI', '', '', ''),
(101, 'SACCO NKOMANE', '', '', ''),
(102, 'SACCO TARE', '', '', ''),
(103, 'SACCO UWINKINGI', '', '', ''),
(104, 'SACCO BWERAMANA', '', '', ''),
(105, 'SACCO BYIMANA', '', '', ''),
(106, 'SACCO KABAGALI', '', '', ''),
(107, 'SACCO KINAZI', '', '', ''),
(108, 'SACCO KINIHIRA', '', '', ''),
(109, 'SACCO MBUYE', '', '', ''),
(110, 'SACCO MWENDO', '', '', ''),
(111, 'SACCO NTONGWE', '', '', ''),
(112, 'SACCO RUHANGO', '', '', ''),
(113, 'SACCO CYEZA', '', '', ''),
(114, 'SACCO KABACUZI', '', '', ''),
(115, 'SACCO KIBANGU', '', '', ''),
(116, 'SACCO KIYUMBA', '', '', ''),
(117, 'SACCO MUHANGA', '', '', ''),
(118, 'SACCO MUSHISHIRO', '', '', ''),
(119, 'SACCO NYABINONI', '', '', ''),
(120, 'SACCO NYAMABUYE', '', '', ''),
(121, 'SACCO NYARUSANGE', '', '', ''),
(122, 'SACCO RONGI', '', '', ''),
(123, 'SACCO RUGENDABALI', '', '', ''),
(124, 'SACCO SHYOGWE', '', '', ''),
(125, 'SACCO GACURABWENGE', '', '', ''),
(126, 'SACCO KARAMA', '', '', ''),
(127, 'SACCO KAYENZI', '', '', ''),
(128, 'SACCO KAYUMBU', '', '', ''),
(129, 'SACCO MUGINA', '', '', ''),
(130, 'SACCO MUSAMBIRA', '', '', ''),
(131, 'SACCO NGAMBA', '', '', ''),
(132, 'SACCO NYAMIYAGA', '', '', ''),
(133, 'SACCO NYARUBAKA', '', '', ''),
(134, 'SACCO RUGALIKA', '', '', ''),
(135, 'SACCO RUKOMA', '', '', ''),
(136, 'SACCO RUNDA', '', '', ''),
(137, 'SACCO BWISHYURA', '', '', ''),
(138, 'SACCO GASHALI', '', '', ''),
(139, 'SACCO GISHYITA', '', '', ''),
(140, 'SACCO GITESI', '', '', ''),
(141, 'SACCO MUBUGA', '', '', ''),
(142, 'SACCO MURAMBI', '', '', ''),
(143, 'SACCO MURUNDI', '', '', ''),
(144, 'SACCO MUTUNTU', '', '', ''),
(145, 'SACCO RUBENGERA', '', '', ''),
(146, 'SACCO RUGABANO', '', '', ''),
(147, 'SACCO RUGANDA', '', '', ''),
(148, 'SACCO RWANKUBA', '', '', ''),
(149, 'SACCO TWUMBA', '', '', ''),
(150, 'SACCO BONEZA', '', '', ''),
(151, 'SACCO GIHANGO', '', '', ''),
(152, 'SACCO KIGEYO', '', '', ''),
(153, 'SACCO KIVUMU', '', '', ''),
(154, 'SACCO MANIHIRA', '', '', ''),
(155, 'SACCO MUKURA', '', '', ''),
(156, 'SACCO MURUNDA', '', '', ''),
(157, 'SACCO MUSASA', '', '', ''),
(158, 'SACCO MUSHONYI', '', '', ''),
(159, 'SACCO MUSHUBATI', '', '', ''),
(160, 'SACCO NYABIRASI', '', '', ''),
(161, 'SACCO RUHANGO', '', '', ''),
(162, 'SACCO RUSEBEYA', '', '', ''),
(163, 'SACCO BUGESHI', '', '', ''),
(164, 'SACCO BUSASAMANA', '', '', ''),
(165, 'SACCO CYANZARWE', '', '', ''),
(166, 'SACCO GISENYI', '', '', ''),
(167, 'SACCO KANAMA', '', '', ''),
(168, 'SACCO KANZENZE', '', '', ''),
(169, 'SACCO MUDENDE', '', '', ''),
(170, 'SACCO NYAKILIBA', '', '', ''),
(171, 'SACCO NYAMYUMBA', '', '', ''),
(172, 'SACCO NYUNDO', '', '', ''),
(173, 'SACCO RUBAVU', '', '', ''),
(174, 'SACCO RUGERERO', '', '', ''),
(175, 'SACCO BIGOGWE', '', '', ''),
(176, 'SACCO JENDA', '', '', ''),
(177, 'SACCO JOMBA', '', '', ''),
(178, 'SACCO KABATWA', '', '', ''),
(179, 'SACCO KARAGO', '', '', ''),
(180, 'SACCO KINTOBO', '', '', ''),
(181, 'SACCO MUKAMIRA', '', '', ''),
(182, 'SACCO MULINGA', '', '', ''),
(183, 'SACCO RAMBURA', '', '', ''),
(184, 'SACCO RUGERA', '', '', ''),
(185, 'SACCO RUREMBO', '', '', ''),
(186, 'SACCO SHYIRA', '', '', ''),
(187, 'SACCO BWIRA', '', '', ''),
(188, 'SACCO GATUMBA', '', '', ''),
(189, 'SACCO HINDIRO', '', '', ''),
(190, 'SACCO KABAYA', '', '', ''),
(191, 'SACCO KAGEYO', '', '', ''),
(192, 'SACCO KAVUMU', '', '', ''),
(193, 'SACCO MATYAZO', '', '', ''),
(194, 'SACCO MUHANDA', '', '', ''),
(195, 'SACCO MUHORORO', '', '', ''),
(196, 'SACCO NDARO', '', '', ''),
(197, 'SACCO NGORORERO', '', '', ''),
(198, 'SACCO NYANGE', '', '', ''),
(199, 'SACCO SOVU', '', '', ''),
(200, 'SACCO BUGARAMA', '', '', ''),
(201, 'SACCO BUTARE', '', '', ''),
(202, 'SACCO BWEYEYE', '', '', ''),
(203, 'SACCO GASHONGA', '', '', ''),
(204, 'SACCO GIHEKE', '', '', ''),
(205, 'SACCO GIHUNDWE', '', '', ''),
(206, 'SACCO GIKUNDAMVURA', '', '', ''),
(207, 'SACCO GITAMBI', '', '', ''),
(208, 'SACCO KAMEMBE', '', '', ''),
(209, 'SACCO MUGANZA', '', '', ''),
(210, 'SACCO MURURU', '', '', ''),
(211, 'SACCO NKANKA', '', '', ''),
(212, 'SACCO NKOMBO', '', '', ''),
(213, 'SACCO NKUNGU', '', '', ''),
(214, 'SACCO NYAKABUYE', '', '', ''),
(215, 'SACCO NYAKARENZO', '', '', ''),
(216, 'SACCO NZAHAHA', '', '', ''),
(217, 'SACCO RWIMBOGO', '', '', ''),
(218, 'SACCO BUSHEKELI', '', '', ''),
(219, 'SACCO BUSHENGE', '', '', ''),
(220, 'SACCO CYATO', '', '', ''),
(221, 'SACCO GIHOMBO', '', '', ''),
(222, 'SACCO KAGANO', '', '', ''),
(223, 'SACCO KANJONGO', '', '', ''),
(224, 'SACCO KARAMBI', '', '', ''),
(225, 'SACCO KARENGERA', '', '', ''),
(226, 'SACCO KIRIMBI', '', '', ''),
(227, 'SACCO MACUBA', '', '', ''),
(228, 'SACCO MAHEMBE', '', '', ''),
(229, 'SACCO NYABITEKELI', '', '', ''),
(230, 'SACCO RANGIRO', '', '', ''),
(231, 'SACCO RUHARAMBUGA', '', '', ''),
(232, 'SACCO SHANGI', '', '', ''),
(233, 'SACCO BASE', '', '', ''),
(234, 'SACCO BUREGA', '', '', ''),
(235, 'SACCO BUSHOKI', '', '', ''),
(236, 'SACCO BUYOGA', '', '', ''),
(237, 'SACCO CYINZUZI', '', '', ''),
(238, 'SACCO CYUNGO', '', '', ''),
(239, 'SACCO KINIHIRA', '', '', ''),
(240, 'SACCO KISARO', '', '', ''),
(241, 'SACCO MASORO', '', '', ''),
(242, 'SACCO MBOGO', '', '', ''),
(243, 'SACCO MURAMBI', '', '', ''),
(244, 'SACCO NGOMA', '', '', ''),
(245, 'SACCO NTARABANA', '', '', ''),
(246, 'SACCO RUKOZO', '', '', ''),
(247, 'SACCO RUSIGA', '', '', ''),
(248, 'SACCO SHYORONGI', '', '', ''),
(249, 'SACCO TUMBA', '', '', ''),
(250, 'SACCO BUSENGO', '', '', ''),
(251, 'SACCO COKO', '', '', ''),
(252, 'SACCO CYABINGO', '', '', ''),
(253, 'SACCO GAKENKE', '', '', ''),
(254, 'SACCO GASHENYI', '', '', ''),
(255, 'SACCO JANJA', '', '', ''),
(256, 'SACCO KAMUBUGA', '', '', ''),
(257, 'SACCO KARAMBO', '', '', ''),
(258, 'SACCO KIVURUGA', '', '', ''),
(259, 'SACCO MATABA', '', '', ''),
(260, 'SACCO MINAZI', '', '', ''),
(261, 'SACCO MUGUNGA', '', '', ''),
(262, 'SACCO MUHONDO', '', '', ''),
(263, 'SACCO MUYONGWE', '', '', ''),
(264, 'SACCO MUZO', '', '', ''),
(265, 'SACCO NEMBA', '', '', ''),
(266, 'SACCO RULI', '', '', ''),
(267, 'SACCO RUSASA', '', '', ''),
(268, 'SACCO RUSHASHI', '', '', ''),
(269, 'SACCO GASHAKI', '', '', ''),
(270, 'SACCO BUSOGO', '', '', ''),
(271, 'SACCO CYUVE', '', '', ''),
(272, 'SACCO GACACA', '', '', ''),
(273, 'SACCO GATARAGA', '', '', ''),
(274, 'SACCO KIMONYI', '', '', ''),
(275, 'SACCO KINIGI', '', '', ''),
(276, 'SACCO MUHOZA', '', '', ''),
(277, 'SACCO MUKO', '', '', ''),
(278, 'SACCO MUSANZE', '', '', ''),
(279, 'SACCO NKOTSI', '', '', ''),
(280, 'SACCO NYANGE', '', '', ''),
(281, 'SACCO REMERA', '', '', ''),
(282, 'SACCO RWAZA', '', '', ''),
(283, 'SACCO SHINGIRO', '', '', ''),
(284, 'SACCO BUNGWE', '', '', ''),
(285, 'SACCO BUTARO', '', '', ''),
(286, 'SACCO CYANIKA', '', '', ''),
(287, 'SACCO CYERU', '', '', ''),
(288, 'SACCO GAHUNGA', '', '', ''),
(289, 'SACCO GATEBE', '', '', ''),
(290, 'SACCO GITOVU', '', '', ''),
(291, 'SACCO KAGOGO', '', '', ''),
(292, 'SACCO KINONI', '', '', ''),
(293, 'SACCO KINYABABA', '', '', ''),
(294, 'SACCO KIVUYE', '', '', ''),
(295, 'SACCO NEMBA', '', '', ''),
(296, 'SACCO RUGARAMA', '', '', ''),
(297, 'SACCO RUGENGABALI', '', '', ''),
(298, 'SACCO RUHUNDE', '', '', ''),
(299, 'SACCO RUSARABUYE', '', '', ''),
(300, 'SACCO RWERERE', '', '', ''),
(301, 'SACCO BUKURE', '', '', ''),
(302, 'SACCO BWISIGE', '', '', ''),
(303, 'SACCO BYUMBA', '', '', ''),
(304, 'SACCO CYUMBA', '', '', ''),
(305, 'SACCO GITI', '', '', ''),
(306, 'SACCO KAGEYO', '', '', ''),
(307, 'SACCO KANIGA', '', '', ''),
(308, 'SACCO MANYAGIRO', '', '', ''),
(309, 'SACCO MIYOVE', '', '', ''),
(310, 'SACCO MUKARANGE', '', '', ''),
(311, 'SACCO MUKO', '', '', ''),
(312, 'SACCO MUTETE', '', '', ''),
(313, 'SACCO NYAMIYAGA', '', '', ''),
(314, 'SACCO NYANKENKE', '', '', ''),
(315, 'SACCO RUBAYA', '', '', ''),
(316, 'SACCO RUKOMO', '', '', ''),
(317, 'SACCO RUSHAKI', '', '', ''),
(318, 'SACCO RUTARE', '', '', ''),
(319, 'SACCO RUVUNE', '', '', ''),
(320, 'SACCO RWAMIKO', '', '', ''),
(321, 'SACCO SHANGASHA', '', '', ''),
(322, 'SACCO FUMBWE', '', '', ''),
(323, 'SACCO GAHENGERI', '', '', ''),
(324, 'SACCO GISHARI', '', '', ''),
(325, 'SACCO KARENGE', '', '', ''),
(326, 'SACCO KIGABIRO', '', '', ''),
(327, 'SACCO MUHAZI', '', '', ''),
(328, 'SACCO MUNYAGA', '', '', ''),
(329, 'SACCO MUNYIGINYA', '', '', ''),
(330, 'SACCO MUSHA', '', '', ''),
(331, 'SACCO MUYUMBU', '', '', ''),
(332, 'SACCO MWULIRE', '', '', ''),
(333, 'SACCO NYAKARIRO', '', '', ''),
(334, 'SACCO NZIGE', '', '', ''),
(335, 'SACCO RUBONA', '', '', ''),
(336, 'SACCO GATUNDA', '', '', ''),
(337, 'SACCO KARAMA', '', '', ''),
(338, 'SACCO KARANGAZI', '', '', ''),
(339, 'SACCO KATABAGEMU', '', '', ''),
(340, 'SACCO KIYOMBE', '', '', ''),
(341, 'SACCO MATIMBA', '', '', ''),
(342, 'SACCO MIMULI', '', '', ''),
(343, 'SACCO MUKAMA', '', '', ''),
(344, 'SACCO MUSHELI', '', '', ''),
(345, 'SACCO NYAGATARE', '', '', ''),
(346, 'SACCO RUKOMO', '', '', ''),
(347, 'SACCO RWEMPASHA', '', '', ''),
(348, 'SACCO RWIMIYAGA', '', '', ''),
(349, 'SACCO TABAGWE', '', '', ''),
(350, 'SACCO GASANGE', '', '', ''),
(351, 'SACCO GATSIBO', '', '', ''),
(352, 'SACCO GITOKI', '', '', ''),
(353, 'SACCO KABARORE', '', '', ''),
(354, 'SACCO KAGEYO', '', '', ''),
(355, 'SACCO KIRAMURUZI', '', '', ''),
(356, 'SACCO KIZIGURO', '', '', ''),
(357, 'SACCO MUHURA', '', '', ''),
(358, 'SACCO MURAMBI', '', '', ''),
(359, 'SACCO NGARAMA', '', '', ''),
(360, 'SACCO NYAGIHANGA', '', '', ''),
(361, 'SACCO REMERA', '', '', ''),
(362, 'SACCO RUGARAMA', '', '', ''),
(363, 'SACCO RWIMBOGO', '', '', ''),
(364, 'SACCO GAHINI', '', '', ''),
(365, 'SACCO KABARE', '', '', ''),
(366, 'SACCO KABARONDO', '', '', ''),
(367, 'SACCO MUKARANGE', '', '', ''),
(368, 'SACCO MURAMA', '', '', ''),
(369, 'SACCO MURUNDI', '', '', ''),
(370, 'SACCO MWILI', '', '', ''),
(371, 'SACCO NDEGO', '', '', ''),
(372, 'SACCO NYAMIRAMA', '', '', ''),
(373, 'SACCO RUKARA', '', '', ''),
(374, 'SACCO RURAMIRA', '', '', ''),
(375, 'SACCO RWINKWAVU', '', '', ''),
(376, 'SACCO GAHARA', '', '', ''),
(377, 'SACCO GATORE', '', '', ''),
(378, 'SACCO KIGARAMA', '', '', ''),
(379, 'SACCO KIGINA', '', '', ''),
(380, 'SACCO KIREHE', '', '', ''),
(381, 'SACCO MAHAMA', '', '', ''),
(382, 'SACCO MPANGA', '', '', ''),
(383, 'SACCO MUSAZA', '', '', ''),
(384, 'SACCO MUSHIKILI', '', '', ''),
(385, 'SACCO NASHO', '', '', ''),
(386, 'SACCO NYAMUGALI', '', '', ''),
(387, 'SACCO NYARUBUYE', '', '', ''),
(388, 'SACCO GASHANDA', '', '', ''),
(389, 'SACCO JARAMA', '', '', ''),
(390, 'SACCO KAREMBO', '', '', ''),
(391, 'SACCO KAZO', '', '', ''),
(392, 'SACCO KIBUNGO', '', '', ''),
(393, 'SACCO MUGESERA', '', '', ''),
(394, 'SACCO MURAMA', '', '', ''),
(395, 'SACCO MUTENDELI', '', '', ''),
(396, 'SACCO REMERA', '', '', ''),
(397, 'SACCO RUKIRA', '', '', ''),
(398, 'SACCO RUKUMBELI', '', '', ''),
(399, 'SACCO RURENGE', '', '', ''),
(400, 'SACCO SAKE', '', '', ''),
(401, 'SACCO ZAZA', '', '', ''),
(402, 'SACCO GASHORA', '', '', ''),
(403, 'SACCO JURU', '', '', ''),
(404, 'SACCO KAMABUYE', '', '', ''),
(405, 'SACCO MAREBA', '', '', ''),
(406, 'SACCO MAYANGE', '', '', ''),
(407, 'SACCO MUSENYI', '', '', ''),
(408, 'SACCO MWOGO', '', '', ''),
(409, 'SACCO NGERUKA', '', '', ''),
(410, 'SACCO NTARAMA', '', '', ''),
(411, 'SACCO NYAMATA', '', '', ''),
(412, 'SACCO NYARUGENGE', '', '', ''),
(413, 'SACCO RILIMA', '', '', ''),
(414, 'SACCO RUHUHA', '', '', ''),
(415, 'SACCO RWERU', '', '', ''),
(416, 'SACCO SHYARA', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
`id` int(11) NOT NULL,
  `customer_first_name` varchar(40) NOT NULL,
  `customer_last_name` varchar(40) NOT NULL,
  `gender` varchar(30) NOT NULL,
  `birthdate` varchar(30) NOT NULL,
  `customer_email` varchar(40) NOT NULL,
  `customer_phone_number` varchar(13) NOT NULL,
  `customer_address` varchar(20) NOT NULL,
  `customer_id_card_number` varchar(16) NOT NULL,
  `photo` varchar(40) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=53 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_first_name`, `customer_last_name`, `gender`, `birthdate`, `customer_email`, `customer_phone_number`, `customer_address`, `customer_id_card_number`, `photo`) VALUES
(51, 'BERTILLE', 'Ishimwe', 'female', '1998-10-10', 'bertille@gmail.com', '0785969384', '8', '1199825986000000', 'ossia 20170802_093851.jpg'),
(52, 'JOJO', 'Uwase', 'female', '1998-11-23', 'jojo@gmail.com', '0789111243', '120', '1198258300008940', 'IMG-20170806-WA0016.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE IF NOT EXISTS `districts` (
`id_d` int(11) NOT NULL,
  `districtname` text NOT NULL,
  `IDpr` int(20) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id_d`, `districtname`, `IDpr`) VALUES
(1, 'rulindo', 1),
(2, 'burera', 1),
(3, 'musanze', 1),
(4, 'gicumbi', 1),
(5, 'gakenke', 1),
(6, 'kicukiro', 5),
(7, 'nyarugenge', 5),
(8, 'gasabo', 5),
(9, 'kamomyi', 2),
(10, 'muhanga', 2),
(11, 'nyanza', 2),
(12, 'ruhango', 2),
(13, 'huye', 2),
(14, 'gisagara', 2),
(15, 'nyamagabe', 2),
(16, 'nyaruguru', 2),
(17, 'NYAGATARE', 4),
(18, 'GATSIBO', 4),
(19, 'KAYONZA', 4),
(20, 'KIREHE', 4),
(21, 'NGOMA', 4),
(22, 'RWAMAGANA', 4),
(23, 'BUGESERA', 4),
(24, 'RUSIZI', 3),
(25, 'NYAMASHEKE', 3),
(26, 'KARONGI', 3),
(27, 'RUTSIRO', 3),
(28, 'NGORORERO', 3),
(29, 'RUBAVU', 3),
(30, 'NYABIHU', 3);

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE IF NOT EXISTS `loans` (
`loan_id` int(8) NOT NULL,
  `loan_amount` int(11) NOT NULL,
  `loan_account` varchar(16) NOT NULL,
  `load_operator` int(8) NOT NULL,
  `load_due_date` date NOT NULL,
  `loan_end_date` date NOT NULL,
  `loan_status` int(11) NOT NULL,
  `loan_reg_date` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `location_id` int(40) NOT NULL,
  `location_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `operations`
--

CREATE TABLE IF NOT EXISTS `operations` (
`operation_id` int(11) NOT NULL,
  `operation_type` enum('withdraw','deposit') NOT NULL,
  `operation_account` varchar(16) NOT NULL,
  `operation_amount` int(11) NOT NULL,
  `operation_operator` int(8) NOT NULL,
  `operation_status` int(2) NOT NULL,
  `operation_time` int(10) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=186 ;

--
-- Dumping data for table `operations`
--

INSERT INTO `operations` (`operation_id`, `operation_type`, `operation_account`, `operation_amount`, `operation_operator`, `operation_status`, `operation_time`) VALUES
(26, 'withdraw', '-7-15', 800, 7, 1, 1439014472),
(27, 'deposit', '-7-15', 5000, 7, 1, 1439014490),
(28, 'deposit', '-7-15', 5000, 7, 1, 1439014537),
(29, 'deposit', '150-4-15', 7000, 7, 1, 1439014686),
(30, 'deposit', '-7-15', 4000, 3, 1, 1439014907),
(31, 'withdraw', '-7-15', 5000, 3, 1, 1439014923),
(32, 'deposit', '189-5-15', 5000, 3, 1, 1439015293),
(33, 'withdraw', '308-6-15', 700, 3, 1, 1439015308),
(34, 'deposit', '-8-15', 7000, 5, 1, 1439139585),
(35, 'withdraw', '-8-15', 1000, 5, 1, 1439141720),
(36, 'deposit', '-11-15', 5000, 5, 1, 1439147339),
(37, 'deposit', '-11-15', 0, 5, 1, 1439147363),
(38, 'withdraw', '-11-15', 1500, 5, 1, 1439147385),
(39, 'deposit', '-11-15', 2000, 7, 1, 1439147607),
(40, 'withdraw', '-11-15', 2000, 5, 1, 1439191479),
(41, 'deposit', '-11-15', 6000, 5, 1, 1439191498),
(42, 'deposit', '308-6-15', 250, 1, 1, 1439564709),
(43, 'deposit', '-12-15', 250, 1, 1, 1439572372),
(44, 'withdraw', '-12-15', 250000, 1, 1, 1439572476),
(45, 'withdraw', '-12-15', 7550, 8, 1, 1439573481),
(46, 'deposit', '-12-15', 450, 8, 1, 1439573966),
(47, 'withdraw', '-12-15', 60150, 9, 1, 1439574054),
(48, 'deposit', '7-17-15', 1500, 9, 1, 1439574729),
(49, 'withdraw', '7-17-15', 500, 9, 1, 1439574814),
(50, 'withdraw', '-8-15', 200, 1, 1, 1439624453),
(51, 'deposit', '308-6-15', 500, 1, 1, 1439624751),
(52, 'deposit', '308-6-15', 500, 1, 1, 1439625035),
(53, 'deposit', '308-6-15', 500, 1, 1, 1439625040),
(54, 'deposit', '308-6-15', 0, 1, 1, 1439636156),
(55, 'deposit', '308-6-15', 200, 5, 1, 1439636205),
(56, 'deposit', '308-6-15', 300, 5, 1, 1439636302),
(57, 'withdraw', '308-6-15', 400, 5, 1, 1439636475),
(58, 'withdraw', '308-6-15', 500, 5, 1, 1439636574),
(59, 'deposit', '308-6-15', 400, 5, 1, 1439636618),
(60, 'withdraw', '308-6-15', 750, 1, 1, 1439636713),
(61, 'withdraw', '308-6-15', 400, 1, 1, 1439637022),
(62, 'withdraw', '308-6-15', 400, 5, 1, 1439637130),
(63, 'withdraw', '308-6-15', 200, 1, 1, 1439637197),
(64, 'withdraw', '308-6-15', 200, 1, 1, 1439637242),
(65, 'deposit', '-11-15', 200, 5, 1, 1439637309),
(66, 'withdraw', '-11-15', 100, 5, 1, 1439637329),
(67, 'withdraw', '-11-15', 1000, 5, 1, 1439637394),
(68, 'deposit', '308-6-15', 100, 5, 1, 1439637562),
(69, 'withdraw', '308-6-15', 2050, 1, 1, 1439637924),
(70, 'deposit', '-11-15', 5000, 5, 1, 1439666013),
(71, 'deposit', '-12-15', 5000, 5, 1, 1439666430),
(72, 'withdraw', '-12-15', 300, 5, 1, 1439671417),
(73, 'withdraw', '-12-15', 0, 5, 1, 1439672337),
(74, 'withdraw', '-12-15', 0, 5, 1, 1439672415),
(75, 'withdraw', '-12-15', 0, 5, 1, 1439672827),
(76, 'deposit', '-11-15', 5000, 5, 1, 1439740049),
(77, 'deposit', '308-6-15', 150, 5, 1, 1439741632),
(78, 'deposit', '308-6-15', 150, 5, 1, 1439741871),
(79, 'deposit', '308-6-15', 150, 5, 1, 1439741903),
(80, 'deposit', '-10-15', 0, 5, 1, 1439742021),
(81, 'withdraw', '308-6-15', 300, 5, 1, 1439744585),
(82, 'deposit', '24-19-15', 25000, 5, 1, 1439751084),
(83, 'withdraw', '24-19-15', 4000, 5, 1, 1439751135),
(84, 'withdraw', '24-19-15', 300, 5, 1, 1439751472),
(85, 'withdraw', '24-19-15', 200, 5, 1, 1439751606),
(86, 'withdraw', '24-19-15', 400, 5, 1, 1439751818),
(87, 'withdraw', '24-19-15', 200, 5, 1, 1439751968),
(88, 'deposit', '24-19-15', 4000, 8, 1, 1439752049),
(89, 'withdraw', '24-19-15', 300, 8, 1, 1439752086),
(90, 'deposit', '276-20-15', 5500, 8, 1, 1439753076),
(91, 'deposit', '276-20-15', 5000, 9, 1, 1439755311),
(92, 'withdraw', '308-6-15', 500, 8, 1, 1439755711),
(93, 'deposit', '276-20-15', 2000, 8, 1, 1439756024),
(94, 'withdraw', '-12-15', 7000, 9, 1, 1439756103),
(95, 'withdraw', '-12-15', 7000, 9, 1, 1439756125),
(96, 'deposit', '-11-15', 2000, 9, 1, 1439756381),
(97, 'deposit', '270-21-15', 500, 1, 1, 1439757351),
(98, 'withdraw', '-12-15', 7000, 1, 1, 1439757473),
(99, 'deposit', '-10-15', 500, 11, 1, 1440267471),
(100, 'deposit', '308-6-15', 1000, 11, 1, 1440315145),
(101, 'deposit', '308-6-15', 3000, 12, 1, 1440432991),
(102, 'withdraw', '308-6-15', 2000, 12, 1, 1440433026),
(103, 'deposit', '285-24-15', 2000, 11, 1, 1440437900),
(104, 'deposit', '285-27-15', 8000, 11, 1, 1440444427),
(105, 'withdraw', '285-27-15', 3000, 11, 1, 1440444480),
(106, 'withdraw', '308-6-15', 6000, 11, 1, 1440522688),
(107, 'deposit', '7-28-15', 6000, 11, 1, 1440522803),
(108, 'withdraw', '7-28-15', 6000, 11, 1, 1440523944),
(109, 'deposit', '308-6-15', 50000, 11, 1, 1440524880),
(110, 'withdraw', '38-25-15', 2000, 11, 1, 1440529194),
(111, 'deposit', '285-24-15', 4000, 11, 1, 1440529227),
(112, 'deposit', '285-24-15', 4000, 11, 1, 1440529300),
(113, 'deposit', '285-24-15', 3500, 11, 1, 1440529333),
(114, 'withdraw', '308-6-15', 4000, 8, 1, 1441810429),
(115, 'deposit', '7-28-15', 4000, 8, 1, 1441881071),
(116, 'deposit', '37-29-15', 15000, 8, 1, 1441917137),
(117, 'withdraw', '37-29-15', 5000, 8, 1, 1441917213),
(118, 'deposit', '37-29-15', 5000, 19, 1, 1441968847),
(119, 'withdraw', '37-29-15', 5000, 22, 1, 1441970131),
(120, 'withdraw', '24-34-15', 2000, 27, 1, 1442238153),
(121, 'withdraw', '-45-15', 5000, 27, 1, 1442588788),
(122, 'withdraw', '138-43-15', 44500, 27, 1, 1442588836),
(123, 'deposit', '-45-15', 3000, 27, 1, 1442588893),
(124, 'deposit', '138-43-15', 3000, 27, 1, 1442588940),
(125, 'deposit', '-44-15', 4000, 27, 1, 1442588967),
(126, 'deposit', '-45-15', 600, 27, 1, 1442589008),
(127, 'deposit', '-41-15', 3000, 27, 1, 1442589071),
(128, 'deposit', '-41-15', 2000, 27, 1, 1442589176),
(129, 'deposit', '276-46-15', 400, 27, 1, 1442589279),
(130, 'deposit', '276-46-15', 3600, 27, 1, 1442589384),
(131, 'deposit', '-45-15', 3000, 27, 1, 1442589682),
(132, 'deposit', '-44-15', 2000, 27, 1, 1442589777),
(133, 'withdraw', '-44-15', 5000, 27, 1, 1442589833),
(134, 'deposit', '294-47-15', 2000, 27, 1, 1442589925),
(135, 'deposit', '2-48-15', 3000, 32, 1, 1442591931),
(136, 'deposit', '2-48-15', 3000, 27, 1, 1442654658),
(137, 'deposit', '2-48-15', 3000, 27, 1, 1442658268),
(138, 'deposit', '2-48-15', 200, 27, 1, 1442658480),
(139, 'deposit', '2-48-15', 400, 27, 1, 1442658576),
(140, 'deposit', '2-48-15', 500, 27, 1, 1442658622),
(141, 'withdraw', '2-48-15', 4000, 27, 1, 1442659263),
(142, 'deposit', '2-48-15', 20, 27, 1, 1442659385),
(143, 'deposit', '2-48-15', 500, 27, 1, 1442659561),
(144, 'deposit', '2-48-15', 3000, 27, 1, 1442659778),
(145, 'withdraw', '276-46-15', 3000, 27, 1, 1442659972),
(146, 'withdraw', '276-46-15', 300, 27, 1, 1442660048),
(147, 'withdraw', '294-47-15', 700, 27, 1, 1442668768),
(148, 'withdraw', '2-48-15', 300, 27, 1, 1442668916),
(149, 'withdraw', '276-46-15', 100, 27, 1, 1442668987),
(150, 'deposit', '276-46-15', 3000, 27, 1, 1442669745),
(151, 'withdraw', '276-46-15', 100, 27, 1, 1442674527),
(152, 'withdraw', '276-46-15', 100, 27, 1, 1442674528),
(153, 'deposit', '294-47-15', 400, 27, 1, 1442674912),
(154, 'withdraw', '2-48-15', 3000, 27, 1, 1442678719),
(155, 'deposit', '-45-15', 500, 34, 1, 1442824109),
(156, 'deposit', '-45-15', 4000, 34, 1, 1442824165),
(157, 'withdraw', '138-43-15', 55555, 34, 1, 1442830173),
(158, 'withdraw', '138-43-15', 4000, 34, 1, 1442830753),
(159, 'withdraw', '138-43-15', 400, 34, 1, 1442830907),
(160, 'withdraw', '138-43-15', 3000, 34, 1, 1442831006),
(161, 'deposit', '-45-15', 600, 27, 1, 1442831662),
(162, 'deposit', '-45-15', 670, 27, 1, 1442831811),
(163, 'withdraw', '-44-15', 400, 27, 1, 1442831852),
(164, 'deposit', '276-46-15', 300, 27, 1, 1442836706),
(165, 'deposit', '-45-15', 300, 34, 1, 1442836817),
(166, 'deposit', '-45-15', 600, 34, 1, 1442836892),
(167, 'deposit', '276-46-15', 3000, 34, 1, 1442837351),
(168, 'withdraw', '276-46-15', 800, 27, 1, 1442837400),
(169, 'withdraw', '276-46-15', 100, 27, 1, 1442837447),
(170, 'withdraw', '138-43-15', 500, 27, 1, 1442837470),
(171, 'deposit', '-45-15', 6000, 27, 1, 1442837843),
(172, 'deposit', '276-46-15', 600, 34, 1, 1442837875),
(173, 'withdraw', '138-43-15', 600, 27, 1, 1442837948),
(174, 'withdraw', '138-43-15', 600, 34, 1, 1442837983),
(175, 'withdraw', '138-43-15', 500, 27, 1, 1442838119),
(176, 'deposit', '276-46-15', 5000, 27, 1, 1502233126),
(177, 'withdraw', '138-43-15', 400000, 27, 1, 1502233185),
(178, 'deposit', '-49-15', 12000, 37, 1, 1503494889),
(179, 'deposit', '-49-15', 12000, 37, 1, 1503495223),
(180, 'deposit', '120-52-17', 9000, 36, 1, 1503560259),
(181, 'deposit', '120-52-17', 9000, 36, 1, 1503560569),
(182, 'deposit', '120-52-17', 5000, 15, 1, 1503645213),
(183, 'deposit', '120-52-17', 10000, 15, 1, 1503645277),
(184, 'withdraw', '120-52-17', 500, 15, 1, 1503645458),
(185, 'withdraw', '8-51-17', 2000, 15, 1, 1503645503);

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE IF NOT EXISTS `provinces` (
`IDpr` int(11) NOT NULL,
  `province_name` varchar(20) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`IDpr`, `province_name`) VALUES
(1, 'Northern'),
(2, 'Southern'),
(3, 'Western'),
(4, 'Eastern'),
(5, 'Kigali city');

-- --------------------------------------------------------

--
-- Table structure for table `sector`
--

CREATE TABLE IF NOT EXISTS `sector` (
`id` int(11) NOT NULL,
  `sectors` text NOT NULL,
  `id_d` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=417 ;

--
-- Dumping data for table `sector`
--

INSERT INTO `sector` (`id`, `sectors`, `id_d`) VALUES
(1, 'GITEGA', 7),
(2, 'KANYINYA', 7),
(3, 'KIGALI', 7),
(4, 'KIMISAGARA', 7),
(5, 'MAGEREGERE', 7),
(6, 'MUHIMA', 7),
(7, 'NYAKABANDA', 7),
(8, 'NYAMIRAMBO', 7),
(9, 'NYARUGENGE', 7),
(10, 'RWEZAMENYO', 7),
(11, 'BUMBOGO', 8),
(12, 'GATSATA', 8),
(13, 'GIKOMERO', 8),
(14, 'GISOZI', 8),
(15, 'JABANA', 8),
(16, 'JALI', 8),
(17, 'KACYIRU', 8),
(18, 'KIMIHURURA', 8),
(19, 'KIMIRONKO', 8),
(20, 'KINYINYA', 8),
(21, 'NDERA', 8),
(22, 'NDUBA', 8),
(23, 'REMERA', 8),
(24, 'RUSORORO', 8),
(25, 'RUTUNGA', 8),
(26, 'GAHANGA', 6),
(27, 'GATENGA', 6),
(28, 'GIKONDO', 6),
(29, 'KAGARAMA', 6),
(30, 'KANOMBE', 6),
(31, 'KICUKIRO', 6),
(32, 'KIGARAMA', 6),
(33, 'MASAKA', 6),
(34, 'NIBOYE', 6),
(35, 'NYARUGUNGA', 6),
(36, 'BUSASAMANA', 11),
(37, 'BUSORO', 11),
(38, 'CYABAKAMYI', 11),
(39, 'KIBIRIZI', 11),
(40, 'KIGOMA', 11),
(41, 'MUKINGO', 11),
(42, 'MUYIRA', 11),
(43, 'NTYAZO', 11),
(44, 'NYAGISOZI', 11),
(45, 'RWABICUMA', 11),
(46, 'GIKONKO', 14),
(47, 'GISHUBI', 14),
(48, 'KANSI', 14),
(49, 'KIBILIZI', 14),
(50, 'KIGEMBE', 14),
(51, 'MAMBA', 14),
(52, 'MUGANZA', 14),
(53, 'MUGOMBWA', 14),
(54, 'MUKINDO', 14),
(55, 'MUSHA', 14),
(56, 'NDORA', 14),
(57, 'NYANZA', 14),
(58, 'SAVE', 14),
(59, 'BUSANZE', 16),
(60, 'CYAHINDA', 16),
(61, 'KIBEHO', 16),
(62, 'KIVU', 16),
(63, 'MATA', 16),
(64, 'MUGANZA', 16),
(65, 'MUNINI', 16),
(66, 'NGERA', 16),
(67, 'NGOMA', 16),
(68, 'NYABIMATA', 16),
(69, 'NYAGISOZI', 16),
(70, 'RUHERU', 16),
(71, 'RURAMBA', 16),
(72, 'RUSENGE', 16),
(73, 'GISHAMVU', 13),
(74, 'HUYE', 13),
(75, 'KARAMA', 13),
(76, 'KIGOMA', 13),
(77, 'KINAZI', 13),
(78, 'MARABA', 13),
(79, 'MBAZI', 13),
(80, 'MUKURA', 13),
(81, 'NGOMA', 13),
(82, 'RUHASHYA', 13),
(83, 'RUSATIRA', 13),
(84, 'RWANIRO', 13),
(85, 'SIMBI', 13),
(86, 'TUMBA', 13),
(87, 'BURUHUKIRO', 15),
(88, 'CYANIKA', 15),
(89, 'GASAKA', 15),
(90, 'GATARE', 15),
(91, 'KADUHA', 15),
(92, 'KAMEGELI', 15),
(93, 'KIBILIZI', 15),
(94, 'KIBUMBWE', 15),
(95, 'KITABI', 15),
(96, 'MBAZI', 15),
(97, 'MUGANO', 15),
(98, 'MUSANGE', 15),
(99, 'MUSEBEYA', 15),
(100, 'MUSHUBI', 15),
(101, 'NKOMANE', 15),
(102, 'TARE', 15),
(103, 'UWINKINGI', 15),
(104, 'BWERAMANA', 12),
(105, 'BYIMANA', 12),
(106, 'KABAGALI', 12),
(107, 'KINAZI', 12),
(108, 'KINIHIRA', 12),
(109, 'MBUYE', 12),
(110, 'MWENDO', 12),
(111, 'NTONGWE', 12),
(112, 'RUHANGO', 12),
(113, 'CYEZA', 10),
(114, 'KABACUZI', 10),
(115, 'KIBANGU', 10),
(116, 'KIYUMBA', 10),
(117, 'MUHANGA', 10),
(118, 'MUSHISHIRO', 10),
(119, 'NYABINONI', 10),
(120, 'NYAMABUYE', 10),
(121, 'NYARUSANGE', 10),
(122, 'RONGI', 10),
(123, 'RUGENDABALI', 10),
(124, 'SHYOGWE', 10),
(125, 'GACURABWENGE', 9),
(126, 'KARAMA', 9),
(127, 'KAYENZI', 9),
(128, 'KAYUMBU', 9),
(129, 'MUGINA', 9),
(130, 'MUSAMBIRA', 9),
(131, 'NGAMBA', 9),
(132, 'NYAMIYAGA', 9),
(133, 'NYARUBAKA', 9),
(134, 'RUGALIKA', 9),
(135, 'RUKOMA', 9),
(136, 'RUNDA', 9),
(137, 'BWISHYURA', 26),
(138, 'GASHALI', 26),
(139, 'GISHYITA', 26),
(140, 'GITESI', 26),
(141, 'MUBUGA', 26),
(142, 'MURAMBI', 26),
(143, 'MURUNDI', 26),
(144, 'MUTUNTU', 26),
(145, 'RUBENGERA', 26),
(146, 'RUGABANO', 26),
(147, 'RUGANDA', 26),
(148, 'RWANKUBA', 26),
(149, 'TWUMBA', 26),
(150, 'BONEZA', 27),
(151, 'GIHANGO', 27),
(152, 'KIGEYO', 27),
(153, 'KIVUMU', 27),
(154, 'MANIHIRA', 27),
(155, 'MUKURA', 27),
(156, 'MURUNDA', 27),
(157, 'MUSASA', 27),
(158, 'MUSHONYI', 27),
(159, 'MUSHUBATI', 27),
(160, 'NYABIRASI', 27),
(161, 'RUHANGO', 27),
(162, 'RUSEBEYA', 27),
(163, 'BUGESHI', 29),
(164, 'BUSASAMANA', 29),
(165, 'CYANZARWE', 29),
(166, 'GISENYI', 29),
(167, 'KANAMA', 29),
(168, 'KANZENZE', 29),
(169, 'MUDENDE', 29),
(170, 'NYAKILIBA', 29),
(171, 'NYAMYUMBA', 29),
(172, 'NYUNDO', 29),
(173, 'RUBAVU', 29),
(174, 'RUGERERO', 29),
(175, 'BIGOGWE', 30),
(176, 'JENDA', 30),
(177, 'JOMBA', 30),
(178, 'KABATWA', 30),
(179, 'KARAGO', 30),
(180, 'KINTOBO', 30),
(181, 'MUKAMIRA', 30),
(182, 'MULINGA', 30),
(183, 'RAMBURA', 30),
(184, 'RUGERA', 30),
(185, 'RUREMBO', 30),
(186, 'SHYIRA', 30),
(187, 'BWIRA', 28),
(188, 'GATUMBA', 28),
(189, 'HINDIRO', 28),
(190, 'KABAYA', 28),
(191, 'KAGEYO', 28),
(192, 'KAVUMU', 28),
(193, 'MATYAZO', 28),
(194, 'MUHANDA', 28),
(195, 'MUHORORO', 28),
(196, 'NDARO', 28),
(197, 'NGORORERO', 28),
(198, 'NYANGE', 28),
(199, 'SOVU', 28),
(200, 'BUGARAMA', 24),
(201, 'BUTARE', 24),
(202, 'BWEYEYE', 24),
(203, 'GASHONGA', 24),
(204, 'GIHEKE', 24),
(205, 'GIHUNDWE', 24),
(206, 'GIKUNDAMVURA', 24),
(207, 'GITAMBI', 24),
(208, 'KAMEMBE', 24),
(209, 'MUGANZA', 24),
(210, 'MURURU', 24),
(211, 'NKANKA', 24),
(212, 'NKOMBO', 24),
(213, 'NKUNGU', 24),
(214, 'NYAKABUYE', 24),
(215, 'NYAKARENZO', 24),
(216, 'NZAHAHA', 24),
(217, 'RWIMBOGO', 24),
(218, 'BUSHEKELI', 25),
(219, 'BUSHENGE', 25),
(220, 'CYATO', 25),
(221, 'GIHOMBO', 25),
(222, 'KAGANO', 25),
(223, 'KANJONGO', 25),
(224, 'KARAMBI', 25),
(225, 'KARENGERA', 25),
(226, 'KIRIMBI', 25),
(227, 'MACUBA', 25),
(228, 'MAHEMBE', 25),
(229, 'NYABITEKELI', 25),
(230, 'RANGIRO', 25),
(231, 'RUHARAMBUGA', 25),
(232, 'SHANGI', 25),
(233, 'BASE', 1),
(234, 'BUREGA', 1),
(235, 'BUSHOKI', 1),
(236, 'BUYOGA', 1),
(237, 'CYINZUZI', 1),
(238, 'CYUNGO', 1),
(239, 'KINIHIRA', 1),
(240, 'KISARO', 1),
(241, 'MASORO', 1),
(242, 'MBOGO', 1),
(243, 'MURAMBI', 1),
(244, 'NGOMA', 1),
(245, 'NTARABANA', 1),
(246, 'RUKOZO', 1),
(247, 'RUSIGA', 1),
(248, 'SHYORONGI', 1),
(249, 'TUMBA', 1),
(250, 'BUSENGO', 5),
(251, 'COKO', 5),
(252, 'CYABINGO', 5),
(253, 'GAKENKE', 5),
(254, 'GASHENYI', 5),
(255, 'JANJA', 5),
(256, 'KAMUBUGA', 5),
(257, 'KARAMBO', 5),
(258, 'KIVURUGA', 5),
(259, 'MATABA', 5),
(260, 'MINAZI', 5),
(261, 'MUGUNGA', 5),
(262, 'MUHONDO', 5),
(263, 'MUYONGWE', 5),
(264, 'MUZO', 5),
(265, 'NEMBA', 5),
(266, 'RULI', 5),
(267, 'RUSASA', 5),
(268, 'RUSHASHI', 5),
(269, 'GASHAKI', 3),
(270, 'BUSOGO', 3),
(271, 'CYUVE', 3),
(272, 'GACACA', 3),
(273, 'GATARAGA', 3),
(274, 'KIMONYI', 3),
(275, 'KINIGI', 3),
(276, 'MUHOZA', 3),
(277, 'MUKO', 3),
(278, 'MUSANZE', 3),
(279, 'NKOTSI', 3),
(280, 'NYANGE', 3),
(281, 'REMERA', 3),
(282, 'RWAZA', 3),
(283, 'SHINGIRO', 3),
(284, 'BUNGWE', 2),
(285, 'BUTARO', 2),
(286, 'CYANIKA', 2),
(287, 'CYERU', 2),
(288, 'GAHUNGA', 2),
(289, 'GATEBE', 2),
(290, 'GITOVU', 2),
(291, 'KAGOGO', 2),
(292, 'KINONI', 2),
(293, 'KINYABABA', 2),
(294, 'KIVUYE', 2),
(295, 'NEMBA', 2),
(296, 'RUGARAMA', 2),
(297, 'RUGENGABALI', 2),
(298, 'RUHUNDE', 2),
(299, 'RUSARABUYE', 2),
(300, 'RWERERE', 2),
(301, 'BUKURE', 4),
(302, 'BWISIGE', 4),
(303, 'BYUMBA', 4),
(304, 'CYUMBA', 4),
(305, 'GITI', 4),
(306, 'KAGEYO', 4),
(307, 'KANIGA', 4),
(308, 'MANYAGIRO', 4),
(309, 'MIYOVE', 4),
(310, 'MUKARANGE', 4),
(311, 'MUKO', 4),
(312, 'MUTETE', 4),
(313, 'NYAMIYAGA', 4),
(314, 'NYANKENKE', 4),
(315, 'RUBAYA', 4),
(316, 'RUKOMO', 4),
(317, 'RUSHAKI', 4),
(318, 'RUTARE', 4),
(319, 'RUVUNE', 4),
(320, 'RWAMIKO', 4),
(321, 'SHANGASHA', 4),
(322, 'FUMBWE', 22),
(323, 'GAHENGERI', 22),
(324, 'GISHARI', 22),
(325, 'KARENGE', 22),
(326, 'KIGABIRO', 22),
(327, 'MUHAZI', 22),
(328, 'MUNYAGA', 22),
(329, 'MUNYIGINYA', 22),
(330, 'MUSHA', 22),
(331, 'MUYUMBU', 22),
(332, 'MWULIRE', 22),
(333, 'NYAKARIRO', 22),
(334, 'NZIGE', 22),
(335, 'RUBONA', 22),
(336, 'GATUNDA', 17),
(337, 'KARAMA', 17),
(338, 'KARANGAZI', 17),
(339, 'KATABAGEMU', 17),
(340, 'KIYOMBE', 17),
(341, 'MATIMBA', 17),
(342, 'MIMULI', 17),
(343, 'MUKAMA', 17),
(344, 'MUSHELI', 17),
(345, 'NYAGATARE', 17),
(346, 'RUKOMO', 17),
(347, 'RWEMPASHA', 17),
(348, 'RWIMIYAGA', 17),
(349, 'TABAGWE', 17),
(350, 'GASANGE', 18),
(351, 'GATSIBO', 18),
(352, 'GITOKI', 18),
(353, 'KABARORE', 18),
(354, 'KAGEYO', 18),
(355, 'KIRAMURUZI', 18),
(356, 'KIZIGURO', 18),
(357, 'MUHURA', 18),
(358, 'MURAMBI', 18),
(359, 'NGARAMA', 18),
(360, 'NYAGIHANGA', 18),
(361, 'REMERA', 18),
(362, 'RUGARAMA', 18),
(363, 'RWIMBOGO', 18),
(364, 'GAHINI', 19),
(365, 'KABARE', 19),
(366, 'KABARONDO', 19),
(367, 'MUKARANGE', 19),
(368, 'MURAMA', 19),
(369, 'MURUNDI', 19),
(370, 'MWILI', 19),
(371, 'NDEGO', 19),
(372, 'NYAMIRAMA', 19),
(373, 'RUKARA', 19),
(374, 'RURAMIRA', 19),
(375, 'RWINKWAVU', 19),
(376, 'GAHARA', 20),
(377, 'GATORE', 20),
(378, 'KIGARAMA', 20),
(379, 'KIGINA', 20),
(380, 'KIREHE', 20),
(381, 'MAHAMA', 20),
(382, 'MPANGA', 20),
(383, 'MUSAZA', 20),
(384, 'MUSHIKILI', 20),
(385, 'NASHO', 20),
(386, 'NYAMUGALI', 20),
(387, 'NYARUBUYE', 20),
(388, 'GASHANDA', 21),
(389, 'JARAMA', 21),
(390, 'KAREMBO', 21),
(391, 'KAZO', 21),
(392, 'KIBUNGO', 21),
(393, 'MUGESERA', 21),
(394, 'MURAMA', 21),
(395, 'MUTENDELI', 21),
(396, 'REMERA', 21),
(397, 'RUKIRA', 21),
(398, 'RUKUMBELI', 21),
(399, 'RURENGE', 21),
(400, 'SAKE', 21),
(401, 'ZAZA', 21),
(402, 'GASHORA', 23),
(403, 'JURU', 23),
(404, 'KAMABUYE', 23),
(405, 'MAREBA', 23),
(406, 'MAYANGE', 23),
(407, 'MUSENYI', 23),
(408, 'MWOGO', 23),
(409, 'NGERUKA', 23),
(410, 'NTARAMA', 23),
(411, 'NYAMATA', 23),
(412, 'NYARUGENGE', 23),
(413, 'RILIMA', 23),
(414, 'RUHUHA', 23),
(415, 'RWERU', 23),
(416, 'SHYARA', 23);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
`transaction_id` int(8) NOT NULL,
  `transaction_from` int(8) NOT NULL,
  `transaction_to` int(8) NOT NULL,
  `transaction_amount` int(11) NOT NULL,
  `transaction_time` int(10) NOT NULL,
  `transaction_operator` int(8) NOT NULL,
  `transaction_status` int(2) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `transaction_from`, `transaction_to`, `transaction_amount`, `transaction_time`, `transaction_operator`, `transaction_status`) VALUES
(13, 7, 308, 5000, 1439757005, 1, 1),
(14, 308, 276, 5000, 1440315476, 11, 1),
(15, 285, 308, 2000, 1440438074, 11, 1),
(16, 308, 285, 3000, 1440444610, 11, 1),
(17, 7, 308, 4000, 1440522539, 11, 1),
(19, 7, 308, 5000, 1441810587, 8, 1),
(20, 37, 38, 10000, 1441917390, 8, 1),
(21, 24, 303, 1000, 1442238364, 27, 1),
(22, 276, 270, 5000, 1442589562, 27, 1),
(24, 120, 8, 2000, 1503560636, 36, 1),
(25, 120, 8, 1000, 1503644797, 15, 1),
(26, 120, 8, 8000, 1503644964, 15, 1),
(27, 120, 8, 500, 1503645129, 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`user_id` int(11) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `gender` varchar(30) NOT NULL,
  `birthdate` int(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone_number` int(30) NOT NULL,
  `identity_number` int(30) NOT NULL,
  `post` varchar(40) NOT NULL,
  `photo` varchar(30) NOT NULL,
  `branch` int(8) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `gender`, `birthdate`, `email`, `password`, `phone_number`, `identity_number`, `post`, `photo`, `branch`) VALUES
(1, 'shamim', 'irene', 'femal', 1997, 'irene@gmail.com', '123', 782589631, 11, 'admin', '', 3),
(15, 'kalisaw', 'patrick', 'male', 2015, 'bertin@gmail.com', '123', 786543332, 1232344554, 'Teller', 'DSC_0004.JPG', 74),
(38, 'clementine', 'UWITONZE', 'female', 1998, 'clementine@gmail.com', '123', 784219634, 2147483647, 'Teller', 'IMG-20170805-WA0050.jpg', 114),
(39, 'bell', 'foux', 'female', 1996, 'bell@gmail.com', '123', 728969355, 2147483647, 'Teller', 'â€ª+250 784 304 120â€¬ 2017080', 180),
(40, 'ndizeye', 'patrick', 'male', 2017, 'ndipason@gmail.com', '123', 788728090, 2147483647, 'Teller', 'am2.JPG', 0),
(41, 'Murekezi', 'Fred', 'male', 2009, 'murekezi@gmail.com', '123', 778888888, 2147483647, 'Teller', '2013-04-03 16.27.28.jpg', 58),
(42, 'Murekezi', 'Fred', 'male', 0, 'murekezifred@gmail.com', '123', 777808888, 2147483647, 'Teller', '2013-04-03 16.27.28.jpg', 58);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
 ADD KEY `account_holder` (`account_holder`), ADD KEY `account_creator` (`account_creator`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
 ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
 ADD PRIMARY KEY (`id_d`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
 ADD PRIMARY KEY (`loan_id`);

--
-- Indexes for table `operations`
--
ALTER TABLE `operations`
 ADD PRIMARY KEY (`operation_id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
 ADD PRIMARY KEY (`IDpr`);

--
-- Indexes for table `sector`
--
ALTER TABLE `sector`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
 ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`), ADD KEY `branch` (`branch`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=417;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
MODIFY `id_d` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
MODIFY `loan_id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `operations`
--
ALTER TABLE `operations`
MODIFY `operation_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=186;
--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
MODIFY `IDpr` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sector`
--
ALTER TABLE `sector`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=417;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
MODIFY `transaction_id` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
