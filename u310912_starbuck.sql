# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.9)
# Database: u310912_starbuck
# Generation Time: 2012-02-28 16:32:17 +0000
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
  `aliasReason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `aliases` WRITE;
/*!40000 ALTER TABLE `aliases` DISABLE KEYS */;

INSERT INTO `aliases` (`id`, `aliasCountryId`, `aliasSerieId`, `aliasMugId`, `aliasName`, `aliasReason`)
VALUES
	(1,5,NULL,NULL,'United States of America',NULL),
	(2,21,NULL,NULL,'The Bahamas',NULL),
	(3,26,NULL,NULL,'Czech Republic',NULL),
	(4,39,NULL,NULL,'The Netherlands',NULL),
	(5,55,NULL,NULL,'United Arab Emirates',NULL),
	(6,NULL,1,NULL,'New \'08 Global Icon Series',NULL),
	(7,NULL,2,NULL,'Old \'94 City Mug Series',NULL),
	(8,56,NULL,NULL,'Wales',NULL),
	(9,56,NULL,NULL,'England',NULL),
	(10,56,NULL,NULL,'Ireland',NULL),
	(11,56,NULL,NULL,'Scotland',NULL),
	(12,NULL,NULL,15,'HongKong',NULL);

/*!40000 ALTER TABLE `aliases` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table countries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `countryName` varchar(50) NOT NULL DEFAULT '',
  `countryDesc` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;

INSERT INTO `countries` (`id`, `countryName`, `countryDesc`)
VALUES
	(1,'Greece','Starbucks celebrated the opening of its first store in Greece in September 2002, with the first store at Korai Street. Greece, a country with a strong coffee tradition welcomed Starbucks with enthusiasm and within a period of five years Starbucks is offering to more and more customers the finest coffee in 56 locations in Athens, Salonica, Volos, Mykonos, Patras, Corfu, Rhodes, Chania and Heraklio of Crete.'),
	(2,'Spain','In October 2001 Starbucks initiated plans to open stores in Spain, forming a joint venture company with Grupo Vips, a company with 25 years of experience in the Spanish restaurant and retail sector.\n\nThe two companies shared common culture and company values, both focusing on a commitment to the highest quality product for their clients and a diverse and respectful work environment for their partners.\n\nBy April 2002 Starbucks had successfully entered the Spanish market with the opening of two stores in Madrid. Shortly after, two new stores were opened in Barcelona. Starbucks, thanks to its loyal customers, has grown tremendously; there are currently 75 stores in Spain located in Madrid, Barcelona, Valencia and Sevilla.'),
	(3,'Belgium',NULL),
	(4,'Germany',NULL),
	(5,'USA',NULL),
	(6,'Bulgaria','In 2008, Starbucks successfully entered the Bulgarian market through a joint venture with the Marinopoulos Group. The two companies share a common culture, focusing on a great commitment to customised coffee, similar company values and a mutual respect for people and the environment. Already they operate stores in Greece, Cyprus, Romania, Switzerland, and Austria.'),
	(8,'Thailand',NULL),
	(9,'China',NULL),
	(10,'Cyprus',NULL),
	(11,'France',NULL),
	(12,'Turkey','2002 yılından beri pek çok uluslararası markayı Türkiye\'ye getiren Shaya dünyaca ünlü markalar ile Türk tüketicisine hizmet vermeye devam ediyor.\nShaya\'nın Türkiye\'de; Gıda, Hazır Giyim, Güzellik ve Bakım perakendeciliği alanlarında 11 markası ve bu markaları sunduğu 200\'ü aşkın mağazası bulunmaktadır.\n\nStarbucks Coffee, Topshop, Evans, Dorothy Perkins, The Body Shop, Peacocks, Claire\'s, Debenhams, Miss Selfridge, Topman, Le Pain Quotidien, Next gibi dünyaca ünlü markalar Türkiye\'de Shaya A.Ş. tarafından temsil edilmektedir.\n\nStarbucks Coffee tüm dünyada olduğu gibi Türkiye\'de de bayilik sistemiyle çalışmamaktadır. Tüm mağazalar Shaya merkez yönetimi tarafından açılmakta, işletilmekte ve denetlenmektedir.\n\nhttp://www.shaya.com.tr'),
	(14,'Russia',NULL),
	(16,'Taiwan',NULL),
	(17,'Austria','Starbucks Coffee Austria GmbH ist für den Aufbau und das Betreiben von Starbucks Coffeehouses in Österreich zuständig. Operativ geführt wird das Geschäft von der Firma Starbucks Coffee Austria GmbH.\n\nStarbucks Coffee Österreich eröffnete im Dezember 2001 das erste Starbucks Coffeehouse in Wien und betreibt aktuell elf Coffeehouses in Wien.'),
	(18,'Argentina',NULL),
	(19,'Aruba',NULL),
	(20,'Australia',NULL),
	(21,'Bahamas',NULL),
	(22,'Bahrain',NULL),
	(23,'Brazil',NULL),
	(24,'Canada',NULL),
	(25,'Chile',NULL),
	(26,'Czech',NULL),
	(27,'Denmark',NULL),
	(28,'Egypt',NULL),
	(29,'Hungary',NULL),
	(30,'Indonesia',NULL),
	(32,'Israel',NULL),
	(33,'Japan',NULL),
	(34,'Jordan',NULL),
	(35,'Kuwait',NULL),
	(36,'Lebanon',NULL),
	(37,'Malaysia',NULL),
	(38,'Mexico',NULL),
	(39,'Netherlands',NULL),
	(40,'New Zealand',NULL),
	(41,'Northern Ireland',NULL),
	(42,'Oman',NULL),
	(43,'Peru',NULL),
	(44,'Philippines',NULL),
	(45,'Poland',NULL),
	(46,'Portugal',NULL),
	(47,'Puerto Rico',NULL),
	(48,'Qatar',NULL),
	(49,'Romania',NULL),
	(50,'Saudi Arabia',NULL),
	(51,'Singapore',NULL),
	(52,'South Korea',NULL),
	(53,'Sweden',NULL),
	(54,'Switzerland',NULL),
	(55,'UAE',NULL),
	(56,'United Kingdom',NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
	(222,NULL,'Adding','mugCountryId: \"51\", mugSerieId: \"1\", mugName: \"Singapore (Orchid)\"','2012-02-02 00:34:07'),
	(223,NULL,'Adding','mugCountryId: \"56\", mugSerieId: \"1\", mugName: \"Ireland\"','2012-02-04 20:47:35'),
	(224,NULL,'Adding','mugCountryId: \"56\", mugSerieId: \"1\", mugName: \"Dublin\"','2012-02-04 20:47:35'),
	(225,NULL,'Adding','mugCountryId: \"41\", mugSerieId: \"1\", mugName: \"Belfast\"','2012-02-04 20:47:35'),
	(226,NULL,'Adding','mugCountryId: \"41\", mugSerieId: \"1\", mugName: \"Northern Ireland\"','2012-02-04 20:47:35');

/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mugs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mugs`;

CREATE TABLE `mugs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mugCountryId` int(11) NOT NULL,
  `mugSerieId` int(11) NOT NULL,
  `mugName` varchar(50) NOT NULL,
  `mugNameMeaning` varchar(50) DEFAULT NULL,
  `mugImageName` varchar(255) DEFAULT NULL,
  `mugComment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mugName` (`mugName`,`mugCountryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `mugs` WRITE;
/*!40000 ALTER TABLE `mugs` DISABLE KEYS */;

INSERT INTO `mugs` (`id`, `mugCountryId`, `mugSerieId`, `mugName`, `mugNameMeaning`, `mugImageName`, `mugComment`)
VALUES
	(1,1,1,'Athens','City',NULL,NULL),
	(2,2,1,'Barcelona','City',NULL,NULL),
	(3,3,1,'Belgium','Country',NULL,NULL),
	(4,4,1,'Bonn','City',NULL,NULL),
	(5,5,1,'Boston','City',NULL,NULL),
	(6,6,1,'Bulgaria','Country',NULL,NULL),
	(7,56,1,'Cardiff','City',NULL,NULL),
	(8,8,1,'Chiangmai','City','Elephant Sanctuary',NULL),
	(9,9,1,'China','Country',NULL,NULL),
	(10,1,1,'Crete','Island',NULL,NULL),
	(11,10,1,'Cyprus','Country',NULL,NULL),
	(12,11,1,'France','Country',NULL,NULL),
	(13,1,1,'Greece','Country',NULL,NULL),
	(14,4,1,'Hamburg','City',NULL,NULL),
	(15,9,1,'Hong Kong','Region',NULL,NULL),
	(16,5,1,'Houston','City',NULL,NULL),
	(17,12,1,'Istanbul','City',NULL,NULL),
	(18,4,1,'Köln','City',NULL,NULL),
	(19,56,1,'London','City',NULL,NULL),
	(20,9,1,'Macau','Region',NULL,NULL),
	(21,2,1,'Madrid','City',NULL,NULL),
	(22,11,1,'Marseille','City','Notre-Dame de la Garde',NULL),
	(23,14,1,'Moscow','City',NULL,NULL),
	(24,4,1,'München','City',NULL,NULL),
	(25,1,1,'Mykonos','Island',NULL,NULL),
	(26,5,1,'New York','City',NULL,NULL),
	(27,4,1,'Nürnberg','City',NULL,NULL),
	(28,5,1,'Pike Place Market','Sightseeing',NULL,NULL),
	(29,56,1,'Scotland','Country',NULL,NULL),
	(30,5,1,'Seattle','City',NULL,NULL),
	(31,16,1,'Taipei','City',NULL,NULL),
	(32,16,1,'Taiwan','Country',NULL,NULL),
	(33,8,1,'Thailand','Country',NULL,NULL),
	(34,1,1,'Thessaloniki','City',NULL,NULL),
	(35,56,1,'Wales','Country',NULL,NULL),
	(36,4,1,'Wiesbaden','City',NULL,NULL),
	(37,17,1,'Austria','Country',NULL,NULL),
	(38,17,1,'Vienna','City',NULL,NULL),
	(39,6,1,'Sofia','City',NULL,NULL),
	(40,3,1,'Antwerp','City',NULL,NULL),
	(41,3,1,'Brussels','City',NULL,NULL),
	(42,56,1,'England (William Shakespeare)',NULL,NULL,NULL),
	(43,56,1,'England (Coat of Arms Seal)',NULL,NULL,NULL),
	(44,11,1,'Paris','City',NULL,NULL),
	(45,11,1,'Lyon','City',NULL,NULL),
	(46,1,1,'Corfu',NULL,NULL,NULL),
	(47,1,1,'Rhodes','Island',NULL,NULL),
	(48,56,1,'Edinburgh','City',NULL,NULL),
	(49,2,1,'Seville','City',NULL,NULL),
	(50,2,1,'Spain','Country',NULL,NULL),
	(51,2,1,'Valencia',NULL,NULL,NULL),
	(52,16,1,'Kaohsiung',NULL,NULL,NULL),
	(53,16,1,'Taichung',NULL,NULL,NULL),
	(54,16,1,'Tainan',NULL,NULL,NULL),
	(55,8,1,'Bangkok',NULL,NULL,NULL),
	(56,8,1,'Muan Jai',NULL,NULL,NULL),
	(57,8,1,'Pattaya',NULL,NULL,NULL),
	(58,8,1,'Phuket',NULL,NULL,NULL),
	(59,8,1,'Samui',NULL,NULL,NULL),
	(60,12,1,'Ankara','City',NULL,NULL),
	(62,12,1,'Izmir',NULL,NULL,NULL),
	(63,12,1,'Turkey','Country',NULL,NULL),
	(64,9,1,'Beijing',NULL,NULL,NULL),
	(65,9,1,'Changsha',NULL,NULL,NULL),
	(66,9,1,'Chengdu',NULL,NULL,NULL),
	(67,9,1,'Chongqing',NULL,NULL,NULL),
	(68,9,1,'Dalian',NULL,NULL,NULL),
	(69,9,1,'Dongguan',NULL,NULL,NULL),
	(70,9,1,'Foshan',NULL,NULL,NULL),
	(71,9,1,'Fuzhou',NULL,NULL,NULL),
	(72,9,1,'Guangzhou',NULL,NULL,NULL),
	(73,9,1,'Harbin',NULL,NULL,NULL),
	(74,9,1,'Hefei',NULL,NULL,NULL),
	(76,9,1,'Jinan',NULL,NULL,NULL),
	(77,9,1,'Kunming',NULL,NULL,NULL),
	(78,9,1,'Qingdao',NULL,NULL,NULL),
	(79,9,1,'Shanghai',NULL,NULL,NULL),
	(80,9,1,'Shenyang',NULL,NULL,NULL),
	(81,9,1,'Shenzhen',NULL,NULL,NULL),
	(82,9,1,'Shijiazhuang',NULL,NULL,NULL),
	(83,9,1,'Tianjin',NULL,NULL,NULL),
	(84,9,1,'Wuhan',NULL,NULL,NULL),
	(85,9,1,'Xiamen',NULL,NULL,NULL),
	(86,9,1,'Xi\'an',NULL,NULL,NULL),
	(87,9,1,'Zhengzhou',NULL,NULL,NULL),
	(88,4,1,'Aachen','City',NULL,NULL),
	(89,4,1,'Berlin','City',NULL,NULL),
	(90,4,1,'Bielefeld',NULL,NULL,NULL),
	(91,4,1,'Braunschweig',NULL,NULL,NULL),
	(92,4,1,'Bremen','City',NULL,NULL),
	(93,4,1,'Düsseldorf','City',NULL,NULL),
	(94,4,1,'Dresden','City',NULL,NULL),
	(95,4,1,'Frankfurt (am Main)','City',NULL,NULL),
	(96,4,1,'Freiburg','City',NULL,NULL),
	(97,4,1,'Germany','Country',NULL,NULL),
	(98,4,1,'Hannover','City',NULL,NULL),
	(99,4,1,'Heidelberg','City',NULL,NULL),
	(100,4,1,'Kiel',NULL,NULL,NULL),
	(101,4,1,'Leipzig','City',NULL,NULL),
	(102,4,1,'Mannheim',NULL,NULL,NULL),
	(103,4,1,'Münster',NULL,NULL,NULL),
	(104,4,1,'Oktoberfest',NULL,NULL,NULL),
	(105,4,1,'Potsdam','City',NULL,NULL),
	(106,4,1,'Ruhrgebiet',NULL,NULL,NULL),
	(107,4,1,'Stuttgart','City',NULL,NULL),
	(108,5,1,'Alaska',NULL,NULL,NULL),
	(109,5,1,'Arizona',NULL,NULL,NULL),
	(110,5,1,'Atlanta',NULL,NULL,NULL),
	(111,5,1,'Austin',NULL,NULL,NULL),
	(112,5,1,'California',NULL,NULL,NULL),
	(113,5,1,'Charlotte',NULL,NULL,NULL),
	(114,5,1,'Chicago',NULL,NULL,NULL),
	(115,5,1,'Cleveland',NULL,NULL,NULL),
	(116,5,1,'Colorado',NULL,NULL,NULL),
	(117,5,1,'Dallas',NULL,NULL,NULL),
	(118,5,1,'Denver',NULL,NULL,NULL),
	(119,5,1,'Detroit',NULL,NULL,NULL),
	(120,5,1,'Florida',NULL,NULL,NULL),
	(121,5,1,'Fort Worth',NULL,NULL,NULL),
	(122,5,1,'Hamptons',NULL,NULL,NULL),
	(123,5,1,'Hawaii',NULL,NULL,NULL),
	(124,5,1,'Indianapolis',NULL,NULL,NULL),
	(125,5,1,'Jacksonville',NULL,NULL,NULL),
	(126,5,1,'Las Vegas',NULL,NULL,NULL),
	(127,5,1,'Los Angeles',NULL,NULL,NULL),
	(128,5,1,'Memphis',NULL,NULL,NULL),
	(129,5,1,'Miami',NULL,NULL,NULL),
	(130,5,1,'Nashville',NULL,NULL,NULL),
	(131,5,1,'New Mexico',NULL,NULL,NULL),
	(132,5,1,'New Orleans',NULL,NULL,NULL),
	(133,5,1,'North Carolina',NULL,NULL,NULL),
	(134,5,1,'Ohio',NULL,NULL,NULL),
	(135,5,1,'Orange County',NULL,NULL,NULL),
	(136,5,1,'Orlando',NULL,NULL,NULL),
	(137,5,1,'Philadelphia',NULL,NULL,NULL),
	(138,5,1,'Phoenix',NULL,NULL,NULL),
	(139,5,1,'Pittsburgh',NULL,NULL,NULL),
	(140,5,1,'Portland',NULL,NULL,NULL),
	(141,5,1,'Sacramento',NULL,NULL,NULL),
	(142,5,1,'San Antonio',NULL,NULL,NULL),
	(143,5,1,'San Diego',NULL,NULL,NULL),
	(144,5,1,'San Francisco',NULL,NULL,NULL),
	(145,5,1,'St. Louis',NULL,NULL,NULL),
	(146,5,1,'Tampa',NULL,NULL,NULL),
	(147,5,1,'Twin Cities',NULL,NULL,NULL),
	(148,5,1,'Waikiki',NULL,NULL,NULL),
	(149,5,1,'Washington D.C.',NULL,NULL,NULL),
	(150,18,1,'Argentina','Country',NULL,NULL),
	(151,18,1,'Buenos Aires','City',NULL,NULL),
	(152,19,1,'Aruba',NULL,NULL,NULL),
	(153,20,1,'Australia','Country',NULL,NULL),
	(154,20,1,'Brisbane','City',NULL,NULL),
	(155,20,1,'Gold Coast',NULL,NULL,NULL),
	(156,20,1,'Melbourne','City',NULL,NULL),
	(157,20,1,'Sydney','City',NULL,NULL),
	(158,21,1,'Bahamas',NULL,NULL,NULL),
	(159,22,1,'Bahrain','Country',NULL,NULL),
	(160,23,1,'Rio de Janeiro','City',NULL,NULL),
	(161,24,1,'Banff',NULL,NULL,NULL),
	(162,24,1,'Calgary',NULL,NULL,NULL),
	(163,24,1,'Canada','Country',NULL,NULL),
	(164,24,1,'Edmonton',NULL,NULL,NULL),
	(165,24,1,'Montréal','City',NULL,NULL),
	(166,24,1,'Niagara Falls',NULL,NULL,NULL),
	(167,24,1,'Toronto','City',NULL,NULL),
	(168,24,1,'Vancouver',NULL,NULL,NULL),
	(169,24,1,'Vancouver Island',NULL,NULL,NULL),
	(170,24,1,'Whistler',NULL,NULL,NULL),
	(171,25,1,'Chile',NULL,NULL,NULL),
	(172,26,1,'Prague','City',NULL,NULL),
	(173,26,1,'Czech Republic','Country',NULL,NULL),
	(174,27,1,'Copenhagen','City',NULL,NULL),
	(175,28,1,'Egypt','Country',NULL,NULL),
	(176,28,1,'Cairo','City',NULL,NULL),
	(177,28,1,'Sharm El Sheikh','City',NULL,NULL),
	(178,29,1,'Hungary','Country',NULL,NULL),
	(179,29,1,'Budapest','City',NULL,NULL),
	(180,33,1,'Osaka','City',NULL,NULL),
	(181,33,1,'Sapporo',NULL,NULL,NULL),
	(182,33,1,'Tokyo','City',NULL,NULL),
	(183,34,1,'Jordan',NULL,NULL,NULL),
	(184,35,1,'Kuwait',NULL,NULL,NULL),
	(185,36,1,'Lebanon',NULL,NULL,NULL),
	(186,37,1,'Kuala Lumpur',NULL,NULL,NULL),
	(187,37,1,'Malaysia',NULL,NULL,NULL),
	(188,37,1,'Penang',NULL,NULL,NULL),
	(189,37,1,'Sabah',NULL,NULL,NULL),
	(190,38,1,'Acapulco',NULL,NULL,NULL),
	(191,38,1,'Cancun',NULL,NULL,NULL),
	(192,38,1,'Chihuahua',NULL,NULL,NULL),
	(193,38,1,'Ciudad de Mexico',NULL,NULL,NULL),
	(194,38,1,'Culiacán',NULL,NULL,NULL),
	(195,38,1,'Guadalajara',NULL,NULL,NULL),
	(196,38,1,'Guanajuato',NULL,NULL,NULL),
	(197,38,1,'Los Cabos',NULL,NULL,NULL),
	(198,38,1,'Mexico','Country',NULL,NULL),
	(199,38,1,'Monterrey',NULL,NULL,NULL),
	(200,38,1,'Playa del Carmen',NULL,NULL,NULL),
	(201,38,1,'Puerto Vallarta',NULL,NULL,NULL),
	(202,38,1,'Veracruz',NULL,NULL,NULL),
	(203,38,1,'Zacatecas',NULL,NULL,NULL),
	(204,39,1,'Amsterdam','City',NULL,NULL),
	(205,39,1,'The Netherlands','Country',NULL,NULL),
	(206,40,1,'New Zealand','Country',NULL,NULL),
	(207,40,1,'Auckland',NULL,NULL,'No longer available since Dec. 2010'),
	(208,40,1,'North Island',NULL,NULL,'No longer available since Dec. 2010'),
	(209,40,1,'South Island',NULL,NULL,'No longer available since Dec. 2010'),
	(210,43,1,'Lima','City',NULL,NULL),
	(211,43,1,'Peru','Country',NULL,NULL),
	(212,45,1,'Gdansk','City',NULL,NULL),
	(213,45,1,'Krakow','City',NULL,NULL),
	(214,45,1,'Poznan',NULL,NULL,NULL),
	(215,45,1,'Warsaw','City',NULL,NULL),
	(216,45,1,'Wroclaw',NULL,NULL,NULL),
	(217,45,1,'Gdynia',NULL,NULL,NULL),
	(218,46,1,'Lisbon','City',NULL,NULL),
	(219,46,1,'Portugal','Country',NULL,NULL),
	(220,47,1,'Puerto Rico',NULL,NULL,NULL),
	(221,48,1,'Qatar','Country',NULL,NULL),
	(222,49,1,'Romania','Country',NULL,NULL),
	(223,49,1,'Bucharest','City',NULL,NULL),
	(224,49,1,'Cluj-Napoca',NULL,NULL,NULL),
	(225,50,1,'Jeddah',NULL,NULL,NULL),
	(226,50,1,'Riyadh',NULL,NULL,NULL),
	(227,50,1,'Kingdom of Saudi Arabia','Country',NULL,NULL),
	(228,52,1,'Korea','Country','Korean traditional Mask',NULL),
	(229,52,1,'Seoul','City','Seoul Tower',NULL),
	(230,53,1,'Stockholm','City',NULL,NULL),
	(231,54,1,'Basel',NULL,NULL,NULL),
	(232,54,1,'Berne','City',NULL,NULL),
	(233,54,1,'Geneva','City',NULL,NULL),
	(234,54,1,'Lausanne',NULL,NULL,NULL),
	(235,54,1,'Lucerne',NULL,NULL,NULL),
	(236,54,1,'St. Gallen',NULL,NULL,NULL),
	(237,54,1,'Switzerland','Country',NULL,NULL),
	(238,54,1,'Zurich','City',NULL,NULL),
	(239,55,1,'United Arab Emirates','Country',NULL,NULL),
	(240,55,1,'Dubai',NULL,NULL,NULL),
	(241,55,1,'Abu Dhabi',NULL,NULL,NULL),
	(242,55,1,'Sharjah',NULL,NULL,NULL),
	(243,30,1,'Bali',NULL,NULL,NULL),
	(244,30,1,'Indonesia',NULL,NULL,NULL),
	(245,30,1,'Jakarta',NULL,NULL,NULL),
	(246,30,1,'Batam',NULL,NULL,NULL),
	(247,44,1,'Bacolod',NULL,NULL,NULL),
	(248,44,1,'Baguio',NULL,NULL,NULL),
	(249,44,1,'Batangas',NULL,NULL,NULL),
	(250,44,1,'Boracay',NULL,NULL,NULL),
	(251,44,1,'Cagayan De Oro',NULL,NULL,NULL),
	(252,44,1,'Cebu',NULL,NULL,NULL),
	(253,44,1,'Davao',NULL,NULL,NULL),
	(254,44,1,'Iloilo',NULL,NULL,NULL),
	(255,44,1,'Manila',NULL,NULL,NULL),
	(256,44,1,'Naga',NULL,NULL,NULL),
	(257,44,1,'Pampanga',NULL,NULL,NULL),
	(258,44,1,'Philippines',NULL,NULL,NULL),
	(259,44,1,'Tagaytay',NULL,NULL,NULL),
	(260,51,1,'Singapore (Merlion)',NULL,NULL,NULL),
	(261,51,1,'Singapore (Orchid)',NULL,NULL,NULL),
	(262,56,1,'Ireland','Country',NULL,NULL),
	(263,56,1,'Dublin','City',NULL,NULL),
	(264,41,1,'Belfast','City',NULL,NULL),
	(265,41,1,'Northern Ireland','Country',NULL,NULL);

/*!40000 ALTER TABLE `mugs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mugs2users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mugs2users`;

CREATE TABLE `mugs2users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mugId` int(11) DEFAULT NULL,
  `mugUserId` int(11) DEFAULT NULL,
  `mugAddedMoment` datetime DEFAULT NULL,
  `mugAddedComment` varchar(255) DEFAULT NULL,
  `mugPricePaid` decimal(11,2) DEFAULT NULL,
  `mugPriceCurrency` varchar(3) DEFAULT NULL,
  `mugStatus` enum('Own','Waiting','WantIt','Trade') NOT NULL DEFAULT 'Own',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `mugs2users` WRITE;
/*!40000 ALTER TABLE `mugs2users` DISABLE KEYS */;

INSERT INTO `mugs2users` (`id`, `mugId`, `mugUserId`, `mugAddedMoment`, `mugAddedComment`, `mugPricePaid`, `mugPriceCurrency`, `mugStatus`)
VALUES
	(1,1,1,'2012-01-26 00:00:00','Привез папа из Греции',0.00,'EUR','Own'),
	(2,2,1,'2012-01-26 00:00:00',NULL,NULL,NULL,'Own'),
	(3,3,1,'2012-01-10 00:00:00','Привезла Ольга Ненахова',NULL,NULL,'Own'),
	(4,4,1,'2012-01-26 00:00:00',NULL,NULL,NULL,'Own'),
	(5,5,1,'2012-01-26 00:00:00','Привезла Елена Бабакова из США',NULL,NULL,'Own'),
	(6,6,1,'2012-01-26 00:00:00','Привезла Ирина Дрождь',0.00,'EUR','Own'),
	(7,7,1,'2012-01-26 00:00:00','Прислал по почте Harrison Lee',NULL,NULL,'Own'),
	(8,8,1,'2012-01-26 00:00:00',NULL,NULL,NULL,'Own'),
	(9,9,1,'2012-01-26 00:00:00',NULL,NULL,NULL,'Own'),
	(10,10,1,'2012-01-16 00:00:00','Купил сам на Кипре, в Starbucks Paphos',9.35,'EUR','Own'),
	(11,11,1,'2012-01-26 00:00:00','Купил сам на Кипре, в Starbucks Paphos',NULL,NULL,'Own'),
	(12,12,1,'2012-01-26 00:00:00',NULL,NULL,NULL,'Own'),
	(13,13,1,'2012-01-16 00:00:00','Купил сам на Кипре, в Starbucks Paphos',9.35,'EUR','Own'),
	(14,14,1,'2012-01-26 00:00:00',NULL,NULL,NULL,'Own'),
	(15,15,1,'2012-01-26 00:00:00',NULL,NULL,NULL,'Own'),
	(16,16,1,'2012-01-26 00:00:00','Привезла Анна Степанова из США',NULL,NULL,'Own'),
	(17,17,1,'2012-01-26 00:00:00','Привезла Ольга Котина',0.00,'EUR','Own'),
	(18,18,1,'2012-01-10 00:00:00','Привезла Ольга Ненахова',NULL,NULL,'Own'),
	(19,19,1,'2012-01-26 00:00:00','Привезла Татьяна Петровна из Великобритании',0.00,'EUR','Own'),
	(20,20,1,'2012-01-26 00:00:00',NULL,NULL,NULL,'Own'),
	(21,21,1,'2012-01-26 00:00:00',NULL,NULL,NULL,'Own'),
	(22,22,1,'2012-01-10 00:00:00','Привез Андрей Дугин из Франции',0.00,'EUR','Own'),
	(23,23,1,'2012-01-26 00:00:00','Купил сам в Москве',400.00,'RUB','Own'),
	(24,24,1,'2012-01-26 00:00:00',NULL,NULL,NULL,'Own'),
	(25,25,1,'2012-01-16 00:00:00','Купил сам на Кипре, в Starbucks Paphos',9.35,'EUR','Own'),
	(26,26,1,'2012-01-26 00:00:00','Купил сам в США, на Манхэттене',NULL,NULL,'Own'),
	(27,27,1,'2012-01-26 00:00:00','Привезла Юлия Немодрук из Германии',NULL,NULL,'Own'),
	(28,28,1,'2012-01-26 00:00:00','Прислал по почте Harrison Lee из США',NULL,NULL,'Own'),
	(29,29,1,'2012-01-26 00:00:00','Привезла Татьяна Петровна из Великобритании',NULL,NULL,'Own'),
	(30,30,1,'2012-01-26 00:00:00','Прислал по почте Harrison Lee из США',NULL,NULL,'Own'),
	(31,31,1,'2012-01-26 00:00:00','Привез Harrison Lee',NULL,NULL,'Own'),
	(32,32,1,'2012-01-26 00:00:00','Привез Harrison Lee',NULL,NULL,'Own'),
	(33,33,1,'2012-01-26 00:00:00',NULL,NULL,NULL,'Own'),
	(34,34,1,'2012-01-26 00:00:00','Привез папа из Греции',0.00,'EUR','Own'),
	(35,35,1,'2012-01-26 00:00:00','Прислал по почте Harrison Lee',NULL,NULL,'Own'),
	(36,36,1,'2012-01-26 00:00:00',NULL,NULL,NULL,'Own'),
	(37,39,1,NULL,'Хозяин Старбакса обещал привезти 15 февраля?????',NULL,NULL,'Waiting'),
	(38,224,1,'2012-02-07 00:00:00','Купил сам на Кипре, в центральном Starbucks Nicosia',9.35,'EUR','Own'),
	(39,89,1,NULL,'Андрей Дугин обещал привезти где-то 23 февраля',NULL,NULL,'Waiting'),
	(40,96,1,NULL,'Купил на eBay.de за 16.99 EUR + 8.50 EUR доставка',25.49,'EUR','Waiting'),
	(41,225,1,NULL,'Купил на eBay.de за 16.03 EUR + 2.95 EUR доставка',18.98,'EUR','Waiting'),
	(42,227,1,NULL,'Купил на eBay.de за 16.03 EUR + 2.95 EUR доставка',18.98,'EUR','Waiting'),
	(43,100,1,NULL,'Купил на eBay.de за 18.00 EUR + 4.50 EUR доставка',22.50,'EUR','Waiting'),
	(44,107,1,NULL,'Купил на eBay.de за 18.00 EUR + 4.50 EUR доставка',22.50,'EUR','Waiting'),
	(45,91,1,NULL,'Купил на eBay.de за 16.99 EUR + 8.50 EUR доставка',25.49,'EUR','Waiting'),
	(46,145,1,NULL,'Купил у Harrison Lee за 14.00 USD + 13.86 USD доставка',27.86,'USD','Waiting'),
	(47,118,1,NULL,'Купил у Harrison Lee за 14.00 USD + 13.86 USD доставка',27.86,'USD','Waiting'),
	(48,163,1,NULL,'Купил на eBay.de за ',NULL,NULL,'Waiting');

/*!40000 ALTER TABLE `mugs2users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table series
# ------------------------------------------------------------

DROP TABLE IF EXISTS `series`;

CREATE TABLE `series` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `serieName` varchar(50) NOT NULL DEFAULT '',
  `serieDesc` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;

INSERT INTO `series` (`id`, `serieName`, `serieDesc`)
VALUES
	(1,'2008 Global Icon Series','These mugs are replacing the original City Mugs all over the World. Started in June 2008 in China (for the Olympic Games), now also spread to other countries all over the world.'),
	(2,'Collectors Series City Mugs','The majority of all mugs still come in the style of the first series from 1994. Many different motives and colours, but they are easy to identify.');

/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tagName` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tags2mugs2users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags2mugs2users`;

CREATE TABLE `tags2mugs2users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tagId` int(11) NOT NULL,
  `mug2userId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userLogin` varchar(50) NOT NULL DEFAULT '',
  `userPassword` varchar(50) NOT NULL DEFAULT '',
  `userName` varchar(50) NOT NULL DEFAULT '',
  `userRole` varchar(50) NOT NULL,
  `userCountryId` int(11) NOT NULL,
  `userAvatar` varchar(50) DEFAULT NULL,
  `userCreated` datetime NOT NULL,
  `userTouched` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `userLogin`, `userPassword`, `userName`, `userRole`, `userCountryId`, `userAvatar`, `userCreated`, `userTouched`)
VALUES
	(1,'SantaFox','LbvrfKbc','Dmitry Blokhin','admin',14,'santafox.jpg','2012-01-20 00:00:00','2012-02-09 17:47:39'),
	(2,'HL','','Harrison Lee','user',5,NULL,'2012-01-25 00:00:00','2012-01-25 18:12:10');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table userSettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userSettings`;

CREATE TABLE `userSettings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `settingUserId` int(11) NOT NULL,
  `settingName` varchar(50) NOT NULL DEFAULT '',
  `settingValue` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `userSettings` WRITE;
/*!40000 ALTER TABLE `userSettings` DISABLE KEYS */;

INSERT INTO `userSettings` (`id`, `settingUserId`, `settingName`, `settingValue`)
VALUES
	(1,1,'ShowOnlyOwnMugs','TRUE');

/*!40000 ALTER TABLE `userSettings` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
