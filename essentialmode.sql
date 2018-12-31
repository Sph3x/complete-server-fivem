-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 31 déc. 2018 à 13:33
-- Version du serveur :  5.7.19
-- Version de PHP :  7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `essentialmode`
--

-- --------------------------------------------------------

--
-- Structure de la table `addon_account`
--

DROP TABLE IF EXISTS `addon_account`;
CREATE TABLE IF NOT EXISTS `addon_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `addon_account`
--

INSERT INTO `addon_account` (`id`, `name`, `label`, `shared`) VALUES
(1, 'caution', 'Caution', 0),
(2, 'society_cardealer', 'Concessionnaire', 1),
(3, 'society_ambulance', 'Ambulance', 1),
(4, 'society_mecano', 'Mécano', 1),
(5, 'society_police', 'Police', 1),
(6, 'society_tabac', 'Tabac', 1),
(7, 'society_taxi', 'Taxi', 1),
(8, 'society_unicorn', 'Unicorn', 1),
(9, 'society_vigne', 'Vigneron', 1),
(10, 'property_black_money', 'Argent Sale Propriété', 0),
(11, 'society_realestateagent', 'Agent immobilier', 1),
(12, 'society_bahama', 'Bahama Mas', 1),
(13, 'society_avocat', 'Avocat', 1),
(14, 'society_aircraftdealer', 'Airliner', 1),
(15, 'society_boatdealer', 'Marina', 1),
(16, 'organisation_mafia', 'Mafia', 1),
(17, 'organisation_gang', 'gang', 1),
(18, 'organisation_cartel', 'Cartel', 1),
(19, 'society_biker', 'Biker', 1),
(20, 'society_securiter', 'Securiter', 1);

-- --------------------------------------------------------

--
-- Structure de la table `addon_account_data`
--

DROP TABLE IF EXISTS `addon_account_data`;
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) DEFAULT NULL,
  `money` double NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `addon_account_data`
--

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(1, 'society_cardealer', 0, NULL),
(2, 'society_ambulance', 491400, NULL),
(3, 'society_mecano', 5052213, NULL),
(4, 'society_police', 9999962770, NULL),
(5, 'society_tabac', 6438, NULL),
(6, 'society_taxi', 154566, NULL),
(7, 'society_unicorn', 10097000, NULL),
(8, 'society_vigne', 0, NULL),
(9, 'caution', 0, 'steam:11000010d6c30cb'),
(10, 'society_realestateagent', 13006, NULL),
(11, 'property_black_money', 0, 'steam:11000010d6c30cb'),
(12, 'society_bahama', 278090, NULL),
(13, 'society_avocat', 1000, NULL),
(14, 'society_aircraftdealer', 0, NULL),
(15, 'society_boatdealer', 0, NULL),
(16, 'property_black_money', 0, 'steam:11000010ed15b6b'),
(17, 'caution', 0, 'steam:11000010ed15b6b'),
(18, 'property_black_money', 0, 'steam:1100001325b7a9b'),
(19, 'caution', 0, 'steam:1100001325b7a9b'),
(20, 'caution', 0, 'steam:110000111b71726'),
(21, 'property_black_money', 54000, 'steam:110000111b71726'),
(22, 'caution', 0, 'steam:110000113248a42'),
(23, 'property_black_money', 0, 'steam:110000113248a42'),
(24, 'caution', 0, 'steam:110000117d510a6'),
(25, 'property_black_money', 0, 'steam:110000117d510a6'),
(26, 'caution', 0, 'steam:11000011ad5e46e'),
(27, 'property_black_money', 0, 'steam:11000011ad5e46e'),
(28, 'caution', 0, 'steam:11000010ede2397'),
(29, 'property_black_money', 0, 'steam:11000010ede2397'),
(30, 'caution', 0, 'steam:11000011230bca7'),
(31, 'property_black_money', 0, 'steam:11000011230bca7'),
(32, 'caution', 0, 'steam:11000010719503b'),
(33, 'property_black_money', 0, 'steam:11000010719503b'),
(34, 'caution', 0, 'steam:11000013491dae7'),
(35, 'property_black_money', 0, 'steam:11000013491dae7'),
(36, 'caution', 0, 'steam:110000131d556ee'),
(37, 'property_black_money', 0, 'steam:110000131d556ee'),
(38, 'caution', 0, 'steam:110000119ac453f'),
(39, 'property_black_money', 0, 'steam:110000119ac453f'),
(40, 'caution', 0, 'steam:110000134626eca'),
(41, 'property_black_money', 0, 'steam:110000134626eca'),
(42, 'caution', 0, 'steam:1100001196b3017'),
(43, 'property_black_money', 0, 'steam:1100001196b3017'),
(44, 'property_black_money', 0, 'steam:11000010f7f9504'),
(45, 'caution', 0, 'steam:11000010f7f9504'),
(46, 'caution', 0, 'steam:11000010d17d505'),
(47, 'property_black_money', 0, 'steam:11000010d17d505'),
(48, 'property_black_money', 148000, 'steam:11000010cb4181f'),
(49, 'caution', 0, 'steam:11000010cb4181f'),
(50, 'caution', 0, 'steam:11000011a59b3fc'),
(51, 'property_black_money', 0, 'steam:11000011a59b3fc'),
(52, 'caution', 0, 'steam:110000104cf5aeb'),
(53, 'property_black_money', 0, 'steam:110000104cf5aeb'),
(54, 'caution', 0, 'steam:11000010d819702'),
(55, 'property_black_money', 0, 'steam:11000010d819702'),
(56, 'property_black_money', 0, 'steam:11000010032f30a'),
(57, 'caution', 0, 'steam:11000010032f30a'),
(58, 'caution', 0, 'steam:110000108ddaaf3'),
(59, 'property_black_money', 0, 'steam:110000108ddaaf3'),
(60, 'caution', 0, 'steam:11000013493c4b7'),
(61, 'property_black_money', 0, 'steam:11000013493c4b7'),
(62, 'caution', 0, 'steam:1100001179c3bb7'),
(63, 'property_black_money', 0, 'steam:1100001179c3bb7'),
(64, 'caution', 0, 'steam:11000010dd9c7d6'),
(65, 'property_black_money', 0, 'steam:11000010dd9c7d6'),
(66, 'caution', 0, 'steam:110000103c6f9cc'),
(67, 'property_black_money', 0, 'steam:110000103c6f9cc'),
(68, 'caution', 2000, 'steam:110000132b7e237'),
(69, 'property_black_money', 0, 'steam:110000132b7e237'),
(70, 'property_black_money', 0, 'steam:1100001350a83ef'),
(71, 'caution', 0, 'steam:1100001350a83ef'),
(72, 'property_black_money', 0, 'steam:110000117825a22'),
(73, 'caution', 0, 'steam:110000117825a22'),
(74, 'property_black_money', 0, 'steam:110000135b8dcac'),
(75, 'caution', 0, 'steam:110000135b8dcac'),
(76, 'society_mafia', 0, NULL),
(77, 'society_gang', 0, NULL),
(78, 'caution', 0, 'steam:11000011b8aadb1'),
(79, 'property_black_money', 0, 'steam:11000011b8aadb1'),
(80, 'organisation_mafia', 0, NULL),
(81, 'organisation_gang', 216160, NULL),
(82, 'organisation_cartel', 279500, NULL),
(84, 'caution', 0, 'steam:110000110c6f75a'),
(85, 'property_black_money', 0, 'steam:110000110c6f75a'),
(86, 'caution', 0, 'steam:11000011555ac07'),
(87, 'property_black_money', 0, 'steam:11000011555ac07'),
(88, 'property_black_money', 0, 'steam:11000011c0b0ace'),
(89, 'caution', 0, 'steam:11000011c0b0ace'),
(90, 'caution', 0, 'steam:11000011c7b5be5'),
(91, 'property_black_money', 0, 'steam:11000011c7b5be5'),
(92, 'property_black_money', 0, 'steam:110000111bfcd46'),
(93, 'caution', 0, 'steam:110000111bfcd46'),
(94, 'property_black_money', 0, 'steam:11000011ce402c4'),
(95, 'caution', 0, 'steam:11000011ce402c4'),
(96, 'property_black_money', 10781, 'steam:11000011acec85a'),
(97, 'caution', 0, 'steam:11000011acec85a'),
(98, 'property_black_money', 0, 'steam:110000132a349ee'),
(99, 'caution', 0, 'steam:110000132a349ee'),
(100, 'caution', 0, 'steam:11000010bb4b9f1'),
(101, 'property_black_money', 0, 'steam:11000010bb4b9f1'),
(102, 'property_black_money', 0, 'steam:11000013613fa78'),
(103, 'caution', 0, 'steam:11000013613fa78'),
(104, 'caution', 0, 'steam:110000111a58cab'),
(105, 'property_black_money', 0, 'steam:110000111a58cab'),
(106, 'property_black_money', 0, 'steam:11000011760b77b'),
(107, 'caution', 0, 'steam:11000011760b77b'),
(108, 'property_black_money', 0, 'steam:110000110bff738'),
(109, 'caution', 0, 'steam:110000110bff738'),
(110, 'caution', 0, 'steam:11000010f8be390'),
(111, 'property_black_money', 0, 'steam:11000010f8be390'),
(112, 'caution', 0, 'steam:1100001154fdc54'),
(113, 'property_black_money', 0, 'steam:1100001154fdc54'),
(114, 'property_black_money', 0, 'steam:11000011ae2da25'),
(115, 'caution', 0, 'steam:11000011ae2da25'),
(116, 'caution', 0, 'steam:11000010e555ae1'),
(117, 'property_black_money', 0, 'steam:11000010e555ae1'),
(118, 'property_black_money', 0, 'steam:11000010ccc8c9b'),
(119, 'caution', 0, 'steam:11000010ccc8c9b'),
(120, 'caution', 0, 'steam:11000013260f4bc'),
(121, 'property_black_money', 0, 'steam:11000013260f4bc'),
(122, 'caution', 0, 'steam:11000010f3c770c'),
(123, 'property_black_money', 0, 'steam:11000010f3c770c'),
(124, 'caution', 0, 'steam:11000010c4036d7'),
(125, 'property_black_money', 0, 'steam:11000010c4036d7'),
(126, 'property_black_money', 0, 'steam:1100001076bae8a'),
(127, 'caution', 0, 'steam:1100001076bae8a'),
(128, 'caution', 0, 'steam:110000118496987'),
(129, 'property_black_money', 0, 'steam:110000118496987'),
(130, 'caution', 0, 'steam:11000010f4464c0'),
(131, 'property_black_money', 0, 'steam:11000010f4464c0'),
(132, 'property_black_money', 0, 'steam:110000109729f67'),
(133, 'caution', 0, 'steam:110000109729f67'),
(134, 'property_black_money', 0, 'steam:110000108f366a1'),
(135, 'caution', 2000, 'steam:110000108f366a1'),
(136, 'caution', 0, 'steam:11000011669fc09'),
(137, 'property_black_money', 0, 'steam:11000011669fc09'),
(138, 'caution', 0, 'steam:11000011172f5d0'),
(139, 'property_black_money', 0, 'steam:11000011172f5d0'),
(140, 'caution', 0, 'steam:11000010fb96ddc'),
(141, 'property_black_money', 0, 'steam:11000010fb96ddc'),
(142, 'caution', 0, 'steam:110000118d3e52c'),
(143, 'property_black_money', 0, 'steam:110000118d3e52c'),
(144, 'property_black_money', 0, 'steam:11000010d6914d7'),
(145, 'caution', 0, 'steam:11000010d6914d7'),
(146, 'caution', 0, 'steam:110000107122573'),
(147, 'property_black_money', 0, 'steam:110000107122573'),
(148, 'property_black_money', 0, 'steam:11000010b4bab32'),
(149, 'caution', 0, 'steam:11000010b4bab32'),
(150, 'caution', 0, 'steam:11000011ccff156'),
(151, 'property_black_money', 0, 'steam:11000011ccff156'),
(152, 'property_black_money', 0, 'steam:11000011d24e38e'),
(153, 'caution', 0, 'steam:11000011d24e38e'),
(154, 'caution', 0, 'steam:110000113e42854'),
(155, 'property_black_money', 0, 'steam:110000113e42854'),
(156, 'property_black_money', 0, 'steam:11000011861fe2d'),
(157, 'caution', 0, 'steam:11000011861fe2d'),
(158, 'property_black_money', 0, 'steam:110000108f73203'),
(159, 'caution', 0, 'steam:110000108f73203'),
(160, 'society_biker', 436000, NULL),
(161, 'property_black_money', 0, 'steam:1100001155e5d75'),
(162, 'caution', 0, 'steam:1100001155e5d75'),
(163, 'property_black_money', 0, 'steam:1100001080602bc'),
(164, 'caution', 2000, 'steam:1100001080602bc'),
(165, 'caution', 0, 'steam:11000010e7887ad'),
(166, 'property_black_money', 0, 'steam:11000010e7887ad'),
(167, 'caution', 0, 'steam:11000013621a142'),
(168, 'property_black_money', 0, 'steam:11000013621a142'),
(169, 'property_black_money', 0, 'steam:11000010f692bdd'),
(170, 'caution', 0, 'steam:11000010f692bdd'),
(171, 'caution', 0, 'steam:11000013582fc5f'),
(172, 'property_black_money', 0, 'steam:11000013582fc5f'),
(173, 'caution', 0, 'steam:110000133ef6d99'),
(174, 'property_black_money', 0, 'steam:110000133ef6d99'),
(175, 'property_black_money', 0, 'steam:110000114b9921b'),
(176, 'caution', 0, 'steam:110000114b9921b'),
(177, 'caution', 0, 'steam:110000118c34052'),
(178, 'property_black_money', 0, 'steam:110000118c34052'),
(179, 'caution', 0, 'steam:11000010c9bdcd9'),
(180, 'property_black_money', 0, 'steam:11000010c9bdcd9'),
(181, 'property_black_money', 0, 'steam:1100001353fe56e'),
(182, 'caution', 0, 'steam:1100001353fe56e'),
(183, 'property_black_money', 0, 'steam:1100001173d36f1'),
(184, 'caution', 76, 'steam:1100001173d36f1'),
(185, 'caution', 0, 'steam:11000010d228cea'),
(186, 'property_black_money', 0, 'steam:11000010d228cea'),
(187, 'property_black_money', 0, 'steam:110000111593e00'),
(188, 'caution', 0, 'steam:110000111593e00'),
(189, 'caution', 0, 'steam:11000010e49b073'),
(190, 'property_black_money', 0, 'steam:11000010e49b073'),
(191, 'caution', 0, 'steam:11000010e81d760'),
(192, 'property_black_money', 0, 'steam:11000010e81d760'),
(193, 'property_black_money', 0, 'steam:110000119c0d7ec'),
(194, 'caution', 59, 'steam:110000119c0d7ec'),
(195, 'caution', 0, 'steam:11000010b490325'),
(196, 'property_black_money', 0, 'steam:11000010b490325'),
(197, 'society_securiter', 0, NULL),
(198, 'caution', 0, 'steam:110000109b99f47'),
(199, 'property_black_money', 0, 'steam:110000109b99f47'),
(200, 'caution', 0, 'steam:11000011cded001'),
(201, 'property_black_money', 0, 'steam:11000011cded001'),
(202, 'caution', 0, 'steam:1100001128ff308'),
(203, 'property_black_money', 0, 'steam:1100001128ff308'),
(204, 'caution', 0, 'steam:110000118282d31'),
(205, 'property_black_money', 0, 'steam:110000118282d31'),
(206, 'caution', 0, 'steam:11000010c789c31'),
(207, 'property_black_money', 0, 'steam:11000010c789c31'),
(208, 'caution', 0, 'steam:1100001173f3092'),
(209, 'property_black_money', 0, 'steam:1100001173f3092'),
(210, 'property_black_money', 0, 'steam:11000010b4b70d9'),
(211, 'caution', 0, 'steam:11000010b4b70d9'),
(212, 'caution', 0, 'steam:11000010077a8c1'),
(213, 'property_black_money', 0, 'steam:11000010077a8c1'),
(214, 'caution', 0, 'steam:110000132daf29b'),
(215, 'property_black_money', 0, 'steam:110000132daf29b'),
(216, 'property_black_money', 0, 'steam:110000116a28200'),
(217, 'caution', 0, 'steam:110000116a28200'),
(218, 'caution', 0, 'steam:11000010013511a'),
(219, 'property_black_money', 0, 'steam:11000010013511a'),
(220, 'property_black_money', 0, 'steam:11000010eb00ea7'),
(221, 'caution', 0, 'steam:11000010eb00ea7'),
(222, 'caution', 0, 'steam:1100001152f0a24'),
(223, 'property_black_money', 0, 'steam:1100001152f0a24'),
(224, 'property_black_money', 0, 'steam:110000117053659'),
(225, 'caution', 0, 'steam:110000117053659'),
(226, 'caution', 0, 'steam:1100001136fb180'),
(227, 'property_black_money', 0, 'steam:1100001136fb180'),
(228, 'caution', 0, 'steam:11000013634c728'),
(229, 'property_black_money', 0, 'steam:11000013634c728'),
(230, 'property_black_money', 0, 'steam:1100001135b73a1'),
(231, 'caution', 0, 'steam:1100001135b73a1'),
(232, 'caution', 0, 'steam:11000010ca2c7e9'),
(233, 'property_black_money', 0, 'steam:11000010ca2c7e9'),
(234, 'caution', 0, 'steam:1100001077856e8'),
(235, 'property_black_money', 0, 'steam:1100001077856e8'),
(236, 'caution', 0, 'steam:110000131f9e30e'),
(237, 'property_black_money', 0, 'steam:110000131f9e30e'),
(238, 'caution', 0, 'steam:110000119dc2827'),
(239, 'property_black_money', 0, 'steam:110000119dc2827'),
(240, 'caution', 0, 'steam:1100001061d0cb1'),
(241, 'property_black_money', 0, 'steam:1100001061d0cb1'),
(242, 'caution', 0, 'steam:11000011852ee0c'),
(243, 'property_black_money', 0, 'steam:11000011852ee0c'),
(244, 'property_black_money', 0, 'steam:11000011d1423db'),
(245, 'caution', 0, 'steam:11000011d1423db'),
(246, 'property_black_money', 0, 'steam:11000010302b529'),
(247, 'caution', 0, 'steam:11000010302b529'),
(248, 'property_black_money', 0, 'steam:110000119a721fd'),
(249, 'caution', 0, 'steam:110000119a721fd'),
(250, 'caution', 0, 'steam:110000114a6bf17'),
(251, 'property_black_money', 0, 'steam:110000114a6bf17'),
(252, 'property_black_money', 0, 'steam:11000010acfe014'),
(253, 'caution', 0, 'steam:11000010acfe014'),
(254, 'caution', 0, 'steam:11000011cf4c40d'),
(255, 'property_black_money', 0, 'steam:11000011cf4c40d'),
(256, 'society_army', 0, NULL),
(257, 'caution', 0, 'steam:11000010a01c0bc'),
(258, 'property_black_money', 0, 'steam:11000010a01c0bc'),
(259, 'caution', 0, 'steam:1100001098c0f10'),
(260, 'property_black_money', 0, 'steam:1100001098c0f10'),
(261, 'property_black_money', 0, 'steam:11000013518e15d'),
(262, 'caution', 0, 'steam:11000013518e15d'),
(263, 'caution', 0, 'steam:11000010cba93cb'),
(264, 'property_black_money', 0, 'steam:11000010cba93cb'),
(265, 'property_black_money', 0, 'steam:1100001048dd98c'),
(266, 'caution', 0, 'steam:1100001048dd98c'),
(267, 'property_black_money', 0, 'steam:11000011bd90656'),
(268, 'caution', 0, 'steam:11000011bd90656'),
(269, 'caution', 0, 'steam:110000115a29e25'),
(270, 'property_black_money', 0, 'steam:110000115a29e25'),
(271, 'property_black_money', 0, 'steam:11000010ed15261'),
(272, 'caution', 0, 'steam:11000010ed15261');

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory`
--

DROP TABLE IF EXISTS `addon_inventory`;
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `addon_inventory`
--

INSERT INTO `addon_inventory` (`id`, `name`, `label`, `shared`) VALUES
(1, 'society_cardealer', 'Concesionnaire', 1),
(2, 'society_ambulance', 'Ambulance', 1),
(3, 'society_mecano', 'Mécano', 1),
(4, 'society_police', 'Police', 1),
(5, 'society_tabac', 'Tabac', 1),
(6, 'society_taxi', 'Taxi', 1),
(7, 'society_unicorn', 'Unicorn', 1),
(8, 'society_unicorn_fridge', 'Unicorn (frigo)', 1),
(9, 'society_vigne', 'Vigneron', 1),
(10, 'property', 'Propriété', 0),
(11, 'society_bahama', 'Bahama Mas', 1),
(12, 'society_avocat', 'Avocat', 1),
(13, 'society_aircraftdealer', 'Airliner', 1),
(14, 'society_boatdealer', 'Marina', 1),
(15, 'organisation_mafia', 'Mafia', 1),
(16, 'organisation_gang', 'Gang', 1),
(17, 'organisation_cartel', 'Cartel', 1),
(18, 'society_biker', 'Biker', 1),
(19, 'society_securiter', 'Securiter', 1);

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory_items`
--

DROP TABLE IF EXISTS `addon_inventory_items`;
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `addon_inventory_items`
--

INSERT INTO `addon_inventory_items` (`id`, `inventory_name`, `name`, `count`, `owner`) VALUES
(1, 'society_vigne', 'raisin', 0, NULL),
(2, 'society_tabac', 'malbora', 0, NULL),
(3, 'society_tabac', 'gitanes', 0, NULL),
(4, 'society_tabac', 'tequila', 0, NULL),
(5, 'society_tabac', 'redbull', 0, NULL),
(6, 'society_tabac', 'whisky', 0, NULL),
(7, 'society_tabac', 'vodka', 0, NULL),
(8, 'society_tabac', 'grand_cru', 0, NULL),
(9, 'property', 'tabacbrun', 0, 'steam:110000111b71726'),
(10, 'property', 'water', 0, 'steam:110000111b71726'),
(11, 'property', 'bread', 0, 'steam:110000111b71726'),
(12, 'property', 'diamond', 0, 'steam:110000111b71726'),
(13, 'society_tabac', 'weed', 0, NULL),
(14, 'property', 'tabacbrunsec', 0, 'steam:110000111b71726'),
(15, 'property', 'croquettes', 43, 'steam:11000011c7b5be5'),
(16, 'property', 'weed', 50, 'steam:110000111b71726'),
(17, 'property', 'weed_pooch', 34, 'steam:110000111b71726'),
(18, 'property', 'gitanes', 0, 'steam:110000111b71726'),
(19, 'society_police', 'wool', 80, NULL),
(20, 'society_tabac', 'tabacbrunsec', 0, NULL),
(21, 'society_tabac', 'tabacbrun', 0, NULL),
(22, 'society_tabac', 'water', 0, NULL),
(23, 'society_tabac', 'bread', 0, NULL),
(24, 'society_tabac', 'weed_pooch', 0, NULL),
(25, 'society_police', 'weed', 230, NULL),
(26, 'society_unicorn', 'weed', 25, NULL),
(27, 'society_police', 'cagoule', 0, NULL),
(28, 'organisation_mafia', 'coke_pooch', 0, NULL),
(29, 'organisation_mafia', 'opium', 0, NULL),
(30, 'organisation_mafia', 'weed', 0, NULL),
(31, 'organisation_mafia', 'coke', 0, NULL),
(32, 'organisation_gang', 'weed', 483, NULL),
(33, 'property', 'grand_cru', 50, 'steam:110000111b71726'),
(34, 'property', 'redbull', 0, 'steam:110000111b71726'),
(35, 'property', 'yusuf', 0, 'steam:110000111b71726'),
(36, 'property', 'tabacblond', 1316, 'steam:110000111b71726'),
(37, 'property', 'tequila', 100, 'steam:110000111b71726'),
(38, 'organisation_mafia', 'malbora', 0, NULL),
(39, 'organisation_mafia', 'weed_pooch', 0, NULL),
(40, 'organisation_mafia', 'tabacblond', 0, NULL),
(41, 'organisation_mafia', 'yusuf', 17, NULL),
(42, 'organisation_mafia', 'silencieux', 12, NULL),
(43, 'organisation_mafia', 'grip', 8, NULL),
(44, 'organisation_mafia', 'clip', 0, NULL),
(45, 'society_police', 'flashlight', 5, NULL),
(46, 'society_police', 'clip', 26, NULL),
(47, 'society_police', 'silencieux', 6, NULL),
(48, 'society_mecano', 'fixkit', 14, NULL),
(49, 'society_mecano', 'blowpipe', 10, NULL),
(50, 'property', 'water', 0, 'steam:11000011c7b5be5'),
(51, 'property', 'bread', 34, 'steam:11000011c7b5be5'),
(52, 'property', 'flashlight', 1, 'steam:11000011c7b5be5'),
(53, 'society_police', 'weed_pooch', 10, NULL),
(54, 'property', 'malbora', 0, 'steam:110000111b71726'),
(55, 'organisation_mafia', 'raisin', 0, NULL),
(56, 'society_mecano', 'weed_pooch', 0, NULL),
(57, 'organisation_gang', 'coke', 50, NULL),
(58, 'society_police', 'coke', 66, NULL),
(59, 'society_police', 'opium', 5, NULL),
(60, 'society_mecano', 'coke', 0, NULL),
(61, 'society_mecano', 'opium', 0, NULL),
(62, 'society_police', 'malbora', 0, NULL),
(63, 'property', 'coke_pooch', 24, 'steam:110000111b71726'),
(64, 'property', 'coke', 450, 'steam:110000111b71726'),
(65, 'property', 'coke', 0, 'steam:11000010cb4181f'),
(66, 'property', 'cagoule', 1, 'steam:11000011acec85a'),
(67, 'property', 'clip', 6, 'steam:11000011acec85a'),
(68, 'property', 'coke', 475, 'steam:11000011acec85a'),
(69, 'property', 'malbora', 34, 'steam:11000011acec85a'),
(70, 'property', 'weed', 136, 'steam:11000011acec85a'),
(71, 'property', 'coke', 21, 'steam:1100001325b7a9b'),
(72, 'property', 'opium', 0, 'steam:1100001325b7a9b'),
(73, 'property', 'weed_pooch', 3598, 'steam:1100001325b7a9b'),
(74, 'property', 'weed', 1272, 'steam:1100001325b7a9b'),
(75, 'property', 'weed_pooch', 0, 'steam:11000011acec85a'),
(76, 'property', 'coke_pooch', 10, 'steam:110000118c34052'),
(77, 'property', 'weed', 0, 'steam:110000110c6f75a'),
(78, 'property', 'weed', 0, 'steam:110000103c6f9cc'),
(79, 'property', 'weed_pooch', 219, 'steam:110000103c6f9cc'),
(80, 'organisation_gang', 'clip', 0, NULL),
(81, 'property', 'water', 0, 'steam:11000011acec85a'),
(82, 'property', 'grand_cru', 0, 'steam:11000011cded001'),
(83, 'property', 'weed', 0, 'steam:11000011cded001'),
(84, 'society_police', 'coke_pooch', 11, NULL),
(85, 'property', 'weed', 29, 'steam:11000010f3c770c'),
(86, 'property', 'tequila', 0, 'steam:110000103c6f9cc'),
(87, 'society_police', 'grand_cru', 8, NULL),
(88, 'organisation_gang', 'opium', 50, NULL),
(89, 'organisation_gang', 'meth_pooch', 0, NULL),
(90, 'property', 'bread', 0, 'steam:110000118c34052'),
(91, 'property', 'weed_pooch', 120, 'steam:1100001179c3bb7'),
(92, 'property', 'weed', 0, 'steam:1100001179c3bb7'),
(93, 'property', 'tequila', 73, 'steam:1100001325b7a9b'),
(94, 'property', 'vodka', 95, 'steam:1100001325b7a9b'),
(95, 'property', 'yusuf', 1, 'steam:1100001325b7a9b'),
(96, 'property', 'grand_cru', 5, 'steam:1100001325b7a9b'),
(97, 'property', 'meth_pooch', 70, 'steam:1100001325b7a9b'),
(98, 'property', 'silencieux', 1010, 'steam:11000013613fa78'),
(99, 'property', 'grip', 559, 'steam:11000013613fa78'),
(100, 'property', 'flashlight', 920, 'steam:11000013613fa78'),
(101, 'property', 'clip', 1600, 'steam:11000013613fa78'),
(102, 'property', 'bread', 0, 'steam:110000103c6f9cc'),
(103, 'property', 'water', 0, 'steam:110000103c6f9cc'),
(104, 'property', 'flashlight', 2, 'steam:11000011acec85a'),
(105, 'property', 'grip', 6, 'steam:11000011acec85a'),
(106, 'property', 'silencieux', 3, 'steam:11000011acec85a'),
(107, 'property', 'water', 200, 'steam:11000013613fa78'),
(108, 'property', 'bread', 910, 'steam:11000013613fa78'),
(109, 'society_cardealer', 'weed', -100, NULL),
(110, 'society_cardealer', 'whisky', -100, NULL),
(111, 'society_cardealer', 'vodka', -100, NULL),
(112, 'society_cardealer', 'coke', -100, NULL),
(113, 'society_cardealer', 'opium', -100, NULL),
(114, 'society_cardealer', 'meth', -100, NULL),
(115, 'society_cardealer', 'bread', -100, NULL),
(116, 'society_cardealer', 'water', -100, NULL),
(117, 'property', 'coke', 100, 'steam:11000013613fa78'),
(118, 'property', 'meth', 100, 'steam:11000013613fa78'),
(119, 'property', 'opium', 100, 'steam:11000013613fa78'),
(120, 'property', 'vodka', 0, 'steam:11000013613fa78'),
(121, 'property', 'weed', 95, 'steam:11000013613fa78'),
(122, 'property', 'whisky', 100, 'steam:11000013613fa78'),
(123, 'society_unicorn_fridge', 'weed', 0, NULL),
(124, 'organisation_gang', 'flashlight', 0, NULL),
(125, 'organisation_gang', 'grip', 0, NULL),
(126, 'organisation_gang', 'silencieux', 0, NULL),
(127, 'organisation_gang', 'yusuf', 0, NULL),
(128, 'property', 'silencieux', 0, 'steam:11000011cded001'),
(129, 'property', 'flashlight', 0, 'steam:11000011cded001'),
(130, 'property', 'grip', 0, 'steam:11000011cded001'),
(131, 'property', 'croquettes', 0, 'steam:11000011cded001'),
(132, 'property', 'coke', 0, 'steam:11000011cded001'),
(133, 'property', 'meth', 0, 'steam:11000011cded001'),
(134, 'property', 'coke_pooch', 0, 'steam:11000011cded001'),
(135, 'society_police', 'washed_stone', 7, NULL),
(136, 'society_police', 'grip', 1, NULL),
(137, 'society_police', 'tequila', 4, NULL),
(138, 'society_police', 'yusuf', 1, NULL),
(139, 'society_police', 'vodka', 4, NULL),
(140, 'property', 'opium', 0, 'steam:11000011acec85a'),
(141, 'property', 'meth_pooch', 5, 'steam:11000011acec85a'),
(142, 'property', 'fixkit', 2, 'steam:11000011acec85a'),
(143, 'organisation_gang', 'weed_pooch', 10, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `aircraftdealer_aircrafts`
--

DROP TABLE IF EXISTS `aircraftdealer_aircrafts`;
CREATE TABLE IF NOT EXISTS `aircraftdealer_aircrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `aircrafts`
--

DROP TABLE IF EXISTS `aircrafts`;
CREATE TABLE IF NOT EXISTS `aircrafts` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `aircrafts`
--

INSERT INTO `aircrafts` (`name`, `model`, `price`, `category`) VALUES
('Alpha Z1', 'alphaz1', 1121000, 'plane'),
('Besra', 'besra', 1000000, 'plane'),
('Cuban 800', 'cuban800', 240000, 'plane'),
('Dodo', 'dodo', 500000, 'plane'),
('Duster', 'duster', 175000, 'plane'),
('Howard NX25', 'howard', 975000, 'plane'),
('Luxor', 'luxor', 1500000, 'plane'),
('Luxor Deluxe ', 'luxor2', 1750000, 'plane'),
('Mallard', 'stunt', 250000, 'plane'),
('Mammatus', 'mammatus', 300000, 'plane'),
('Nimbus', 'nimbus', 900000, 'plane'),
('Rogue', 'rogue', 1000000, 'plane'),
('Sea Breeze', 'seabreeze', 850000, 'plane'),
('Shamal', 'shamal', 1150000, 'plane'),
('Ultra Light', 'microlight', 50000, 'plane'),
('Velum', 'velum2', 450000, 'plane'),
('Vestra', 'vestra', 950000, 'plane'),
('Buzzard', 'buzzard2', 500000, 'heli'),
('Frogger', 'frogger', 800000, 'heli'),
('Havok', 'havok', 250000, 'heli'),
('Maverick', 'maverick', 750000, 'heli'),
('Sea Sparrow', 'seasparrow', 815000, 'heli'),
('SuperVolito', 'supervolito', 1000000, 'heli'),
('SuperVolito Carbon', 'supervolito2', 1250000, 'heli'),
('Swift', 'swift', 1000000, 'heli'),
('Swift Deluxe', 'swift2', 1250000, 'heli'),
('Volatus', 'volatus', 1250000, 'heli');

-- --------------------------------------------------------

--
-- Structure de la table `aircraft_categories`
--

DROP TABLE IF EXISTS `aircraft_categories`;
CREATE TABLE IF NOT EXISTS `aircraft_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `aircraft_categories`
--

INSERT INTO `aircraft_categories` (`name`, `label`) VALUES
('plane', 'Planes'),
('heli', 'Helicopters');

-- --------------------------------------------------------

--
-- Structure de la table `billing`
--

DROP TABLE IF EXISTS `billing`;
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `boatdealer_boats`
--

DROP TABLE IF EXISTS `boatdealer_boats`;
CREATE TABLE IF NOT EXISTS `boatdealer_boats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `boats`
--

DROP TABLE IF EXISTS `boats`;
CREATE TABLE IF NOT EXISTS `boats` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `boats`
--

INSERT INTO `boats` (`name`, `model`, `price`, `category`) VALUES
('Seashark', 'seashark', 1500, 'boat'),
('Seashark2', 'seashark2', 1500, 'boat'),
('Yacht Seashark', 'seashark3', 1500, 'boat'),
('Suntrap', 'suntrap', 1500, 'boat'),
('Dinghy', 'dinghy', 2500, 'boat'),
('Dinghy2 ', 'dinghy2', 2500, 'boat'),
('Yacht Dinghy', 'dinghy4', 1500, 'boat'),
('Tropic', 'tropic', 10000, 'boat'),
('Yacht Tropic', 'tropic2', 10000, 'boat'),
('Squalo', 'squalo', 12000, 'boat'),
('Yacht Toro', 'toro2', 15000, 'boat'),
('Toro', 'toro', 15000, 'boat'),
('Jetmax', 'jetmax', 17500, 'boat'),
('Voilier Marquis', 'marquis', 45500, 'boat');

-- --------------------------------------------------------

--
-- Structure de la table `boat_categories`
--

DROP TABLE IF EXISTS `boat_categories`;
CREATE TABLE IF NOT EXISTS `boat_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `boat_categories`
--

INSERT INTO `boat_categories` (`name`, `label`) VALUES
('boat', 'Boats');

-- --------------------------------------------------------

--
-- Structure de la table `cardealer_vehicles`
--

DROP TABLE IF EXISTS `cardealer_vehicles`;
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cardealer_vehicles`
--

INSERT INTO `cardealer_vehicles` (`id`, `vehicle`, `price`) VALUES
(1, 'comet2', 65000),
(2, 'penumbra', 28000),
(3, 'bmws', 45000),
(4, 'scorcher', 280),
(5, 'harleycustom', 0);

-- --------------------------------------------------------

--
-- Structure de la table `characters`
--

DROP TABLE IF EXISTS `characters`;
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dateofbirth` varchar(255) NOT NULL,
  `sex` varchar(1) NOT NULL DEFAULT 'M',
  `height` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `datastore`
--

DROP TABLE IF EXISTS `datastore`;
CREATE TABLE IF NOT EXISTS `datastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `datastore`
--

INSERT INTO `datastore` (`id`, `name`, `label`, `shared`) VALUES
(1, 'user_ears', 'Ears', 0),
(2, 'user_glasses', 'Glasses', 0),
(3, 'user_helmet', 'Helmet', 0),
(4, 'user_mask', 'Mask', 0),
(5, 'society_ambulance', 'Ambulance', 1),
(6, 'society_police', 'Police', 1),
(7, 'society_tabac', 'Tabac', 1),
(8, 'society_taxi', 'Taxi', 1),
(9, 'society_unicorn', 'Unicorn', 1),
(10, 'society_vigne', 'Vigneron', 1),
(11, 'property', 'Propriété', 0),
(12, 'society_avocat', 'Avocat', 1),
(13, 'organisation_mafia', 'Mafia', 1),
(14, 'organisation_gang', 'Gang', 1),
(15, 'organisation_cartel', 'Cartel', 1),
(16, 'society_biker', 'Biker', 1);

-- --------------------------------------------------------

--
-- Structure de la table `datastore_data`
--

DROP TABLE IF EXISTS `datastore_data`;
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=641 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `datastore_data`
--

INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(1, 'society_ambulance', NULL, '{}'),
(2, 'society_police', NULL, '{\"weapons\":[{\"count\":37,\"name\":\"WEAPON_NIGHTSTICK\"},{\"count\":33,\"name\":\"WEAPON_COMBATPISTOL\"},{\"count\":37,\"name\":\"WEAPON_ASSAULTSMG\"},{\"count\":24,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"name\":\"WEAPON_PUMPSHOTGUN\"},{\"count\":0,\"name\":\"WEAPON_PISTOL\"},{\"count\":0,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":0,\"name\":\"WEAPON_RPG\"},{\"count\":44,\"name\":\"WEAPON_SAWNOFFSHOTGUN\"},{\"count\":0,\"name\":\"WEAPON_BULLPUPSHOTGUN\"},{\"count\":3,\"name\":\"WEAPON_SNIPERRIFLE\"},{\"count\":2,\"name\":\"WEAPON_BAT\"},{\"count\":3,\"name\":\"WEAPON_APPISTOL\"},{\"count\":1,\"name\":\"WEAPON_SMG\"},{\"count\":0,\"name\":\"WEAPON_HEAVYPISTOL\"},{\"count\":0,\"name\":\"WEAPON_REVOLVER\"},{\"count\":0,\"name\":\"WEAPON_KNUCKLE\"},{\"count\":1,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"count\":0,\"name\":\"WEAPON_FIREEXTINGUISHER\"},{\"count\":0,\"name\":\"WEAPON_SPECIALCARBINE\"},{\"count\":2,\"name\":\"WEAPON_COMPACTRIFLE\"},{\"count\":1,\"name\":\"WEAPON_MG\"},{\"count\":1,\"name\":\"WEAPON_STICKYBOMB\"},{\"count\":1,\"name\":\"WEAPON_VINTAGEPISTOL\"},{\"count\":0,\"name\":\"WEAPON_SMOKEGRENADE\"},{\"count\":0,\"name\":\"WEAPON_KNIFE\"},{\"count\":0,\"name\":\"WEAPON_PIPEBOMB\"},{\"count\":1,\"name\":\"WEAPON_MOLOTOV\"},{\"count\":1,\"name\":\"WEAPON_HAMMER\"},{\"count\":1,\"name\":\"WEAPON_GOLFCLUB\"},{\"count\":1,\"name\":\"WEAPON_CROWBAR\"},{\"count\":0,\"name\":\"WEAPON_PISTOL50\"},{\"count\":0,\"name\":\"WEAPON_SNSPISTOL\"},{\"count\":0,\"name\":\"WEAPON_MUSKET\"},{\"count\":0,\"name\":\"WEAPON_HATCHET\"},{\"count\":0,\"name\":\"WEAPON_MACHETE\"},{\"count\":1,\"name\":\"WEAPON_ADVANCEDRIFLE\"},{\"count\":1,\"name\":\"WEAPON_COMBATMG\"},{\"name\":\"WEAPON_COMBATMG_MK2\",\"count\":1},{\"count\":1,\"name\":\"WEAPON_SMG_MK2\"},{\"count\":1,\"name\":\"WEAPON_COMBATPDW\"},{\"name\":\"WEAPON_SWITCHBLADE\",\"count\":1}]}'),
(3, 'society_tabac', NULL, '{}'),
(4, 'society_taxi', NULL, '{}'),
(5, 'society_unicorn', NULL, '{}'),
(6, 'society_vigne', NULL, '{}'),
(7, 'user_helmet', 'steam:11000010d6c30cb', '{\"skin\":{\"helmet_2\":0,\"helmet_1\":120},\"hasHelmet\":true}'),
(8, 'user_glasses', 'steam:11000010d6c30cb', '{\"hasGlasses\":true,\"skin\":{\"glasses_1\":0,\"glasses_2\":0}}'),
(9, 'user_mask', 'steam:11000010d6c30cb', '{\"hasMask\":true,\"skin\":{\"mask_2\":0,\"mask_1\":32}}'),
(10, 'user_ears', 'steam:11000010d6c30cb', '{}'),
(11, 'property', 'steam:11000010d6c30cb', '{\"dressing\":[{\"label\":\"NOEL\",\"skin\":{\"hair_color_2\":5,\"hair_1\":45,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":4,\"chain_2\":0,\"lipstick_1\":0,\"beard_1\":4,\"beard_2\":7,\"pants_1\":37,\"eyebrows_1\":29,\"glasses_1\":0,\"bags_1\":0,\"skin\":0,\"shoes_1\":12,\"bproof_1\":0,\"hair_color_1\":0,\"bproof_2\":0,\"pants_2\":1,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"ears_1\":-1,\"mask_1\":0,\"lipstick_3\":0,\"decals_1\":0,\"tshirt_1\":15,\"arms\":14,\"face\":0,\"torso_1\":196,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"sex\":0,\"makeup_1\":0,\"tshirt_2\":0,\"mask_2\":0,\"beard_4\":0,\"eyebrows_2\":10,\"makeup_2\":0,\"bags_2\":0,\"decals_2\":0,\"lipstick_2\":0,\"helmet_1\":-1,\"hair_2\":0,\"shoes_2\":3,\"makeup_4\":0}},{\"label\":\"MAILLOT\",\"skin\":{\"makeup_2\":0,\"hair_1\":45,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":0,\"chain_2\":0,\"lipstick_1\":0,\"beard_1\":4,\"beard_2\":7,\"ears_2\":0,\"eyebrows_1\":29,\"glasses_1\":0,\"bags_1\":0,\"skin\":0,\"shoes_1\":34,\"bproof_1\":0,\"hair_color_1\":0,\"bproof_2\":0,\"pants_2\":2,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"tshirt_1\":15,\"ears_1\":-1,\"mask_1\":0,\"lipstick_3\":0,\"decals_1\":0,\"makeup_1\":0,\"arms\":15,\"face\":0,\"sex\":0,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"hair_color_2\":5,\"torso_1\":15,\"tshirt_2\":0,\"mask_2\":0,\"beard_4\":0,\"pants_1\":54,\"eyebrows_2\":10,\"bags_2\":0,\"decals_2\":0,\"lipstick_2\":0,\"helmet_1\":-1,\"hair_2\":0,\"shoes_2\":0,\"makeup_4\":0}},{\"label\":\"Chaperons rouge\",\"skin\":{\"makeup_2\":0,\"hair_1\":45,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":1,\"chain_2\":0,\"lipstick_1\":0,\"beard_1\":4,\"beard_2\":7,\"ears_2\":0,\"eyebrows_1\":29,\"glasses_1\":0,\"bags_1\":0,\"skin\":0,\"shoes_1\":24,\"bproof_1\":0,\"hair_color_1\":0,\"bproof_2\":0,\"pants_2\":0,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"tshirt_1\":15,\"ears_1\":-1,\"mask_1\":0,\"lipstick_2\":0,\"decals_1\":0,\"hair_color_2\":5,\"arms\":60,\"makeup_1\":0,\"sex\":0,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"torso_1\":188,\"beard_4\":0,\"tshirt_2\":0,\"mask_2\":0,\"pants_1\":31,\"eyebrows_2\":10,\"lipstick_3\":0,\"bags_2\":0,\"decals_2\":0,\"hair_2\":0,\"helmet_1\":120,\"face\":0,\"shoes_2\":0,\"makeup_4\":0}},{\"label\":\"CHAPERON ROUGE BONNET\",\"skin\":{\"hair_color_2\":5,\"hair_1\":39,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":1,\"chain_2\":0,\"lipstick_1\":0,\"beard_1\":4,\"beard_2\":7,\"ears_2\":0,\"eyebrows_1\":29,\"glasses_1\":0,\"bags_1\":0,\"skin\":0,\"shoes_1\":24,\"bproof_1\":0,\"hair_color_1\":0,\"bproof_2\":0,\"pants_2\":0,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"tshirt_1\":15,\"ears_1\":-1,\"mask_1\":0,\"lipstick_3\":0,\"decals_1\":0,\"sex\":0,\"arms\":60,\"face\":0,\"makeup_1\":0,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"torso_1\":188,\"beard_4\":0,\"tshirt_2\":0,\"mask_2\":0,\"pants_1\":31,\"eyebrows_2\":10,\"makeup_2\":0,\"bags_2\":0,\"decals_2\":0,\"lipstick_2\":0,\"helmet_1\":120,\"hair_2\":0,\"shoes_2\":0,\"makeup_4\":0}},{\"label\":\"PERE NOEL\",\"skin\":{\"makeup_2\":0,\"hair_1\":39,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":0,\"chain_2\":0,\"hair_2\":0,\"beard_1\":4,\"beard_2\":7,\"ears_2\":0,\"eyebrows_1\":29,\"glasses_1\":0,\"bags_1\":0,\"skin\":0,\"shoes_1\":39,\"bproof_1\":0,\"hair_color_1\":0,\"bproof_2\":0,\"pants_2\":0,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"tshirt_1\":72,\"ears_1\":-1,\"mask_1\":0,\"lipstick_3\":0,\"decals_1\":0,\"makeup_1\":0,\"arms\":60,\"face\":0,\"hair_color_2\":5,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"torso_1\":116,\"beard_4\":0,\"tshirt_2\":1,\"mask_2\":0,\"pants_1\":57,\"eyebrows_2\":10,\"sex\":0,\"bags_2\":0,\"decals_2\":0,\"lipstick_2\":0,\"helmet_1\":120,\"lipstick_1\":0,\"shoes_2\":0,\"makeup_4\":0}}],\"weapons\":[{\"ammo\":0,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":0,\"name\":\"WEAPON_PUMPSHOTGUN\"},{\"ammo\":34,\"name\":\"WEAPON_SNIPERRIFLE\"},{\"ammo\":25,\"name\":\"WEAPON_SMOKEGRENADE\"},{\"ammo\":25,\"name\":\"WEAPON_GRENADE\"},{\"ammo\":25,\"name\":\"WEAPON_BZGAS\"},{\"ammo\":1,\"name\":\"WEAPON_BALL\"},{\"ammo\":0,\"name\":\"WEAPON_FIREWORK\"},{\"ammo\":16,\"name\":\"WEAPON_CARBINERIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_SNIPERRIFLE\"},{\"ammo\":0,\"name\":\"WEAPON_MARKSMANRIFLE\"}]}'),
(12, 'society_avocat', NULL, '{}'),
(13, 'user_helmet', 'steam:11000010ed15b6b', '{}'),
(14, 'user_mask', 'steam:11000010ed15b6b', '{\"skin\":{\"mask_1\":39,\"mask_2\":0},\"hasMask\":true}'),
(15, 'user_glasses', 'steam:11000010ed15b6b', '{}'),
(16, 'property', 'steam:11000010ed15b6b', '{\"dressing\":[{\"label\":\"Normal\",\"skin\":{\"bags_2\":0,\"beard_4\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":0,\"chain_2\":0,\"lipstick_1\":0,\"beard_1\":11,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":0,\"glasses_1\":8,\"bags_1\":0,\"skin\":11,\"shoes_1\":0,\"bproof_1\":0,\"tshirt_1\":85,\"bproof_2\":0,\"pants_2\":2,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"pants_1\":4,\"ears_1\":-1,\"decals_2\":0,\"lipstick_3\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":30,\"face\":4,\"mask_1\":0,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"lipstick_2\":0,\"hair_1\":21,\"tshirt_2\":2,\"mask_2\":0,\"hair_color_2\":0,\"makeup_2\":0,\"eyebrows_2\":0,\"hair_color_1\":0,\"torso_1\":247,\"sex\":0,\"helmet_1\":-1,\"makeup_1\":0,\"shoes_2\":10,\"makeup_4\":0}},{\"label\":\"Costume Rouge\",\"skin\":{\"bags_2\":0,\"beard_4\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":4,\"chain_2\":4,\"lipstick_1\":0,\"beard_1\":11,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":0,\"glasses_1\":8,\"bags_1\":0,\"skin\":11,\"shoes_1\":10,\"bproof_1\":0,\"tshirt_1\":33,\"bproof_2\":0,\"pants_2\":4,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"torso_1\":29,\"ears_1\":-1,\"decals_2\":0,\"lipstick_3\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":33,\"makeup_1\":0,\"mask_1\":0,\"helmet_2\":0,\"chain_1\":22,\"lipstick_4\":0,\"age_1\":0,\"lipstick_2\":0,\"face\":4,\"tshirt_2\":4,\"mask_2\":0,\"hair_1\":21,\"hair_color_2\":0,\"makeup_2\":0,\"eyebrows_2\":0,\"hair_color_1\":0,\"sex\":0,\"helmet_1\":-1,\"pants_1\":24,\"shoes_2\":0,\"makeup_4\":0}},{\"label\":\"Costume Noir\",\"skin\":{\"bags_2\":0,\"beard_4\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":0,\"chain_2\":2,\"lipstick_1\":0,\"beard_1\":11,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":0,\"glasses_1\":8,\"bags_1\":0,\"skin\":11,\"shoes_1\":10,\"bproof_1\":0,\"tshirt_1\":33,\"bproof_2\":0,\"pants_2\":0,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"pants_1\":24,\"ears_1\":-1,\"decals_2\":0,\"lipstick_3\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":33,\"face\":4,\"mask_1\":0,\"helmet_2\":0,\"chain_1\":11,\"lipstick_4\":0,\"age_1\":0,\"lipstick_2\":0,\"hair_1\":21,\"tshirt_2\":0,\"mask_2\":0,\"hair_color_2\":0,\"makeup_2\":0,\"eyebrows_2\":0,\"torso_1\":29,\"hair_color_1\":0,\"sex\":0,\"helmet_1\":-1,\"makeup_1\":0,\"shoes_2\":0,\"makeup_4\":0}},{\"label\":\"Costume Gris\",\"skin\":{\"bags_2\":0,\"beard_4\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":1,\"chain_2\":1,\"lipstick_1\":0,\"beard_1\":11,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":0,\"glasses_1\":8,\"bags_1\":0,\"skin\":11,\"shoes_1\":10,\"bproof_1\":0,\"tshirt_1\":33,\"bproof_2\":0,\"pants_2\":1,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"pants_1\":24,\"ears_1\":-1,\"decals_2\":0,\"lipstick_3\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":33,\"face\":4,\"mask_1\":0,\"helmet_2\":0,\"chain_1\":22,\"lipstick_4\":0,\"age_1\":0,\"lipstick_2\":0,\"hair_1\":21,\"tshirt_2\":1,\"mask_2\":0,\"hair_color_2\":0,\"makeup_2\":0,\"eyebrows_2\":0,\"torso_1\":29,\"hair_color_1\":0,\"sex\":0,\"helmet_1\":-1,\"makeup_1\":0,\"shoes_2\":0,\"makeup_4\":0}},{\"label\":\"Costume Bleu\",\"skin\":{\"bags_2\":0,\"beard_4\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":2,\"chain_2\":3,\"lipstick_1\":0,\"beard_1\":11,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":0,\"glasses_1\":8,\"bags_1\":0,\"skin\":11,\"shoes_1\":10,\"bproof_1\":0,\"tshirt_1\":33,\"bproof_2\":0,\"pants_2\":2,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"pants_1\":24,\"ears_1\":-1,\"decals_2\":0,\"lipstick_3\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":33,\"face\":4,\"mask_1\":0,\"helmet_2\":0,\"chain_1\":22,\"lipstick_4\":0,\"age_1\":0,\"lipstick_2\":0,\"hair_1\":21,\"tshirt_2\":2,\"mask_2\":0,\"torso_1\":29,\"hair_color_2\":0,\"makeup_2\":0,\"eyebrows_2\":0,\"hair_color_1\":0,\"sex\":0,\"helmet_1\":-1,\"makeup_1\":0,\"shoes_2\":0,\"makeup_4\":0}},{\"label\":\"Costume Vert\",\"skin\":{\"bags_2\":0,\"beard_4\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":3,\"chain_2\":0,\"lipstick_1\":0,\"beard_1\":11,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":0,\"glasses_1\":8,\"bags_1\":0,\"skin\":11,\"shoes_1\":10,\"bproof_1\":0,\"tshirt_1\":33,\"bproof_2\":0,\"pants_2\":3,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"torso_1\":29,\"ears_1\":-1,\"decals_2\":0,\"lipstick_3\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":33,\"makeup_1\":0,\"mask_1\":0,\"helmet_2\":0,\"chain_1\":22,\"lipstick_4\":0,\"age_1\":0,\"lipstick_2\":0,\"face\":4,\"tshirt_2\":3,\"mask_2\":0,\"hair_1\":21,\"hair_color_2\":0,\"makeup_2\":0,\"eyebrows_2\":0,\"hair_color_1\":0,\"sex\":0,\"helmet_1\":-1,\"pants_1\":24,\"shoes_2\":0,\"makeup_4\":0}},{\"label\":\"Costume Blanc\",\"skin\":{\"bags_2\":0,\"beard_4\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":5,\"chain_2\":0,\"lipstick_1\":0,\"beard_1\":11,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":0,\"glasses_1\":8,\"bags_1\":0,\"skin\":11,\"shoes_1\":10,\"bproof_1\":0,\"tshirt_1\":33,\"bproof_2\":0,\"pants_2\":5,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"pants_1\":24,\"ears_1\":-1,\"decals_2\":0,\"lipstick_3\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":33,\"face\":4,\"mask_1\":0,\"helmet_2\":0,\"chain_1\":22,\"lipstick_4\":0,\"age_1\":0,\"lipstick_2\":0,\"hair_1\":21,\"tshirt_2\":5,\"mask_2\":0,\"hair_color_2\":0,\"makeup_2\":0,\"eyebrows_2\":0,\"torso_1\":29,\"hair_color_1\":0,\"sex\":0,\"helmet_1\":-1,\"makeup_1\":0,\"shoes_2\":0,\"makeup_4\":0}},{\"label\":\"Costume Marron\",\"skin\":{\"bags_2\":0,\"beard_4\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":6,\"chain_2\":9,\"lipstick_1\":0,\"beard_1\":11,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":0,\"glasses_1\":8,\"bags_1\":0,\"skin\":11,\"shoes_1\":10,\"bproof_1\":0,\"tshirt_1\":33,\"bproof_2\":0,\"pants_2\":6,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"pants_1\":24,\"ears_1\":-1,\"decals_2\":0,\"lipstick_3\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":33,\"face\":4,\"mask_1\":0,\"helmet_2\":0,\"chain_1\":22,\"lipstick_4\":0,\"age_1\":0,\"lipstick_2\":0,\"hair_1\":21,\"tshirt_2\":6,\"mask_2\":0,\"hair_color_2\":0,\"makeup_2\":0,\"eyebrows_2\":0,\"torso_1\":29,\"hair_color_1\":0,\"sex\":0,\"helmet_1\":-1,\"makeup_1\":0,\"shoes_2\":0,\"makeup_4\":0}},{\"label\":\"Travaux\",\"skin\":{\"bags_2\":0,\"beard_4\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":1,\"chain_2\":0,\"lipstick_1\":0,\"beard_1\":11,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":0,\"glasses_1\":8,\"bags_1\":0,\"skin\":11,\"shoes_1\":25,\"bproof_1\":0,\"tshirt_1\":59,\"bproof_2\":0,\"pants_2\":1,\"eyebrows_3\":0,\"age_2\":0,\"sex\":0,\"pants_1\":47,\"ears_1\":-1,\"decals_2\":0,\"lipstick_3\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":52,\"face\":4,\"mask_1\":0,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"lipstick_2\":0,\"hair_1\":21,\"tshirt_2\":0,\"mask_2\":0,\"hair_color_2\":0,\"makeup_2\":0,\"eyebrows_2\":0,\"torso_1\":97,\"glasses_2\":0,\"makeup_1\":0,\"helmet_1\":-1,\"hair_color_1\":0,\"shoes_2\":0,\"makeup_4\":0}},{\"label\":\"Sécurité\",\"skin\":{\"bags_2\":0,\"beard_4\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":0,\"chain_2\":0,\"lipstick_1\":0,\"beard_1\":11,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":0,\"glasses_1\":8,\"bags_1\":0,\"skin\":11,\"shoes_1\":25,\"bproof_1\":0,\"tshirt_1\":129,\"bproof_2\":0,\"pants_2\":0,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":6,\"hair_color_1\":0,\"ears_1\":2,\"decals_2\":0,\"lipstick_3\":0,\"decals_1\":0,\"hair_2\":3,\"arms\":31,\"makeup_1\":0,\"lipstick_2\":0,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"face\":4,\"hair_1\":21,\"tshirt_2\":0,\"mask_2\":0,\"mask_1\":0,\"hair_color_2\":0,\"makeup_2\":0,\"eyebrows_2\":10,\"torso_1\":53,\"sex\":0,\"helmet_1\":-1,\"pants_1\":33,\"shoes_2\":0,\"makeup_4\":0}},{\"label\":\"Sécurité\",\"skin\":{\"bags_2\":0,\"beard_4\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":0,\"chain_2\":0,\"lipstick_1\":0,\"beard_1\":11,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":0,\"glasses_1\":8,\"bags_1\":0,\"skin\":11,\"shoes_1\":25,\"bproof_1\":0,\"tshirt_1\":129,\"bproof_2\":0,\"pants_2\":0,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":6,\"hair_color_1\":0,\"ears_1\":2,\"decals_2\":0,\"lipstick_3\":0,\"decals_1\":0,\"hair_2\":3,\"arms\":37,\"makeup_1\":0,\"face\":4,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"torso_1\":13,\"lipstick_2\":0,\"tshirt_2\":0,\"mask_2\":0,\"mask_1\":0,\"hair_1\":21,\"hair_color_2\":0,\"makeup_2\":0,\"eyebrows_2\":10,\"pants_1\":33,\"helmet_1\":-1,\"sex\":0,\"shoes_2\":0,\"makeup_4\":0}}]}'),
(17, 'user_ears', 'steam:11000010ed15b6b', '{}'),
(18, 'user_glasses', 'steam:1100001325b7a9b', '{\"skin\":{\"glasses_2\":0,\"glasses_1\":5},\"hasGlasses\":true}'),
(19, 'user_mask', 'steam:1100001325b7a9b', '{\"hasMask\":true,\"skin\":{\"mask_2\":5,\"mask_1\":99}}'),
(20, 'property', 'steam:1100001325b7a9b', '{\"dressing\":[{\"label\":\"maillot2\",\"skin\":{\"mask_2\":0,\"beard_2\":5,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_1\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":12,\"chain_1\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":15,\"mask_1\":0,\"sex\":0,\"makeup_2\":0,\"eyebrows_4\":0,\"bproof_1\":0,\"skin\":0,\"tshirt_1\":57,\"bags_1\":0,\"glasses_2\":0,\"torso_2\":0,\"shoes_1\":34,\"torso_1\":252,\"lipstick_1\":0,\"makeup_3\":0,\"lipstick_2\":0,\"beard_4\":0,\"eyebrows_1\":0,\"shoes_2\":0,\"helmet_2\":0,\"hair_color_2\":37,\"hair_color_1\":0,\"glasses_1\":5,\"makeup_4\":0,\"pants_1\":54,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":1,\"ears_1\":-1,\"hair_1\":6,\"beard_1\":14,\"eyebrows_3\":0,\"helmet_1\":-1}},{\"label\":\"tenue blanche\",\"skin\":{\"mask_2\":0,\"beard_2\":5,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"helmet_1\":-1,\"lipstick_4\":0,\"beard_3\":0,\"face\":12,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":19,\"mask_1\":0,\"bags_1\":0,\"makeup_2\":0,\"eyebrows_4\":0,\"bproof_1\":0,\"skin\":0,\"tshirt_1\":76,\"pants_1\":49,\"glasses_2\":0,\"torso_2\":0,\"shoes_1\":40,\"lipstick_2\":0,\"torso_1\":192,\"decals_1\":0,\"makeup_3\":0,\"beard_4\":0,\"lipstick_1\":0,\"shoes_2\":4,\"helmet_2\":0,\"eyebrows_1\":0,\"hair_color_2\":37,\"glasses_1\":5,\"hair_color_1\":0,\"sex\":0,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":0,\"ears_1\":-1,\"hair_1\":6,\"beard_1\":14,\"eyebrows_3\":0,\"makeup_1\":0}},{\"label\":\"braquage colors\",\"skin\":{\"mask_2\":0,\"beard_2\":5,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"helmet_1\":-1,\"lipstick_4\":0,\"beard_3\":0,\"face\":12,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":27,\"mask_1\":0,\"bags_1\":0,\"makeup_2\":0,\"eyebrows_4\":0,\"bproof_1\":0,\"skin\":0,\"tshirt_1\":57,\"pants_1\":77,\"glasses_2\":0,\"torso_2\":3,\"shoes_1\":55,\"lipstick_2\":0,\"torso_1\":178,\"decals_1\":0,\"makeup_3\":0,\"beard_4\":0,\"lipstick_1\":0,\"shoes_2\":3,\"helmet_2\":0,\"eyebrows_1\":0,\"hair_color_2\":37,\"glasses_1\":0,\"hair_color_1\":0,\"sex\":0,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":3,\"ears_1\":-1,\"hair_1\":6,\"beard_1\":14,\"eyebrows_3\":0,\"makeup_1\":0}},{\"label\":\"police\",\"skin\":{\"mask_2\":0,\"beard_2\":5,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"helmet_1\":-1,\"lipstick_4\":0,\"beard_3\":0,\"face\":12,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":30,\"mask_1\":0,\"bags_1\":0,\"makeup_2\":0,\"eyebrows_4\":0,\"bproof_1\":0,\"skin\":0,\"tshirt_1\":58,\"pants_1\":79,\"glasses_2\":0,\"torso_2\":0,\"shoes_1\":1,\"lipstick_2\":0,\"torso_1\":55,\"decals_1\":0,\"makeup_3\":0,\"beard_4\":0,\"lipstick_1\":0,\"shoes_2\":2,\"helmet_2\":0,\"eyebrows_1\":0,\"hair_color_2\":37,\"glasses_1\":0,\"hair_color_1\":0,\"sex\":0,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":0,\"ears_1\":-1,\"hair_1\":6,\"beard_1\":14,\"eyebrows_3\":0,\"makeup_1\":0}},{\"label\":\"braquage bien\",\"skin\":{\"mask_2\":0,\"beard_2\":5,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"helmet_1\":-1,\"lipstick_4\":0,\"beard_3\":0,\"face\":12,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":30,\"mask_1\":0,\"bags_1\":0,\"makeup_2\":0,\"eyebrows_4\":0,\"bproof_1\":0,\"skin\":0,\"tshirt_1\":57,\"pants_1\":97,\"glasses_2\":7,\"torso_2\":24,\"shoes_1\":60,\"lipstick_2\":0,\"torso_1\":251,\"decals_1\":0,\"makeup_3\":0,\"beard_4\":0,\"lipstick_1\":0,\"shoes_2\":0,\"helmet_2\":0,\"eyebrows_1\":0,\"hair_color_2\":37,\"glasses_1\":5,\"hair_color_1\":0,\"sex\":0,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":24,\"ears_1\":-1,\"hair_1\":6,\"beard_1\":14,\"eyebrows_3\":0,\"makeup_1\":0}},{\"label\":\"costar bleu\",\"skin\":{\"mask_2\":0,\"beard_2\":5,\"tshirt_2\":1,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"helmet_1\":-1,\"lipstick_4\":0,\"beard_3\":0,\"face\":12,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":31,\"mask_1\":0,\"bags_1\":0,\"makeup_2\":0,\"eyebrows_4\":0,\"bproof_1\":0,\"skin\":0,\"tshirt_1\":90,\"pants_1\":49,\"glasses_2\":7,\"torso_2\":1,\"shoes_1\":40,\"lipstick_2\":0,\"torso_1\":102,\"decals_1\":0,\"makeup_3\":0,\"beard_4\":0,\"lipstick_1\":0,\"shoes_2\":9,\"helmet_2\":0,\"eyebrows_1\":0,\"hair_color_2\":37,\"glasses_1\":5,\"hair_color_1\":0,\"sex\":0,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":1,\"ears_1\":-1,\"hair_1\":6,\"beard_1\":14,\"eyebrows_3\":0,\"makeup_1\":0}},{\"label\":\"costar noir & blanc \",\"skin\":{\"mask_2\":0,\"beard_2\":5,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"helmet_1\":-1,\"lipstick_4\":0,\"beard_3\":0,\"face\":12,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":31,\"mask_1\":0,\"bags_1\":0,\"makeup_2\":0,\"eyebrows_4\":0,\"bproof_1\":0,\"skin\":0,\"tshirt_1\":90,\"pants_1\":52,\"glasses_2\":7,\"torso_2\":4,\"shoes_1\":20,\"lipstick_2\":0,\"torso_1\":183,\"decals_1\":0,\"makeup_3\":0,\"beard_4\":0,\"lipstick_1\":0,\"shoes_2\":7,\"helmet_2\":0,\"eyebrows_1\":0,\"hair_color_2\":37,\"glasses_1\":5,\"hair_color_1\":0,\"sex\":0,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":2,\"ears_1\":-1,\"hair_1\":6,\"beard_1\":14,\"eyebrows_3\":0,\"makeup_1\":0}},{\"label\":\"biker bleu\",\"skin\":{\"mask_2\":0,\"beard_2\":5,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"helmet_1\":-1,\"lipstick_4\":0,\"beard_3\":0,\"face\":12,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":30,\"mask_1\":0,\"bags_1\":0,\"makeup_2\":0,\"eyebrows_4\":0,\"bproof_1\":0,\"skin\":0,\"tshirt_1\":45,\"pants_1\":26,\"glasses_2\":7,\"torso_2\":2,\"shoes_1\":36,\"lipstick_2\":0,\"torso_1\":172,\"decals_1\":0,\"makeup_3\":0,\"beard_4\":0,\"lipstick_1\":0,\"shoes_2\":3,\"helmet_2\":0,\"eyebrows_1\":0,\"hair_color_2\":37,\"glasses_1\":5,\"hair_color_1\":0,\"sex\":0,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":4,\"ears_1\":-1,\"hair_1\":6,\"beard_1\":14,\"eyebrows_3\":0,\"makeup_1\":0}},{\"label\":\"veste pd\",\"skin\":{\"mask_2\":0,\"beard_2\":5,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"helmet_1\":-1,\"lipstick_4\":0,\"beard_3\":0,\"face\":12,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":31,\"mask_1\":0,\"bags_1\":0,\"makeup_2\":0,\"eyebrows_4\":0,\"bproof_1\":0,\"skin\":0,\"tshirt_1\":106,\"pants_1\":79,\"glasses_2\":0,\"torso_2\":3,\"shoes_1\":1,\"lipstick_2\":0,\"torso_1\":240,\"decals_1\":0,\"makeup_3\":0,\"beard_4\":0,\"lipstick_1\":0,\"shoes_2\":2,\"helmet_2\":0,\"eyebrows_1\":0,\"hair_color_2\":37,\"glasses_1\":-1,\"hair_color_1\":0,\"sex\":0,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":0,\"ears_1\":-1,\"hair_1\":6,\"beard_1\":14,\"eyebrows_3\":0,\"makeup_1\":0}},{\"label\":\"tenu civil vilette blanc\",\"skin\":{\"mask_2\":0,\"beard_2\":5,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_1\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":12,\"chain_1\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":28,\"mask_1\":0,\"sex\":0,\"makeup_2\":0,\"eyebrows_4\":0,\"bproof_1\":0,\"skin\":0,\"tshirt_1\":130,\"bags_1\":0,\"glasses_2\":0,\"torso_2\":10,\"shoes_1\":60,\"torso_1\":187,\"lipstick_1\":0,\"makeup_3\":0,\"lipstick_2\":0,\"beard_4\":0,\"eyebrows_1\":0,\"shoes_2\":0,\"helmet_2\":0,\"hair_color_2\":37,\"hair_color_1\":0,\"glasses_1\":-1,\"makeup_4\":0,\"pants_1\":79,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":0,\"ears_1\":-1,\"hair_1\":6,\"beard_1\":14,\"eyebrows_3\":0,\"helmet_1\":-1}},{\"label\":\"Anonyme\",\"skin\":{\"mask_2\":0,\"beard_2\":5,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"helmet_1\":-1,\"lipstick_4\":0,\"beard_3\":0,\"face\":12,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":28,\"mask_1\":0,\"bags_1\":0,\"makeup_2\":0,\"eyebrows_4\":0,\"bproof_1\":0,\"skin\":0,\"tshirt_1\":55,\"pants_1\":79,\"glasses_2\":0,\"torso_2\":0,\"shoes_1\":60,\"lipstick_2\":0,\"torso_1\":89,\"decals_1\":0,\"makeup_3\":0,\"beard_4\":0,\"lipstick_1\":0,\"shoes_2\":0,\"helmet_2\":0,\"eyebrows_1\":0,\"hair_color_2\":37,\"glasses_1\":-1,\"hair_color_1\":0,\"sex\":0,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":0,\"ears_1\":-1,\"hair_1\":6,\"beard_1\":14,\"eyebrows_3\":0,\"makeup_1\":0}},{\"label\":\"quartier\",\"skin\":{\"mask_2\":18,\"beard_2\":5,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"helmet_1\":-1,\"lipstick_4\":0,\"beard_3\":0,\"face\":12,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":31,\"mask_1\":112,\"bags_1\":0,\"makeup_2\":0,\"eyebrows_4\":0,\"bproof_1\":0,\"skin\":0,\"tshirt_1\":106,\"pants_1\":79,\"glasses_2\":0,\"torso_2\":4,\"shoes_1\":1,\"lipstick_2\":0,\"torso_1\":230,\"decals_1\":0,\"makeup_3\":0,\"beard_4\":0,\"lipstick_1\":0,\"shoes_2\":2,\"helmet_2\":0,\"eyebrows_1\":0,\"hair_color_2\":48,\"glasses_1\":-1,\"hair_color_1\":36,\"sex\":0,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":1,\"ears_1\":-1,\"hair_1\":6,\"beard_1\":14,\"eyebrows_3\":0,\"makeup_1\":0}},{\"label\":\"gang \",\"skin\":{\"mask_2\":7,\"beard_2\":5,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"helmet_1\":-1,\"lipstick_4\":0,\"beard_3\":0,\"face\":12,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":31,\"mask_1\":54,\"bags_1\":0,\"makeup_2\":0,\"eyebrows_4\":0,\"bproof_1\":0,\"skin\":0,\"tshirt_1\":106,\"pants_1\":79,\"glasses_2\":0,\"torso_2\":4,\"shoes_1\":1,\"lipstick_2\":0,\"torso_1\":230,\"decals_1\":0,\"makeup_3\":0,\"beard_4\":0,\"lipstick_1\":0,\"shoes_2\":2,\"helmet_2\":0,\"eyebrows_1\":0,\"hair_color_2\":48,\"glasses_1\":-1,\"hair_color_1\":36,\"sex\":0,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":0,\"ears_1\":-1,\"hair_1\":6,\"beard_1\":14,\"eyebrows_3\":0,\"makeup_1\":0}},{\"label\":\"gang1\",\"skin\":{\"mask_2\":7,\"beard_2\":8,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"helmet_1\":-1,\"lipstick_4\":0,\"beard_3\":0,\"face\":12,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":31,\"mask_1\":54,\"bags_1\":0,\"makeup_2\":0,\"eyebrows_4\":0,\"bproof_1\":0,\"skin\":11,\"tshirt_1\":106,\"pants_1\":79,\"glasses_2\":0,\"torso_2\":4,\"shoes_1\":1,\"lipstick_2\":0,\"torso_1\":230,\"decals_1\":0,\"makeup_3\":0,\"beard_4\":0,\"lipstick_1\":0,\"shoes_2\":2,\"helmet_2\":0,\"eyebrows_1\":0,\"hair_color_2\":37,\"glasses_1\":0,\"hair_color_1\":1,\"sex\":0,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":0,\"ears_1\":-1,\"hair_1\":6,\"beard_1\":14,\"eyebrows_3\":0,\"makeup_1\":0}},{\"label\":\"crips\",\"skin\":{\"mask_2\":9,\"beard_2\":8,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_1\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":0,\"chain_1\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":31,\"mask_1\":51,\"sex\":0,\"makeup_2\":0,\"eyebrows_4\":0,\"bproof_1\":0,\"skin\":19,\"tshirt_1\":106,\"bags_1\":0,\"glasses_2\":0,\"torso_2\":6,\"shoes_1\":60,\"torso_1\":230,\"lipstick_1\":0,\"makeup_3\":0,\"lipstick_2\":0,\"beard_4\":0,\"eyebrows_1\":0,\"shoes_2\":2,\"helmet_2\":0,\"hair_color_2\":37,\"hair_color_1\":1,\"glasses_1\":0,\"makeup_4\":0,\"pants_1\":59,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":5,\"ears_1\":-1,\"hair_1\":6,\"beard_1\":14,\"eyebrows_3\":0,\"helmet_1\":-1}},{\"label\":\"crips 2\",\"skin\":{\"mask_2\":9,\"beard_2\":8,\"tshirt_2\":1,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"helmet_1\":-1,\"lipstick_4\":0,\"beard_3\":0,\"face\":0,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":31,\"mask_1\":51,\"bags_1\":0,\"makeup_2\":0,\"eyebrows_4\":0,\"bproof_1\":0,\"skin\":19,\"tshirt_1\":115,\"pants_1\":59,\"glasses_2\":0,\"torso_2\":6,\"shoes_1\":60,\"lipstick_2\":0,\"torso_1\":230,\"decals_1\":0,\"makeup_3\":0,\"beard_4\":0,\"lipstick_1\":0,\"shoes_2\":2,\"helmet_2\":0,\"eyebrows_1\":0,\"hair_color_2\":37,\"glasses_1\":0,\"hair_color_1\":1,\"sex\":0,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":5,\"ears_1\":-1,\"hair_1\":6,\"beard_1\":14,\"eyebrows_3\":0,\"makeup_1\":0}},{\"label\":\"vrai crips\",\"skin\":{\"mask_2\":9,\"beard_2\":8,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_1\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":0,\"chain_1\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":17,\"mask_1\":51,\"sex\":0,\"makeup_2\":0,\"eyebrows_4\":0,\"bproof_1\":0,\"skin\":19,\"tshirt_1\":57,\"bags_1\":44,\"glasses_2\":0,\"torso_2\":11,\"shoes_1\":8,\"torso_1\":87,\"lipstick_1\":0,\"makeup_3\":0,\"lipstick_2\":0,\"beard_4\":0,\"eyebrows_1\":0,\"shoes_2\":5,\"helmet_2\":0,\"hair_color_2\":37,\"hair_color_1\":1,\"glasses_1\":0,\"makeup_4\":0,\"pants_1\":3,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":3,\"ears_1\":-1,\"hair_1\":6,\"beard_1\":14,\"eyebrows_3\":0,\"helmet_1\":-1}},{\"label\":\"tenue civil\",\"skin\":{\"mask_2\":0,\"beard_2\":8,\"tshirt_2\":0,\"ears_2\":0,\"ears_1\":-1,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_1\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":0,\"chain_1\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":28,\"mask_1\":0,\"lipstick_2\":0,\"makeup_2\":0,\"bproof_1\":0,\"eyebrows_4\":0,\"tshirt_1\":130,\"skin\":19,\"glasses_2\":0,\"bags_1\":0,\"torso_2\":10,\"shoes_1\":60,\"torso_1\":187,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_1\":79,\"lipstick_1\":0,\"beard_4\":0,\"hair_color_1\":1,\"shoes_2\":0,\"helmet_2\":0,\"hair_color_2\":37,\"makeup_4\":0,\"glasses_1\":-1,\"age_1\":0,\"helmet_1\":-1,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":0,\"sex\":0,\"hair_1\":6,\"beard_1\":14,\"eyebrows_3\":0,\"shoes\":9}},{\"label\":\"costar cartel\",\"skin\":{\"mask_2\":0,\"beard_2\":8,\"tshirt_2\":12,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_1\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":0,\"chain_1\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":31,\"mask_1\":0,\"makeup_2\":0,\"tshirt_1\":96,\"bproof_1\":0,\"eyebrows_4\":0,\"glasses_2\":7,\"skin\":19,\"lipstick_2\":0,\"bags_1\":0,\"shoes_1\":40,\"torso_1\":102,\"eyebrows_1\":0,\"makeup_3\":0,\"eyebrows_2\":0,\"makeup_4\":0,\"lipstick_1\":0,\"beard_4\":0,\"hair_color_1\":1,\"shoes_2\":9,\"helmet_2\":0,\"hair_color_2\":37,\"ears_1\":-1,\"glasses_1\":5,\"helmet_1\":-1,\"pants_1\":28,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":2,\"pants_2\":0,\"sex\":0,\"hair_1\":6,\"beard_1\":14,\"eyebrows_3\":0,\"shoes\":9}},{\"label\":\"costar cartel sans lunettes\",\"skin\":{\"mask_2\":0,\"beard_2\":8,\"tshirt_2\":12,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_1\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":0,\"chain_1\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":31,\"mask_1\":0,\"makeup_2\":0,\"tshirt_1\":96,\"bproof_1\":0,\"eyebrows_4\":0,\"glasses_2\":0,\"skin\":19,\"lipstick_2\":0,\"bags_1\":0,\"shoes_1\":40,\"torso_1\":102,\"eyebrows_1\":0,\"makeup_3\":0,\"eyebrows_2\":0,\"makeup_4\":0,\"lipstick_1\":0,\"beard_4\":0,\"hair_color_1\":61,\"shoes_2\":9,\"helmet_2\":0,\"hair_color_2\":33,\"ears_1\":-1,\"glasses_1\":0,\"helmet_1\":-1,\"pants_1\":28,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":2,\"pants_2\":0,\"sex\":0,\"hair_1\":14,\"beard_1\":14,\"eyebrows_3\":0,\"shoes\":9}},{\"label\":\"costar 1\",\"skin\":{\"mask_2\":0,\"beard_2\":8,\"tshirt_2\":0,\"ears_2\":0,\"ears_1\":-1,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_1\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":0,\"chain_1\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":31,\"mask_1\":0,\"lipstick_2\":0,\"makeup_2\":0,\"bproof_1\":0,\"eyebrows_4\":0,\"tshirt_1\":90,\"skin\":19,\"glasses_2\":7,\"bags_1\":0,\"torso_2\":2,\"shoes_1\":40,\"torso_1\":101,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_1\":28,\"lipstick_1\":0,\"beard_4\":0,\"hair_color_1\":61,\"shoes_2\":9,\"helmet_2\":0,\"hair_color_2\":33,\"makeup_4\":0,\"glasses_1\":5,\"age_1\":0,\"helmet_1\":-1,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":0,\"sex\":0,\"hair_1\":14,\"beard_1\":14,\"eyebrows_3\":0,\"shoes\":9}},{\"label\":\"costar bleu clair\",\"skin\":{\"mask_2\":0,\"beard_2\":8,\"tshirt_2\":0,\"ears_2\":0,\"ears_1\":-1,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_1\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":0,\"chain_1\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":31,\"mask_1\":0,\"lipstick_2\":0,\"makeup_2\":0,\"bproof_1\":0,\"eyebrows_4\":0,\"tshirt_1\":96,\"skin\":19,\"glasses_2\":7,\"bags_1\":0,\"torso_2\":1,\"shoes_1\":40,\"torso_1\":99,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_1\":28,\"lipstick_1\":0,\"beard_4\":0,\"hair_color_1\":61,\"shoes_2\":9,\"helmet_2\":0,\"hair_color_2\":33,\"makeup_4\":0,\"glasses_1\":5,\"age_1\":0,\"helmet_1\":-1,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":0,\"sex\":0,\"hair_1\":14,\"beard_1\":14,\"eyebrows_3\":0,\"shoes\":9}},{\"label\":\"costar anniv\",\"skin\":{\"mask_2\":0,\"beard_2\":8,\"tshirt_2\":6,\"ears_2\":0,\"ears_1\":-1,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_1\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":0,\"chain_1\":0,\"decals_1\":0,\"hair_2\":3,\"arms\":31,\"mask_1\":0,\"lipstick_2\":0,\"makeup_2\":0,\"bproof_1\":0,\"eyebrows_4\":0,\"tshirt_1\":96,\"skin\":19,\"glasses_2\":7,\"bags_1\":0,\"torso_2\":4,\"shoes_1\":20,\"torso_1\":100,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_1\":28,\"lipstick_1\":0,\"beard_4\":0,\"hair_color_1\":44,\"shoes_2\":9,\"helmet_2\":0,\"hair_color_2\":35,\"makeup_4\":0,\"glasses_1\":5,\"age_1\":0,\"helmet_1\":-1,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":7,\"sex\":0,\"hair_1\":14,\"beard_1\":14,\"eyebrows_3\":0,\"shoes\":9}},{\"label\":\"enterement\",\"skin\":{\"mask_2\":0,\"sex\":0,\"tshirt_2\":17,\"ears_2\":0,\"ears_1\":-1,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_1\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":0,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":3,\"arms\":31,\"mask_1\":0,\"makeup_2\":0,\"tshirt_1\":96,\"bproof_1\":0,\"eyebrows_4\":0,\"torso_2\":2,\"skin\":19,\"glasses_2\":7,\"pants_1\":28,\"shoes_1\":20,\"torso_1\":101,\"eyebrows_1\":0,\"lipstick_2\":0,\"age_1\":0,\"helmet_1\":-1,\"lipstick_1\":0,\"beard_4\":0,\"bags_1\":0,\"shoes_2\":7,\"helmet_2\":0,\"hair_color_1\":35,\"hair_color_2\":45,\"glasses_1\":5,\"beard_2\":8,\"decals_1\":0,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":0,\"makeup_3\":0,\"hair_1\":14,\"beard_1\":14,\"eyebrows_3\":0,\"shoes\":9}},{\"label\":\"costar enterement 2\",\"skin\":{\"mask_2\":0,\"sex\":0,\"tshirt_2\":2,\"ears_2\":0,\"ears_1\":-1,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_1\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":0,\"chain_1\":0,\"decals_1\":0,\"hair_2\":3,\"arms\":31,\"mask_1\":0,\"helmet_1\":-1,\"makeup_2\":0,\"bproof_1\":0,\"eyebrows_4\":0,\"tshirt_1\":31,\"skin\":19,\"glasses_2\":7,\"bags_1\":0,\"torso_2\":2,\"shoes_1\":20,\"lipstick_2\":0,\"beard_2\":8,\"torso_1\":102,\"pants_1\":28,\"age_1\":0,\"beard_4\":0,\"lipstick_1\":0,\"shoes_2\":7,\"helmet_2\":0,\"eyebrows_1\":0,\"hair_color_1\":35,\"glasses_1\":5,\"hair_color_2\":45,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":0,\"makeup_3\":0,\"hair_1\":14,\"beard_1\":14,\"eyebrows_3\":0,\"shoes\":9}},{\"label\":\"hallowen\",\"skin\":{\"mask_2\":0,\"beard_2\":8,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_1\":50,\"lipstick_4\":0,\"beard_3\":0,\"face\":0,\"chain_1\":0,\"decals_1\":0,\"hair_2\":3,\"arms\":20,\"mask_1\":0,\"makeup_3\":55,\"makeup_2\":10,\"bproof_1\":0,\"eyebrows_4\":0,\"tshirt_1\":76,\"skin\":4,\"glasses_2\":0,\"bags_1\":0,\"ears_1\":-1,\"shoes_1\":40,\"lipstick_2\":0,\"torso_1\":192,\"makeup_4\":29,\"eyebrows_2\":0,\"pants_1\":49,\"beard_4\":0,\"lipstick_1\":0,\"shoes_2\":4,\"helmet_2\":0,\"eyebrows_1\":0,\"hair_color_1\":28,\"glasses_1\":5,\"hair_color_2\":28,\"helmet_1\":50,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":0,\"pants_2\":0,\"sex\":0,\"hair_1\":14,\"beard_1\":14,\"eyebrows_3\":0,\"shoes\":9}},{\"label\":\"braco\",\"skin\":{\"mask_2\":0,\"beard_2\":8,\"tshirt_2\":0,\"ears_2\":0,\"ears_1\":-1,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_1\":50,\"lipstick_4\":0,\"beard_3\":0,\"face\":0,\"chain_1\":0,\"makeup_4\":29,\"hair_2\":3,\"arms\":31,\"mask_1\":0,\"age_1\":0,\"bags_1\":0,\"bproof_1\":0,\"eyebrows_4\":0,\"makeup_2\":0,\"skin\":4,\"glasses_2\":0,\"pants_1\":31,\"tshirt_1\":122,\"shoes_1\":60,\"makeup_3\":55,\"lipstick_2\":0,\"torso_1\":53,\"eyebrows_2\":0,\"helmet_1\":-1,\"beard_4\":0,\"lipstick_1\":0,\"shoes_2\":5,\"helmet_2\":0,\"eyebrows_1\":0,\"hair_color_1\":28,\"glasses_1\":-1,\"hair_color_2\":28,\"decals_1\":0,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":3,\"pants_2\":0,\"sex\":0,\"hair_1\":14,\"beard_1\":14,\"eyebrows_3\":0,\"shoes\":9}},{\"label\":\"redline\",\"skin\":{\"mask_2\":0,\"beard_2\":8,\"tshirt_2\":0,\"ears_2\":0,\"ears_1\":-1,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_1\":50,\"lipstick_4\":0,\"beard_3\":0,\"face\":0,\"chain_1\":0,\"decals_1\":0,\"hair_2\":3,\"arms\":31,\"mask_1\":0,\"bags_1\":0,\"makeup_2\":0,\"bproof_1\":0,\"eyebrows_4\":0,\"torso_2\":12,\"skin\":4,\"glasses_2\":0,\"pants_1\":26,\"makeup_3\":55,\"shoes_1\":31,\"lipstick_2\":0,\"torso_1\":200,\"tshirt_1\":57,\"lipstick_1\":0,\"makeup_4\":29,\"beard_4\":0,\"eyebrows_1\":0,\"shoes_2\":2,\"helmet_2\":0,\"hair_color_1\":28,\"hair_color_2\":28,\"glasses_1\":-1,\"helmet_1\":-1,\"age_1\":0,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":5,\"sex\":0,\"hair_1\":14,\"beard_1\":14,\"eyebrows_3\":0,\"shoes\":9}},{\"label\":\"costar sans manche\",\"skin\":{\"mask_2\":0,\"sex\":0,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"helmet_1\":-1,\"lipstick_4\":0,\"beard_3\":0,\"face\":0,\"chain_1\":0,\"makeup_4\":29,\"hair_2\":3,\"arms\":37,\"mask_1\":0,\"tshirt_1\":57,\"makeup_2\":0,\"bproof_1\":0,\"eyebrows_4\":0,\"bags_1\":0,\"skin\":4,\"glasses_2\":0,\"pants_1\":26,\"makeup_1\":50,\"shoes_1\":31,\"beard_2\":8,\"makeup_3\":55,\"lipstick_2\":0,\"torso_1\":26,\"eyebrows_2\":0,\"beard_4\":0,\"lipstick_1\":0,\"shoes_2\":2,\"helmet_2\":0,\"eyebrows_1\":0,\"hair_color_1\":28,\"glasses_1\":-1,\"hair_color_2\":28,\"decals_1\":0,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":0,\"pants_2\":0,\"ears_1\":-1,\"hair_1\":14,\"beard_1\":14,\"eyebrows_3\":0,\"shoes\":9}}],\"weapons\":[]}'),
(21, 'user_helmet', 'steam:1100001325b7a9b', '{\"hasHelmet\":true,\"skin\":{\"helmet_2\":0,\"helmet_1\":50}}'),
(22, 'user_ears', 'steam:1100001325b7a9b', '{\"skin\":{\"ears_2\":0,\"ears_1\":17},\"hasEars\":true}'),
(23, 'property', 'steam:110000111b71726', '{\"dressing\":[{\"label\":\"Classe et noir\",\"skin\":{\"hair_color_2\":54,\"hair_1\":50,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":2,\"chain_2\":0,\"hair_2\":0,\"beard_1\":10,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":0,\"glasses_1\":5,\"bags_1\":0,\"skin\":8,\"shoes_1\":10,\"bproof_1\":0,\"hair_color_1\":3,\"bproof_2\":0,\"pants_2\":0,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"bags_2\":0,\"ears_1\":-1,\"mask_1\":0,\"lipstick_3\":0,\"decals_1\":0,\"pants_1\":28,\"arms\":42,\"face\":4,\"eyebrows_2\":0,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"beard_4\":4,\"tshirt_1\":35,\"tshirt_2\":0,\"mask_2\":0,\"makeup_1\":0,\"lipstick_1\":0,\"sex\":0,\"decals_2\":0,\"lipstick_2\":0,\"torso_1\":102,\"helmet_1\":-1,\"makeup_2\":0,\"shoes_2\":0,\"makeup_4\":0}},{\"label\":\"6six9niene\",\"skin\":{\"hair_color_2\":54,\"hair_1\":50,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":9,\"chain_2\":0,\"hair_2\":0,\"beard_1\":10,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":0,\"glasses_1\":5,\"bags_1\":0,\"skin\":8,\"shoes_1\":12,\"bproof_1\":0,\"hair_color_1\":3,\"bproof_2\":0,\"pants_2\":5,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"bags_2\":0,\"ears_1\":-1,\"mask_1\":0,\"lipstick_3\":0,\"decals_1\":0,\"pants_1\":26,\"arms\":5,\"face\":4,\"eyebrows_2\":0,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"beard_4\":4,\"tshirt_1\":15,\"tshirt_2\":0,\"mask_2\":0,\"makeup_1\":0,\"lipstick_1\":0,\"sex\":0,\"decals_2\":0,\"lipstick_2\":0,\"torso_1\":200,\"helmet_1\":-1,\"makeup_2\":0,\"shoes_2\":13,\"makeup_4\":0}},{\"label\":\"Style en blanc\",\"skin\":{\"hair_color_2\":54,\"hair_1\":50,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":1,\"chain_2\":0,\"hair_2\":0,\"beard_1\":10,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":0,\"glasses_1\":5,\"bags_1\":0,\"skin\":8,\"shoes_1\":12,\"bproof_1\":0,\"hair_color_1\":3,\"bproof_2\":0,\"pants_2\":2,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"bags_2\":0,\"ears_1\":-1,\"mask_1\":0,\"lipstick_3\":0,\"decals_1\":0,\"pants_1\":4,\"arms\":6,\"face\":4,\"eyebrows_2\":0,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"beard_4\":4,\"tshirt_1\":15,\"tshirt_2\":0,\"mask_2\":0,\"makeup_1\":0,\"lipstick_1\":0,\"sex\":0,\"decals_2\":0,\"lipstick_2\":0,\"torso_1\":171,\"helmet_1\":-1,\"makeup_2\":0,\"shoes_2\":10,\"makeup_4\":0}},{\"label\":\"Styler en rouge\",\"skin\":{\"hair_color_2\":54,\"hair_1\":50,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":1,\"chain_2\":0,\"hair_2\":0,\"beard_1\":10,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":0,\"glasses_1\":5,\"bags_1\":0,\"skin\":8,\"shoes_1\":12,\"bproof_1\":0,\"hair_color_1\":3,\"bproof_2\":0,\"pants_2\":2,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"bags_2\":0,\"ears_1\":-1,\"mask_1\":0,\"lipstick_3\":0,\"decals_1\":0,\"pants_1\":4,\"arms\":11,\"face\":4,\"eyebrows_2\":0,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"beard_4\":4,\"tshirt_1\":23,\"tshirt_2\":1,\"mask_2\":0,\"makeup_1\":0,\"lipstick_1\":0,\"sex\":0,\"decals_2\":0,\"lipstick_2\":0,\"torso_1\":167,\"helmet_1\":-1,\"makeup_2\":0,\"shoes_2\":9,\"makeup_4\":0}},{\"label\":\"Basketteur\",\"skin\":{\"hair_color_2\":54,\"hair_1\":50,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":0,\"chain_2\":0,\"hair_2\":0,\"beard_1\":14,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":0,\"glasses_1\":0,\"bags_1\":0,\"skin\":8,\"shoes_1\":31,\"bproof_1\":0,\"hair_color_1\":0,\"bproof_2\":0,\"pants_2\":0,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"bags_2\":0,\"ears_1\":-1,\"mask_1\":0,\"lipstick_3\":0,\"decals_1\":0,\"pants_1\":42,\"arms\":11,\"face\":4,\"eyebrows_2\":0,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"beard_4\":4,\"tshirt_1\":15,\"tshirt_2\":0,\"mask_2\":0,\"makeup_1\":0,\"lipstick_1\":0,\"sex\":0,\"decals_2\":0,\"lipstick_2\":0,\"torso_1\":81,\"helmet_1\":56,\"makeup_2\":0,\"shoes_2\":1,\"makeup_4\":0}},{\"label\":\"Homme en noir \",\"skin\":{\"hair_color_2\":54,\"hair_1\":50,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":0,\"chain_2\":0,\"hair_2\":0,\"beard_1\":14,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":0,\"glasses_1\":5,\"bags_1\":0,\"skin\":8,\"shoes_1\":10,\"bproof_1\":0,\"tshirt_1\":31,\"bproof_2\":0,\"pants_2\":0,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"bags_2\":0,\"ears_1\":-1,\"mask_1\":0,\"lipstick_3\":0,\"decals_1\":0,\"beard_4\":4,\"arms\":44,\"face\":4,\"pants_1\":28,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"makeup_2\":0,\"eyebrows_2\":0,\"tshirt_2\":2,\"mask_2\":0,\"lipstick_2\":0,\"hair_color_1\":0,\"makeup_1\":0,\"lipstick_1\":0,\"sex\":0,\"decals_2\":0,\"helmet_1\":-1,\"torso_1\":142,\"shoes_2\":0,\"makeup_4\":0}},{\"label\":\"Negociateur\",\"skin\":{\"hair_color_2\":54,\"hair_1\":50,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":0,\"chain_2\":0,\"hair_2\":0,\"beard_1\":14,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":0,\"glasses_1\":5,\"bags_1\":0,\"skin\":8,\"shoes_1\":20,\"bproof_1\":0,\"tshirt_1\":31,\"bproof_2\":0,\"pants_2\":0,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"bags_2\":0,\"ears_1\":-1,\"mask_1\":0,\"lipstick_3\":0,\"decals_1\":0,\"eyebrows_2\":0,\"arms\":82,\"face\":4,\"pants_1\":53,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"beard_4\":4,\"makeup_2\":0,\"tshirt_2\":0,\"mask_2\":0,\"lipstick_2\":0,\"makeup_1\":0,\"hair_color_1\":0,\"lipstick_1\":0,\"sex\":0,\"decals_2\":0,\"helmet_1\":-1,\"torso_1\":104,\"shoes_2\":0,\"makeup_4\":0}},{\"label\":\"Timberland\",\"skin\":{\"hair_color_2\":54,\"hair_1\":50,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":0,\"chain_2\":0,\"hair_2\":0,\"beard_1\":14,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":4,\"glasses_1\":5,\"bags_1\":0,\"skin\":8,\"shoes_1\":12,\"bproof_1\":0,\"tshirt_1\":15,\"bproof_2\":0,\"pants_2\":2,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"bags_2\":0,\"ears_1\":-1,\"mask_1\":0,\"lipstick_3\":0,\"decals_1\":0,\"beard_4\":4,\"arms\":14,\"face\":4,\"pants_1\":4,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"makeup_2\":0,\"eyebrows_2\":10,\"tshirt_2\":0,\"mask_2\":0,\"lipstick_2\":0,\"hair_color_1\":0,\"makeup_1\":0,\"lipstick_1\":0,\"sex\":0,\"decals_2\":0,\"helmet_1\":-1,\"torso_1\":125,\"shoes_2\":0,\"makeup_4\":0}},{\"label\":\"Boum t mort\",\"skin\":{\"hair_color_2\":54,\"hair_1\":50,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":0,\"chain_2\":0,\"hair_2\":0,\"beard_1\":14,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":4,\"glasses_1\":5,\"bags_1\":0,\"skin\":8,\"shoes_1\":31,\"bproof_1\":0,\"tshirt_1\":15,\"bproof_2\":0,\"pants_2\":0,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"pants_1\":79,\"ears_1\":-1,\"mask_1\":0,\"lipstick_3\":0,\"decals_1\":0,\"makeup_2\":0,\"arms\":44,\"face\":4,\"bags_2\":0,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"eyebrows_2\":10,\"beard_4\":4,\"tshirt_2\":0,\"mask_2\":0,\"hair_color_1\":0,\"makeup_1\":0,\"lipstick_1\":0,\"sex\":0,\"decals_2\":0,\"lipstick_2\":0,\"helmet_1\":-1,\"torso_1\":224,\"shoes_2\":1,\"makeup_4\":0}},{\"label\":\"Au bain\",\"skin\":{\"bags_2\":0,\"beard_4\":4,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":0,\"chain_2\":0,\"hair_2\":0,\"beard_1\":14,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":4,\"glasses_1\":5,\"bags_1\":0,\"skin\":8,\"shoes_1\":5,\"bproof_1\":0,\"tshirt_1\":15,\"bproof_2\":0,\"pants_2\":1,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"pants_1\":54,\"ears_1\":-1,\"mask_1\":0,\"lipstick_3\":0,\"decals_1\":0,\"eyebrows_2\":10,\"arms\":15,\"face\":4,\"makeup_2\":0,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"hair_color_2\":54,\"hair_color_1\":0,\"tshirt_2\":0,\"mask_2\":0,\"makeup_1\":0,\"sex\":0,\"hair_1\":50,\"lipstick_1\":0,\"decals_2\":0,\"lipstick_2\":0,\"helmet_1\":-1,\"torso_1\":15,\"shoes_2\":2,\"makeup_4\":0}},{\"label\":\"Normal \",\"skin\":{\"makeup_2\":0,\"hair_1\":50,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":6,\"chain_2\":0,\"hair_2\":0,\"beard_1\":14,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":4,\"glasses_1\":5,\"bags_1\":0,\"skin\":8,\"shoes_1\":59,\"bproof_1\":0,\"tshirt_1\":23,\"bproof_2\":0,\"pants_2\":0,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"pants_1\":4,\"ears_1\":-1,\"decals_2\":0,\"lipstick_2\":0,\"decals_1\":0,\"eyebrows_2\":10,\"arms\":14,\"face\":4,\"torso_1\":136,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"bags_2\":0,\"sex\":0,\"tshirt_2\":1,\"mask_2\":0,\"hair_color_1\":0,\"mask_1\":0,\"makeup_1\":0,\"hair_color_2\":54,\"beard_4\":4,\"lipstick_1\":0,\"helmet_1\":-1,\"lipstick_3\":0,\"shoes_2\":20,\"makeup_4\":0}},{\"label\":\"Discret\",\"skin\":{\"makeup_2\":0,\"hair_1\":50,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":0,\"chain_2\":0,\"hair_2\":0,\"beard_1\":14,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":4,\"glasses_1\":5,\"bags_1\":0,\"skin\":8,\"shoes_1\":59,\"bproof_1\":0,\"hair_color_1\":0,\"bproof_2\":0,\"pants_2\":2,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"pants_1\":78,\"ears_1\":-1,\"decals_2\":0,\"lipstick_3\":0,\"decals_1\":0,\"hair_color_2\":54,\"arms\":14,\"face\":4,\"eyebrows_2\":10,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"bags_2\":0,\"beard_4\":4,\"tshirt_2\":1,\"mask_2\":0,\"mask_1\":0,\"tshirt_1\":24,\"makeup_1\":0,\"lipstick_1\":0,\"sex\":0,\"lipstick_2\":0,\"helmet_1\":-1,\"torso_1\":187,\"shoes_2\":20,\"makeup_4\":0}}],\"weapons\":[{\"ammo\":250,\"name\":\"WEAPON_PUMPSHOTGUN\"},{\"ammo\":232,\"name\":\"WEAPON_PUMPSHOTGUN\"},{\"ammo\":0,\"name\":\"WEAPON_PISTOL50\"},{\"ammo\":1,\"name\":\"WEAPON_APPISTOL\"},{\"ammo\":80,\"name\":\"WEAPON_APPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_CARBINERIFLE\"},{\"ammo\":248,\"name\":\"WEAPON_PISTOL50\"}]}'),
(24, 'user_helmet', 'steam:110000111b71726', '{\"hasHelmet\":true,\"skin\":{\"helmet_2\":0,\"helmet_1\":12}}'),
(25, 'user_glasses', 'steam:110000111b71726', '{}'),
(26, 'user_mask', 'steam:110000111b71726', '{\"hasMask\":true,\"skin\":{\"mask_2\":10,\"mask_1\":129}}'),
(27, 'user_ears', 'steam:110000111b71726', '{\"skin\":{\"ears_1\":4,\"ears_2\":0},\"hasEars\":true}'),
(28, 'user_ears', 'steam:110000113248a42', '{}'),
(29, 'user_glasses', 'steam:110000113248a42', '{}');
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(30, 'property', 'steam:110000113248a42', '{\"dressing\":[{\"skin\":{\"bags_1\":0,\"skin\":0,\"lipstick_3\":0,\"decals_2\":0,\"makeup_3\":0,\"bags_2\":0,\"ears_2\":0,\"lipstick_2\":0,\"beard_1\":0,\"shoes_2\":0,\"chain_2\":0,\"hair_color_2\":0,\"mask_1\":0,\"face\":0,\"pants_2\":0,\"bproof_1\":0,\"hair_1\":19,\"tshirt_2\":0,\"sex\":0,\"beard_3\":0,\"hair_2\":0,\"makeup_2\":0,\"tshirt_1\":6,\"torso_1\":25,\"ears_1\":-1,\"decals_1\":0,\"shoes_1\":10,\"torso_2\":6,\"age_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"lipstick_1\":0,\"helmet_2\":0,\"eyebrows_4\":0,\"bproof_2\":0,\"mask_2\":0,\"beard_4\":0,\"makeup_1\":0,\"lipstick_4\":0,\"arms\":0,\"helmet_1\":-1,\"age_2\":0,\"hair_color_1\":3,\"pants_1\":24,\"beard_2\":0,\"eyebrows_3\":0,\"makeup_4\":0,\"chain_1\":0,\"eyebrows_2\":0,\"glasses_1\":5},\"label\":\"baz\"},{\"skin\":{\"bags_1\":0,\"skin\":0,\"lipstick_3\":0,\"decals_2\":0,\"makeup_3\":0,\"bags_2\":0,\"ears_2\":0,\"lipstick_2\":0,\"beard_1\":0,\"shoes_2\":0,\"arms\":19,\"hair_color_2\":0,\"mask_1\":0,\"face\":0,\"pants_2\":0,\"bproof_1\":0,\"hair_1\":19,\"tshirt_2\":0,\"sex\":0,\"beard_3\":0,\"hair_2\":0,\"makeup_2\":0,\"helmet_1\":-1,\"torso_1\":66,\"ears_1\":-1,\"decals_1\":0,\"shoes_1\":24,\"tshirt_1\":15,\"age_1\":0,\"eyebrows_1\":0,\"glasses_2\":4,\"lipstick_1\":0,\"helmet_2\":0,\"eyebrows_4\":0,\"bproof_2\":0,\"torso_2\":0,\"mask_2\":0,\"makeup_1\":0,\"beard_4\":0,\"lipstick_4\":0,\"hair_color_1\":3,\"age_2\":0,\"glasses_1\":5,\"chain_2\":0,\"chain_1\":0,\"eyebrows_3\":0,\"makeup_4\":0,\"beard_2\":0,\"eyebrows_2\":0,\"pants_1\":39},\"label\":\"taf\"},{\"skin\":{\"bags_1\":0,\"skin\":0,\"lipstick_3\":0,\"decals_2\":0,\"makeup_3\":0,\"beard_4\":0,\"ears_2\":0,\"lipstick_2\":0,\"eyebrows_3\":0,\"shoes_2\":0,\"chain_2\":0,\"hair_color_2\":0,\"mask_1\":99,\"face\":0,\"pants_2\":0,\"bproof_1\":0,\"hair_1\":19,\"tshirt_2\":0,\"makeup_2\":0,\"beard_3\":0,\"hair_2\":0,\"sex\":0,\"helmet_1\":-1,\"torso_1\":66,\"ears_1\":-1,\"decals_1\":0,\"shoes_1\":24,\"torso_2\":0,\"age_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"lipstick_1\":0,\"helmet_2\":0,\"eyebrows_4\":0,\"bproof_2\":0,\"tshirt_1\":15,\"mask_2\":0,\"makeup_1\":0,\"lipstick_4\":0,\"beard_1\":0,\"bags_2\":0,\"age_2\":0,\"arms\":20,\"hair_color_1\":3,\"beard_2\":0,\"glasses_1\":5,\"makeup_4\":0,\"chain_1\":0,\"eyebrows_2\":0,\"pants_1\":39},\"label\":\"taf\"},{\"skin\":{\"bags_1\":0,\"skin\":0,\"lipstick_3\":0,\"decals_2\":0,\"makeup_3\":0,\"bags_2\":0,\"ears_2\":0,\"lipstick_2\":0,\"eyebrows_3\":0,\"shoes_2\":0,\"chain_2\":2,\"hair_color_2\":0,\"mask_1\":0,\"face\":0,\"pants_2\":0,\"bproof_1\":0,\"hair_1\":19,\"tshirt_2\":0,\"makeup_2\":0,\"age_2\":0,\"hair_2\":0,\"torso_2\":0,\"helmet_1\":-1,\"torso_1\":31,\"ears_1\":-1,\"decals_1\":0,\"shoes_1\":10,\"sex\":0,\"age_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"lipstick_1\":0,\"helmet_2\":0,\"eyebrows_4\":0,\"bproof_2\":0,\"mask_2\":0,\"beard_4\":0,\"makeup_1\":0,\"lipstick_4\":0,\"arms\":20,\"tshirt_1\":31,\"hair_color_1\":3,\"beard_3\":0,\"beard_1\":0,\"chain_1\":12,\"pants_1\":24,\"makeup_4\":0,\"glasses_1\":5,\"beard_2\":0,\"eyebrows_2\":0},\"label\":\"costar\"},{\"skin\":{\"bags_1\":0,\"skin\":0,\"lipstick_3\":0,\"decals_2\":0,\"makeup_3\":0,\"makeup_2\":0,\"ears_2\":0,\"lipstick_2\":0,\"eyebrows_3\":0,\"shoes_2\":6,\"arms\":0,\"hair_color_2\":1,\"sex\":0,\"face\":0,\"pants_2\":0,\"bproof_1\":0,\"hair_1\":9,\"tshirt_2\":0,\"bags_2\":0,\"age_2\":0,\"hair_2\":1,\"hair_color_1\":3,\"tshirt_1\":15,\"torso_1\":26,\"ears_1\":-1,\"decals_1\":0,\"shoes_1\":12,\"beard_4\":0,\"age_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"torso_2\":8,\"helmet_2\":0,\"eyebrows_4\":0,\"bproof_2\":0,\"glasses_1\":5,\"lipstick_1\":0,\"makeup_1\":0,\"mask_2\":0,\"chain_1\":0,\"eyebrows_2\":0,\"lipstick_4\":0,\"beard_1\":0,\"mask_1\":0,\"beard_3\":0,\"pants_1\":26,\"makeup_4\":0,\"helmet_1\":-1,\"beard_2\":0,\"chain_2\":0},\"label\":9}]}'),
(31, 'user_mask', 'steam:110000113248a42', '{\"skin\":{\"mask_2\":0,\"mask_1\":99},\"hasMask\":true}'),
(32, 'user_helmet', 'steam:110000113248a42', '{\"hasHelmet\":true,\"skin\":{\"helmet_2\":0,\"helmet_1\":52}}'),
(33, 'user_mask', 'steam:110000117d510a6', '{\"hasMask\":true,\"skin\":{\"mask_1\":56,\"mask_2\":1}}'),
(34, 'property', 'steam:110000117d510a6', '{\"dressing\":[{\"label\":\"gentleman1\",\"skin\":{\"lipstick_3\":0,\"lipstick_1\":0,\"bags_1\":0,\"decals_2\":0,\"beard_3\":1,\"pants_1\":24,\"shoes_1\":11,\"ears_2\":0,\"beard_4\":0,\"glasses_2\":2,\"sex\":0,\"makeup_4\":0,\"eyebrows_3\":1,\"makeup_2\":0,\"skin\":10,\"bproof_1\":0,\"mask_2\":0,\"hair_color_2\":38,\"chain_2\":0,\"shoes_2\":14,\"makeup_1\":0,\"bags_2\":0,\"helmet_1\":-1,\"makeup_3\":0,\"eyebrows_4\":0,\"hair_1\":4,\"hair_color_1\":38,\"mask_1\":0,\"torso_1\":142,\"tshirt_2\":2,\"lipstick_4\":0,\"eyebrows_1\":0,\"face\":0,\"age_1\":0,\"age_2\":0,\"beard_1\":7,\"beard_2\":7,\"eyebrows_2\":10,\"tshirt_1\":28,\"lipstick_2\":0,\"hair_2\":0,\"bproof_2\":0,\"decals_1\":0,\"helmet_2\":0,\"chain_1\":0,\"glasses_1\":5,\"pants_2\":0,\"arms\":6,\"ears_1\":-1,\"torso_2\":0}},{\"label\":\"gentleman2\",\"skin\":{\"lipstick_3\":0,\"lipstick_1\":0,\"bags_1\":0,\"decals_2\":0,\"beard_3\":1,\"pants_1\":24,\"shoes_1\":10,\"ears_2\":0,\"beard_4\":0,\"glasses_2\":2,\"sex\":0,\"makeup_4\":0,\"helmet_1\":-1,\"makeup_2\":0,\"skin\":10,\"bproof_1\":0,\"mask_2\":0,\"hair_color_2\":38,\"chain_2\":0,\"ears_1\":-1,\"makeup_1\":0,\"bags_2\":0,\"shoes_2\":14,\"makeup_3\":0,\"eyebrows_4\":0,\"hair_1\":4,\"eyebrows_3\":1,\"mask_1\":0,\"torso_1\":30,\"tshirt_2\":0,\"lipstick_4\":0,\"hair_2\":0,\"face\":0,\"beard_1\":7,\"age_2\":0,\"age_1\":0,\"beard_2\":7,\"eyebrows_2\":10,\"decals_1\":0,\"lipstick_2\":0,\"hair_color_1\":38,\"bproof_2\":0,\"tshirt_1\":35,\"helmet_2\":0,\"chain_1\":0,\"eyebrows_1\":0,\"pants_2\":0,\"arms\":6,\"glasses_1\":5,\"torso_2\":0}},{\"label\":\"street1\",\"skin\":{\"lipstick_3\":0,\"lipstick_1\":0,\"bags_1\":0,\"decals_2\":0,\"beard_3\":1,\"pants_1\":4,\"shoes_1\":1,\"ears_2\":0,\"beard_4\":0,\"glasses_2\":2,\"sex\":0,\"makeup_4\":0,\"helmet_1\":-1,\"makeup_2\":0,\"skin\":10,\"bproof_1\":0,\"mask_2\":0,\"hair_color_2\":38,\"chain_2\":0,\"ears_1\":-1,\"makeup_1\":0,\"bags_2\":0,\"shoes_2\":10,\"makeup_3\":0,\"eyebrows_4\":0,\"hair_1\":4,\"eyebrows_3\":1,\"mask_1\":0,\"torso_1\":113,\"tshirt_2\":0,\"lipstick_4\":0,\"hair_2\":0,\"face\":0,\"beard_1\":7,\"age_2\":0,\"age_1\":0,\"beard_2\":7,\"eyebrows_2\":10,\"tshirt_1\":15,\"lipstick_2\":0,\"hair_color_1\":38,\"bproof_2\":0,\"decals_1\":0,\"helmet_2\":0,\"chain_1\":0,\"glasses_1\":5,\"pants_2\":0,\"arms\":6,\"eyebrows_1\":0,\"torso_2\":0}},{\"label\":\"drogue1\",\"skin\":{\"lipstick_3\":0,\"lipstick_1\":0,\"bags_1\":45,\"decals_2\":0,\"beard_3\":1,\"pants_1\":33,\"shoes_1\":24,\"ears_2\":0,\"beard_4\":0,\"glasses_2\":4,\"sex\":0,\"makeup_4\":0,\"eyebrows_3\":1,\"makeup_2\":0,\"skin\":10,\"bproof_1\":0,\"mask_2\":2,\"hair_color_2\":38,\"chain_2\":0,\"shoes_2\":0,\"makeup_1\":0,\"bags_2\":0,\"ears_1\":-1,\"makeup_3\":0,\"eyebrows_4\":0,\"hair_1\":4,\"hair_color_1\":38,\"mask_1\":90,\"torso_1\":253,\"tshirt_2\":0,\"lipstick_4\":0,\"eyebrows_1\":0,\"face\":0,\"helmet_1\":6,\"age_2\":0,\"beard_1\":7,\"beard_2\":7,\"eyebrows_2\":10,\"tshirt_1\":15,\"age_1\":0,\"lipstick_2\":0,\"torso_2\":1,\"hair_2\":0,\"helmet_2\":1,\"chain_1\":0,\"decals_1\":0,\"pants_2\":0,\"arms\":17,\"glasses_1\":25,\"bproof_2\":0}},{\"label\":\"street cross\",\"skin\":{\"lipstick_3\":0,\"lipstick_1\":0,\"bags_1\":0,\"decals_2\":0,\"beard_3\":1,\"pants_1\":78,\"shoes_1\":31,\"ears_2\":0,\"beard_4\":0,\"glasses_2\":4,\"sex\":0,\"makeup_4\":0,\"helmet_1\":-1,\"makeup_2\":0,\"skin\":10,\"bproof_1\":0,\"mask_2\":1,\"hair_color_2\":38,\"chain_2\":0,\"ears_1\":-1,\"makeup_1\":0,\"bags_2\":0,\"shoes_2\":3,\"makeup_3\":0,\"eyebrows_4\":0,\"hair_1\":4,\"eyebrows_3\":1,\"mask_1\":56,\"torso_1\":253,\"tshirt_2\":0,\"lipstick_4\":0,\"hair_2\":0,\"face\":0,\"beard_1\":7,\"age_2\":0,\"age_1\":0,\"beard_2\":7,\"eyebrows_2\":10,\"tshirt_1\":15,\"lipstick_2\":0,\"hair_color_1\":38,\"bproof_2\":0,\"decals_1\":0,\"helmet_2\":0,\"chain_1\":0,\"glasses_1\":24,\"pants_2\":5,\"arms\":17,\"eyebrows_1\":0,\"torso_2\":8}},{\"label\":\"plage\",\"skin\":{\"lipstick_3\":0,\"lipstick_1\":0,\"bags_1\":0,\"chain_1\":0,\"beard_3\":1,\"pants_1\":16,\"shoes_1\":1,\"ears_2\":0,\"beard_4\":0,\"glasses_2\":1,\"sex\":0,\"makeup_4\":0,\"helmet_1\":-1,\"makeup_2\":0,\"skin\":10,\"bproof_1\":0,\"mask_2\":0,\"hair_color_2\":38,\"chain_2\":0,\"tshirt_1\":15,\"makeup_1\":0,\"bags_2\":0,\"torso_2\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"hair_1\":4,\"shoes_2\":15,\"mask_1\":0,\"torso_1\":15,\"tshirt_2\":0,\"lipstick_4\":0,\"eyebrows_1\":0,\"face\":0,\"hair_color_1\":38,\"age_2\":0,\"decals_2\":0,\"beard_2\":7,\"eyebrows_2\":10,\"decals_1\":0,\"beard_1\":7,\"eyebrows_3\":1,\"bproof_2\":0,\"age_1\":0,\"helmet_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"pants_2\":3,\"arms\":15,\"glasses_1\":5,\"ears_1\":-1}}]}'),
(35, 'user_ears', 'steam:110000117d510a6', '{}'),
(36, 'user_glasses', 'steam:110000117d510a6', '{\"skin\":{\"glasses_2\":2,\"glasses_1\":5},\"hasGlasses\":true}'),
(37, 'user_helmet', 'steam:110000117d510a6', '{\"skin\":{\"helmet_1\":6,\"helmet_2\":1},\"hasHelmet\":true}'),
(43, 'user_ears', 'steam:11000010ede2397', '{}'),
(44, 'user_glasses', 'steam:11000010ede2397', '{}'),
(45, 'user_helmet', 'steam:11000010ede2397', '{}'),
(46, 'user_mask', 'steam:11000010ede2397', '{\"skin\":{\"mask_2\":5,\"mask_1\":99},\"hasMask\":true}'),
(47, 'property', 'steam:11000010ede2397', '{\"dressing\":[{\"skin\":{\"mask_1\":0,\"lipstick_4\":0,\"makeup_4\":0,\"eyebrows_2\":10,\"tshirt_1\":21,\"bags_1\":0,\"eyebrows_3\":0,\"beard_1\":10,\"decals_2\":0,\"makeup_2\":0,\"face\":0,\"chain_2\":2,\"hair_color_2\":0,\"sex\":0,\"chain_1\":12,\"eyebrows_1\":0,\"hair_2\":0,\"bproof_1\":0,\"hair_1\":19,\"pants_2\":0,\"arms\":17,\"mask_2\":0,\"lipstick_2\":0,\"makeup_1\":0,\"ears_2\":0,\"lipstick_1\":0,\"decals_1\":0,\"torso_2\":1,\"helmet_1\":-1,\"bproof_2\":0,\"shoes_1\":10,\"glasses_1\":5,\"helmet_2\":0,\"glasses_2\":5,\"lipstick_3\":0,\"tshirt_2\":4,\"ears_1\":2,\"age_1\":0,\"pants_1\":24,\"skin\":0,\"makeup_3\":0,\"bags_2\":0,\"hair_color_1\":29,\"eyebrows_4\":0,\"beard_2\":10,\"age_2\":0,\"torso_1\":142,\"shoes_2\":0,\"beard_4\":0,\"beard_3\":0},\"label\":\"Col roulé\"},{\"skin\":{\"mask_1\":0,\"lipstick_4\":0,\"makeup_4\":0,\"eyebrows_2\":10,\"bproof_1\":0,\"bags_1\":0,\"eyebrows_3\":0,\"arms\":17,\"decals_2\":0,\"makeup_2\":0,\"face\":0,\"chain_2\":0,\"hair_color_2\":0,\"sex\":0,\"chain_1\":0,\"eyebrows_1\":0,\"hair_2\":0,\"beard_1\":10,\"hair_1\":19,\"pants_2\":3,\"mask_2\":0,\"makeup_1\":0,\"lipstick_2\":0,\"ears_2\":0,\"helmet_1\":-1,\"lipstick_1\":0,\"decals_1\":0,\"torso_2\":3,\"beard_3\":0,\"glasses_1\":10,\"shoes_1\":25,\"helmet_2\":0,\"tshirt_1\":15,\"glasses_2\":5,\"lipstick_3\":0,\"bproof_2\":0,\"ears_1\":2,\"age_1\":0,\"pants_1\":39,\"skin\":0,\"bags_2\":0,\"shoes_2\":0,\"hair_color_1\":29,\"eyebrows_4\":0,\"beard_2\":10,\"tshirt_2\":0,\"torso_1\":66,\"age_2\":0,\"beard_4\":0,\"makeup_3\":0},\"label\":\"Illegal\"},{\"skin\":{\"mask_1\":99,\"lipstick_4\":0,\"makeup_4\":0,\"eyebrows_2\":10,\"tshirt_1\":15,\"glasses_2\":5,\"eyebrows_3\":0,\"beard_1\":10,\"decals_2\":0,\"makeup_2\":0,\"face\":0,\"chain_2\":0,\"hair_color_2\":0,\"sex\":0,\"chain_1\":0,\"eyebrows_1\":0,\"hair_2\":0,\"glasses_1\":10,\"hair_1\":19,\"pants_2\":1,\"helmet_2\":0,\"arms\":17,\"mask_2\":5,\"makeup_1\":0,\"lipstick_2\":0,\"ears_2\":0,\"decals_1\":0,\"torso_2\":1,\"beard_3\":0,\"helmet_1\":-1,\"shoes_1\":25,\"lipstick_1\":0,\"bproof_2\":0,\"tshirt_2\":0,\"lipstick_3\":0,\"bproof_1\":0,\"bags_1\":0,\"age_1\":0,\"pants_1\":39,\"ears_1\":2,\"skin\":0,\"bags_2\":0,\"hair_color_1\":29,\"eyebrows_4\":0,\"beard_2\":10,\"makeup_3\":0,\"shoes_2\":0,\"beard_4\":0,\"age_2\":0,\"torso_1\":66},\"label\":\"Illégal bon\"}]}'),
(48, 'user_ears', 'steam:11000011230bca7', '{}'),
(49, 'user_glasses', 'steam:11000011230bca7', '{}'),
(50, 'user_helmet', 'steam:11000011230bca7', '{}'),
(51, 'user_mask', 'steam:11000011230bca7', '{}'),
(52, 'property', 'steam:11000011230bca7', '{}'),
(53, 'property', 'steam:11000010719503b', '{\"dressing\":[{\"label\":\"Civil 1\",\"skin\":{\"eyebrows_1\":2,\"hair_2\":0,\"age_2\":0,\"face\":21,\"glasses_2\":0,\"chain_2\":0,\"lipstick_1\":0,\"hair_color_1\":15,\"glasses_1\":5,\"helmet_2\":0,\"eyebrows_2\":10,\"tshirt_2\":1,\"skin\":0,\"ears_1\":-1,\"mask_1\":0,\"tshirt_1\":13,\"makeup_3\":0,\"decals_2\":0,\"torso_2\":1,\"makeup_2\":10,\"eyebrows_3\":17,\"bags_1\":0,\"lipstick_3\":20,\"lipstick_2\":10,\"hair_color_2\":29,\"bproof_2\":0,\"torso_1\":64,\"arms\":1,\"lipstick_4\":0,\"bags_2\":0,\"ears_2\":0,\"beard_1\":0,\"beard_2\":0,\"bproof_1\":0,\"eyebrows_4\":0,\"hair_1\":4,\"makeup_1\":3,\"shoes_1\":7,\"helmet_1\":-1,\"mask_2\":0,\"beard_3\":0,\"pants_2\":10,\"shoes_2\":0,\"beard_4\":0,\"sex\":1,\"decals_1\":0,\"pants_1\":0,\"age_1\":0,\"chain_1\":0,\"makeup_4\":0}},{\"label\":\"BRAQUAGE !!!\",\"skin\":{\"eyebrows_1\":2,\"hair_2\":0,\"age_2\":0,\"face\":21,\"glasses_2\":1,\"chain_2\":0,\"lipstick_1\":0,\"hair_color_1\":15,\"glasses_1\":7,\"helmet_2\":0,\"eyebrows_4\":0,\"tshirt_2\":0,\"skin\":0,\"ears_1\":-1,\"mask_1\":99,\"tshirt_1\":2,\"makeup_3\":0,\"decals_2\":0,\"torso_2\":0,\"makeup_2\":10,\"eyebrows_3\":17,\"bags_1\":0,\"sex\":1,\"torso_1\":60,\"hair_color_2\":29,\"lipstick_2\":10,\"lipstick_3\":20,\"lipstick_4\":0,\"beard_1\":0,\"bags_2\":0,\"ears_2\":0,\"eyebrows_2\":10,\"beard_2\":0,\"chain_1\":0,\"hair_1\":4,\"bproof_2\":0,\"makeup_1\":3,\"shoes_1\":25,\"helmet_1\":-1,\"mask_2\":0,\"arms\":3,\"pants_2\":0,\"shoes_2\":0,\"beard_3\":0,\"beard_4\":0,\"decals_1\":0,\"pants_1\":39,\"age_1\":0,\"bproof_1\":0,\"makeup_4\":0}},{\"label\":\"Strip Tease\",\"skin\":{\"eyebrows_1\":2,\"hair_2\":0,\"age_2\":0,\"face\":21,\"glasses_2\":0,\"chain_2\":0,\"lipstick_1\":0,\"hair_color_1\":15,\"glasses_1\":5,\"helmet_2\":0,\"eyebrows_2\":10,\"tshirt_2\":0,\"skin\":0,\"ears_1\":-1,\"mask_1\":0,\"tshirt_1\":2,\"makeup_3\":0,\"decals_2\":0,\"torso_2\":2,\"makeup_2\":10,\"eyebrows_3\":17,\"bags_1\":0,\"shoes_1\":41,\"sex\":1,\"hair_color_2\":29,\"lipstick_2\":10,\"torso_1\":22,\"bproof_2\":0,\"lipstick_3\":20,\"bags_2\":0,\"ears_2\":0,\"beard_1\":0,\"beard_2\":0,\"chain_1\":0,\"arms\":15,\"hair_1\":4,\"makeup_1\":3,\"beard_3\":0,\"helmet_1\":-1,\"mask_2\":0,\"lipstick_4\":0,\"pants_2\":2,\"shoes_2\":4,\"eyebrows_4\":0,\"bproof_1\":0,\"decals_1\":0,\"pants_1\":20,\"age_1\":0,\"beard_4\":0,\"makeup_4\":0}},{\"label\":\"Ecoliere\",\"skin\":{\"eyebrows_1\":2,\"hair_2\":0,\"age_2\":0,\"face\":21,\"glasses_2\":0,\"chain_2\":0,\"lipstick_1\":0,\"hair_color_1\":15,\"glasses_1\":5,\"helmet_2\":0,\"eyebrows_4\":0,\"tshirt_2\":0,\"skin\":0,\"ears_1\":-1,\"mask_1\":0,\"tshirt_1\":2,\"makeup_3\":0,\"decals_2\":0,\"torso_2\":0,\"makeup_2\":10,\"eyebrows_3\":17,\"bags_1\":0,\"eyebrows_2\":10,\"makeup_4\":0,\"hair_color_2\":29,\"lipstick_2\":10,\"torso_1\":74,\"lipstick_3\":20,\"arms\":4,\"bags_2\":0,\"ears_2\":0,\"beard_1\":0,\"beard_2\":0,\"chain_1\":0,\"hair_1\":4,\"bproof_2\":0,\"makeup_1\":3,\"shoes_1\":0,\"helmet_1\":-1,\"mask_2\":0,\"lipstick_4\":0,\"pants_2\":1,\"shoes_2\":0,\"beard_3\":0,\"beard_4\":0,\"decals_1\":0,\"pants_1\":12,\"age_1\":0,\"bproof_1\":0,\"sex\":1}},{\"label\":\"Cuir\",\"skin\":{\"hair_1\":4,\"hair_2\":0,\"age_2\":0,\"face\":21,\"glasses_2\":0,\"chain_2\":0,\"lipstick_1\":0,\"hair_color_1\":15,\"glasses_1\":5,\"helmet_2\":0,\"eyebrows_2\":10,\"tshirt_2\":0,\"skin\":0,\"ears_1\":-1,\"mask_1\":0,\"tshirt_1\":2,\"makeup_3\":0,\"decals_2\":0,\"torso_2\":0,\"makeup_2\":10,\"eyebrows_3\":17,\"bags_1\":0,\"lipstick_3\":20,\"makeup_4\":0,\"hair_color_2\":29,\"lipstick_2\":10,\"torso_1\":262,\"eyebrows_1\":2,\"beard_1\":0,\"bags_2\":0,\"ears_2\":0,\"bproof_2\":0,\"beard_2\":0,\"chain_1\":0,\"arms\":7,\"lipstick_4\":0,\"makeup_1\":3,\"beard_3\":0,\"helmet_1\":-1,\"mask_2\":0,\"shoes_1\":77,\"pants_2\":0,\"shoes_2\":0,\"beard_4\":0,\"bproof_1\":0,\"decals_1\":0,\"pants_1\":43,\"age_1\":0,\"eyebrows_4\":0,\"sex\":1}},{\"label\":\"Soft\",\"skin\":{\"eyebrows_1\":2,\"hair_2\":0,\"age_2\":0,\"face\":21,\"glasses_2\":0,\"chain_2\":0,\"lipstick_1\":0,\"hair_color_1\":15,\"glasses_1\":5,\"helmet_2\":0,\"eyebrows_4\":0,\"tshirt_2\":0,\"skin\":0,\"ears_1\":-1,\"mask_1\":0,\"tshirt_1\":2,\"makeup_3\":0,\"decals_2\":0,\"beard_4\":0,\"makeup_2\":10,\"eyebrows_3\":17,\"bags_1\":0,\"torso_2\":0,\"beard_3\":0,\"lipstick_3\":20,\"lipstick_2\":10,\"makeup_4\":0,\"torso_1\":117,\"bproof_2\":0,\"bags_2\":0,\"ears_2\":0,\"beard_1\":0,\"beard_2\":0,\"bproof_1\":0,\"arms\":11,\"hair_1\":4,\"makeup_1\":3,\"shoes_1\":43,\"helmet_1\":-1,\"mask_2\":0,\"lipstick_4\":0,\"pants_2\":4,\"shoes_2\":3,\"eyebrows_2\":10,\"hair_color_2\":29,\"decals_1\":0,\"pants_1\":74,\"age_1\":0,\"chain_1\":0,\"sex\":1}}]}'),
(54, 'user_mask', 'steam:11000010719503b', '{\"skin\":{\"mask_2\":0,\"mask_1\":99},\"hasMask\":true}'),
(55, 'user_glasses', 'steam:11000010719503b', '{\"hasGlasses\":true,\"skin\":{\"glasses_1\":7,\"glasses_2\":1}}'),
(56, 'user_ears', 'steam:11000010719503b', '{}'),
(57, 'user_helmet', 'steam:11000010719503b', '{}'),
(58, 'user_ears', 'steam:11000013491dae7', '{}'),
(59, 'user_helmet', 'steam:11000013491dae7', '{\"skin\":{\"helmet_1\":49,\"helmet_2\":0},\"hasHelmet\":true}'),
(60, 'user_glasses', 'steam:11000013491dae7', '{\"hasGlasses\":true,\"skin\":{\"glasses_1\":25,\"glasses_2\":4}}'),
(61, 'user_mask', 'steam:11000013491dae7', '{\"hasMask\":true,\"skin\":{\"mask_1\":90,\"mask_2\":2}}'),
(62, 'property', 'steam:11000013491dae7', '{\"dressing\":[{\"label\":\"moto\",\"skin\":{\"lipstick_3\":0,\"lipstick_1\":0,\"bags_1\":0,\"decals_2\":0,\"beard_3\":0,\"pants_1\":31,\"shoes_1\":24,\"ears_2\":0,\"beard_4\":0,\"glasses_2\":0,\"sex\":0,\"glasses_1\":5,\"helmet_1\":-1,\"makeup_2\":0,\"skin\":1,\"shoes_2\":0,\"mask_2\":0,\"hair_color_2\":53,\"chain_2\":0,\"bproof_1\":0,\"makeup_1\":0,\"bags_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"hair_1\":33,\"beard_1\":10,\"mask_1\":0,\"torso_1\":49,\"tshirt_2\":0,\"lipstick_4\":0,\"eyebrows_1\":0,\"face\":2,\"hair_2\":0,\"age_2\":0,\"age_1\":0,\"beard_2\":10,\"eyebrows_2\":10,\"decals_1\":0,\"lipstick_2\":0,\"tshirt_1\":15,\"torso_2\":0,\"hair_color_1\":0,\"helmet_2\":0,\"chain_1\":0,\"ears_1\":-1,\"pants_2\":0,\"arms\":4,\"bproof_2\":0,\"makeup_4\":0}},{\"label\":\"narnar\",\"skin\":{\"lipstick_3\":0,\"lipstick_1\":0,\"bags_1\":45,\"decals_2\":0,\"beard_3\":0,\"pants_1\":33,\"shoes_1\":24,\"ears_2\":0,\"beard_4\":0,\"glasses_2\":4,\"sex\":0,\"glasses_1\":25,\"helmet_1\":6,\"makeup_2\":0,\"skin\":1,\"shoes_2\":0,\"mask_2\":2,\"hair_color_2\":53,\"chain_2\":0,\"bproof_1\":0,\"makeup_1\":0,\"bags_2\":0,\"lipstick_2\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"hair_1\":33,\"beard_1\":10,\"mask_1\":90,\"torso_1\":253,\"tshirt_2\":0,\"lipstick_4\":0,\"hair_2\":0,\"face\":2,\"eyebrows_3\":0,\"age_2\":0,\"age_1\":0,\"beard_2\":10,\"eyebrows_2\":10,\"tshirt_1\":15,\"decals_1\":0,\"chain_1\":0,\"torso_2\":1,\"ears_1\":-1,\"helmet_2\":1,\"eyebrows_1\":0,\"hair_color_1\":0,\"pants_2\":0,\"arms\":17,\"bproof_2\":0,\"makeup_4\":0}},{\"label\":\"plage\",\"skin\":{\"lipstick_3\":0,\"lipstick_1\":0,\"bags_1\":0,\"chain_1\":0,\"beard_3\":0,\"pants_1\":16,\"shoes_1\":34,\"ears_2\":0,\"beard_4\":0,\"glasses_2\":0,\"sex\":0,\"makeup_4\":0,\"eyebrows_3\":0,\"makeup_2\":0,\"skin\":1,\"bproof_1\":0,\"mask_2\":0,\"hair_color_2\":53,\"chain_2\":0,\"helmet_1\":-1,\"makeup_1\":0,\"bags_2\":0,\"hair_2\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"hair_1\":33,\"shoes_2\":0,\"mask_1\":0,\"torso_1\":15,\"tshirt_2\":0,\"lipstick_4\":0,\"eyebrows_1\":0,\"face\":2,\"age_1\":0,\"age_2\":0,\"beard_1\":10,\"beard_2\":10,\"eyebrows_2\":10,\"decals_1\":0,\"lipstick_2\":0,\"tshirt_1\":15,\"bproof_2\":0,\"torso_2\":0,\"helmet_2\":0,\"decals_2\":0,\"hair_color_1\":0,\"pants_2\":3,\"arms\":15,\"glasses_1\":5,\"ears_1\":-1}}]}'),
(63, 'user_ears', 'steam:110000131d556ee', '{}'),
(64, 'user_glasses', 'steam:110000131d556ee', '{\"skin\":{\"glasses_1\":9,\"glasses_2\":0},\"hasGlasses\":true}'),
(65, 'user_helmet', 'steam:110000131d556ee', '{\"hasHelmet\":true,\"skin\":{\"helmet_1\":52,\"helmet_2\":0}}'),
(66, 'user_mask', 'steam:110000131d556ee', '{\"skin\":{\"mask_1\":129,\"mask_2\":0},\"hasMask\":true}'),
(67, 'property', 'steam:110000131d556ee', '{\"dressing\":[{\"skin\":{\"bproof_2\":0,\"makeup_3\":0,\"pants_1\":79,\"sex\":0,\"mask_2\":0,\"shoes_1\":59,\"hair_2\":0,\"ears_2\":0,\"lipstick_2\":0,\"hair_color_2\":0,\"helmet_2\":20,\"beard_1\":0,\"torso_2\":0,\"beard_4\":0,\"chain_2\":0,\"bags_1\":0,\"tshirt_1\":101,\"age_1\":0,\"decals_1\":0,\"torso_1\":181,\"makeup_2\":0,\"arms\":19,\"glasses_1\":5,\"bags_2\":0,\"decals_2\":0,\"pants_2\":0,\"bproof_1\":0,\"lipstick_1\":0,\"chain_1\":0,\"hair_1\":19,\"makeup_4\":0,\"eyebrows_2\":0,\"tshirt_2\":22,\"helmet_1\":105,\"lipstick_4\":0,\"ears_1\":-1,\"shoes_2\":20,\"beard_2\":0,\"eyebrows_3\":0,\"eyebrows_4\":0,\"face\":44,\"glasses_2\":5,\"lipstick_3\":0,\"makeup_1\":0,\"skin\":1,\"age_2\":0,\"hair_color_1\":8,\"beard_3\":0,\"mask_1\":0,\"eyebrows_1\":0},\"label\":\"roger\"},{\"skin\":{\"bproof_2\":0,\"makeup_3\":0,\"pants_1\":12,\"sex\":0,\"mask_2\":0,\"shoes_1\":69,\"hair_2\":0,\"makeup_4\":0,\"mask_1\":0,\"hair_color_2\":0,\"helmet_2\":0,\"beard_1\":0,\"torso_2\":0,\"beard_4\":0,\"chain_2\":0,\"bags_1\":0,\"tshirt_1\":130,\"age_1\":0,\"lipstick_3\":0,\"pants_2\":0,\"makeup_2\":0,\"age_2\":0,\"lipstick_1\":0,\"ears_2\":0,\"decals_2\":0,\"helmet_1\":-1,\"bproof_1\":0,\"lipstick_4\":0,\"chain_1\":0,\"hair_1\":19,\"torso_1\":15,\"eyebrows_2\":0,\"tshirt_2\":0,\"face\":44,\"arms\":51,\"decals_1\":0,\"ears_1\":-1,\"beard_2\":0,\"eyebrows_3\":0,\"eyebrows_4\":0,\"glasses_1\":0,\"bags_2\":0,\"shoes_2\":0,\"lipstick_2\":0,\"skin\":1,\"makeup_1\":0,\"hair_color_1\":8,\"beard_3\":0,\"glasses_2\":0,\"eyebrows_1\":0},\"label\":\"pepouse\"},{\"skin\":{\"bproof_2\":0,\"makeup_3\":0,\"pants_1\":71,\"sex\":0,\"mask_2\":0,\"shoes_1\":25,\"hair_2\":0,\"makeup_4\":0,\"mask_1\":0,\"hair_color_2\":0,\"helmet_2\":0,\"beard_1\":0,\"torso_2\":0,\"beard_4\":0,\"chain_2\":0,\"bags_1\":0,\"tshirt_1\":125,\"age_1\":0,\"lipstick_3\":0,\"pants_2\":0,\"makeup_2\":0,\"age_2\":0,\"lipstick_1\":0,\"ears_2\":0,\"decals_2\":0,\"helmet_1\":50,\"bproof_1\":0,\"lipstick_4\":0,\"chain_1\":0,\"hair_1\":19,\"torso_1\":224,\"eyebrows_2\":0,\"tshirt_2\":0,\"face\":44,\"arms\":19,\"decals_1\":0,\"ears_1\":-1,\"beard_2\":0,\"eyebrows_3\":0,\"eyebrows_4\":0,\"glasses_1\":0,\"bags_2\":0,\"shoes_2\":0,\"lipstick_2\":0,\"skin\":1,\"makeup_1\":0,\"hair_color_1\":8,\"beard_3\":0,\"glasses_2\":0,\"eyebrows_1\":0},\"label\":\"taff\"},{\"skin\":{\"bproof_2\":0,\"makeup_3\":0,\"pants_1\":26,\"sex\":0,\"mask_2\":0,\"shoes_1\":59,\"lipstick_4\":0,\"makeup_4\":0,\"lipstick_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"beard_1\":0,\"torso_2\":20,\"beard_4\":0,\"face\":44,\"lipstick_1\":0,\"tshirt_1\":95,\"age_1\":0,\"decals_1\":0,\"bags_1\":0,\"makeup_2\":0,\"arms\":19,\"glasses_1\":18,\"pants_2\":0,\"decals_2\":0,\"ears_2\":0,\"bproof_1\":0,\"chain_1\":0,\"hair_1\":19,\"helmet_1\":-1,\"torso_1\":191,\"eyebrows_2\":0,\"tshirt_2\":1,\"bags_2\":0,\"ears_1\":-1,\"shoes_2\":25,\"chain_2\":0,\"beard_2\":0,\"glasses_2\":6,\"eyebrows_4\":0,\"mask_1\":0,\"age_2\":0,\"makeup_1\":0,\"eyebrows_1\":0,\"skin\":1,\"eyebrows_3\":0,\"hair_color_1\":8,\"beard_3\":0,\"lipstick_3\":0,\"hair_2\":0},\"label\":\"gtr\"},{\"skin\":{\"bproof_2\":0,\"makeup_3\":0,\"pants_1\":59,\"sex\":0,\"mask_2\":0,\"shoes_1\":27,\"hair_2\":0,\"ears_2\":0,\"lipstick_2\":0,\"hair_color_2\":0,\"helmet_2\":5,\"beard_1\":18,\"torso_2\":5,\"beard_4\":0,\"chain_2\":0,\"bags_1\":0,\"tshirt_1\":57,\"age_1\":0,\"decals_1\":0,\"torso_1\":84,\"makeup_2\":0,\"arms\":20,\"glasses_1\":8,\"bags_2\":0,\"decals_2\":0,\"pants_2\":2,\"bproof_1\":0,\"lipstick_1\":0,\"chain_1\":0,\"hair_1\":19,\"makeup_4\":0,\"eyebrows_2\":10,\"tshirt_2\":0,\"helmet_1\":14,\"lipstick_4\":0,\"ears_1\":-1,\"shoes_2\":0,\"beard_2\":9,\"eyebrows_3\":0,\"eyebrows_4\":0,\"face\":44,\"glasses_2\":0,\"lipstick_3\":0,\"makeup_1\":5,\"skin\":8,\"age_2\":0,\"hair_color_1\":17,\"beard_3\":26,\"mask_1\":0,\"eyebrows_1\":0},\"label\":\"ganggggg\"},{\"skin\":{\"bproof_2\":0,\"makeup_3\":0,\"pants_1\":33,\"sex\":0,\"mask_2\":0,\"shoes_1\":27,\"hair_2\":0,\"ears_2\":0,\"lipstick_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"beard_1\":18,\"torso_2\":11,\"beard_4\":0,\"chain_2\":0,\"bags_1\":0,\"tshirt_1\":53,\"age_1\":0,\"decals_1\":0,\"eyebrows_1\":0,\"makeup_2\":0,\"age_2\":0,\"glasses_1\":0,\"eyebrows_4\":0,\"decals_2\":0,\"lipstick_1\":0,\"pants_2\":0,\"makeup_4\":0,\"chain_1\":0,\"bproof_1\":0,\"hair_1\":19,\"eyebrows_2\":10,\"tshirt_2\":0,\"helmet_1\":-1,\"lipstick_4\":0,\"face\":44,\"ears_1\":-1,\"beard_2\":9,\"eyebrows_3\":0,\"torso_1\":88,\"arms\":20,\"shoes_2\":0,\"glasses_2\":0,\"lipstick_3\":0,\"skin\":8,\"makeup_1\":5,\"hair_color_1\":17,\"beard_3\":26,\"mask_1\":0,\"bags_2\":0},\"label\":\"gangi\"},{\"skin\":{\"bproof_2\":0,\"makeup_3\":0,\"pants_1\":3,\"sex\":0,\"mask_2\":0,\"shoes_1\":8,\"hair_2\":0,\"ears_2\":0,\"lipstick_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"beard_1\":18,\"torso_2\":11,\"beard_4\":0,\"chain_2\":0,\"arms\":20,\"tshirt_1\":53,\"age_1\":0,\"decals_1\":0,\"bags_1\":0,\"makeup_2\":0,\"age_2\":0,\"lipstick_1\":0,\"eyebrows_1\":0,\"decals_2\":0,\"torso_1\":88,\"pants_2\":3,\"face\":44,\"chain_1\":0,\"bproof_1\":0,\"hair_1\":19,\"eyebrows_2\":10,\"tshirt_2\":0,\"makeup_4\":0,\"helmet_1\":-1,\"ears_1\":-1,\"lipstick_4\":0,\"beard_2\":9,\"eyebrows_3\":0,\"eyebrows_4\":0,\"glasses_1\":0,\"shoes_2\":5,\"glasses_2\":0,\"makeup_1\":5,\"skin\":8,\"bags_2\":0,\"hair_color_1\":37,\"beard_3\":26,\"mask_1\":14,\"lipstick_3\":0},\"label\":\"ga\"},{\"skin\":{\"bproof_2\":0,\"makeup_3\":0,\"pants_1\":26,\"sex\":0,\"mask_2\":0,\"shoes_1\":59,\"hair_2\":0,\"makeup_4\":0,\"lipstick_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"beard_1\":18,\"torso_2\":5,\"beard_4\":0,\"face\":44,\"lipstick_4\":0,\"tshirt_1\":60,\"age_1\":0,\"decals_1\":0,\"bags_1\":0,\"makeup_2\":0,\"arms\":19,\"lipstick_1\":0,\"eyebrows_1\":0,\"decals_2\":0,\"pants_2\":0,\"bproof_1\":0,\"ears_2\":0,\"chain_1\":0,\"hair_1\":19,\"torso_1\":192,\"eyebrows_2\":10,\"tshirt_2\":0,\"helmet_1\":-1,\"bags_2\":0,\"ears_1\":-1,\"glasses_1\":17,\"beard_2\":9,\"glasses_2\":7,\"eyebrows_4\":0,\"eyebrows_3\":0,\"shoes_2\":20,\"chain_2\":0,\"age_2\":0,\"skin\":8,\"makeup_1\":5,\"hair_color_1\":37,\"beard_3\":26,\"mask_1\":0,\"lipstick_3\":0},\"label\":\"MAMA\"},{\"skin\":{\"bproof_2\":0,\"makeup_3\":0,\"pants_1\":59,\"sex\":0,\"mask_2\":0,\"shoes_1\":27,\"hair_2\":0,\"makeup_4\":0,\"lipstick_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"beard_1\":18,\"torso_2\":0,\"beard_4\":0,\"chain_2\":0,\"bags_1\":0,\"tshirt_1\":57,\"helmet_1\":-1,\"lipstick_3\":0,\"pants_2\":9,\"makeup_2\":0,\"age_2\":0,\"glasses_1\":0,\"ears_2\":0,\"shoes_2\":0,\"face\":44,\"bproof_1\":0,\"chain_1\":0,\"hair_1\":40,\"lipstick_1\":0,\"torso_1\":50,\"eyebrows_2\":10,\"tshirt_2\":0,\"arms\":19,\"decals_2\":0,\"decals_1\":0,\"ears_1\":-1,\"beard_2\":9,\"eyebrows_3\":0,\"eyebrows_4\":0,\"lipstick_4\":0,\"eyebrows_1\":0,\"age_1\":0,\"makeup_1\":5,\"skin\":8,\"mask_1\":0,\"hair_color_1\":26,\"beard_3\":26,\"glasses_2\":0,\"bags_2\":0},\"label\":\"ano\"},{\"skin\":{\"bproof_2\":0,\"makeup_3\":0,\"pants_1\":24,\"sex\":0,\"mask_2\":0,\"shoes_1\":20,\"makeup_1\":5,\"ears_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"helmet_2\":0,\"beard_1\":18,\"torso_2\":5,\"beard_4\":0,\"face\":44,\"hair_1\":40,\"tshirt_1\":25,\"age_1\":0,\"lipstick_3\":0,\"bags_1\":0,\"makeup_2\":0,\"age_2\":0,\"lipstick_1\":0,\"makeup_4\":0,\"shoes_2\":0,\"pants_2\":6,\"bproof_1\":0,\"eyebrows_4\":0,\"arms\":79,\"hair_color_2\":0,\"decals_2\":0,\"eyebrows_2\":10,\"tshirt_2\":5,\"helmet_1\":-1,\"lipstick_4\":0,\"hair_2\":0,\"decals_1\":0,\"beard_2\":9,\"glasses_2\":0,\"torso_1\":24,\"glasses_1\":0,\"chain_2\":0,\"ears_1\":-1,\"mask_1\":0,\"skin\":8,\"bags_2\":0,\"hair_color_1\":26,\"beard_3\":26,\"eyebrows_3\":0,\"eyebrows_1\":0},\"label\":\"style\"}]}'),
(68, 'user_mask', 'steam:110000119ac453f', '{\"hasMask\":true,\"skin\":{\"mask_2\":5,\"mask_1\":101}}'),
(69, 'user_helmet', 'steam:110000119ac453f', '{\"hasHelmet\":true,\"skin\":{\"helmet_2\":1,\"helmet_1\":12}}'),
(70, 'property', 'steam:110000119ac453f', '{\"dressing\":[{\"skin\":{\"mask_2\":0,\"beard_2\":0,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_2\":0,\"bproof_1\":0,\"beard_3\":0,\"face\":12,\"chain_1\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":17,\"mask_1\":0,\"eyebrows_2\":0,\"ears_1\":-1,\"torso_1\":50,\"pants_1\":28,\"skin\":4,\"lipstick_1\":0,\"bags_1\":0,\"helmet_1\":-1,\"makeup_1\":0,\"lipstick_2\":0,\"shoes_1\":26,\"shoes_2\":1,\"eyebrows_1\":0,\"hair_color_1\":26,\"beard_4\":0,\"lipstick_4\":0,\"makeup_3\":0,\"helmet_2\":0,\"hair_color_2\":1,\"eyebrows_4\":0,\"glasses_1\":5,\"sex\":0,\"decals_2\":0,\"glasses_2\":2,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":0,\"pants_2\":0,\"tshirt_1\":57,\"hair_1\":14,\"beard_1\":0,\"eyebrows_3\":0,\"makeup_4\":0},\"label\":\"Trkl\"},{\"skin\":{\"mask_2\":0,\"beard_2\":0,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_1\":0,\"bproof_1\":0,\"beard_3\":0,\"face\":12,\"chain_1\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":17,\"mask_1\":0,\"eyebrows_2\":0,\"ears_1\":-1,\"eyebrows_4\":0,\"pants_1\":3,\"skin\":8,\"hair_color_1\":0,\"bags_1\":0,\"hair_color_2\":41,\"makeup_2\":0,\"shoes_2\":5,\"lipstick_2\":0,\"helmet_1\":-1,\"eyebrows_1\":0,\"lipstick_1\":0,\"beard_4\":0,\"lipstick_4\":0,\"makeup_3\":0,\"helmet_2\":0,\"shoes_1\":8,\"torso_1\":87,\"glasses_1\":5,\"decals_2\":0,\"sex\":0,\"glasses_2\":2,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":11,\"pants_2\":3,\"tshirt_1\":57,\"hair_1\":14,\"beard_1\":0,\"eyebrows_3\":0,\"makeup_4\":0},\"label\":\"CRIPZ\"},{\"skin\":{\"mask_2\":0,\"beard_2\":0,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_1\":29,\"bproof_1\":0,\"beard_3\":0,\"face\":0,\"chain_1\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":17,\"mask_1\":0,\"eyebrows_2\":0,\"ears_1\":-1,\"eyebrows_4\":0,\"pants_1\":3,\"skin\":8,\"hair_color_1\":37,\"bags_1\":0,\"hair_color_2\":37,\"makeup_2\":0,\"shoes_2\":2,\"lipstick_2\":0,\"helmet_1\":-1,\"eyebrows_1\":0,\"lipstick_1\":0,\"beard_4\":0,\"lipstick_4\":0,\"makeup_3\":0,\"helmet_2\":0,\"shoes_1\":8,\"torso_1\":200,\"glasses_1\":5,\"decals_2\":0,\"sex\":0,\"glasses_2\":2,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":2,\"pants_2\":2,\"tshirt_1\":57,\"hair_1\":14,\"beard_1\":0,\"eyebrows_3\":0,\"makeup_4\":0},\"label\":\"JSDFDS\"},{\"skin\":{\"mask_2\":0,\"beard_2\":0,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_1\":29,\"lipstick_4\":0,\"beard_3\":37,\"face\":0,\"chain_1\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":17,\"mask_1\":0,\"eyebrows_2\":10,\"ears_1\":-1,\"pants_1\":31,\"eyebrows_4\":0,\"lipstick_1\":0,\"skin\":8,\"makeup_2\":0,\"bags_1\":0,\"makeup_4\":0,\"lipstick_2\":0,\"decals_2\":0,\"shoes_2\":1,\"eyebrows_1\":0,\"shoes_1\":35,\"bproof_1\":0,\"beard_4\":0,\"hair_color_1\":37,\"makeup_3\":0,\"helmet_2\":0,\"torso_1\":53,\"hair_color_2\":37,\"glasses_1\":5,\"tshirt_1\":57,\"sex\":0,\"glasses_2\":2,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":3,\"pants_2\":4,\"helmet_1\":-1,\"hair_1\":14,\"beard_1\":3,\"eyebrows_3\":0,\"shoes\":9},\"label\":\"lo\"},{\"skin\":{\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":5,\"ears_2\":0,\"age_1\":0,\"tshirt_1\":72,\"chain_2\":0,\"age_2\":0,\"makeup_1\":29,\"lipstick_4\":0,\"beard_3\":0,\"face\":0,\"chain_1\":0,\"decals_1\":0,\"hair_2\":3,\"arms\":75,\"mask_1\":0,\"eyebrows_2\":10,\"ears_1\":-1,\"bags_2\":0,\"hair_color_2\":28,\"hair_color_1\":28,\"skin\":8,\"makeup_4\":0,\"pants_1\":28,\"makeup_2\":0,\"helmet_1\":-1,\"lipstick_2\":0,\"decals_2\":0,\"shoes_2\":3,\"eyebrows_1\":16,\"eyebrows_4\":0,\"beard_4\":0,\"lipstick_1\":0,\"makeup_3\":0,\"helmet_2\":0,\"torso_1\":140,\"bags_1\":0,\"glasses_1\":5,\"sex\":0,\"bproof_1\":0,\"glasses_2\":2,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":1,\"pants_2\":8,\"shoes_1\":20,\"hair_1\":14,\"beard_1\":3,\"eyebrows_3\":0,\"shoes\":9},\"label\":\"Cartel\"},{\"skin\":{\"mask_2\":4,\"beard_2\":10,\"tshirt_2\":5,\"ears_2\":0,\"age_1\":0,\"tshirt_1\":72,\"chain_2\":0,\"age_2\":0,\"makeup_2\":0,\"bproof_1\":0,\"beard_3\":0,\"face\":0,\"chain_1\":0,\"decals_1\":0,\"hair_2\":3,\"arms\":75,\"mask_1\":99,\"eyebrows_2\":10,\"ears_1\":-1,\"bags_2\":0,\"hair_color_2\":28,\"lipstick_1\":0,\"skin\":8,\"lipstick_4\":0,\"bags_1\":0,\"helmet_1\":-1,\"glasses_2\":2,\"lipstick_2\":0,\"pants_1\":28,\"helmet_2\":0,\"hair_color_1\":28,\"makeup_3\":0,\"beard_4\":0,\"makeup_4\":0,\"shoes_2\":3,\"eyebrows_1\":16,\"eyebrows_4\":0,\"torso_1\":140,\"glasses_1\":0,\"decals_2\":0,\"sex\":0,\"shoes_1\":20,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":1,\"pants_2\":8,\"makeup_1\":29,\"hair_1\":14,\"beard_1\":3,\"eyebrows_3\":0,\"shoes\":9},\"label\":\"DRG\"},{\"skin\":{\"mask_2\":4,\"beard_2\":10,\"tshirt_2\":3,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_2\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":0,\"chain_1\":0,\"decals_1\":0,\"hair_2\":3,\"arms\":96,\"mask_1\":99,\"eyebrows_2\":10,\"ears_1\":-1,\"helmet_1\":-1,\"hair_color_2\":28,\"lipstick_1\":0,\"skin\":8,\"bproof_1\":0,\"bags_1\":0,\"tshirt_1\":72,\"glasses_2\":3,\"lipstick_2\":0,\"torso_1\":140,\"shoes_2\":0,\"eyebrows_1\":16,\"makeup_1\":29,\"beard_4\":0,\"makeup_4\":0,\"makeup_3\":0,\"helmet_2\":0,\"hair_color_1\":28,\"eyebrows_4\":0,\"glasses_1\":5,\"pants_1\":28,\"decals_2\":0,\"shoes_1\":21,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":6,\"pants_2\":0,\"sex\":0,\"hair_1\":14,\"beard_1\":3,\"eyebrows_3\":0,\"shoes\":9},\"label\":\"PD\"},{\"skin\":{\"mask_2\":4,\"beard_2\":10,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_2\":0,\"bproof_1\":0,\"beard_3\":0,\"face\":0,\"chain_1\":0,\"decals_1\":0,\"hair_2\":3,\"arms\":77,\"mask_1\":99,\"eyebrows_2\":10,\"ears_1\":-1,\"pants_1\":28,\"hair_color_2\":28,\"hair_color_1\":28,\"skin\":8,\"lipstick_4\":0,\"bags_1\":45,\"tshirt_1\":31,\"shoes_1\":8,\"lipstick_2\":0,\"makeup_1\":50,\"helmet_1\":-1,\"eyebrows_1\":16,\"shoes_2\":0,\"beard_4\":0,\"lipstick_1\":0,\"makeup_3\":0,\"helmet_2\":0,\"eyebrows_4\":0,\"torso_1\":134,\"glasses_1\":0,\"sex\":0,\"decals_2\":0,\"glasses_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":2,\"pants_2\":8,\"makeup_4\":29,\"hair_1\":14,\"beard_1\":3,\"eyebrows_3\":0,\"shoes\":9},\"label\":\"kldkld\"},{\"skin\":{\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":5,\"ears_2\":0,\"age_1\":0,\"tshirt_1\":33,\"chain_2\":0,\"age_2\":0,\"helmet_1\":-1,\"bproof_1\":0,\"beard_3\":0,\"face\":0,\"chain_1\":0,\"decals_1\":0,\"hair_2\":3,\"arms\":75,\"mask_1\":0,\"eyebrows_2\":10,\"ears_1\":-1,\"bags_2\":0,\"torso_1\":76,\"hair_color_1\":28,\"skin\":8,\"makeup_1\":50,\"bags_1\":0,\"makeup_2\":0,\"shoes_1\":20,\"lipstick_2\":0,\"makeup_4\":29,\"helmet_2\":0,\"makeup_3\":0,\"lipstick_4\":0,\"beard_4\":0,\"lipstick_1\":0,\"shoes_2\":3,\"eyebrows_1\":16,\"hair_color_2\":28,\"eyebrows_4\":0,\"glasses_1\":5,\"pants_1\":28,\"decals_2\":0,\"glasses_2\":2,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":3,\"pants_2\":8,\"sex\":0,\"hair_1\":14,\"beard_1\":3,\"eyebrows_3\":0,\"shoes\":9},\"label\":\"mdfdlks\"},{\"skin\":{\"mask_2\":5,\"beard_2\":10,\"tshirt_2\":0,\"ears_2\":0,\"ears_1\":-1,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_1\":50,\"bproof_1\":0,\"beard_3\":0,\"face\":0,\"chain_1\":0,\"decals_1\":0,\"hair_2\":3,\"arms\":30,\"mask_1\":101,\"sex\":0,\"eyebrows_2\":10,\"decals_2\":0,\"hair_color_2\":28,\"lipstick_1\":0,\"skin\":8,\"hair_color_1\":28,\"bags_1\":0,\"shoes_2\":1,\"tshirt_1\":57,\"makeup_2\":0,\"lipstick_2\":0,\"helmet_1\":-1,\"shoes_1\":49,\"eyebrows_1\":16,\"beard_4\":0,\"lipstick_4\":0,\"makeup_3\":0,\"helmet_2\":0,\"age_1\":0,\"torso_1\":0,\"glasses_1\":5,\"makeup_4\":29,\"pants_1\":15,\"glasses_2\":2,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":1,\"pants_2\":15,\"eyebrows_4\":0,\"hair_1\":14,\"beard_1\":3,\"eyebrows_3\":0,\"shoes\":9},\"label\":\"zz\"}]}'),
(71, 'user_glasses', 'steam:110000119ac453f', '{\"hasGlasses\":true,\"skin\":{\"glasses_2\":5,\"glasses_1\":5}}'),
(72, 'user_ears', 'steam:110000119ac453f', '{\"hasEars\":true,\"skin\":{\"ears_1\":11,\"ears_2\":1}}'),
(73, 'user_ears', 'steam:110000134626eca', '{\"skin\":{\"ears_1\":0,\"ears_2\":0},\"hasEars\":true}'),
(74, 'property', 'steam:110000134626eca', '{\"dressing\":[{\"label\":1,\"skin\":{\"glasses_2\":7,\"mask_2\":0,\"pants_2\":0,\"decals_1\":0,\"eyebrows_4\":0,\"makeup_1\":0,\"chain_1\":0,\"tshirt_2\":0,\"bproof_2\":0,\"age_2\":0,\"beard_4\":0,\"shoes_2\":0,\"hair_color_1\":0,\"beard_2\":10,\"bproof_1\":0,\"shoes_1\":24,\"lipstick_4\":0,\"sex\":0,\"hair_color_2\":19,\"helmet_2\":0,\"beard_1\":10,\"hair_1\":11,\"lipstick_2\":0,\"arms\":1,\"age_1\":0,\"glasses_1\":18,\"lipstick_3\":0,\"tshirt_1\":23,\"eyebrows_2\":0,\"chain_2\":0,\"mask_1\":0,\"hair_2\":0,\"eyebrows_1\":0,\"torso_1\":62,\"ears_1\":-1,\"bags_2\":0,\"eyebrows_3\":0,\"makeup_2\":0,\"skin\":5,\"torso_2\":0,\"beard_3\":0,\"makeup_3\":0,\"ears_2\":0,\"decals_2\":0,\"lipstick_1\":0,\"pants_1\":31,\"face\":2,\"helmet_1\":-1,\"makeup_4\":0,\"bags_1\":0}},{\"label\":\"avocat\",\"skin\":{\"glasses_2\":7,\"mask_2\":0,\"pants_2\":0,\"decals_1\":0,\"eyebrows_4\":0,\"makeup_1\":0,\"chain_1\":0,\"tshirt_2\":0,\"bproof_2\":0,\"age_2\":0,\"beard_4\":0,\"shoes_2\":0,\"face\":2,\"beard_2\":10,\"bproof_1\":0,\"shoes_1\":10,\"lipstick_4\":0,\"sex\":0,\"hair_color_2\":19,\"age_1\":0,\"mask_1\":0,\"hair_1\":11,\"lipstick_2\":0,\"arms\":1,\"hair_2\":0,\"beard_1\":10,\"lipstick_3\":0,\"tshirt_1\":31,\"eyebrows_2\":0,\"chain_2\":0,\"skin\":5,\"glasses_1\":18,\"helmet_2\":0,\"eyebrows_3\":0,\"ears_1\":-1,\"bags_2\":0,\"eyebrows_1\":0,\"makeup_2\":0,\"torso_1\":31,\"torso_2\":0,\"beard_3\":0,\"makeup_3\":0,\"ears_2\":0,\"decals_2\":0,\"lipstick_1\":0,\"pants_1\":28,\"hair_color_1\":0,\"helmet_1\":-1,\"makeup_4\":0,\"bags_1\":0}},{\"label\":\"procés\",\"skin\":{\"glasses_2\":7,\"mask_2\":0,\"pants_2\":0,\"decals_1\":0,\"eyebrows_4\":0,\"makeup_1\":0,\"chain_1\":0,\"tshirt_2\":0,\"bproof_2\":0,\"age_2\":0,\"lipstick_4\":0,\"shoes_2\":0,\"hair_color_1\":0,\"beard_2\":10,\"bproof_1\":0,\"shoes_1\":10,\"age_1\":0,\"sex\":0,\"hair_color_2\":19,\"skin\":5,\"beard_1\":10,\"hair_1\":11,\"mask_1\":0,\"arms\":4,\"hair_2\":0,\"lipstick_2\":0,\"lipstick_3\":0,\"tshirt_1\":31,\"eyebrows_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"beard_4\":0,\"glasses_1\":18,\"eyebrows_1\":0,\"ears_1\":-1,\"bags_2\":0,\"torso_1\":29,\"makeup_2\":0,\"decals_2\":0,\"torso_2\":0,\"beard_3\":0,\"makeup_3\":0,\"ears_2\":0,\"helmet_2\":0,\"lipstick_1\":0,\"pants_1\":28,\"face\":2,\"helmet_1\":-1,\"makeup_4\":0,\"bags_1\":0}}]}'),
(75, 'user_glasses', 'steam:110000134626eca', '{\"skin\":{\"glasses_2\":7,\"glasses_1\":18},\"hasGlasses\":true}'),
(76, 'user_helmet', 'steam:110000134626eca', '{\"skin\":{\"helmet_1\":52,\"helmet_2\":0},\"hasHelmet\":true}'),
(77, 'user_mask', 'steam:110000134626eca', '{}'),
(78, 'property', 'steam:1100001196b3017', '{\"dressing\":[{\"skin\":{\"glasses_2\":1,\"lipstick_4\":0,\"eyebrows_2\":10,\"skin\":0,\"decals_2\":0,\"glasses_1\":5,\"mask_1\":0,\"eyebrows_3\":0,\"arms\":1,\"eyebrows_4\":0,\"makeup_1\":0,\"lipstick_3\":0,\"bproof_2\":0,\"makeup_2\":0,\"shoes_1\":7,\"beard_3\":0,\"eyebrows_1\":0,\"beard_4\":0,\"decals_1\":0,\"torso_1\":136,\"bproof_1\":0,\"hair_color_1\":0,\"helmet_1\":-1,\"tshirt_2\":0,\"torso_2\":6,\"hair_2\":0,\"age_2\":0,\"beard_1\":11,\"bags_2\":0,\"bags_1\":0,\"makeup_3\":0,\"chain_2\":0,\"chain_1\":53,\"mask_2\":0,\"sex\":0,\"tshirt_1\":23,\"age_1\":0,\"makeup_4\":0,\"pants_2\":0,\"pants_1\":24,\"face\":4,\"beard_2\":10,\"shoes_2\":0,\"helmet_2\":0,\"lipstick_1\":0,\"hair_color_2\":0,\"lipstick_2\":0,\"hair_1\":33,\"ears_1\":-1,\"ears_2\":0},\"label\":\"BG\"}]}'),
(79, 'user_mask', 'steam:1100001196b3017', '{}'),
(80, 'user_ears', 'steam:1100001196b3017', '{}'),
(81, 'user_helmet', 'steam:1100001196b3017', '{}'),
(82, 'user_glasses', 'steam:1100001196b3017', '{}'),
(83, 'user_ears', 'steam:11000010f7f9504', '{}'),
(84, 'user_glasses', 'steam:11000010f7f9504', '{}'),
(85, 'user_mask', 'steam:11000010f7f9504', '{}'),
(86, 'user_helmet', 'steam:11000010f7f9504', '{}'),
(87, 'property', 'steam:11000010f7f9504', '{\"dressing\":[{\"label\":\"Police\",\"skin\":{\"mask_1\":0,\"decals_1\":0,\"pants_1\":10,\"torso_2\":0,\"skin\":0,\"torso_1\":55,\"bproof_1\":0,\"glasses_1\":4,\"arms\":41,\"beard_2\":0,\"mask_2\":0,\"beard_4\":0,\"ears_2\":0,\"helmet_1\":-1,\"lipstick_1\":0,\"bproof_2\":0,\"shoes_2\":0,\"lipstick_4\":0,\"helmet_2\":0,\"hair_color_2\":0,\"bags_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"lipstick_2\":0,\"tshirt_1\":58,\"age_2\":0,\"face\":0,\"makeup_2\":0,\"makeup_1\":0,\"eyebrows_1\":0,\"eyebrows_3\":0,\"eyebrows_2\":0,\"chain_1\":0,\"hair_color_1\":0,\"beard_3\":0,\"chain_2\":0,\"tshirt_2\":0,\"decals_2\":0,\"beard_1\":0,\"lipstick_3\":0,\"hair_1\":11,\"bags_2\":0,\"age_1\":0,\"shoes_1\":10,\"sex\":0,\"pants_2\":0,\"makeup_3\":0,\"ears_1\":-1,\"hair_2\":0}}]}'),
(88, 'user_mask', 'steam:11000010d17d505', '{}'),
(89, 'user_glasses', 'steam:11000010d17d505', '{}'),
(90, 'property', 'steam:11000010d17d505', '{}'),
(91, 'user_helmet', 'steam:11000010d17d505', '{}'),
(92, 'user_ears', 'steam:11000010d17d505', '{}'),
(93, 'user_helmet', 'steam:11000010cb4181f', '{}'),
(94, 'user_ears', 'steam:11000010cb4181f', '{}'),
(95, 'property', 'steam:11000010cb4181f', '{\"dressing\":[{\"label\":\"Special\",\"skin\":{\"beard_2\":0,\"hair_2\":4,\"skin\":4,\"eyebrows_1\":0,\"tshirt_2\":0,\"lipstick_1\":0,\"age_1\":0,\"decals_2\":0,\"glasses_1\":5,\"ears_2\":0,\"chain_2\":0,\"lipstick_3\":0,\"mask_2\":0,\"shoes_2\":0,\"bproof_1\":0,\"torso_1\":53,\"ears_1\":-1,\"decals_1\":0,\"hair_1\":14,\"shoes_1\":25,\"bags_1\":0,\"bags_2\":0,\"arms\":1,\"pants_1\":33,\"lipstick_4\":0,\"makeup_4\":0,\"sex\":0,\"eyebrows_3\":0,\"beard_4\":0,\"helmet_2\":0,\"age_2\":0,\"hair_color_2\":0,\"helmet_1\":-1,\"makeup_3\":0,\"torso_2\":0,\"hair_color_1\":1,\"beard_3\":0,\"glasses_2\":5,\"tshirt_1\":15,\"pants_2\":0,\"bproof_2\":0,\"makeup_1\":0,\"lipstick_2\":0,\"chain_1\":0,\"eyebrows_4\":0,\"beard_1\":0,\"mask_1\":0,\"eyebrows_2\":0,\"makeup_2\":0,\"face\":2}},{\"label\":\"6xi9ine\",\"skin\":{\"beard_2\":0,\"hair_2\":4,\"skin\":4,\"glasses_2\":7,\"tshirt_2\":0,\"makeup_3\":0,\"age_1\":0,\"decals_2\":0,\"glasses_1\":5,\"ears_2\":0,\"chain_2\":0,\"lipstick_3\":0,\"mask_2\":0,\"shoes_2\":0,\"bproof_1\":0,\"torso_1\":200,\"ears_1\":-1,\"decals_1\":0,\"hair_1\":14,\"shoes_1\":29,\"bags_1\":0,\"bags_2\":0,\"arms\":1,\"tshirt_1\":15,\"lipstick_4\":0,\"makeup_4\":0,\"sex\":0,\"eyebrows_3\":0,\"beard_4\":0,\"helmet_1\":-1,\"age_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"chain_1\":0,\"beard_3\":0,\"hair_color_1\":1,\"eyebrows_1\":0,\"torso_2\":12,\"eyebrows_2\":0,\"pants_2\":1,\"bproof_2\":0,\"makeup_1\":0,\"lipstick_2\":0,\"pants_1\":78,\"eyebrows_4\":0,\"beard_1\":0,\"mask_1\":0,\"lipstick_1\":0,\"makeup_2\":0,\"face\":2}},{\"label\":\"Costume\",\"skin\":{\"beard_2\":0,\"hair_2\":4,\"skin\":4,\"glasses_2\":1,\"tshirt_2\":0,\"chain_1\":0,\"age_1\":0,\"decals_2\":0,\"glasses_1\":5,\"ears_2\":0,\"chain_2\":0,\"lipstick_3\":0,\"mask_2\":0,\"shoes_2\":0,\"bproof_1\":0,\"torso_1\":30,\"ears_1\":-1,\"decals_1\":0,\"hair_1\":14,\"shoes_1\":10,\"bags_1\":0,\"bags_2\":0,\"arms\":1,\"helmet_1\":-1,\"lipstick_4\":0,\"makeup_4\":0,\"sex\":0,\"eyebrows_3\":0,\"beard_4\":0,\"helmet_2\":0,\"age_2\":0,\"hair_color_2\":0,\"eyebrows_1\":0,\"beard_3\":0,\"eyebrows_2\":0,\"hair_color_1\":1,\"torso_2\":0,\"tshirt_1\":35,\"makeup_3\":0,\"pants_2\":0,\"bproof_2\":0,\"makeup_1\":0,\"lipstick_2\":0,\"lipstick_1\":0,\"eyebrows_4\":0,\"beard_1\":0,\"mask_1\":0,\"pants_1\":24,\"makeup_2\":0,\"face\":2}},{\"label\":\"Normal\",\"skin\":{\"beard_2\":0,\"hair_2\":4,\"skin\":4,\"glasses_2\":1,\"tshirt_2\":10,\"lipstick_1\":0,\"age_1\":0,\"decals_2\":0,\"glasses_1\":5,\"ears_2\":0,\"beard_3\":0,\"lipstick_3\":0,\"mask_2\":0,\"shoes_2\":1,\"face\":2,\"torso_1\":70,\"ears_1\":-1,\"decals_1\":0,\"hair_1\":14,\"shoes_1\":31,\"bags_1\":0,\"bags_2\":0,\"arms\":1,\"pants_1\":78,\"helmet_1\":-1,\"makeup_4\":0,\"sex\":0,\"lipstick_4\":0,\"beard_4\":0,\"eyebrows_1\":0,\"age_2\":0,\"hair_color_2\":0,\"eyebrows_2\":0,\"helmet_2\":0,\"makeup_3\":0,\"hair_color_1\":1,\"eyebrows_3\":0,\"torso_2\":11,\"chain_1\":0,\"pants_2\":2,\"bproof_2\":0,\"makeup_1\":0,\"lipstick_2\":0,\"tshirt_1\":26,\"eyebrows_4\":0,\"beard_1\":0,\"mask_1\":0,\"chain_2\":0,\"makeup_2\":0,\"bproof_1\":0}}]}'),
(96, 'user_glasses', 'steam:11000010cb4181f', '{}'),
(97, 'user_mask', 'steam:11000010cb4181f', '{\"hasMask\":true,\"skin\":{\"mask_2\":4,\"mask_1\":16}}'),
(98, 'user_glasses', 'steam:11000011a59b3fc', '{}'),
(99, 'user_helmet', 'steam:11000011a59b3fc', '{}'),
(100, 'user_mask', 'steam:11000011a59b3fc', '{}'),
(101, 'property', 'steam:11000011a59b3fc', '{\"dressing\":[{\"skin\":{\"glasses_2\":1,\"lipstick_4\":0,\"eyebrows_2\":10,\"skin\":4,\"chain_1\":0,\"glasses_1\":11,\"mask_1\":0,\"eyebrows_3\":0,\"arms\":14,\"eyebrows_4\":0,\"makeup_1\":0,\"lipstick_3\":19,\"sex\":1,\"makeup_2\":0,\"shoes_1\":1,\"mask_2\":0,\"shoes_2\":0,\"bproof_2\":0,\"eyebrows_1\":2,\"torso_1\":14,\"bproof_1\":0,\"hair_color_1\":0,\"helmet_1\":-1,\"pants_2\":15,\"beard_4\":0,\"hair_2\":0,\"age_2\":0,\"beard_1\":0,\"tshirt_1\":2,\"bags_1\":0,\"makeup_3\":0,\"chain_2\":0,\"hair_1\":4,\"beard_3\":0,\"decals_2\":0,\"makeup_4\":0,\"torso_2\":0,\"lipstick_1\":1,\"helmet_2\":0,\"pants_1\":11,\"face\":45,\"beard_2\":0,\"bags_2\":0,\"ears_2\":0,\"age_1\":0,\"hair_color_2\":0,\"lipstick_2\":10,\"decals_1\":0,\"ears_1\":-1,\"tshirt_2\":0},\"label\":\"Lacoste\"}]}'),
(102, 'user_ears', 'steam:11000011a59b3fc', '{}'),
(103, 'user_ears', 'steam:110000104cf5aeb', '{}'),
(104, 'user_glasses', 'steam:110000104cf5aeb', '{}'),
(105, 'user_helmet', 'steam:110000104cf5aeb', '{}'),
(106, 'user_mask', 'steam:110000104cf5aeb', '{}'),
(107, 'property', 'steam:110000104cf5aeb', '{}'),
(108, 'user_ears', 'steam:11000010d819702', '{}'),
(109, 'user_glasses', 'steam:11000010d819702', '{}'),
(110, 'user_helmet', 'steam:11000010d819702', '{}'),
(111, 'property', 'steam:11000010d819702', '{}'),
(112, 'user_mask', 'steam:11000010d819702', '{}'),
(113, 'property', 'steam:11000010032f30a', '{\"dressing\":[{\"skin\":{\"mask_1\":99,\"lipstick_4\":0,\"makeup_4\":0,\"eyebrows_2\":0,\"tshirt_1\":36,\"glasses_2\":0,\"eyebrows_3\":0,\"beard_1\":5,\"decals_2\":0,\"makeup_2\":0,\"face\":0,\"chain_2\":0,\"hair_color_2\":0,\"sex\":0,\"chain_1\":0,\"eyebrows_1\":0,\"hair_2\":0,\"lipstick_2\":0,\"hair_1\":21,\"pants_2\":0,\"mask_2\":4,\"arms\":0,\"helmet_2\":0,\"makeup_3\":0,\"ears_2\":0,\"lipstick_1\":0,\"decals_1\":0,\"torso_2\":0,\"helmet_1\":-1,\"bproof_1\":0,\"shoes_1\":9,\"glasses_1\":0,\"beard_4\":0,\"bags_2\":0,\"lipstick_3\":0,\"tshirt_2\":0,\"ears_1\":-1,\"age_1\":0,\"pants_1\":4,\"skin\":0,\"age_2\":0,\"bags_1\":0,\"hair_color_1\":12,\"eyebrows_4\":0,\"beard_2\":10,\"makeup_1\":0,\"shoes_2\":0,\"bproof_2\":0,\"beard_3\":0,\"torso_1\":112},\"label\":\"Tenue Basique / Froid\"},{\"skin\":{\"mask_1\":99,\"lipstick_4\":0,\"makeup_4\":0,\"eyebrows_2\":0,\"tshirt_1\":15,\"glasses_2\":0,\"eyebrows_3\":0,\"beard_1\":5,\"decals_2\":0,\"makeup_2\":0,\"face\":0,\"chain_2\":0,\"hair_color_2\":0,\"sex\":0,\"chain_1\":0,\"eyebrows_1\":0,\"hair_2\":0,\"lipstick_2\":0,\"hair_1\":21,\"pants_2\":2,\"mask_2\":4,\"arms\":17,\"helmet_1\":-1,\"bproof_1\":0,\"ears_2\":0,\"lipstick_1\":0,\"decals_1\":0,\"torso_2\":2,\"makeup_3\":0,\"glasses_1\":0,\"shoes_1\":35,\"age_2\":0,\"makeup_1\":0,\"bags_2\":0,\"lipstick_3\":0,\"bags_1\":0,\"ears_1\":-1,\"tshirt_2\":0,\"pants_1\":39,\"skin\":0,\"bproof_2\":0,\"age_1\":0,\"hair_color_1\":12,\"eyebrows_4\":0,\"beard_2\":10,\"beard_3\":0,\"torso_1\":66,\"helmet_2\":0,\"beard_4\":0,\"shoes_2\":1},\"label\":\"Tenue mafia / Petite frappe\"},{\"skin\":{\"mask_1\":99,\"lipstick_4\":0,\"makeup_4\":0,\"eyebrows_2\":0,\"tshirt_1\":15,\"bags_1\":0,\"eyebrows_3\":0,\"beard_1\":5,\"decals_2\":0,\"makeup_2\":0,\"face\":0,\"chain_2\":0,\"hair_color_2\":0,\"sex\":0,\"chain_1\":0,\"eyebrows_1\":0,\"hair_2\":0,\"ears_2\":0,\"hair_1\":21,\"pants_2\":3,\"arms\":17,\"lipstick_2\":0,\"mask_2\":4,\"bproof_1\":0,\"makeup_1\":0,\"lipstick_1\":0,\"decals_1\":0,\"torso_2\":3,\"tshirt_2\":0,\"beard_3\":0,\"shoes_1\":35,\"helmet_1\":-1,\"glasses_1\":25,\"glasses_2\":4,\"lipstick_3\":0,\"ears_1\":-1,\"skin\":0,\"age_1\":0,\"pants_1\":39,\"beard_4\":0,\"bags_2\":0,\"helmet_2\":0,\"hair_color_1\":12,\"eyebrows_4\":0,\"beard_2\":10,\"bproof_2\":0,\"shoes_2\":0,\"makeup_3\":0,\"age_2\":0,\"torso_1\":66},\"label\":\"Tenue Mafia\"}]}'),
(114, 'user_helmet', 'steam:11000010032f30a', '{}'),
(115, 'user_ears', 'steam:11000010032f30a', '{}'),
(116, 'user_glasses', 'steam:11000010032f30a', '{\"hasGlasses\":true,\"skin\":{\"glasses_1\":25,\"glasses_2\":4}}'),
(117, 'user_mask', 'steam:11000010032f30a', '{\"hasMask\":true,\"skin\":{\"mask_2\":4,\"mask_1\":99}}'),
(118, 'property', 'steam:110000108ddaaf3', '{}'),
(119, 'user_mask', 'steam:110000108ddaaf3', '{}'),
(120, 'user_ears', 'steam:110000108ddaaf3', '{}'),
(121, 'user_glasses', 'steam:110000108ddaaf3', '{}'),
(122, 'user_helmet', 'steam:110000108ddaaf3', '{}'),
(123, 'user_glasses', 'steam:11000013493c4b7', '{}'),
(124, 'user_ears', 'steam:11000013493c4b7', '{}'),
(125, 'user_helmet', 'steam:11000013493c4b7', '{}'),
(126, 'user_mask', 'steam:11000013493c4b7', '{\"hasMask\":true,\"skin\":{\"mask_2\":10,\"mask_1\":52}}');
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(127, 'property', 'steam:11000013493c4b7', '{\"dressing\":[{\"skin\":{\"lipstick_2\":0,\"eyebrows_2\":0,\"makeup_3\":0,\"torso_2\":0,\"beard_2\":10,\"helmet_1\":51,\"lipstick_3\":0,\"mask_1\":0,\"lipstick_4\":0,\"pants_2\":0,\"shoes_2\":0,\"beard_4\":0,\"face\":0,\"arms\":0,\"glasses_2\":0,\"makeup_4\":0,\"ears_1\":2,\"makeup_1\":0,\"sex\":0,\"tshirt_1\":21,\"bproof_1\":0,\"beard_3\":0,\"hair_1\":38,\"lipstick_1\":0,\"glasses_1\":0,\"hair_color_2\":6,\"chain_2\":0,\"beard_1\":10,\"helmet_2\":0,\"eyebrows_4\":0,\"shoes_1\":24,\"hair_2\":0,\"ears_2\":0,\"pants_1\":28,\"decals_1\":0,\"eyebrows_3\":0,\"age_1\":0,\"torso_1\":115,\"eyebrows_1\":0,\"bags_2\":0,\"bags_1\":0,\"mask_2\":0,\"tshirt_2\":0,\"decals_2\":0,\"chain_1\":0,\"age_2\":0,\"makeup_2\":0,\"hair_color_1\":4,\"skin\":20,\"bproof_2\":0},\"label\":\"Civil\"},{\"skin\":{\"lipstick_2\":0,\"eyebrows_2\":0,\"makeup_3\":0,\"torso_2\":0,\"beard_2\":10,\"helmet_1\":-1,\"lipstick_3\":0,\"mask_1\":0,\"lipstick_4\":0,\"pants_2\":0,\"shoes_2\":0,\"beard_4\":0,\"face\":0,\"arms\":0,\"glasses_2\":0,\"makeup_4\":0,\"ears_1\":2,\"makeup_1\":0,\"sex\":0,\"tshirt_1\":21,\"bproof_1\":0,\"beard_3\":0,\"hair_1\":38,\"lipstick_1\":0,\"glasses_1\":0,\"hair_color_2\":6,\"chain_2\":0,\"beard_1\":10,\"helmet_2\":0,\"eyebrows_4\":0,\"shoes_1\":24,\"hair_2\":0,\"ears_2\":0,\"makeup_2\":0,\"decals_1\":0,\"eyebrows_3\":0,\"age_1\":0,\"torso_1\":115,\"eyebrows_1\":0,\"bags_2\":0,\"bags_1\":0,\"chain_1\":0,\"tshirt_2\":0,\"decals_2\":0,\"pants_1\":28,\"age_2\":0,\"mask_2\":0,\"hair_color_1\":4,\"skin\":20,\"bproof_2\":0},\"label\":\"Civil\"},{\"skin\":{\"lipstick_2\":0,\"eyebrows_2\":0,\"makeup_3\":0,\"torso_2\":0,\"beard_2\":10,\"helmet_1\":-1,\"lipstick_3\":0,\"mask_1\":0,\"lipstick_4\":0,\"pants_2\":0,\"shoes_2\":6,\"beard_4\":0,\"face\":0,\"arms\":0,\"glasses_2\":0,\"makeup_4\":0,\"ears_1\":2,\"makeup_1\":0,\"sex\":0,\"tshirt_1\":94,\"beard_3\":0,\"lipstick_1\":0,\"hair_1\":38,\"chain_2\":0,\"glasses_1\":0,\"hair_color_2\":6,\"decals_2\":0,\"beard_1\":10,\"helmet_2\":0,\"eyebrows_4\":0,\"shoes_1\":14,\"hair_2\":0,\"age_2\":0,\"pants_1\":19,\"decals_1\":0,\"eyebrows_3\":0,\"age_1\":0,\"torso_1\":87,\"makeup_2\":0,\"bags_2\":0,\"bags_1\":0,\"hair_color_1\":4,\"tshirt_2\":0,\"bproof_1\":0,\"chain_1\":0,\"ears_2\":0,\"eyebrows_1\":0,\"mask_2\":0,\"skin\":20,\"bproof_2\":0},\"label\":\"Bloodz\"}]}'),
(128, 'user_mask', 'steam:1100001179c3bb7', '{\"hasMask\":true,\"skin\":{\"mask_1\":116,\"mask_2\":12}}'),
(129, 'user_ears', 'steam:1100001179c3bb7', '{}'),
(130, 'user_helmet', 'steam:1100001179c3bb7', '{\"hasHelmet\":true,\"skin\":{\"helmet_2\":0,\"helmet_1\":22}}'),
(131, 'property', 'steam:1100001179c3bb7', '{\"dressing\":[{\"skin\":{\"face\":8,\"age_2\":0,\"beard_1\":0,\"eyebrows_2\":0,\"age_1\":0,\"decals_1\":0,\"lipstick_4\":0,\"pants_1\":5,\"tshirt_2\":0,\"lipstick_2\":0,\"bproof_1\":0,\"lipstick_1\":0,\"tshirt_1\":15,\"skin\":0,\"makeup_1\":0,\"mask_2\":0,\"chain_1\":0,\"ears_1\":-1,\"decals_2\":0,\"makeup_3\":0,\"torso_2\":2,\"makeup_4\":0,\"mask_1\":0,\"eyebrows_3\":0,\"beard_3\":0,\"bags_2\":0,\"beard_4\":0,\"beard_2\":0,\"torso_1\":143,\"hair_1\":3,\"shoes_1\":9,\"sex\":0,\"hair_2\":0,\"eyebrows_1\":0,\"bproof_2\":0,\"hair_color_1\":0,\"glasses_2\":0,\"shoes_2\":5,\"pants_2\":9,\"helmet_1\":-1,\"hair_color_2\":0,\"chain_2\":0,\"makeup_2\":0,\"bags_1\":45,\"helmet_2\":0,\"arms\":0,\"glasses_1\":0,\"eyebrows_4\":0,\"ears_2\":0,\"lipstick_3\":0},\"label\":\"gang\"},{\"skin\":{\"face\":8,\"age_2\":0,\"beard_1\":0,\"eyebrows_2\":0,\"age_1\":0,\"decals_1\":0,\"lipstick_4\":0,\"pants_1\":4,\"tshirt_2\":0,\"lipstick_2\":0,\"bproof_1\":0,\"lipstick_1\":0,\"tshirt_1\":23,\"skin\":0,\"makeup_1\":0,\"mask_2\":0,\"chain_1\":0,\"ears_1\":-1,\"decals_2\":0,\"makeup_3\":0,\"torso_2\":0,\"makeup_4\":0,\"mask_1\":0,\"eyebrows_3\":0,\"beard_3\":0,\"bags_2\":0,\"beard_4\":0,\"beard_2\":0,\"torso_1\":115,\"hair_1\":3,\"helmet_1\":-1,\"shoes_1\":12,\"hair_2\":0,\"eyebrows_1\":0,\"hair_color_2\":0,\"sex\":0,\"hair_color_1\":0,\"glasses_2\":0,\"pants_2\":2,\"shoes_2\":1,\"makeup_2\":0,\"chain_2\":0,\"bproof_2\":0,\"bags_1\":0,\"helmet_2\":0,\"arms\":0,\"glasses_1\":0,\"eyebrows_4\":0,\"ears_2\":0,\"lipstick_3\":0},\"label\":\"normal\"},{\"skin\":{\"face\":8,\"age_2\":0,\"beard_1\":1,\"eyebrows_2\":10,\"age_1\":0,\"decals_1\":0,\"sex\":0,\"pants_1\":58,\"tshirt_2\":0,\"lipstick_2\":0,\"bproof_1\":0,\"lipstick_1\":0,\"tshirt_1\":15,\"skin\":0,\"makeup_1\":45,\"mask_2\":0,\"chain_1\":0,\"ears_1\":-1,\"decals_2\":0,\"makeup_3\":0,\"torso_2\":10,\"beard_3\":0,\"mask_1\":0,\"eyebrows_3\":0,\"beard_2\":10,\"bags_2\":0,\"beard_4\":0,\"hair_1\":58,\"torso_1\":117,\"makeup_4\":0,\"shoes_1\":42,\"helmet_1\":40,\"hair_2\":0,\"eyebrows_1\":0,\"makeup_2\":10,\"hair_color_1\":30,\"glasses_2\":0,\"shoes_2\":2,\"pants_2\":10,\"bproof_2\":0,\"bags_1\":0,\"chain_2\":0,\"helmet_2\":2,\"lipstick_4\":0,\"glasses_1\":0,\"arms\":1,\"hair_color_2\":29,\"eyebrows_4\":0,\"ears_2\":0,\"lipstick_3\":0},\"label\":\"noel\"},{\"skin\":{\"face\":8,\"age_2\":0,\"beard_1\":1,\"eyebrows_2\":10,\"age_1\":0,\"decals_1\":0,\"lipstick_4\":0,\"pants_1\":10,\"tshirt_2\":0,\"lipstick_2\":0,\"bproof_1\":0,\"lipstick_1\":0,\"tshirt_1\":31,\"skin\":0,\"makeup_1\":0,\"mask_2\":0,\"chain_1\":28,\"ears_1\":-1,\"decals_2\":0,\"makeup_3\":0,\"torso_2\":0,\"makeup_4\":0,\"mask_1\":0,\"eyebrows_3\":0,\"beard_3\":0,\"bags_2\":0,\"beard_4\":0,\"beard_2\":10,\"torso_1\":32,\"hair_1\":67,\"shoes_1\":10,\"sex\":0,\"hair_2\":0,\"eyebrows_1\":0,\"hair_color_1\":31,\"glasses_2\":0,\"hair_color_2\":29,\"shoes_2\":0,\"pants_2\":0,\"helmet_1\":-1,\"bproof_2\":0,\"chain_2\":2,\"makeup_2\":10,\"bags_1\":0,\"helmet_2\":0,\"arms\":1,\"glasses_1\":0,\"eyebrows_4\":0,\"ears_2\":0,\"lipstick_3\":0},\"label\":\"chic\"},{\"skin\":{\"face\":8,\"age_2\":0,\"beard_1\":1,\"eyebrows_2\":10,\"age_1\":0,\"decals_1\":0,\"lipstick_4\":0,\"pants_1\":10,\"tshirt_2\":0,\"lipstick_2\":0,\"bproof_1\":0,\"lipstick_1\":0,\"tshirt_1\":31,\"skin\":0,\"makeup_1\":0,\"mask_2\":0,\"chain_1\":28,\"ears_1\":-1,\"decals_2\":0,\"makeup_3\":0,\"torso_2\":2,\"beard_3\":0,\"mask_1\":0,\"eyebrows_3\":0,\"hair_color_1\":63,\"bags_2\":0,\"beard_4\":0,\"bags_1\":0,\"torso_1\":72,\"beard_2\":10,\"hair_1\":39,\"shoes_2\":0,\"hair_2\":0,\"eyebrows_1\":0,\"hair_color_2\":38,\"shoes_1\":10,\"makeup_4\":0,\"sex\":0,\"pants_2\":0,\"glasses_2\":0,\"helmet_1\":-1,\"chain_2\":2,\"makeup_2\":10,\"bproof_2\":0,\"helmet_2\":0,\"arms\":1,\"glasses_1\":0,\"eyebrows_4\":0,\"ears_2\":0,\"lipstick_3\":0},\"label\":\"chic manteau\"}]}'),
(132, 'user_glasses', 'steam:1100001179c3bb7', '{\"hasGlasses\":true,\"skin\":{\"glasses_2\":0,\"glasses_1\":7}}'),
(133, 'user_ears', 'steam:11000010dd9c7d6', '{\"skin\":{\"ears_2\":0,\"ears_1\":9},\"hasEars\":true}'),
(134, 'user_glasses', 'steam:11000010dd9c7d6', '{}'),
(135, 'user_helmet', 'steam:11000010dd9c7d6', '{}'),
(136, 'user_mask', 'steam:11000010dd9c7d6', '{}'),
(137, 'property', 'steam:11000010dd9c7d6', '{\"weapons\":[{\"ammo\":121,\"name\":\"WEAPON_ASSAULTSMG\"},{\"ammo\":156,\"name\":\"WEAPON_SPECIALCARBINE\"},{\"ammo\":233,\"name\":\"WEAPON_SNIPERRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_STUNGUN\"},{\"ammo\":0,\"name\":\"WEAPON_SAWNOFFSHOTGUN\"}],\"dressing\":[{\"label\":\"POLICE\",\"skin\":{\"beard_1\":0,\"beard_3\":0,\"makeup_1\":0,\"hair_color_1\":3,\"face\":0,\"tshirt_2\":1,\"chain_1\":0,\"helmet_1\":-1,\"decals_2\":0,\"sex\":0,\"makeup_2\":0,\"age_1\":0,\"hair_2\":0,\"tshirt_1\":60,\"ears_1\":2,\"mask_1\":0,\"skin\":8,\"pants_1\":25,\"eyebrows_2\":0,\"glasses_1\":4,\"mask_2\":0,\"hair_1\":14,\"beard_2\":0,\"bproof_1\":0,\"glasses_2\":0,\"bproof_2\":0,\"helmet_2\":0,\"torso_1\":55,\"lipstick_4\":0,\"eyebrows_1\":0,\"decals_1\":0,\"lipstick_2\":0,\"shoes_1\":25,\"hair_color_2\":0,\"bags_2\":0,\"lipstick_3\":0,\"makeup_4\":0,\"pants_2\":0,\"age_2\":0,\"eyebrows_4\":0,\"eyebrows_3\":0,\"beard_4\":0,\"arms\":41,\"ears_2\":0,\"shoes_2\":0,\"makeup_3\":0,\"lipstick_1\":0,\"chain_2\":0,\"bags_1\":0,\"torso_2\":0}},{\"label\":\"Vie de tous les jour \",\"skin\":{\"beard_1\":0,\"lipstick_1\":0,\"makeup_1\":0,\"hair_color_1\":3,\"face\":0,\"tshirt_2\":0,\"chain_1\":0,\"helmet_1\":-1,\"decals_2\":0,\"sex\":0,\"makeup_2\":0,\"age_1\":0,\"hair_2\":0,\"tshirt_1\":5,\"ears_1\":2,\"mask_1\":0,\"skin\":8,\"pants_1\":82,\"mask_2\":0,\"glasses_1\":0,\"eyebrows_2\":0,\"hair_1\":14,\"beard_2\":0,\"bproof_1\":0,\"glasses_2\":0,\"bproof_2\":0,\"helmet_2\":0,\"eyebrows_1\":0,\"lipstick_4\":0,\"torso_1\":80,\"decals_1\":0,\"lipstick_2\":0,\"shoes_1\":28,\"hair_color_2\":0,\"bags_2\":0,\"lipstick_3\":0,\"makeup_4\":0,\"eyebrows_3\":0,\"pants_2\":4,\"eyebrows_4\":0,\"age_2\":0,\"beard_4\":0,\"arms\":43,\"ears_2\":0,\"shoes_2\":0,\"makeup_3\":0,\"chain_2\":0,\"beard_3\":0,\"bags_1\":0,\"torso_2\":0}},{\"label\":\"Soirée\",\"skin\":{\"beard_1\":0,\"beard_3\":0,\"makeup_1\":0,\"hair_color_1\":3,\"face\":0,\"tshirt_2\":0,\"chain_1\":0,\"helmet_1\":-1,\"bproof_1\":0,\"sex\":0,\"torso_1\":35,\"age_1\":0,\"hair_2\":0,\"tshirt_1\":10,\"ears_1\":2,\"mask_1\":0,\"skin\":8,\"age_2\":0,\"eyebrows_2\":0,\"glasses_1\":4,\"mask_2\":0,\"hair_1\":14,\"beard_2\":0,\"decals_2\":0,\"glasses_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_3\":0,\"helmet_2\":0,\"eyebrows_1\":0,\"pants_1\":28,\"lipstick_2\":0,\"shoes_1\":23,\"hair_color_2\":0,\"bags_2\":0,\"lipstick_3\":0,\"makeup_4\":0,\"decals_1\":0,\"lipstick_1\":0,\"eyebrows_4\":0,\"pants_2\":0,\"beard_4\":0,\"arms\":42,\"ears_2\":0,\"shoes_2\":6,\"makeup_3\":0,\"lipstick_4\":0,\"chain_2\":0,\"bags_1\":0,\"torso_2\":0}}]}'),
(138, 'user_glasses', 'steam:110000103c6f9cc', '{}'),
(139, 'user_mask', 'steam:110000103c6f9cc', '{\"hasMask\":true,\"skin\":{\"mask_2\":0,\"mask_1\":121}}'),
(140, 'user_helmet', 'steam:110000103c6f9cc', '{}'),
(141, 'property', 'steam:110000103c6f9cc', '{\"dressing\":[{\"skin\":{\"pants_1\":9,\"pants_2\":7,\"glasses_1\":4,\"eyebrows_3\":2,\"hair_color_2\":0,\"tshirt_2\":0,\"torso_2\":3,\"makeup_1\":0,\"helmet_2\":9,\"sex\":0,\"chain_2\":0,\"lipstick_2\":0,\"beard_1\":18,\"makeup_4\":0,\"shoes_2\":0,\"mask_1\":0,\"lipstick_3\":0,\"age_1\":0,\"hair_1\":7,\"mask_2\":0,\"helmet_1\":-1,\"chain_1\":0,\"lipstick_4\":0,\"age_2\":0,\"eyebrows_4\":0,\"makeup_3\":0,\"torso_1\":185,\"beard_3\":3,\"decals_1\":0,\"beard_4\":0,\"hair_color_1\":3,\"bags_1\":0,\"makeup_2\":0,\"lipstick_1\":0,\"ears_2\":0,\"skin\":8,\"eyebrows_2\":10,\"beard_2\":10,\"ears_1\":0,\"eyebrows_1\":4,\"arms\":0,\"decals_2\":0,\"hair_2\":0,\"shoes_1\":25,\"tshirt_1\":23,\"glasses_2\":0,\"bags_2\":0,\"bproof_2\":0,\"face\":2,\"bproof_1\":0},\"label\":\"Civil\"},{\"skin\":{\"pants_1\":40,\"pants_2\":0,\"glasses_1\":4,\"eyebrows_3\":2,\"hair_color_2\":0,\"tshirt_2\":0,\"torso_2\":2,\"makeup_1\":0,\"helmet_2\":0,\"sex\":0,\"chain_2\":0,\"lipstick_2\":0,\"beard_1\":18,\"makeup_4\":0,\"shoes_2\":1,\"mask_1\":115,\"lipstick_3\":0,\"age_1\":0,\"hair_1\":1,\"mask_2\":21,\"helmet_1\":-1,\"chain_1\":0,\"lipstick_4\":0,\"age_2\":0,\"eyebrows_4\":0,\"makeup_3\":0,\"torso_1\":143,\"beard_3\":3,\"decals_1\":0,\"beard_4\":0,\"hair_color_1\":29,\"bags_1\":0,\"makeup_2\":0,\"lipstick_1\":0,\"ears_2\":0,\"skin\":8,\"eyebrows_2\":10,\"beard_2\":10,\"ears_1\":0,\"eyebrows_1\":4,\"arms\":0,\"decals_2\":0,\"hair_2\":0,\"shoes_1\":6,\"tshirt_1\":15,\"glasses_2\":0,\"bags_2\":0,\"bproof_2\":0,\"face\":2,\"bproof_1\":0},\"label\":\"Gang\"},{\"skin\":{\"pants_1\":32,\"pants_2\":0,\"glasses_1\":25,\"beard_2\":10,\"hair_color_2\":0,\"tshirt_2\":0,\"torso_2\":5,\"tshirt_1\":15,\"helmet_2\":0,\"sex\":0,\"chain_2\":0,\"lipstick_2\":0,\"beard_1\":18,\"makeup_4\":0,\"shoes_2\":0,\"mask_1\":0,\"lipstick_3\":0,\"age_1\":0,\"skin\":8,\"ears_1\":0,\"face\":2,\"chain_1\":0,\"eyebrows_3\":2,\"mask_2\":0,\"age_2\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":3,\"decals_1\":0,\"lipstick_4\":0,\"hair_2\":0,\"bags_1\":0,\"eyebrows_1\":4,\"lipstick_1\":0,\"ears_2\":0,\"beard_4\":0,\"eyebrows_2\":10,\"torso_1\":197,\"makeup_1\":0,\"helmet_1\":24,\"arms\":0,\"decals_2\":0,\"hair_color_1\":29,\"shoes_1\":17,\"hair_1\":1,\"glasses_2\":0,\"makeup_2\":0,\"bproof_2\":0,\"bags_2\":0,\"bproof_1\":0},\"label\":\"Noel\"},{\"skin\":{\"pants_1\":40,\"pants_2\":1,\"glasses_1\":4,\"beard_2\":10,\"hair_color_2\":0,\"tshirt_2\":0,\"torso_2\":10,\"tshirt_1\":15,\"helmet_2\":0,\"sex\":0,\"chain_2\":0,\"lipstick_2\":0,\"beard_1\":18,\"makeup_4\":0,\"shoes_2\":1,\"mask_1\":115,\"lipstick_3\":0,\"age_1\":0,\"skin\":8,\"ears_1\":0,\"face\":2,\"chain_1\":0,\"eyebrows_3\":2,\"mask_2\":21,\"age_2\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":3,\"decals_1\":0,\"lipstick_4\":0,\"hair_2\":0,\"bags_1\":0,\"eyebrows_1\":4,\"lipstick_1\":0,\"ears_2\":0,\"beard_4\":0,\"eyebrows_2\":10,\"torso_1\":229,\"makeup_1\":0,\"helmet_1\":-1,\"arms\":0,\"decals_2\":0,\"hair_color_1\":29,\"shoes_1\":6,\"hair_1\":1,\"glasses_2\":0,\"makeup_2\":0,\"bproof_2\":0,\"bags_2\":0,\"bproof_1\":0},\"label\":\"Gang 2\"},{\"skin\":{\"pants_1\":9,\"pants_2\":10,\"glasses_1\":25,\"beard_2\":10,\"hair_color_2\":0,\"tshirt_2\":0,\"torso_2\":23,\"tshirt_1\":15,\"helmet_2\":0,\"sex\":0,\"chain_2\":0,\"lipstick_2\":0,\"beard_1\":18,\"makeup_4\":0,\"shoes_2\":24,\"mask_1\":104,\"lipstick_3\":0,\"age_1\":0,\"skin\":8,\"ears_1\":0,\"face\":2,\"chain_1\":0,\"eyebrows_3\":2,\"mask_2\":3,\"age_2\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":3,\"decals_1\":0,\"lipstick_4\":0,\"hair_2\":0,\"bags_1\":0,\"eyebrows_1\":4,\"lipstick_1\":0,\"ears_2\":0,\"beard_4\":0,\"eyebrows_2\":10,\"torso_1\":248,\"makeup_1\":0,\"helmet_1\":117,\"arms\":96,\"decals_2\":0,\"hair_color_1\":29,\"shoes_1\":73,\"hair_1\":1,\"glasses_2\":4,\"makeup_2\":0,\"bproof_2\":0,\"bags_2\":0,\"bproof_1\":0},\"label\":\"Armé des neige\"},{\"skin\":{\"pants_1\":24,\"pants_2\":1,\"glasses_1\":17,\"eyebrows_3\":2,\"hair_color_2\":0,\"tshirt_2\":0,\"torso_2\":0,\"makeup_1\":0,\"helmet_2\":6,\"sex\":0,\"chain_2\":0,\"lipstick_2\":0,\"beard_1\":18,\"makeup_4\":0,\"shoes_2\":0,\"mask_1\":0,\"lipstick_3\":0,\"age_1\":0,\"hair_1\":1,\"mask_2\":0,\"helmet_1\":61,\"chain_1\":0,\"lipstick_4\":0,\"age_2\":0,\"eyebrows_4\":0,\"makeup_3\":0,\"torso_1\":11,\"beard_3\":3,\"decals_1\":0,\"beard_4\":0,\"hair_color_1\":29,\"bags_1\":0,\"makeup_2\":0,\"lipstick_1\":0,\"ears_2\":0,\"skin\":8,\"eyebrows_2\":10,\"beard_2\":10,\"ears_1\":-1,\"eyebrows_1\":4,\"arms\":4,\"decals_2\":0,\"hair_2\":0,\"shoes_1\":10,\"tshirt_1\":22,\"glasses_2\":7,\"bags_2\":0,\"bproof_2\":0,\"face\":2,\"bproof_1\":0},\"label\":\"Enterement\"},{\"skin\":{\"pants_1\":9,\"pants_2\":7,\"glasses_1\":15,\"eyebrows_3\":2,\"hair_color_2\":0,\"tshirt_2\":0,\"torso_2\":2,\"makeup_1\":0,\"helmet_2\":2,\"sex\":0,\"chain_2\":0,\"lipstick_2\":0,\"beard_1\":18,\"makeup_4\":0,\"shoes_2\":0,\"mask_1\":121,\"lipstick_3\":0,\"age_1\":0,\"hair_1\":1,\"mask_2\":0,\"helmet_1\":58,\"chain_1\":0,\"lipstick_4\":0,\"age_2\":0,\"eyebrows_4\":0,\"makeup_3\":0,\"torso_1\":242,\"beard_3\":3,\"decals_1\":0,\"beard_4\":0,\"hair_color_1\":29,\"bags_1\":0,\"makeup_2\":0,\"lipstick_1\":0,\"ears_2\":0,\"skin\":8,\"eyebrows_2\":10,\"beard_2\":10,\"ears_1\":-1,\"eyebrows_1\":4,\"arms\":30,\"decals_2\":0,\"hair_2\":0,\"shoes_1\":25,\"tshirt_1\":58,\"glasses_2\":1,\"bags_2\":0,\"bproof_2\":0,\"face\":2,\"bproof_1\":0},\"label\":\"Sécurity\"},{\"skin\":{\"pants_1\":54,\"pants_2\":2,\"glasses_1\":17,\"lipstick_4\":0,\"hair_color_2\":0,\"tshirt_2\":0,\"torso_2\":0,\"tshirt_1\":15,\"helmet_2\":0,\"sex\":0,\"chain_2\":0,\"lipstick_2\":0,\"beard_1\":18,\"makeup_4\":0,\"shoes_2\":0,\"mask_1\":0,\"lipstick_3\":0,\"age_1\":0,\"hair_1\":1,\"ears_1\":-1,\"helmet_1\":-1,\"torso_1\":15,\"eyebrows_3\":2,\"age_2\":0,\"eyebrows_4\":0,\"makeup_3\":0,\"chain_1\":0,\"beard_3\":3,\"decals_1\":0,\"beard_4\":0,\"hair_color_1\":29,\"mask_2\":0,\"arms\":15,\"lipstick_1\":0,\"bags_1\":0,\"ears_2\":0,\"eyebrows_2\":10,\"skin\":8,\"beard_2\":10,\"makeup_1\":0,\"eyebrows_1\":4,\"decals_2\":0,\"hair_2\":0,\"shoes_1\":16,\"bags_2\":0,\"glasses_2\":5,\"makeup_2\":0,\"bproof_2\":0,\"face\":2,\"bproof_1\":0},\"label\":\"Pla\"},{\"skin\":{\"pants_1\":76,\"pants_2\":2,\"glasses_1\":18,\"beard_2\":10,\"hair_color_2\":0,\"tshirt_2\":0,\"torso_2\":6,\"tshirt_1\":15,\"helmet_2\":0,\"sex\":0,\"chain_2\":0,\"lipstick_2\":0,\"beard_1\":18,\"makeup_4\":0,\"shoes_2\":0,\"mask_1\":0,\"lipstick_3\":0,\"age_1\":0,\"hair_1\":1,\"makeup_1\":0,\"face\":2,\"bags_1\":0,\"ears_1\":-1,\"eyebrows_3\":2,\"age_2\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":3,\"decals_1\":0,\"lipstick_4\":0,\"hair_2\":0,\"mask_2\":0,\"makeup_2\":0,\"lipstick_1\":0,\"ears_2\":0,\"skin\":8,\"eyebrows_2\":10,\"torso_1\":78,\"chain_1\":51,\"eyebrows_1\":4,\"helmet_1\":-1,\"decals_2\":0,\"hair_color_1\":29,\"shoes_1\":7,\"arms\":0,\"glasses_2\":2,\"bags_2\":0,\"bproof_2\":0,\"bproof_1\":0,\"beard_4\":0},\"label\":\"Civil riche\"},{\"skin\":{\"pants_1\":87,\"pants_2\":3,\"glasses_1\":5,\"lipstick_4\":0,\"hair_color_2\":0,\"tshirt_2\":0,\"torso_2\":4,\"tshirt_1\":130,\"helmet_2\":3,\"sex\":0,\"chain_2\":0,\"bags_2\":0,\"beard_1\":18,\"makeup_4\":0,\"shoes_2\":0,\"mask_1\":116,\"lipstick_3\":0,\"age_1\":0,\"beard_4\":0,\"lipstick_2\":0,\"helmet_1\":105,\"torso_1\":238,\"skin\":8,\"bproof_1\":0,\"age_2\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":3,\"decals_1\":0,\"eyebrows_3\":2,\"hair_2\":0,\"ears_2\":0,\"eyebrows_1\":4,\"lipstick_1\":0,\"arms\":2,\"mask_2\":13,\"eyebrows_2\":10,\"bags_1\":0,\"makeup_1\":0,\"hair_color_1\":29,\"hair_1\":1,\"decals_2\":0,\"face\":2,\"shoes_1\":35,\"chain_1\":112,\"glasses_2\":7,\"beard_2\":10,\"bproof_2\":0,\"makeup_2\":0,\"ears_1\":-1},\"label\":\"armée\"}],\"weapons\":[{\"name\":\"WEAPON_HEAVYSNIPER\",\"ammo\":239},{\"ammo\":0,\"name\":\"WEAPON_CARBINERIFLE\"}]}'),
(142, 'user_ears', 'steam:110000103c6f9cc', '{\"skin\":{\"ears_1\":-1,\"ears_2\":0},\"hasEars\":true}'),
(143, 'user_ears', 'steam:110000132b7e237', '{}'),
(144, 'user_glasses', 'steam:110000132b7e237', '{}'),
(145, 'user_mask', 'steam:110000132b7e237', '{}'),
(146, 'user_helmet', 'steam:110000132b7e237', '{}'),
(147, 'property', 'steam:110000132b7e237', '{}'),
(148, 'user_helmet', 'steam:1100001350a83ef', '{}'),
(149, 'property', 'steam:1100001350a83ef', '{}'),
(150, 'user_ears', 'steam:1100001350a83ef', '{}'),
(151, 'user_glasses', 'steam:1100001350a83ef', '{}'),
(152, 'user_mask', 'steam:1100001350a83ef', '{}'),
(153, 'user_glasses', 'steam:110000117825a22', '{}'),
(154, 'user_helmet', 'steam:110000117825a22', '{}'),
(155, 'property', 'steam:110000117825a22', '{}'),
(156, 'user_mask', 'steam:110000117825a22', '{}'),
(157, 'user_ears', 'steam:110000117825a22', '{}'),
(158, 'user_helmet', 'steam:110000135b8dcac', '{}'),
(159, 'property', 'steam:110000135b8dcac', '{}'),
(160, 'user_glasses', 'steam:110000135b8dcac', '{}'),
(161, 'user_ears', 'steam:110000135b8dcac', '{}'),
(162, 'user_mask', 'steam:110000135b8dcac', '{}'),
(163, 'society_mafia', NULL, '{}'),
(164, 'society_gang', NULL, '{}'),
(165, 'user_glasses', 'steam:11000011b8aadb1', '{}'),
(166, 'user_ears', 'steam:11000011b8aadb1', '{}'),
(167, 'user_helmet', 'steam:11000011b8aadb1', '{}'),
(168, 'property', 'steam:11000011b8aadb1', '{\"dressing\":[{\"skin\":{\"lipstick_4\":0,\"glasses_1\":0,\"shoes_1\":9,\"face\":0,\"beard_3\":0,\"arms\":0,\"helmet_2\":5,\"beard_1\":12,\"hair_color_1\":0,\"pants_1\":5,\"mask_2\":12,\"beard_2\":7,\"tshirt_2\":0,\"torso_2\":2,\"makeup_4\":0,\"beard_4\":0,\"age_1\":0,\"pants_2\":9,\"tshirt_1\":15,\"makeup_2\":0,\"lipstick_2\":0,\"bags_1\":44,\"bags_2\":0,\"makeup_1\":0,\"skin\":4,\"eyebrows_3\":0,\"helmet_1\":14,\"chain_1\":0,\"ears_1\":-1,\"hair_1\":18,\"makeup_3\":0,\"age_2\":0,\"decals_1\":0,\"sex\":0,\"hair_color_2\":0,\"decals_2\":0,\"mask_1\":116,\"hair_2\":0,\"lipstick_1\":0,\"bproof_1\":0,\"eyebrows_2\":10,\"lipstick_3\":0,\"shoes_2\":5,\"bproof_2\":0,\"torso_1\":143,\"glasses_2\":0,\"chain_2\":0,\"ears_2\":0,\"eyebrows_4\":0,\"eyebrows_1\":12},\"label\":\"gang \"},{\"skin\":{\"lipstick_4\":0,\"bproof_1\":0,\"shoes_1\":8,\"face\":0,\"beard_3\":0,\"arms\":0,\"helmet_2\":3,\"beard_1\":12,\"hair_color_1\":0,\"pants_1\":4,\"mask_2\":12,\"beard_2\":7,\"tshirt_2\":0,\"torso_2\":7,\"makeup_4\":0,\"beard_4\":0,\"age_1\":0,\"pants_2\":1,\"tshirt_1\":57,\"makeup_2\":0,\"lipstick_2\":0,\"bags_1\":41,\"bags_2\":0,\"makeup_1\":0,\"skin\":4,\"eyebrows_3\":0,\"helmet_1\":96,\"chain_1\":0,\"ears_1\":-1,\"hair_1\":18,\"lipstick_1\":0,\"age_2\":0,\"decals_1\":0,\"sex\":0,\"hair_color_2\":0,\"decals_2\":0,\"mask_1\":116,\"glasses_1\":0,\"eyebrows_4\":0,\"glasses_2\":0,\"eyebrows_2\":10,\"lipstick_3\":0,\"shoes_2\":0,\"bproof_2\":0,\"torso_1\":152,\"eyebrows_1\":12,\"chain_2\":0,\"ears_2\":0,\"makeup_3\":0,\"hair_2\":0},\"label\":\"moto\"},{\"skin\":{\"lipstick_4\":0,\"bproof_1\":0,\"shoes_1\":9,\"face\":0,\"beard_3\":0,\"arms\":0,\"helmet_2\":5,\"beard_1\":12,\"hair_color_1\":0,\"pants_1\":5,\"mask_2\":12,\"beard_2\":7,\"tshirt_2\":0,\"torso_2\":2,\"makeup_4\":0,\"beard_4\":0,\"age_1\":0,\"pants_2\":9,\"tshirt_1\":11,\"makeup_2\":0,\"lipstick_2\":0,\"bags_1\":44,\"bags_2\":0,\"makeup_1\":0,\"skin\":4,\"eyebrows_3\":0,\"helmet_1\":-1,\"chain_1\":0,\"ears_1\":-1,\"hair_1\":18,\"lipstick_1\":0,\"age_2\":0,\"decals_1\":0,\"sex\":0,\"hair_color_2\":0,\"decals_2\":0,\"mask_1\":95,\"glasses_1\":0,\"eyebrows_4\":0,\"glasses_2\":0,\"eyebrows_2\":10,\"lipstick_3\":0,\"shoes_2\":5,\"bproof_2\":0,\"torso_1\":143,\"eyebrows_1\":12,\"chain_2\":0,\"ears_2\":0,\"makeup_3\":0,\"hair_2\":0},\"label\":\"gang allouwine \"},{\"skin\":{\"shoes\":9,\"glasses_1\":0,\"shoes_1\":8,\"face\":0,\"beard_3\":0,\"arms\":0,\"helmet_2\":1,\"beard_1\":12,\"hair_color_1\":0,\"pants_1\":27,\"mask_2\":12,\"beard_2\":7,\"tshirt_2\":0,\"torso_2\":8,\"makeup_4\":0,\"beard_4\":0,\"age_1\":0,\"pants_2\":11,\"tshirt_1\":57,\"makeup_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"bags_2\":0,\"makeup_1\":0,\"skin\":4,\"eyebrows_3\":0,\"eyebrows_2\":10,\"bproof_2\":0,\"ears_1\":-1,\"hair_1\":18,\"glasses_2\":0,\"age_2\":0,\"sex\":0,\"decals_1\":0,\"hair_color_2\":0,\"eyebrows_1\":12,\"decals_2\":0,\"mask_1\":116,\"helmet_1\":97,\"chain_1\":0,\"bproof_1\":0,\"eyebrows_4\":0,\"lipstick_3\":0,\"shoes_2\":0,\"lipstick_4\":0,\"torso_1\":197,\"makeup_3\":0,\"chain_2\":0,\"ears_2\":0,\"lipstick_1\":0,\"bags_1\":41},\"label\":\"noel\"},{\"skin\":{\"shoes\":9,\"glasses_1\":0,\"shoes_1\":8,\"face\":0,\"beard_3\":0,\"arms\":0,\"helmet_2\":3,\"beard_1\":12,\"hair_color_1\":0,\"pants_1\":26,\"mask_2\":0,\"beard_2\":7,\"tshirt_2\":0,\"torso_2\":6,\"makeup_4\":0,\"beard_4\":0,\"age_1\":0,\"pants_2\":4,\"tshirt_1\":23,\"makeup_2\":0,\"lipstick_2\":0,\"bags_1\":41,\"bags_2\":0,\"makeup_1\":0,\"skin\":4,\"eyebrows_3\":0,\"eyebrows_2\":10,\"chain_1\":0,\"ears_1\":-1,\"hair_1\":18,\"glasses_2\":0,\"age_2\":0,\"lipstick_1\":0,\"decals_1\":0,\"hair_color_2\":0,\"hair_2\":0,\"decals_2\":0,\"mask_1\":0,\"sex\":0,\"bproof_1\":0,\"ears_2\":0,\"bproof_2\":0,\"lipstick_3\":0,\"shoes_2\":12,\"helmet_1\":96,\"torso_1\":127,\"lipstick_4\":0,\"chain_2\":0,\"eyebrows_4\":0,\"eyebrows_1\":12,\"makeup_3\":0},\"label\":\"normal\"}]}'),
(169, 'user_mask', 'steam:11000011b8aadb1', '{\"skin\":{\"mask_1\":105,\"mask_2\":7},\"hasMask\":true}'),
(170, 'organisation_cartel', NULL, '{\"weapons\":[{\"count\":2,\"name\":\"WEAPON_HEAVYSHOTGUN\"},{\"count\":0,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":0,\"name\":\"WEAPON_MICROSMG\"},{\"count\":0,\"name\":\"WEAPON_MARKSMANRIFLE\"},{\"count\":0,\"name\":\"WEAPON_COMBATPISTOL\"},{\"count\":1,\"name\":\"WEAPON_PUMPSHOTGUN\"},{\"count\":0,\"name\":\"WEAPON_FIREEXTINGUISHER\"},{\"count\":3,\"name\":\"WEAPON_SAWNOFFSHOTGUN\"},{\"count\":0,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"count\":0,\"name\":\"WEAPON_MOLOTOV\"},{\"count\":1,\"name\":\"WEAPON_SPECIALCARBINE\"},{\"count\":0,\"name\":\"WEAPON_KNIFE\"},{\"count\":0,\"name\":\"WEAPON_BAT\"},{\"count\":0,\"name\":\"WEAPON_CROWBAR\"},{\"count\":1,\"name\":\"WEAPON_REVOLVER\"},{\"count\":1,\"name\":\"WEAPON_STUNGUN\"},{\"count\":0,\"name\":\"WEAPON_VINTAGEPISTOL\"}]}'),
(171, 'organisation_mafia', NULL, '{\"weapons\":[{\"count\":0,\"name\":\"WEAPON_APPISTOL\"},{\"count\":0,\"name\":\"WEAPON_MICROSMG\"},{\"count\":0,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"count\":0,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":0,\"name\":\"WEAPON_PUMPSHOTGUN\"},{\"count\":0,\"name\":\"WEAPON_SPECIALCARBINE\"},{\"count\":0,\"name\":\"WEAPON_PISTOL\"},{\"count\":0,\"name\":\"WEAPON_BAT\"},{\"count\":0,\"name\":\"WEAPON_FIREEXTINGUISHER\"},{\"count\":0,\"name\":\"WEAPON_MACHETE\"},{\"count\":0,\"name\":\"WEAPON_SMG\"},{\"count\":0,\"name\":\"WEAPON_SNIPERRIFLE\"},{\"count\":0,\"name\":\"WEAPON_NIGHTSTICK\"},{\"count\":6,\"name\":\"WEAPON_COMBATPISTOL\"},{\"count\":0,\"name\":\"WEAPON_STUNGUN\"},{\"count\":2,\"name\":\"WEAPON_SAWNOFFSHOTGUN\"},{\"count\":0,\"name\":\"WEAPON_HEAVYSNIPER\"},{\"count\":0,\"name\":\"WEAPON_HOMINGLAUNCHER\"},{\"count\":0,\"name\":\"WEAPON_COMPACTLAUNCHER\"},{\"count\":0,\"name\":\"WEAPON_GUSENBERG\"},{\"count\":0,\"name\":\"WEAPON_HEAVYSHOTGUN\"},{\"count\":0,\"name\":\"WEAPON_BZGAS\"},{\"count\":0,\"name\":\"WEAPON_MOLOTOV\"},{\"count\":2,\"name\":\"WEAPON_SMOKEGRENADE\"},{\"count\":0,\"name\":\"WEAPON_HEAVYPISTOL\"},{\"count\":0,\"name\":\"WEAPON_COMPACTRIFLE\"},{\"count\":0,\"name\":\"WEAPON_MG\"},{\"count\":2,\"name\":\"WEAPON_PIPEBOMB\"},{\"count\":0,\"name\":\"WEAPON_STICKYBOMB\"},{\"count\":0,\"name\":\"WEAPON_COMBATPDW\"}]}'),
(172, 'organisation_gang', NULL, '{\"weapons\":[{\"name\":\"WEAPON_COMBATPISTOL\",\"count\":0},{\"name\":\"WEAPON_CARBINERIFLE\",\"count\":2},{\"name\":\"WEAPON_BAT\",\"count\":0},{\"name\":\"WEAPON_PUMPSHOTGUN\",\"count\":0},{\"name\":\"WEAPON_ASSAULTSMG\",\"count\":1},{\"name\":\"WEAPON_STUNGUN\",\"count\":0},{\"name\":\"WEAPON_APPISTOL\",\"count\":1},{\"name\":\"WEAPON_MICROSMG\",\"count\":0},{\"name\":\"WEAPON_SMG\",\"count\":0},{\"name\":\"WEAPON_ASSAULTRIFLE\",\"count\":1},{\"name\":\"WEAPON_HEAVYSNIPER\",\"count\":0},{\"name\":\"WEAPON_SAWNOFFSHOTGUN\",\"count\":2},{\"name\":\"WEAPON_HEAVYPISTOL\",\"count\":1},{\"name\":\"WEAPON_NIGHTSTICK\",\"count\":0},{\"name\":\"WEAPON_SNIPERRIFLE\",\"count\":1},{\"name\":\"WEAPON_PISTOL\",\"count\":0},{\"name\":\"WEAPON_MARKSMANRIFLE\",\"count\":0},{\"name\":\"WEAPON_MACHETE\",\"count\":0},{\"name\":\"WEAPON_PISTOL50\",\"count\":0},{\"name\":\"WEAPON_ADVANCEDRIFLE\",\"count\":3},{\"name\":\"WEAPON_MG\",\"count\":2},{\"name\":\"WEAPON_COMBATMG\",\"count\":1},{\"name\":\"WEAPON_SPECIALCARBINE\",\"count\":1},{\"name\":\"WEAPON_MOLOTOV\",\"count\":1},{\"name\":\"WEAPON_FLASHLIGHT\",\"count\":0},{\"name\":\"GADGET_PARACHUTE\",\"count\":0},{\"name\":\"WEAPON_SMOKEGRENADE\",\"count\":0},{\"name\":\"WEAPON_COMBATPDW\",\"count\":0},{\"name\":\"WEAPON_SWITCHBLADE\",\"count\":0},{\"name\":\"WEAPON_COMPACTRIFLE\",\"count\":0},{\"name\":\"WEAPON_ASSAULTRIFLE_MK2\",\"count\":0},{\"name\":\"WEAPON_COMBATMG_MK2\",\"count\":0},{\"name\":\"WEAPON_SMG_MK2\",\"count\":0},{\"name\":\"WEAPON_FIREEXTINGUISHER\",\"count\":1},{\"name\":\"WEAPON_STICKYBOMB\",\"count\":0},{\"name\":\"WEAPON_KNUCKLE\",\"count\":0}]}'),
(173, 'user_helmet', 'steam:110000110c6f75a', '{\"hasHelmet\":true,\"skin\":{\"helmet_2\":9,\"helmet_1\":91}}'),
(174, 'user_glasses', 'steam:110000110c6f75a', '{\"hasGlasses\":true,\"skin\":{\"glasses_2\":0,\"glasses_1\":5}}'),
(175, 'user_mask', 'steam:110000110c6f75a', '{\"hasMask\":true,\"skin\":{\"mask_2\":9,\"mask_1\":110}}'),
(176, 'property', 'steam:110000110c6f75a', '{\"dressing\":[{\"label\":\"costard\",\"skin\":{\"mask_2\":0,\"beard_2\":5,\"tshirt_2\":0,\"ears_2\":0,\"ears_1\":-1,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"helmet_1\":-1,\"bproof_1\":0,\"beard_3\":0,\"face\":12,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":27,\"mask_1\":0,\"sex\":0,\"torso_1\":31,\"eyebrows_4\":0,\"eyebrows_2\":0,\"skin\":5,\"makeup_2\":0,\"pants_1\":24,\"glasses_2\":0,\"hair_color_2\":13,\"decals_1\":1,\"eyebrows_1\":0,\"shoes_2\":0,\"lipstick_4\":0,\"age_1\":0,\"beard_4\":0,\"hair_color_1\":13,\"makeup_3\":0,\"helmet_2\":0,\"makeup_1\":0,\"tshirt_1\":31,\"glasses_1\":0,\"bags_1\":0,\"lipstick_2\":0,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":0,\"pants_2\":0,\"lipstick_1\":0,\"hair_1\":19,\"beard_1\":10,\"eyebrows_3\":0,\"shoes_1\":10}},{\"label\":\"GANG\",\"skin\":{\"mask_2\":0,\"sex\":0,\"tshirt_2\":0,\"ears_2\":0,\"ears_1\":-1,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"helmet_1\":-1,\"bproof_1\":0,\"beard_3\":0,\"face\":12,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":33,\"mask_1\":0,\"lipstick_2\":0,\"torso_1\":129,\"eyebrows_4\":0,\"beard_2\":5,\"skin\":5,\"makeup_2\":0,\"pants_1\":31,\"makeup_1\":0,\"hair_color_2\":13,\"eyebrows_2\":0,\"eyebrows_1\":0,\"shoes_2\":0,\"lipstick_4\":0,\"age_1\":0,\"beard_4\":0,\"hair_color_1\":13,\"makeup_3\":0,\"helmet_2\":0,\"lipstick_1\":0,\"tshirt_1\":55,\"glasses_1\":5,\"bags_1\":0,\"decals_1\":1,\"shoes_1\":24,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":0,\"pants_2\":0,\"glasses_2\":0,\"hair_1\":19,\"beard_1\":10,\"eyebrows_3\":0,\"decals_2\":0}},{\"label\":\"Braquage\",\"skin\":{\"mask_2\":0,\"beard_2\":5,\"tshirt_2\":0,\"ears_2\":0,\"ears_1\":-1,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"helmet_1\":-1,\"bproof_1\":0,\"beard_3\":0,\"face\":12,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":33,\"mask_1\":0,\"lipstick_2\":0,\"torso_1\":49,\"eyebrows_4\":0,\"glasses_2\":0,\"skin\":5,\"decals_1\":1,\"pants_1\":31,\"eyebrows_1\":0,\"hair_color_2\":13,\"lipstick_1\":0,\"shoes_2\":0,\"torso_2\":0,\"hair_color_1\":13,\"lipstick_4\":0,\"beard_4\":0,\"age_1\":0,\"makeup_3\":0,\"helmet_2\":0,\"sex\":0,\"makeup_1\":0,\"glasses_1\":0,\"tshirt_1\":128,\"bags_1\":0,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":0,\"makeup_2\":0,\"hair_1\":19,\"beard_1\":10,\"eyebrows_3\":0,\"shoes_1\":25}},{\"label\":\"plage\",\"skin\":{\"mask_2\":0,\"sex\":0,\"tshirt_2\":0,\"ears_2\":0,\"ears_1\":-1,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"helmet_1\":-1,\"bproof_1\":0,\"beard_3\":0,\"face\":12,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":15,\"mask_1\":0,\"lipstick_2\":0,\"torso_1\":15,\"eyebrows_4\":0,\"beard_2\":5,\"skin\":5,\"makeup_2\":0,\"pants_1\":16,\"makeup_1\":0,\"hair_color_2\":13,\"eyebrows_2\":0,\"eyebrows_1\":0,\"shoes_2\":0,\"lipstick_4\":0,\"age_1\":0,\"beard_4\":0,\"hair_color_1\":13,\"makeup_3\":0,\"helmet_2\":0,\"lipstick_1\":0,\"tshirt_1\":15,\"glasses_1\":0,\"bags_1\":0,\"decals_1\":1,\"shoes_1\":5,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":0,\"pants_2\":3,\"glasses_2\":0,\"hair_1\":19,\"beard_1\":10,\"eyebrows_3\":0,\"decals_2\":0}},{\"label\":\"civil\",\"skin\":{\"mask_2\":0,\"beard_2\":5,\"tshirt_2\":0,\"ears_2\":0,\"ears_1\":-1,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"helmet_1\":-1,\"bproof_1\":0,\"beard_3\":0,\"face\":12,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":1,\"mask_1\":0,\"lipstick_2\":0,\"torso_1\":41,\"eyebrows_4\":0,\"glasses_2\":0,\"skin\":5,\"makeup_1\":0,\"pants_1\":15,\"eyebrows_1\":0,\"hair_color_2\":13,\"lipstick_1\":0,\"shoes_2\":0,\"torso_2\":0,\"lipstick_4\":0,\"age_1\":0,\"beard_4\":0,\"sex\":0,\"makeup_3\":0,\"helmet_2\":0,\"makeup_2\":0,\"tshirt_1\":130,\"glasses_1\":0,\"bags_1\":0,\"decals_1\":1,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":6,\"hair_color_1\":13,\"hair_1\":19,\"beard_1\":10,\"eyebrows_3\":0,\"shoes_1\":5}},{\"label\":\"calvin\",\"skin\":{\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":0,\"ears_2\":0,\"ears_1\":-1,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_2\":0,\"bproof_1\":0,\"beard_3\":0,\"face\":4,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"lipstick_1\":0,\"mask_1\":0,\"sex\":0,\"torso_1\":14,\"eyebrows_4\":0,\"glasses_2\":0,\"skin\":2,\"hair_color_1\":19,\"pants_1\":1,\"eyebrows_1\":0,\"hair_color_2\":0,\"decals_1\":0,\"shoes_2\":0,\"torso_2\":9,\"lipstick_4\":0,\"age_1\":0,\"beard_4\":0,\"lipstick_2\":0,\"makeup_3\":0,\"helmet_2\":1,\"tshirt_1\":15,\"bags_1\":0,\"glasses_1\":0,\"decals_2\":0,\"makeup_1\":0,\"shoes_1\":6,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":0,\"helmet_1\":3,\"hair_1\":8,\"beard_1\":2,\"eyebrows_3\":0,\"arms\":1}},{\"label\":\"bloods\",\"skin\":{\"mask_2\":0,\"sex\":0,\"tshirt_2\":0,\"ears_2\":0,\"ears_1\":-1,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"helmet_1\":-1,\"lipstick_2\":0,\"beard_3\":0,\"face\":4,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":1,\"mask_1\":0,\"makeup_2\":0,\"torso_1\":87,\"eyebrows_4\":0,\"beard_2\":10,\"skin\":2,\"torso_2\":0,\"pants_1\":19,\"makeup_1\":0,\"eyebrows_1\":0,\"hair_color_2\":0,\"hair_color_1\":19,\"shoes_2\":6,\"lipstick_1\":0,\"lipstick_4\":0,\"beard_4\":0,\"age_1\":0,\"makeup_3\":0,\"helmet_2\":0,\"glasses_2\":0,\"tshirt_1\":24,\"glasses_1\":0,\"bags_1\":0,\"shoes_1\":14,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":0,\"decals_1\":1,\"hair_1\":8,\"beard_1\":2,\"eyebrows_3\":0,\"bproof_1\":0}},{\"label\":\"hiver\",\"skin\":{\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":0,\"ears_2\":0,\"ears_1\":-1,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_2\":0,\"bproof_1\":0,\"beard_3\":0,\"face\":4,\"chain_1\":0,\"decals_1\":1,\"hair_2\":0,\"arms\":12,\"mask_1\":0,\"sex\":0,\"torso_1\":51,\"eyebrows_4\":0,\"glasses_2\":1,\"skin\":2,\"torso_2\":2,\"pants_1\":24,\"age_1\":0,\"hair_color_2\":0,\"lipstick_2\":0,\"eyebrows_1\":0,\"shoes_2\":2,\"hair_color_1\":19,\"lipstick_4\":0,\"beard_4\":0,\"lipstick_1\":0,\"makeup_3\":0,\"helmet_2\":0,\"makeup_1\":0,\"tshirt_1\":15,\"glasses_1\":0,\"bags_1\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":6,\"helmet_1\":-1,\"hair_1\":8,\"beard_1\":2,\"eyebrows_3\":0,\"shoes_1\":7}}],\"weapons\":[{\"name\":\"WEAPON_HATCHET\",\"ammo\":0},{\"name\":\"WEAPON_SMG\",\"ammo\":250},{\"name\":\"WEAPON_SAWNOFFSHOTGUN\",\"ammo\":250}]}'),
(177, 'user_ears', 'steam:110000110c6f75a', '{\"hasEars\":true,\"skin\":{\"ears_2\":0,\"ears_1\":0}}'),
(178, 'user_helmet', 'steam:11000011555ac07', '{\"skin\":{\"helmet_1\":14,\"helmet_2\":1},\"hasHelmet\":true}'),
(179, 'user_glasses', 'steam:11000011555ac07', '{\"hasGlasses\":true,\"skin\":{\"glasses_2\":3,\"glasses_1\":0}}'),
(180, 'user_mask', 'steam:11000011555ac07', '{\"skin\":{\"mask_2\":1,\"mask_1\":51},\"hasMask\":true}'),
(181, 'property', 'steam:11000011555ac07', '{\"dressing\":[{\"skin\":{\"lipstick_4\":0,\"glasses_1\":7,\"shoes_1\":9,\"face\":2,\"beard_3\":0,\"arms\":4,\"helmet_2\":1,\"beard_1\":7,\"hair_color_1\":0,\"pants_1\":5,\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":0,\"torso_2\":9,\"makeup_4\":0,\"beard_4\":0,\"age_1\":0,\"pants_2\":2,\"tshirt_1\":15,\"makeup_2\":0,\"lipstick_2\":0,\"bags_1\":0,\"bags_2\":0,\"makeup_1\":0,\"skin\":4,\"eyebrows_3\":0,\"eyebrows_1\":0,\"chain_1\":0,\"ears_1\":-1,\"hair_1\":2,\"makeup_3\":0,\"age_2\":0,\"decals_1\":0,\"hair_color_2\":0,\"glasses_2\":3,\"decals_2\":0,\"mask_1\":0,\"helmet_1\":-1,\"bproof_1\":0,\"eyebrows_2\":0,\"bproof_2\":0,\"lipstick_3\":0,\"shoes_2\":2,\"eyebrows_4\":0,\"torso_1\":143,\"lipstick_1\":0,\"chain_2\":0,\"ears_2\":0,\"sex\":0,\"hair_2\":0},\"label\":\"Gang\"},{\"skin\":{\"lipstick_4\":0,\"glasses_1\":0,\"shoes_1\":27,\"face\":2,\"beard_3\":0,\"arms\":1,\"helmet_2\":0,\"beard_1\":7,\"hair_color_1\":0,\"pants_1\":9,\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":0,\"torso_2\":3,\"makeup_4\":0,\"beard_4\":0,\"age_1\":0,\"pants_2\":11,\"tshirt_1\":15,\"makeup_2\":0,\"lipstick_2\":0,\"bags_1\":0,\"bags_2\":0,\"makeup_1\":0,\"skin\":4,\"eyebrows_3\":0,\"eyebrows_1\":0,\"chain_1\":0,\"ears_1\":-1,\"hair_1\":2,\"makeup_3\":0,\"age_2\":0,\"decals_1\":0,\"hair_color_2\":0,\"lipstick_1\":0,\"sex\":0,\"mask_1\":0,\"helmet_1\":2,\"decals_2\":0,\"bproof_1\":0,\"eyebrows_2\":0,\"lipstick_3\":0,\"shoes_2\":0,\"bproof_2\":0,\"torso_1\":139,\"glasses_2\":0,\"chain_2\":0,\"eyebrows_4\":0,\"hair_2\":0,\"ears_2\":0},\"label\":\"Army\"},{\"skin\":{\"lipstick_4\":0,\"glasses_1\":0,\"shoes_1\":27,\"decals_2\":0,\"beard_3\":36,\"arms\":17,\"helmet_2\":0,\"beard_1\":7,\"hair_color_1\":36,\"pants_1\":9,\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":0,\"torso_2\":3,\"makeup_4\":0,\"beard_4\":0,\"age_1\":0,\"pants_2\":7,\"tshirt_1\":15,\"makeup_2\":0,\"lipstick_2\":0,\"bags_1\":0,\"bags_2\":0,\"makeup_1\":0,\"skin\":4,\"eyebrows_3\":36,\"eyebrows_1\":0,\"chain_1\":0,\"ears_1\":-1,\"hair_1\":14,\"glasses_2\":0,\"age_2\":0,\"decals_1\":0,\"hair_color_2\":0,\"lipstick_1\":0,\"sex\":0,\"mask_1\":0,\"helmet_1\":-1,\"bproof_1\":0,\"eyebrows_2\":10,\"bproof_2\":0,\"lipstick_3\":0,\"shoes_2\":0,\"hair_2\":0,\"torso_1\":139,\"makeup_3\":0,\"chain_2\":0,\"eyebrows_4\":0,\"face\":2,\"ears_2\":0},\"label\":\"Mecano\"},{\"skin\":{\"lipstick_4\":0,\"glasses_1\":7,\"shoes_1\":9,\"face\":2,\"beard_3\":47,\"arms\":4,\"helmet_2\":1,\"beard_1\":7,\"hair_color_1\":47,\"pants_1\":5,\"mask_2\":1,\"beard_2\":10,\"tshirt_2\":0,\"torso_2\":9,\"makeup_4\":0,\"beard_4\":0,\"age_1\":0,\"pants_2\":2,\"tshirt_1\":15,\"makeup_2\":0,\"lipstick_2\":0,\"bags_1\":0,\"bags_2\":0,\"makeup_1\":0,\"skin\":4,\"eyebrows_3\":36,\"helmet_1\":14,\"chain_1\":0,\"ears_1\":-1,\"hair_1\":11,\"makeup_3\":0,\"age_2\":0,\"decals_1\":0,\"hair_color_2\":0,\"lipstick_1\":0,\"hair_2\":0,\"mask_1\":51,\"glasses_2\":3,\"sex\":0,\"bproof_1\":0,\"eyebrows_2\":10,\"lipstick_3\":0,\"shoes_2\":2,\"bproof_2\":0,\"torso_1\":143,\"eyebrows_1\":0,\"chain_2\":0,\"eyebrows_4\":0,\"ears_2\":0,\"decals_2\":0},\"label\":\"Voleur\"},{\"skin\":{\"lipstick_4\":0,\"glasses_1\":5,\"shoes_1\":4,\"face\":2,\"beard_3\":29,\"arms\":15,\"helmet_2\":0,\"beard_1\":11,\"hair_color_1\":29,\"pants_1\":1,\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":0,\"torso_2\":0,\"makeup_4\":0,\"beard_4\":0,\"age_1\":0,\"pants_2\":2,\"tshirt_1\":111,\"makeup_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"bags_2\":0,\"makeup_1\":0,\"skin\":4,\"eyebrows_3\":29,\"eyebrows_2\":10,\"bproof_2\":0,\"ears_1\":-1,\"hair_1\":21,\"lipstick_1\":0,\"age_2\":0,\"decals_1\":0,\"hair_color_2\":0,\"chain_1\":0,\"decals_2\":0,\"mask_1\":0,\"helmet_1\":-1,\"sex\":0,\"eyebrows_4\":0,\"bproof_1\":0,\"lipstick_3\":0,\"shoes_2\":2,\"glasses_2\":0,\"torso_1\":5,\"eyebrows_1\":0,\"chain_2\":0,\"ears_2\":0,\"makeup_3\":0,\"bags_1\":0},\"label\":\"Dom Toretto\"}]}'),
(182, 'user_ears', 'steam:11000011555ac07', '{\"hasEars\":true,\"skin\":{\"ears_1\":-1,\"ears_2\":0}}'),
(183, 'user_ears', 'steam:11000011c0b0ace', '{}'),
(184, 'user_glasses', 'steam:11000011c0b0ace', '{}'),
(185, 'user_helmet', 'steam:11000011c0b0ace', '{\"hasHelmet\":true,\"skin\":{\"helmet_2\":0,\"helmet_1\":51}}'),
(186, 'user_mask', 'steam:11000011c0b0ace', '{}'),
(187, 'property', 'steam:11000011c0b0ace', '{\"dressing\":[{\"skin\":{\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"tshirt_1\":58,\"chain_2\":0,\"age_2\":0,\"helmet_1\":-1,\"bproof_1\":0,\"beard_3\":3,\"face\":0,\"chain_1\":0,\"decals_1\":8,\"hair_2\":0,\"arms\":41,\"mask_1\":0,\"eyebrows_2\":0,\"ears_1\":2,\"eyebrows_4\":0,\"lipstick_1\":0,\"skin\":5,\"hair_color_2\":0,\"bags_1\":0,\"makeup_2\":0,\"torso_1\":50,\"lipstick_2\":0,\"pants_1\":25,\"lipstick_4\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"beard_4\":0,\"makeup_1\":0,\"shoes_2\":0,\"helmet_2\":0,\"decals_2\":3,\"bags_2\":0,\"glasses_1\":0,\"hair_color_1\":15,\"sex\":0,\"glasses_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":0,\"pants_2\":0,\"shoes_1\":25,\"hair_1\":11,\"beard_1\":16,\"eyebrows_3\":0,\"makeup_4\":0},\"label\":\"Police Hiver\"},{\"skin\":{\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"tshirt_1\":17,\"chain_2\":0,\"age_2\":0,\"helmet_1\":4,\"lipstick_4\":0,\"beard_3\":3,\"face\":0,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":0,\"mask_1\":0,\"eyebrows_2\":0,\"ears_1\":2,\"eyebrows_4\":0,\"torso_1\":167,\"skin\":5,\"lipstick_1\":0,\"pants_1\":26,\"makeup_2\":0,\"bproof_1\":0,\"lipstick_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"makeup_1\":0,\"makeup_3\":0,\"beard_4\":0,\"hair_color_1\":15,\"shoes_2\":3,\"eyebrows_1\":0,\"decals_2\":0,\"bags_2\":0,\"glasses_1\":4,\"bags_1\":0,\"shoes_1\":32,\"glasses_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":0,\"pants_2\":0,\"sex\":0,\"hair_1\":11,\"beard_1\":16,\"eyebrows_3\":0,\"decals_1\":0},\"label\":\"Civil\"},{\"skin\":{\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_2\":0,\"bproof_1\":0,\"beard_3\":3,\"face\":0,\"chain_1\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":0,\"mask_1\":0,\"eyebrows_2\":0,\"decals_2\":0,\"eyebrows_4\":0,\"lipstick_1\":0,\"skin\":5,\"hair_color_1\":15,\"bags_1\":0,\"helmet_1\":51,\"ears_1\":2,\"lipstick_2\":0,\"tshirt_1\":17,\"torso_1\":167,\"eyebrows_1\":0,\"hair_color_2\":0,\"beard_4\":0,\"shoes_2\":3,\"makeup_3\":0,\"helmet_2\":0,\"pants_1\":26,\"makeup_4\":0,\"glasses_1\":4,\"sex\":0,\"lipstick_4\":0,\"glasses_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":3,\"pants_2\":0,\"makeup_1\":0,\"hair_1\":11,\"beard_1\":16,\"eyebrows_3\":0,\"shoes_1\":32},\"label\":\"zd\"}]}'),
(188, 'user_glasses', 'steam:11000011c7b5be5', '{}'),
(189, 'user_helmet', 'steam:11000011c7b5be5', '{}'),
(190, 'property', 'steam:11000011c7b5be5', '{\"dressing\":[{\"label\":\"Civil 1\",\"skin\":{\"hair_color_2\":0,\"beard_4\":3,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":0,\"chain_2\":0,\"lipstick_1\":0,\"beard_1\":1,\"beard_2\":10,\"pants_1\":4,\"eyebrows_1\":0,\"glasses_1\":3,\"bags_1\":0,\"skin\":7,\"shoes_1\":1,\"bproof_1\":0,\"tshirt_1\":12,\"bproof_2\":0,\"pants_2\":0,\"eyebrows_3\":0,\"age_2\":0,\"sex\":0,\"face\":4,\"ears_1\":1,\"decals_2\":0,\"lipstick_2\":0,\"decals_1\":0,\"lipstick_3\":0,\"arms\":20,\"makeup_1\":0,\"ears_2\":0,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"makeup_2\":0,\"eyebrows_2\":0,\"tshirt_2\":0,\"mask_2\":0,\"bags_2\":0,\"hair_2\":0,\"torso_1\":4,\"glasses_2\":0,\"hair_1\":37,\"hair_color_1\":0,\"helmet_1\":12,\"mask_1\":0,\"shoes_2\":0,\"makeup_4\":0}}],\"weapons\":[{\"ammo\":1,\"name\":\"WEAPON_BALL\"},{\"ammo\":249,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_SAWNOFFSHOTGUN\"},{\"ammo\":250,\"name\":\"WEAPON_STUNGUN\"},{\"ammo\":10,\"name\":\"WEAPON_SNIPERRIFLE\"},{\"ammo\":0,\"name\":\"WEAPON_HEAVYPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTSMG\"},{\"ammo\":250,\"name\":\"WEAPON_STUNGUN\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":0,\"name\":\"WEAPON_APPISTOL\"},{\"ammo\":242,\"name\":\"WEAPON_ASSAULTSMG\"},{\"ammo\":242,\"name\":\"WEAPON_CARBINERIFLE\"},{\"ammo\":248,\"name\":\"WEAPON_SAWNOFFSHOTGUN\"},{\"ammo\":250,\"name\":\"WEAPON_SNIPERRIFLE\"}]}'),
(191, 'user_mask', 'steam:11000011c7b5be5', '{}'),
(192, 'user_ears', 'steam:11000011c7b5be5', '{}'),
(193, 'property', 'steam:110000111bfcd46', '{}'),
(194, 'user_glasses', 'steam:110000111bfcd46', '{}'),
(195, 'user_mask', 'steam:110000111bfcd46', '{}'),
(196, 'user_ears', 'steam:110000111bfcd46', '{}'),
(197, 'user_helmet', 'steam:110000111bfcd46', '{}'),
(198, 'user_ears', 'steam:11000011ce402c4', '{}'),
(199, 'user_helmet', 'steam:11000011ce402c4', '{}'),
(200, 'user_glasses', 'steam:11000011ce402c4', '{}'),
(201, 'user_mask', 'steam:11000011ce402c4', '{\"skin\":{\"mask_1\":51,\"mask_2\":6},\"hasMask\":true}'),
(202, 'property', 'steam:11000011ce402c4', '{\"dressing\":[{\"label\":\"CHIC\",\"skin\":{\"makeup_2\":0,\"beard_4\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":0,\"chain_2\":0,\"lipstick_1\":0,\"beard_1\":14,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":1,\"glasses_1\":5,\"bags_1\":0,\"skin\":12,\"shoes_1\":20,\"bproof_1\":0,\"tshirt_1\":74,\"bproof_2\":0,\"pants_2\":0,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":4,\"pants_1\":28,\"ears_1\":0,\"decals_2\":0,\"lipstick_3\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":20,\"makeup_1\":60,\"bags_2\":0,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"lipstick_2\":0,\"face\":12,\"tshirt_2\":3,\"mask_2\":0,\"hair_1\":13,\"hair_color_2\":47,\"eyebrows_2\":10,\"mask_1\":0,\"torso_1\":32,\"sex\":0,\"helmet_1\":-1,\"hair_color_1\":30,\"shoes_2\":7,\"makeup_4\":29}},{\"label\":\"Gang\",\"skin\":{\"makeup_2\":0,\"beard_4\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":3,\"chain_2\":0,\"lipstick_1\":0,\"beard_1\":3,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":30,\"glasses_1\":8,\"bags_1\":45,\"skin\":12,\"shoes_1\":9,\"bproof_1\":0,\"tshirt_1\":15,\"bproof_2\":0,\"pants_2\":0,\"eyebrows_3\":0,\"age_2\":0,\"sex\":0,\"hair_color_1\":0,\"ears_1\":0,\"mask_1\":51,\"lipstick_3\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":50,\"makeup_1\":56,\"bags_2\":0,\"helmet_2\":2,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"lipstick_2\":0,\"hair_1\":15,\"tshirt_2\":0,\"mask_2\":6,\"face\":12,\"hair_color_2\":0,\"eyebrows_2\":10,\"glasses_2\":0,\"decals_2\":0,\"torso_1\":126,\"helmet_1\":59,\"pants_1\":81,\"shoes_2\":5,\"makeup_4\":29}}]}'),
(203, 'user_mask', 'steam:11000011acec85a', '{\"skin\":{\"mask_2\":0,\"mask_1\":54},\"hasMask\":true}'),
(204, 'user_helmet', 'steam:11000011acec85a', '{\"hasHelmet\":true,\"skin\":{\"helmet_2\":13,\"helmet_1\":96}}'),
(205, 'user_glasses', 'steam:11000011acec85a', '{}');
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(206, 'property', 'steam:11000011acec85a', '{\"dressing\":[{\"skin\":{\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"tshirt_1\":15,\"chain_2\":0,\"age_2\":0,\"makeup_2\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":44,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":5,\"mask_1\":0,\"eyebrows_2\":10,\"ears_1\":0,\"eyebrows_4\":0,\"helmet_1\":-1,\"skin\":11,\"lipstick_1\":0,\"pants_1\":16,\"bags_2\":0,\"decals_2\":0,\"bproof_1\":0,\"lipstick_2\":0,\"torso_1\":237,\"shoes_2\":0,\"eyebrows_1\":2,\"beard_4\":0,\"glasses_2\":1,\"makeup_3\":0,\"helmet_2\":0,\"bags_1\":0,\"hair_color_2\":0,\"glasses_1\":5,\"hair_color_1\":7,\"makeup_1\":0,\"shoes_1\":16,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":4,\"pants_2\":3,\"sex\":0,\"hair_1\":19,\"beard_1\":13,\"eyebrows_3\":5,\"decals_1\":0},\"label\":\"Plage\"},{\"skin\":{\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":2,\"ears_2\":0,\"age_1\":0,\"tshirt_1\":32,\"chain_2\":0,\"age_2\":0,\"makeup_2\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":44,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":4,\"mask_1\":0,\"eyebrows_2\":10,\"ears_1\":0,\"eyebrows_4\":0,\"helmet_1\":-1,\"skin\":11,\"lipstick_1\":0,\"pants_1\":25,\"bags_2\":0,\"decals_2\":0,\"bproof_1\":0,\"lipstick_2\":0,\"torso_1\":32,\"shoes_2\":0,\"eyebrows_1\":2,\"beard_4\":0,\"glasses_2\":1,\"makeup_3\":0,\"helmet_2\":0,\"bags_1\":0,\"hair_color_2\":0,\"glasses_1\":5,\"hair_color_1\":17,\"makeup_1\":0,\"shoes_1\":10,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":2,\"pants_2\":2,\"sex\":0,\"hair_1\":19,\"beard_1\":13,\"eyebrows_3\":5,\"decals_1\":0},\"label\":\"Costar\"},{\"skin\":{\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"tshirt_1\":15,\"chain_2\":0,\"age_2\":0,\"makeup_2\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":44,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":4,\"mask_1\":0,\"eyebrows_2\":10,\"ears_1\":0,\"hair_color_2\":0,\"decals_2\":0,\"skin\":11,\"hair_color_1\":17,\"pants_1\":28,\"helmet_2\":0,\"lipstick_1\":0,\"helmet_1\":-1,\"lipstick_2\":0,\"eyebrows_4\":0,\"bproof_1\":0,\"shoes_2\":15,\"beard_4\":0,\"bags_1\":0,\"makeup_3\":0,\"eyebrows_1\":2,\"bags_2\":0,\"torso_1\":111,\"glasses_1\":5,\"shoes_1\":12,\"sex\":0,\"glasses_2\":1,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":3,\"pants_2\":0,\"makeup_1\":0,\"hair_1\":19,\"beard_1\":13,\"eyebrows_3\":5,\"decals_1\":0},\"label\":\"Froid\"},{\"skin\":{\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"tshirt_1\":15,\"chain_2\":0,\"age_2\":0,\"makeup_2\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":44,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":4,\"mask_1\":0,\"eyebrows_2\":10,\"ears_1\":0,\"hair_color_2\":0,\"decals_2\":0,\"skin\":11,\"hair_color_1\":17,\"pants_1\":67,\"helmet_2\":0,\"lipstick_1\":0,\"helmet_1\":-1,\"lipstick_2\":0,\"eyebrows_4\":0,\"bproof_1\":0,\"shoes_2\":3,\"beard_4\":0,\"bags_1\":0,\"makeup_3\":0,\"eyebrows_1\":2,\"bags_2\":0,\"torso_1\":148,\"glasses_1\":5,\"shoes_1\":46,\"sex\":0,\"glasses_2\":1,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":1,\"pants_2\":1,\"makeup_1\":0,\"hair_1\":19,\"beard_1\":13,\"eyebrows_3\":5,\"decals_1\":0},\"label\":\"Course\"},{\"skin\":{\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"tshirt_1\":15,\"chain_2\":0,\"age_2\":0,\"makeup_2\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":44,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":17,\"mask_1\":0,\"eyebrows_2\":10,\"ears_1\":0,\"hair_color_2\":0,\"decals_2\":0,\"skin\":11,\"hair_color_1\":17,\"pants_1\":67,\"helmet_2\":16,\"lipstick_1\":0,\"helmet_1\":82,\"lipstick_2\":0,\"eyebrows_4\":0,\"bproof_1\":0,\"shoes_2\":3,\"beard_4\":0,\"bags_1\":0,\"makeup_3\":0,\"eyebrows_1\":2,\"bags_2\":0,\"torso_1\":148,\"glasses_1\":5,\"shoes_1\":46,\"sex\":0,\"glasses_2\":1,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":1,\"pants_2\":1,\"makeup_1\":0,\"hair_1\":19,\"beard_1\":13,\"eyebrows_3\":5,\"decals_1\":0},\"label\":\"Course\"},{\"skin\":{\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":1,\"ears_2\":0,\"age_1\":0,\"tshirt_1\":23,\"chain_2\":0,\"age_2\":0,\"makeup_2\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":44,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":4,\"mask_1\":0,\"eyebrows_2\":10,\"ears_1\":0,\"hair_color_2\":0,\"hair_color_1\":9,\"skin\":11,\"lipstick_1\":0,\"pants_1\":24,\"bags_2\":0,\"makeup_1\":0,\"bproof_1\":0,\"lipstick_2\":0,\"torso_1\":191,\"shoes_2\":7,\"eyebrows_1\":2,\"beard_4\":0,\"decals_2\":0,\"makeup_3\":0,\"helmet_2\":0,\"bags_1\":0,\"helmet_1\":-1,\"glasses_1\":5,\"shoes_1\":8,\"sex\":0,\"glasses_2\":1,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":22,\"pants_2\":0,\"eyebrows_4\":0,\"hair_1\":19,\"beard_1\":13,\"eyebrows_3\":5,\"decals_1\":0},\"label\":\"Posé\"},{\"skin\":{\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"tshirt_1\":129,\"chain_2\":0,\"age_2\":0,\"makeup_2\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":25,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":31,\"mask_1\":0,\"eyebrows_2\":10,\"ears_1\":0,\"eyebrows_4\":0,\"helmet_1\":-1,\"skin\":11,\"lipstick_1\":0,\"pants_1\":33,\"bags_2\":0,\"decals_2\":0,\"bproof_1\":0,\"lipstick_2\":0,\"torso_1\":53,\"shoes_2\":0,\"eyebrows_1\":2,\"beard_4\":0,\"glasses_2\":6,\"makeup_3\":0,\"helmet_2\":0,\"bags_1\":0,\"hair_color_2\":0,\"glasses_1\":15,\"hair_color_1\":41,\"makeup_1\":0,\"shoes_1\":25,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":0,\"pants_2\":0,\"sex\":0,\"hair_1\":50,\"beard_1\":13,\"eyebrows_3\":5,\"decals_1\":0},\"label\":\"Securité\"},{\"skin\":{\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"tshirt_1\":15,\"chain_2\":0,\"age_2\":0,\"makeup_2\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":25,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":4,\"mask_1\":0,\"eyebrows_2\":10,\"ears_1\":0,\"eyebrows_4\":0,\"hair_color_1\":41,\"skin\":11,\"lipstick_1\":0,\"bags_1\":0,\"helmet_1\":-1,\"shoes_1\":32,\"shoes_2\":12,\"lipstick_2\":0,\"bags_2\":0,\"makeup_1\":0,\"eyebrows_1\":2,\"beard_4\":0,\"bproof_1\":0,\"makeup_3\":0,\"helmet_2\":0,\"hair_color_2\":0,\"torso_1\":200,\"glasses_1\":4,\"pants_1\":26,\"sex\":0,\"glasses_2\":6,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":12,\"pants_2\":0,\"decals_2\":0,\"hair_1\":50,\"beard_1\":13,\"eyebrows_3\":5,\"decals_1\":0},\"label\":\"Sweet R\"},{\"skin\":{\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"tshirt_1\":32,\"chain_2\":0,\"age_2\":0,\"makeup_2\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":25,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":17,\"mask_1\":0,\"eyebrows_2\":10,\"ears_1\":0,\"hair_color_2\":0,\"bags_2\":0,\"skin\":11,\"lipstick_1\":0,\"pants_1\":25,\"helmet_1\":-1,\"shoes_1\":10,\"bproof_1\":0,\"lipstick_2\":0,\"eyebrows_4\":0,\"makeup_1\":0,\"eyebrows_1\":2,\"beard_4\":0,\"bags_1\":0,\"makeup_3\":0,\"helmet_2\":0,\"shoes_2\":0,\"torso_1\":32,\"glasses_1\":5,\"decals_2\":0,\"sex\":0,\"glasses_2\":1,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":0,\"pants_2\":0,\"beard_1\":13,\"hair_1\":50,\"hair_color_1\":41,\"eyebrows_3\":5,\"decals_1\":0},\"label\":\"Costar 2\"},{\"skin\":{\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":3,\"ears_2\":0,\"age_1\":0,\"tshirt_1\":71,\"chain_2\":0,\"age_2\":0,\"makeup_2\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":27,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":17,\"mask_1\":0,\"eyebrows_2\":10,\"ears_1\":0,\"hair_color_2\":0,\"hair_color_1\":37,\"skin\":11,\"lipstick_1\":0,\"pants_1\":31,\"bags_2\":0,\"makeup_1\":0,\"bproof_1\":0,\"lipstick_2\":0,\"torso_1\":224,\"makeup_3\":0,\"eyebrows_1\":2,\"beard_4\":0,\"shoes_1\":60,\"shoes_2\":0,\"helmet_2\":0,\"bags_1\":0,\"helmet_1\":-1,\"glasses_1\":4,\"decals_2\":0,\"sex\":0,\"glasses_2\":6,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":0,\"pants_2\":0,\"eyebrows_4\":0,\"hair_1\":50,\"beard_1\":13,\"eyebrows_3\":5,\"decals_1\":0},\"label\":\"Noir\"},{\"skin\":{\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":1,\"ears_2\":0,\"age_1\":0,\"tshirt_1\":59,\"chain_2\":0,\"age_2\":0,\"makeup_2\":0,\"bproof_1\":0,\"beard_3\":0,\"face\":40,\"chain_1\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":41,\"mask_1\":0,\"bags_1\":0,\"eyebrows_2\":10,\"hair_color_2\":0,\"decals_2\":0,\"skin\":11,\"hair_color_1\":18,\"pants_1\":25,\"shoes_1\":25,\"helmet_1\":-1,\"makeup_4\":0,\"lipstick_2\":0,\"lipstick_4\":0,\"bags_2\":0,\"eyebrows_1\":2,\"beard_4\":0,\"ears_1\":2,\"shoes_2\":0,\"helmet_2\":0,\"makeup_1\":0,\"sex\":0,\"glasses_1\":5,\"torso_1\":55,\"eyebrows_4\":0,\"glasses_2\":1,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":0,\"pants_2\":0,\"makeup_3\":0,\"hair_1\":52,\"beard_1\":13,\"eyebrows_3\":5,\"lipstick_1\":0},\"label\":\"Flic Gilet\"}],\"weapons\":[{\"name\":\"WEAPON_APPISTOL\",\"ammo\":250},{\"name\":\"WEAPON_ASSAULTSMG\",\"ammo\":250},{\"name\":\"WEAPON_SMG\",\"ammo\":0},{\"name\":\"WEAPON_CARBINERIFLE\",\"ammo\":250},{\"name\":\"WEAPON_COMPACTRIFLE\",\"ammo\":0},{\"name\":\"WEAPON_VINTAGEPISTOL\",\"ammo\":0},{\"name\":\"WEAPON_FIREEXTINGUISHER\",\"ammo\":500},{\"name\":\"WEAPON_SMOKEGRENADE\",\"ammo\":25},{\"name\":\"WEAPON_STICKYBOMB\",\"ammo\":25},{\"name\":\"WEAPON_MG\",\"ammo\":250},{\"name\":\"WEAPON_PISTOL50\",\"ammo\":250},{\"name\":\"WEAPON_ADVANCEDRIFLE\",\"ammo\":247},{\"name\":\"WEAPON_CROWBAR\",\"ammo\":0},{\"name\":\"WEAPON_KNIFE\",\"ammo\":0}]}'),
(207, 'user_ears', 'steam:11000011acec85a', '{}'),
(208, 'user_glasses', 'steam:110000132a349ee', '{}'),
(209, 'user_helmet', 'steam:110000132a349ee', '{}'),
(210, 'user_mask', 'steam:110000132a349ee', '{}'),
(211, 'property', 'steam:110000132a349ee', '{}'),
(212, 'user_ears', 'steam:110000132a349ee', '{}'),
(213, 'user_mask', 'steam:11000010bb4b9f1', '{\"skin\":{\"mask_1\":28,\"mask_2\":0},\"hasMask\":true}'),
(214, 'user_helmet', 'steam:11000010bb4b9f1', '{\"hasHelmet\":true,\"skin\":{\"helmet_2\":4,\"helmet_1\":18}}'),
(215, 'user_glasses', 'steam:11000010bb4b9f1', '{}'),
(216, 'property', 'steam:11000010bb4b9f1', '{\"dressing\":[{\"skin\":{\"bags_1\":0,\"skin\":3,\"lipstick_3\":0,\"decals_2\":0,\"makeup_3\":0,\"bags_2\":0,\"ears_2\":0,\"lipstick_2\":0,\"beard_1\":6,\"shoes_2\":0,\"arms\":42,\"hair_color_2\":0,\"mask_1\":0,\"face\":2,\"pants_2\":0,\"bproof_1\":0,\"hair_1\":14,\"tshirt_2\":0,\"sex\":0,\"age_2\":0,\"hair_2\":2,\"glasses_1\":3,\"helmet_1\":-1,\"torso_1\":30,\"ears_1\":25,\"decals_1\":0,\"shoes_1\":10,\"mask_2\":0,\"age_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"lipstick_1\":0,\"helmet_2\":1,\"eyebrows_4\":0,\"bproof_2\":0,\"lipstick_4\":0,\"hair_color_1\":0,\"makeup_1\":0,\"tshirt_1\":35,\"makeup_2\":0,\"beard_3\":0,\"eyebrows_2\":10,\"chain_2\":0,\"pants_1\":28,\"beard_4\":0,\"torso_2\":0,\"makeup_4\":0,\"chain_1\":0,\"beard_2\":10,\"eyebrows_3\":0},\"label\":\"classe\"},{\"skin\":{\"bags_1\":0,\"skin\":3,\"lipstick_3\":0,\"decals_2\":0,\"makeup_3\":0,\"bags_2\":0,\"ears_2\":0,\"lipstick_2\":0,\"beard_1\":6,\"shoes_2\":6,\"chain_2\":0,\"hair_color_2\":0,\"sex\":0,\"face\":2,\"pants_2\":0,\"bproof_1\":0,\"hair_1\":14,\"tshirt_2\":0,\"glasses_1\":3,\"beard_3\":0,\"hair_2\":2,\"mask_2\":0,\"helmet_1\":-1,\"torso_1\":142,\"ears_1\":25,\"decals_1\":0,\"shoes_1\":12,\"tshirt_1\":72,\"age_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"lipstick_1\":0,\"helmet_2\":1,\"eyebrows_4\":0,\"bproof_2\":0,\"lipstick_4\":0,\"hair_color_1\":0,\"makeup_1\":0,\"mask_1\":0,\"arms\":96,\"age_2\":0,\"makeup_2\":0,\"eyebrows_2\":10,\"chain_1\":0,\"beard_4\":0,\"torso_2\":0,\"makeup_4\":0,\"eyebrows_3\":0,\"beard_2\":10,\"pants_1\":28},\"label\":\"mouais\"},{\"skin\":{\"bags_1\":0,\"skin\":3,\"lipstick_3\":0,\"decals_2\":0,\"makeup_3\":0,\"beard_4\":0,\"ears_2\":0,\"lipstick_2\":0,\"beard_1\":6,\"shoes_2\":4,\"arms\":96,\"hair_color_2\":44,\"sex\":0,\"face\":2,\"pants_2\":0,\"bproof_1\":0,\"hair_1\":14,\"tshirt_2\":0,\"eyebrows_2\":10,\"beard_3\":0,\"hair_2\":0,\"torso_2\":0,\"tshirt_1\":55,\"torso_1\":53,\"ears_1\":25,\"decals_1\":0,\"shoes_1\":62,\"glasses_1\":0,\"age_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"lipstick_1\":0,\"helmet_2\":1,\"eyebrows_4\":0,\"bproof_2\":0,\"age_2\":0,\"mask_2\":0,\"makeup_1\":0,\"lipstick_4\":0,\"bags_2\":0,\"mask_1\":0,\"chain_1\":0,\"helmet_1\":-1,\"chain_2\":0,\"hair_color_1\":0,\"makeup_2\":0,\"pants_1\":26,\"eyebrows_3\":0,\"beard_2\":10,\"makeup_4\":0},\"label\":\"tuer\"}]}'),
(217, 'user_ears', 'steam:11000010bb4b9f1', '{}'),
(218, 'property', 'steam:11000013613fa78', '{\"dressing\":[{\"skin\":{\"bproof_2\":0,\"makeup_3\":0,\"pants_1\":25,\"sex\":1,\"mask_2\":0,\"shoes_1\":0,\"makeup_1\":0,\"ears_2\":0,\"lipstick_2\":10,\"hair_color_2\":0,\"helmet_2\":0,\"beard_1\":0,\"torso_2\":0,\"beard_4\":0,\"chain_2\":0,\"chain_1\":0,\"tshirt_1\":13,\"age_1\":0,\"decals_1\":0,\"bags_1\":0,\"makeup_2\":0,\"age_2\":0,\"glasses_1\":1,\"hair_1\":3,\"shoes_2\":1,\"hair_2\":0,\"pants_2\":0,\"bproof_1\":0,\"decals_2\":0,\"lipstick_1\":3,\"makeup_4\":0,\"eyebrows_2\":10,\"tshirt_2\":3,\"face\":40,\"arms\":0,\"ears_1\":-1,\"lipstick_4\":0,\"beard_2\":0,\"glasses_2\":0,\"eyebrows_4\":0,\"eyebrows_3\":0,\"helmet_1\":-1,\"torso_1\":8,\"mask_1\":0,\"skin\":0,\"lipstick_3\":23,\"hair_color_1\":12,\"beard_3\":0,\"eyebrows_1\":0,\"bags_2\":0},\"label\":\"tchoin\"},{\"skin\":{\"bproof_2\":0,\"makeup_3\":0,\"pants_1\":43,\"sex\":1,\"mask_2\":0,\"shoes_1\":25,\"makeup_1\":0,\"ears_2\":0,\"lipstick_2\":10,\"chain_1\":0,\"helmet_2\":0,\"beard_1\":0,\"torso_2\":2,\"beard_4\":0,\"chain_2\":0,\"bags_1\":0,\"tshirt_1\":13,\"age_1\":0,\"lipstick_3\":23,\"lipstick_4\":0,\"makeup_2\":0,\"age_2\":0,\"glasses_1\":11,\"hair_2\":0,\"shoes_2\":0,\"lipstick_1\":3,\"pants_2\":0,\"hair_color_2\":0,\"bproof_1\":0,\"hair_1\":3,\"makeup_4\":0,\"eyebrows_2\":10,\"tshirt_2\":3,\"helmet_1\":-1,\"face\":40,\"decals_1\":0,\"ears_1\":-1,\"beard_2\":0,\"glasses_2\":0,\"torso_1\":81,\"arms\":18,\"decals_2\":0,\"eyebrows_3\":0,\"mask_1\":0,\"skin\":0,\"eyebrows_4\":0,\"hair_color_1\":12,\"beard_3\":0,\"bags_2\":0,\"eyebrows_1\":0},\"label\":\"gang\"},{\"skin\":{\"bproof_2\":0,\"makeup_3\":0,\"pants_1\":43,\"sex\":1,\"mask_2\":0,\"shoes_1\":1,\"makeup_1\":0,\"makeup_4\":0,\"lipstick_2\":10,\"hair_color_2\":0,\"helmet_2\":0,\"beard_1\":0,\"torso_2\":0,\"beard_4\":0,\"face\":40,\"bags_1\":0,\"tshirt_1\":13,\"age_1\":0,\"lipstick_3\":23,\"ears_2\":0,\"makeup_2\":0,\"age_2\":0,\"lipstick_1\":3,\"eyebrows_1\":0,\"decals_2\":0,\"pants_2\":2,\"bproof_1\":0,\"chain_1\":0,\"hair_2\":0,\"hair_1\":3,\"helmet_1\":-1,\"eyebrows_2\":10,\"tshirt_2\":3,\"bags_2\":0,\"decals_1\":0,\"ears_1\":-1,\"arms\":4,\"beard_2\":0,\"eyebrows_3\":0,\"torso_1\":209,\"glasses_1\":1,\"shoes_2\":1,\"lipstick_4\":0,\"chain_2\":0,\"skin\":0,\"mask_1\":0,\"hair_color_1\":12,\"beard_3\":0,\"glasses_2\":0,\"eyebrows_4\":0},\"label\":\"bigness\"},{\"skin\":{\"bproof_2\":0,\"makeup_3\":0,\"pants_1\":4,\"sex\":1,\"mask_2\":0,\"shoes_1\":2,\"lipstick_4\":0,\"ears_2\":0,\"bags_2\":0,\"hair_color_2\":22,\"helmet_2\":0,\"beard_1\":0,\"torso_2\":1,\"eyebrows_1\":0,\"face\":45,\"bags_1\":0,\"tshirt_1\":8,\"age_1\":0,\"lipstick_3\":49,\"pants_2\":1,\"makeup_2\":0,\"age_2\":0,\"lipstick_1\":0,\"decals_2\":0,\"shoes_2\":1,\"hair_2\":0,\"bproof_1\":0,\"chain_1\":0,\"hair_1\":4,\"helmet_1\":-1,\"makeup_4\":0,\"eyebrows_2\":10,\"tshirt_2\":0,\"decals_1\":0,\"ears_1\":-1,\"arms\":4,\"glasses_1\":1,\"beard_2\":0,\"glasses_2\":0,\"eyebrows_4\":0,\"chain_2\":0,\"makeup_1\":0,\"torso_1\":74,\"mask_1\":0,\"skin\":45,\"eyebrows_3\":0,\"hair_color_1\":60,\"beard_3\":0,\"lipstick_2\":7,\"beard_4\":0},\"label\":\"biker\"},{\"skin\":{\"bproof_2\":0,\"makeup_3\":0,\"pants_1\":15,\"sex\":1,\"mask_2\":0,\"shoes_1\":19,\"makeup_1\":0,\"makeup_4\":0,\"bags_2\":0,\"hair_color_2\":22,\"helmet_2\":0,\"beard_1\":0,\"torso_2\":1,\"beard_4\":0,\"face\":45,\"bags_1\":0,\"tshirt_1\":9,\"age_1\":0,\"lipstick_3\":49,\"pants_2\":0,\"makeup_2\":0,\"age_2\":0,\"lipstick_1\":0,\"eyebrows_1\":0,\"shoes_2\":4,\"lipstick_4\":0,\"bproof_1\":0,\"hair_2\":0,\"chain_1\":0,\"hair_1\":4,\"torso_1\":21,\"eyebrows_2\":10,\"tshirt_2\":0,\"helmet_1\":51,\"decals_2\":0,\"decals_1\":0,\"ears_1\":-1,\"beard_2\":0,\"eyebrows_3\":0,\"eyebrows_4\":0,\"arms\":37,\"glasses_1\":1,\"ears_2\":0,\"chain_2\":0,\"skin\":45,\"lipstick_2\":7,\"hair_color_1\":60,\"beard_3\":0,\"mask_1\":0,\"glasses_2\":0},\"label\":\"robe\"},{\"skin\":{\"bproof_2\":0,\"makeup_3\":0,\"pants_1\":102,\"sex\":1,\"mask_2\":0,\"shoes_1\":73,\"hair_1\":4,\"ears_2\":0,\"lipstick_2\":7,\"hair_color_2\":22,\"helmet_2\":0,\"beard_1\":0,\"torso_2\":1,\"beard_4\":0,\"face\":45,\"chain_1\":0,\"tshirt_1\":67,\"age_1\":0,\"lipstick_3\":49,\"bags_1\":0,\"makeup_2\":0,\"age_2\":0,\"glasses_1\":1,\"pants_2\":0,\"shoes_2\":3,\"eyebrows_1\":0,\"bproof_1\":0,\"lipstick_4\":0,\"helmet_1\":-1,\"hair_2\":0,\"decals_2\":0,\"eyebrows_2\":10,\"tshirt_2\":3,\"torso_1\":70,\"lipstick_1\":0,\"mask_1\":0,\"decals_1\":0,\"beard_2\":0,\"glasses_2\":0,\"eyebrows_4\":0,\"eyebrows_3\":0,\"arms\":37,\"chain_2\":0,\"makeup_4\":0,\"skin\":45,\"makeup_1\":0,\"hair_color_1\":60,\"beard_3\":0,\"ears_1\":-1,\"bags_2\":0},\"label\":\"tueuse\"}],\"weapons\":[{\"ammo\":0,\"name\":\"WEAPON_FLASHLIGHT\"},{\"name\":\"WEAPON_MACHETE\",\"ammo\":0},{\"ammo\":250,\"name\":\"WEAPON_HEAVYPISTOL\"},{\"name\":\"WEAPON_PISTOL50\",\"ammo\":0},{\"ammo\":0,\"name\":\"WEAPON_BAT\"},{\"name\":\"WEAPON_SNIPERRIFLE\",\"ammo\":42},{\"ammo\":42,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"name\":\"WEAPON_SNIPERRIFLE\",\"ammo\":42},{\"ammo\":42,\"name\":\"WEAPON_SNIPERRIFLE\"},{\"ammo\":0,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"name\":\"WEAPON_KNIFE\",\"ammo\":0},{\"ammo\":0,\"name\":\"WEAPON_HAMMER\"},{\"name\":\"WEAPON_BAT\",\"ammo\":0},{\"ammo\":250,\"name\":\"WEAPON_PISTOL50\"},{\"name\":\"WEAPON_HEAVYPISTOL\",\"ammo\":0},{\"ammo\":0,\"name\":\"WEAPON_SNSPISTOL\"},{\"name\":\"WEAPON_MUSKET\",\"ammo\":42},{\"ammo\":0,\"name\":\"WEAPON_HATCHET\"},{\"name\":\"WEAPON_MACHETE\",\"ammo\":0},{\"ammo\":0,\"name\":\"WEAPON_KNUCKLE\"},{\"name\":\"WEAPON_CROWBAR\",\"ammo\":0},{\"ammo\":0,\"name\":\"WEAPON_VINTAGEPISTOL\"},{\"name\":\"WEAPON_FLASHLIGHT\",\"ammo\":0},{\"ammo\":0,\"name\":\"WEAPON_REVOLVER\"},{\"name\":\"WEAPON_GOLFCLUB\",\"ammo\":0}]}'),
(219, 'user_ears', 'steam:11000013613fa78', '{}'),
(220, 'user_glasses', 'steam:11000013613fa78', '{}'),
(221, 'user_mask', 'steam:11000013613fa78', '{\"hasMask\":true,\"skin\":{\"mask_2\":2,\"mask_1\":63}}'),
(222, 'user_helmet', 'steam:11000013613fa78', '{\"hasHelmet\":true,\"skin\":{\"helmet_2\":0,\"helmet_1\":51}}'),
(223, 'user_mask', 'steam:110000111a58cab', '{}'),
(224, 'user_helmet', 'steam:110000111a58cab', '{}'),
(225, 'user_glasses', 'steam:110000111a58cab', '{}'),
(226, 'user_ears', 'steam:110000111a58cab', '{}'),
(227, 'property', 'steam:110000111a58cab', '{}'),
(228, 'user_mask', 'steam:11000011760b77b', '{}'),
(229, 'property', 'steam:11000011760b77b', '{}'),
(230, 'user_ears', 'steam:11000011760b77b', '{}'),
(231, 'user_glasses', 'steam:11000011760b77b', '{}'),
(232, 'user_helmet', 'steam:11000011760b77b', '{}'),
(233, 'user_glasses', 'steam:110000110bff738', '{}'),
(234, 'property', 'steam:110000110bff738', '{}'),
(235, 'user_ears', 'steam:110000110bff738', '{}'),
(236, 'user_mask', 'steam:110000110bff738', '{}'),
(237, 'user_helmet', 'steam:110000110bff738', '{}'),
(238, 'user_helmet', 'steam:11000010f8be390', '{}'),
(239, 'property', 'steam:11000010f8be390', '{}'),
(240, 'user_ears', 'steam:11000010f8be390', '{}'),
(241, 'user_mask', 'steam:11000010f8be390', '{}'),
(242, 'user_glasses', 'steam:11000010f8be390', '{}'),
(243, 'user_ears', 'steam:110000112856892', '{}'),
(244, 'property', 'steam:1100001154fdc54', '{\"dressing\":[{\"skin\":{\"tshirt_1\":7,\"shoes_1\":1,\"beard_3\":0,\"chain_1\":0,\"bproof_1\":0,\"hair_1\":3,\"sex\":0,\"skin\":0,\"glasses_1\":5,\"makeup_3\":0,\"makeup_4\":0,\"face\":11,\"torso_1\":143,\"glasses_2\":5,\"decals_1\":0,\"beard_2\":10,\"eyebrows_3\":1,\"eyebrows_1\":0,\"ears_2\":0,\"makeup_2\":0,\"hair_color_2\":29,\"chain_2\":0,\"eyebrows_4\":0,\"shoes_2\":0,\"mask_1\":116,\"mask_2\":12,\"pants_2\":2,\"makeup_1\":0,\"tshirt_2\":0,\"helmet_2\":2,\"pants_1\":55,\"helmet_1\":14,\"hair_color_1\":0,\"bags_1\":0,\"torso_2\":2,\"ears_1\":-1,\"lipstick_1\":0,\"age_1\":0,\"beard_1\":10,\"beard_4\":0,\"eyebrows_2\":10,\"lipstick_4\":0,\"lipstick_3\":0,\"hair_2\":0,\"bags_2\":0,\"bproof_2\":0,\"age_2\":0,\"lipstick_2\":0,\"decals_2\":0,\"arms\":59},\"label\":\"gang\"},{\"skin\":{\"tshirt_1\":15,\"ears_1\":-1,\"beard_3\":0,\"chain_1\":0,\"bproof_1\":0,\"hair_1\":3,\"age_2\":0,\"hair_2\":0,\"glasses_1\":5,\"makeup_3\":0,\"makeup_4\":0,\"face\":11,\"torso_1\":143,\"glasses_2\":5,\"decals_1\":0,\"beard_2\":10,\"eyebrows_3\":1,\"eyebrows_1\":0,\"ears_2\":0,\"skin\":0,\"pants_1\":55,\"hair_color_2\":29,\"eyebrows_4\":0,\"eyebrows_2\":10,\"mask_1\":116,\"mask_2\":12,\"pants_2\":2,\"makeup_1\":0,\"tshirt_2\":0,\"helmet_2\":2,\"bags_1\":0,\"lipstick_1\":0,\"hair_color_1\":0,\"shoes_2\":0,\"torso_2\":2,\"helmet_1\":14,\"makeup_2\":0,\"chain_2\":0,\"age_1\":0,\"beard_4\":0,\"beard_1\":10,\"lipstick_4\":0,\"lipstick_3\":0,\"shoes_1\":1,\"bags_2\":0,\"bproof_2\":0,\"sex\":0,\"lipstick_2\":0,\"decals_2\":0,\"arms\":59},\"label\":\"gang\"},{\"label\":\"gang encore\",\"skin\":{\"tshirt_1\":15,\"ears_1\":-1,\"age_1\":0,\"chain_1\":0,\"bproof_1\":0,\"hair_1\":3,\"age_2\":0,\"bags_2\":0,\"glasses_1\":5,\"makeup_3\":0,\"makeup_4\":0,\"face\":11,\"torso_1\":143,\"glasses_2\":5,\"decals_1\":0,\"beard_2\":10,\"eyebrows_3\":1,\"eyebrows_1\":0,\"ears_2\":0,\"beard_1\":10,\"tshirt_2\":0,\"arms\":59,\"makeup_2\":0,\"bags_1\":44,\"mask_1\":116,\"mask_2\":12,\"eyebrows_4\":0,\"makeup_1\":0,\"eyebrows_2\":10,\"helmet_2\":5,\"pants_2\":2,\"hair_2\":0,\"hair_color_1\":0,\"shoes_2\":0,\"torso_2\":2,\"pants_1\":55,\"lipstick_1\":0,\"lipstick_2\":0,\"skin\":0,\"beard_4\":0,\"shoes_1\":1,\"lipstick_4\":0,\"lipstick_3\":0,\"beard_3\":0,\"helmet_1\":14,\"bproof_2\":0,\"hair_color_2\":29,\"sex\":0,\"decals_2\":0,\"chain_2\":0}}]}'),
(245, 'user_helmet', 'steam:1100001154fdc54', '{}'),
(246, 'user_mask', 'steam:1100001154fdc54', '{\"skin\":{\"mask_1\":4,\"mask_2\":0},\"hasMask\":true}'),
(247, 'user_glasses', 'steam:1100001154fdc54', '{}'),
(248, 'user_ears', 'steam:1100001154fdc54', '{}'),
(249, 'user_mask', 'steam:11000011ae2da25', '{}'),
(250, 'property', 'steam:11000011ae2da25', '{}'),
(251, 'user_helmet', 'steam:11000011ae2da25', '{}'),
(252, 'user_glasses', 'steam:11000011ae2da25', '{}'),
(253, 'user_ears', 'steam:11000011ae2da25', '{}'),
(254, 'user_mask', 'steam:11000010e555ae1', '{}'),
(255, 'user_helmet', 'steam:11000010e555ae1', '{\"hasHelmet\":true,\"skin\":{\"helmet_1\":15,\"helmet_2\":1}}'),
(256, 'property', 'steam:11000010e555ae1', '{}'),
(257, 'user_glasses', 'steam:11000010e555ae1', '{}'),
(258, 'user_ears', 'steam:11000010e555ae1', '{}'),
(259, 'user_glasses', 'steam:11000010ccc8c9b', '{}'),
(260, 'user_mask', 'steam:11000010ccc8c9b', '{}'),
(261, 'property', 'steam:11000010ccc8c9b', '{}'),
(262, 'user_helmet', 'steam:11000010ccc8c9b', '{}'),
(263, 'user_ears', 'steam:11000010ccc8c9b', '{}'),
(264, 'property', 'steam:11000013260f4bc', '{}'),
(265, 'user_helmet', 'steam:11000013260f4bc', '{}'),
(266, 'user_ears', 'steam:11000013260f4bc', '{}'),
(267, 'user_mask', 'steam:11000013260f4bc', '{}'),
(268, 'user_glasses', 'steam:11000013260f4bc', '{}'),
(269, 'property', 'steam:11000010f3c770c', '{\"dressing\":[{\"label\":\"Costar cravate\",\"skin\":{\"bags_2\":0,\"beard_4\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":0,\"chain_2\":0,\"lipstick_1\":0,\"beard_1\":0,\"beard_2\":0,\"ears_2\":0,\"eyebrows_1\":0,\"glasses_1\":0,\"bags_1\":0,\"skin\":4,\"shoes_1\":10,\"bproof_1\":0,\"tshirt_1\":10,\"bproof_2\":0,\"pants_2\":0,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"hair_color_1\":29,\"ears_1\":-1,\"decals_2\":0,\"lipstick_3\":0,\"decals_1\":0,\"hair_2\":3,\"arms\":4,\"face\":2,\"lipstick_2\":0,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"mask_1\":0,\"torso_1\":4,\"tshirt_2\":2,\"mask_2\":0,\"hair_1\":14,\"hair_color_2\":0,\"makeup_2\":0,\"eyebrows_2\":0,\"makeup_1\":0,\"sex\":0,\"helmet_1\":-1,\"pants_1\":35,\"shoes_2\":0,\"makeup_4\":0}},{\"label\":\"Gang\",\"skin\":{\"bags_2\":0,\"beard_4\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":0,\"chain_2\":0,\"lipstick_1\":0,\"beard_1\":0,\"beard_2\":0,\"ears_2\":0,\"eyebrows_1\":0,\"glasses_1\":0,\"bags_1\":51,\"skin\":4,\"shoes_1\":32,\"bproof_1\":0,\"tshirt_1\":74,\"bproof_2\":0,\"pants_2\":6,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"hair_color_1\":29,\"ears_1\":-1,\"decals_2\":0,\"lipstick_3\":0,\"decals_1\":0,\"hair_2\":3,\"arms\":4,\"makeup_1\":0,\"lipstick_2\":0,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"mask_1\":0,\"torso_1\":68,\"tshirt_2\":0,\"mask_2\":0,\"hair_1\":14,\"hair_color_2\":0,\"makeup_2\":0,\"eyebrows_2\":0,\"face\":2,\"sex\":0,\"helmet_1\":-1,\"pants_1\":26,\"shoes_2\":0,\"makeup_4\":0}},{\"label\":\"Costar sac\",\"skin\":{\"makeup_2\":0,\"beard_4\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"beard_3\":0,\"torso_2\":0,\"chain_2\":0,\"lipstick_1\":0,\"beard_1\":0,\"beard_2\":0,\"pants_1\":35,\"eyebrows_1\":0,\"glasses_1\":0,\"bags_1\":44,\"skin\":4,\"shoes_1\":10,\"bproof_1\":0,\"tshirt_1\":10,\"bproof_2\":0,\"pants_2\":0,\"eyebrows_3\":0,\"age_2\":0,\"glasses_2\":0,\"hair_color_1\":29,\"ears_1\":-1,\"decals_2\":0,\"lipstick_3\":0,\"decals_1\":0,\"face\":2,\"arms\":4,\"makeup_1\":0,\"hair_2\":3,\"helmet_2\":0,\"chain_1\":0,\"lipstick_4\":0,\"age_1\":0,\"lipstick_2\":0,\"torso_1\":4,\"tshirt_2\":2,\"mask_2\":0,\"bags_2\":0,\"hair_1\":14,\"mask_1\":0,\"hair_color_2\":0,\"eyebrows_2\":0,\"sex\":0,\"helmet_1\":-1,\"ears_2\":0,\"shoes_2\":0,\"makeup_4\":0}}]}'),
(270, 'user_mask', 'steam:11000010f3c770c', '{\"skin\":{\"mask_2\":0,\"mask_1\":95},\"hasMask\":true}'),
(271, 'user_glasses', 'steam:11000010f3c770c', '{}'),
(272, 'user_helmet', 'steam:11000010f3c770c', '{\"skin\":{\"helmet_1\":62,\"helmet_2\":6},\"hasHelmet\":true}'),
(273, 'user_ears', 'steam:11000010f3c770c', '{}'),
(274, 'user_ears', 'steam:11000010c4036d7', '{}'),
(275, 'property', 'steam:11000010c4036d7', '{}'),
(276, 'user_glasses', 'steam:11000010c4036d7', '{}'),
(277, 'user_mask', 'steam:11000010c4036d7', '{}'),
(278, 'user_helmet', 'steam:11000010c4036d7', '{}'),
(279, 'user_ears', 'steam:1100001076bae8a', '{}'),
(280, 'user_glasses', 'steam:1100001076bae8a', '{}'),
(281, 'user_mask', 'steam:1100001076bae8a', '{}'),
(282, 'property', 'steam:1100001076bae8a', '{}'),
(283, 'user_helmet', 'steam:1100001076bae8a', '{}'),
(284, 'user_mask', 'steam:110000118496987', '{}'),
(285, 'property', 'steam:110000118496987', '{}'),
(286, 'user_ears', 'steam:110000118496987', '{}'),
(287, 'user_helmet', 'steam:110000118496987', '{}'),
(288, 'user_glasses', 'steam:110000118496987', '{\"skin\":{\"glasses_2\":3,\"glasses_1\":5},\"hasGlasses\":true}'),
(289, 'user_helmet', 'steam:11000010f4464c0', '{}'),
(290, 'property', 'steam:11000010f4464c0', '{}'),
(291, 'user_ears', 'steam:11000010f4464c0', '{}'),
(292, 'user_glasses', 'steam:11000010f4464c0', '{}'),
(293, 'user_mask', 'steam:11000010f4464c0', '{}'),
(294, 'property', 'steam:110000109729f67', '{}'),
(295, 'user_mask', 'steam:110000109729f67', '{}'),
(296, 'user_helmet', 'steam:110000109729f67', '{}'),
(297, 'user_glasses', 'steam:110000109729f67', '{}'),
(298, 'user_ears', 'steam:110000109729f67', '{}'),
(299, 'user_glasses', 'steam:110000108f366a1', '{}'),
(300, 'property', 'steam:110000108f366a1', '{}'),
(301, 'user_mask', 'steam:110000108f366a1', '{}'),
(302, 'user_helmet', 'steam:110000108f366a1', '{\"hasHelmet\":true,\"skin\":{\"helmet_1\":15,\"helmet_2\":1}}'),
(303, 'user_ears', 'steam:110000108f366a1', '{}'),
(304, 'user_helmet', 'steam:11000011669fc09', '{}'),
(305, 'user_mask', 'steam:11000011669fc09', '{}'),
(306, 'user_glasses', 'steam:11000011669fc09', '{}'),
(307, 'user_ears', 'steam:11000011669fc09', '{}'),
(308, 'property', 'steam:11000011669fc09', '{}'),
(309, 'user_mask', 'steam:11000011172f5d0', '{}'),
(310, 'user_ears', 'steam:11000011172f5d0', '{}'),
(311, 'user_glasses', 'steam:11000011172f5d0', '{}'),
(312, 'user_helmet', 'steam:11000011172f5d0', '{}'),
(313, 'property', 'steam:11000011172f5d0', '{\"dressing\":[{\"skin\":{\"glasses\":0,\"bags_1\":0,\"skin\":4,\"lipstick_3\":0,\"decals_2\":0,\"makeup_3\":0,\"beard_4\":0,\"ears_2\":0,\"lipstick_2\":0,\"eyebrows_3\":0,\"shoes_2\":2,\"arms\":17,\"hair_color_2\":0,\"sex\":0,\"face\":0,\"pants_2\":7,\"bproof_1\":0,\"shoes\":10,\"hair_1\":73,\"tshirt_2\":0,\"eyebrows_4\":0,\"beard_3\":0,\"hair_2\":0,\"torso_2\":2,\"helmet_1\":120,\"torso_1\":86,\"ears_1\":0,\"decals_1\":0,\"shoes_1\":8,\"mask_2\":16,\"age_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"bproof_2\":0,\"chain_1\":0,\"age_2\":0,\"makeup_1\":0,\"eyebrows_2\":0,\"lipstick_4\":0,\"beard_1\":11,\"mask_1\":121,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"tshirt_1\":57,\"makeup_4\":0,\"glasses_1\":0,\"beard_2\":10,\"pants_1\":9},\"label\":\"dealer\"}]}'),
(314, 'user_glasses', 'steam:11000010fb96ddc', '{}'),
(315, 'user_mask', 'steam:11000010fb96ddc', '{}'),
(316, 'user_helmet', 'steam:11000010fb96ddc', '{}'),
(317, 'user_ears', 'steam:11000010fb96ddc', '{}'),
(318, 'property', 'steam:11000010fb96ddc', '{}'),
(319, 'user_mask', 'steam:110000118d3e52c', '{}'),
(320, 'property', 'steam:110000118d3e52c', '{}'),
(321, 'user_ears', 'steam:110000118d3e52c', '{}'),
(322, 'user_helmet', 'steam:110000118d3e52c', '{}'),
(323, 'user_glasses', 'steam:110000118d3e52c', '{}'),
(324, 'user_ears', 'steam:11000010d6914d7', '{}'),
(325, 'user_helmet', 'steam:11000010d6914d7', '{}'),
(326, 'property', 'steam:11000010d6914d7', '{}'),
(327, 'user_glasses', 'steam:11000010d6914d7', '{}'),
(328, 'user_mask', 'steam:11000010d6914d7', '{}'),
(329, 'property', 'steam:110000107122573', '{}'),
(330, 'user_mask', 'steam:110000107122573', '{}'),
(331, 'user_helmet', 'steam:110000107122573', '{}'),
(332, 'user_glasses', 'steam:110000107122573', '{}'),
(333, 'user_ears', 'steam:110000107122573', '{}'),
(334, 'property', 'steam:11000010b4bab32', '{}'),
(335, 'user_mask', 'steam:11000010b4bab32', '{}'),
(336, 'user_helmet', 'steam:11000010b4bab32', '{}'),
(337, 'user_glasses', 'steam:11000010b4bab32', '{}'),
(338, 'user_ears', 'steam:11000010b4bab32', '{}'),
(339, 'user_ears', 'steam:11000011ccff156', '{}'),
(340, 'property', 'steam:11000011ccff156', '{}'),
(341, 'user_helmet', 'steam:11000011ccff156', '{}'),
(342, 'user_glasses', 'steam:11000011ccff156', '{}'),
(343, 'user_mask', 'steam:11000011ccff156', '{}'),
(344, 'user_helmet', 'steam:11000011d24e38e', '{}'),
(345, 'user_glasses', 'steam:11000011d24e38e', '{}'),
(346, 'user_ears', 'steam:11000011d24e38e', '{}'),
(347, 'property', 'steam:11000011d24e38e', '{}'),
(348, 'user_mask', 'steam:11000011d24e38e', '{\"skin\":{\"mask_1\":23,\"mask_2\":0},\"hasMask\":true}'),
(349, 'property', 'steam:110000113e42854', '{}'),
(350, 'user_helmet', 'steam:110000113e42854', '{}'),
(351, 'user_mask', 'steam:110000113e42854', '{}'),
(352, 'user_glasses', 'steam:110000113e42854', '{}'),
(353, 'user_ears', 'steam:110000113e42854', '{}'),
(354, 'user_helmet', 'steam:11000011861fe2d', '{}'),
(355, 'user_ears', 'steam:11000011861fe2d', '{}'),
(356, 'user_mask', 'steam:11000011861fe2d', '{}'),
(357, 'property', 'steam:11000011861fe2d', '{}'),
(358, 'user_glasses', 'steam:11000011861fe2d', '{}'),
(359, 'user_helmet', 'steam:110000108f73203', '{}'),
(360, 'user_mask', 'steam:110000108f73203', '{}'),
(361, 'user_ears', 'steam:110000108f73203', '{}'),
(362, 'user_glasses', 'steam:110000108f73203', '{}'),
(363, 'property', 'steam:110000108f73203', '{}'),
(364, 'society_biker', NULL, '{}'),
(365, 'user_glasses', 'steam:1100001155e5d75', '{}'),
(366, 'property', 'steam:1100001155e5d75', '{}'),
(367, 'user_helmet', 'steam:1100001155e5d75', '{}'),
(368, 'user_ears', 'steam:1100001155e5d75', '{}'),
(369, 'user_mask', 'steam:1100001155e5d75', '{}'),
(370, 'user_ears', 'steam:1100001080602bc', '{}'),
(371, 'property', 'steam:1100001080602bc', '{}'),
(372, 'user_mask', 'steam:1100001080602bc', '{}'),
(373, 'user_helmet', 'steam:1100001080602bc', '{}'),
(374, 'user_glasses', 'steam:1100001080602bc', '{}'),
(375, 'user_helmet', 'steam:11000010e7887ad', '{}'),
(376, 'user_glasses', 'steam:11000010e7887ad', '{}'),
(377, 'property', 'steam:11000010e7887ad', '{}'),
(378, 'user_mask', 'steam:11000010e7887ad', '{}'),
(379, 'user_ears', 'steam:11000010e7887ad', '{}'),
(380, 'user_mask', 'steam:11000013621a142', '{\"skin\":{\"mask_1\":2,\"mask_2\":3},\"hasMask\":true}'),
(381, 'user_helmet', 'steam:11000013621a142', '{}'),
(382, 'property', 'steam:11000013621a142', '{}'),
(383, 'user_glasses', 'steam:11000013621a142', '{}'),
(384, 'user_ears', 'steam:11000013621a142', '{}'),
(385, 'user_glasses', 'steam:11000010f692bdd', '{}'),
(386, 'user_helmet', 'steam:11000010f692bdd', '{}'),
(387, 'property', 'steam:11000010f692bdd', '{}'),
(388, 'user_mask', 'steam:11000010f692bdd', '{}'),
(389, 'user_ears', 'steam:11000010f692bdd', '{}'),
(390, 'user_ears', 'steam:11000013582fc5f', '{}'),
(391, 'user_helmet', 'steam:11000013582fc5f', '{}'),
(392, 'user_glasses', 'steam:11000013582fc5f', '{}'),
(393, 'user_mask', 'steam:11000013582fc5f', '{\"skin\":{\"mask_1\":89,\"mask_2\":3},\"hasMask\":true}'),
(394, 'property', 'steam:11000013582fc5f', '{\"dressing\":[{\"skin\":{\"bags_1\":0,\"skin\":0,\"lipstick_3\":0,\"decals_2\":0,\"makeup_3\":0,\"bags_2\":0,\"ears_2\":0,\"lipstick_2\":0,\"eyebrows_3\":0,\"shoes_2\":2,\"arms\":8,\"hair_color_2\":0,\"sex\":0,\"face\":4,\"pants_2\":0,\"bproof_1\":0,\"hair_1\":9,\"tshirt_2\":0,\"beard_1\":2,\"beard_3\":0,\"hair_2\":0,\"eyebrows_4\":0,\"tshirt_1\":15,\"torso_1\":38,\"ears_1\":-1,\"chain_1\":0,\"shoes_1\":4,\"torso_2\":0,\"age_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"bproof_2\":0,\"decals_1\":0,\"mask_2\":0,\"makeup_1\":0,\"lipstick_4\":0,\"mask_1\":0,\"beard_2\":10,\"age_2\":0,\"helmet_1\":-1,\"chain_2\":0,\"makeup_2\":0,\"beard_4\":0,\"makeup_4\":0,\"glasses_1\":0,\"eyebrows_2\":0,\"pants_1\":26},\"label\":\"simple\"}]}'),
(395, 'user_helmet', 'steam:110000133ef6d99', '{}'),
(396, 'user_ears', 'steam:110000133ef6d99', '{}'),
(397, 'user_glasses', 'steam:110000133ef6d99', '{}'),
(398, 'user_mask', 'steam:110000133ef6d99', '{}'),
(399, 'property', 'steam:110000133ef6d99', '{}'),
(400, 'property', 'steam:110000114b9921b', '{}'),
(401, 'user_mask', 'steam:110000114b9921b', '{}'),
(402, 'user_helmet', 'steam:110000114b9921b', '{}'),
(403, 'user_ears', 'steam:110000114b9921b', '{}'),
(404, 'user_glasses', 'steam:110000114b9921b', '{}'),
(405, 'user_ears', 'steam:110000118c34052', '{}'),
(406, 'user_glasses', 'steam:110000118c34052', '{}'),
(407, 'property', 'steam:110000118c34052', '{\"dressing\":[{\"skin\":{\"mask_2\":0,\"beard_2\":0,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"tshirt_1\":111,\"chain_2\":0,\"age_2\":0,\"makeup_2\":0,\"bproof_1\":0,\"beard_3\":0,\"face\":7,\"chain_1\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":15,\"mask_1\":0,\"eyebrows_2\":0,\"ears_1\":-1,\"eyebrows_4\":0,\"helmet_1\":-1,\"skin\":5,\"hair_color_1\":0,\"bags_1\":0,\"makeup_4\":0,\"sex\":0,\"lipstick_1\":0,\"lipstick_2\":0,\"torso_1\":5,\"helmet_2\":0,\"hair_color_2\":0,\"beard_4\":0,\"decals_2\":0,\"shoes_2\":2,\"eyebrows_1\":0,\"makeup_3\":0,\"bags_2\":0,\"glasses_1\":5,\"lipstick_4\":0,\"pants_1\":1,\"glasses_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":0,\"pants_2\":3,\"shoes_1\":4,\"hair_1\":0,\"beard_1\":0,\"eyebrows_3\":0,\"makeup_1\":0},\"label\":\"Toretto\"},{\"skin\":{\"mask_2\":0,\"beard_2\":0,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_1\":0,\"bproof_1\":0,\"beard_3\":0,\"face\":7,\"chain_1\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":14,\"mask_1\":0,\"eyebrows_2\":0,\"ears_1\":-1,\"eyebrows_4\":0,\"hair_color_1\":0,\"skin\":5,\"lipstick_1\":0,\"pants_1\":1,\"helmet_1\":-1,\"makeup_2\":0,\"lipstick_2\":0,\"lipstick_4\":0,\"helmet_2\":0,\"decals_2\":0,\"hair_color_2\":0,\"beard_4\":0,\"makeup_3\":0,\"shoes_2\":2,\"eyebrows_1\":0,\"shoes_1\":4,\"torso_1\":6,\"glasses_1\":5,\"bags_1\":0,\"sex\":0,\"glasses_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":11,\"pants_2\":3,\"tshirt_1\":111,\"hair_1\":0,\"beard_1\":0,\"eyebrows_3\":0,\"makeup_4\":0},\"label\":\"Toretto Cuir\"},{\"skin\":{\"mask_2\":0,\"beard_2\":0,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"tshirt_1\":111,\"chain_2\":0,\"age_2\":0,\"makeup_1\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":7,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":12,\"mask_1\":0,\"eyebrows_2\":0,\"ears_1\":-1,\"hair_color_2\":23,\"bags_1\":0,\"skin\":5,\"lipstick_1\":0,\"pants_1\":1,\"helmet_1\":-1,\"makeup_2\":0,\"hair_color_1\":0,\"lipstick_2\":0,\"shoes_1\":4,\"decals_2\":0,\"eyebrows_1\":0,\"beard_4\":0,\"bproof_1\":0,\"shoes_2\":2,\"helmet_2\":0,\"torso_1\":62,\"eyebrows_4\":0,\"glasses_1\":5,\"bags_2\":0,\"sex\":0,\"glasses_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":0,\"pants_2\":3,\"makeup_3\":0,\"hair_1\":6,\"beard_1\":0,\"eyebrows_3\":0,\"decals_1\":0},\"label\":\"Toretto2\"},{\"skin\":{\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":0,\"ears_2\":0,\"age_1\":0,\"bags_2\":0,\"chain_2\":0,\"age_2\":0,\"makeup_1\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":7,\"chain_1\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":0,\"mask_1\":0,\"eyebrows_2\":0,\"decals_2\":0,\"eyebrows_4\":0,\"ears_1\":-1,\"skin\":5,\"hair_color_1\":0,\"pants_1\":4,\"hair_color_2\":0,\"tshirt_1\":15,\"lipstick_1\":0,\"lipstick_2\":0,\"makeup_4\":0,\"helmet_2\":0,\"helmet_1\":-1,\"beard_4\":0,\"makeup_3\":0,\"shoes_2\":0,\"eyebrows_1\":0,\"sex\":0,\"torso_1\":22,\"glasses_1\":7,\"bags_1\":0,\"bproof_1\":0,\"glasses_2\":4,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":1,\"pants_2\":2,\"shoes_1\":28,\"hair_1\":2,\"beard_1\":7,\"eyebrows_3\":0,\"makeup_2\":0},\"label\":\"rp\"},{\"skin\":{\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":0,\"ears_2\":0,\"ears_1\":-1,\"tshirt_1\":15,\"chain_2\":0,\"age_2\":0,\"makeup_2\":0,\"lipstick_4\":0,\"beard_3\":0,\"face\":7,\"chain_1\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":17,\"mask_1\":0,\"eyebrows_2\":0,\"decals_2\":0,\"eyebrows_4\":0,\"torso_1\":139,\"skin\":5,\"lipstick_1\":0,\"bags_1\":0,\"helmet_1\":-1,\"shoes_1\":28,\"lipstick_2\":0,\"age_1\":0,\"makeup_1\":0,\"eyebrows_1\":0,\"bags_2\":0,\"beard_4\":0,\"hair_color_1\":0,\"shoes_2\":0,\"helmet_2\":0,\"hair_color_2\":0,\"sex\":0,\"glasses_1\":7,\"pants_1\":4,\"bproof_1\":0,\"glasses_2\":4,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":3,\"pants_2\":2,\"makeup_3\":0,\"hair_1\":2,\"beard_1\":7,\"eyebrows_3\":0,\"makeup_4\":0},\"label\":\"moto\"}],\"weapons\":[]}'),
(408, 'user_helmet', 'steam:110000118c34052', '{\"hasHelmet\":true,\"skin\":{\"helmet_1\":4,\"helmet_2\":0}}'),
(409, 'user_mask', 'steam:110000118c34052', '{\"skin\":{\"mask_1\":0,\"mask_2\":0},\"hasMask\":true}'),
(410, 'user_mask', 'steam:11000010c9bdcd9', '{\"hasMask\":true,\"skin\":{\"mask_2\":0,\"mask_1\":35}}'),
(411, 'user_helmet', 'steam:11000010c9bdcd9', '{\"hasHelmet\":true,\"skin\":{\"helmet_2\":0,\"helmet_1\":53}}'),
(412, 'user_glasses', 'steam:11000010c9bdcd9', '{}'),
(413, 'user_ears', 'steam:11000010c9bdcd9', '{}'),
(414, 'property', 'steam:11000010c9bdcd9', '{\"dressing\":[{\"label\":\"Braquage\",\"skin\":{\"beard_1\":10,\"arms\":20,\"makeup_1\":0,\"hair_color_1\":16,\"face\":0,\"tshirt_2\":3,\"chain_1\":3,\"helmet_1\":-1,\"bproof_1\":0,\"sex\":0,\"skin\":0,\"age_1\":0,\"hair_2\":0,\"tshirt_1\":75,\"ears_1\":-1,\"mask_1\":0,\"helmet_2\":0,\"beard_3\":0,\"eyebrows_2\":0,\"torso_1\":166,\"decals_2\":0,\"hair_1\":19,\"age_2\":0,\"glasses_1\":5,\"glasses_2\":5,\"bproof_2\":0,\"torso_2\":0,\"mask_2\":0,\"lipstick_4\":0,\"chain_2\":0,\"lipstick_1\":0,\"lipstick_2\":0,\"shoes_1\":25,\"hair_color_2\":14,\"bags_2\":0,\"lipstick_3\":0,\"makeup_4\":0,\"pants_2\":0,\"beard_2\":10,\"eyebrows_4\":0,\"pants_1\":31,\"beard_4\":0,\"eyebrows_3\":0,\"ears_2\":0,\"shoes_2\":0,\"makeup_3\":0,\"eyebrows_1\":0,\"decals_1\":0,\"bags_1\":0,\"makeup_2\":0}},{\"label\":\"costume\",\"skin\":{\"beard_1\":10,\"lipstick_1\":0,\"makeup_1\":0,\"hair_color_1\":16,\"face\":0,\"tshirt_2\":0,\"chain_1\":26,\"helmet_1\":-1,\"decals_2\":0,\"sex\":0,\"skin\":0,\"age_1\":0,\"hair_2\":0,\"tshirt_1\":33,\"ears_1\":-1,\"mask_1\":0,\"pants_2\":0,\"beard_3\":0,\"eyebrows_2\":0,\"torso_1\":27,\"helmet_2\":0,\"hair_1\":19,\"beard_2\":10,\"glasses_1\":5,\"glasses_2\":5,\"bproof_2\":0,\"arms\":20,\"torso_2\":0,\"lipstick_4\":0,\"mask_2\":0,\"chain_2\":2,\"lipstick_2\":0,\"shoes_1\":10,\"hair_color_2\":14,\"bags_2\":0,\"lipstick_3\":0,\"makeup_4\":0,\"age_2\":0,\"pants_1\":10,\"eyebrows_4\":0,\"eyebrows_3\":0,\"beard_4\":0,\"bproof_1\":0,\"ears_2\":0,\"shoes_2\":0,\"makeup_3\":0,\"eyebrows_1\":0,\"decals_1\":0,\"bags_1\":0,\"makeup_2\":0}}]}'),
(415, 'user_mask', 'steam:1100001353fe56e', '{}'),
(416, 'user_ears', 'steam:1100001353fe56e', '{}'),
(417, 'user_glasses', 'steam:1100001353fe56e', '{}'),
(418, 'property', 'steam:1100001353fe56e', '{}'),
(419, 'user_helmet', 'steam:1100001353fe56e', '{}'),
(420, 'user_helmet', 'steam:1100001173d36f1', '{}'),
(421, 'property', 'steam:1100001173d36f1', '{}'),
(422, 'user_mask', 'steam:1100001173d36f1', '{}'),
(423, 'user_glasses', 'steam:1100001173d36f1', '{}'),
(424, 'user_ears', 'steam:1100001173d36f1', '{}'),
(425, 'user_mask', 'steam:11000010d228cea', '{}'),
(426, 'property', 'steam:11000010d228cea', '{}'),
(427, 'user_helmet', 'steam:11000010d228cea', '{}'),
(428, 'user_glasses', 'steam:11000010d228cea', '{}'),
(429, 'user_ears', 'steam:11000010d228cea', '{}'),
(430, 'user_mask', 'steam:110000111593e00', '{\"hasMask\":true,\"skin\":{\"mask_2\":0,\"mask_1\":54}}'),
(431, 'user_helmet', 'steam:110000111593e00', '{}'),
(432, 'user_ears', 'steam:110000111593e00', '{}'),
(433, 'user_glasses', 'steam:110000111593e00', '{}'),
(434, 'property', 'steam:110000111593e00', '{\"dressing\":[{\"label\":\"Rouge mgl\",\"skin\":{\"hair_color_2\":0,\"lipstick_4\":0,\"mask_1\":0,\"glasses_1\":11,\"eyebrows_3\":0,\"bags_1\":0,\"eyebrows_1\":2,\"lipstick_3\":5,\"makeup_1\":1,\"bproof_1\":0,\"face\":31,\"decals_2\":0,\"hair_2\":0,\"lipstick_2\":5,\"lipstick_1\":5,\"glasses_2\":3,\"ears_2\":0,\"shoes_1\":2,\"tshirt_1\":77,\"beard_1\":0,\"ears_1\":-1,\"chain_2\":0,\"beard_2\":0,\"pants_2\":0,\"age_2\":0,\"age_1\":0,\"tshirt_2\":1,\"skin\":29,\"shoes_2\":13,\"bags_2\":0,\"makeup_4\":0,\"hair_1\":36,\"eyebrows_4\":0,\"chain_1\":0,\"decals_1\":0,\"eyebrows_2\":10,\"pants_1\":43,\"beard_4\":0,\"torso_2\":0,\"torso_1\":183,\"helmet_1\":-1,\"arms\":19,\"mask_2\":0,\"hair_color_1\":29,\"makeup_3\":0,\"helmet_2\":0,\"makeup_2\":10,\"bproof_2\":0,\"beard_3\":0,\"sex\":1}}]}'),
(435, 'user_glasses', 'steam:11000010e49b073', '{\"skin\":{\"glasses_2\":4,\"glasses_1\":5},\"hasGlasses\":true}'),
(436, 'user_helmet', 'steam:11000010e49b073', '{\"hasHelmet\":true,\"skin\":{\"helmet_1\":14,\"helmet_2\":1}}'),
(437, 'user_mask', 'steam:11000010e49b073', '{}'),
(438, 'user_ears', 'steam:11000010e49b073', '{}'),
(439, 'property', 'steam:11000010e49b073', '{\"dressing\":[{\"label\":\"op\",\"skin\":{\"hair_color_2\":0,\"lipstick_4\":0,\"mask_1\":0,\"glasses_1\":5,\"eyebrows_3\":0,\"bags_1\":45,\"eyebrows_1\":0,\"lipstick_3\":0,\"makeup_1\":0,\"bproof_1\":0,\"face\":0,\"decals_2\":0,\"hair_2\":0,\"lipstick_2\":0,\"lipstick_1\":0,\"glasses_2\":4,\"ears_2\":0,\"shoes_1\":71,\"tshirt_1\":5,\"beard_1\":10,\"ears_1\":-1,\"chain_2\":0,\"beard_2\":10,\"pants_2\":1,\"helmet_1\":51,\"age_1\":0,\"age_2\":0,\"skin\":0,\"shoes_2\":1,\"bags_2\":0,\"sex\":0,\"hair_1\":55,\"eyebrows_4\":0,\"chain_1\":0,\"decals_1\":0,\"eyebrows_2\":0,\"pants_1\":98,\"beard_4\":0,\"arms\":17,\"torso_1\":251,\"mask_2\":0,\"tshirt_2\":0,\"makeup_4\":0,\"makeup_3\":0,\"hair_color_1\":29,\"helmet_2\":0,\"makeup_2\":0,\"bproof_2\":0,\"beard_3\":0,\"torso_2\":1}}]}'),
(440, 'user_mask', 'steam:11000010e81d760', '{}'),
(441, 'property', 'steam:11000010e81d760', '{\"dressing\":[{\"label\":\"ski oklm en jean \",\"skin\":{\"makeup_4\":0,\"lipstick_4\":0,\"makeup_3\":0,\"glasses_1\":25,\"helmet_1\":2,\"bags_1\":0,\"eyebrows_1\":0,\"lipstick_3\":0,\"makeup_1\":0,\"bproof_1\":0,\"face\":0,\"decals_2\":0,\"hair_2\":0,\"lipstick_2\":0,\"lipstick_1\":0,\"glasses_2\":6,\"arms\":36,\"hair_color_1\":15,\"eyebrows_3\":0,\"beard_1\":10,\"ears_1\":-1,\"chain_2\":0,\"beard_2\":10,\"pants_2\":6,\"mask_1\":0,\"age_1\":0,\"age_2\":0,\"skin\":0,\"shoes_2\":0,\"bags_2\":0,\"hair_color_2\":15,\"hair_1\":2,\"eyebrows_4\":0,\"chain_1\":0,\"decals_1\":0,\"eyebrows_2\":0,\"pants_1\":26,\"beard_4\":0,\"ears_2\":0,\"torso_1\":191,\"beard_3\":0,\"helmet_2\":0,\"mask_2\":0,\"tshirt_2\":3,\"shoes_1\":1,\"sex\":0,\"torso_2\":23,\"bproof_2\":0,\"tshirt_1\":72,\"makeup_2\":0}},{\"label\":\"OP\",\"skin\":{\"hair_color_2\":15,\"lipstick_4\":0,\"mask_1\":0,\"glasses_1\":5,\"eyebrows_3\":0,\"bags_1\":45,\"eyebrows_1\":0,\"makeup_2\":0,\"makeup_1\":0,\"bproof_1\":0,\"face\":0,\"decals_2\":0,\"hair_2\":0,\"lipstick_2\":0,\"lipstick_1\":0,\"glasses_2\":4,\"ears_2\":0,\"hair_color_1\":15,\"beard_3\":0,\"beard_1\":10,\"ears_1\":-1,\"chain_2\":0,\"beard_2\":10,\"pants_2\":7,\"age_2\":0,\"age_1\":0,\"tshirt_2\":3,\"skin\":0,\"shoes_2\":6,\"bags_2\":0,\"helmet_2\":0,\"hair_1\":2,\"eyebrows_4\":0,\"chain_1\":0,\"decals_1\":0,\"eyebrows_2\":0,\"pants_1\":9,\"beard_4\":0,\"arms\":36,\"torso_1\":204,\"mask_2\":0,\"makeup_4\":0,\"shoes_1\":12,\"makeup_3\":0,\"helmet_1\":5,\"sex\":0,\"torso_2\":0,\"bproof_2\":0,\"tshirt_1\":72,\"lipstick_3\":0}},{\"label\":\"op 1\",\"skin\":{\"makeup_4\":0,\"lipstick_4\":0,\"makeup_3\":0,\"glasses_1\":5,\"eyebrows_3\":0,\"bags_1\":45,\"eyebrows_1\":0,\"lipstick_3\":0,\"makeup_1\":0,\"bproof_1\":0,\"face\":0,\"decals_2\":0,\"hair_2\":0,\"lipstick_2\":0,\"lipstick_1\":0,\"glasses_2\":4,\"arms\":36,\"shoes_1\":12,\"hair_color_1\":15,\"beard_1\":10,\"ears_1\":-1,\"chain_2\":0,\"beard_2\":10,\"pants_2\":7,\"mask_1\":0,\"age_1\":0,\"age_2\":0,\"skin\":0,\"shoes_2\":6,\"bags_2\":0,\"helmet_2\":0,\"hair_1\":2,\"eyebrows_4\":0,\"chain_1\":0,\"decals_1\":0,\"eyebrows_2\":0,\"torso_2\":0,\"beard_4\":0,\"beard_3\":0,\"torso_1\":187,\"helmet_1\":50,\"mask_2\":0,\"tshirt_2\":3,\"ears_2\":0,\"hair_color_2\":15,\"sex\":0,\"pants_1\":9,\"bproof_2\":0,\"tshirt_1\":72,\"makeup_2\":0}}]}'),
(442, 'user_helmet', 'steam:11000010e81d760', '{}'),
(443, 'user_glasses', 'steam:11000010e81d760', '{}'),
(444, 'user_ears', 'steam:11000010e81d760', '{}'),
(445, 'user_glasses', 'steam:110000119c0d7ec', '{}'),
(446, 'user_mask', 'steam:110000119c0d7ec', '{}'),
(447, 'user_ears', 'steam:110000119c0d7ec', '{}'),
(448, 'user_helmet', 'steam:110000119c0d7ec', '{}'),
(449, 'property', 'steam:110000119c0d7ec', '{}'),
(450, 'property', 'steam:11000010b490325', '{}'),
(451, 'user_ears', 'steam:11000010b490325', '{}'),
(452, 'user_glasses', 'steam:11000010b490325', '{}'),
(453, 'user_helmet', 'steam:11000010b490325', '{}'),
(454, 'user_mask', 'steam:11000010b490325', '{}'),
(455, 'user_glasses', 'steam:110000109b99f47', '{}'),
(456, 'user_helmet', 'steam:110000109b99f47', '{\"skin\":{\"helmet_1\":18,\"helmet_2\":4},\"hasHelmet\":true}'),
(457, 'user_ears', 'steam:110000109b99f47', '{}'),
(458, 'user_mask', 'steam:110000109b99f47', '{}'),
(459, 'property', 'steam:110000109b99f47', '{\"dressing\":[{\"skin\":{\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":0,\"ears_2\":2,\"age_1\":0,\"tshirt_1\":9,\"chain_2\":0,\"age_2\":0,\"makeup_2\":0,\"bproof_1\":0,\"beard_3\":10,\"face\":0,\"chain_1\":0,\"decals_1\":0,\"hair_2\":0,\"arms\":4,\"mask_1\":0,\"eyebrows_2\":10,\"ears_1\":4,\"eyebrows_4\":0,\"makeup_4\":0,\"skin\":12,\"lipstick_1\":0,\"bags_1\":0,\"hair_color_2\":0,\"glasses_2\":3,\"torso_1\":230,\"lipstick_2\":0,\"hair_color_1\":10,\"makeup_1\":0,\"eyebrows_1\":1,\"beard_4\":0,\"makeup_3\":0,\"shoes_2\":1,\"helmet_2\":0,\"lipstick_4\":0,\"decals_2\":0,\"glasses_1\":3,\"bags_2\":0,\"pants_1\":1,\"shoes_1\":9,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":2,\"pants_2\":5,\"sex\":0,\"hair_1\":2,\"beard_1\":10,\"eyebrows_3\":10,\"helmet_1\":-1},\"label\":\"Qot\"},{\"skin\":{\"mask_2\":0,\"beard_2\":10,\"tshirt_2\":4,\"ears_2\":2,\"age_1\":0,\"tshirt_1\":65,\"chain_2\":0,\"age_2\":0,\"makeup_2\":0,\"lipstick_4\":0,\"beard_3\":10,\"face\":0,\"chain_1\":0,\"makeup_4\":0,\"hair_2\":0,\"arms\":4,\"mask_1\":0,\"eyebrows_2\":10,\"ears_1\":4,\"eyebrows_4\":0,\"lipstick_1\":0,\"skin\":12,\"hair_color_1\":10,\"pants_1\":1,\"helmet_1\":-1,\"torso_1\":230,\"lipstick_2\":0,\"hair_color_2\":0,\"eyebrows_1\":1,\"sex\":0,\"shoes_2\":1,\"beard_4\":0,\"bags_2\":0,\"makeup_3\":0,\"helmet_2\":0,\"makeup_1\":0,\"bags_1\":0,\"glasses_1\":3,\"decals_2\":0,\"glasses_2\":3,\"shoes_1\":9,\"lipstick_3\":0,\"bproof_2\":0,\"torso_2\":2,\"pants_2\":5,\"bproof_1\":0,\"hair_1\":2,\"beard_1\":10,\"eyebrows_3\":10,\"decals_1\":0},\"label\":\"qot2\"}]}'),
(460, 'user_ears', 'steam:11000011cded001', '{}');
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(461, 'property', 'steam:11000011cded001', '{\"dressing\":[{\"skin\":{\"bproof_2\":0,\"makeup_3\":0,\"pants_1\":31,\"sex\":0,\"mask_2\":0,\"shoes_1\":25,\"lipstick_4\":0,\"makeup_4\":0,\"lipstick_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"beard_1\":2,\"torso_2\":0,\"beard_4\":0,\"chain_2\":0,\"decals_2\":0,\"tshirt_1\":57,\"helmet_1\":-1,\"lipstick_3\":0,\"bags_1\":0,\"makeup_2\":0,\"arms\":37,\"glasses_1\":5,\"bags_2\":0,\"shoes_2\":0,\"ears_2\":0,\"pants_2\":0,\"chain_1\":0,\"bproof_1\":0,\"hair_1\":21,\"torso_1\":42,\"eyebrows_2\":10,\"tshirt_2\":0,\"lipstick_1\":0,\"face\":0,\"eyebrows_1\":0,\"decals_1\":0,\"beard_2\":10,\"glasses_2\":0,\"eyebrows_4\":0,\"ears_1\":2,\"age_2\":0,\"eyebrows_3\":0,\"makeup_1\":0,\"skin\":9,\"mask_1\":0,\"hair_color_1\":15,\"beard_3\":0,\"hair_2\":0,\"age_1\":0},\"label\":\"Sortie\"},{\"skin\":{\"bproof_2\":0,\"makeup_3\":0,\"pants_1\":28,\"sex\":0,\"mask_2\":0,\"shoes_1\":10,\"lipstick_4\":0,\"ears_2\":0,\"lipstick_2\":0,\"chain_1\":10,\"helmet_2\":0,\"beard_1\":2,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"bags_1\":0,\"tshirt_1\":31,\"age_1\":0,\"decals_1\":0,\"pants_2\":0,\"makeup_2\":0,\"age_2\":0,\"glasses_1\":5,\"hair_color_2\":0,\"shoes_2\":0,\"hair_1\":21,\"bproof_1\":0,\"decals_2\":0,\"bags_2\":0,\"torso_1\":31,\"lipstick_1\":0,\"eyebrows_2\":10,\"tshirt_2\":0,\"ears_1\":2,\"arms\":38,\"chain_2\":2,\"hair_2\":0,\"beard_2\":10,\"glasses_2\":0,\"eyebrows_4\":0,\"makeup_1\":0,\"makeup_4\":0,\"lipstick_3\":0,\"mask_1\":0,\"skin\":9,\"eyebrows_3\":0,\"hair_color_1\":15,\"beard_3\":0,\"helmet_1\":-1,\"beard_4\":0},\"label\":\"rdv\"},{\"skin\":{\"bproof_2\":0,\"makeup_3\":0,\"pants_1\":25,\"sex\":0,\"mask_2\":0,\"shoes_1\":1,\"makeup_1\":0,\"ears_2\":0,\"bags_2\":0,\"chain_1\":6,\"helmet_2\":0,\"beard_1\":2,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"arms\":19,\"tshirt_1\":15,\"age_1\":0,\"lipstick_3\":0,\"bags_1\":0,\"makeup_2\":0,\"age_2\":0,\"lipstick_1\":0,\"beard_4\":0,\"shoes_2\":0,\"decals_2\":0,\"pants_2\":0,\"hair_color_2\":0,\"bproof_1\":0,\"hair_1\":21,\"torso_1\":63,\"eyebrows_2\":10,\"tshirt_2\":0,\"helmet_1\":-1,\"hair_2\":0,\"decals_1\":0,\"ears_1\":2,\"beard_2\":10,\"eyebrows_3\":0,\"eyebrows_4\":0,\"glasses_1\":5,\"lipstick_2\":0,\"chain_2\":0,\"lipstick_4\":0,\"skin\":9,\"makeup_4\":0,\"hair_color_1\":15,\"beard_3\":0,\"mask_1\":0,\"glasses_2\":0},\"label\":\"Habituel\"},{\"skin\":{\"bproof_2\":0,\"makeup_3\":0,\"pants_1\":7,\"sex\":0,\"mask_2\":0,\"shoes_1\":1,\"hair_1\":21,\"ears_2\":0,\"bags_2\":0,\"chain_1\":6,\"helmet_2\":0,\"beard_1\":2,\"torso_2\":0,\"beard_4\":0,\"face\":0,\"pants_2\":0,\"tshirt_1\":15,\"helmet_1\":-1,\"decals_1\":0,\"bags_1\":0,\"makeup_2\":0,\"age_2\":0,\"glasses_1\":5,\"arms\":19,\"shoes_2\":0,\"mask_1\":0,\"bproof_1\":0,\"eyebrows_4\":0,\"decals_2\":0,\"hair_color_2\":0,\"hair_2\":0,\"eyebrows_2\":10,\"tshirt_2\":0,\"lipstick_2\":0,\"lipstick_1\":0,\"lipstick_4\":0,\"ears_1\":2,\"beard_2\":10,\"eyebrows_3\":0,\"torso_1\":81,\"chain_2\":0,\"eyebrows_1\":0,\"makeup_1\":0,\"makeup_4\":0,\"skin\":9,\"lipstick_3\":0,\"hair_color_1\":15,\"beard_3\":0,\"glasses_2\":0,\"age_1\":0},\"label\":\"Planque\"}]}'),
(462, 'user_helmet', 'steam:11000011cded001', '{\"hasHelmet\":true,\"skin\":{\"helmet_2\":0,\"helmet_1\":83}}'),
(463, 'user_mask', 'steam:11000011cded001', '{\"hasMask\":true,\"skin\":{\"mask_2\":0,\"mask_1\":51}}'),
(464, 'user_glasses', 'steam:11000011cded001', '{}'),
(465, 'user_ears', 'steam:1100001128ff308', '{}'),
(466, 'user_glasses', 'steam:1100001128ff308', '{}'),
(467, 'user_helmet', 'steam:1100001128ff308', '{}'),
(468, 'user_mask', 'steam:1100001128ff308', '{}'),
(469, 'property', 'steam:1100001128ff308', '{}'),
(470, 'user_ears', 'steam:110000118282d31', '{}'),
(471, 'property', 'steam:110000118282d31', '{}'),
(472, 'user_glasses', 'steam:110000118282d31', '{}'),
(473, 'user_mask', 'steam:110000118282d31', '{}'),
(474, 'user_helmet', 'steam:110000118282d31', '{}'),
(475, 'user_glasses', 'steam:11000010c789c31', '{}'),
(476, 'property', 'steam:11000010c789c31', '{}'),
(477, 'user_ears', 'steam:11000010c789c31', '{}'),
(478, 'user_mask', 'steam:11000010c789c31', '{}'),
(479, 'user_helmet', 'steam:11000010c789c31', '{}'),
(480, 'user_helmet', 'steam:1100001173f3092', '{}'),
(481, 'user_glasses', 'steam:1100001173f3092', '{}'),
(482, 'property', 'steam:1100001173f3092', '{}'),
(483, 'user_ears', 'steam:1100001173f3092', '{}'),
(484, 'user_mask', 'steam:1100001173f3092', '{}'),
(485, 'user_helmet', 'steam:11000010b4b70d9', '{}'),
(486, 'user_mask', 'steam:11000010b4b70d9', '{}'),
(487, 'user_glasses', 'steam:11000010b4b70d9', '{}'),
(488, 'user_ears', 'steam:11000010b4b70d9', '{}'),
(489, 'property', 'steam:11000010b4b70d9', '{}'),
(490, 'user_mask', 'steam:11000010077a8c1', '{}'),
(491, 'user_helmet', 'steam:11000010077a8c1', '{}'),
(492, 'property', 'steam:11000010077a8c1', '{}'),
(493, 'user_ears', 'steam:11000010077a8c1', '{}'),
(494, 'user_glasses', 'steam:11000010077a8c1', '{}'),
(495, 'user_ears', 'steam:110000132daf29b', '{}'),
(496, 'user_glasses', 'steam:110000132daf29b', '{}'),
(497, 'user_helmet', 'steam:110000132daf29b', '{}'),
(498, 'user_mask', 'steam:110000132daf29b', '{}'),
(499, 'property', 'steam:110000132daf29b', '{}'),
(500, 'user_mask', 'steam:110000116a28200', '{}'),
(501, 'user_glasses', 'steam:110000116a28200', '{}'),
(502, 'user_helmet', 'steam:110000116a28200', '{}'),
(503, 'property', 'steam:110000116a28200', '{}'),
(504, 'user_ears', 'steam:110000116a28200', '{}'),
(505, 'user_glasses', 'steam:11000010013511a', '{}'),
(506, 'user_ears', 'steam:11000010013511a', '{}'),
(507, 'property', 'steam:11000010013511a', '{}'),
(508, 'user_helmet', 'steam:11000010013511a', '{}'),
(509, 'user_mask', 'steam:11000010013511a', '{}'),
(510, 'user_ears', 'steam:11000010eb00ea7', '{}'),
(511, 'user_helmet', 'steam:11000010eb00ea7', '{}'),
(512, 'user_glasses', 'steam:11000010eb00ea7', '{}'),
(513, 'user_mask', 'steam:11000010eb00ea7', '{}'),
(514, 'property', 'steam:11000010eb00ea7', '{}'),
(515, 'user_ears', 'steam:1100001152f0a24', '{}'),
(516, 'user_mask', 'steam:1100001152f0a24', '{}'),
(517, 'user_glasses', 'steam:1100001152f0a24', '{}'),
(518, 'property', 'steam:1100001152f0a24', '{}'),
(519, 'user_helmet', 'steam:1100001152f0a24', '{}'),
(520, 'user_mask', 'steam:110000117053659', '{}'),
(521, 'user_ears', 'steam:110000117053659', '{}'),
(522, 'user_helmet', 'steam:110000117053659', '{}'),
(523, 'property', 'steam:110000117053659', '{}'),
(524, 'user_glasses', 'steam:110000117053659', '{}'),
(525, 'user_glasses', 'steam:1100001136fb180', '{}'),
(526, 'user_ears', 'steam:1100001136fb180', '{}'),
(527, 'property', 'steam:1100001136fb180', '{}'),
(528, 'user_helmet', 'steam:1100001136fb180', '{}'),
(529, 'user_mask', 'steam:1100001136fb180', '{}'),
(530, 'user_ears', 'steam:11000013634c728', '{}'),
(531, 'user_glasses', 'steam:11000013634c728', '{}'),
(532, 'user_mask', 'steam:11000013634c728', '{}'),
(533, 'user_helmet', 'steam:11000013634c728', '{\"hasHelmet\":true,\"skin\":{\"helmet_2\":0,\"helmet_1\":46}}'),
(534, 'property', 'steam:11000013634c728', '{}'),
(535, 'user_mask', 'steam:1100001135b73a1', '{}'),
(536, 'user_glasses', 'steam:1100001135b73a1', '{}'),
(537, 'user_ears', 'steam:1100001135b73a1', '{}'),
(538, 'user_helmet', 'steam:1100001135b73a1', '{}'),
(539, 'property', 'steam:1100001135b73a1', '{}'),
(540, 'user_ears', 'steam:11000010ca2c7e9', '{}'),
(541, 'user_glasses', 'steam:11000010ca2c7e9', '{}'),
(542, 'user_helmet', 'steam:11000010ca2c7e9', '{}'),
(543, 'user_mask', 'steam:11000010ca2c7e9', '{}'),
(544, 'property', 'steam:11000010ca2c7e9', '{}'),
(545, 'user_glasses', 'steam:1100001077856e8', '{}'),
(546, 'user_ears', 'steam:1100001077856e8', '{}'),
(547, 'user_mask', 'steam:1100001077856e8', '{}'),
(548, 'property', 'steam:1100001077856e8', '{}'),
(549, 'user_helmet', 'steam:1100001077856e8', '{}'),
(550, 'user_ears', 'steam:110000131f9e30e', '{}'),
(551, 'user_helmet', 'steam:110000131f9e30e', '{}'),
(552, 'user_glasses', 'steam:110000131f9e30e', '{}'),
(553, 'user_mask', 'steam:110000131f9e30e', '{}'),
(554, 'property', 'steam:110000131f9e30e', '{}'),
(555, 'user_ears', 'steam:110000119dc2827', '{}'),
(556, 'user_mask', 'steam:110000119dc2827', '{}'),
(557, 'user_glasses', 'steam:110000119dc2827', '{}'),
(558, 'property', 'steam:110000119dc2827', '{}'),
(559, 'user_helmet', 'steam:110000119dc2827', '{}'),
(560, 'property', 'steam:1100001061d0cb1', '{\"dressing\":[{\"skin\":{\"mask_1\":0,\"decals_2\":0,\"bags_2\":0,\"beard_2\":10,\"ears_2\":0,\"beard_1\":10,\"arms\":4,\"hair_2\":0,\"pants_1\":10,\"shoes_1\":10,\"bproof_1\":0,\"torso_2\":2,\"pants_2\":0,\"lipstick_1\":0,\"glasses_1\":5,\"age_2\":0,\"helmet_1\":12,\"sex\":0,\"mask_2\":0,\"decals_1\":0,\"makeup_1\":0,\"shoes_2\":0,\"hair_color_1\":2,\"skin\":37,\"glasses_2\":5,\"beard_3\":0,\"ears_1\":17,\"face\":44,\"eyebrows_1\":30,\"bags_1\":0,\"tshirt_1\":10,\"eyebrows_3\":0,\"chain_2\":0,\"makeup_3\":0,\"helmet_2\":0,\"age_1\":0,\"lipstick_4\":0,\"eyebrows_2\":8,\"chain_1\":0,\"beard_4\":0,\"hair_1\":73,\"makeup_2\":0,\"hair_color_2\":12,\"makeup_4\":0,\"lipstick_3\":0,\"lipstick_2\":0,\"tshirt_2\":0,\"bproof_2\":0,\"torso_1\":72,\"eyebrows_4\":0},\"label\":\"MAFIA\"},{\"label\":\"STREETWEAR\",\"skin\":{\"mask_1\":0,\"decals_2\":0,\"bags_2\":0,\"beard_2\":10,\"ears_2\":0,\"beard_1\":10,\"arms\":4,\"hair_2\":0,\"pants_1\":4,\"shoes_1\":31,\"bproof_1\":0,\"torso_2\":21,\"eyebrows_4\":0,\"lipstick_2\":0,\"glasses_1\":5,\"age_2\":0,\"face\":44,\"sex\":0,\"helmet_1\":45,\"decals_1\":0,\"skin\":37,\"shoes_2\":2,\"hair_color_1\":2,\"lipstick_1\":0,\"glasses_2\":5,\"beard_3\":0,\"ears_1\":17,\"makeup_4\":0,\"eyebrows_3\":0,\"bags_1\":0,\"tshirt_1\":8,\"mask_2\":0,\"chain_2\":0,\"makeup_3\":0,\"helmet_2\":1,\"age_1\":0,\"lipstick_4\":0,\"makeup_1\":0,\"chain_1\":0,\"eyebrows_2\":8,\"beard_4\":0,\"hair_1\":73,\"hair_color_2\":12,\"eyebrows_1\":30,\"lipstick_3\":0,\"makeup_2\":0,\"tshirt_2\":14,\"bproof_2\":0,\"torso_1\":191,\"pants_2\":2}},{\"skin\":{\"helmet_2\":5,\"decals_2\":0,\"bags_2\":0,\"helmet_1\":20,\"ears_2\":0,\"beard_1\":10,\"arms\":5,\"hair_2\":0,\"pants_1\":78,\"shoes_1\":31,\"bproof_1\":0,\"mask_1\":0,\"eyebrows_4\":0,\"torso_2\":0,\"glasses_1\":5,\"age_2\":0,\"eyebrows_3\":0,\"sex\":0,\"eyebrows_2\":8,\"decals_1\":0,\"beard_4\":0,\"shoes_2\":1,\"hair_color_1\":2,\"lipstick_1\":0,\"glasses_2\":5,\"eyebrows_1\":30,\"makeup_1\":0,\"face\":44,\"skin\":37,\"bags_1\":0,\"tshirt_1\":8,\"beard_3\":0,\"chain_2\":0,\"makeup_3\":0,\"pants_2\":1,\"mask_2\":0,\"lipstick_4\":0,\"age_1\":0,\"chain_1\":0,\"makeup_4\":0,\"beard_2\":10,\"hair_1\":73,\"hair_color_2\":12,\"ears_1\":17,\"lipstick_3\":0,\"makeup_2\":0,\"tshirt_2\":13,\"bproof_2\":0,\"torso_1\":191,\"lipstick_2\":0},\"label\":\"STREET MILITARY\"}]}'),
(561, 'user_glasses', 'steam:1100001061d0cb1', '{}'),
(562, 'user_mask', 'steam:1100001061d0cb1', '{\"skin\":{\"mask_1\":54,\"mask_2\":0},\"hasMask\":true}'),
(563, 'user_ears', 'steam:1100001061d0cb1', '{}'),
(564, 'user_helmet', 'steam:1100001061d0cb1', '{}'),
(565, 'property', 'steam:11000011852ee0c', '{}'),
(566, 'user_glasses', 'steam:11000011852ee0c', '{}'),
(567, 'user_ears', 'steam:11000011852ee0c', '{}'),
(568, 'user_helmet', 'steam:11000011852ee0c', '{}'),
(569, 'user_mask', 'steam:11000011852ee0c', '{}'),
(570, 'user_helmet', 'steam:11000011d1423db', '{}'),
(571, 'user_mask', 'steam:11000011d1423db', '{}'),
(572, 'property', 'steam:11000011d1423db', '{}'),
(573, 'user_ears', 'steam:11000011d1423db', '{}'),
(574, 'user_glasses', 'steam:11000011d1423db', '{}'),
(575, 'user_ears', 'steam:11000010302b529', '{}'),
(576, 'user_helmet', 'steam:11000010302b529', '{}'),
(577, 'user_glasses', 'steam:11000010302b529', '{}'),
(578, 'property', 'steam:11000010302b529', '{}'),
(579, 'user_mask', 'steam:11000010302b529', '{}'),
(580, 'user_ears', 'steam:110000119a721fd', '{}'),
(581, 'user_glasses', 'steam:110000119a721fd', '{}'),
(582, 'property', 'steam:110000119a721fd', '{}'),
(583, 'user_helmet', 'steam:110000119a721fd', '{}'),
(584, 'user_mask', 'steam:110000119a721fd', '{}'),
(585, 'user_ears', 'steam:110000114a6bf17', '{}'),
(586, 'user_helmet', 'steam:110000114a6bf17', '{}'),
(587, 'user_glasses', 'steam:110000114a6bf17', '{}'),
(588, 'user_mask', 'steam:110000114a6bf17', '{}'),
(589, 'property', 'steam:110000114a6bf17', '{}'),
(590, 'user_ears', 'steam:11000010acfe014', '{}'),
(591, 'user_glasses', 'steam:11000010acfe014', '{}'),
(592, 'user_helmet', 'steam:11000010acfe014', '{}'),
(593, 'user_mask', 'steam:11000010acfe014', '{}'),
(594, 'property', 'steam:11000010acfe014', '{}'),
(595, 'user_helmet', 'steam:11000011cf4c40d', '{}'),
(596, 'user_ears', 'steam:11000011cf4c40d', '{}'),
(597, 'user_glasses', 'steam:11000011cf4c40d', '{}'),
(598, 'user_mask', 'steam:11000011cf4c40d', '{}'),
(599, 'property', 'steam:11000011cf4c40d', '{}'),
(600, 'society_army', NULL, '{}'),
(601, 'user_glasses', 'steam:11000010a01c0bc', '{}'),
(602, 'user_ears', 'steam:11000010a01c0bc', '{}'),
(603, 'property', 'steam:11000010a01c0bc', '{}'),
(604, 'user_helmet', 'steam:11000010a01c0bc', '{}'),
(605, 'user_mask', 'steam:11000010a01c0bc', '{}'),
(606, 'property', 'steam:1100001098c0f10', '{}'),
(607, 'user_helmet', 'steam:1100001098c0f10', '{}'),
(608, 'user_mask', 'steam:1100001098c0f10', '{}'),
(609, 'user_glasses', 'steam:1100001098c0f10', '{}'),
(610, 'user_ears', 'steam:1100001098c0f10', '{}'),
(611, 'property', 'steam:11000013518e15d', '{}'),
(612, 'user_ears', 'steam:11000013518e15d', '{}'),
(613, 'user_glasses', 'steam:11000013518e15d', '{}'),
(614, 'user_mask', 'steam:11000013518e15d', '{}'),
(615, 'user_helmet', 'steam:11000013518e15d', '{}'),
(616, 'user_glasses', 'steam:11000010cba93cb', '{}'),
(617, 'user_helmet', 'steam:11000010cba93cb', '{}'),
(618, 'user_mask', 'steam:11000010cba93cb', '{}'),
(619, 'user_ears', 'steam:11000010cba93cb', '{}'),
(620, 'property', 'steam:11000010cba93cb', '{}'),
(621, 'property', 'steam:1100001048dd98c', '{}'),
(622, 'user_mask', 'steam:1100001048dd98c', '{}'),
(623, 'user_glasses', 'steam:1100001048dd98c', '{}'),
(624, 'user_helmet', 'steam:1100001048dd98c', '{}'),
(625, 'user_ears', 'steam:1100001048dd98c', '{}'),
(626, 'property', 'steam:11000011bd90656', '{}'),
(627, 'user_mask', 'steam:11000011bd90656', '{}'),
(628, 'user_helmet', 'steam:11000011bd90656', '{}'),
(629, 'user_glasses', 'steam:11000011bd90656', '{}'),
(630, 'user_ears', 'steam:11000011bd90656', '{}'),
(631, 'user_glasses', 'steam:110000115a29e25', '{}'),
(632, 'user_ears', 'steam:110000115a29e25', '{}'),
(633, 'user_helmet', 'steam:110000115a29e25', '{}'),
(634, 'user_mask', 'steam:110000115a29e25', '{}'),
(635, 'property', 'steam:110000115a29e25', '{}'),
(636, 'user_glasses', 'steam:11000010ed15261', '{}'),
(637, 'user_ears', 'steam:11000010ed15261', '{}'),
(638, 'user_mask', 'steam:11000010ed15261', '{}'),
(639, 'property', 'steam:11000010ed15261', '{}'),
(640, 'user_helmet', 'steam:11000010ed15261', '{}');

-- --------------------------------------------------------

--
-- Structure de la table `fine_types`
--

DROP TABLE IF EXISTS `fine_types`;
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Usage abusif du klaxon', 2000, 0),
(2, 'Franchir une ligne continue', 2000, 0),
(3, 'Circulation à contresens', 5000, 0),
(4, 'Demi-tour non autorisé', 5000, 0),
(5, 'Circulation hors-route', 6000, 0),
(6, 'Non-respect des distances de sécurité', 5000, 0),
(7, 'Arrêt dangereux / interdit', 5000, 0),
(8, 'Stationnement gênant / interdit', 2500, 0),
(9, 'Non respect  de la priorité à droite', 5000, 0),
(10, 'Non-respect à un véhicule prioritaire', 7500, 0),
(11, 'Non-respect d\'un stop', 5000, 0),
(12, 'Non-respect d\'un feu rouge', 5000, 0),
(13, 'Dépassement dangereux', 10000, 0),
(14, 'Véhicule non en état', 15000, 0),
(15, 'Conduite sans permis', 8000, 0),
(16, 'Délit de fuite', 25000, 0),
(17, 'Excès de vitesse < 5 kmh', 2000, 0),
(18, 'Excès de vitesse 5-15 kmh', 5000, 0),
(19, 'Excès de vitesse 15-30 kmh', 8000, 0),
(20, 'Excès de vitesse > 30 kmh', 15000, 0),
(21, 'Entrave de la circulation', 5000, 1),
(22, 'Dégradation de la voie publique', 5000, 1),
(23, 'Trouble à l\'ordre publique', 5000, 1),
(24, 'Entrave opération de police', 45000, 1),
(25, 'Insulte envers / entre civils', 20000, 1),
(26, 'Outrage à agent de police', 30000, 1),
(27, 'Menace verbale ou intimidation envers civil', 20000, 1),
(28, 'Menace verbale ou intimidation envers policier', 25000, 1),
(29, 'Manifestation illégale', 15000, 1),
(30, 'Tentative de corruption', 80000, 1),
(31, 'Arme blanche sortie en ville', 5000, 2),
(32, 'Arme léthale sortie en ville', 15000, 2),
(33, 'Port d\'arme non autorisé (défaut de license)', 20000, 2),
(34, 'Port d\'arme illégal', 80000, 2),
(35, 'Pris en flag lockpick', 25000, 2),
(36, 'Vol de voiture', 20000, 2),
(37, 'Vente de drogue', 40000, 2),
(38, 'Fabriquation de drogue', 30000, 2),
(39, 'Possession de drogue', 25000, 2),
(40, 'Prise d\'ôtage civil', 100000, 2),
(41, 'Prise d\'ôtage agent de l\'état', 200000, 2),
(42, 'Braquage particulier', 50000, 2),
(43, 'Braquage magasin', 55000, 2),
(44, 'Braquage de banque', 70000, 2),
(45, 'Tir sur civil', 50000, 3),
(46, 'Tir sur agent de l\'état', 80000, 3),
(47, 'Tentative de meurtre sur civil', 40000, 3),
(48, 'Tentative de meurtre sur agent de l\'état', 150000, 3),
(49, 'Meurtre sur civil', 200000, 3),
(50, 'Meurte sur agent de l\'état', 300000, 3),
(51, 'Meurtre involontaire', 100000, 3),
(52, 'Escroquerie à l\'entreprise', 120000, 2);

-- --------------------------------------------------------

--
-- Structure de la table `fine_types_biker`
--

DROP TABLE IF EXISTS `fine_types_biker`;
CREATE TABLE IF NOT EXISTS `fine_types_biker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fine_types_biker`
--

INSERT INTO `fine_types_biker` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Raket', 3000, 0),
(2, 'Raket', 5000, 0),
(3, 'Raket', 10000, 1),
(4, 'Raket', 20000, 1),
(5, 'Raket', 50000, 2),
(6, 'Raket', 150000, 3),
(7, 'Raket', 350000, 3);

-- --------------------------------------------------------

--
-- Structure de la table `fine_types_gang`
--

DROP TABLE IF EXISTS `fine_types_gang`;
CREATE TABLE IF NOT EXISTS `fine_types_gang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fine_types_gang`
--

INSERT INTO `fine_types_gang` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Raket', 3000, 0),
(2, 'Raket', 5000, 0),
(3, 'Raket', 10000, 1),
(4, 'Raket', 20000, 1),
(5, 'Raket', 50000, 2),
(6, 'Raket', 150000, 3),
(7, 'Raket', 350000, 3);

-- --------------------------------------------------------

--
-- Structure de la table `fine_types_mafia`
--

DROP TABLE IF EXISTS `fine_types_mafia`;
CREATE TABLE IF NOT EXISTS `fine_types_mafia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fine_types_mafia`
--

INSERT INTO `fine_types_mafia` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Raket', 3000, 0),
(2, 'Raket', 5000, 0),
(3, 'Raket', 10000, 1),
(4, 'Raket', 20000, 1),
(5, 'Raket', 50000, 2),
(6, 'Raket', 150000, 3),
(7, 'Raket', 350000, 3);

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `limit` int(11) NOT NULL DEFAULT '-1',
  `rare` int(11) NOT NULL DEFAULT '0',
  `can_remove` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `items`
--

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
('alcool', 'alcool', -1, 0, 1),
('alcool_cargo', 'Cargaison d\'alcool', -1, 0, 1),
('alive_chicken', 'Poulet vivant', 20, 0, 1),
('bandage', 'Bandage', 20, 0, 1),
('blowpipe', 'Chalumeaux', 10, 0, 1),
('bolcacahuetes', 'Bol de cacahuètes', 5, 0, 1),
('bolchips', 'Bol de chips', 5, 0, 1),
('bolnoixcajou', 'Bol de noix de cajou', 5, 0, 1),
('bolpistache', 'Bol de pistaches', 5, 0, 1),
('bread', 'Pain', -1, 0, 1),
('cagoule', 'Cagoule', -1, 0, 1),
('capote', 'Préservatif', -1, 0, 1),
('carokit', 'Kit carosserie', 3, 0, 1),
('carotool', 'outils carosserie', 4, 0, 1),
('clip', 'Chargeur', -1, 0, 1),
('clothe', 'Vêtement', 40, 0, 1),
('coffee', 'Café', -1, 0, 1),
('coke', 'Coke', 50, 0, 1),
('coke_pooch', 'Pochon de coke', 10, 0, 1),
('cola', 'Canette de cola', -1, 0, 1),
('copper', 'Cuivre', 56, 0, 1),
('croquettes', 'Croquettes', -1, 0, 1),
('cutted_wood', 'Bois coupé', 20, 0, 1),
('diamond', 'Diamant', 50, 0, 1),
('drpepper', 'Dr. Pepper', 5, 0, 1),
('energy', 'Energy Drink', 5, 0, 1),
('essence', 'Essence', 24, 0, 1),
('fabric', 'Tissu', 80, 0, 1),
('fish', 'Poisson', 100, 0, 1),
('fixkit', 'Kit réparation', 5, 0, 1),
('fixtool', 'outils réparation', 6, 0, 1),
('flashlight', 'Lampe', -1, 0, 1),
('gazbottle', 'bouteille de gaz', 11, 0, 1),
('gitanes', 'Gitanes', -1, 0, 1),
('gold', 'Or', 21, 0, 1),
('golem', 'Golem', 5, 0, 1),
('grand_cru', 'Grand cru', -1, 0, 1),
('grapperaisin', 'Grappe de raisin', 5, 0, 1),
('grip', 'Poignée', -1, 0, 1),
('gym_membership', 'Gym Membership', -1, 0, 1),
('hepar', 'Hepar', -1, 0, 1),
('ice', 'Glaçon', 5, 0, 1),
('icetea', 'Ice Tea', 5, 0, 1),
('iron', 'Fer', 42, 0, 1),
('jager', 'Jägermeister', 5, 0, 1),
('jagerbomb', 'Jägerbomb', 5, 0, 1),
('jagercerbere', 'Jäger Cerbère', 3, 0, 1),
('jewels', 'Jewels', -1, 0, 1),
('jusfruit', 'Jus de fruits', 5, 0, 1),
('jus_raisin', 'Jus de raisin', -1, 0, 1),
('limonade', 'Limonade', 5, 0, 1),
('malbora', 'Malbora', -1, 0, 1),
('martini', 'Martini blanc', 5, 0, 1),
('medikit', 'Medikit', 5, 0, 1),
('menthe', 'Feuille de menthe', 10, 0, 1),
('meth', 'Meth', 50, 0, 1),
('meth_pooch', 'Pochon de meth', 10, 0, 1),
('metreshooter', 'Mètre de shooter', 3, 0, 1),
('mixapero', 'Mix Apéritif', 3, 0, 1),
('mojito', 'Mojito', 5, 0, 1),
('myrte', 'myrte', -1, 0, 1),
('myrtealcool', 'alcool de myrte', -1, 0, 1),
('myrte_cargo', 'Cargaison de Myrte', -1, 0, 1),
('opium', 'Opium', 50, 0, 1),
('opium_pooch', 'Pochon de opium', 10, 0, 1),
('packaged_chicken', 'Poulet en barquette', 100, 0, 1),
('packaged_plank', 'Paquet de planches', 100, 0, 1),
('petrol', 'Pétrole', 24, 0, 1),
('petrol_raffin', 'Pétrole Raffiné', 24, 0, 1),
('powerade', 'Powerade', -1, 0, 1),
('protein_shake', 'Protein Shake', -1, 0, 1),
('raisin', 'Raisin', -1, 0, 1),
('redbull', 'RedBull', -1, 0, 1),
('redbull_cargo', 'Cargaison de RedBull', -1, 0, 1),
('rhum', 'Rhum', 5, 0, 1),
('rhumcoca', 'Rhum-coca', 5, 0, 1),
('rhumfruit', 'Rhum-jus de fruits', 5, 0, 1),
('sandwich', 'Sandwich', -1, 0, 1),
('saucisson', 'Saucisson', 5, 0, 1),
('silencieux', 'Silencieux', -1, 0, 1),
('slaughtered_chicken', 'Poulet abattu', 20, 0, 1),
('soda', 'Soda', 5, 0, 1),
('sportlunch', 'Sportlunch', -1, 0, 1),
('stone', 'Pierre', 7, 0, 1),
('tabacblond', 'Tabac Blond', -1, 0, 1),
('tabacblondsec', 'Tabac Blond Séché', -1, 0, 1),
('tabacbrun', 'Tabac Brun', -1, 0, 1),
('tabacbrunsec', 'Tabac Brun Séché', -1, 0, 1),
('taboulet', 'Taboulet', -1, 0, 1),
('teqpaf', 'Teq\'paf', 5, 0, 1),
('tequila', 'Tequila', 5, 0, 1),
('viande', 'Viande', 25, 0, 1),
('vine', 'Vin', -1, 0, 1),
('vodka', 'Vodka', 5, 0, 1),
('vodkaenergy', 'Vodka-energy', 5, 0, 1),
('vodkafruit', 'Vodka-jus de fruits', 5, 0, 1),
('vodkrb', 'Vodka RedBull', -1, 0, 1),
('washed_stone', 'Pierre Lavée', 7, 0, 1),
('water', 'Eau', -1, 0, 1),
('weed', 'Weed', 50, 0, 1),
('weed_pooch', 'Pochon de weed', 10, 0, 1),
('whisky', 'Whisky', 5, 0, 1),
('whiskycoc', 'Whisky CorsicaCola', -1, 0, 1),
('whiskycoca', 'Whisky-coca', 5, 0, 1),
('wood', 'Bois', 20, 0, 1),
('wool', 'Laine', 40, 0, 1),
('yusuf', 'Skin de luxe', -1, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `jail`
--

DROP TABLE IF EXISTS `jail`;
CREATE TABLE IF NOT EXISTS `jail` (
  `identifier` varchar(100) NOT NULL,
  `isjailed` tinyint(1) DEFAULT NULL,
  `J_Time` datetime NOT NULL,
  `J_Cell` varchar(20) NOT NULL,
  `Jailer` varchar(100) NOT NULL,
  `Jailer_ID` varchar(100) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('aircraftdealer', 'Airliner', 1),
('ambulance', 'Ambulance', 1),
('avocat', 'Avocat', 1),
('bahama', 'Bahama Mas', 1),
('biker', 'Cosa nostra', 1),
('boatdealer', 'Marina', 1),
('cardealer', 'Concessionnaire', 1),
('fisherman', 'Pêcheur', 0),
('fueler', 'Raffineur', 0),
('lumberjack', 'Bûcheron', 0),
('mecano', 'Mécano', 1),
('miner', 'Mineur', 0),
('police', 'LSPD', 1),
('realestateagent', 'Agent immobilier', 1),
('reporter', 'Journaliste', 1),
('securiter', 'Agent', 0),
('slaughterer', 'Abatteur', 0),
('tabac', 'Tabac', 1),
('tailor', 'Couturier', 0),
('taxi', 'Taxi', 0),
('unemployed', 'Chômeur', 0),
('unicorn', 'Unicorn', 1),
('vigne', 'Vigneron', 1);

-- --------------------------------------------------------

--
-- Structure de la table `job_grades`
--

DROP TABLE IF EXISTS `job_grades`;
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(255) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Unemployed', 200, '{}', '{}'),
(2, 'lumberjack', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
(3, 'fisherman', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
(4, 'fueler', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
(5, 'reporter', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
(6, 'tailor', 0, 'employee', 'Intérimaire', 0, '{\"mask_1\":0,\"arms\":1,\"glasses_1\":0,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":0,\"torso_1\":24,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":0,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":36,\"tshirt_2\":0,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":48,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}', '{\"mask_1\":0,\"arms\":5,\"glasses_1\":5,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":1,\"torso_1\":52,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":1,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":23,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":42,\"tshirt_2\":4,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":36,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}'),
(7, 'miner', 0, 'employee', 'Intérimaire', 0, '{\"tshirt_2\":1,\"ears_1\":8,\"glasses_1\":15,\"torso_2\":0,\"ears_2\":2,\"glasses_2\":3,\"shoes_2\":1,\"pants_1\":75,\"shoes_1\":51,\"bags_1\":0,\"helmet_2\":0,\"pants_2\":7,\"torso_1\":71,\"tshirt_1\":59,\"arms\":2,\"bags_2\":0,\"helmet_1\":0}', '{}'),
(8, 'slaughterer', 0, 'employee', 'Intérimaire', 0, '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":67,\"pants_1\":36,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":0,\"torso_1\":56,\"beard_2\":6,\"shoes_1\":12,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":15,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":0,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}', '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":72,\"pants_1\":45,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":1,\"torso_1\":49,\"beard_2\":6,\"shoes_1\":24,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":9,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":5,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}'),
(9, 'cardealer', 0, 'recruit', 'Recrue', 10, '{}', '{}'),
(10, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
(11, 'cardealer', 2, 'experienced', 'Experimente', 40, '{}', '{}'),
(12, 'cardealer', 3, 'boss', 'Patron', 0, '{}', '{}'),
(13, 'ambulance', 0, 'ambulance', 'Ambulancier', 250, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(14, 'ambulance', 1, 'doctor', 'Medecin', 300, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(15, 'ambulance', 2, 'chief_doctor', 'Medecin-chef', 400, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(16, 'ambulance', 3, 'boss', 'Chirurgien', 1200, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(17, 'mecano', 0, 'recrue', 'Recrue', 500, '{}', '{}'),
(18, 'mecano', 1, 'novice', 'Novice', 1000, '{}', '{}'),
(19, 'mecano', 2, 'experimente', 'Experimente', 1500, '{}', '{}'),
(20, 'mecano', 3, 'chief', 'Chef d\'équipe', 1800, '{}', '{}'),
(21, 'mecano', 4, 'boss', 'Patron', 2200, '{}', '{}'),
(22, 'police', 0, 'recruit', 'Recrue', 1000, '{}', '{}'),
(23, 'police', 1, 'officer', 'Officier', 1400, '{}', '{}'),
(24, 'police', 2, 'sergeant', 'Sergent', 1600, '{}', '{}'),
(25, 'police', 3, 'lieutenant', 'Lieutenant', 1800, '{}', '{}'),
(26, 'police', 4, 'boss', 'Commandant', 3000, '{}', '{}'),
(27, 'tabac', 0, 'recrue', 'Tabagiste', 1, '{}', '{}'),
(28, 'tabac', 1, 'gerant', 'Gérant', 1, '{}', '{}'),
(29, 'tabac', 2, 'boss', 'Patron', 1, '{}', '{}'),
(30, 'taxi', 0, 'recrue', 'Recrue', 12, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(31, 'taxi', 1, 'novice', 'Novice', 24, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(32, 'taxi', 2, 'experimente', 'Experimente', 36, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(33, 'taxi', 3, 'uber', 'Uber', 48, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(34, 'taxi', 4, 'boss', 'Patron', 0, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":29,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":1,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":4,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(35, 'unicorn', 0, 'barman', 'Barman', 300, '{}', '{}'),
(36, 'unicorn', 1, 'dancer', 'Danseur', 300, '{}', '{}'),
(37, 'unicorn', 2, 'viceboss', 'Co-gérant', 500, '{}', '{}'),
(38, 'unicorn', 3, 'boss', 'Gérant', 600, '{}', '{}'),
(39, 'vigne', 0, 'recrue', 'Intérimaire', 500, '{\"tshirt_1\":59,\"tshirt_2\":0,\"torso_1\":12,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(40, 'vigne', 1, 'novice', 'Vigneron', 1000, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(41, 'vigne', 2, 'cdisenior', 'Chef de chai', 2000, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(42, 'vigne', 3, 'boss', 'Patron', 3000, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":14,\"torso_2\":15,\"shoes_1\":12,\"shoes_2\":0,\"pants_1\":9, \"pants_2\":5, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(43, 'realestateagent', 0, 'location', 'Location', 200, '{}', '{}'),
(44, 'realestateagent', 1, 'vendeur', 'Vendeur', 250, '{}', '{}'),
(45, 'realestateagent', 2, 'gestion', 'Gestion', 350, '{}', '{}'),
(46, 'realestateagent', 3, 'boss', 'Patron', 500, '{}', '{}'),
(47, 'bahama', 0, 'recrue', 'Recrue', 1250, '{}', '{}'),
(48, 'bahama', 1, 'novice', 'Novice', 1400, '{}', '{}'),
(49, 'bahama', 2, 'experimente', 'Experimente', 1650, '{}', '{}'),
(50, 'bahama', 3, 'boss', 'Patron', 2000, '{}', '{}'),
(51, 'avocat', 1, 'chef', 'Associé', 1100, '{}', '{}'),
(52, 'avocat', 0, 'recrue', 'Employé', 900, '{}', '{}'),
(53, 'avocat', 2, 'boss', 'Directeur Cabinet', 1100, '{}', '{}'),
(54, 'aircraftdealer', 0, 'recruit', 'Recruit', 10, '{}', '{}'),
(55, 'aircraftdealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
(56, 'aircraftdealer', 2, 'experienced', 'Expert', 40, '{}', '{}'),
(57, 'aircraftdealer', 3, 'boss', 'Boss', 0, '{}', '{}'),
(58, 'boatdealer', 0, 'recruit', 'Recrue', 10, '{}', '{}'),
(59, 'boatdealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
(60, 'boatdealer', 2, 'experienced', 'Experimente', 40, '{}', '{}'),
(61, 'boatdealer', 3, 'boss', 'Patron', 0, '{}', '{}'),
(70, 'biker', 0, 'soldato', 'Ptite-Frappe', 50, '{}', '{}'),
(71, 'biker', 1, 'capo', 'capo', 70, '{}', '{}'),
(72, 'biker', 2, 'consigliere', 'Chef-Capo', 100, '{}', '{}'),
(73, 'biker', 3, 'boss', 'Parrain', 2000, '{}', '{}'),
(74, 'securiter', 0, 'agents', 'Securiter SHIELD', 1700, '{}', '{}'),
(75, 'securiter', 1, 'boss', 'Patron', 3000, '{}', '{}');

-- --------------------------------------------------------

--
-- Structure de la table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('aircraft', 'Aircraft License'),
('dmv', 'Code de la route'),
('drive', 'Permis de conduire'),
('drive_bike', 'Permis moto'),
('drive_truck', 'Permis camion'),
('weapon', 'Permis de port d\'arme');

-- --------------------------------------------------------

--
-- Structure de la table `org`
--

DROP TABLE IF EXISTS `org`;
CREATE TABLE IF NOT EXISTS `org` (
  `name` varchar(50) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `org`
--

INSERT INTO `org` (`name`, `label`) VALUES
('cartel', 'Cartel'),
('freecity', 'Dawnstar'),
('gang', 'Sinaloa'),
('mafia', 'Cosa Nostra');

-- --------------------------------------------------------

--
-- Structure de la table `organisation_moneywash`
--

DROP TABLE IF EXISTS `organisation_moneywash`;
CREATE TABLE IF NOT EXISTS `organisation_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `organisation` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `org_gradeorg`
--

DROP TABLE IF EXISTS `org_gradeorg`;
CREATE TABLE IF NOT EXISTS `org_gradeorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_name` varchar(255) DEFAULT NULL,
  `gradeorg` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `org_gradeorg`
--

INSERT INTO `org_gradeorg` (`id`, `org_name`, `gradeorg`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'freecity', 0, 'freecity', 'Citoyen', 200, '{}', '{}'),
(2, 'mafia', 0, 'soldato', 'Ptite-Frappe', 1500, '{}', '{}'),
(3, 'mafia', 1, 'capo', 'Capo', 1800, '{}', '{}'),
(4, 'mafia', 2, 'consigliere', 'Capo-Chef', 2100, '{}', '{}'),
(5, 'mafia', 3, 'boss', 'Parrain', 2700, '{}', '{}'),
(6, 'gang', 0, 'soldato', 'Ptite-Frappe', 1500, '{}', '{}'),
(7, 'gang', 1, 'capo', 'Capo', 1800, '{}', '{}'),
(8, 'gang', 2, 'consigliere', 'Capo-Chef', 2100, '{}', '{}'),
(9, 'gang', 3, 'boss', 'Patron', 2700, '{}', '{}'),
(10, 'cartel', 0, 'soldato', 'Ptite-Frappe', 1500, '{}', '{}'),
(11, 'cartel', 1, 'capo', 'Capo', 1800, '{}', '{}'),
(12, 'cartel', 2, 'consigliere', 'Chef', 2100, '{}', '{}'),
(13, 'cartel', 3, 'boss', 'Patron', 2700, '{}', '{}');

-- --------------------------------------------------------

--
-- Structure de la table `owned_aircrafts`
--

DROP TABLE IF EXISTS `owned_aircrafts`;
CREATE TABLE IF NOT EXISTS `owned_aircrafts` (
  `owner` varchar(30) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'State of the aircraft',
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext,
  PRIMARY KEY (`plate`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `owned_boats`
--

DROP TABLE IF EXISTS `owned_boats`;
CREATE TABLE IF NOT EXISTS `owned_boats` (
  `owner` varchar(30) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'State of the boat',
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext,
  PRIMARY KEY (`plate`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `owned_properties`
--

DROP TABLE IF EXISTS `owned_properties`;
CREATE TABLE IF NOT EXISTS `owned_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `owned_vehicles`
--

DROP TABLE IF EXISTS `owned_vehicles`;
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(30) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'State of the car',
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `phone_app_chat`
--

DROP TABLE IF EXISTS `phone_app_chat`;
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `phone_calls`
--

DROP TABLE IF EXISTS `phone_calls`;
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `phone_messages`
--

DROP TABLE IF EXISTS `phone_messages`;
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isRead` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4337 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `phone_users_contacts`
--

DROP TABLE IF EXISTS `phone_users_contacts`;
CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `playerstattoos`
--

DROP TABLE IF EXISTS `playerstattoos`;
CREATE TABLE IF NOT EXISTS `playerstattoos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `tattoos` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `properties`
--

DROP TABLE IF EXISTS `properties`;
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entering` varchar(255) DEFAULT NULL,
  `exit` varchar(255) DEFAULT NULL,
  `inside` varchar(255) DEFAULT NULL,
  `outside` varchar(255) DEFAULT NULL,
  `ipls` varchar(255) DEFAULT '[]',
  `gateway` varchar(255) DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `properties`
--

INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{\"y\":564.89,\"z\":182.959,\"x\":119.384}', '{\"x\":117.347,\"y\":559.506,\"z\":183.304}', '{\"y\":557.032,\"z\":183.301,\"x\":118.037}', '{\"y\":567.798,\"z\":182.131,\"x\":119.249}', '[]', NULL, 1, 1, 0, '{\"x\":118.748,\"y\":566.573,\"z\":175.697}', 1500000),
(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{\"x\":372.796,\"y\":428.327,\"z\":144.685}', '{\"x\":373.548,\"y\":422.982,\"z\":144.907},', '{\"y\":420.075,\"z\":145.904,\"x\":372.161}', '{\"x\":372.454,\"y\":432.886,\"z\":143.443}', '[]', NULL, 1, 1, 0, '{\"x\":377.349,\"y\":429.422,\"z\":137.3}', 1500000),
(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{\"y\":-379.165,\"z\":37.961,\"x\":-936.363}', '{\"y\":-365.476,\"z\":113.274,\"x\":-913.097}', '{\"y\":-367.637,\"z\":113.274,\"x\":-918.022}', '{\"y\":-382.023,\"z\":37.961,\"x\":-943.626}', '[]', NULL, 1, 1, 0, '{\"x\":-927.554,\"y\":-377.744,\"z\":112.674}', 1700000),
(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{\"y\":440.8,\"z\":146.702,\"x\":346.964}', '{\"y\":437.456,\"z\":148.394,\"x\":341.683}', '{\"y\":435.626,\"z\":148.394,\"x\":339.595}', '{\"x\":350.535,\"y\":443.329,\"z\":145.764}', '[]', NULL, 1, 1, 0, '{\"x\":337.726,\"y\":436.985,\"z\":140.77}', 1500000),
(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{\"y\":502.696,\"z\":136.421,\"x\":-176.003}', '{\"y\":497.817,\"z\":136.653,\"x\":-174.349}', '{\"y\":495.069,\"z\":136.666,\"x\":-173.331}', '{\"y\":506.412,\"z\":135.0664,\"x\":-177.927}', '[]', NULL, 1, 1, 0, '{\"x\":-174.725,\"y\":493.095,\"z\":129.043}', 1500000),
(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{\"y\":596.58,\"z\":142.641,\"x\":-686.554}', '{\"y\":591.988,\"z\":144.392,\"x\":-681.728}', '{\"y\":590.608,\"z\":144.392,\"x\":-680.124}', '{\"y\":599.019,\"z\":142.059,\"x\":-689.492}', '[]', NULL, 1, 1, 0, '{\"x\":-680.46,\"y\":588.6,\"z\":136.769}', 1500000),
(7, 'LowEndApartment', 'Appartement de base', '{\"y\":-1078.735,\"z\":28.4031,\"x\":292.528}', '{\"y\":-1007.152,\"z\":-102.002,\"x\":265.845}', '{\"y\":-1002.802,\"z\":-100.008,\"x\":265.307}', '{\"y\":-1078.669,\"z\":28.401,\"x\":296.738}', '[]', NULL, 1, 1, 0, '{\"x\":265.916,\"y\":-999.38,\"z\":-100.008}', 562500),
(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{\"y\":454.955,\"z\":96.462,\"x\":-1294.433}', '{\"x\":-1289.917,\"y\":449.541,\"z\":96.902}', '{\"y\":446.322,\"z\":96.899,\"x\":-1289.642}', '{\"y\":455.453,\"z\":96.517,\"x\":-1298.851}', '[]', NULL, 1, 1, 0, '{\"x\":-1287.306,\"y\":455.901,\"z\":89.294}', 1500000),
(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{\"x\":-853.346,\"y\":696.678,\"z\":147.782}', '{\"y\":690.875,\"z\":151.86,\"x\":-859.961}', '{\"y\":688.361,\"z\":151.857,\"x\":-859.395}', '{\"y\":701.628,\"z\":147.773,\"x\":-855.007}', '[]', NULL, 1, 1, 0, '{\"x\":-858.543,\"y\":697.514,\"z\":144.253}', 1500000),
(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{\"y\":620.494,\"z\":141.588,\"x\":-752.82}', '{\"y\":618.62,\"z\":143.153,\"x\":-759.317}', '{\"y\":617.629,\"z\":143.153,\"x\":-760.789}', '{\"y\":621.281,\"z\":141.254,\"x\":-750.919}', '[]', NULL, 1, 1, 0, '{\"x\":-762.504,\"y\":618.992,\"z\":135.53}', 1500000),
(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{\"y\":37.025,\"z\":42.58,\"x\":-618.299}', '{\"y\":58.898,\"z\":97.2,\"x\":-603.301}', '{\"y\":58.941,\"z\":97.2,\"x\":-608.741}', '{\"y\":30.603,\"z\":42.524,\"x\":-620.017}', '[]', NULL, 1, 1, 0, '{\"x\":-622.173,\"y\":54.585,\"z\":96.599}', 1700000),
(12, 'MiltonDrive', 'Milton Drive', '{\"x\":-775.17,\"y\":312.01,\"z\":84.658}', NULL, NULL, '{\"x\":-775.346,\"y\":306.776,\"z\":84.7}', '[]', NULL, 0, 0, 1, NULL, 0),
(13, 'Modern1Apartment', 'Appartement Moderne 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_01_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.661,\"y\":327.672,\"z\":210.396}', 1300000),
(14, 'Modern2Apartment', 'Appartement Moderne 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_01_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.735,\"y\":326.757,\"z\":186.313}', 1300000),
(15, 'Modern3Apartment', 'Appartement Moderne 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_01_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.386,\"y\":330.782,\"z\":195.08}', 1300000),
(16, 'Mody1Apartment', 'Appartement Mode 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_02_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.615,\"y\":327.878,\"z\":210.396}', 1300000),
(17, 'Mody2Apartment', 'Appartement Mode 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_02_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.297,\"y\":327.092,\"z\":186.313}', 1300000),
(18, 'Mody3Apartment', 'Appartement Mode 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_02_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.303,\"y\":330.932,\"z\":195.085}', 1300000),
(19, 'Vibrant1Apartment', 'Appartement Vibrant 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_03_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.885,\"y\":327.641,\"z\":210.396}', 1300000),
(20, 'Vibrant2Apartment', 'Appartement Vibrant 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_03_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.607,\"y\":327.344,\"z\":186.313}', 1300000),
(21, 'Vibrant3Apartment', 'Appartement Vibrant 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_03_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.525,\"y\":330.851,\"z\":195.085}', 1300000),
(22, 'Sharp1Apartment', 'Appartement Persan 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_04_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.527,\"y\":327.89,\"z\":210.396}', 1300000),
(23, 'Sharp2Apartment', 'Appartement Persan 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_04_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.642,\"y\":326.497,\"z\":186.313}', 1300000),
(24, 'Sharp3Apartment', 'Appartement Persan 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_04_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.503,\"y\":331.318,\"z\":195.085}', 1300000),
(25, 'Monochrome1Apartment', 'Appartement Monochrome 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_05_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.289,\"y\":328.086,\"z\":210.396}', 1300000),
(26, 'Monochrome2Apartment', 'Appartement Monochrome 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_05_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.692,\"y\":326.762,\"z\":186.313}', 1300000),
(27, 'Monochrome3Apartment', 'Appartement Monochrome 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_05_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.094,\"y\":330.976,\"z\":195.085}', 1300000),
(28, 'Seductive1Apartment', 'Appartement Séduisant 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_06_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.263,\"y\":328.104,\"z\":210.396}', 1300000),
(29, 'Seductive2Apartment', 'Appartement Séduisant 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_06_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.655,\"y\":326.611,\"z\":186.313}', 1300000),
(30, 'Seductive3Apartment', 'Appartement Séduisant 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_06_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.3,\"y\":331.414,\"z\":195.085}', 1300000),
(31, 'Regal1Apartment', 'Appartement Régal 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_07_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.956,\"y\":328.257,\"z\":210.396}', 1300000),
(32, 'Regal2Apartment', 'Appartement Régal 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_07_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.545,\"y\":326.659,\"z\":186.313}', 1300000),
(33, 'Regal3Apartment', 'Appartement Régal 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_07_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.087,\"y\":331.429,\"z\":195.123}', 1300000),
(34, 'Aqua1Apartment', 'Appartement Aqua 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_08_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.187,\"y\":328.47,\"z\":210.396}', 1300000),
(35, 'Aqua2Apartment', 'Appartement Aqua 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_08_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.658,\"y\":326.563,\"z\":186.313}', 1300000),
(36, 'Aqua3Apartment', 'Appartement Aqua 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_08_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.287,\"y\":331.084,\"z\":195.086}', 1300000),
(37, 'IntegrityWay', '4 Integrity Way', '{\"x\":-47.804,\"y\":-585.867,\"z\":36.956}', NULL, NULL, '{\"x\":-54.178,\"y\":-583.762,\"z\":35.798}', '[]', NULL, 0, 0, 1, NULL, 0),
(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{\"x\":-31.409,\"y\":-594.927,\"z\":79.03}', '{\"x\":-26.098,\"y\":-596.909,\"z\":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-11.923,\"y\":-597.083,\"z\":78.43}', 1700000),
(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{\"x\":-17.702,\"y\":-588.524,\"z\":89.114}', '{\"x\":-16.21,\"y\":-582.569,\"z\":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-26.327,\"y\":-588.384,\"z\":89.123}', 1700000),
(40, 'DellPerroHeights', 'Dell Perro Heights', '{\"x\":-1447.06,\"y\":-538.28,\"z\":33.74}', NULL, NULL, '{\"x\":-1440.022,\"y\":-548.696,\"z\":33.74}', '[]', NULL, 0, 0, 1, NULL, 0),
(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{\"x\":-1452.125,\"y\":-540.591,\"z\":73.044}', '{\"x\":-1455.435,\"y\":-535.79,\"z\":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1467.058,\"y\":-527.571,\"z\":72.443}', 1700000),
(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{\"x\":-1451.562,\"y\":-523.535,\"z\":55.928}', '{\"x\":-1456.02,\"y\":-519.209,\"z\":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1457.026,\"y\":-530.219,\"z\":55.937}', 1700000);

-- --------------------------------------------------------

--
-- Structure de la table `rented_aircrafts`
--

DROP TABLE IF EXISTS `rented_aircrafts`;
CREATE TABLE IF NOT EXISTS `rented_aircrafts` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(30) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `rented_boats`
--

DROP TABLE IF EXISTS `rented_boats`;
CREATE TABLE IF NOT EXISTS `rented_boats` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(30) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `rented_vehicles`
--

DROP TABLE IF EXISTS `rented_vehicles`;
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(30) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `shops`
--

DROP TABLE IF EXISTS `shops`;
CREATE TABLE IF NOT EXISTS `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `shops`
--

INSERT INTO `shops` (`id`, `store`, `item`, `price`) VALUES
(1, 'TwentyFourSeven', 'bread', 30),
(2, 'TwentyFourSeven', 'water', 15),
(3, 'RobsLiquor', 'bread', 30),
(4, 'RobsLiquor', 'water', 15),
(5, 'LTDgasoline', 'bread', 30),
(6, 'LTDgasoline', 'water', 15),
(7, 'LTDgasoline', 'croquettes', 1000),
(8, 'TwentyFourSeven', 'bolcacahuetes', 10),
(9, 'RobsLiquor', 'bolcacahuetes', 10),
(10, 'LTDgasoline', 'bolcacahuetes', 10),
(11, 'TwentyFourSeven', 'bolnoixcajou', 10),
(12, 'RobsLiquor', 'bolnoixcajou', 10),
(13, 'LTDgasoline', 'bolnoixcajou', 10),
(14, 'TwentyFourSeven', 'bolpistache', 10),
(15, 'RobsLiquor', 'bolpistache', 10),
(16, 'LTDgasoline', 'bolpistache', 10),
(17, 'TwentyFourSeven', 'bolchips', 10),
(18, 'RobsLiquor', 'bolchips', 10),
(19, 'LTDgasoline', 'bolchips', 10),
(20, 'TwentyFourSeven', 'coffee', 2),
(21, 'RobsLiquor', 'coffee', 2),
(22, 'LTDgasoline', 'coffee', 2),
(23, 'TwentyFourSeven', 'energy', 50),
(24, 'RobsLiquor', 'energy', 50),
(25, 'LTDgasoline', 'energy', 50),
(26, 'TwentyFourSeven', 'cola', 10),
(27, 'RobsLiquor', 'cola', 10),
(28, 'LTDgasoline', 'cola', 10),
(29, 'TwentyFourSeven', 'icetea', 10),
(30, 'RobsLiquor', 'icetea', 10),
(31, 'LTDgasoline', 'icetea', 10),
(32, 'TwentyFourSeven', 'hepar', 20),
(33, 'RobsLiquor', 'hepar', 20),
(34, 'LTDgasoline', 'hepar', 20),
(35, 'TwentyFourSeven', 'taboulet', 15),
(36, 'RobsLiquor', 'taboulet', 15),
(37, 'LTDgasoline', 'taboulet', 15);

-- --------------------------------------------------------

--
-- Structure de la table `shops2`
--

DROP TABLE IF EXISTS `shops2`;
CREATE TABLE IF NOT EXISTS `shops2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `shops2`
--

INSERT INTO `shops2` (`id`, `store`, `item`, `price`) VALUES
(1, 'narekshop', 'yusuf', 18000),
(2, 'narekshop', 'grip', 500),
(3, 'narekshop', 'flashlight', 500),
(4, 'narekshop', 'silencieux', 250),
(5, 'narekshop', 'clip', 250);

-- --------------------------------------------------------

--
-- Structure de la table `society_moneywash`
--

DROP TABLE IF EXISTS `society_moneywash`;
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `truck_inventory`
--

DROP TABLE IF EXISTS `truck_inventory`;
CREATE TABLE IF NOT EXISTS `truck_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `name` varchar(255) NOT NULL,
  `itemt` varchar(50) DEFAULT NULL,
  `owned` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item` (`item`,`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `truck_inventory`
--

INSERT INTO `truck_inventory` (`id`, `item`, `count`, `plate`, `name`, `itemt`, `owned`) VALUES
(1, 'WEAPON_PISTOL50', 10, 'ZBH 502 ', 'Pistolet calibre 50', 'item_weapon', '1'),
(10, 'WEAPON_ASSAULTRIFLE', 1, 'HYE 692 ', 'Fusil d\'assaut', 'item_weapon', '1'),
(47, 'weed', 100, 'JDE 708 ', 'Weed', 'item_standard', '1'),
(136, 'WEAPON_ASSAULTRIFLE_MK2', 216, 'YAA 644 ', 'Assault Rifle Mk II ', 'item_weapon', '1'),
(138, 'weed', 17, 'BFL 454 ', 'Weed', 'item_standard', '1'),
(139, 'WEAPON_PIPEBOMB', 10, 'BFL 454 ', 'Bombe tuyau', 'item_weapon', '1'),
(140, 'WEAPON_MUSKET', 250, 'BFL 454 ', 'Mousquet', 'item_weapon', '1'),
(141, 'WEAPON_STICKYBOMB', 25, 'BFL 454 ', 'Bombe collante', 'item_weapon', '1'),
(142, 'WEAPON_SNIPERRIFLE', 250, 'BFL 454 ', 'Fusil de sniper', 'item_weapon', '1'),
(143, 'WEAPON_SAWNOFFSHOTGUN', 25, 'BFL 454 ', 'Carabine à canon scié', 'item_weapon', '1'),
(144, 'WEAPON_ADVANCEDRIFLE', 250, 'BFL 454 ', 'Fusil avancé', 'item_weapon', '1');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `skin` longtext COLLATE utf8mb4_bin,
  `job` varchar(255) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT '0',
  `org` varchar(255) COLLATE utf8mb4_bin DEFAULT 'freecity',
  `org_gradeorg` int(11) DEFAULT '0',
  `loadout` longtext COLLATE utf8mb4_bin,
  `position` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `lastname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `dateofbirth` varchar(25) COLLATE utf8mb4_bin DEFAULT '',
  `sex` varchar(10) COLLATE utf8mb4_bin DEFAULT '',
  `height` varchar(5) COLLATE utf8mb4_bin DEFAULT '',
  `status` longtext COLLATE utf8mb4_bin,
  `isDead` bit(1) DEFAULT b'0',
  `phone_number` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `last_property` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `animal` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `user_accounts`
--

DROP TABLE IF EXISTS `user_accounts`;
CREATE TABLE IF NOT EXISTS `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user_inventory`
--

DROP TABLE IF EXISTS `user_inventory`;
CREATE TABLE IF NOT EXISTS `user_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user_licenses`
--

DROP TABLE IF EXISTS `user_licenses`;
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vehicles`
--

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('16CHALLENGER', '16CHALLENGER', 275000, 'import'),
('450crf', '450crf', 42000, 'motomod'),
('750li', '750li', 800000, 'import'),
('911TURBOS', '911TURBOS', 1400000, 'import'),
('A45', 'a45', 160000, 'import'),
('Adder', 'adder', 900000, 'super'),
('aeroxr', 'aeroxr', 26000, 'motomod'),
('Akuma', 'AKUMA', 7500, 'motorcycles'),
('Alpha', 'alpha', 60000, 'sports'),
('ap2', 'ap2', 240000, 'import'),
('Ardent', 'ardent', 1150000, 'sportsclassics'),
('Asea', 'asea', 5500, 'sedans'),
('Autarch', 'autarch', 1955000, 'super'),
('Avarus', 'avarus', 18000, 'motorcycles'),
('Bagger', 'bagger', 13500, 'motorcycles'),
('Baller', 'baller2', 40000, 'suvs'),
('Baller Sport', 'baller3', 60000, 'suvs'),
('Banshee', 'banshee', 70000, 'sports'),
('Banshee 900R', 'banshee2', 255000, 'super'),
('Bati 801', 'bati', 12000, 'motorcycles'),
('Bati 801RR', 'bati2', 19000, 'motorcycles'),
('Bestia GTS', 'bestiagts', 55000, 'sports'),
('BF400', 'bf400', 6500, 'motorcycles'),
('Bf Injection', 'bfinjection', 16000, 'offroad'),
('Bifta', 'bifta', 12000, 'offroad'),
('Blade', 'blade', 15000, 'muscle'),
('Blazer', 'blazer', 6500, 'offroad'),
('Blazer Sport', 'blazer4', 8500, 'offroad'),
('Blista', 'blista', 8000, 'compacts'),
('BMM', 'BMM', 420000, 'import'),
('M3E92', 'bmwm3e92', 400000, 'import'),
('bmws', 'bmws', 45000, 'motomod'),
('BMX (velo)', 'bmx', 160, 'motorcycles'),
('Bobcat XL', 'bobcatxl', 32000, 'vans'),
('Brawler', 'brawler', 45000, 'offroad'),
('Brioso R/A', 'brioso', 18000, 'compacts'),
('BRZ', 'brz', 242000, 'import'),
('Btype', 'btype', 62000, 'sportsclassics'),
('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
('Buccaneer', 'buccaneer', 18000, 'muscle'),
('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
('Buffalo', 'buffalo', 12000, 'sports'),
('Buffalo S', 'buffalo2', 20000, 'sports'),
('Bullet', 'bullet', 90000, 'super'),
('Burrito', 'burrito3', 19000, 'vans'),
('C63', 'c63', 375000, 'import'),
('Camper', 'camper', 42000, 'vans'),
('Carbonizzare', 'carbonizzare', 75000, 'sports'),
('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
('Casco', 'casco', 30000, 'sportsclassics'),
('Cavalcade', 'cavalcade2', 55000, 'suvs'),
('Cheetah', 'cheetah', 375000, 'super'),
('Chimera', 'chimera', 38000, 'motorcycles'),
('Chino', 'chino', 15000, 'muscle'),
('Chino Luxe', 'chino2', 19000, 'muscle'),
('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
('Comet', 'comet2', 65000, 'sports'),
('Comet 5', 'comet5', 1145000, 'sports'),
('Contender', 'contender', 70000, 'suvs'),
('Coquette', 'coquette', 65000, 'sports'),
('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
('Cyclone', 'cyclone', 1890000, 'super'),
('Daemon', 'daemon', 11500, 'motorcycles'),
('Daemon High', 'daemon2', 13500, 'motorcycles'),
('Defiler', 'defiler', 9800, 'motorcycles'),
('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
('Dominator', 'dominator', 35000, 'muscle'),
('Double T', 'double', 28000, 'motorcycles'),
('Dubsta', 'dubsta', 45000, 'suvs'),
('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
('Dukes', 'dukes', 28000, 'muscle'),
('Dune Buggy', 'dune', 8000, 'offroad'),
('E63', 'e63amg', 375000, 'import'),
('Elegy', 'elegy2', 38500, 'sports'),
('Emperor', 'emperor', 8500, 'sedans'),
('Enduro', 'enduro', 5500, 'motorcycles'),
('Entity XF', 'entityxf', 425000, 'super'),
('Esskey', 'esskey', 4200, 'motorcycles'),
('EVO10', 'EVO10', 170000, 'import'),
('Exemplar', 'exemplar', 32000, 'coupes'),
('F620', 'f620', 40000, 'coupes'),
('Faction', 'faction', 20000, 'muscle'),
('Faction Rider', 'faction2', 30000, 'muscle'),
('Faction XL', 'faction3', 40000, 'muscle'),
('Faggio', 'faggio', 1900, 'motorcycles'),
('Vespa', 'faggio2', 2800, 'motorcycles'),
('Felon', 'felon', 42000, 'coupes'),
('Felon GT', 'felon2', 55000, 'coupes'),
('Feltzer', 'feltzer2', 55000, 'sports'),
('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
('Fixter (velo)', 'fixter', 225, 'motorcycles'),
('FMJ', 'fmj', 185000, 'super'),
('Fhantom', 'fq2', 17000, 'suvs'),
('Fugitive', 'fugitive', 12000, 'sedans'),
('Furore GT', 'furoregt', 45000, 'sports'),
('Fusilade', 'fusilade', 40000, 'sports'),
('Gauntlet', 'gauntlet', 30000, 'muscle'),
('Gang Burrito', 'gburrito', 45000, 'vans'),
('Burrito', 'gburrito2', 29000, 'vans'),
('Glendale', 'glendale', 6500, 'sedans'),
('Grabger', 'granger', 50000, 'suvs'),
('Gresley', 'gresley', 47500, 'suvs'),
('GT 500', 'gt500', 785000, 'sportsclassics'),
('GTR17', 'gtr', 462000, 'import'),
('Guardian', 'guardian', 45000, 'offroad'),
('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
('Hermes', 'hermes', 535000, 'muscle'),
('Hexer', 'hexer', 12000, 'motorcycles'),
('Hotknife', 'hotknife', 125000, 'muscle'),
('Huntley S', 'huntley', 40000, 'suvs'),
('Hustler', 'hustler', 625000, 'muscle'),
('Infernus', 'infernus', 180000, 'super'),
('Innovation', 'innovation', 23500, 'motorcycles'),
('Intruder', 'intruder', 7500, 'sedans'),
('Issi', 'issi2', 10000, 'compacts'),
('Jackal', 'jackal', 38000, 'coupes'),
('Jester', 'jester', 65000, 'sports'),
('Jester(Racecar)', 'jester2', 135000, 'sports'),
('Journey', 'journey', 6500, 'vans'),
('Kamacho', 'kamacho', 345000, 'offroad'),
('Khamelion', 'khamelion', 38000, 'sports'),
('Kuruma', 'kuruma', 30000, 'sports'),
('kx450f', 'kx450f', 19200, 'motomod'),
('Landstalker', 'landstalker', 35000, 'suvs'),
('RE-7B', 'le7b', 325000, 'super'),
('LP770', 'lp770', 4350000, 'import'),
('Lynx', 'lynx', 40000, 'sports'),
('Mamba', 'mamba', 70000, 'sports'),
('Manana', 'manana', 12800, 'sportsclassics'),
('Manchez', 'manchez', 5300, 'motorcycles'),
('Massacro', 'massacro', 65000, 'sports'),
('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
('Mesa', 'mesa', 16000, 'suvs'),
('Mesa Trail', 'mesa3', 40000, 'suvs'),
('MGT', 'MGT', 340000, 'import'),
('MI8', 'MI8', 460000, 'import'),
('Minivan', 'minivan', 13000, 'vans'),
('Golf 3', 'mk3', 120000, 'import'),
('BRABUS', 'MLBRABUS', 230000, 'import'),
('Monroe', 'monroe', 55000, 'sportsclassics'),
('Moonbeam', 'moonbeam', 18000, 'vans'),
('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
('Nemesis', 'nemesis', 5800, 'motorcycles'),
('Neon', 'neon', 1500000, 'sports'),
('Nightblade', 'nightblade', 35000, 'motorcycles'),
('Nightshade', 'nightshade', 65000, 'muscle'),
('9F', 'ninef', 65000, 'sports'),
('9F Cabrio', 'ninef2', 80000, 'sports'),
('Omnis', 'omnis', 35000, 'sports'),
('Oracle XS', 'oracle2', 35000, 'coupes'),
('Osiris', 'osiris', 160000, 'super'),
('Panto', 'panto', 10000, 'compacts'),
('Paradise', 'paradise', 19000, 'vans'),
('Pariah', 'pariah', 1420000, 'sports'),
('Patriot', 'patriot', 55000, 'suvs'),
('PCJ-600', 'pcj', 6200, 'motorcycles'),
('Penumbra', 'penumbra', 28000, 'sports'),
('Pfister', 'pfister811', 85000, 'super'),
('Phoenix', 'phoenix', 12500, 'muscle'),
('Picador', 'picador', 18000, 'muscle'),
('Pigalle', 'pigalle', 20000, 'sportsclassics'),
('Prairie', 'prairie', 12000, 'compacts'),
('Premier', 'premier', 8000, 'sedans'),
('Primo Custom', 'primo2', 14000, 'sedans'),
('X80 Proto', 'prototipo', 2500000, 'super'),
('Yamaha R1', 'r1', 45000, 'motomod'),
('r6', 'r6', 35000, 'motomod'),
('R8', 'r8prior', 450000, 'import'),
('Radius', 'radi', 29000, 'suvs'),
('raiden', 'raiden', 1375000, 'sports'),
('Rapid GT', 'rapidgt', 35000, 'sports'),
('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
('Reaper', 'reaper', 150000, 'super'),
('Rebel', 'rebel2', 35000, 'offroad'),
('Regina', 'regina', 5000, 'sedans'),
('Retinue', 'retinue', 615000, 'sportsclassics'),
('Revolter', 'revolter', 1610000, 'sports'),
('riata', 'riata', 380000, 'offroad'),
('BMW M4', 'rmodm4gts', 420000, 'import'),
('Rocoto', 'rocoto', 45000, 'suvs'),
('rs3', 'rs3', 185000, 'import'),
('rs7', 'rs7', 310000, 'import'),
('RT70 (collection)', 'RT70', 2400000, 'import'),
('Ruffian', 'ruffian', 6800, 'motorcycles'),
('Rumpo', 'rumpo', 15000, 'vans'),
('Rumpo Trail', 'rumpo3', 19500, 'vans'),
('Sabre Turbo', 'sabregt', 20000, 'muscle'),
('Sabre GT', 'sabregt2', 25000, 'muscle'),
('Sanchez', 'sanchez', 5300, 'motorcycles'),
('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
('Sanctus', 'sanctus', 25000, 'motorcycles'),
('Sandking', 'sandking', 55000, 'offroad'),
('Savestra', 'savestra', 990000, 'sportsclassics'),
('SC 1', 'sc1', 1603000, 'super'),
('Schafter', 'schafter2', 25000, 'sedans'),
('Schafter V12', 'schafter3', 50000, 'sports'),
('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
('Seminole', 'seminole', 25000, 'suvs'),
('Sentinel', 'sentinel', 32000, 'coupes'),
('Sentinel XS', 'sentinel2', 40000, 'coupes'),
('Sentinel3', 'sentinel3', 650000, 'sports'),
('Seven 70', 'seven70', 39500, 'sports'),
('ETR1', 'sheava', 220000, 'super'),
('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
('Slam Van', 'slamvan3', 11500, 'muscle'),
('Sovereign', 'sovereign', 22000, 'motorcycles'),
('Stinger', 'stinger', 80000, 'sportsclassics'),
('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
('Streiter', 'streiter', 500000, 'sports'),
('Stretch', 'stretch', 90000, 'sedans'),
('Stromberg', 'stromberg', 3185350, 'sports'),
('Sultan', 'sultan', 15000, 'sports'),
('Sultan RS', 'sultanrs', 65000, 'super'),
('Super Diamond', 'superd', 130000, 'sedans'),
('Surano', 'surano', 50000, 'sports'),
('Surfer', 'surfer', 12000, 'vans'),
('T20', 't20', 300000, 'super'),
('Tailgater', 'tailgater', 30000, 'sedans'),
('Tampa', 'tampa', 16000, 'muscle'),
('Drift Tampa', 'tampa2', 80000, 'sports'),
('Thrust', 'thrust', 24000, 'motorcycles'),
('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
('Trophy Truck', 'trophytruck', 60000, 'offroad'),
('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
('Tropos', 'tropos', 40000, 'sports'),
('Turismo R', 'turismor', 350000, 'super'),
('Tyrus', 'tyrus', 600000, 'super'),
('Vacca', 'vacca', 120000, 'super'),
('Vader', 'vader', 7200, 'motorcycles'),
('Verlierer', 'verlierer2', 70000, 'sports'),
('Vigero', 'vigero', 12500, 'muscle'),
('Virgo', 'virgo', 14000, 'muscle'),
('Viseris', 'viseris', 875000, 'sportsclassics'),
('Visione', 'visione', 2250000, 'super'),
('Voltic', 'voltic', 90000, 'super'),
('Voodoo', 'voodoo', 7200, 'muscle'),
('Vortex', 'vortex', 9800, 'motorcycles'),
('Warrener', 'warrener', 4000, 'sedans'),
('Washington', 'washington', 9000, 'sedans'),
('Windsor', 'windsor', 95000, 'coupes'),
('Windsor Drop', 'windsor2', 125000, 'coupes'),
('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
('XLS', 'xls', 32000, 'suvs'),
('Yosemite', 'yosemite', 485000, 'muscle'),
('Youga', 'youga', 10800, 'vans'),
('Youga Luxuary', 'youga2', 14500, 'vans'),
('Z190', 'z190', 900000, 'sportsclassics'),
('Zentorno', 'zentorno', 1500000, 'super'),
('Zion', 'zion', 36000, 'coupes'),
('Zion Cabrio', 'zion2', 45000, 'coupes'),
('Zombie', 'zombiea', 9500, 'motorcycles'),
('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
('Z-Type', 'ztype', 220000, 'sportsclassics');

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_categories`
--

DROP TABLE IF EXISTS `vehicle_categories`;
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('compacts', 'Compacts'),
('coupes', 'Coupés'),
('import', 'Voiture Moddés'),
('motomod', 'Moto Moddés'),
('motorcycles', 'Motos'),
('muscle', 'Muscle'),
('offroad', 'Off Road'),
('sedans', 'Sedans'),
('sports', 'Sports'),
('sportsclassics', 'Sports Classics'),
('super', 'Super'),
('suvs', 'SUVs'),
('vans', 'Vans');

-- --------------------------------------------------------

--
-- Structure de la table `weashops`
--

DROP TABLE IF EXISTS `weashops`;
CREATE TABLE IF NOT EXISTS `weashops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `weashops`
--

INSERT INTO `weashops` (`id`, `name`, `item`, `price`) VALUES
(7, 'BlackWeashop', 'WEAPON_COMBATPISTOL', 25000),
(8, 'BlackWeashop', 'WEAPON_STUNGUN', 5000),
(9, 'BlackWeashop', 'WEAPON_SAWNOFFSHOTGUN', 60000),
(10, 'BlackWeashop', 'WEAPON_MICROSMG', 70000),
(11, 'BlackWeashop', 'WEAPON_HEAVYSHOTGUN', 120000),
(12, 'BlackWeashop', 'WEAPON_COMPACTRIFLE', 110000),
(13, 'BlackWeashop', 'WEAPON_ASSAULTRIFLE', 250000),
(14, 'BlackWeashop', 'WEAPON_SPECIALCARBINE', 190000),
(15, 'BlackWeashop', 'WEAPON_SMG', 60000),
(16, 'BlackWeashop', 'WEAPON_MG', 60000),
(17, 'BlackWeashop', 'WEAPON_COMBATPDW', 65000),
(18, 'BlackWeashop', 'WEAPON_MARKSMANRIFLE', 70000),
(19, 'BlackWeashop', 'WEAPON_GUSENBERG', 100000),
(24, 'GunShop', 'WEAPON_BAT', 1500),
(25, 'GunShop', 'WEAPON_KNUCKLE', 1500),
(26, 'GunShop', 'WEAPON_GOLFCLUB', 3700),
(28, 'GunShop', 'WEAPON_VINTAGEPISTOL', 10000),
(30, 'GunShop', 'WEAPON_PISTOL50', 25000),
(31, 'GunShop', 'WEAPON_REVOLVER', 18000),
(173, 'GunShop', 'WEAPON_FLASHLIGHT', 1000),
(176, 'GunShop', 'WEAPON_HATCHET', 3500),
(180, 'GunShop', 'WEAPON_CROWBAR', 1500),
(181, 'GunShop', 'WEAPON_HAMMER', 1500),
(182, 'GunShop', 'WEAPON_KNIFE', 1000),
(196, 'GunShop', 'WEAPON_MACHETE', 1500),
(202, 'GunShop', 'WEAPON_SNSPISTOL', 30000),
(205, 'GunShop', 'WEAPON_HEAVYPISTOL', 35000),
(207, 'GunShop', 'WEAPON_MUSKET', 50000),
(216, 'GunShop', 'WEAPON_PISTOL', 6500);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
