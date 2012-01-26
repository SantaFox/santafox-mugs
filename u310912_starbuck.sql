-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Янв 26 2012 г., 16:20
-- Версия сервера: 5.5.9
-- Версия PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `u310912_starbuck`
--

-- --------------------------------------------------------

--
-- Структура таблицы `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `countryName` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Дамп данных таблицы `countries`
--

INSERT INTO `countries` (`id`, `countryName`) VALUES
(1, 'Greece'),
(2, 'Spain'),
(3, 'Belgium'),
(4, 'Germany'),
(5, 'USA'),
(6, 'Bulgaria'),
(7, 'Wales'),
(8, 'Thailand'),
(9, 'China'),
(10, 'Cyprus'),
(11, 'France'),
(12, 'Turkey'),
(13, 'England'),
(14, 'Russia'),
(15, 'Scotland'),
(16, 'Taiwan');

-- --------------------------------------------------------

--
-- Структура таблицы `mugs`
--

CREATE TABLE IF NOT EXISTS `mugs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mugName` varchar(50) NOT NULL DEFAULT '',
  `mugCountryId` int(11) NOT NULL,
  `mugSeriesId` int(11) NOT NULL,
  `mugNameMeaning` varchar(50) DEFAULT '',
  `mugImageDesc` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Дамп данных таблицы `mugs`
--

INSERT INTO `mugs` (`id`, `mugName`, `mugCountryId`, `mugSeriesId`, `mugNameMeaning`, `mugImageDesc`) VALUES
(1, 'Athens', 1, 1, 'City', ''),
(2, 'Barcelona', 2, 1, 'City', ''),
(3, 'Belgium', 3, 1, 'Country', ''),
(4, 'Bonn', 4, 1, 'City', ''),
(5, 'Boston', 5, 1, 'City', ''),
(6, 'Bulgaria', 6, 1, 'Country', ''),
(7, 'Cardiff', 7, 1, 'City', ''),
(8, 'Chiangmai', 8, 1, 'City', 'Elephant Sanctuary'),
(9, 'China', 9, 1, 'Country', ''),
(10, 'Crete', 1, 1, 'Island', ''),
(11, 'Cyprus', 10, 1, 'Country', ''),
(12, 'France', 11, 1, 'Country', ''),
(13, 'Greece', 1, 1, 'Country', ''),
(14, 'Hamburg', 4, 1, 'City', ''),
(15, 'Hong Kong', 9, 1, 'Region', ''),
(16, 'Houston', 5, 1, 'City', ''),
(17, 'Istanbul', 12, 1, 'City', ''),
(18, 'Koln', 4, 1, 'City', ''),
(19, 'London', 13, 1, 'City', ''),
(20, 'Macau', 9, 1, 'Region', ''),
(21, 'Madrid', 2, 1, 'City', ''),
(22, 'Marseille', 11, 1, 'City', 'Notre-Dame de la Garde'),
(23, 'Moscow', 14, 1, 'City', ''),
(24, 'Munchen', 4, 1, 'City', ''),
(25, 'Mykonos', 1, 1, 'Island', ''),
(26, 'New York', 5, 1, 'City', ''),
(27, 'Nurnberg', 4, 1, 'City', ''),
(28, 'Pike Place Market', 5, 1, 'Sightseeing', ''),
(29, 'Scotland', 15, 1, 'Country', ''),
(30, 'Seattle', 5, 1, 'City', ''),
(31, 'Taipei', 16, 1, 'City', ''),
(32, 'Taiwan', 16, 1, 'Country', ''),
(33, 'Thailand', 8, 1, 'Country', ''),
(34, 'Thessaloniki', 1, 1, 'City', ''),
(35, 'Wales', 7, 1, 'Country', ''),
(36, 'Wiesbaden', 4, 1, 'City', '');

-- --------------------------------------------------------

--
-- Структура таблицы `mugs2users`
--

CREATE TABLE IF NOT EXISTS `mugs2users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mug_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `added_moment` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `mugs2users`
--


-- --------------------------------------------------------

--
-- Структура таблицы `series`
--

CREATE TABLE IF NOT EXISTS `series` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `seriesName` varchar(50) NOT NULL DEFAULT '',
  `seriesDesc` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `series`
--

INSERT INTO `series` (`id`, `seriesName`, `seriesDesc`) VALUES
(1, '''08 Icon Series', 'These mugs are replacing the original City Mugs all over the World. Started in June 2008 in China (for the Olympic Games), now also spread to other countries all over the world.');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userAlias` varchar(50) NOT NULL DEFAULT '',
  `userName` varchar(50) NOT NULL DEFAULT '',
  `userCountryId` int(11) NOT NULL,
  `userRole` varchar(50) NOT NULL,
  `userCreated` datetime NOT NULL,
  `userTouched` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `userAlias`, `userName`, `userCountryId`, `userRole`, `userCreated`, `userTouched`) VALUES
(1, 'SantaFox', 'Dmitry Blokhin', 14, 'admin', '2012-01-20 00:00:00', '2012-01-25 18:12:05'),
(2, 'HL', 'Harrison Lee', 5, 'user', '2012-01-25 00:00:00', '2012-01-25 18:12:10');
