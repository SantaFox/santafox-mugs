# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.9)
# Database: u310912_starbuck
# Generation Time: 2012-01-28 20:09:57 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table countries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `countryName` varchar(50) NOT NULL DEFAULT '',
  `countryAcquireAlias` varchar(50) DEFAULT NULL,
  `countryDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;

INSERT INTO `countries` (`id`, `countryName`, `countryAcquireAlias`, `countryDesc`)
VALUES
	(1,'Greece','',NULL),
	(2,'Spain','',NULL),
	(3,'Belgium','',NULL),
	(4,'Germany','',NULL),
	(5,'USA','United States of America',NULL),
	(6,'Bulgaria','',NULL),
	(7,'Wales','',NULL),
	(8,'Thailand','',NULL),
	(9,'China','',NULL),
	(10,'Cyprus','',NULL),
	(11,'France','',NULL),
	(12,'Turkey','',NULL),
	(13,'England','',NULL),
	(14,'Russia','',NULL),
	(15,'Scotland','',NULL),
	(16,'Taiwan','',NULL),
	(17,'Austria','',NULL);

/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mugs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mugs`;

CREATE TABLE `mugs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mugName` varchar(50) NOT NULL DEFAULT '',
  `mugCountryId` int(11) NOT NULL,
  `mugSerieId` int(11) NOT NULL,
  `mugNameMeaning` varchar(50) DEFAULT '',
  `mugImageDesc` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `mugs` WRITE;
/*!40000 ALTER TABLE `mugs` DISABLE KEYS */;

INSERT INTO `mugs` (`id`, `mugName`, `mugCountryId`, `mugSerieId`, `mugNameMeaning`, `mugImageDesc`)
VALUES
	(1,'Athens',1,1,'City',''),
	(2,'Barcelona',2,1,'City',''),
	(3,'Belgium',3,1,'Country',''),
	(4,'Bonn',4,1,'City',''),
	(5,'Boston',5,1,'City',''),
	(6,'Bulgaria',6,1,'Country',''),
	(7,'Cardiff',7,1,'City',''),
	(8,'Chiangmai',8,1,'City','Elephant Sanctuary'),
	(9,'China',9,1,'Country',''),
	(10,'Crete',1,1,'Island',''),
	(11,'Cyprus',10,1,'Country',''),
	(12,'France',11,1,'Country',''),
	(13,'Greece',1,1,'Country',''),
	(14,'Hamburg',4,1,'City',''),
	(15,'Hong Kong',9,1,'Region',''),
	(16,'Houston',5,1,'City',''),
	(17,'Istanbul',12,1,'City',''),
	(18,'Koln',4,1,'City',''),
	(19,'London',13,1,'City',''),
	(20,'Macau',9,1,'Region',''),
	(21,'Madrid',2,1,'City',''),
	(22,'Marseille',11,1,'City','Notre-Dame de la Garde'),
	(23,'Moscow',14,1,'City',''),
	(24,'Munchen',4,1,'City',''),
	(25,'Mykonos',1,1,'Island',''),
	(26,'New York',5,1,'City',''),
	(27,'Nurnberg',4,1,'City',''),
	(28,'Pike Place Market',5,1,'Sightseeing',''),
	(29,'Scotland',15,1,'Country',''),
	(30,'Seattle',5,1,'City',''),
	(31,'Taipei',16,1,'City',''),
	(32,'Taiwan',16,1,'Country',''),
	(33,'Thailand',8,1,'Country',''),
	(34,'Thessaloniki',1,1,'City',''),
	(35,'Wales',7,1,'Country',''),
	(36,'Wiesbaden',4,1,'City',''),
	(37,'Austria',17,1,'Country',''),
	(38,'Vienna',17,1,'City',''),
	(39,'Sofia',6,1,'City','');

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
	(2,2,1,'2012-01-26 00:00:00','Привезла Бабакова Елена из Испании',NULL,'Own'),
	(3,3,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(4,4,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(5,5,1,'2012-01-26 00:00:00','Привезла Бабакова Елена из США',NULL,'Own'),
	(6,6,1,'2012-01-26 00:00:00','Привезла Ирина Дрождь',NULL,'Own'),
	(7,7,1,'2012-01-26 00:00:00','Прислал по почте Harrison Lee',NULL,'Own'),
	(8,8,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(9,9,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(10,10,1,'2012-01-16 00:00:00','Купил сам на Кипре, в Starbucks Paphos',9.35,'Own'),
	(11,11,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(12,12,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(13,13,1,'2012-01-16 00:00:00','Купил сам на Кипре, в Starbucks Paphos',9.35,'Own'),
	(14,14,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(15,15,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(16,16,1,'2012-01-26 00:00:00','Привезла Анна Степанова из США',NULL,'Own'),
	(17,17,1,'2012-01-26 00:00:00','Привезла Ольга Котина',NULL,'Own'),
	(18,18,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(19,19,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(20,20,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(21,21,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(22,22,1,'2012-01-10 00:00:00','Привез Андрей Дугин из Франции',NULL,'Own'),
	(23,23,1,'2012-01-26 00:00:00','Купил сам в Москве',NULL,'Own'),
	(24,24,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(25,25,1,'2012-01-16 00:00:00','Купил сам на Кипре, в Starbucks Paphos',9.35,'Own'),
	(26,26,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(27,27,1,'2012-01-26 00:00:00','Привезла Немодрук Юлия из Германии',NULL,'Own'),
	(28,28,1,'2012-01-26 00:00:00','Прислал по почте Harrison Lee из США',NULL,'Own'),
	(29,29,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(30,30,1,'2012-01-26 00:00:00','Прислал по почте Harrison Lee из США',NULL,'Own'),
	(31,31,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
	(32,32,1,'2012-01-26 00:00:00',NULL,NULL,'Own'),
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
	(2,'Collectors Series City Mugs','Old \'94 City Mug Series','The majority of all mugs still come in the style of the first series from 1994. Many different motives and colours, but they are easy to identify.');

/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tagName` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table tags2mugs2users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags2mugs2users`;

CREATE TABLE `tags2mugs2users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tagId` int(11) NOT NULL,
  `mug2userId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



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
