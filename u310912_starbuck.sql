# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.9)
# Database: u310912_starbuck
# Generation Time: 2012-02-04 17:33:23 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table aliases
# ------------------------------------------------------------

DROP TABLE IF EXISTS `aliases`;

CREATE TABLE `aliases` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `aliasCountryId` int(11) DEFAULT NULL,
  `aliasSerieId` int(11) DEFAULT NULL,
  `aliasMugId` int(11) DEFAULT NULL,
  `aliasName` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `aliases` WRITE;
/*!40000 ALTER TABLE `aliases` DISABLE KEYS */;

INSERT INTO `aliases` (`id`, `aliasCountryId`, `aliasSerieId`, `aliasMugId`, `aliasName`)
VALUES
	(1,5,NULL,NULL,'United States of America'),
	(2,21,NULL,NULL,'The Bahamas'),
	(3,26,NULL,NULL,'Czech Republic'),
	(4,39,NULL,NULL,'The Netherlands'),
	(5,55,NULL,NULL,'United Arab Emirates'),
	(6,NULL,1,NULL,'New \'08 Global Icon Series'),
	(7,NULL,2,NULL,'Old \'94 City Mug Series');

/*!40000 ALTER TABLE `aliases` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table countries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `countryName` varchar(50) NOT NULL DEFAULT '',
  `countryAcquireAlias` varchar(50) DEFAULT NULL,
  `countryDesc` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;

INSERT INTO `countries` (`id`, `countryName`, `countryAcquireAlias`, `countryDesc`)
VALUES
	(1,'Greece',NULL,'Starbucks celebrated the opening of its first store in Greece in September 2002, with the first store at Korai Street. Greece, a country with a strong coffee tradition welcomed Starbucks with enthusiasm and within a period of five years Starbucks is offering to more and more customers the finest coffee in 56 locations in Athens, Salonica, Volos, Mykonos, Patras, Corfu, Rhodes, Chania and Heraklio of Crete.'),
	(2,'Spain',NULL,'In October 2001 Starbucks initiated plans to open stores in Spain, forming a joint venture company with Grupo Vips, a company with 25 years of experience in the Spanish restaurant and retail sector.\n\nThe two companies shared common culture and company values, both focusing on a commitment to the highest quality product for their clients and a diverse and respectful work environment for their partners.\n\nBy April 2002 Starbucks had successfully entered the Spanish market with the opening of two stores in Madrid. Shortly after, two new stores were opened in Barcelona. Starbucks, thanks to its loyal customers, has grown tremendously; there are currently 75 stores in Spain located in Madrid, Barcelona, Valencia and Sevilla.'),
	(3,'Belgium',NULL,NULL),
	(4,'Germany',NULL,NULL),
	(5,'USA','United States of America',NULL),
	(6,'Bulgaria',NULL,'In 2008, Starbucks successfully entered the Bulgarian market through a joint venture with the Marinopoulos Group. The two companies share a common culture, focusing on a great commitment to customised coffee, similar company values and a mutual respect for people and the environment. Already they operate stores in Greece, Cyprus, Romania, Switzerland, and Austria.'),
	(7,'Wales',NULL,NULL),
	(8,'Thailand',NULL,NULL),
	(9,'China',NULL,NULL),
	(10,'Cyprus',NULL,NULL),
	(11,'France',NULL,NULL),
	(12,'Turkey',NULL,NULL),
	(13,'England',NULL,NULL),
	(14,'Russia',NULL,NULL),
	(15,'Scotland',NULL,NULL),
	(16,'Taiwan',NULL,NULL),
	(17,'Austria',NULL,'Starbucks Coffee Austria GmbH ist für den Aufbau und das Betreiben von Starbucks Coffeehouses in Österreich zuständig. Operativ geführt wird das Geschäft von der Firma Starbucks Coffee Austria GmbH.\n\nStarbucks Coffee Österreich eröffnete im Dezember 2001 das erste Starbucks Coffeehouse in Wien und betreibt aktuell elf Coffeehouses in Wien.'),
	(18,'Argentina',NULL,NULL),
	(19,'Aruba',NULL,NULL),
	(20,'Australia',NULL,NULL),
	(21,'Bahamas','The Bahamas',NULL),
	(22,'Bahrain',NULL,NULL),
	(23,'Brazil',NULL,NULL),
	(24,'Canada',NULL,NULL),
	(25,'Chile',NULL,NULL),
	(26,'Czech','Czech Republic',NULL),
	(27,'Denmark',NULL,NULL),
	(28,'Egypt',NULL,NULL),
	(29,'Hungary',NULL,NULL),
	(30,'Indonesia',NULL,NULL),
	(31,'Ireland',NULL,NULL),
	(32,'Israel',NULL,NULL),
	(33,'Japan',NULL,NULL),
	(34,'Jordan',NULL,NULL),
	(35,'Kuwait',NULL,NULL),
	(36,'Lebanon',NULL,NULL),
	(37,'Malaysia',NULL,NULL),
	(38,'Mexico',NULL,NULL),
	(39,'Netherlands','The Netherlands',NULL),
	(40,'New Zealand',NULL,NULL),
	(41,'Northern Ireland1',NULL,NULL),
	(42,'Oman',NULL,NULL),
	(43,'Peru',NULL,NULL),
	(44,'Philippines',NULL,NULL),
	(45,'Poland',NULL,NULL),
	(46,'Portugal',NULL,NULL),
	(47,'Puerto Rico',NULL,NULL),
	(48,'Qatar',NULL,NULL),
	(49,'Romania',NULL,NULL),
	(50,'Saudi Arabia',NULL,NULL),
	(51,'Singapore',NULL,NULL),
	(52,'South Korea',NULL,NULL),
	(53,'Sweden',NULL,NULL),
	(54,'Switzerland',NULL,NULL),
	(55,'UAE','United Arab Emirates',NULL),
	(56,'United Kingdom1',NULL,NULL);

/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `logUserId` int(11) DEFAULT NULL,
  `logAction` varchar(50) DEFAULT NULL,
  `logDescription` varchar(255) DEFAULT NULL,
  `logMoment` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;

INSERT INTO `log` (`id`, `logUserId`, `logAction`, `logDescription`, `logMoment`)
VALUES
	(1,NULL,'Adding','mugCountryId: \"3\", mugSerieId: \"1\", mugName: \"Brussels\"','2012-02-01 23:35:40'),
	(2,NULL,'Adding','mugCountryId: \"13\", mugSerieId: \"1\", mugName: \"England (William Shakespeare)\"','2012-02-01 23:35:40'),
	(3,NULL,'Adding','mugCountryId: \"13\", mugSerieId: \"1\", mugName: \"England (Coat of Arms Seal)\"','2012-02-01 23:35:40'),
	(4,NULL,'Adding','mugCountryId: \"11\", mugSerieId: \"1\", mugName: \"Paris\"','2012-02-01 23:35:40'),
	(5,NULL,'Adding','mugCountryId: \"11\", mugSerieId: \"1\", mugName: \"Lyon\"','2012-02-01 23:35:40'),
	(6,NULL,'Adding','mugCountryId: \"1\", mugSerieId: \"1\", mugName: \"Corfu\"','2012-02-01 23:35:40'),
	(7,NULL,'Adding','mugCountryId: \"1\", mugSerieId: \"1\", mugName: \"Rhodes\"','2012-02-01 23:35:40'),
	(8,NULL,'Adding','mugCountryId: \"15\", mugSerieId: \"1\", mugName: \"Edinburgh\"','2012-02-01 23:35:40'),
	(9,NULL,'Adding','mugCountryId: \"2\", mugSerieId: \"1\", mugName: \"Seville\"','2012-02-01 23:35:40'),
	(10,NULL,'Adding','mugCountryId: \"2\", mugSerieId: \"1\", mugName: \"Spain\"','2012-02-01 23:35:40'),
	(11,NULL,'Adding','mugCountryId: \"2\", mugSerieId: \"1\", mugName: \"Valencia\"','2012-02-01 23:35:40'),
	(12,NULL,'Adding','mugCountryId: \"16\", mugSerieId: \"1\", mugName: \"Kaohsiung\"','2012-02-01 23:35:40'),
	(13,NULL,'Adding','mugCountryId: \"16\", mugSerieId: \"1\", mugName: \"Taichung\"','2012-02-01 23:35:40'),
	(14,NULL,'Adding','mugCountryId: \"16\", mugSerieId: \"1\", mugName: \"Tainan\"','2012-02-01 23:35:40'),
	(15,NULL,'Adding','mugCountryId: \"8\", mugSerieId: \"1\", mugName: \"Bangkok\"','2012-02-01 23:35:40'),
	(16,NULL,'Adding','mugCountryId: \"8\", mugSerieId: \"1\", mugName: \"Muan Jai\"','2012-02-01 23:35:40'),
	(17,NULL,'Adding','mugCountryId: \"8\", mugSerieId: \"1\", mugName: \"Pattaya\"','2012-02-01 23:35:40'),
	(18,NULL,'Adding','mugCountryId: \"8\", mugSerieId: \"1\", mugName: \"Phuket\"','2012-02-01 23:35:40'),
	(19,NULL,'Adding','mugCountryId: \"8\", mugSerieId: \"1\", mugName: \"Samui\"','2012-02-01 23:35:40'),
	(20,NULL,'Adding','mugCountryId: \"12\", mugSerieId: \"1\", mugName: \"Ankara\"','2012-02-01 23:35:40'),
	(21,NULL,'Adding','mugCountryId: \"12\", mugSerieId: \"1\", mugName: \"Cyprus\"','2012-02-01 23:35:40'),
	(22,NULL,'Adding','mugCountryId: \"12\", mugSerieId: \"1\", mugName: \"Izmir\"','2012-02-01 23:35:40'),
	(23,NULL,'Adding','mugCountryId: \"12\", mugSerieId: \"1\", mugName: \"Turkey\"','2012-02-01 23:35:40'),
	(24,NULL,'Adding','mugCountryId: \"3\", mugSerieId: \"1\", mugName: \"Antwerp\"','2012-02-01 23:35:40'),
	(25,NULL,'Adding','mugCountryId: \"9\", mugSerieId: \"1\", mugName: \"Beijing\"','2012-02-01 23:35:40'),
	(26,NULL,'Adding','mugCountryId: \"9\", mugSerieId: \"1\", mugName: \"Changsha\"','2012-02-01 23:35:40'),
	(27,NULL,'Adding','mugCountryId: \"9\", mugSerieId: \"1\", mugName: \"Chengdu\"','2012-02-01 23:35:40'),
	(28,NULL,'Adding','mugCountryId: \"9\", mugSerieId: \"1\", mugName: \"Chongqing\"','2012-02-01 23:35:40'),
	(29,NULL,'Adding','mugCountryId: \"9\", mugSerieId: \"1\", mugName: \"Dalian\"','2012-02-01 23:35:40'),
	(30,NULL,'Adding','mugCountryId: \"9\", mugSerieId: \"1\", mugName: \"Dongguan\"','2012-02-01 23:35:40'),
	(31,NULL,'Adding','mugCountryId: \"9\", mugSerieId: \"1\", mugName: \"Foshan\"','2012-02-01 23:35:40'),
	(32,NULL,'Adding','mugCountryId: \"9\", mugSerieId: \"1\", mugName: \"Fuzhou\"','2012-02-01 23:35:40'),
	(33,NULL,'Adding','mugCountryId: \"9\", mugSerieId: \"1\", mugName: \"Guangzhou\"','2012-02-01 23:35:40'),
	(34,NULL,'Adding','mugCountryId: \"9\", mugSerieId: \"1\", mugName: \"Harbin\"','2012-02-01 23:35:40'),
	(35,NULL,'Adding','mugCountryId: \"9\", mugSerieId: \"1\", mugName: \"Hefei\"','2012-02-01 23:35:40'),
	(37,NULL,'Adding','mugCountryId: \"9\", mugSerieId: \"1\", mugName: \"Jinan\"','2012-02-01 23:35:40'),
	(38,NULL,'Adding','mugCountryId: \"9\", mugSerieId: \"1\", mugName: \"Kunming\"','2012-02-01 23:35:40'),
	(39,NULL,'Adding','mugCountryId: \"9\", mugSerieId: \"1\", mugName: \"Qingdao\"','2012-02-01 23:35:40'),
	(40,NULL,'Adding','mugCountryId: \"9\", mugSerieId: \"1\", mugName: \"Shanghai\"','2012-02-01 23:35:40'),
	(41,NULL,'Adding','mugCountryId: \"9\", mugSerieId: \"1\", mugName: \"Shenyang\"','2012-02-01 23:35:40'),
	(42,NULL,'Adding','mugCountryId: \"9\", mugSerieId: \"1\", mugName: \"Shenzhen\"','2012-02-01 23:35:40'),
	(43,NULL,'Adding','mugCountryId: \"9\", mugSerieId: \"1\", mugName: \"Shijiazhuang\"','2012-02-01 23:35:40'),
	(44,NULL,'Adding','mugCountryId: \"9\", mugSerieId: \"1\", mugName: \"Tianjin\"','2012-02-01 23:35:40'),
	(45,NULL,'Adding','mugCountryId: \"9\", mugSerieId: \"1\", mugName: \"Wuhan\"','2012-02-01 23:35:40'),
	(46,NULL,'Adding','mugCountryId: \"9\", mugSerieId: \"1\", mugName: \"Xiamen\"','2012-02-01 23:35:40'),
	(47,NULL,'Adding','mugCountryId: \"9\", mugSerieId: \"1\", mugName: \"Xi\\\'an\"','2012-02-01 23:35:40'),
	(48,NULL,'Adding','mugCountryId: \"9\", mugSerieId: \"1\", mugName: \"Zhengzhou\"','2012-02-01 23:35:40'),
	(49,NULL,'Adding','mugCountryId: \"4\", mugSerieId: \"1\", mugName: \"Aachen\"','2012-02-01 23:35:40'),
	(50,NULL,'Adding','mugCountryId: \"4\", mugSerieId: \"1\", mugName: \"Berlin\"','2012-02-01 23:35:40'),
	(51,NULL,'Adding','mugCountryId: \"4\", mugSerieId: \"1\", mugName: \"Bielefeld\"','2012-02-01 23:35:40'),
	(52,NULL,'Adding','mugCountryId: \"4\", mugSerieId: \"1\", mugName: \"Braunschweig\"','2012-02-01 23:35:40'),
	(53,NULL,'Adding','mugCountryId: \"4\", mugSerieId: \"1\", mugName: \"Bremen\"','2012-02-01 23:35:40'),
	(54,NULL,'Adding','mugCountryId: \"4\", mugSerieId: \"1\", mugName: \"Düsseldorf\"','2012-02-01 23:35:40'),
	(55,NULL,'Adding','mugCountryId: \"4\", mugSerieId: \"1\", mugName: \"Dresden\"','2012-02-01 23:35:40'),
	(56,NULL,'Adding','mugCountryId: \"4\", mugSerieId: \"1\", mugName: \"Frankfurt (am Main)\"','2012-02-01 23:35:40'),
	(57,NULL,'Adding','mugCountryId: \"4\", mugSerieId: \"1\", mugName: \"Freiburg\"','2012-02-01 23:35:40'),
	(58,NULL,'Adding','mugCountryId: \"4\", mugSerieId: \"1\", mugName: \"Germany\"','2012-02-01 23:35:40'),
	(59,NULL,'Adding','mugCountryId: \"4\", mugSerieId: \"1\", mugName: \"Hannover\"','2012-02-01 23:35:40'),
	(60,NULL,'Adding','mugCountryId: \"4\", mugSerieId: \"1\", mugName: \"Heidelberg\"','2012-02-01 23:35:40'),
	(61,NULL,'Adding','mugCountryId: \"4\", mugSerieId: \"1\", mugName: \"Kiel\"','2012-02-01 23:35:40'),
	(62,NULL,'Adding','mugCountryId: \"4\", mugSerieId: \"1\", mugName: \"Leipzig\"','2012-02-01 23:35:40'),
	(63,NULL,'Adding','mugCountryId: \"4\", mugSerieId: \"1\", mugName: \"Mannheim\"','2012-02-01 23:35:40'),
	(64,NULL,'Adding','mugCountryId: \"4\", mugSerieId: \"1\", mugName: \"Münster\"','2012-02-01 23:35:40'),
	(65,NULL,'Adding','mugCountryId: \"4\", mugSerieId: \"1\", mugName: \"Oktoberfest\"','2012-02-01 23:35:40'),
	(66,NULL,'Adding','mugCountryId: \"4\", mugSerieId: \"1\", mugName: \"Potsdam\"','2012-02-01 23:35:40'),
	(67,NULL,'Adding','mugCountryId: \"4\", mugSerieId: \"1\", mugName: \"Ruhrgebiet\"','2012-02-01 23:35:40'),
	(68,NULL,'Adding','mugCountryId: \"4\", mugSerieId: \"1\", mugName: \"Stuttgart\"','2012-02-01 23:35:40'),
	(69,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Alaska\"','2012-02-01 23:35:40'),
	(70,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Arizona\"','2012-02-01 23:35:40'),
	(71,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Atlanta\"','2012-02-01 23:35:40'),
	(72,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Austin\"','2012-02-01 23:35:40'),
	(73,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"California\"','2012-02-01 23:35:40'),
	(74,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Charlotte\"','2012-02-01 23:35:40'),
	(75,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Chicago\"','2012-02-01 23:35:40'),
	(76,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Cleveland\"','2012-02-01 23:35:40'),
	(77,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Colorado\"','2012-02-01 23:35:40'),
	(78,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Dallas\"','2012-02-01 23:35:40'),
	(79,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Denver\"','2012-02-01 23:35:40'),
	(80,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Detroit\"','2012-02-01 23:35:40'),
	(81,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Florida\"','2012-02-01 23:35:40'),
	(82,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Fort Worth\"','2012-02-01 23:35:40'),
	(83,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Hamptons\"','2012-02-01 23:35:40'),
	(84,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Hawaii\"','2012-02-01 23:35:40'),
	(85,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Indianapolis\"','2012-02-01 23:35:40'),
	(86,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Jacksonville\"','2012-02-01 23:35:40'),
	(87,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Las Vegas\"','2012-02-01 23:35:40'),
	(88,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Los Angeles\"','2012-02-01 23:35:40'),
	(89,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Memphis\"','2012-02-01 23:35:40'),
	(90,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Miami\"','2012-02-01 23:35:40'),
	(91,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Nashville\"','2012-02-01 23:35:40'),
	(92,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"New Mexico\"','2012-02-01 23:35:40'),
	(93,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"New Orleans\"','2012-02-01 23:35:40'),
	(94,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"North Carolina\"','2012-02-01 23:35:40'),
	(95,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Ohio\"','2012-02-01 23:35:40'),
	(96,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Orange County\"','2012-02-01 23:35:40'),
	(97,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Orlando\"','2012-02-01 23:35:40'),
	(98,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Philadelphia\"','2012-02-01 23:35:40'),
	(99,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Phoenix\"','2012-02-01 23:35:40'),
	(100,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Pittsburgh\"','2012-02-01 23:35:40'),
	(101,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Portland\"','2012-02-01 23:35:40'),
	(102,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Sacramento\"','2012-02-01 23:35:40'),
	(103,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"San Antonio\"','2012-02-01 23:35:40'),
	(104,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"San Diego\"','2012-02-01 23:35:40'),
	(105,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"San Francisco\"','2012-02-01 23:35:40'),
	(106,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"St. Louis\"','2012-02-01 23:35:40'),
	(107,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Tampa\"','2012-02-01 23:35:40'),
	(108,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Twin Cities\"','2012-02-01 23:35:40'),
	(109,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Waikiki\"','2012-02-01 23:35:40'),
	(110,NULL,'Adding','mugCountryId: \"5\", mugSerieId: \"1\", mugName: \"Washington D.C.\"','2012-02-01 23:35:40'),
	(111,NULL,'Adding','mugCountryId: \"18\", mugSerieId: \"1\", mugName: \"Argentina\"','2012-02-02 00:02:07'),
	(112,NULL,'Adding','mugCountryId: \"18\", mugSerieId: \"1\", mugName: \"Buenos Aires\"','2012-02-02 00:02:07'),
	(113,NULL,'Adding','mugCountryId: \"19\", mugSerieId: \"1\", mugName: \"Aruba\"','2012-02-02 00:02:07'),
	(114,NULL,'Adding','mugCountryId: \"20\", mugSerieId: \"1\", mugName: \"Australia\"','2012-02-02 00:02:07'),
	(115,NULL,'Adding','mugCountryId: \"20\", mugSerieId: \"1\", mugName: \"Brisbane\"','2012-02-02 00:02:07'),
	(116,NULL,'Adding','mugCountryId: \"20\", mugSerieId: \"1\", mugName: \"Gold Coast\"','2012-02-02 00:02:07'),
	(117,NULL,'Adding','mugCountryId: \"20\", mugSerieId: \"1\", mugName: \"Melbourne\"','2012-02-02 00:02:07'),
	(118,NULL,'Adding','mugCountryId: \"20\", mugSerieId: \"1\", mugName: \"Sydney\"','2012-02-02 00:02:07'),
	(119,NULL,'Adding','mugCountryId: \"21\", mugSerieId: \"1\", mugName: \"Bahamas\"','2012-02-02 00:02:07'),
	(120,NULL,'Adding','mugCountryId: \"22\", mugSerieId: \"1\", mugName: \"Bahrain\"','2012-02-02 00:02:07'),
	(121,NULL,'Adding','mugCountryId: \"23\", mugSerieId: \"1\", mugName: \"Rio de Janeiro\"','2012-02-02 00:02:07'),
	(122,NULL,'Adding','mugCountryId: \"24\", mugSerieId: \"1\", mugName: \"Banff\"','2012-02-02 00:03:14'),
	(123,NULL,'Adding','mugCountryId: \"24\", mugSerieId: \"1\", mugName: \"Calgary\"','2012-02-02 00:03:14'),
	(124,NULL,'Adding','mugCountryId: \"24\", mugSerieId: \"1\", mugName: \"Canada\"','2012-02-02 00:03:14'),
	(125,NULL,'Adding','mugCountryId: \"24\", mugSerieId: \"1\", mugName: \"Edmonton\"','2012-02-02 00:03:14'),
	(126,NULL,'Adding','mugCountryId: \"24\", mugSerieId: \"1\", mugName: \"Montréal\"','2012-02-02 00:03:14'),
	(127,NULL,'Adding','mugCountryId: \"24\", mugSerieId: \"1\", mugName: \"Niagara Falls\"','2012-02-02 00:03:14'),
	(128,NULL,'Adding','mugCountryId: \"24\", mugSerieId: \"1\", mugName: \"Toronto\"','2012-02-02 00:03:14'),
	(129,NULL,'Adding','mugCountryId: \"24\", mugSerieId: \"1\", mugName: \"Vancouver\"','2012-02-02 00:03:14'),
	(130,NULL,'Adding','mugCountryId: \"24\", mugSerieId: \"1\", mugName: \"Vancouver Island\"','2012-02-02 00:03:14'),
	(131,NULL,'Adding','mugCountryId: \"24\", mugSerieId: \"1\", mugName: \"Whistler\"','2012-02-02 00:03:14'),
	(132,NULL,'Adding','mugCountryId: \"25\", mugSerieId: \"1\", mugName: \"Chile\"','2012-02-02 00:03:14'),
	(133,NULL,'Adding','mugCountryId: \"26\", mugSerieId: \"1\", mugName: \"Prague\"','2012-02-02 00:03:14'),
	(134,NULL,'Adding','mugCountryId: \"26\", mugSerieId: \"1\", mugName: \"Czech Republic\"','2012-02-02 00:03:14'),
	(135,NULL,'Adding','mugCountryId: \"27\", mugSerieId: \"1\", mugName: \"Copenhagen\"','2012-02-02 00:03:14'),
	(136,NULL,'Adding','mugCountryId: \"28\", mugSerieId: \"1\", mugName: \"Egypt\"','2012-02-02 00:03:14'),
	(137,NULL,'Adding','mugCountryId: \"28\", mugSerieId: \"1\", mugName: \"Cairo\"','2012-02-02 00:03:14'),
	(138,NULL,'Adding','mugCountryId: \"28\", mugSerieId: \"1\", mugName: \"Sharm El Sheikh\"','2012-02-02 00:03:14'),
	(139,NULL,'Adding','mugCountryId: \"29\", mugSerieId: \"1\", mugName: \"Hungary\"','2012-02-02 00:03:14'),
	(140,NULL,'Adding','mugCountryId: \"29\", mugSerieId: \"1\", mugName: \"Budapest\"','2012-02-02 00:03:14'),
	(141,NULL,'Adding','mugCountryId: \"33\", mugSerieId: \"1\", mugName: \"Osaka\"','2012-02-02 00:04:53'),
	(142,NULL,'Adding','mugCountryId: \"33\", mugSerieId: \"1\", mugName: \"Sapporo\"','2012-02-02 00:04:53'),
	(143,NULL,'Adding','mugCountryId: \"33\", mugSerieId: \"1\", mugName: \"Tokyo\"','2012-02-02 00:04:53'),
	(144,NULL,'Adding','mugCountryId: \"34\", mugSerieId: \"1\", mugName: \"Jordan\"','2012-02-02 00:04:53'),
	(145,NULL,'Adding','mugCountryId: \"35\", mugSerieId: \"1\", mugName: \"Kuwait\"','2012-02-02 00:04:53'),
	(146,NULL,'Adding','mugCountryId: \"36\", mugSerieId: \"1\", mugName: \"Lebanon\"','2012-02-02 00:04:53'),
	(147,NULL,'Adding','mugCountryId: \"37\", mugSerieId: \"1\", mugName: \"Kuala Lumpur\"','2012-02-02 00:04:53'),
	(148,NULL,'Adding','mugCountryId: \"37\", mugSerieId: \"1\", mugName: \"Malaysia\"','2012-02-02 00:04:53'),
	(149,NULL,'Adding','mugCountryId: \"37\", mugSerieId: \"1\", mugName: \"Penang\"','2012-02-02 00:04:53'),
	(150,NULL,'Adding','mugCountryId: \"37\", mugSerieId: \"1\", mugName: \"Sabah\"','2012-02-02 00:04:53'),
	(151,NULL,'Adding','mugCountryId: \"38\", mugSerieId: \"1\", mugName: \"Acapulco\"','2012-02-02 00:04:53'),
	(152,NULL,'Adding','mugCountryId: \"38\", mugSerieId: \"1\", mugName: \"Cancun\"','2012-02-02 00:04:53'),
	(153,NULL,'Adding','mugCountryId: \"38\", mugSerieId: \"1\", mugName: \"Chihuahua\"','2012-02-02 00:04:53'),
	(154,NULL,'Adding','mugCountryId: \"38\", mugSerieId: \"1\", mugName: \"Ciudad de Mexico\"','2012-02-02 00:04:53'),
	(155,NULL,'Adding','mugCountryId: \"38\", mugSerieId: \"1\", mugName: \"Culiacán\"','2012-02-02 00:04:53'),
	(156,NULL,'Adding','mugCountryId: \"38\", mugSerieId: \"1\", mugName: \"Guadalajara\"','2012-02-02 00:04:53'),
	(157,NULL,'Adding','mugCountryId: \"38\", mugSerieId: \"1\", mugName: \"Guanajuato\"','2012-02-02 00:04:53'),
	(158,NULL,'Adding','mugCountryId: \"38\", mugSerieId: \"1\", mugName: \"Los Cabos\"','2012-02-02 00:04:53'),
	(159,NULL,'Adding','mugCountryId: \"38\", mugSerieId: \"1\", mugName: \"Mexico\"','2012-02-02 00:04:53'),
	(160,NULL,'Adding','mugCountryId: \"38\", mugSerieId: \"1\", mugName: \"Monterrey\"','2012-02-02 00:04:53'),
	(161,NULL,'Adding','mugCountryId: \"38\", mugSerieId: \"1\", mugName: \"Playa del Carmen\"','2012-02-02 00:04:53'),
	(162,NULL,'Adding','mugCountryId: \"38\", mugSerieId: \"1\", mugName: \"Puerto Vallarta\"','2012-02-02 00:04:53'),
	(163,NULL,'Adding','mugCountryId: \"38\", mugSerieId: \"1\", mugName: \"Veracruz\"','2012-02-02 00:04:53'),
	(164,NULL,'Adding','mugCountryId: \"38\", mugSerieId: \"1\", mugName: \"Zacatecas\"','2012-02-02 00:04:53'),
	(165,NULL,'Adding','mugCountryId: \"39\", mugSerieId: \"1\", mugName: \"Amsterdam\"','2012-02-02 00:07:24'),
	(166,NULL,'Adding','mugCountryId: \"39\", mugSerieId: \"1\", mugName: \"The Netherlands\"','2012-02-02 00:07:24'),
	(167,NULL,'Adding','mugCountryId: \"40\", mugSerieId: \"1\", mugName: \"New Zealand\"','2012-02-02 00:07:24'),
	(168,NULL,'Adding','mugCountryId: \"40\", mugSerieId: \"1\", mugName: \"Auckland (no longer available since Dec.2010 // only as mini)\"','2012-02-02 00:07:24'),
	(169,NULL,'Adding','mugCountryId: \"40\", mugSerieId: \"1\", mugName: \"North Island (no longer available since Dec.2010 // only as mini)\"','2012-02-02 00:07:24'),
	(170,NULL,'Adding','mugCountryId: \"40\", mugSerieId: \"1\", mugName: \"South Island (no longer available since Dec.2010 // only as mini)\"','2012-02-02 00:07:24'),
	(171,NULL,'Adding','mugCountryId: \"43\", mugSerieId: \"1\", mugName: \"Lima\"','2012-02-02 00:07:24'),
	(172,NULL,'Adding','mugCountryId: \"43\", mugSerieId: \"1\", mugName: \"Peru\"','2012-02-02 00:07:24'),
	(173,NULL,'Adding','mugCountryId: \"45\", mugSerieId: \"1\", mugName: \"Gdansk\"','2012-02-02 00:07:24'),
	(174,NULL,'Adding','mugCountryId: \"45\", mugSerieId: \"1\", mugName: \"Krakow\"','2012-02-02 00:07:24'),
	(175,NULL,'Adding','mugCountryId: \"45\", mugSerieId: \"1\", mugName: \"Poznan\"','2012-02-02 00:07:24'),
	(176,NULL,'Adding','mugCountryId: \"45\", mugSerieId: \"1\", mugName: \"Warsaw\"','2012-02-02 00:07:24'),
	(177,NULL,'Adding','mugCountryId: \"45\", mugSerieId: \"1\", mugName: \"Wroclaw\"','2012-02-02 00:07:24'),
	(178,NULL,'Adding','mugCountryId: \"45\", mugSerieId: \"1\", mugName: \"Gdynia\"','2012-02-02 00:07:24'),
	(179,NULL,'Adding','mugCountryId: \"46\", mugSerieId: \"1\", mugName: \"Lisbon\"','2012-02-02 00:07:24'),
	(180,NULL,'Adding','mugCountryId: \"46\", mugSerieId: \"1\", mugName: \"Portugal\"','2012-02-02 00:07:24'),
	(181,NULL,'Adding','mugCountryId: \"47\", mugSerieId: \"1\", mugName: \"Puerto Rico\"','2012-02-02 00:07:24'),
	(182,NULL,'Adding','mugCountryId: \"48\", mugSerieId: \"1\", mugName: \"Qatar\"','2012-02-02 00:07:24'),
	(183,NULL,'Adding','mugCountryId: \"49\", mugSerieId: \"1\", mugName: \"Romania\"','2012-02-02 00:07:24'),
	(184,NULL,'Adding','mugCountryId: \"49\", mugSerieId: \"1\", mugName: \"Bucharest\"','2012-02-02 00:07:24'),
	(185,NULL,'Adding','mugCountryId: \"49\", mugSerieId: \"1\", mugName: \"Cluj-Napoca\"','2012-02-02 00:07:24'),
	(186,NULL,'Adding','mugCountryId: \"50\", mugSerieId: \"1\", mugName: \"Jeddah\"','2012-02-02 00:07:24'),
	(187,NULL,'Adding','mugCountryId: \"50\", mugSerieId: \"1\", mugName: \"Riyadh\"','2012-02-02 00:07:24'),
	(188,NULL,'Adding','mugCountryId: \"50\", mugSerieId: \"1\", mugName: \"Kingdom of Saudi Arabia\"','2012-02-02 00:07:24'),
	(189,NULL,'Adding','mugCountryId: \"52\", mugSerieId: \"1\", mugName: \"Korea\"','2012-02-02 00:07:24'),
	(190,NULL,'Adding','mugCountryId: \"52\", mugSerieId: \"1\", mugName: \"Seoul\"','2012-02-02 00:07:24'),
	(191,NULL,'Adding','mugCountryId: \"53\", mugSerieId: \"1\", mugName: \"Stockholm\"','2012-02-02 00:07:24'),
	(192,NULL,'Adding','mugCountryId: \"54\", mugSerieId: \"1\", mugName: \"Basel\"','2012-02-02 00:07:24'),
	(193,NULL,'Adding','mugCountryId: \"54\", mugSerieId: \"1\", mugName: \"Berne\"','2012-02-02 00:07:24'),
	(194,NULL,'Adding','mugCountryId: \"54\", mugSerieId: \"1\", mugName: \"Geneva\"','2012-02-02 00:07:24'),
	(195,NULL,'Adding','mugCountryId: \"54\", mugSerieId: \"1\", mugName: \"Lausanne\"','2012-02-02 00:07:24'),
	(196,NULL,'Adding','mugCountryId: \"54\", mugSerieId: \"1\", mugName: \"Lucerne\"','2012-02-02 00:07:24'),
	(197,NULL,'Adding','mugCountryId: \"54\", mugSerieId: \"1\", mugName: \"St. Gallen\"','2012-02-02 00:07:24'),
	(198,NULL,'Adding','mugCountryId: \"54\", mugSerieId: \"1\", mugName: \"Switzerland\"','2012-02-02 00:07:24'),
	(199,NULL,'Adding','mugCountryId: \"54\", mugSerieId: \"1\", mugName: \"Zurich\"','2012-02-02 00:07:24'),
	(200,NULL,'Adding','mugCountryId: \"55\", mugSerieId: \"1\", mugName: \"United Arab Emirates\"','2012-02-02 00:07:24'),
	(201,NULL,'Adding','mugCountryId: \"55\", mugSerieId: \"1\", mugName: \"Dubai\"','2012-02-02 00:07:24'),
	(202,NULL,'Adding','mugCountryId: \"55\", mugSerieId: \"1\", mugName: \"Abu Dhabi\"','2012-02-02 00:07:24'),
	(203,NULL,'Adding','mugCountryId: \"55\", mugSerieId: \"1\", mugName: \"Sharjah\"','2012-02-02 00:07:24'),
	(204,NULL,'Adding','mugCountryId: \"30\", mugSerieId: \"1\", mugName: \"Bali\"','2012-02-02 00:34:06'),
	(205,NULL,'Adding','mugCountryId: \"30\", mugSerieId: \"1\", mugName: \"Indonesia\"','2012-02-02 00:34:06'),
	(206,NULL,'Adding','mugCountryId: \"30\", mugSerieId: \"1\", mugName: \"Jakarta\"','2012-02-02 00:34:06'),
	(207,NULL,'Adding','mugCountryId: \"30\", mugSerieId: \"1\", mugName: \"Batam\"','2012-02-02 00:34:06'),
	(208,NULL,'Adding','mugCountryId: \"44\", mugSerieId: \"1\", mugName: \"Bacolod\"','2012-02-02 00:34:07'),
	(209,NULL,'Adding','mugCountryId: \"44\", mugSerieId: \"1\", mugName: \"Baguio\"','2012-02-02 00:34:07'),
	(210,NULL,'Adding','mugCountryId: \"44\", mugSerieId: \"1\", mugName: \"Batangas\"','2012-02-02 00:34:07'),
	(211,NULL,'Adding','mugCountryId: \"44\", mugSerieId: \"1\", mugName: \"Boracay\"','2012-02-02 00:34:07'),
	(212,NULL,'Adding','mugCountryId: \"44\", mugSerieId: \"1\", mugName: \"Cagayan De Oro\"','2012-02-02 00:34:07'),
	(213,NULL,'Adding','mugCountryId: \"44\", mugSerieId: \"1\", mugName: \"Cebu\"','2012-02-02 00:34:07'),
	(214,NULL,'Adding','mugCountryId: \"44\", mugSerieId: \"1\", mugName: \"Davao\"','2012-02-02 00:34:07'),
	(215,NULL,'Adding','mugCountryId: \"44\", mugSerieId: \"1\", mugName: \"Iloilo\"','2012-02-02 00:34:07'),
	(216,NULL,'Adding','mugCountryId: \"44\", mugSerieId: \"1\", mugName: \"Manila\"','2012-02-02 00:34:07'),
	(217,NULL,'Adding','mugCountryId: \"44\", mugSerieId: \"1\", mugName: \"Naga\"','2012-02-02 00:34:07'),
	(218,NULL,'Adding','mugCountryId: \"44\", mugSerieId: \"1\", mugName: \"Pampanga\"','2012-02-02 00:34:07'),
	(219,NULL,'Adding','mugCountryId: \"44\", mugSerieId: \"1\", mugName: \"Philippines\"','2012-02-02 00:34:07'),
	(220,NULL,'Adding','mugCountryId: \"44\", mugSerieId: \"1\", mugName: \"Tagaytay\"','2012-02-02 00:34:07'),
	(221,NULL,'Adding','mugCountryId: \"51\", mugSerieId: \"1\", mugName: \"Singapore (Merlion)\"','2012-02-02 00:34:07'),
	(222,NULL,'Adding','mugCountryId: \"51\", mugSerieId: \"1\", mugName: \"Singapore (Orchid)\"','2012-02-02 00:34:07');

/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mugs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mugs`;

CREATE TABLE `mugs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mugName` varchar(50) NOT NULL DEFAULT '',
  `mugCountryId` int(11) NOT NULL,
  `mugSerieId` int(11) NOT NULL,
  `mugNameMeaning` varchar(50) DEFAULT NULL,
  `mugImageName` varchar(255) DEFAULT NULL,
  `mugComment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `mugs` WRITE;
/*!40000 ALTER TABLE `mugs` DISABLE KEYS */;

INSERT INTO `mugs` (`id`, `mugName`, `mugCountryId`, `mugSerieId`, `mugNameMeaning`, `mugImageName`, `mugComment`)
VALUES
	(1,'Athens',1,1,'City',NULL,NULL),
	(2,'Barcelona',2,1,'City',NULL,NULL),
	(3,'Belgium',3,1,'Country',NULL,NULL),
	(4,'Bonn',4,1,'City',NULL,NULL),
	(5,'Boston',5,1,'City',NULL,NULL),
	(6,'Bulgaria',6,1,'Country',NULL,NULL),
	(7,'Cardiff',7,1,'City',NULL,NULL),
	(8,'Chiangmai',8,1,'City','Elephant Sanctuary',NULL),
	(9,'China',9,1,'Country',NULL,NULL),
	(10,'Crete',1,1,'Island',NULL,NULL),
	(11,'Cyprus',10,1,'Country',NULL,NULL),
	(12,'France',11,1,'Country',NULL,NULL),
	(13,'Greece',1,1,'Country',NULL,NULL),
	(14,'Hamburg',4,1,'City',NULL,NULL),
	(15,'HongKong',9,1,'Region',NULL,NULL),
	(16,'Houston',5,1,'City',NULL,NULL),
	(17,'Istanbul',12,1,'City',NULL,NULL),
	(18,'Köln',4,1,'City',NULL,NULL),
	(19,'London',13,1,'City',NULL,NULL),
	(20,'Macau',9,1,'Region',NULL,NULL),
	(21,'Madrid',2,1,'City',NULL,NULL),
	(22,'Marseille',11,1,'City','Notre-Dame de la Garde',NULL),
	(23,'Moscow',14,1,'City',NULL,NULL),
	(24,'München',4,1,'City',NULL,NULL),
	(25,'Mykonos',1,1,'Island',NULL,NULL),
	(26,'New York',5,1,'City',NULL,NULL),
	(27,'Nürnberg',4,1,'City',NULL,NULL),
	(28,'Pike Place Market',5,1,'Sightseeing',NULL,NULL),
	(29,'Scotland',15,1,'Country',NULL,NULL),
	(30,'Seattle',5,1,'City',NULL,NULL),
	(31,'Taipei',16,1,'City',NULL,NULL),
	(32,'Taiwan',16,1,'Country',NULL,NULL),
	(33,'Thailand',8,1,'Country',NULL,NULL),
	(34,'Thessaloniki',1,1,'City',NULL,NULL),
	(35,'Wales',7,1,'Country',NULL,NULL),
	(36,'Wiesbaden',4,1,'City',NULL,NULL),
	(37,'Austria',17,1,'Country',NULL,NULL),
	(38,'Vienna',17,1,'City',NULL,NULL),
	(39,'Sofia',6,1,'City',NULL,NULL),
	(40,'Antwerp',3,1,NULL,NULL,NULL),
	(41,'Brussels',3,1,NULL,NULL,NULL),
	(42,'England (William Shakespeare)',13,1,NULL,NULL,NULL),
	(43,'England (Coat of Arms Seal)',13,1,NULL,NULL,NULL),
	(44,'Paris',11,1,NULL,NULL,NULL),
	(45,'Lyon',11,1,NULL,NULL,NULL),
	(46,'Corfu',1,1,NULL,NULL,NULL),
	(47,'Rhodes',1,1,NULL,NULL,NULL),
	(48,'Edinburgh',15,1,NULL,NULL,NULL),
	(49,'Seville',2,1,NULL,NULL,NULL),
	(50,'Spain',2,1,NULL,NULL,NULL),
	(51,'Valencia',2,1,NULL,NULL,NULL),
	(52,'Kaohsiung',16,1,NULL,NULL,NULL),
	(53,'Taichung',16,1,NULL,NULL,NULL),
	(54,'Tainan',16,1,NULL,NULL,NULL),
	(55,'Bangkok',8,1,NULL,NULL,NULL),
	(56,'Muan Jai',8,1,NULL,NULL,NULL),
	(57,'Pattaya',8,1,NULL,NULL,NULL),
	(58,'Phuket',8,1,NULL,NULL,NULL),
	(59,'Samui',8,1,NULL,NULL,NULL),
	(60,'Ankara',12,1,NULL,NULL,NULL),
	(61,'Cyprus',12,1,NULL,NULL,NULL),
	(62,'Izmir',12,1,NULL,NULL,NULL),
	(63,'Turkey',12,1,NULL,NULL,NULL),
	(64,'Beijing',9,1,NULL,NULL,NULL),
	(65,'Changsha',9,1,NULL,NULL,NULL),
	(66,'Chengdu',9,1,NULL,NULL,NULL),
	(67,'Chongqing',9,1,NULL,NULL,NULL),
	(68,'Dalian',9,1,NULL,NULL,NULL),
	(69,'Dongguan',9,1,NULL,NULL,NULL),
	(70,'Foshan',9,1,NULL,NULL,NULL),
	(71,'Fuzhou',9,1,NULL,NULL,NULL),
	(72,'Guangzhou',9,1,NULL,NULL,NULL),
	(73,'Harbin',9,1,NULL,NULL,NULL),
	(74,'Hefei',9,1,NULL,NULL,NULL),
	(150,'Argentina',18,1,NULL,NULL,NULL),
	(76,'Jinan',9,1,NULL,NULL,NULL),
	(77,'Kunming',9,1,NULL,NULL,NULL),
	(78,'Qingdao',9,1,NULL,NULL,NULL),
	(79,'Shanghai',9,1,NULL,NULL,NULL),
	(80,'Shenyang',9,1,NULL,NULL,NULL),
	(81,'Shenzhen',9,1,NULL,NULL,NULL),
	(82,'Shijiazhuang',9,1,NULL,NULL,NULL),
	(83,'Tianjin',9,1,NULL,NULL,NULL),
	(84,'Wuhan',9,1,NULL,NULL,NULL),
	(85,'Xiamen',9,1,NULL,NULL,NULL),
	(86,'Xi\'an',9,1,NULL,NULL,NULL),
	(87,'Zhengzhou',9,1,NULL,NULL,NULL),
	(88,'Aachen',4,1,NULL,NULL,NULL),
	(89,'Berlin',4,1,NULL,NULL,NULL),
	(90,'Bielefeld',4,1,NULL,NULL,NULL),
	(91,'Braunschweig',4,1,NULL,NULL,NULL),
	(92,'Bremen',4,1,NULL,NULL,NULL),
	(93,'Düsseldorf',4,1,NULL,NULL,NULL),
	(94,'Dresden',4,1,NULL,NULL,NULL),
	(95,'Frankfurt (am Main)',4,1,NULL,NULL,NULL),
	(96,'Freiburg',4,1,NULL,NULL,NULL),
	(97,'Germany',4,1,NULL,NULL,NULL),
	(98,'Hannover',4,1,NULL,NULL,NULL),
	(99,'Heidelberg',4,1,NULL,NULL,NULL),
	(100,'Kiel',4,1,NULL,NULL,NULL),
	(101,'Leipzig',4,1,NULL,NULL,NULL),
	(102,'Mannheim',4,1,NULL,NULL,NULL),
	(103,'Münster',4,1,NULL,NULL,NULL),
	(104,'Oktoberfest',4,1,NULL,NULL,NULL),
	(105,'Potsdam',4,1,NULL,NULL,NULL),
	(106,'Ruhrgebiet',4,1,NULL,NULL,NULL),
	(107,'Stuttgart',4,1,NULL,NULL,NULL),
	(108,'Alaska',5,1,NULL,NULL,NULL),
	(109,'Arizona',5,1,NULL,NULL,NULL),
	(110,'Atlanta',5,1,NULL,NULL,NULL),
	(111,'Austin',5,1,NULL,NULL,NULL),
	(112,'California',5,1,NULL,NULL,NULL),
	(113,'Charlotte',5,1,NULL,NULL,NULL),
	(114,'Chicago',5,1,NULL,NULL,NULL),
	(115,'Cleveland',5,1,NULL,NULL,NULL),
	(116,'Colorado',5,1,NULL,NULL,NULL),
	(117,'Dallas',5,1,NULL,NULL,NULL),
	(118,'Denver',5,1,NULL,NULL,NULL),
	(119,'Detroit',5,1,NULL,NULL,NULL),
	(120,'Florida',5,1,NULL,NULL,NULL),
	(121,'Fort Worth',5,1,NULL,NULL,NULL),
	(122,'Hamptons',5,1,NULL,NULL,NULL),
	(123,'Hawaii',5,1,NULL,NULL,NULL),
	(124,'Indianapolis',5,1,NULL,NULL,NULL),
	(125,'Jacksonville',5,1,NULL,NULL,NULL),
	(126,'Las Vegas',5,1,NULL,NULL,NULL),
	(127,'Los Angeles',5,1,NULL,NULL,NULL),
	(128,'Memphis',5,1,NULL,NULL,NULL),
	(129,'Miami',5,1,NULL,NULL,NULL),
	(130,'Nashville',5,1,NULL,NULL,NULL),
	(131,'New Mexico',5,1,NULL,NULL,NULL),
	(132,'New Orleans',5,1,NULL,NULL,NULL),
	(133,'North Carolina',5,1,NULL,NULL,NULL),
	(134,'Ohio',5,1,NULL,NULL,NULL),
	(135,'Orange County',5,1,NULL,NULL,NULL),
	(136,'Orlando',5,1,NULL,NULL,NULL),
	(137,'Philadelphia',5,1,NULL,NULL,NULL),
	(138,'Phoenix',5,1,NULL,NULL,NULL),
	(139,'Pittsburgh',5,1,NULL,NULL,NULL),
	(140,'Portland',5,1,NULL,NULL,NULL),
	(141,'Sacramento',5,1,NULL,NULL,NULL),
	(142,'San Antonio',5,1,NULL,NULL,NULL),
	(143,'San Diego',5,1,NULL,NULL,NULL),
	(144,'San Francisco',5,1,NULL,NULL,NULL),
	(145,'St. Louis',5,1,NULL,NULL,NULL),
	(146,'Tampa',5,1,NULL,NULL,NULL),
	(147,'Twin Cities',5,1,NULL,NULL,NULL),
	(148,'Waikiki',5,1,NULL,NULL,NULL),
	(149,'Washington D.C.',5,1,NULL,NULL,NULL),
	(151,'Buenos Aires',18,1,NULL,NULL,NULL),
	(152,'Aruba',19,1,NULL,NULL,NULL),
	(153,'Australia',20,1,NULL,NULL,NULL),
	(154,'Brisbane',20,1,NULL,NULL,NULL),
	(155,'Gold Coast',20,1,NULL,NULL,NULL),
	(156,'Melbourne',20,1,NULL,NULL,NULL),
	(157,'Sydney',20,1,NULL,NULL,NULL),
	(158,'Bahamas',21,1,NULL,NULL,NULL),
	(159,'Bahrain',22,1,NULL,NULL,NULL),
	(160,'Rio de Janeiro',23,1,NULL,NULL,NULL),
	(161,'Banff',24,1,NULL,NULL,NULL),
	(162,'Calgary',24,1,NULL,NULL,NULL),
	(163,'Canada',24,1,NULL,NULL,NULL),
	(164,'Edmonton',24,1,NULL,NULL,NULL),
	(165,'Montréal',24,1,NULL,NULL,NULL),
	(166,'Niagara Falls',24,1,NULL,NULL,NULL),
	(167,'Toronto',24,1,NULL,NULL,NULL),
	(168,'Vancouver',24,1,NULL,NULL,NULL),
	(169,'Vancouver Island',24,1,NULL,NULL,NULL),
	(170,'Whistler',24,1,NULL,NULL,NULL),
	(171,'Chile',25,1,NULL,NULL,NULL),
	(172,'Prague',26,1,NULL,NULL,NULL),
	(173,'Czech Republic',26,1,NULL,NULL,NULL),
	(174,'Copenhagen',27,1,NULL,NULL,NULL),
	(175,'Egypt',28,1,NULL,NULL,NULL),
	(176,'Cairo',28,1,NULL,NULL,NULL),
	(177,'Sharm El Sheikh',28,1,NULL,NULL,NULL),
	(178,'Hungary',29,1,NULL,NULL,NULL),
	(179,'Budapest',29,1,NULL,NULL,NULL),
	(180,'Osaka',33,1,NULL,NULL,NULL),
	(181,'Sapporo',33,1,NULL,NULL,NULL),
	(182,'Tokyo',33,1,NULL,NULL,NULL),
	(183,'Jordan',34,1,NULL,NULL,NULL),
	(184,'Kuwait',35,1,NULL,NULL,NULL),
	(185,'Lebanon',36,1,NULL,NULL,NULL),
	(186,'Kuala Lumpur',37,1,NULL,NULL,NULL),
	(187,'Malaysia',37,1,NULL,NULL,NULL),
	(188,'Penang',37,1,NULL,NULL,NULL),
	(189,'Sabah',37,1,NULL,NULL,NULL),
	(190,'Acapulco',38,1,NULL,NULL,NULL),
	(191,'Cancun',38,1,NULL,NULL,NULL),
	(192,'Chihuahua',38,1,NULL,NULL,NULL),
	(193,'Ciudad de Mexico',38,1,NULL,NULL,NULL),
	(194,'Culiacán',38,1,NULL,NULL,NULL),
	(195,'Guadalajara',38,1,NULL,NULL,NULL),
	(196,'Guanajuato',38,1,NULL,NULL,NULL),
	(197,'Los Cabos',38,1,NULL,NULL,NULL),
	(198,'Mexico',38,1,NULL,NULL,NULL),
	(199,'Monterrey',38,1,NULL,NULL,NULL),
	(200,'Playa del Carmen',38,1,NULL,NULL,NULL),
	(201,'Puerto Vallarta',38,1,NULL,NULL,NULL),
	(202,'Veracruz',38,1,NULL,NULL,NULL),
	(203,'Zacatecas',38,1,NULL,NULL,NULL),
	(204,'Amsterdam',39,1,NULL,NULL,NULL),
	(205,'The Netherlands',39,1,NULL,NULL,NULL),
	(206,'New Zealand',40,1,NULL,NULL,NULL),
	(207,'Auckland',40,1,NULL,NULL,'No longer available since Dec. 2010'),
	(208,'North Island',40,1,NULL,NULL,'No longer available since Dec. 2010'),
	(209,'South Island',40,1,NULL,NULL,'No longer available since Dec. 2010'),
	(210,'Lima',43,1,NULL,NULL,NULL),
	(211,'Peru',43,1,NULL,NULL,NULL),
	(212,'Gdansk',45,1,NULL,NULL,NULL),
	(213,'Krakow',45,1,NULL,NULL,NULL),
	(214,'Poznan',45,1,NULL,NULL,NULL),
	(215,'Warsaw',45,1,NULL,NULL,NULL),
	(216,'Wroclaw',45,1,NULL,NULL,NULL),
	(217,'Gdynia',45,1,NULL,NULL,NULL),
	(218,'Lisbon',46,1,NULL,NULL,NULL),
	(219,'Portugal',46,1,NULL,NULL,NULL),
	(220,'Puerto Rico',47,1,NULL,NULL,NULL),
	(221,'Qatar',48,1,NULL,NULL,NULL),
	(222,'Romania',49,1,NULL,NULL,NULL),
	(223,'Bucharest',49,1,NULL,NULL,NULL),
	(224,'Cluj-Napoca',49,1,NULL,NULL,NULL),
	(225,'Jeddah',50,1,NULL,NULL,NULL),
	(226,'Riyadh',50,1,NULL,NULL,NULL),
	(227,'Kingdom of Saudi Arabia',50,1,NULL,NULL,NULL),
	(228,'Korea',52,1,NULL,NULL,NULL),
	(229,'Seoul',52,1,NULL,NULL,NULL),
	(230,'Stockholm',53,1,NULL,NULL,NULL),
	(231,'Basel',54,1,NULL,NULL,NULL),
	(232,'Berne',54,1,NULL,NULL,NULL),
	(233,'Geneva',54,1,NULL,NULL,NULL),
	(234,'Lausanne',54,1,NULL,NULL,NULL),
	(235,'Lucerne',54,1,NULL,NULL,NULL),
	(236,'St. Gallen',54,1,NULL,NULL,NULL),
	(237,'Switzerland',54,1,NULL,NULL,NULL),
	(238,'Zurich',54,1,NULL,NULL,NULL),
	(239,'United Arab Emirates',55,1,NULL,NULL,NULL),
	(240,'Dubai',55,1,NULL,NULL,NULL),
	(241,'Abu Dhabi',55,1,NULL,NULL,NULL),
	(242,'Sharjah',55,1,NULL,NULL,NULL),
	(243,'Bali',30,1,NULL,NULL,NULL),
	(244,'Indonesia',30,1,NULL,NULL,NULL),
	(245,'Jakarta',30,1,NULL,NULL,NULL),
	(246,'Batam',30,1,NULL,NULL,NULL),
	(247,'Bacolod',44,1,NULL,NULL,NULL),
	(248,'Baguio',44,1,NULL,NULL,NULL),
	(249,'Batangas',44,1,NULL,NULL,NULL),
	(250,'Boracay',44,1,NULL,NULL,NULL),
	(251,'Cagayan De Oro',44,1,NULL,NULL,NULL),
	(252,'Cebu',44,1,NULL,NULL,NULL),
	(253,'Davao',44,1,NULL,NULL,NULL),
	(254,'Iloilo',44,1,NULL,NULL,NULL),
	(255,'Manila',44,1,NULL,NULL,NULL),
	(256,'Naga',44,1,NULL,NULL,NULL),
	(257,'Pampanga',44,1,NULL,NULL,NULL),
	(258,'Philippines',44,1,NULL,NULL,NULL),
	(259,'Tagaytay',44,1,NULL,NULL,NULL),
	(260,'Singapore (Merlion)',51,1,NULL,NULL,NULL),
	(261,'Singapore (Orchid)',51,1,NULL,NULL,NULL);

/*!40000 ALTER TABLE `mugs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mugs2users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mugs2users`;

CREATE TABLE `mugs2users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mug_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `added_moment` datetime DEFAULT NULL,
  `added_comment` varchar(255) DEFAULT NULL,
  `price_paid` decimal(11,2) DEFAULT NULL,
  `status` enum('Own','Waiting','WantIt','Trade') NOT NULL DEFAULT 'Own',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `mugs2users` WRITE;
/*!40000 ALTER TABLE `mugs2users` DISABLE KEYS */;

INSERT INTO `mugs2users` (`id`, `mug_id`, `user_id`, `added_moment`, `added_comment`, `price_paid`, `status`)
VALUES
	(1,1,1,'2012-01-26 00:00:00','Привез папа из Греции',NULL,'Own'),
	(2,2,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(3,3,1,'2012-01-10 00:00:00','Привезла Ольга Ненахова',NULL,'Own'),
	(4,4,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(5,5,1,'2012-01-26 00:00:00','Привезла Елена Бабакова из США',NULL,'Own'),
	(6,6,1,'2012-01-26 00:00:00','Привезла Ирина Дрождь',NULL,'Own'),
	(7,7,1,'2012-01-26 00:00:00','Прислал по почте Harrison Lee',NULL,'Own'),
	(8,8,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(9,9,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(10,10,1,'2012-01-16 00:00:00','Купил сам на Кипре, в Starbucks Paphos',9.35,'Own'),
	(11,11,1,'2012-01-26 00:00:00','Купил сам на Кипре, в Starbucks Paphos',NULL,'Own'),
	(12,12,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(13,13,1,'2012-01-16 00:00:00','Купил сам на Кипре, в Starbucks Paphos',9.35,'Own'),
	(14,14,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(15,15,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(16,16,1,'2012-01-26 00:00:00','Привезла Анна Степанова из США',NULL,'Own'),
	(17,17,1,'2012-01-26 00:00:00','Привезла Ольга Котина',NULL,'Own'),
	(18,18,1,'2012-01-10 00:00:00','Привезла Ольга Ненахова',NULL,'Own'),
	(19,19,1,'2012-01-26 00:00:00','Привезла Татьяна Петровна из Великобритании',NULL,'Own'),
	(20,20,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(21,21,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(22,22,1,'2012-01-10 00:00:00','Привез Андрей Дугин из Франции',NULL,'Own'),
	(23,23,1,'2012-01-26 00:00:00','Купил сам в Москве',NULL,'Own'),
	(24,24,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(25,25,1,'2012-01-16 00:00:00','Купил сам на Кипре, в Starbucks Paphos',9.35,'Own'),
	(26,26,1,'2012-01-26 00:00:00','Купил сам в США, на Манхэттене',NULL,'Own'),
	(27,27,1,'2012-01-26 00:00:00','Привезла Юлия Немодрук из Германии',NULL,'Own'),
	(28,28,1,'2012-01-26 00:00:00','Прислал по почте Harrison Lee из США',NULL,'Own'),
	(29,29,1,'2012-01-26 00:00:00','Привезла Татьяна Петровна из Великобритании',NULL,'Own'),
	(30,30,1,'2012-01-26 00:00:00','Прислал по почте Harrison Lee из США',NULL,'Own'),
	(31,31,1,'2012-01-26 00:00:00','Привез Harrison Lee',NULL,'Own'),
	(32,32,1,'2012-01-26 00:00:00','Привез Harrison Lee',NULL,'Own'),
	(33,33,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(34,34,1,'2012-01-26 00:00:00','Привез папа из Греции',NULL,'Own'),
	(35,35,1,'2012-01-26 00:00:00','Прислал по почте Harrison Lee',NULL,'Own'),
	(36,36,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(37,39,1,NULL,'Хозяин Старбакса обещал привезти 15 февраля',NULL,'Waiting');

/*!40000 ALTER TABLE `mugs2users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table series
# ------------------------------------------------------------

DROP TABLE IF EXISTS `series`;

CREATE TABLE `series` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `serieName` varchar(50) NOT NULL DEFAULT '',
  `serieAcquireAlias` varchar(50) NOT NULL DEFAULT '',
  `serieDesc` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;

INSERT INTO `series` (`id`, `serieName`, `serieAcquireAlias`, `serieDesc`)
VALUES
	(1,'2008 Global Icon Series','New \'08 Global Icon Series','These mugs are replacing the original City Mugs all over the World. Started in June 2008 in China (for the Olympic Games), now also spread to other countries all over the world.'),
	(2,'Collectors Series City Mugs','Old \'94 City Mug Series1','The majority of all mugs still come in the style of the first series from 1994. Many different motives and colours, but they are easy to identify.');

/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tagName` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table tags2mugs2users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags2mugs2users`;

CREATE TABLE `tags2mugs2users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tagId` int(11) NOT NULL,
  `mug2userId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userLogin` varchar(50) NOT NULL DEFAULT '',
  `userPassword` varchar(50) NOT NULL DEFAULT '',
  `userName` varchar(50) NOT NULL DEFAULT '',
  `userCountryId` int(11) NOT NULL,
  `userRole` varchar(50) NOT NULL,
  `userCreated` datetime NOT NULL,
  `userTouched` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `userLogin`, `userPassword`, `userName`, `userCountryId`, `userRole`, `userCreated`, `userTouched`)
VALUES
	(1,'SantaFox','LbvrfKbc','Dmitry Blokhin',14,'admin','2012-01-20 00:00:00','2012-01-26 17:09:31'),
	(2,'HL','','Harrison Lee',5,'user','2012-01-25 00:00:00','2012-01-25 18:12:10');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
