-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               10.3.9-MariaDB-1:10.3.9+maria~bionic - mariadb.org binary distribution
-- Server Betriebssystem:        debian-linux-gnu
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Exportiere Datenbank Struktur für hc-dbot
CREATE DATABASE IF NOT EXISTS `hc-dbot` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hc-dbot`;

-- Exportiere Struktur von Tabelle hc-dbot.guilds
DROP TABLE IF EXISTS `guilds`;
CREATE TABLE IF NOT EXISTS `guilds` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `guildID` bigint(20) unsigned NOT NULL COMMENT 'Guild ID',
  `guildName` varchar(50) DEFAULT NULL COMMENT 'Guild Name',
  `guildDefaultInvite` varchar(50) DEFAULT NULL COMMENT 'Guild Default Invite',
  `guildOwner` bigint(20) unsigned NOT NULL COMMENT 'Guild Owner ID',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  UNIQUE KEY `guildID` (`guildID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Discord guilds';

-- Exportiere Daten aus Tabelle hc-dbot.guilds: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `guilds` DISABLE KEYS */;
/*!40000 ALTER TABLE `guilds` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle hc-dbot.guilds.admins
DROP TABLE IF EXISTS `guilds.admins`;
CREATE TABLE IF NOT EXISTS `guilds.admins` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `guildID` bigint(20) unsigned NOT NULL COMMENT 'Corresponding Guild',
  `userID` bigint(20) unsigned NOT NULL COMMENT 'User ID',
  `userName` varchar(50) NOT NULL COMMENT 'Discord Username',
  `userDiscriminator` varchar(50) NOT NULL COMMENT '<Username>#0000 <- that part',
  `userPassword` varchar(50) NOT NULL COMMENT 'WI Password',
  `userEmail` varchar(50) DEFAULT NULL COMMENT 'Mail-Adress (maybe changeable in WI?)',
  `userDiscordEmail` varchar(50) DEFAULT NULL COMMENT 'Discord-Mail-Adress',
  `changeDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `GuildAdmins` (`guildID`),
  CONSTRAINT `GuildAdmins` FOREIGN KEY (`guildID`) REFERENCES `guilds` (`guildID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild Managers/Admins -> Guild Permission "Administrator"';

-- Exportiere Daten aus Tabelle hc-dbot.guilds.admins: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `guilds.admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `guilds.admins` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle hc-dbot.guilds.config
DROP TABLE IF EXISTS `guilds.config`;
CREATE TABLE IF NOT EXISTS `guilds.config` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guildID` bigint(20) unsigned NOT NULL COMMENT 'GuildID',
  `ruleChannelID` bigint(20) unsigned DEFAULT NULL COMMENT 'Rule Channel',
  `infoChannelID` bigint(20) unsigned DEFAULT NULL COMMENT 'Info Channel',
  `cmdChannelID` bigint(20) unsigned DEFAULT NULL COMMENT 'Commands things',
  `logChannelID` bigint(20) unsigned DEFAULT NULL COMMENT 'Log Channel',
  `roleID` bigint(20) unsigned DEFAULT NULL COMMENT 'That Role',
  `customInfo` varchar(50) DEFAULT NULL COMMENT 'IDFK',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  UNIQUE KEY `guildID` (`guildID`),
  CONSTRAINT `GuildConfig` FOREIGN KEY (`guildID`) REFERENCES `guilds` (`guildID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Discord guild config';

-- Exportiere Daten aus Tabelle hc-dbot.guilds.config: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `guilds.config` DISABLE KEYS */;
/*!40000 ALTER TABLE `guilds.config` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle hc-dbot.guilds.emotes
DROP TABLE IF EXISTS `guilds.emotes`;
CREATE TABLE IF NOT EXISTS `guilds.emotes` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `guildID` bigint(20) unsigned NOT NULL COMMENT 'Corresponding Guild',
  `emoteID` bigint(20) unsigned NOT NULL COMMENT 'Emote ID',
  `emoteURL` varchar(500) NOT NULL COMMENT 'Emote URL',
  `emoteName` varchar(500) NOT NULL COMMENT 'Emote Name',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  UNIQUE KEY `emoteID` (`emoteID`),
  UNIQUE KEY `emoteURL` (`emoteURL`),
  KEY `guildEmotes` (`guildID`),
  CONSTRAINT `guildEmotes` FOREIGN KEY (`guildID`) REFERENCES `guilds` (`guildID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='All Custom Guild Emotes';

-- Exportiere Daten aus Tabelle hc-dbot.guilds.emotes: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `guilds.emotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `guilds.emotes` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle hc-dbot.guilds.users
DROP TABLE IF EXISTS `guilds.users`;
CREATE TABLE IF NOT EXISTS `guilds.users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` bigint(20) unsigned NOT NULL COMMENT 'User ID',
  `userName` varchar(50) NOT NULL COMMENT 'Discord Username',
  `userDiscriminator` varchar(50) NOT NULL COMMENT '<Username>#0000 <- that part',
  `Birthdate` date DEFAULT NULL,
  `changeDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  UNIQUE KEY `userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild Managers/Admins -> Guild Permission "Administrator"';

-- Exportiere Daten aus Tabelle hc-dbot.guilds.users: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `guilds.users` DISABLE KEYS */;
/*!40000 ALTER TABLE `guilds.users` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle hc-dbot.modules.config
DROP TABLE IF EXISTS `modules.config`
CREATE TABLE IF NOT EXISTS `modules.config` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `guildID` bigint(20) unsigned NOT NULL DEFAULT 0,
  `adminModule` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `greetModule` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `birthdayModule` tinyint(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  UNIQUE KEY `guildID` (`guildID`),
  CONSTRAINT `guildModuleConfig` FOREIGN KEY (`guildID`) REFERENCES `guilds` (`guildID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild module config';

-- Exportiere Daten aus Tabelle hc-dbot.modules.config: ~3 rows (ungefähr)
/*!40000 ALTER TABLE `modules.config` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules.config` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle hc-dbot.modules.greet
DROP TABLE IF EXISTS `modules.greet`;
CREATE TABLE IF NOT EXISTS `modules.greet` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `guildID` bigint(20) unsigned NOT NULL COMMENT 'Corresponding Guild',
  `announceString` varchar(50) NOT NULL COMMENT 'That Text',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  UNIQUE KEY `guildID` (`guildID`),
  CONSTRAINT `guildModuleGreet` FOREIGN KEY (`guildID`) REFERENCES `guilds` (`guildID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle hc-dbot.modules.greet: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `modules.greet` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules.greet` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle hc-dbot.modules.roles
DROP TABLE IF EXISTS `modules.roles`;
CREATE TABLE IF NOT EXISTS `modules.roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `guildID` bigint(20) unsigned NOT NULL COMMENT 'Corresponding Guild',
  `roleID` bigint(20) NOT NULL COMMENT 'Role',
  `msgID` bigint(20) NOT NULL COMMENT 'Msg',
  `reactID` bigint(20) NOT NULL COMMENT 'Needed React',
  `roleName` varchar(255) DEFAULT NULL COMMENT 'Name',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle hc-dbot.modules.roles: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `modules.roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules.roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
