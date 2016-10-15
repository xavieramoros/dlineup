# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.29)
# Database: pyrocms_db
# Generation Time: 2013-08-15 19:01:44 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table core_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `core_settings`;

CREATE TABLE `core_settings` (
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`slug`),
  UNIQUE KEY `unique - slug` (`slug`),
  KEY `index - slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores settings for the multi-site interface';

LOCK TABLES `core_settings` WRITE;
/*!40000 ALTER TABLE `core_settings` DISABLE KEYS */;

INSERT INTO `core_settings` (`slug`, `default`, `value`)
VALUES
	('date_format','g:ia -- m/d/y','g:ia -- m/d/y'),
	('lang_direction','ltr','ltr'),
	('status_message','This site has been disabled by a super-administrator.','This site has been disabled by a super-administrator.');

/*!40000 ALTER TABLE `core_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table core_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `core_sites`;

CREATE TABLE `core_sites` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ref` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unique ref` (`ref`),
  UNIQUE KEY `Unique domain` (`domain`),
  KEY `ref` (`ref`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `core_sites` WRITE;
/*!40000 ALTER TABLE `core_sites` DISABLE KEYS */;

INSERT INTO `core_sites` (`id`, `name`, `ref`, `domain`, `active`, `created_on`, `updated_on`)
VALUES
	(1,'Default Site','default','127.0.0.1',1,1360768590,0);

/*!40000 ALTER TABLE `core_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table core_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `core_users`;

CREATE TABLE `core_users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `ip_address` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `activation_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Super User Information';

LOCK TABLES `core_users` WRITE;
/*!40000 ALTER TABLE `core_users` DISABLE KEYS */;

INSERT INTO `core_users` (`id`, `email`, `password`, `salt`, `group_id`, `ip_address`, `active`, `activation_code`, `created_on`, `last_login`, `username`, `forgotten_password_code`, `remember_code`)
VALUES
	(1,'xaviamoros@gmail.com','19f93d63aed928e70bf7d5c1dc00447ceb9c2aef','6ee45',1,'',1,'',1360768589,1360768589,'xavieramoros',NULL,NULL);

/*!40000 ALTER TABLE `core_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_blog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_blog`;

CREATE TABLE `default_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `attachment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `comments_enabled` int(1) NOT NULL DEFAULT '1',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `type` set('html','markdown','wysiwyg-advanced','wysiwyg-simple') COLLATE utf8_unicode_ci NOT NULL,
  `preview_hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_title` (`title`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `default_blog` WRITE;
/*!40000 ALTER TABLE `default_blog` DISABLE KEYS */;

INSERT INTO `default_blog` (`id`, `title`, `slug`, `category_id`, `attachment`, `intro`, `body`, `parsed`, `keywords`, `author_id`, `created_on`, `updated_on`, `comments_enabled`, `status`, `type`, `preview_hash`)
VALUES
	(3,'BlogPost1','blogpost1',0,'','introduction of blogpost1','content of blogpost1','','',1,1361204100,0,1,'live','wysiwyg-advanced','');

/*!40000 ALTER TABLE `default_blog` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_blog_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_blog_categories`;

CREATE TABLE `default_blog_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_slug` (`slug`),
  UNIQUE KEY `unique_title` (`title`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `default_blog_categories` WRITE;
/*!40000 ALTER TABLE `default_blog_categories` DISABLE KEYS */;

INSERT INTO `default_blog_categories` (`id`, `slug`, `title`)
VALUES
	(1,'eventos','eventos');

/*!40000 ALTER TABLE `default_blog_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_ci_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_ci_sessions`;

CREATE TABLE `default_ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `default_ci_sessions` WRITE;
/*!40000 ALTER TABLE `default_ci_sessions` DISABLE KEYS */;

INSERT INTO `default_ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`)
VALUES
	('819b790e35b4234feee2855a7f819f46','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17',1360840017,'a:6:{s:8:\"username\";s:12:\"xavieramoros\";s:5:\"email\";s:20:\"xaviamoros@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
	('c8fe1b5899b405dd98ece73eb03dff81','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17',1360840041,''),
	('8d21786d7640f8b3dca3324f1cc3fd6a','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17',1360840046,''),
	('46056305d4c0f1cfd1032a78ac28846d','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17',1360840131,''),
	('f00da03bf3e45f581af4e217052d3527','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17',1360840760,''),
	('af90fd51242a3356660183936c649d3f','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17',1360840823,''),
	('f6c331b1cd87c727b826bf3c94145477','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17',1360840826,''),
	('84688890fd987bcf70c845a1478ac4ed','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17',1360840872,''),
	('dd3188480a4df6a252a7586206905914','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17',1360840947,''),
	('1e882d615e3c372a57ed298c64572df7','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17',1360840991,''),
	('86e3bd87e5fc5f16b6e4a3310ffd9664','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17',1360842212,''),
	('d49cdbc5434bc08087e7ec73613ef865','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17',1360842370,''),
	('7c1ee84f2ade036b3c4c7757a29d2484','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17',1360843206,''),
	('071220ff9f6ee8dab2004e90e7e4cba3','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17',1360843215,''),
	('5461fca18506f0fdb6fe0082506d3cfb','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17',1360843241,''),
	('b444eef5d0188fcc548e5cbd656fdb63','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17',1360843243,''),
	('d4ad15fc30896eb087be5656a2d7e2a9','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17',1360957688,'a:6:{s:8:\"username\";s:12:\"xavieramoros\";s:5:\"email\";s:20:\"xaviamoros@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
	('a989268a5964c5ffb3f99bc4e9d962f3','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:18.0) Gecko/20100101 Firefox/18.0',1360845160,''),
	('e3ece2902eb2a2e1ad3011d3372f6b78','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:18.0) Gecko/20100101 Firefox/18.0',1361282978,'a:8:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:12:\"xavieramoros\";s:5:\"email\";s:20:\"xaviamoros@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:18:\"flash:new:referrer\";s:22:\"event/2013/02/evento-1\";}'),
	('0a5471a0c1e3c998ce358d83719afc76','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:18.0) Gecko/20100101 Firefox/18.0',1361370354,'a:8:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:12:\"xavieramoros\";s:5:\"email\";s:20:\"xaviamoros@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:18:\"flash:new:referrer\";s:46:\"event/2013/02/barcelona-skills-exchange-meetup\";}'),
	('fcd2768e29777550c2db5c6115f74060','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/534.52.7 (KHTML, like Gecko)',1361314482,''),
	('570d6d5f5ba8c10f5d190280e1525709','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:19.0) Gecko/20100101 Firefox/19.0',1361371562,''),
	('79c09e8eb1ab5d72459107e3b2cd404e','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:19.0) Gecko/20100101 Firefox/19.0',1361398942,'a:6:{s:8:\"username\";s:12:\"xavieramoros\";s:5:\"email\";s:20:\"xaviamoros@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
	('5a2cf1e7c2e361e651bf17fdc8af1910','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.160 Safari/537.22',1363976989,''),
	('b36178fb82eb18a9e845293e598a33fd','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:19.0) Gecko/20100101 Firefox/19.0',1363562788,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:12:\"xavieramoros\";s:5:\"email\";s:20:\"xaviamoros@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
	('c5fccbbf56efa528c12bc2f9f764f598','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/536.26.14 (KHTML, like Gecko)',1363561278,''),
	('d59c5b9f50bd008712cbdfe8b8cb7230','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:19.0) Gecko/20100101 Firefox/19.0',1363563570,'a:6:{s:9:\"user_data\";s:0:\"\";s:5:\"email\";s:20:\"xaviamoros@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
	('be365a77264bd6e160bc76456596affc','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:19.0) Gecko/20100101 Firefox/19.0',1364154320,'a:6:{s:9:\"user_data\";s:0:\"\";s:5:\"email\";s:20:\"xaviamoros@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
	('b6da8f5e6fbcf2eca9741010e0f5c525','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.160 Safari/537.22',1363976993,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:12:\"xavieramoros\";s:5:\"email\";s:20:\"xaviamoros@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
	('3760e9c8debc436b6b2531604264e08b','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:19.0) Gecko/20100101 Firefox/19.0',1365003899,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:12:\"xavieramoros\";s:5:\"email\";s:20:\"xaviamoros@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
	('60c8f8d64b481afcb40585c01b7f1d42','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1364982364,''),
	('5f847e214d5375ba368dbee7f8f5d719','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:19.0) Gecko/20100101 Firefox/19.0',1365257192,'a:6:{s:8:\"username\";s:12:\"xavieramoros\";s:5:\"email\";s:20:\"xaviamoros@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
	('c56f7eb51673e89fddd8a7a6919c3a00','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31',1365180086,''),
	('62316c9e7b4a3936ec31219963309e52','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:20.0) Gecko/20100101 Firefox/20.0',1365877113,''),
	('18950866e65c88e2d47188ea522cc5b5','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:20.0) Gecko/20100101 Firefox/20.0',1365877118,''),
	('f486c39a6033795cd8f38939391d3f9d','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:20.0) Gecko/20100101 Firefox/20.0',1366130683,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:12:\"xavieramoros\";s:5:\"email\";s:20:\"xaviamoros@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
	('a4d70fc4b71a5e6048cfe4915612ef1e','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1366046724,''),
	('523ff93b7124b1f2aa0bc4e27ef915ef','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1366111498,''),
	('cd0d21ff0c9cf1feebc42087ee07c1c1','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1366123212,''),
	('9e4d00dcc077befa37c4685da9d0f4be','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:20.0) Gecko/20100101 Firefox/20.0',1366142800,'a:6:{s:8:\"username\";s:12:\"xavieramoros\";s:5:\"email\";s:20:\"xaviamoros@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
	('ab434b620efa68e526e8c442361f3855','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.65 Safari/537.31',1368038766,'a:6:{s:8:\"username\";s:12:\"xavieramoros\";s:5:\"email\";s:20:\"xaviamoros@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
	('b2fb9b65f21a3e59b36ca1d858ba0135','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1368012963,''),
	('9497e090193d99488ab199ba273b7d54','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:20.0) Gecko/20100101 Firefox/20.0',1368461290,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:12:\"xavieramoros\";s:5:\"email\";s:20:\"xaviamoros@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
	('f090e1247e810d644b8dc36b27c3a730','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1368189655,''),
	('b7c4a4c10a8e28bf7e45d4a99257430e','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1368193854,''),
	('8bda4a60c6efd70d2f6928c0e59cf390','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1368193858,''),
	('f8a94afeb3d70d77a50fdf2feca691e5','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1368193861,''),
	('93a5f808ba7dbc4f2aebbdf7a1bcd414','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1368193865,''),
	('a13b1b4303bded4a21a0f2969dff1053','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1368193867,''),
	('bbf59602b3d23b864301a07be6be11ca','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1368266091,''),
	('bf89ebf1447544fc43dc8d9a19d6944f','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1368266105,''),
	('9994b8f7aa2be2431be104b1fdaec04c','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1368267269,''),
	('91893156a1ccd3b8a6b8229fc9fdb292','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1368267273,''),
	('dafd11e4702263ae69ff489b67136a57','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1368267535,''),
	('6a880f48e46ce0e13c2892bd7a55604b','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1368267537,''),
	('97134749bf9e4e57b5c736af86822c67','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1368282276,''),
	('530aeb5cfc3ee9f2cbac5f14b2eb69aa','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1368287817,''),
	('f5bc785936e0ea74e6d20dc25101a755','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1368288327,''),
	('e08e87409d66cf16d21bce3fa7bca117','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1368288329,''),
	('43bb3c91fb9e1a53f01ffbbc3552ef3e','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1368288333,''),
	('5ace6145aed7d8db1ba3f5c9cf495b5e','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1368288334,''),
	('2498d695d072b2c8516ca26c170309d8','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1368288422,''),
	('47d3536c6e03e8e1ac8690910215b66f','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1368288424,''),
	('2048ca3a23f244dbede8005fe693c39a','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1368288611,''),
	('9b308f75f9ebc4039bce3284bd6509a9','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1368288613,''),
	('cb5c6c2c74c6b8ca556f8bb463adebf0','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1368288683,''),
	('bee624bbe649525679659f31767e83da','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1368288685,''),
	('348d3df4aa709e226877ba77353ddaad','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1368288689,''),
	('09c502e2af8799458e41fce1748e93cf','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1368288691,''),
	('d84de8c3b793105d42c54749e1d262ff','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1368288793,''),
	('309aba58964b60e8dce56042cfbd977c','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1368288795,''),
	('25a5f1e8306dd8effe08501eb4114831','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1368288960,''),
	('1346a5f2bf32e435e6fd3c6588b1ed87','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1368289025,''),
	('ef564f787f351ef042fcc4acd3645818','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1368289029,''),
	('e83ed436b04d72dd931eec904d91064a','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1368289031,''),
	('a612c050225d59581b0f0d4db5cd9ca9','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1368289122,''),
	('91948d644fba885ce3078405336a8933','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1368289124,''),
	('7b8b6418b2eb1941fce470f4031c8e9c','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1369413019,''),
	('0b45b05e6eda9375d5afe99dc7e715df','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1369413021,''),
	('0fb8500f6a81354ed32c4b960a23f443','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1369413028,''),
	('8c033fb8e18bc7821ef40993ff95bde6','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1369413028,''),
	('4e65172cf52602ecd20dec1248ebc14e','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1369413028,''),
	('5df5e9050bb9520b4d7f237642e61d02','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1369413030,''),
	('64bbfb4f1f91fa79c678945c17d2d21a','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.93 Safari/537.36',1369911192,''),
	('69af195663d5b7039c6cfac300d1ddf1','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:21.0) Gecko/20100101 Firefox/21.0',1372835253,'a:6:{s:8:\"username\";s:12:\"xavieramoros\";s:5:\"email\";s:20:\"xaviamoros@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
	('41b75005eee7aa8500094d47b1f3a46c','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1372419483,''),
	('c0f07d14c52b43d0068e6303a9a796c8','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1372419485,''),
	('f6c253d9261308f00b861a0aaee71110','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1372419490,''),
	('088e2bfd8067e353ecc14614caf80438','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1372419490,''),
	('4f407feffafbcd6eeeeeff8bdef9449e','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1372419491,''),
	('ef83cee5750c9719099e5cd9f0d6225c','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1372419492,''),
	('be7809865aecf3c1f95034240b99eeed','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1372419768,''),
	('f85b041c6ddb071deda513e2b560332b','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1372419771,''),
	('e240a1d573dd31b84167b54e2df921af','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1372864117,''),
	('a0b4984a06bfc470338d25d704c5e3ba','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1372864124,''),
	('524d8cff61540f5dd6d8e0ee07575ab0','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1372864851,''),
	('9ff126c0f5ed16b283a69b1d6e85336f','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1372864853,''),
	('2bde1edc252aba7032af6497471bbd54','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:22.0) Gecko/20100101 Firefox/22.0',1373526222,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:12:\"xavieramoros\";s:5:\"email\";s:20:\"xaviamoros@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
	('b91e4f2905790313aa859bac708dc158','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373040344,''),
	('5b093790e5e17b9933a302a83498df3e','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373307793,''),
	('23e6d0751e135107e841666970e34ab1','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.93 Safari/537.36',1373220497,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:12:\"xavieramoros\";s:5:\"email\";s:20:\"xaviamoros@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
	('623cfcf78d2c49b3f20b9e80e8e5319a','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373374798,''),
	('278c3a9b27deedcb84561fa02080d25f','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373374804,''),
	('acc04335e74a9dfbab8933a510750df2','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373375127,''),
	('5eb9ca4458667c5d685423c366d86e0d','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373375129,''),
	('87c10364c6f0a34c419f91b2636fd664','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373375154,''),
	('afe0014d4040a306045135a376c95290','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373375156,''),
	('a98c9206dc3514a58aea4dc03ef8be10','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373375506,''),
	('04e2ae1e2213d573308ad8ef48d2bb9e','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373375508,''),
	('afb5de00962794c218e2b6bbf07d0479','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373375613,''),
	('13a1b6264a52cfc856e56eac49bed873','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373375615,''),
	('a6b629e792081a1dade3d3ab585f0f99','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373375620,''),
	('4dbe5537c256de0bc914464546a63015','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373375622,''),
	('02236b862d4fc0f75c2341e814b1a817','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373375637,''),
	('21030d2f6d009524f2cec1397cb43fa2','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373375639,''),
	('d3e7b6421b591e5c8938b4ae05b43af1','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373375661,''),
	('2561962e0d5c61854c6c17edce66d111','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373375662,''),
	('7aad12721eee48f1d97f753946b67f18','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373375676,''),
	('2dafc2a634c2f945e5acc7f144d978fa','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373375678,''),
	('4e579ec4271d788cc629cb75a16c4fc9','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373375692,''),
	('04294f43aa46e40158f1ed0e624a0733','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373375694,''),
	('d869fd80cba56774bab034a3661b82d5','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373375697,''),
	('ae258efd4aca866d3704b4f9367e8d2a','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373375698,''),
	('1d513f7442e372dbd7f3feb161966b5d','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373375702,''),
	('c3e3145d927aae7b75ddce5105d77492','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373375704,''),
	('9465eadac5083aad2cdf5ad365b00457','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373375707,''),
	('b18ddf6e83760797d45ce075f5d1293d','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373375709,''),
	('19f3674888ead3e54891213cbf16430b','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373375713,''),
	('b13542aa9cf0de2a0418930c01121f4f','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373375715,''),
	('c19cd77f8d460b2979a1c8bbf7757500','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373375722,''),
	('293b39433657e095bb829cee932e0fb0','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373375724,''),
	('0b7749d1b0925f80179cc36abd7d386d','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373375731,''),
	('9bad34b163ef75af0768ba4ec012467d','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373375733,''),
	('9f00d3bc8a2bffeb4b377a4b42a1bcbb','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373375773,''),
	('89164a4d1567fc3a2b71a3af3a5d5566','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373375775,''),
	('e966e27a24da2cebfc35c02a207c4f74','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373375784,''),
	('b85d0d93de1a237cda53bb9ebbf93cf3','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373375786,''),
	('ce279ed2a64015891856823c7a6580ad','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373375790,''),
	('e018af180b08abd32294f82ddb9bd30c','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373375791,''),
	('7e59174f53b2dd5c667618517e37f8a3','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373376026,''),
	('deaeb2e35c1952d7749d7f04abb4b299','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373376028,''),
	('85a4b31345a71e03f6703d992c2bb22b','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373376035,''),
	('d0c45a405da249e47eb81fad5a87510d','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373376036,''),
	('35314d3033d6a05b380efdcbe3c083b0','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373376042,''),
	('46e0e650ad2d52102f7f9ca53e20ebb5','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373376043,''),
	('87fd5ed9f561548f36f5f96fd19ebeb7','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373376182,''),
	('dfe1f5e1c58f7043a6dd5a0935789c39','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373376184,''),
	('43b1eb9c28bce006b5845504a318ba2b','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373376187,''),
	('0e8bf5f256c99c4d28f9d3f712bbc1bf','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373376188,''),
	('6cd47a594996af784b5ad64692dee8b6','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373378336,''),
	('7754e467e6e7b643a72df8d88e9246af','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373378338,''),
	('394adaa91d9b6b984d18ef07575980a8','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373378344,''),
	('9258d046b40db4ec2c4cefac0e79df99','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373378346,''),
	('ecc8ae46b9ad325f8670187a578f254e','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373378355,''),
	('1ebe40ca39bbbac21e6719f25dcc348a','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373378356,''),
	('b399736c1187664765298019a9fa6445','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373378747,''),
	('ff89a1cd1c023dbdf932cde4b4ba1fe5','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373378748,''),
	('c1bf052c608c940462210c15c0941ff9','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373378768,''),
	('3c00ef3b93d4f58d8557de470b4f20a1','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373378769,''),
	('4da85df71cc805608dfb3bc58e606156','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373378795,''),
	('77bdf45427aed2093de85842ac0e3190','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373378797,''),
	('bae8f34b1bc88232322e617ea572ef5e','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373378872,''),
	('11a41160261744b029e535df4ca1994f','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373378874,''),
	('d2d21459308b7253b59b0d2372ccbe70','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373378888,''),
	('4baf8a52051ef0a1fb8c8ec043f3eff8','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373378889,''),
	('371807e3548d1ce18d57398cbc395d9c','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373378910,''),
	('c30af331a51f46ef2f71656ba270f543','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373378912,''),
	('c96d7a0054868fe2d633ffc30a8ecd43','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373378935,''),
	('53507bd99df0519cf03ed2486714f1a0','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373378937,''),
	('d0e8648032f92cf76b88d823a627f9e1','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373378942,''),
	('3d8c7efd9b32d5c86065441bfe466707','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373378944,''),
	('cdb950c64cbea375d19efdfe0178e695','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373378948,''),
	('15fe8a52394c9f81b8376e68677b9ac4','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373378950,''),
	('6c78cbf5d75ce7aa9db5ab81c24dd32f','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373378962,''),
	('7e1071d0ae7257cb868588d9879c36a0','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373378964,''),
	('46a14fd885782de8e9a095c4254851ac','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373378983,''),
	('865100715a7bb32c54f23399c765f785','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373378985,''),
	('e50dd722a606e60c8205b7a2c091fc62','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373379032,''),
	('b0f005723c6a801a9ad12e1e0d612f9e','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373379034,''),
	('efc102d79a8844d9417e4f2de106d564','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373379036,''),
	('69b5eaf87a9e8b66b982355bfeb6f839','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373379038,''),
	('84b262d56444b4ff84f449a0aeb5e339','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373379042,''),
	('04a61cb40c24c2a43266577af3357852','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373379044,''),
	('c7f189d3cc27007ede050c3cf2c3c12d','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373379287,''),
	('bc758ea3f7770acbff704e24b3af3978','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373379288,''),
	('c2052a7ae7bf8c4b8a560b6cd1eb37f5','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373379292,''),
	('3f262c33e501ff052afb2b5537b1a5f2','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373379294,''),
	('e7d51999d1f0ce1f87804030492e83da','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373379298,''),
	('9780a1ce415447b66183de5db0323c9c','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373379299,''),
	('c78743888a7ab5bbb4c376f35219d00d','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373379306,''),
	('b78ccde0bd7b325cbe72c3ca30e31f25','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373379307,''),
	('722f42623ce2e1a8baf1677e6270cc3a','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373379311,''),
	('3c9bf7ebc07bc38a408ca9e441836c41','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373379313,''),
	('b34b0fecf30788a8feebeda4a1ae19da','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373381008,''),
	('2774b78efc47061a3db9548702a16181','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373381010,''),
	('6ab040c8ddcf3348de2d9c3c9051be27','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373381193,''),
	('9472ae1d9f4b95e94ccae16109cb440a','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373381194,''),
	('8625a6cad9a768be4c3c471b582fa966','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373381202,''),
	('062d789c2698f7c20f09db308c06e11b','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373381204,''),
	('66d3e72dc3a46114180fb6676c0c3543','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373381210,''),
	('2fe76a59fa7831bcc9e3fa62e95f468f','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373381211,''),
	('982469e1a74db6d6897996082ba15129','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373381268,''),
	('c25d7e854a4a92fb032ec0287a5d968b','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373526007,''),
	('98cfbabca5a74c646e3d2a3768376b40','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:22.0) Gecko/20100101 Firefox/22.0',1373526704,''),
	('931bc5c47a2c6ece6cb9dcb55c87dcf5','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373526751,''),
	('61160759f68c5a1377884c7ad459b35c','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373526753,''),
	('3d3cc41c6db9ba9e70265acb02681c80','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373526787,''),
	('35980e894b65e669029fa89d4ecaa89b','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373526789,''),
	('d08a560616e14ac493da2b02c0efe772','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373526794,''),
	('6f0d287ef1f57dee15275c4db71ec915','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373526796,''),
	('fb84a7eea327c60ff1cc038bbdc79870','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373526817,''),
	('a58110e8794cc52d4ec92a4b01e51124','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373526818,''),
	('bdd3f8f376f55e2d98f6435c6cd2ee1a','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373526825,''),
	('2ac46368c4da239468d0de321205aa95','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373526826,''),
	('c8bb05872749cd8b56c78a526f6b6c27','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373526840,''),
	('716eed0fd1f6e72f2b202522db9949c1','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373526842,''),
	('4a8ba6ff264d5e7e36a088615b3b6dd0','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:22.0) Gecko/20100101 Firefox/22.0',1374185761,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:12:\"xavieramoros\";s:5:\"email\";s:20:\"xaviamoros@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
	('6f93c2c41e6600d366d2b481c11c3af7','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373526856,''),
	('e61671aeae8ff731492eb78184f784ef','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373526858,''),
	('57b9a3f75d9444ac7017be7ee7912d16','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373526869,''),
	('d69d71cfc5de6311b4e854c12fc84a5d','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373526870,''),
	('a344d8384e538bd048741d0e19300f0a','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373526886,''),
	('610222003dd7f37c3e204d2c5eba1462','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373526887,''),
	('cbe71d4acd9d59cf6a61229db60dab2c','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373534313,''),
	('d5de010b6db69f5afbaa221306b22161','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373636136,''),
	('274cf262654f333a38b5ac3b4dd6958a','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373728042,''),
	('668fc8ddb713f240354d1a59cfa54871','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373728044,''),
	('014aca766f000eae8996b56f56ed5fa9','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373921519,''),
	('435d641a93b399c3df6f8cf4db8f67a5','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373921496,''),
	('6749ce4b91c97d66211376e794c42d87','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373921498,''),
	('ae1d6c57b0ccd8c77801cd020cb8a41e','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373921521,''),
	('1cde38459a6593da8c43bd7d5659d80c','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373921549,''),
	('13473d6584488d3571e2852965fa0151','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373921551,''),
	('3bad961b58b8e7a158b529cd46bf34df','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373921560,''),
	('2cd19f2b3715e643b89927cf327e5448','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373921562,''),
	('4ba92dc4ca01808bdbe44deb09659813','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373921623,''),
	('5178ccd54a6f08ce94eb00536824a394','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373921624,''),
	('97759c3076a94310a78eddb3a1101a49','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373921635,''),
	('a02ddfe411cdbe628df5ef618b3c643e','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373921637,''),
	('c1b44a004f481dc3a1bf5a5c19bd91ab','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373921810,''),
	('2c442de50b4fe348523eef0b77f29745','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373921812,''),
	('5b66f5d951f2ca3de68ad9534f8f861c','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373921876,''),
	('baa8952c3cc0ed66cffead39bb75f32b','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373921878,''),
	('04ade5d8b26e85c4bc7ebe72d0722c1d','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373921973,''),
	('b7cb9b38058d020eb076b96c151e52c6','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373921975,''),
	('1830982a1f9315d5d646e6684b362426','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373921987,''),
	('56219e6d506d396249e07121677b7acb','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373921989,''),
	('b8ccf4c2444eafaf78ceabacbce67982','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373922129,''),
	('17a406667942ee35f5b9afaee7b55fdb','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373922131,''),
	('29537227f7f4456799c3afb55dba1e57','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373922438,''),
	('1f49471a633a25fb802daee958c62bbd','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373922439,''),
	('0e2b58528ebd2d0aea743918641d33a0','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373922564,''),
	('a2092d14cb15da26da3d4385de902b6d','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373922565,''),
	('6d9333d1af53e04d85901eeff5fbd306','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373922569,''),
	('89e50f8fc778403435d41089c02ff156','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373922571,''),
	('6e049de1752153f5ec8715e32665efda','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373922577,''),
	('93f80629051b29ea015a22df4f05b0b6','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373922579,''),
	('74af754fc17d49c7892c8561bbcfa23a','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36',1373922584,''),
	('8f9ab7203b87316704b3aa4e9a376a7d','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373922775,''),
	('f6504200009a92244894b784c525fd54','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373922777,''),
	('0bc4c9be52f36bfb649ea99595f294d3','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373922785,''),
	('22737c87df3bc2f37f6d63d211915ddc','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373922787,''),
	('f3efd7c8b4941a99165d0ecf51b6dec0','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373922789,''),
	('8b4604a895d7411d1a88383d75ec5af8','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373922791,''),
	('57e8106926b8ae44fa98d76979844af5','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373922794,''),
	('892d8fdefe57fa62215390901eff19aa','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373922795,''),
	('a4d86604da5797f9dc0ce9c5e29c2ac5','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373924406,''),
	('852ebdb1cc2c144671f4f389080802b6','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373924408,''),
	('cd68b6608ee76211f222c098f557a442','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373924416,''),
	('d237743023a4e228727b01c240760f6b','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373924418,''),
	('4a9ffdcb1ee8d6b79209ce1a06c6642c','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373924420,''),
	('84d3a941c7e05bdac3f21350c2b2cb81','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373924429,''),
	('1296034cc2780745a2a8c527de2f29dc','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373925183,''),
	('a602b7645ce70845821605f08c7d727e','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373925185,''),
	('63840ef2c579091a636259889ba44299','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373925195,''),
	('2e3bea54cfacbe9dd0311cd26afde08f','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1373925196,''),
	('404ad09e4d9c206fa1236bc57d331241','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1373925202,''),
	('8961e02763d368a4fddfc60e43310d8b','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374186553,''),
	('782608fd1e3f4f965a77699388d621e0','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374232084,''),
	('c40cbf9aed9a55c4539ce985f211ab76','0.0.0.0','Mozilla/5.0 (iPhone; CPU iPhone OS 6_1 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10B141 S',1374670022,''),
	('ac1bfc348a01720c933e2d5f3e31a676','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:22.0) Gecko/20100101 Firefox/22.0',1374664165,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:12:\"xavieramoros\";s:5:\"email\";s:20:\"xaviamoros@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
	('aec272c753e95d3d77dcdc0bb7ef951d','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374232082,''),
	('d2c71e25ac2c5fda64e9b9bd6afb1095','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374663709,''),
	('04926a33e8403aebf45be149ccbca75a','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374663706,''),
	('626b91c7063e8e9a9e700232b77a6560','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374663715,''),
	('e72eade581c45dd1b3a4e39386841cf5','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374663717,''),
	('36e6ab66005ffbb2b187a8a0a4fdc348','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374663739,''),
	('6548d5ae700358e2e5cd673c7b837612','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374663743,''),
	('2bc7458147f8379ad3063f737133cb4a','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374663762,''),
	('9352f90f935900eb325e98bf62db0a29','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374663764,''),
	('6b1507811dcee8429ceb373fbfacefe7','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374663784,''),
	('86567613faf4bd52da16601ed7edbd9a','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374663785,''),
	('d03b98cf06e4a294d9ed2f2821dd4e9a','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374663903,''),
	('c04a0f8bfd8d5a67ee3e074b8314a856','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374663905,''),
	('41c02c25aadf56685a50dfe49673b2a7','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374663912,''),
	('f243e7c29c69d38acc50a1e8236ad054','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374663913,''),
	('f6ced82568aa1a87f86cb43c8a6b2fd4','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374663917,''),
	('942f7bbbaf250b155ef9ae43f9cf1b72','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374675957,''),
	('b72cd930ad3cda5db4b49425e4ddc1b9','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:22.0) Gecko/20100101 Firefox/22.0',1374664548,''),
	('11fa0fe63cb20b5cd98f481a9f9230af','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:22.0) Gecko/20100101 Firefox/22.0',1374836621,'a:6:{s:8:\"username\";s:12:\"xavieramoros\";s:5:\"email\";s:20:\"xaviamoros@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
	('f274dcc72e82c894616e76da60327ae2','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374678040,''),
	('15e6f0b31ffd783deb17959837361674','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374822003,''),
	('a6dcf792609560963991182f678e5c07','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36',1376496235,''),
	('ba21308943fcfc4ca258a6e8e3837d79','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374828552,''),
	('4a0fd08757c499a54c48e04b9931eb0d','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374828553,''),
	('c8e17d1e1623b4b4d48ee219c2576ed0','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374828667,''),
	('483f936490c46e9c4a3c8aa66188979e','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374828669,''),
	('ddc9f4973c5a1a1b9d652597118df496','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374828678,''),
	('e7115190ffa110cb3d57efc1035955e2','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374828680,''),
	('8c9c01f0f926ecfe95cd46a42dc8c6f5','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374829830,''),
	('92b5c78e0c06b405999771537e88587f','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374829832,''),
	('37433d8996ac3d0e13a1d48a9a08dc82','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374829985,''),
	('1b42b86e384ae9f8c601948a064bf0cd','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374829987,''),
	('b57600a24e896707c18f399b8b4c675b','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374830085,''),
	('bfbaa7daf6cf3bc3b469bca86c7c8c95','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374830087,''),
	('07880cca86ee79b512b49ac863319de4','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374830091,''),
	('1860fc9b0ef9e3ba37cfdcac8a7c09c7','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374830093,''),
	('c5935f75ab1488629206a2947a6a9bc5','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374830765,''),
	('2b640e241a6a745ca852f79758c65c38','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374830767,''),
	('77dad31847cc926169713ab0cf23e8ba','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374830772,''),
	('ff6d4eff309fe3fc86b8288346fa7ab1','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374830774,''),
	('570a25161c60980b0b943c36e0e9f031','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374830779,''),
	('5059a92f936e8fba0b50d1c68e547fc7','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374830780,''),
	('5ecb33577d125e462db0ff4253ca1cce','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374831614,''),
	('ae79d8e66ff71d3f696eb9b422035a74','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374831616,''),
	('bc3de8c798f672607ffb45c28206e690','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374831761,''),
	('c86d833f732a937ff963bc07b65cf690','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374831763,''),
	('f0cf6e25dc0131ba79c2b97a235bae59','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374831767,''),
	('6adff8f734199ede35d24e6e3a44b4de','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374831768,''),
	('8b5eb05f679b389bfed39af2ee571341','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374831792,''),
	('f8be919d49362e8ea6ce7073d3c9471b','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374831793,''),
	('cfa41e02384a9c08bfcb7c6fb2bd7e31','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374831813,''),
	('9e5536b6ab3471ec3331fcdb338395a1','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374831816,''),
	('39588677c836cdde9561113cf3487c9c','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374831821,''),
	('2f2fd89c931ca783264e348df65efba8','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374831823,''),
	('69c2e0e03c415a272962d88ce8991519','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374831832,''),
	('31d3d6f7acc9860e7080c9a493d14ee4','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374831834,''),
	('5bf324cca34a111410503e7826b07965','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374831840,''),
	('9e8fc77ea5db95b159113921be0f37d4','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374831842,''),
	('aba4f0b8068935ffffc2672a0082ab46','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374831861,''),
	('dc23fd6866a0e3e3ef2d2e5d66d4ce58','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374831862,''),
	('3ea9a36c1b9aa374b16d24e0370ca52f','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374831884,''),
	('c2f25155ec1fa8612e8e95583d3e2d4d','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374831886,''),
	('d7de49b0ae3b723b5b7d0fb6cc369c71','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374832035,''),
	('7191da49632717c3727bbb8188fac97d','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374832037,''),
	('f00da1bf50c7ec459ebcad25e2264689','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374832044,''),
	('67b2977e989bd58c18cb5fe2f6d5c16d','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374832045,''),
	('063cfc1645e140b78fcfc114e77191c4','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374832064,''),
	('ef9b65d6cf439fac2b0529feb2f6bae4','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374832067,''),
	('b2f8de1bd67ff478d5dd0a4a3aff9c43','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374832073,''),
	('f3304870d454f0227f3a51f6820cc5b1','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374832075,''),
	('f2bce0d53838b119de68580648a528d9','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374832083,''),
	('c5adffdede9bf9124f40c54e5bf722d1','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374832085,''),
	('1fd5b652e401a8eea638dedeb80e6aa9','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374832089,''),
	('0296ba807daad737ee583b6b38dc8c8b','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374832090,''),
	('8efd8a78c7794278fdca1c7fcfc184cf','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374832133,''),
	('4047557787f669754e16a34da4f1be6e','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374832135,''),
	('910ea65f60c8b3c9dd67774408c16ab2','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374832141,''),
	('27718c9b79be72c15e6285845b8057c0','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374832142,''),
	('ba38feab59dbdb23620ec70a01fbad91','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374832145,''),
	('acfd427181f838fb54baee4358c1b0d7','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374832147,''),
	('6d332906ce5733fb32af0925d94a1e61','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374832152,''),
	('4f57714cebbec13ca2e96057c9c625f3','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374832154,''),
	('39a6e4b1e324dff808a40a300de9c8be','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374832247,''),
	('5acef9a5e47217155df9f8bbbff8f5d2','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374832249,''),
	('909d086d7ba28c93452752b84ec4651a','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374832253,''),
	('942eccd852c86c57f5c18cc433e55e20','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374832255,''),
	('eea3fd4a2e86bcce4383009459ca96f5','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374832263,''),
	('b2db4cd728cd13302708c1a3c08a3633','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374832265,''),
	('a5caed8adb43d527f0d60e639125477a','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833080,''),
	('9d2f03a797a48003b752e7fb3bd604de','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833082,''),
	('920c2a899fc08500f9caaaf3cc1b6717','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833087,''),
	('f3c88ffbf9bc380494feb7993e4078fc','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833088,''),
	('fb2724dc9c337b954e06e2e3d9a05dc7','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833112,''),
	('34d8425ca4d557e0c0df1d7ee7ce1334','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833114,''),
	('ca213c7cbc2c4eee32d48019709cfb74','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833163,''),
	('6c44262484ba9fe6f478ca005eb5062d','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833165,''),
	('d048512f603fa7a9af447b4f8b85c473','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833176,''),
	('d5f748078b631ce9cc228ec0a8834cd4','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833178,''),
	('4432762890c8d9f06906c2e35614a5cb','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833207,''),
	('dc08997c4bef57a0afb2dddaa65216ee','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833209,''),
	('33accc09c246a693a6455edf01fdca69','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833211,''),
	('7ac0556632724927e023d1643a62267b','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833213,''),
	('3ffb84a91985915bdf9e6fcbc55a733a','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833219,''),
	('0c6f012ca4071933c98659970c177d27','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833221,''),
	('2fb1bd945ab560a25972057a8457a305','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833236,''),
	('830baef7ce9895bba20ecf03a1fd2c2d','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833238,''),
	('9a437d68b58412a8a3fbaf60fc8c318d','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833246,''),
	('de46ff85db9cd16877786e9adeb8a821','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833248,''),
	('2e4e5eb13b964617634f6fac85be3bcd','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833263,''),
	('d947ae86dfaead11780664e24e11a6fe','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833265,''),
	('7de7afcda0210cecbaff04fe9d7ae383','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833268,''),
	('331e82b516cbdca4f4d6a441bc723d2a','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833270,''),
	('b338f61650006a11fc8effc9689dec4d','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833277,''),
	('8c0456bcecc778766c06be77a402626f','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833278,''),
	('f0446db4b957fc78e08ca456ba3cc486','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833286,''),
	('2b441c2e4a860fb5853f8a6e7afb00f8','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833288,''),
	('033508d13ef16356aa08d7ddf6139132','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833295,''),
	('cc189a9e74eeb1dab08af0f717b01d3d','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833297,''),
	('c29fd0fab24523b14796ac393f0027c6','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833307,''),
	('57759589201e4d9fa7d25e078be03b09','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833309,''),
	('47efe17412b76e4b4ed7b5e83a1c0817','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833314,''),
	('a66c5c22ae1338f80ccd49f1499aa992','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833316,''),
	('f4ba44455895b9f81e08025582e23b89','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833324,''),
	('19dc95e4a46954fe76fc4fd0058766c6','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833325,''),
	('45e51fb9510de1df4205b2b82c5aec0f','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833335,''),
	('e765ea72279890c641dd31102b212b1b','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833336,''),
	('9a76ece378afeba21613a31c8d6c51af','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833349,''),
	('25167d7fca0a4bfc164049272894c6f5','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833351,''),
	('753caa408f8f138f7ae41d676e9497a9','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833355,''),
	('b63b21a6257009424b9181f21abb2d74','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833356,''),
	('f1d306f96b5a7e1f1aea93702ad5ca3b','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833359,''),
	('01a05bd684a2be8c74b147439a9e2de9','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833360,''),
	('c546ba764f65eae89b193b6744eb99f4','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833362,''),
	('020b6a3d311b8061e8b893eff8d8dcf9','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833364,''),
	('05ba44c0f6c4fbd57d325f3065885518','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833374,''),
	('c748910df48b166bc5e445045591d825','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833376,''),
	('36e4053682fb5348042d742e5766995f','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833420,''),
	('8ec4c1ab966dff940390c8484d3986e7','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833421,''),
	('5a5e561f57f592d1c4956f26b2a1531a','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833440,''),
	('fb5e469e4a671d34126fafde6d2be8d4','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833442,''),
	('b018fb267ab51b138c3b2dc4de66e19b','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833447,''),
	('8c3c79ad90b9ee73f26e31e999304775','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833449,''),
	('96246210749ba859f3d7bc9141b8da6e','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833456,''),
	('83ede4c79af24fcf5f5f1c7a81493a1d','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833457,''),
	('31b619a47b4926d1e27c3ca2b2fb2b68','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833467,''),
	('278f6d44c9b69c4877c77a6aa7f55e00','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833469,''),
	('33b1d23352d29c3137cc42976c145a12','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833480,''),
	('b7d14d0e989858d30932841b5ab597fa','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833481,''),
	('8312755a2e4f39c64319cf09077d6d4e','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833496,''),
	('e545abf3d4cfa77f04633ee068055c3c','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833498,''),
	('3550bc9b7ab0988696f27a695704e060','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833509,''),
	('bcf44eaee9fc2ff2fc63ee2b8d068041','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833511,''),
	('b042489036a081cffe2f863bbc2c5e5d','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833516,''),
	('a13596607c1f2de4c1221eafe232cf91','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833518,''),
	('312472bcb9897444373994cee4d86ada','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833566,''),
	('daff0d2df06d31ca2d0138d7fbb9958c','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833568,''),
	('6b9f920660f22165aedc8eb3e6f06e7b','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833574,''),
	('7cfadd3d09972836efc53ca31ee21404','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833576,''),
	('72ca78c934bd900cf11a841569976dcd','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833585,''),
	('57bed53cff749ab9546c749e227fafb4','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833587,''),
	('e9fcc7154612a81aa09da4d6d9830757','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833598,''),
	('479d3edc3b8b29fe8fd808c936a5e046','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833600,''),
	('fe5369317ae5f8b3f7a6f626c0bc5962','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833728,''),
	('152661fb873bbdb67683de78cfdabc82','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833730,''),
	('1bc98d6f4bf5d00c56eb3f800b1e7763','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833750,''),
	('88b8f5be1054251ffa4e2a3b9a2feb3b','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833752,''),
	('2673b6c350fec5e4455bd513b4ee153a','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833757,''),
	('17849332cad65a1f351d01974c634a3c','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833759,''),
	('77f2249f3c306bb5f99fb3f3fd40b1e9','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833770,''),
	('32a3476ca35907aaf963e8dd550aa69a','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833772,''),
	('d9e0c07c78956eb8cee1dd728b731e89','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833781,''),
	('a0cca8f90acda52b6320b4b8f23f9f02','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833782,''),
	('46a92ca5df19a2af373208b4877c4b26','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833789,''),
	('efc6579355b2bed4f4fc5285451ac367','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833791,''),
	('9dfd22905f5f3587dbf416abce986e28','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833803,''),
	('e43e4389acbd2daa1ec22d88e29646ec','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833804,''),
	('360f04dfe1df0d95112135b647880670','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833828,''),
	('4615e277a7e3b02df9ae597eb9c9bc15','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833829,''),
	('ffe57277f89663d49e469102546a431d','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833832,''),
	('0ae5ecc281bc5d58b3c33726ae66e478','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833833,''),
	('04d38d8e9ef2ea0028dbb33fed58a8a3','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833838,''),
	('d73b33385cb382a23699115ea6ae976a','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833839,''),
	('06f17011af55f7958bd210147d096927','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833857,''),
	('e71fcb7b13a1c5013254f584dd840eec','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833859,''),
	('993d61af201ac73d3562c482f1b43eaa','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833866,''),
	('631a89ba6192e5ccd9c2111ce94ad541','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833868,''),
	('b10c1833ae2b49ca2cdaf76baba548f5','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833882,''),
	('0a94738ee58f61b5608833aea3d281b1','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833883,''),
	('dcd5c164ac64f2ff6a9b7aafb31dd8a2','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833899,''),
	('5f1cfc64d4a67b95338dbf47b444082f','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833901,''),
	('e494f4a59af1599d853c99a671fa62bd','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833980,''),
	('2a0405ea939252a9a3e4bdd28f98cfe0','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833982,''),
	('4334cedcb6743623ff30742fc848889d','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833988,''),
	('35589758c47b7db96a85558bd4d6e1f4','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833990,''),
	('3f7ffbb9675b978381df5b2ef3e09753','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374833997,''),
	('54ae013eb38eedf496a25465ea62adef','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374833999,''),
	('dfa6efd6624117633380050ee1c2e64e','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374834006,''),
	('00b38c2ce3b39d4c18c9f78ca00c1c48','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374834007,''),
	('a9ba04873d56bff07f1132f2dfb75f4b','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374834011,''),
	('6aa36a290c5ec3d47971da087cd6bb87','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374834012,''),
	('f4ce5032890e9b2fcb5ff3e9720a77c1','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374834014,''),
	('26b760dc31df706b0d839ef2e0256f13','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374834015,''),
	('67a8f4914180cd56af27ed6d422a9542','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374834065,''),
	('97217abfdb7ac73df3e31a7bbd5499be','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374834066,''),
	('220699a87e069ec1af1560ff1f8c12a4','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374834071,''),
	('ccfb32b76732bb48e84dd893f9567255','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374834073,''),
	('8efd0c03a3b904387b4b36ffd0cff0ab','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374834481,''),
	('17596eb056d875a2f994116bbb5da69d','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374834482,''),
	('a97dbf596d1914192550b10abc83445a','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374834485,''),
	('d2b68240130ab4795229e97f395095f5','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374834487,''),
	('8b9bf56215acaacde2ea77322d668307','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374835083,''),
	('86dfbb8b9de47b614d1db5dadd208113','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374835085,''),
	('89854fb9e4c42b4ac231e26da4472bf1','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374835094,''),
	('7024e199f9c8519748e3c2d40c6ec21a','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374835096,''),
	('d74fa52816193771a467d33a45f98dcb','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374835111,''),
	('ff8b8b2474eca09d043ee18c8e1caf5f','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374835113,''),
	('176281b5982480edbfe1f19a29c78199','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374835117,''),
	('9d6e4e280639a0060d52b306f3250d55','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374835119,''),
	('7b5ed5a6d0f2b76c89c9fa1c3a1b4ca2','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374835130,''),
	('eee67800d74aec67516c9f8cb8772894','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374835132,''),
	('3f21ffc8bcc661ae06477b4121a73352','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374835161,''),
	('fa33b875bc1c1364521dbd9478ceba8a','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374835163,''),
	('dfe75f8631deed59b36bc7e5573f1e01','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374835187,''),
	('a6c3c7181704a919b5b26d88b5cfcca7','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374835189,''),
	('746cccd9308362fb6d4bd7e3a265642b','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374835209,''),
	('1404d9da2aa0762674f6bf1df5ff85f1','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374835211,''),
	('951df9124b06d59e8ceb15adfe801eeb','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374835214,''),
	('b686286fd226551d5ffdada184039a6b','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374835215,''),
	('95e11669c7beeda4d57b35e4a7080920','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374835233,''),
	('6200ca78d85dd00b1827dcb1253611ee','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374835234,''),
	('96301825b89c90b74477212e6e5ed77d','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374835240,''),
	('0ecf9414a56ab0aa9eaa58a1133aebec','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374835242,''),
	('8492000a187bd7b6396cf9e3c3dd5da1','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374835590,''),
	('3bc72b9b4221c2b31f936f795db96cfb','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374835592,''),
	('ecdc2343449fb6a5e686c95f16d18c9d','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1374835594,''),
	('c74e632b0791110cf5050e95815dbcb1','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1374835596,''),
	('84efaf0f1fcba4fb0afccea6dfa62f41','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:22.0) Gecko/20100101 Firefox/22.0',1376493134,''),
	('4639cffa97e0d7d8bfb48431bd78df37','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:22.0) Gecko/20100101 Firefox/22.0',1376512986,''),
	('9c86e15118d12045f0c83dc196a57e28','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376494677,''),
	('b11d287c017cf069fc3e032930f79c9a','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376494679,''),
	('403d13961c014d61bfefbc7836fa87ee','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376509400,''),
	('852fb54cf818adc19bb290d7d6a4b4cb','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376509402,''),
	('4b8db6143f35c8f6902c8ef42d79c29d','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376510817,''),
	('b1dc312ec1e72dcfa4734fc92c1d80d1','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376510819,''),
	('029ce789198e38c958bd35ce74ea77bd','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376510830,''),
	('54bee0eb54f9876e6d3317971604f8d7','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376510832,''),
	('464e91802078ebaf14925ea44a13e554','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376510838,''),
	('e3ae4e18e198ab7e84bd48bcb1c07df3','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376510840,''),
	('33716f1df989cf97c009df9e99e8e7ea','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376510890,''),
	('89fad3a227ea62c879edc01d9325b8f2','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376510892,''),
	('919325e0e6ae49fbc51f6e5b78847791','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376510941,''),
	('d0201320a0525404c0f20fcc74f3b9f7','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376510942,''),
	('10895abb19b511e4a18a042ca6654897','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376510961,''),
	('b8fd6076d7bc2bcf0b5dc78570c43332','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376510962,''),
	('c3ced74131dcf75a1910df49bbccd64c','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376510983,''),
	('67c3c9bad97a7914fc178c5e278af7e7','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376510985,''),
	('0e75c82d1db575bfa6587bdd38e860ef','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376512135,''),
	('c4759005ce9aef40f90bb9599cbfc6b7','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376512137,''),
	('58523a3db772d8e23cab6c2e4f497bc7','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376512146,''),
	('f730f4af22f3adac164675af0c72a95f','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376512148,''),
	('543a2f403d8f2eab0971948b3be29952','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376512152,''),
	('470553d0f24f4fefe82b83ad9d74d4b0','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376512154,''),
	('a381514a295fcd4290f2b7a2c9e5fa8a','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376512165,''),
	('ae548564b347872995c862ad96c7b173','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376512167,''),
	('c1c5ea505ebc79b428978d03dee0dc53','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376512169,''),
	('1ff3924d3bf6b96d4549cb86e47effd1','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376512170,''),
	('e4bc0a0081961e6f885b156ec44a6272','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376512172,''),
	('c2c72b422bd303398830e66671723b34','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376512174,''),
	('fadaa1e66a7ac86829385cb2c1094edb','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376512178,''),
	('0e41a2cfa2019c8732da433d258e755a','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376512179,''),
	('5013ca5d120687e8a4a2fcfcd5d16d92','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376512207,''),
	('b442c1b7f29a49f67f7c518299e62d0f','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376512209,''),
	('db0fb08f9a82b9c246dba0834f10b26f','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376512211,''),
	('3d53ea9d8cb206a2fc6c4e6315aa5db6','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376512213,''),
	('4796ac178ed13875c7840dd2a0b2c5a1','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376512216,''),
	('98629e023433190a50558f75eb095ba5','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376512217,''),
	('980e8d5c212556624f281ccb8eb36b9d','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376512262,''),
	('00610d01983833f23b56958be90fa67a','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376512264,''),
	('b24ca525b2fc38d290867074f5d8a58f','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376512271,''),
	('de40363f1e499d320d446f68c29ae50c','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376512272,''),
	('949290b3736f5e6372fcd38b72d89928','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376512282,''),
	('3943141bd455f324cc57e0ede4ccc51a','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376512285,''),
	('a386022b312961092fbd342206858643','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376512296,''),
	('4efb3dde7d00007950cf8a83a4877506','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376512298,''),
	('6632ee2843917aee33dacec981f63da7','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376512318,''),
	('2f58083f1c0ba0038842c8f09663fd0f','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376512319,''),
	('06e3ce739f905670b170d34e99ae8f91','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376512328,''),
	('2c065ef69527bc471f8f57735762940f','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376512330,''),
	('83e800a16dbbbd1dc4bda753e0feb10d','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376512335,''),
	('e05fdfbe8381fcbe7933c7a3e8d52baa','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376512336,''),
	('3a9d694d900e512c5badb1736a94312e','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376512712,''),
	('38f24fb8597bd7246b1e3a4940dfe718','127.0.0.1','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376512713,''),
	('6afcef09638da5fd7251d007a6d3409a','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:22.0) Gecko/20100101 Firefox/22.0',1376513037,''),
	('3bfd24620f8f2548c414102faa0e753a','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376513164,''),
	('e0cd46761be20c475d33090df21b8b78','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376517317,''),
	('4c8dba8a5ebf023d6ab4476bd8684d10','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:22.0) Gecko/20100101 Firefox/22.0',1376584078,'a:6:{s:8:\"username\";s:12:\"xavieramoros\";s:5:\"email\";s:20:\"xaviamoros@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
	('afcd98c64ec669e1b2a38942f9e356a1','127.0.0.1','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376517325,''),
	('29c092e7113afc8591cb961f1139451d','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376518213,''),
	('4967bab767ae71201a2b16143de13154','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376518214,''),
	('39b1c021f770a325056b401f71112bf1','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376518228,''),
	('d3589c8f98926c8e7ae536552423763c','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376518230,''),
	('b58680b080f12879372d9edda48b3d1d','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376518234,''),
	('7ebffe0798731647e33140f195461c0d','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376518236,''),
	('0a63974bce5005cd4a821364755c06fe','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376519316,''),
	('ddb83ba4cb1a6cd93dbbf501a8154136','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376519318,''),
	('98c1c322cbd64a16d815028bcf521c6e','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376519362,''),
	('f90e3a067850716910e3fc633d1ed844','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376519363,''),
	('4784db04685105c78f0f131905a9d2dc','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376520881,''),
	('8bae6ef7b9ce2d2288d397c71eb6bf4a','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376520883,''),
	('08672f3bcd14ff296656970cd01b9f7b','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376520891,''),
	('16cd7353a302aea80d8d8b4f020cbc00','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376520893,''),
	('5cd03ec416a2ad083834ef3b7b9de429','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376520896,''),
	('e65be110cfdd4204fe3f88dacb5c4af0','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376520898,''),
	('a8eb7fe2682de026d8872ef2c61c39ef','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376521036,''),
	('68a05bb420cf5fc6188b923dfc7b5713','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376521037,''),
	('fcd323c4447fb4b3621dceed607a7318','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376523455,''),
	('26cd8d0a0e90a951d41b5583a645af6f','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376523457,''),
	('91adb7d9f806800519b7dd6adde7c0c7','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376524522,''),
	('1fa57737dd8c5dea5bfcc239fa931282','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376528178,''),
	('6a3dff87c5b390a02e893e31db443f18','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376528287,''),
	('b5122ae8927ac66ec9ee3fc696fac1d1','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376528968,''),
	('c2071c93bb502b43b9507da4f2bf3476','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376529341,''),
	('82004dfaede8540aedb8a48c4ee6b34d','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376529343,''),
	('0f0d0cd4935d707f3ca1861260a5bc6f','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376529346,''),
	('96945055452f68f11a1aaef133c57fd5','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376529348,''),
	('509e49b3c0505bbfda8d5c8a42d19340','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376529714,''),
	('b502d479b86f660f6203ed76350d932b','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376529715,''),
	('5c9b853221fba16b5802805a34799109','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376529724,''),
	('63e0bce385f46fa7ef2666e6f4622eb8','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376568446,''),
	('4249dd19749edb1063cc437de1974c1d','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376576176,''),
	('fadf799a87b4dfddbc5b3bec677a364a','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376576178,''),
	('f346af9c06264f7fb29749ae8dee37c1','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376576187,''),
	('ebc0d18f0e821d4a6148d9e48c9f9700','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376576188,''),
	('721b81664e822b80f3bb9d759a888838','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376576190,''),
	('8c4e269ccf27ca2e8440622a6406a05f','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376576192,''),
	('2da2e237fe900e10f69908ed2cdd8bc7','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376576194,''),
	('18e12b6ed362127bde18f536409cdd87','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376576196,''),
	('0426c607132848dc8379128085becf30','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376576204,''),
	('39035a81666e0e604e13a1b0ad334409','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376576205,''),
	('b4bf0acc9657f274dc73f961c230e15f','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376576209,''),
	('4a8c964df9451be355bdf5324beae541','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376576211,''),
	('2b41366d0b45b82400f9dbcbc95b4497','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376576224,''),
	('cb3c85d07a688536d3b4667354fe2da3','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376576225,''),
	('348e7d0529537cdc549cdfc797961412','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376576229,''),
	('36d6b5fd42e889d2c0c40c089ae9706f','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376576231,''),
	('9b451a19e768899cd2875984dde8fbf0','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376576578,''),
	('32f2ff28fb268e7f4da9d058ce51c1b5','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376576580,''),
	('c6d1fadbf6524ca1cb2d108382acfcd9','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376576592,''),
	('4b4d284edab3c9e6e103fcf5be37afaa','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376576594,''),
	('7f1f0621a6db62838b61e04604d69dd3','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376576601,''),
	('34fa9d3f43556e127b3ab363452edef1','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376576603,''),
	('88cb396ff71ca2359cea062a2e2edf50','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376576608,''),
	('33b7be8726d0db163259ddb7c7cd0a22','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376576609,''),
	('9ac5ebc5e49547be9df4af38fccb65bc','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376576624,''),
	('0b9c3eec44f4d1135a989927770bb9f7','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376576626,''),
	('938eb4a2ef59e93f523499cec543448a','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376576636,''),
	('71debff04589ae5661684aa7751254c1','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376576637,''),
	('72956e03c8f2cb22dba274263ffc3ce7','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376577230,''),
	('b694d28b69e2cd52dace76a0440a2d27','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376577232,''),
	('91e191c5a44978117a664ca48e48325f','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376577238,''),
	('5dd8f7b4f2449b9d714a807612e8ade4','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376577240,''),
	('4d3cb6bc7840019d07b6ddf14c7285f2','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376577242,''),
	('36f65d936c7c7342bdb4325e4a86f2e8','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376577243,''),
	('86214f874a9e6b551f32154ff001164f','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376577252,''),
	('a70054ad66708008596cb8fa77298ec3','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376577254,''),
	('72b5a39bbc25749b1dabda91e312626c','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376577272,''),
	('1b0603f83b76d49e1010beb0dfdbd59f','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376577274,''),
	('f366efa96fadfb9f4f87ba5dc8c7eac1','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376577277,''),
	('007b7384a45331bfc4c2d52e187d4610','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376577278,''),
	('e1d6e83600bda263e18a776c182f50d7','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376577282,''),
	('86668e53c1260da9a143bb3734068c81','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376577283,''),
	('4587e006003e4cedd8394ce767abf86f','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376577336,''),
	('9d357a9756f1cf0b04b4a46a4aef9527','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376577338,''),
	('8f3b830cfccf04b26ec91e4e2aef17fd','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376577348,''),
	('76b48061019b1e517928e084af3a54db','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376577349,''),
	('0e062d3450bdfdf0204470ef5178ef71','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376577352,''),
	('82747d5ba3044e293d99bde60cc21163','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376577353,''),
	('6a5ec36634d71144069f155e6d634a6b','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376577375,''),
	('563a9f38de0145652b018f445f69ea5f','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376577377,''),
	('68663af8dfef32ce0a6cb75a4b027621','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376577910,''),
	('4fccd5f63054f54d37051ca1aad05af4','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376577911,''),
	('7ebc4f5ec519d6149a6d93530d20b474','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376577914,''),
	('5bc572eedb185e36a2d02707345228a9','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376577916,''),
	('95cd8690856c22817679a7ca15932fed','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376578459,''),
	('c9729a05fb2117022d8de13a27017120','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376578460,''),
	('ba3f9b1f89e78a2f57a32b5ea0a51773','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376578462,''),
	('f6cbcd65d7ffeb1c90cf0794f05d336f','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376578464,''),
	('ff310b89b832f082ad4b77028594a81a','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376578626,''),
	('6343d27b991209b8cddc6138740c421e','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376578627,''),
	('181fa2549395cc8a994da18a38843eb6','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376578636,''),
	('6d9eaf498a98f9df0a3d773ab551f5b5','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376578638,''),
	('2593663c080304e0ee965605f54e1bbb','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376578674,''),
	('0d606762e4ff706efd526f87bc557d32','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376578676,''),
	('b617c222163405714f2d4d5eef0b585a','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376578692,''),
	('ab506ce43234c23a33888817b22c1232','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376578694,''),
	('83ad6758d7d465faf2c8c1d0c7251254','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376578826,''),
	('1cd47d7b90b78a508d5ffa9b086effb5','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376578827,''),
	('ceb93783b49ca7e0c1de8b0a27c8d7c6','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376578859,''),
	('b0d576393c963e0f3d93cbb22226de46','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376578861,''),
	('7dd013d848f560c7960b9add6939dad0','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376579071,''),
	('275471561aa28ca094dbeb6424a369f2','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376579073,''),
	('3ef1f2d26b16cd5084187ed37c1bad5c','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376579076,''),
	('94f59a5b751e00f2863b91325bbfb66c','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376579077,''),
	('a30df3b853a991059444a78d2530fe4e','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376579083,''),
	('c05d23acb5cf69785f1c442a0d014506','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376579085,''),
	('48f4f4a2279521ba06460140d43d00f9','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376579230,''),
	('ab63544ea42aae2561dc049a7d60eeff','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376579231,''),
	('997846bd6a477e39208d109f0a5c5556','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376579253,''),
	('512a1d388483d326617c746a40c0d6db','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376579255,''),
	('e8eb05eafea7915aebb05529f5de2a79','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376579312,''),
	('c867e4e4710ccf119e7990460cf9b521','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376579314,''),
	('bf4606723e586d8df473630c4dbf5253','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376579321,''),
	('68e6d3b3b422c1370b8565767653fa38','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376579323,''),
	('08f96f7f09a9730c22cbc287683e543c','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376579377,''),
	('464dfb0723139ef06c2105d57db94100','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376579379,''),
	('db69a30b4662c5e7b7c6828d3d703889','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376579381,''),
	('46108522c2b8f02b2bdb2c8ac8f490e0','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376579383,''),
	('e7dec7e6fa5b46c164b577c81b8a06d1','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376579391,''),
	('3dd0af0032d9261c2200ca3a80e3384e','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376579392,''),
	('c644435a5c56076d3ecc1ae8c29532e6','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376579402,''),
	('05660530744044520115ab2ec27aade5','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376579404,''),
	('d7ff20cb9781db7f44656844da01fc98','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376579445,''),
	('69a351c2b338d46f4996bbd04f1c2042','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376579447,''),
	('b4134adc9da5e80ec234baf9e97de163','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376579549,''),
	('de1595f44837ad724716a5bfe1836e8a','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376579551,''),
	('c56f4a5a141875282e8e016ec289bec3','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376579556,''),
	('e682153676762d264640db01933fb0ea','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376579558,''),
	('8130eacbc84e86a7c380adf6f9693f6c','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376579579,''),
	('2e501883d783361268ea43d275adcedf','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376579581,''),
	('53d74d47c62c72470de268578819b132','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376579586,''),
	('57e7d35b780964045af7bf24abbe90bb','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376579588,''),
	('870c1e9f8ad26398ad22ee001598ec23','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376579610,''),
	('eee6c40c93d39b84e5b76756808cc0aa','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376579611,''),
	('c2227df7de6c51224652345d1a4a9be5','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376579655,''),
	('2fdc341a28fc47f9dab6c4fa34f4a035','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376579657,''),
	('12c3c7b538d0b34f73fabe8c683c11d0','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376579759,''),
	('ef866e4fbcb83b1c3002faa9b0f1b28a','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376579760,''),
	('a1429bddf2a54a579243f195292ae66d','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376579765,''),
	('e678cff4f89aff7283dfaaaae7befe3c','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376579767,''),
	('30d1685d56e8830bcc5b1f263c71257a','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376579985,''),
	('573da9f580d787c943d72816140653c4','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376579987,''),
	('68d1348ca999c7853ee30861dd9fce8d','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376580065,''),
	('05c2963c92711917c80c85c9ad573153','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376580067,''),
	('fa077599d197ed7d5f13b1839e5a7d39','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376580093,''),
	('912d0a0d99694ac71240dbd7f797a008','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376580095,''),
	('3651d2cd6b0805220ece0f8b2c4664b7','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376580100,''),
	('86267a55552e7bb30d6079615b796549','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376580101,''),
	('671aa4ffaf17dd15342c64a6ccf8cc7d','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376580295,''),
	('6096192afd48f5e08495e68d60028c3a','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376580297,''),
	('cdd783db1e57a43768f74d53d860a326','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376580317,''),
	('e71e129227c46263668736a34ed011f2','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376580319,''),
	('95666d5d4376d82ef8bf3f90881c160e','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376580346,''),
	('4ce1bfc95097afc5c789fdd6d3f5a051','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376580347,''),
	('e20839f569503175b1220de683111307','0.0.0.0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko)',1376580409,''),
	('5fad2fd0707aa98b00c8a0b3bb18fd24','0.0.0.0','Coda/3057 CFNetwork/596.3.3 Darwin/12.3.0 (x86_64) (MacBookPro8%2C2)',1376580411,'');

/*!40000 ALTER TABLE `default_ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_comments`;

CREATE TABLE `default_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` int(1) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `module_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `created_on` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `default_comments` WRITE;
/*!40000 ALTER TABLE `default_comments` DISABLE KEYS */;

INSERT INTO `default_comments` (`id`, `is_active`, `user_id`, `name`, `email`, `website`, `comment`, `parsed`, `module`, `module_id`, `created_on`, `ip_address`)
VALUES
	(1,1,1,'Xavier Amoros','xaviamoros@gmail.com','','Testing comments','<p>Testing comments</p>\n','event','1','1361287415','127.0.0.1');

/*!40000 ALTER TABLE `default_comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_contact_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_contact_log`;

CREATE TABLE `default_contact_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `sender_agent` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sender_ip` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sender_os` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sent_at` int(11) NOT NULL DEFAULT '0',
  `attachments` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table default_data_field_assignments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_data_field_assignments`;

CREATE TABLE `default_data_field_assignments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `is_required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `is_unique` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `instructions` text COLLATE utf8_unicode_ci,
  `field_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `default_data_field_assignments` WRITE;
/*!40000 ALTER TABLE `default_data_field_assignments` DISABLE KEYS */;

INSERT INTO `default_data_field_assignments` (`id`, `sort_order`, `stream_id`, `field_id`, `is_required`, `is_unique`, `instructions`, `field_name`)
VALUES
	(1,1,1,1,'yes','no',NULL,NULL),
	(2,2,1,2,'yes','no',NULL,NULL),
	(3,3,1,3,'no','no',NULL,NULL),
	(4,4,1,4,'no','no',NULL,NULL),
	(5,5,1,5,'no','no',NULL,NULL),
	(6,6,1,6,'no','no',NULL,NULL),
	(7,7,1,7,'no','no',NULL,NULL),
	(8,8,1,8,'no','no',NULL,NULL),
	(9,9,1,9,'no','no',NULL,NULL),
	(10,10,1,10,'no','no',NULL,NULL),
	(11,11,1,11,'no','no',NULL,NULL),
	(12,12,1,12,'no','no',NULL,NULL),
	(13,13,1,13,'no','no',NULL,NULL),
	(14,14,1,14,'no','no',NULL,NULL);

/*!40000 ALTER TABLE `default_data_field_assignments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_data_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_data_fields`;

CREATE TABLE `default_data_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `field_slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `field_namespace` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `field_data` blob,
  `view_options` blob,
  `is_locked` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `default_data_fields` WRITE;
/*!40000 ALTER TABLE `default_data_fields` DISABLE KEYS */;

INSERT INTO `default_data_fields` (`id`, `field_name`, `field_slug`, `field_namespace`, `field_type`, `field_data`, `view_options`, `is_locked`)
VALUES
	(1,'lang:user_first_name','first_name','users','text',X'613A313A7B733A31303A226D61785F6C656E677468223B693A35303B7D',NULL,'no'),
	(2,'lang:user_last_name','last_name','users','text',X'613A313A7B733A31303A226D61785F6C656E677468223B693A35303B7D',NULL,'no'),
	(3,'lang:profile_company','company','users','text',X'613A313A7B733A31303A226D61785F6C656E677468223B693A3130303B7D',NULL,'no'),
	(4,'lang:profile_bio','bio','users','textarea',X'613A303A7B7D',NULL,'no'),
	(5,'lang:user_lang','lang','users','pyro_lang',X'613A313A7B733A31323A2266696C7465725F7468656D65223B733A333A22796573223B7D',NULL,'no'),
	(6,'lang:profile_dob','dob','users','datetime',X'613A343A7B733A383A227573655F74696D65223B733A323A226E6F223B733A31303A2273746172745F64617465223B733A353A222D31303059223B733A373A2273746F72616765223B733A343A22756E6978223B733A31303A22696E7075745F74797065223B733A383A2264726F70646F776E223B7D',NULL,'no'),
	(7,'lang:profile_gender','gender','users','choice',X'613A323A7B733A31313A2263686F6963655F64617461223B733A33343A22203A204E6F742054656C6C696E670A6D203A204D616C650A66203A2046656D616C65223B733A31313A2263686F6963655F74797065223B733A383A2264726F70646F776E223B7D',NULL,'no'),
	(8,'lang:profile_phone','phone','users','text',X'613A313A7B733A31303A226D61785F6C656E677468223B693A32303B7D',NULL,'no'),
	(9,'lang:profile_mobile','mobile','users','text',X'613A313A7B733A31303A226D61785F6C656E677468223B693A32303B7D',NULL,'no'),
	(10,'lang:profile_address_line1','address_line1','users','text',X'613A303A7B7D',NULL,'no'),
	(11,'lang:profile_address_line2','address_line2','users','text',X'613A303A7B7D',NULL,'no'),
	(12,'lang:profile_address_line3','address_line3','users','text',X'613A303A7B7D',NULL,'no'),
	(13,'lang:profile_address_postcode','postcode','users','text',X'613A313A7B733A31303A226D61785F6C656E677468223B693A32303B7D',NULL,'no'),
	(14,'lang:profile_website','website','users','url',NULL,NULL,'no');

/*!40000 ALTER TABLE `default_data_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_data_streams
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_data_streams`;

CREATE TABLE `default_data_streams` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `stream_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `stream_slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `stream_namespace` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stream_prefix` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view_options` blob NOT NULL,
  `title_column` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sorting` enum('title','custom') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'title',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `default_data_streams` WRITE;
/*!40000 ALTER TABLE `default_data_streams` DISABLE KEYS */;

INSERT INTO `default_data_streams` (`id`, `stream_name`, `stream_slug`, `stream_namespace`, `stream_prefix`, `about`, `view_options`, `title_column`, `sorting`)
VALUES
	(1,'lang:user_profile_fields_label','profiles','users',NULL,'Profiles for users module',X'613A313A7B693A303B733A31323A22646973706C61795F6E616D65223B7D','display_name','title');

/*!40000 ALTER TABLE `default_data_streams` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_email_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_email_templates`;

CREATE TABLE `default_email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` int(1) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_lang` (`slug`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `default_email_templates` WRITE;
/*!40000 ALTER TABLE `default_email_templates` DISABLE KEYS */;

INSERT INTO `default_email_templates` (`id`, `slug`, `name`, `description`, `subject`, `body`, `lang`, `is_default`, `module`)
VALUES
	(1,'comments','Comment Notification','Email that is sent to admin when someone creates a comment','You have just received a comment from {{ name }}','<h3>You have received a comment from {{ name }}</h3>\n				<p>\n				<strong>IP Address: {{ sender_ip }}</strong><br/>\n				<strong>Operating System: {{ sender_os }}<br/>\n				<strong>User Agent: {{ sender_agent }}</strong>\n				</p>\n				<p>{{ comment }}</p>\n				<p>View Comment: {{ redirect_url }}</p>','en',1,'comments'),
	(2,'contact','Contact Notification','Template for the contact form','{{ settings:site_name }} :: {{ subject }}','This message was sent via the contact form on with the following details:\n				<hr />\n				IP Address: {{ sender_ip }}\n				OS {{ sender_os }}\n				Agent {{ sender_agent }}\n				<hr />\n				{{ message }}\n\n				{{ name }},\n\n				{{ email }}','en',1,'pages'),
	(3,'registered','New User Registered','Email sent to the site contact e-mail when a new user registers','{{ settings:site_name }} :: You have just received a registration from {{ name }}','<h3>You have received a registration from {{ name }}</h3>\n				<p><strong>IP Address: {{ sender_ip }}</strong><br/>\n				<strong>Operating System: {{ sender_os }}</strong><br/>\n				<strong>User Agent: {{ sender_agent }}</strong>\n				</p>','en',1,'users'),
	(4,'activation','Activation Email','The email which contains the activation code that is sent to a new user','{{ settings:site_name }} - Account Activation','<p>Hello {{ user:first_name }},</p>\n				<p>Thank you for registering at {{ settings:site_name }}. Before we can activate your account, please complete the registration process by clicking on the following link:</p>\n				<p><a href=\"{{ url:site }}users/activate/{{ user:id }}/{{ activation_code }}\">{{ url:site }}users/activate/{{ user:id }}/{{ activation_code }}</a></p>\n				<p>&nbsp;</p>\n				<p>In case your email program does not recognize the above link as, please direct your browser to the following URL and enter the activation code:</p>\n				<p><a href=\"{{ url:site }}users/activate\">{{ url:site }}users/activate</a></p>\n				<p><strong>Activation Code:</strong> {{ activation_code }}</p>','en',1,'users'),
	(5,'forgotten_password','Forgotten Password Email','The email that is sent containing a password reset code','{{ settings:site_name }} - Forgotten Password','<p>Hello {{ user:first_name }},</p>\n				<p>It seems you have requested a password reset. Please click this link to complete the reset: <a href=\"{{ url:site }}users/reset_pass/{{ user:forgotten_password_code }}\">{{ url:site }}users/reset_pass/{{ user:forgotten_password_code }}</a></p>\n				<p>If you did not request a password reset please disregard this message. No further action is necessary.</p>','en',1,'users'),
	(6,'new_password','New Password Email','After a password is reset this email is sent containing the new password','{{ settings:site_name }} - New Password','<p>Hello {{ user:first_name }},</p>\n				<p>Your new password is: {{ new_password }}</p>\n				<p>After logging in you may change your password by visiting <a href=\"{{ url:site }}edit-profile\">{{ url:site }}edit-profile</a></p>','en',1,'users');

/*!40000 ALTER TABLE `default_email_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_event`;

CREATE TABLE `default_event` (
  `id` varchar(26) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category_id` int(11) NOT NULL,
  `attachment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `comments_enabled` int(1) NOT NULL DEFAULT '1',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `type` set('html','markdown','wysiwyg-advanced','wysiwyg-simple') COLLATE utf8_unicode_ci NOT NULL,
  `preview_hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `location` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `start_date` int(11) NOT NULL DEFAULT '1577840461',
  `end_date` int(11) NOT NULL DEFAULT '1577840461',
  `address` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `organizer` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `organizer_link` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `price` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `event_link` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `default_event` WRITE;
/*!40000 ALTER TABLE `default_event` DISABLE KEYS */;

INSERT INTO `default_event` (`id`, `title`, `slug`, `category_id`, `attachment`, `body`, `parsed`, `keywords`, `author_id`, `created_on`, `updated_on`, `comments_enabled`, `status`, `type`, `preview_hash`, `location`, `start_date`, `end_date`, `address`, `organizer`, `organizer_link`, `price`, `event_link`, `language`)
VALUES
	('0tcgrgk7frr4nq11i5vb1gvhts','TechMeetups Startup clinic - Barcelona 2013','',0,'','For details, link here: http://startup-clinic-barcelona-2013.eventbrite.co.uk','','',1,1374874006,0,1,'draft','wysiwyg-advanced','','Barcelona - Spain',1386266400,1386277200,'','','','','http://startup-clinic-barcelona-2013.eventbrite.co.uk',''),
	('511s381v9m126cbt04s6df66oo','Summit | Forum Series','',0,'','For details, link here: http://summit-forum.eventbrite.es','','',1,1374828640,1376583463,1,'live','wysiwyg-advanced','','Antiga Fàbrica Estrella Damm - 515 ',1380175200,1380222000,'Carrer del Rosselló - 08025 Barcelona - España','','','','http://summit-forum.eventbrite.es',''),
	('6corsju64e5kq478mdh2k3q7t4','Lateral Thinking & Innovating - 1day summer workshop','',0,'','Brainstorming for (Business) Success!\nSaturday, July 27 at 10:00 AM\n\nWanna travel \"out of the box\" for one day? Just in one day you will learn and develop your Lateral Thinking & Innovation skills and expertise while pl...\n\nDetails: http://www.meetup.com/Brainstorming-for-Business-Success/events/130234892/','','',1,1374515397,1374660372,1,'live','wysiwyg-advanced','','',1374912000,1374944400,'TBD (according to the number of participants, Barcelona, Spain)','','','','http://www.meetup.com/Brainstorming-for-Business-Success/events/130234892/',''),
	('8p6ii84ognplpilrmoknbn49s4','The Future of Consumer and Advertising Technology -  Live Webinar from the U.S.','',0,'','Barcelona Internet Startups\nTuesday, July 30 at 7:00 PM\n\nIn ORDER TO ATTEND THIS SPECIAL WEBINAR YOU MUST: #1 RSVP BY EMAIL TO: lkerner@namadvisorguide.com WITH YOUR NAME AND COMPANY #2 THE DIAL IN NUMBER FO...\n\nDetails: http://www.meetup.com/barcelonastartups/events/130030312/','','',1,1374190664,1374660381,1,'live','wysiwyg-advanced','','',1375203600,1375207200,'Online Webinar (Online , Barcelona, Spain)','','','','http://www.meetup.com/barcelonastartups/events/130030312/',''),
	('avfd39f2vtepg7drk8lnc3bbf0','Inception 101','',0,'','Para obtener detalles completos, incluida la dirección, y para reservar, ver:\nhttp://www.meetup.com/gamestorming-barcelona/events/129725792/\nBarcelona Gamestorming and Meeting Facilitation Group\nEl Jueves 25 os esperamos en Domenech7 para revisar (y practicar) con Marc Florit el enfoque y objetivos de una sesión de Inception.\n¿Qu&hellip;','','',1,1373988210,1374660364,1,'live','wysiwyg-advanced','','',1374771600,1374782400,'Domenech 7 - Domenech 7-9, 2on 2a - Barcelona, España','','','','http://www.meetup.com/gamestorming-barcelona/events/129725792/',''),
	('b1e0dqmq7fs9d052qvc0ulmm5k','Barcelona IoT September','',0,'','For full details, including the address, and to RSVP see:\nhttp://www.meetup.com/iotbarcelona/events/134320392/\nInternet of Things Barcelona\nAfter some holidays we are back to talk about exciting Internet of Things projects in Barcelona.\nThe FabLab Barcelona will talk about their SmartCitize&hellip;','','',1,1376590392,1376583438,1,'live','wysiwyg-advanced','','',1378746000,1378756800,'Pangea - La Fosca - Doctor Trueta 113 - Barcelona, Spain','','','','http://www.meetup.com/iotbarcelona/events/134320392/',''),
	('d9o1benif48ljcaf6nq46vkaqc','Usable Usability - Lean UX Starts Right Here - Eric Reiss - Full Day Workshop','',0,'','For full details, including the address, and to RSVP see:\nhttp://www.meetup.com/barcelonastartups/events/130781702/\nBarcelona Internet Startups\nWorkshop by: Eric Reiss\n&#034;Usable Usability - The Lean UX Starts Right Here&#034;\n\nWe talk a lot these days about responsive design&hellip;','','',1,1376590539,1376583460,1,'live','wysiwyg-advanced','','',1379748600,1379775600,'J&amp;A Garrigues,SLP Avda. - Diagonal, 654 esc D 1ª planta Barcelona, 08034 - Barcelona, Spain','','','','http://www.meetup.com/barcelonastartups/events/130781702/',''),
	('davucbb1ahm0jojh5h87cegelc','Global JAMJAM BCN13','',0,'','For details, link here: http://jamjambcn13.eventbrite.com','','',1,1373836267,1374660385,1,'live','wysiwyg-advanced','','08006 Barcelona - Spain',1380286500,1380477600,'','','','','http://jamjambcn13.eventbrite.com',''),
	('fbh7ho3osskhm7nho9b52vijc8','TechMeetups Startup clinic - Barcelona 2013','',0,'','For details, link here: http://startup-clinic-barcelona-2013.eventbrite.co.uk','','',1,1374233900,1374660388,1,'live','wysiwyg-advanced','','Barcelona - Spain',1386266400,1386277200,'','','','','http://startup-clinic-barcelona-2013.eventbrite.co.uk',''),
	('gbsq7nfuns89ca5sfpkpj495rc','Innovation vs. Best Practice – Conflict or Opportunity? Guest Speaker:Eric Reiss','',0,'','For full details, including the address, and to RSVP see:\nhttp://www.meetup.com/barcelonastartups/events/130781232/\nBarcelona Internet Startups\nOur Guest Speaker: Eric Reiss\nTopic: Innovation vs. Best Practice – conflict or opportunity?\n\nEric Reiss has been actively involved in the&hellip;','','',1,1376590513,1376583455,1,'live','wysiwyg-advanced','','',1379613600,1379619900,'J&A Garrigues,SLP Avda. - Diagonal, 654 esc D 1ª planta Barcelona, 08034 - Barcelona, Spain','','','','http://www.meetup.com/barcelonastartups/events/130781232/',''),
	('qtns0kvegolk3g9vnlo4md0k4g','MOVE-In-Move-OUT-MOVE-on','',0,'','For details, link here: http://questionartsproject.eventbrite.es','','',1,1374828548,0,1,'draft','wysiwyg-advanced','','',1376672400,1376683200,'questionArtsProject-comes-to-BARCELONA - 08018 Barcelona - España','','','','http://questionartsproject.eventbrite.es',''),
	('st3ig6tv5ms4v924h7hlgbeono','\"Crowd-Fun\" and Collective Economy\"','',0,'','For details, link here: http://www.eventbrite.es/event/6287972495','','',1,1373940296,1374660367,1,'live','wysiwyg-advanced','','Excellence Librería - 191 ',1374892200,1374897600,'Carrer de Balmes - 08006 Barcelona - España','','','','http://www.eventbrite.es/event/6287972495','');

/*!40000 ALTER TABLE `default_event` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_event_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_event_categories`;

CREATE TABLE `default_event_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_slug` (`slug`),
  UNIQUE KEY `unique_title` (`title`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table default_file_folders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_file_folders`;

CREATE TABLE `default_file_folders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `remote_container` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_added` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table default_files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_files`;

CREATE TABLE `default_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '1',
  `type` enum('a','v','d','i','o') COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `width` int(5) DEFAULT NULL,
  `height` int(5) DEFAULT NULL,
  `filesize` int(11) NOT NULL DEFAULT '0',
  `download_count` int(11) NOT NULL DEFAULT '0',
  `date_added` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table default_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_groups`;

CREATE TABLE `default_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `default_groups` WRITE;
/*!40000 ALTER TABLE `default_groups` DISABLE KEYS */;

INSERT INTO `default_groups` (`id`, `name`, `description`)
VALUES
	(1,'admin','Administrator'),
	(2,'user','User');

/*!40000 ALTER TABLE `default_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_keywords
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_keywords`;

CREATE TABLE `default_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table default_keywords_applied
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_keywords_applied`;

CREATE TABLE `default_keywords_applied` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keyword_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table default_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_migrations`;

CREATE TABLE `default_migrations` (
  `version` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `default_migrations` WRITE;
/*!40000 ALTER TABLE `default_migrations` DISABLE KEYS */;

INSERT INTO `default_migrations` (`version`)
VALUES
	(96);

/*!40000 ALTER TABLE `default_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_modules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_modules`;

CREATE TABLE `default_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `skip_xss` tinyint(1) NOT NULL,
  `is_frontend` tinyint(1) NOT NULL,
  `is_backend` tinyint(1) NOT NULL,
  `menu` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `installed` tinyint(1) NOT NULL,
  `is_core` tinyint(1) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `default_modules` WRITE;
/*!40000 ALTER TABLE `default_modules` DISABLE KEYS */;

INSERT INTO `default_modules` (`id`, `name`, `slug`, `version`, `type`, `description`, `skip_xss`, `is_frontend`, `is_backend`, `menu`, `enabled`, `installed`, `is_core`, `updated_on`)
VALUES
	(1,'a:15:{s:2:\"en\";s:4:\"Blog\";s:2:\"ar\";s:16:\"المدوّنة\";s:2:\"br\";s:4:\"Blog\";s:2:\"pt\";s:4:\"Blog\";s:2:\"el\";s:18:\"Ιστολόγιο\";s:2:\"he\";s:8:\"בלוג\";s:2:\"id\";s:4:\"Blog\";s:2:\"lt\";s:6:\"Blogas\";s:2:\"pl\";s:4:\"Blog\";s:2:\"ru\";s:8:\"Блог\";s:2:\"zh\";s:6:\"文章\";s:2:\"hu\";s:4:\"Blog\";s:2:\"fi\";s:5:\"Blogi\";s:2:\"th\";s:15:\"บล็อก\";s:2:\"se\";s:5:\"Blogg\";}','blog','2.0',NULL,'a:23:{s:2:\"en\";s:18:\"Post blog entries.\";s:2:\"ar\";s:48:\"أنشر المقالات على مدوّنتك.\";s:2:\"br\";s:30:\"Escrever publicações de blog\";s:2:\"pt\";s:39:\"Escrever e editar publicações no blog\";s:2:\"cs\";s:49:\"Publikujte nové články a příspěvky na blog.\";s:2:\"da\";s:17:\"Skriv blogindlæg\";s:2:\"de\";s:47:\"Veröffentliche neue Artikel und Blog-Einträge\";s:2:\"sl\";s:23:\"Objavite blog prispevke\";s:2:\"fi\";s:28:\"Kirjoita blogi artikkeleita.\";s:2:\"el\";s:93:\"Δημιουργήστε άρθρα και εγγραφές στο ιστολόγιο σας.\";s:2:\"es\";s:54:\"Escribe entradas para los artículos y blog (web log).\";s:2:\"fr\";s:46:\"Envoyez de nouveaux posts et messages de blog.\";s:2:\"he\";s:19:\"ניהול בלוג\";s:2:\"id\";s:15:\"Post entri blog\";s:2:\"it\";s:36:\"Pubblica notizie e post per il blog.\";s:2:\"lt\";s:40:\"Rašykite naujienas bei blog\'o įrašus.\";s:2:\"nl\";s:41:\"Post nieuwsartikelen en blogs op uw site.\";s:2:\"pl\";s:27:\"Dodawaj nowe wpisy na blogu\";s:2:\"ru\";s:49:\"Управление записями блога.\";s:2:\"zh\";s:42:\"發表新聞訊息、部落格等文章。\";s:2:\"th\";s:48:\"โพสต์รายการบล็อก\";s:2:\"hu\";s:32:\"Blog bejegyzések létrehozása.\";s:2:\"se\";s:18:\"Inlägg i bloggen.\";}',1,1,1,'content',1,1,1,1364042228),
	(2,'a:23:{s:2:\"en\";s:8:\"Comments\";s:2:\"ar\";s:18:\"التعليقات\";s:2:\"br\";s:12:\"Comentários\";s:2:\"pt\";s:12:\"Comentários\";s:2:\"cs\";s:11:\"Komentáře\";s:2:\"da\";s:11:\"Kommentarer\";s:2:\"de\";s:10:\"Kommentare\";s:2:\"el\";s:12:\"Σχόλια\";s:2:\"es\";s:11:\"Comentarios\";s:2:\"fi\";s:9:\"Kommentit\";s:2:\"fr\";s:12:\"Commentaires\";s:2:\"he\";s:12:\"תגובות\";s:2:\"id\";s:8:\"Komentar\";s:2:\"it\";s:8:\"Commenti\";s:2:\"lt\";s:10:\"Komentarai\";s:2:\"nl\";s:8:\"Reacties\";s:2:\"pl\";s:10:\"Komentarze\";s:2:\"ru\";s:22:\"Комментарии\";s:2:\"sl\";s:10:\"Komentarji\";s:2:\"zh\";s:6:\"回應\";s:2:\"hu\";s:16:\"Hozzászólások\";s:2:\"th\";s:33:\"ความคิดเห็น\";s:2:\"se\";s:11:\"Kommentarer\";}','comments','1.0',NULL,'a:23:{s:2:\"en\";s:76:\"Users and guests can write comments for content like blog, pages and photos.\";s:2:\"ar\";s:152:\"يستطيع الأعضاء والزوّار كتابة التعليقات على المُحتوى كالأخبار، والصفحات والصّوَر.\";s:2:\"br\";s:97:\"Usuários e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.\";s:2:\"pt\";s:100:\"Utilizadores e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.\";s:2:\"cs\";s:100:\"Uživatelé a hosté mohou psát komentáře k obsahu, např. neovinkám, stránkám a fotografiím.\";s:2:\"da\";s:83:\"Brugere og besøgende kan skrive kommentarer til indhold som blog, sider og fotoer.\";s:2:\"de\";s:65:\"Benutzer und Gäste können für fast alles Kommentare schreiben.\";s:2:\"el\";s:224:\"Οι χρήστες και οι επισκέπτες μπορούν να αφήνουν σχόλια για περιεχόμενο όπως το ιστολόγιο, τις σελίδες και τις φωτογραφίες.\";s:2:\"es\";s:130:\"Los usuarios y visitantes pueden escribir comentarios en casi todo el contenido con el soporte de un sistema de captcha incluído.\";s:2:\"fi\";s:107:\"Käyttäjät ja vieraat voivat kirjoittaa kommentteja eri sisältöihin kuten uutisiin, sivuihin ja kuviin.\";s:2:\"fr\";s:130:\"Les utilisateurs et les invités peuvent écrire des commentaires pour quasiment tout grâce au générateur de captcha intégré.\";s:2:\"he\";s:94:\"משתמשי האתר יכולים לרשום תגובות למאמרים, תמונות וכו\";s:2:\"id\";s:100:\"Pengguna dan pengunjung dapat menuliskan komentaruntuk setiap konten seperti blog, halaman dan foto.\";s:2:\"it\";s:85:\"Utenti e visitatori possono scrivere commenti ai contenuti quali blog, pagine e foto.\";s:2:\"lt\";s:75:\"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.\";s:2:\"nl\";s:52:\"Gebruikers en gasten kunnen reageren op bijna alles.\";s:2:\"pl\";s:93:\"Użytkownicy i goście mogą dodawać komentarze z wbudowanym systemem zabezpieczeń captcha.\";s:2:\"ru\";s:187:\"Пользователи и гости могут добавлять комментарии к новостям, информационным страницам и фотографиям.\";s:2:\"sl\";s:89:\"Uporabniki in obiskovalci lahko vnesejo komentarje na vsebino kot je blok, stra ali slike\";s:2:\"zh\";s:75:\"用戶和訪客可以針對新聞、頁面與照片等內容發表回應。\";s:2:\"hu\";s:117:\"A felhasználók és a vendégek hozzászólásokat írhatnak a tartalomhoz (bejegyzésekhez, oldalakhoz, fotókhoz).\";s:2:\"th\";s:240:\"ผู้ใช้งานและผู้เยี่ยมชมสามารถเขียนความคิดเห็นในเนื้อหาของหน้าเว็บบล็อกและภาพถ่าย\";s:2:\"se\";s:98:\"Användare och besökare kan skriva kommentarer till innehåll som blogginlägg, sidor och bilder.\";}',0,0,1,'content',1,1,1,1360770399),
	(3,'a:23:{s:2:\"en\";s:7:\"Contact\";s:2:\"ar\";s:14:\"الإتصال\";s:2:\"br\";s:7:\"Contato\";s:2:\"pt\";s:8:\"Contacto\";s:2:\"cs\";s:7:\"Kontakt\";s:2:\"da\";s:7:\"Kontakt\";s:2:\"de\";s:7:\"Kontakt\";s:2:\"el\";s:22:\"Επικοινωνία\";s:2:\"es\";s:8:\"Contacto\";s:2:\"fi\";s:13:\"Ota yhteyttä\";s:2:\"fr\";s:7:\"Contact\";s:2:\"he\";s:17:\"יצירת קשר\";s:2:\"id\";s:6:\"Kontak\";s:2:\"it\";s:10:\"Contattaci\";s:2:\"lt\";s:18:\"Kontaktinė formą\";s:2:\"nl\";s:7:\"Contact\";s:2:\"pl\";s:7:\"Kontakt\";s:2:\"ru\";s:27:\"Обратная связь\";s:2:\"sl\";s:7:\"Kontakt\";s:2:\"zh\";s:12:\"聯絡我們\";s:2:\"hu\";s:9:\"Kapcsolat\";s:2:\"th\";s:18:\"ติดต่อ\";s:2:\"se\";s:7:\"Kontakt\";}','contact','0.9',NULL,'a:23:{s:2:\"en\";s:112:\"Adds a form to your site that allows visitors to send emails to you without disclosing an email address to them.\";s:2:\"ar\";s:157:\"إضافة استمارة إلى موقعك تُمكّن الزوّار من مراسلتك دون علمهم بعنوان البريد الإلكتروني.\";s:2:\"br\";s:139:\"Adiciona um formulário para o seu site permitir aos visitantes que enviem e-mails para voce sem divulgar um endereço de e-mail para eles.\";s:2:\"pt\";s:116:\"Adiciona um formulário ao seu site que permite aos visitantes enviarem e-mails sem divulgar um endereço de e-mail.\";s:2:\"cs\";s:149:\"Přidá na web kontaktní formulář pro návštěvníky a uživatele, díky kterému vás mohou kontaktovat i bez znalosti vaší e-mailové adresy.\";s:2:\"da\";s:123:\"Tilføjer en formular på din side som tillader besøgende at sende mails til dig, uden at du skal opgive din email-adresse\";s:2:\"de\";s:119:\"Fügt ein Formular hinzu, welches Besuchern erlaubt Emails zu schreiben, ohne die Kontakt Email-Adresse offen zu legen.\";s:2:\"el\";s:273:\"Προσθέτει μια φόρμα στον ιστότοπό σας που επιτρέπει σε επισκέπτες να σας στέλνουν μηνύμα μέσω email χωρίς να τους αποκαλύπτεται η διεύθυνση του email σας.\";s:2:\"es\";s:156:\"Añade un formulario a tu sitio que permitirá a los visitantes enviarte correos electrónicos a ti sin darles tu dirección de correo directamente a ellos.\";s:2:\"fi\";s:128:\"Luo lomakkeen sivustollesi, josta kävijät voivat lähettää sähköpostia tietämättä vastaanottajan sähköpostiosoitetta.\";s:2:\"fr\";s:122:\"Ajoute un formulaire à votre site qui permet aux visiteurs de vous envoyer un e-mail sans révéler votre adresse e-mail.\";s:2:\"he\";s:155:\"מוסיף תופס יצירת קשר לאתר על מנת לא לחסוף כתובת דואר האלקטרוני של האתר למנועי פרסומות\";s:2:\"id\";s:149:\"Menambahkan formulir ke dalam situs Anda yang memungkinkan pengunjung untuk mengirimkan email kepada Anda tanpa memberikan alamat email kepada mereka\";s:2:\"it\";s:119:\"Aggiunge un modulo al tuo sito che permette ai visitatori di inviarti email senza mostrare loro il tuo indirizzo email.\";s:2:\"lt\";s:124:\"Prideda jūsų puslapyje formą leidžianti lankytojams siūsti jums el. laiškus neatskleidžiant jūsų el. pašto adreso.\";s:2:\"nl\";s:125:\"Voegt een formulier aan de site toe waarmee bezoekers een email kunnen sturen, zonder dat u ze een emailadres hoeft te tonen.\";s:2:\"pl\";s:126:\"Dodaje formularz kontaktowy do Twojej strony, który pozwala użytkownikom wysłanie maila za pomocą formularza kontaktowego.\";s:2:\"ru\";s:234:\"Добавляет форму обратной связи на сайт, через которую посетители могут отправлять вам письма, при этом адрес Email остаётся скрыт.\";s:2:\"sl\";s:113:\"Dodaj obrazec za kontakt da vam lahko obiskovalci pošljejo sporočilo brez da bi jim razkrili vaš email naslov.\";s:2:\"zh\";s:147:\"為您的網站新增「聯絡我們」的功能，對訪客是較為清楚便捷的聯絡方式，也無須您將電子郵件公開在網站上。\";s:2:\"th\";s:316:\"เพิ่มแบบฟอร์มในเว็บไซต์ของคุณ ช่วยให้ผู้เยี่ยมชมสามารถส่งอีเมลถึงคุณโดยไม่ต้องเปิดเผยที่อยู่อีเมลของพวกเขา\";s:2:\"hu\";s:156:\"Létrehozható vele olyan űrlap, amely lehetővé teszi a látogatók számára, hogy e-mailt küldjenek neked úgy, hogy nem feded fel az e-mail címedet.\";s:2:\"se\";s:53:\"Lägger till ett kontaktformulär till din webbplats.\";}',0,0,0,'0',1,1,1,1360770399),
	(4,'a:22:{s:2:\"en\";s:5:\"Files\";s:2:\"ar\";s:16:\"الملفّات\";s:2:\"br\";s:8:\"Arquivos\";s:2:\"pt\";s:9:\"Ficheiros\";s:2:\"cs\";s:7:\"Soubory\";s:2:\"da\";s:5:\"Filer\";s:2:\"de\";s:7:\"Dateien\";s:2:\"el\";s:12:\"Αρχεία\";s:2:\"es\";s:8:\"Archivos\";s:2:\"fi\";s:9:\"Tiedostot\";s:2:\"fr\";s:8:\"Fichiers\";s:2:\"he\";s:10:\"קבצים\";s:2:\"id\";s:4:\"File\";s:2:\"it\";s:4:\"File\";s:2:\"lt\";s:6:\"Failai\";s:2:\"nl\";s:9:\"Bestanden\";s:2:\"ru\";s:10:\"Файлы\";s:2:\"sl\";s:8:\"Datoteke\";s:2:\"zh\";s:6:\"檔案\";s:2:\"hu\";s:7:\"Fájlok\";s:2:\"th\";s:12:\"ไฟล์\";s:2:\"se\";s:5:\"Filer\";}','files','2.0',NULL,'a:22:{s:2:\"en\";s:40:\"Manages files and folders for your site.\";s:2:\"ar\";s:50:\"إدارة ملفات ومجلّدات موقعك.\";s:2:\"br\";s:53:\"Permite gerenciar facilmente os arquivos de seu site.\";s:2:\"pt\";s:59:\"Permite gerir facilmente os ficheiros e pastas do seu site.\";s:2:\"cs\";s:43:\"Spravujte soubory a složky na vašem webu.\";s:2:\"da\";s:41:\"Administrer filer og mapper for dit site.\";s:2:\"de\";s:35:\"Verwalte Dateien und Verzeichnisse.\";s:2:\"el\";s:100:\"Διαχειρίζεται αρχεία και φακέλους για το ιστότοπό σας.\";s:2:\"es\";s:43:\"Administra archivos y carpetas en tu sitio.\";s:2:\"fi\";s:43:\"Hallitse sivustosi tiedostoja ja kansioita.\";s:2:\"fr\";s:46:\"Gérer les fichiers et dossiers de votre site.\";s:2:\"he\";s:47:\"ניהול תיקיות וקבצים שבאתר\";s:2:\"id\";s:42:\"Mengatur file dan folder dalam situs Anda.\";s:2:\"it\";s:38:\"Gestisci file e cartelle del tuo sito.\";s:2:\"lt\";s:28:\"Katalogų ir bylų valdymas.\";s:2:\"nl\";s:41:\"Beheer bestanden en mappen op uw website.\";s:2:\"ru\";s:78:\"Управление файлами и папками вашего сайта.\";s:2:\"sl\";s:38:\"Uredi datoteke in mape na vaši strani\";s:2:\"zh\";s:33:\"管理網站中的檔案與目錄\";s:2:\"hu\";s:41:\"Fájlok és mappák kezelése az oldalon.\";s:2:\"th\";s:141:\"บริหารจัดการไฟล์และโฟลเดอร์สำหรับเว็บไซต์ของคุณ\";s:2:\"se\";s:45:\"Hanterar filer och mappar för din webbplats.\";}',0,0,1,'content',1,1,1,1360770399),
	(5,'a:22:{s:2:\"en\";s:6:\"Groups\";s:2:\"ar\";s:18:\"المجموعات\";s:2:\"br\";s:6:\"Grupos\";s:2:\"pt\";s:6:\"Grupos\";s:2:\"cs\";s:7:\"Skupiny\";s:2:\"da\";s:7:\"Grupper\";s:2:\"de\";s:7:\"Gruppen\";s:2:\"el\";s:12:\"Ομάδες\";s:2:\"es\";s:6:\"Grupos\";s:2:\"fi\";s:7:\"Ryhmät\";s:2:\"fr\";s:7:\"Groupes\";s:2:\"he\";s:12:\"קבוצות\";s:2:\"id\";s:4:\"Grup\";s:2:\"it\";s:6:\"Gruppi\";s:2:\"lt\";s:7:\"Grupės\";s:2:\"nl\";s:7:\"Groepen\";s:2:\"ru\";s:12:\"Группы\";s:2:\"sl\";s:7:\"Skupine\";s:2:\"zh\";s:6:\"群組\";s:2:\"hu\";s:9:\"Csoportok\";s:2:\"th\";s:15:\"กลุ่ม\";s:2:\"se\";s:7:\"Grupper\";}','groups','1.0',NULL,'a:22:{s:2:\"en\";s:54:\"Users can be placed into groups to manage permissions.\";s:2:\"ar\";s:100:\"يمكن وضع المستخدمين في مجموعات لتسهيل إدارة صلاحياتهم.\";s:2:\"br\";s:72:\"Usuários podem ser inseridos em grupos para gerenciar suas permissões.\";s:2:\"pt\";s:74:\"Utilizadores podem ser inseridos em grupos para gerir as suas permissões.\";s:2:\"cs\";s:77:\"Uživatelé mohou být rozřazeni do skupin pro lepší správu oprávnění.\";s:2:\"da\";s:49:\"Brugere kan inddeles i grupper for adgangskontrol\";s:2:\"de\";s:85:\"Benutzer können zu Gruppen zusammengefasst werden um diesen Zugriffsrechte zu geben.\";s:2:\"el\";s:168:\"Οι χρήστες μπορούν να τοποθετηθούν σε ομάδες και έτσι να διαχειριστείτε τα δικαιώματά τους.\";s:2:\"es\";s:75:\"Los usuarios podrán ser colocados en grupos para administrar sus permisos.\";s:2:\"fi\";s:84:\"Käyttäjät voidaan liittää ryhmiin, jotta käyttöoikeuksia voidaan hallinnoida.\";s:2:\"fr\";s:82:\"Les utilisateurs peuvent appartenir à des groupes afin de gérer les permissions.\";s:2:\"he\";s:62:\"נותן אפשרות לאסוף משתמשים לקבוצות\";s:2:\"id\";s:68:\"Pengguna dapat dikelompokkan ke dalam grup untuk mengatur perizinan.\";s:2:\"it\";s:69:\"Gli utenti possono essere inseriti in gruppi per gestirne i permessi.\";s:2:\"lt\";s:67:\"Vartotojai gali būti priskirti grupei tam, kad valdyti jų teises.\";s:2:\"nl\";s:73:\"Gebruikers kunnen in groepen geplaatst worden om rechten te kunnen geven.\";s:2:\"ru\";s:134:\"Пользователей можно объединять в группы, для управления правами доступа.\";s:2:\"sl\";s:64:\"Uporabniki so lahko razvrščeni v skupine za urejanje dovoljenj\";s:2:\"zh\";s:45:\"用戶可以依群組分類並管理其權限\";s:2:\"hu\";s:73:\"A felhasználók csoportokba rendezhetőek a jogosultságok kezelésére.\";s:2:\"th\";s:84:\"สามารถวางผู้ใช้ลงในกลุ่มเพื่\";s:2:\"se\";s:76:\"Användare kan delas in i grupper för att hantera roller och behörigheter.\";}',0,0,1,'users',1,1,1,1360770399),
	(6,'a:15:{s:2:\"en\";s:8:\"Keywords\";s:2:\"ar\";s:21:\"كلمات البحث\";s:2:\"br\";s:14:\"Palavras-chave\";s:2:\"pt\";s:14:\"Palavras-chave\";s:2:\"da\";s:9:\"Nøgleord\";s:2:\"el\";s:27:\"Λέξεις Κλειδιά\";s:2:\"fr\";s:10:\"Mots-Clés\";s:2:\"id\";s:10:\"Kata Kunci\";s:2:\"nl\";s:14:\"Sleutelwoorden\";s:2:\"zh\";s:6:\"鍵詞\";s:2:\"hu\";s:11:\"Kulcsszavak\";s:2:\"fi\";s:10:\"Avainsanat\";s:2:\"sl\";s:15:\"Ključne besede\";s:2:\"th\";s:15:\"คำค้น\";s:2:\"se\";s:9:\"Nyckelord\";}','keywords','1.0',NULL,'a:15:{s:2:\"en\";s:71:\"Maintain a central list of keywords to label and organize your content.\";s:2:\"ar\";s:124:\"أنشئ مجموعة من كلمات البحث التي تستطيع من خلالها وسم وتنظيم المحتوى.\";s:2:\"br\";s:85:\"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.\";s:2:\"pt\";s:85:\"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.\";s:2:\"da\";s:72:\"Vedligehold en central liste af nøgleord for at organisere dit indhold.\";s:2:\"el\";s:181:\"Συντηρεί μια κεντρική λίστα από λέξεις κλειδιά για να οργανώνετε μέσω ετικετών το περιεχόμενό σας.\";s:2:\"fr\";s:87:\"Maintenir une liste centralisée de Mots-Clés pour libeller et organiser vos contenus.\";s:2:\"id\";s:71:\"Memantau daftar kata kunci untuk melabeli dan mengorganisasikan konten.\";s:2:\"nl\";s:91:\"Beheer een centrale lijst van sleutelwoorden om uw content te categoriseren en organiseren.\";s:2:\"zh\";s:64:\"集中管理可用於標題與內容的鍵詞(keywords)列表。\";s:2:\"hu\";s:65:\"Ez egy központi kulcsszó lista a cimkékhez és a tartalmakhoz.\";s:2:\"fi\";s:92:\"Hallinnoi keskitettyä listaa avainsanoista merkitäksesi ja järjestelläksesi sisältöä.\";s:2:\"sl\";s:82:\"Vzdržuj centralni seznam ključnih besed za označevanje in ogranizacijo vsebine.\";s:2:\"th\";s:189:\"ศูนย์กลางการปรับปรุงคำค้นในการติดฉลากและจัดระเบียบเนื้อหาของคุณ\";s:2:\"se\";s:61:\"Hantera nyckelord för att organisera webbplatsens innehåll.\";}',0,0,1,'content',1,1,1,1360770399),
	(7,'a:12:{s:2:\"en\";s:11:\"Maintenance\";s:2:\"pt\";s:12:\"Manutenção\";s:2:\"ar\";s:14:\"الصيانة\";s:2:\"el\";s:18:\"Συντήρηση\";s:2:\"hu\";s:13:\"Karbantartás\";s:2:\"fi\";s:9:\"Ylläpito\";s:2:\"fr\";s:11:\"Maintenance\";s:2:\"id\";s:12:\"Pemeliharaan\";s:2:\"se\";s:10:\"Underhåll\";s:2:\"sl\";s:12:\"Vzdrževanje\";s:2:\"th\";s:39:\"การบำรุงรักษา\";s:2:\"zh\";s:6:\"維護\";}','maintenance','1.0',NULL,'a:12:{s:2:\"en\";s:63:\"Manage the site cache and export information from the database.\";s:2:\"pt\";s:68:\"Gerir o cache do seu site e exportar informações da base de dados.\";s:2:\"ar\";s:81:\"حذف عناصر الذاكرة المخبأة عبر واجهة الإدارة.\";s:2:\"el\";s:142:\"Διαγραφή αντικειμένων προσωρινής αποθήκευσης μέσω της περιοχής διαχείρισης.\";s:2:\"id\";s:60:\"Mengatur cache situs dan mengexport informasi dari database.\";s:2:\"fr\";s:71:\"Gérer le cache du site et exporter les contenus de la base de données\";s:2:\"fi\";s:59:\"Hallinoi sivuston välimuistia ja vie tietoa tietokannasta.\";s:2:\"hu\";s:66:\"Az oldal gyorsítótár kezelése és az adatbázis exportálása.\";s:2:\"se\";s:76:\"Underhåll webbplatsens cache och exportera data från webbplatsens databas.\";s:2:\"sl\";s:69:\"Upravljaj s predpomnilnikom strani (cache) in izvozi podatke iz baze.\";s:2:\"th\";s:150:\"การจัดการแคชเว็บไซต์และข้อมูลการส่งออกจากฐานข้อมูล\";s:2:\"zh\";s:45:\"經由管理介面手動刪除暫存資料。\";}',0,0,1,'utilities',1,1,1,1360770399),
	(8,'a:23:{s:2:\"en\";s:7:\"Modules\";s:2:\"ar\";s:14:\"الوحدات\";s:2:\"br\";s:8:\"Módulos\";s:2:\"pt\";s:8:\"Módulos\";s:2:\"cs\";s:6:\"Moduly\";s:2:\"da\";s:7:\"Moduler\";s:2:\"de\";s:6:\"Module\";s:2:\"el\";s:16:\"Πρόσθετα\";s:2:\"es\";s:8:\"Módulos\";s:2:\"fi\";s:8:\"Moduulit\";s:2:\"fr\";s:7:\"Modules\";s:2:\"he\";s:14:\"מודולים\";s:2:\"id\";s:5:\"Modul\";s:2:\"it\";s:6:\"Moduli\";s:2:\"lt\";s:8:\"Moduliai\";s:2:\"nl\";s:7:\"Modules\";s:2:\"pl\";s:7:\"Moduły\";s:2:\"ru\";s:12:\"Модули\";s:2:\"sl\";s:6:\"Moduli\";s:2:\"zh\";s:6:\"模組\";s:2:\"hu\";s:7:\"Modulok\";s:2:\"th\";s:15:\"โมดูล\";s:2:\"se\";s:7:\"Moduler\";}','modules','1.0',NULL,'a:23:{s:2:\"en\";s:59:\"Allows admins to see a list of currently installed modules.\";s:2:\"ar\";s:91:\"تُمكّن المُدراء من معاينة جميع الوحدات المُثبّتة.\";s:2:\"br\";s:75:\"Permite aos administradores ver a lista dos módulos instalados atualmente.\";s:2:\"pt\";s:75:\"Permite aos administradores ver a lista dos módulos instalados atualmente.\";s:2:\"cs\";s:68:\"Umožňuje administrátorům vidět seznam nainstalovaných modulů.\";s:2:\"da\";s:63:\"Lader administratorer se en liste over de installerede moduler.\";s:2:\"de\";s:56:\"Zeigt Administratoren alle aktuell installierten Module.\";s:2:\"el\";s:152:\"Επιτρέπει στους διαχειριστές να προβάλουν μια λίστα των εγκατεστημένων πρόσθετων.\";s:2:\"es\";s:71:\"Permite a los administradores ver una lista de los módulos instalados.\";s:2:\"fi\";s:60:\"Listaa järjestelmänvalvojalle käytössä olevat moduulit.\";s:2:\"fr\";s:66:\"Permet aux administrateurs de voir la liste des modules installés\";s:2:\"he\";s:160:\"נותן אופציה למנהל לראות רשימה של המודולים אשר מותקנים כעת באתר או להתקין מודולים נוספים\";s:2:\"id\";s:57:\"Memperlihatkan kepada admin daftar modul yang terinstall.\";s:2:\"it\";s:83:\"Permette agli amministratori di vedere una lista dei moduli attualmente installati.\";s:2:\"lt\";s:75:\"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.\";s:2:\"nl\";s:79:\"Stelt admins in staat om een overzicht van geinstalleerde modules te genereren.\";s:2:\"pl\";s:81:\"Umożliwiają administratorowi wgląd do listy obecnie zainstalowanych modułów.\";s:2:\"ru\";s:83:\"Список модулей, которые установлены на сайте.\";s:2:\"sl\";s:65:\"Dovoljuje administratorjem pregled trenutno nameščenih modulov.\";s:2:\"zh\";s:54:\"管理員可以檢視目前已經安裝模組的列表\";s:2:\"hu\";s:79:\"Lehetővé teszi az adminoknak, hogy lássák a telepített modulok listáját.\";s:2:\"th\";s:162:\"ช่วยให้ผู้ดูแลระบบดูรายการของโมดูลที่ติดตั้งในปัจจุบัน\";s:2:\"se\";s:67:\"Gör det möjligt för administratören att se installerade mouler.\";}',0,0,1,'0',1,1,1,1360770399),
	(9,'a:23:{s:2:\"en\";s:10:\"Navigation\";s:2:\"ar\";s:14:\"الروابط\";s:2:\"br\";s:11:\"Navegação\";s:2:\"pt\";s:11:\"Navegação\";s:2:\"cs\";s:8:\"Navigace\";s:2:\"da\";s:10:\"Navigation\";s:2:\"de\";s:10:\"Navigation\";s:2:\"el\";s:16:\"Πλοήγηση\";s:2:\"es\";s:11:\"Navegación\";s:2:\"fi\";s:10:\"Navigointi\";s:2:\"fr\";s:10:\"Navigation\";s:2:\"he\";s:10:\"ניווט\";s:2:\"id\";s:8:\"Navigasi\";s:2:\"it\";s:11:\"Navigazione\";s:2:\"lt\";s:10:\"Navigacija\";s:2:\"nl\";s:9:\"Navigatie\";s:2:\"pl\";s:9:\"Nawigacja\";s:2:\"ru\";s:18:\"Навигация\";s:2:\"sl\";s:10:\"Navigacija\";s:2:\"zh\";s:12:\"導航選單\";s:2:\"th\";s:36:\"ตัวช่วยนำทาง\";s:2:\"hu\";s:11:\"Navigáció\";s:2:\"se\";s:10:\"Navigation\";}','navigation','1.1',NULL,'a:23:{s:2:\"en\";s:78:\"Manage links on navigation menus and all the navigation groups they belong to.\";s:2:\"ar\";s:85:\"إدارة روابط وقوائم ومجموعات الروابط في الموقع.\";s:2:\"br\";s:91:\"Gerenciar links do menu de navegação e todos os grupos de navegação pertencentes a ele.\";s:2:\"pt\";s:93:\"Gerir todos os grupos dos menus de navegação e os links de navegação pertencentes a eles.\";s:2:\"cs\";s:73:\"Správa odkazů v navigaci a všech souvisejících navigačních skupin.\";s:2:\"da\";s:82:\"Håndtér links på navigationsmenuerne og alle navigationsgrupperne de tilhører.\";s:2:\"de\";s:76:\"Verwalte Links in Navigationsmenüs und alle zugehörigen Navigationsgruppen\";s:2:\"el\";s:207:\"Διαχειριστείτε τους συνδέσμους στα μενού πλοήγησης και όλες τις ομάδες συνδέσμων πλοήγησης στις οποίες ανήκουν.\";s:2:\"es\";s:102:\"Administra links en los menús de navegación y en todos los grupos de navegación al cual pertenecen.\";s:2:\"fi\";s:91:\"Hallitse linkkejä navigointi valikoissa ja kaikkia navigointi ryhmiä, joihin ne kuuluvat.\";s:2:\"fr\";s:97:\"Gérer les liens du menu Navigation et tous les groupes de navigation auxquels ils appartiennent.\";s:2:\"he\";s:73:\"ניהול שלוחות תפריטי ניווט וקבוצות ניווט\";s:2:\"id\";s:73:\"Mengatur tautan pada menu navigasi dan semua pengelompokan grup navigasi.\";s:2:\"it\";s:97:\"Gestisci i collegamenti dei menu di navigazione e tutti i gruppi di navigazione da cui dipendono.\";s:2:\"lt\";s:95:\"Tvarkyk nuorodas navigacijų menių ir visas navigacijų grupes kurioms tos nuorodos priklauso.\";s:2:\"nl\";s:92:\"Beheer koppelingen op de navigatiemenu&apos;s en alle navigatiegroepen waar ze onder vallen.\";s:2:\"pl\";s:95:\"Zarządzaj linkami w menu nawigacji oraz wszystkimi grupami nawigacji do których one należą.\";s:2:\"ru\";s:136:\"Управление ссылками в меню навигации и группах, к которым они принадлежат.\";s:2:\"sl\";s:64:\"Uredi povezave v meniju in vse skupine povezav ki jim pripadajo.\";s:2:\"zh\";s:72:\"管理導航選單中的連結，以及它們所隸屬的導航群組。\";s:2:\"th\";s:108:\"จัดการการเชื่อมโยงนำทางและกลุ่มนำทาง\";s:2:\"hu\";s:100:\"Linkek kezelése a navigációs menükben és a navigációs csoportok kezelése, amikhez tartoznak.\";s:2:\"se\";s:33:\"Hantera länkar och länkgrupper.\";}',0,0,1,'design',1,1,1,1360770399),
	(10,'a:23:{s:2:\"en\";s:5:\"Pages\";s:2:\"ar\";s:14:\"الصفحات\";s:2:\"br\";s:8:\"Páginas\";s:2:\"pt\";s:8:\"Páginas\";s:2:\"cs\";s:8:\"Stránky\";s:2:\"da\";s:5:\"Sider\";s:2:\"de\";s:6:\"Seiten\";s:2:\"el\";s:14:\"Σελίδες\";s:2:\"es\";s:8:\"Páginas\";s:2:\"fi\";s:5:\"Sivut\";s:2:\"fr\";s:5:\"Pages\";s:2:\"he\";s:8:\"דפים\";s:2:\"id\";s:7:\"Halaman\";s:2:\"it\";s:6:\"Pagine\";s:2:\"lt\";s:9:\"Puslapiai\";s:2:\"nl\";s:13:\"Pagina&apos;s\";s:2:\"pl\";s:6:\"Strony\";s:2:\"ru\";s:16:\"Страницы\";s:2:\"sl\";s:6:\"Strani\";s:2:\"zh\";s:6:\"頁面\";s:2:\"hu\";s:7:\"Oldalak\";s:2:\"th\";s:21:\"หน้าเพจ\";s:2:\"se\";s:5:\"Sidor\";}','pages','2.2.0',NULL,'a:23:{s:2:\"en\";s:55:\"Add custom pages to the site with any content you want.\";s:2:\"ar\";s:99:\"إضافة صفحات مُخصّصة إلى الموقع تحتوي أية مُحتوى تريده.\";s:2:\"br\";s:82:\"Adicionar páginas personalizadas ao site com qualquer conteúdo que você queira.\";s:2:\"pt\";s:86:\"Adicionar páginas personalizadas ao seu site com qualquer conteúdo que você queira.\";s:2:\"cs\";s:74:\"Přidávejte vlastní stránky na web s jakýmkoliv obsahem budete chtít.\";s:2:\"da\";s:71:\"Tilføj brugerdefinerede sider til dit site med det indhold du ønsker.\";s:2:\"de\";s:49:\"Füge eigene Seiten mit anpassbaren Inhalt hinzu.\";s:2:\"el\";s:152:\"Προσθέστε και επεξεργαστείτε σελίδες στον ιστότοπό σας με ό,τι περιεχόμενο θέλετε.\";s:2:\"es\";s:77:\"Agrega páginas customizadas al sitio con cualquier contenido que tu quieras.\";s:2:\"fi\";s:47:\"Lisää mitä tahansa sisältöä sivustollesi.\";s:2:\"fr\";s:89:\"Permet d\'ajouter sur le site des pages personalisées avec le contenu que vous souhaitez.\";s:2:\"he\";s:35:\"ניהול דפי תוכן האתר\";s:2:\"id\";s:75:\"Menambahkan halaman ke dalam situs dengan konten apapun yang Anda perlukan.\";s:2:\"it\";s:73:\"Aggiungi pagine personalizzate al sito con qualsiesi contenuto tu voglia.\";s:2:\"lt\";s:46:\"Pridėkite nuosavus puslapius betkokio turinio\";s:2:\"nl\";s:70:\"Voeg aangepaste pagina&apos;s met willekeurige inhoud aan de site toe.\";s:2:\"pl\";s:53:\"Dodaj własne strony z dowolną treścią do witryny.\";s:2:\"ru\";s:134:\"Управление информационными страницами сайта, с произвольным содержимым.\";s:2:\"sl\";s:44:\"Dodaj stran s kakršno koli vsebino želite.\";s:2:\"zh\";s:39:\"為您的網站新增自定的頁面。\";s:2:\"th\";s:168:\"เพิ่มหน้าเว็บที่กำหนดเองไปยังเว็บไซต์ของคุณตามที่ต้องการ\";s:2:\"hu\";s:67:\"Saját oldalak hozzáadása a weboldalhoz, akármilyen tartalommal.\";s:2:\"se\";s:39:\"Lägg till egna sidor till webbplatsen.\";}',1,1,1,'content',1,1,1,1360770399),
	(11,'a:23:{s:2:\"en\";s:11:\"Permissions\";s:2:\"ar\";s:18:\"الصلاحيات\";s:2:\"br\";s:11:\"Permissões\";s:2:\"pt\";s:11:\"Permissões\";s:2:\"cs\";s:12:\"Oprávnění\";s:2:\"da\";s:14:\"Adgangskontrol\";s:2:\"de\";s:14:\"Zugriffsrechte\";s:2:\"el\";s:20:\"Δικαιώματα\";s:2:\"es\";s:8:\"Permisos\";s:2:\"fi\";s:16:\"Käyttöoikeudet\";s:2:\"fr\";s:11:\"Permissions\";s:2:\"he\";s:12:\"הרשאות\";s:2:\"id\";s:9:\"Perizinan\";s:2:\"it\";s:8:\"Permessi\";s:2:\"lt\";s:7:\"Teisės\";s:2:\"nl\";s:15:\"Toegangsrechten\";s:2:\"pl\";s:11:\"Uprawnienia\";s:2:\"ru\";s:25:\"Права доступа\";s:2:\"sl\";s:10:\"Dovoljenja\";s:2:\"zh\";s:6:\"權限\";s:2:\"hu\";s:14:\"Jogosultságok\";s:2:\"th\";s:18:\"สิทธิ์\";s:2:\"se\";s:13:\"Behörigheter\";}','permissions','0.6',NULL,'a:23:{s:2:\"en\";s:68:\"Control what type of users can see certain sections within the site.\";s:2:\"ar\";s:127:\"التحكم بإعطاء الصلاحيات للمستخدمين للوصول إلى أقسام الموقع المختلفة.\";s:2:\"br\";s:68:\"Controle quais tipos de usuários podem ver certas seções no site.\";s:2:\"pt\";s:75:\"Controle quais os tipos de utilizadores podem ver certas secções no site.\";s:2:\"cs\";s:93:\"Spravujte oprávnění pro jednotlivé typy uživatelů a ke kterým sekcím mají přístup.\";s:2:\"da\";s:72:\"Kontroller hvilken type brugere der kan se bestemte sektioner på sitet.\";s:2:\"de\";s:70:\"Regelt welche Art von Benutzer welche Sektion in der Seite sehen kann.\";s:2:\"el\";s:180:\"Ελέγξτε τα δικαιώματα χρηστών και ομάδων χρηστών όσο αφορά σε διάφορες λειτουργίες του ιστοτόπου.\";s:2:\"es\";s:81:\"Controla que tipo de usuarios pueden ver secciones específicas dentro del sitio.\";s:2:\"fi\";s:72:\"Hallitse minkä tyyppisiin osioihin käyttäjät pääsevät sivustolla.\";s:2:\"fr\";s:104:\"Permet de définir les autorisations des groupes d\'utilisateurs pour afficher les différentes sections.\";s:2:\"he\";s:75:\"ניהול הרשאות כניסה לאיזורים מסוימים באתר\";s:2:\"id\";s:76:\"Mengontrol tipe pengguna mana yang dapat mengakses suatu bagian dalam situs.\";s:2:\"it\";s:78:\"Controlla che tipo di utenti posssono accedere a determinate sezioni del sito.\";s:2:\"lt\";s:72:\"Kontroliuokite kokio tipo varotojai kokią dalį puslapio gali pasiekti.\";s:2:\"nl\";s:71:\"Bepaal welke typen gebruikers toegang hebben tot gedeeltes van de site.\";s:2:\"pl\";s:79:\"Ustaw, którzy użytkownicy mogą mieć dostęp do odpowiednich sekcji witryny.\";s:2:\"ru\";s:209:\"Управление правами доступа, ограничение доступа определённых групп пользователей к произвольным разделам сайта.\";s:2:\"sl\";s:85:\"Uredite dovoljenja kateri tip uporabnika lahko vidi določena področja vaše strani.\";s:2:\"zh\";s:81:\"用來控制不同類別的用戶，設定其瀏覽特定網站內容的權限。\";s:2:\"hu\";s:129:\"A felhasználók felügyelet alatt tartására, hogy milyen típusú felhasználók, mit láthatnak, mely szakaszain az oldalnak.\";s:2:\"th\";s:117:\"ควบคุมว่าผู้ใช้งานจะเห็นหมวดหมู่ไหนบ้าง\";s:2:\"se\";s:27:\"Hantera gruppbehörigheter.\";}',0,0,1,'users',1,1,1,1360770399),
	(12,'a:21:{s:2:\"en\";s:9:\"Redirects\";s:2:\"ar\";s:18:\"التوجيهات\";s:2:\"br\";s:17:\"Redirecionamentos\";s:2:\"pt\";s:17:\"Redirecionamentos\";s:2:\"cs\";s:16:\"Přesměrování\";s:2:\"da\";s:13:\"Omadressering\";s:2:\"el\";s:30:\"Ανακατευθύνσεις\";s:2:\"es\";s:13:\"Redirecciones\";s:2:\"fi\";s:18:\"Uudelleenohjaukset\";s:2:\"fr\";s:12:\"Redirections\";s:2:\"he\";s:12:\"הפניות\";s:2:\"id\";s:8:\"Redirect\";s:2:\"it\";s:11:\"Reindirizzi\";s:2:\"lt\";s:14:\"Peradresavimai\";s:2:\"nl\";s:12:\"Verwijzingen\";s:2:\"ru\";s:30:\"Перенаправления\";s:2:\"sl\";s:12:\"Preusmeritve\";s:2:\"zh\";s:6:\"轉址\";s:2:\"hu\";s:17:\"Átirányítások\";s:2:\"th\";s:42:\"เปลี่ยนเส้นทาง\";s:2:\"se\";s:14:\"Omdirigeringar\";}','redirects','1.0',NULL,'a:21:{s:2:\"en\";s:33:\"Redirect from one URL to another.\";s:2:\"ar\";s:47:\"التوجيه من رابط URL إلى آخر.\";s:2:\"br\";s:39:\"Redirecionamento de uma URL para outra.\";s:2:\"pt\";s:40:\"Redirecionamentos de uma URL para outra.\";s:2:\"cs\";s:43:\"Přesměrujte z jedné adresy URL na jinou.\";s:2:\"da\";s:35:\"Omadresser fra en URL til en anden.\";s:2:\"el\";s:81:\"Ανακατευθείνετε μια διεύθυνση URL σε μια άλλη\";s:2:\"es\";s:34:\"Redireccionar desde una URL a otra\";s:2:\"fi\";s:45:\"Uudelleenohjaa käyttäjän paikasta toiseen.\";s:2:\"fr\";s:34:\"Redirection d\'une URL à un autre.\";s:2:\"he\";s:43:\"הפניות מכתובת אחת לאחרת\";s:2:\"id\";s:40:\"Redirect dari satu URL ke URL yang lain.\";s:2:\"it\";s:35:\"Reindirizza da una URL ad un altra.\";s:2:\"lt\";s:56:\"Peradresuokite puslapį iš vieno adreso (URL) į kitą.\";s:2:\"nl\";s:38:\"Verwijs vanaf een URL naar een andere.\";s:2:\"ru\";s:78:\"Перенаправления с одного адреса на другой.\";s:2:\"sl\";s:44:\"Preusmeritev iz enega URL naslova na drugega\";s:2:\"zh\";s:33:\"將網址轉址、重新定向。\";s:2:\"hu\";s:38:\"Egy URL átirányítása egy másikra.\";s:2:\"th\";s:123:\"เปลี่ยนเส้นทางจากที่หนึ่งไปยังอีกที่หนึ่ง\";s:2:\"se\";s:38:\"Omdirigera från en URL till en annan.\";}',0,0,1,'utilities',1,1,1,1360770399),
	(13,'a:23:{s:2:\"en\";s:8:\"Settings\";s:2:\"ar\";s:18:\"الإعدادات\";s:2:\"br\";s:15:\"Configurações\";s:2:\"pt\";s:15:\"Configurações\";s:2:\"cs\";s:10:\"Nastavení\";s:2:\"da\";s:13:\"Indstillinger\";s:2:\"de\";s:13:\"Einstellungen\";s:2:\"el\";s:18:\"Ρυθμίσεις\";s:2:\"es\";s:15:\"Configuraciones\";s:2:\"fi\";s:9:\"Asetukset\";s:2:\"fr\";s:11:\"Paramètres\";s:2:\"he\";s:12:\"הגדרות\";s:2:\"id\";s:10:\"Pengaturan\";s:2:\"it\";s:12:\"Impostazioni\";s:2:\"lt\";s:10:\"Nustatymai\";s:2:\"nl\";s:12:\"Instellingen\";s:2:\"pl\";s:10:\"Ustawienia\";s:2:\"ru\";s:18:\"Настройки\";s:2:\"sl\";s:10:\"Nastavitve\";s:2:\"zh\";s:12:\"網站設定\";s:2:\"hu\";s:14:\"Beállítások\";s:2:\"th\";s:21:\"ตั้งค่า\";s:2:\"se\";s:14:\"Inställningar\";}','settings','1.0',NULL,'a:23:{s:2:\"en\";s:89:\"Allows administrators to update settings like Site Name, messages and email address, etc.\";s:2:\"ar\";s:161:\"تمكن المدراء من تحديث الإعدادات كإسم الموقع، والرسائل وعناوين البريد الإلكتروني، .. إلخ.\";s:2:\"br\";s:120:\"Permite com que administradores e a equipe consigam trocar as configurações do website incluindo o nome e descrição.\";s:2:\"pt\";s:113:\"Permite com que os administradores consigam alterar as configurações do website incluindo o nome e descrição.\";s:2:\"cs\";s:102:\"Umožňuje administrátorům měnit nastavení webu jako jeho jméno, zprávy a emailovou adresu apod.\";s:2:\"da\";s:90:\"Lader administratorer opdatere indstillinger som sidenavn, beskeder og email adresse, etc.\";s:2:\"de\";s:92:\"Erlaubt es Administratoren die Einstellungen der Seite wie Name und Beschreibung zu ändern.\";s:2:\"el\";s:230:\"Επιτρέπει στους διαχειριστές να τροποποιήσουν ρυθμίσεις όπως το Όνομα του Ιστοτόπου, τα μηνύματα και τις διευθύνσεις email, κ.α.\";s:2:\"es\";s:131:\"Permite a los administradores y al personal configurar los detalles del sitio como el nombre del sitio y la descripción del mismo.\";s:2:\"fi\";s:105:\"Mahdollistaa sivuston asetusten muokkaamisen, kuten sivuston nimen, viestit ja sähköpostiosoitteet yms.\";s:2:\"fr\";s:105:\"Permet aux admistrateurs et au personnel de modifier les paramètres du site : nom du site et description\";s:2:\"he\";s:116:\"ניהול הגדרות שונות של האתר כגון: שם האתר, הודעות, כתובות דואר וכו\";s:2:\"id\";s:112:\"Memungkinkan administrator untuk dapat memperbaharui pengaturan seperti nama situs, pesan dan alamat email, dsb.\";s:2:\"it\";s:109:\"Permette agli amministratori di aggiornare impostazioni quali Nome del Sito, messaggi e indirizzo email, etc.\";s:2:\"lt\";s:104:\"Leidžia administratoriams keisti puslapio vavadinimą, žinutes, administratoriaus el. pašta ir kitą.\";s:2:\"nl\";s:114:\"Maakt het administratoren en medewerkers mogelijk om websiteinstellingen zoals naam en beschrijving te veranderen.\";s:2:\"pl\";s:103:\"Umożliwia administratorom zmianę ustawień strony jak nazwa strony, opis, e-mail administratora, itd.\";s:2:\"ru\";s:135:\"Управление настройками сайта - Имя сайта, сообщения, почтовые адреса и т.п.\";s:2:\"sl\";s:98:\"Dovoljuje administratorjem posodobitev nastavitev kot je Ime strani, sporočil, email naslova itd.\";s:2:\"zh\";s:99:\"網站管理者可更新的重要網站設定。例如：網站名稱、訊息、電子郵件等。\";s:2:\"hu\";s:125:\"Lehetővé teszi az adminok számára a beállítások frissítését, mint a weboldal neve, üzenetek, e-mail címek, stb...\";s:2:\"th\";s:232:\"ให้ผู้ดูแลระบบสามารถปรับปรุงการตั้งค่าเช่นชื่อเว็บไซต์ ข้อความและอีเมล์เป็นต้น\";s:2:\"se\";s:84:\"Administratören kan uppdatera webbplatsens titel, meddelanden och E-postadress etc.\";}',1,0,1,'0',1,1,1,1372776113),
	(14,'a:18:{s:2:\"en\";s:7:\"Sitemap\";s:2:\"ar\";s:23:\"خريطة الموقع\";s:2:\"br\";s:12:\"Mapa do Site\";s:2:\"pt\";s:12:\"Mapa do Site\";s:2:\"de\";s:7:\"Sitemap\";s:2:\"el\";s:31:\"Χάρτης Ιστότοπου\";s:2:\"es\";s:14:\"Mapa del Sitio\";s:2:\"fi\";s:10:\"Sivukartta\";s:2:\"fr\";s:12:\"Plan du site\";s:2:\"id\";s:10:\"Peta Situs\";s:2:\"it\";s:14:\"Mappa del sito\";s:2:\"lt\";s:16:\"Svetainės medis\";s:2:\"nl\";s:7:\"Sitemap\";s:2:\"ru\";s:21:\"Карта сайта\";s:2:\"zh\";s:12:\"網站地圖\";s:2:\"th\";s:21:\"ไซต์แมพ\";s:2:\"hu\";s:13:\"Oldaltérkép\";s:2:\"se\";s:9:\"Sajtkarta\";}','sitemap','1.2',NULL,'a:19:{s:2:\"en\";s:87:\"The sitemap module creates an index of all pages and an XML sitemap for search engines.\";s:2:\"ar\";s:120:\"وحدة خريطة الموقع تنشئ فهرساً لجميع الصفحات وملف XML لمحركات البحث.\";s:2:\"br\";s:102:\"O módulo de mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.\";s:2:\"pt\";s:102:\"O módulo do mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.\";s:2:\"da\";s:86:\"Sitemapmodulet opretter et indeks over alle sider og et XML sitemap til søgemaskiner.\";s:2:\"de\";s:92:\"Die Sitemap Modul erstellt einen Index aller Seiten und eine XML-Sitemap für Suchmaschinen.\";s:2:\"el\";s:190:\"Δημιουργεί έναν κατάλογο όλων των σελίδων και έναν χάρτη σελίδων σε μορφή XML για τις μηχανές αναζήτησης.\";s:2:\"es\";s:111:\"El módulo de mapa crea un índice de todas las páginas y un mapa del sitio XML para los motores de búsqueda.\";s:2:\"fi\";s:82:\"sivukartta moduuli luo hakemisto kaikista sivuista ja XML sivukartta hakukoneille.\";s:2:\"fr\";s:106:\"Le module sitemap crée un index de toutes les pages et un plan de site XML pour les moteurs de recherche.\";s:2:\"id\";s:110:\"Modul peta situs ini membuat indeks dari setiap halaman dan sebuah format XML untuk mempermudah mesin pencari.\";s:2:\"it\";s:104:\"Il modulo mappa del sito crea un indice di tutte le pagine e una sitemap in XML per i motori di ricerca.\";s:2:\"lt\";s:86:\"struktūra modulis sukuria visų puslapių ir XML Sitemap paieškos sistemų indeksas.\";s:2:\"nl\";s:89:\"De sitemap module maakt een index van alle pagina\'s en een XML sitemap voor zoekmachines.\";s:2:\"ru\";s:144:\"Карта модуль создает индекс всех страниц и карта сайта XML для поисковых систем.\";s:2:\"zh\";s:84:\"站點地圖模塊創建一個索引的所有網頁和XML網站地圖搜索引擎。\";s:2:\"th\";s:202:\"โมดูลไซต์แมพสามารถสร้างดัชนีของหน้าเว็บทั้งหมดสำหรับเครื่องมือค้นหา.\";s:2:\"hu\";s:94:\"Ez a modul indexeli az összes oldalt és egy XML oldaltéképet generál a keresőmotoroknak.\";s:2:\"se\";s:86:\"Sajtkarta, modulen skapar ett index av alla sidor och en XML-sitemap för sökmotorer.\";}',0,1,0,'content',1,1,1,1360770399),
	(15,'a:5:{s:2:\"en\";s:12:\"Streams Core\";s:2:\"pt\";s:14:\"Núcleo Fluxos\";s:2:\"fr\";s:10:\"Noyau Flux\";s:2:\"el\";s:23:\"Πυρήνας Ροών\";s:2:\"se\";s:18:\"Streams grundmodul\";}','streams_core','1.0.0',NULL,'a:5:{s:2:\"en\";s:29:\"Core data module for streams.\";s:2:\"pt\";s:37:\"Módulo central de dados para fluxos.\";s:2:\"fr\";s:32:\"Noyau de données pour les Flux.\";s:2:\"el\";s:113:\"Προγραμματιστικός πυρήνας για την λειτουργία ροών δεδομένων.\";s:2:\"se\";s:50:\"Streams grundmodul för enklare hantering av data.\";}',1,0,0,'0',1,1,1,1360770399),
	(16,'a:19:{s:2:\"en\";s:15:\"Email Templates\";s:2:\"ar\";s:48:\"قوالب الرسائل الإلكترونية\";s:2:\"br\";s:17:\"Modelos de e-mail\";s:2:\"pt\";s:17:\"Modelos de e-mail\";s:2:\"da\";s:16:\"Email skabeloner\";s:2:\"el\";s:22:\"Δυναμικά email\";s:2:\"es\";s:19:\"Plantillas de email\";s:2:\"fr\";s:17:\"Modèles d\'emails\";s:2:\"he\";s:12:\"תבניות\";s:2:\"id\";s:14:\"Template Email\";s:2:\"lt\";s:22:\"El. laiškų šablonai\";s:2:\"nl\";s:15:\"Email sjablonen\";s:2:\"ru\";s:25:\"Шаблоны почты\";s:2:\"sl\";s:14:\"Email predloge\";s:2:\"zh\";s:12:\"郵件範本\";s:2:\"hu\";s:15:\"E-mail sablonok\";s:2:\"fi\";s:25:\"Sähköposti viestipohjat\";s:2:\"th\";s:33:\"แม่แบบอีเมล\";s:2:\"se\";s:12:\"E-postmallar\";}','templates','1.1.0',NULL,'a:19:{s:2:\"en\";s:46:\"Create, edit, and save dynamic email templates\";s:2:\"ar\";s:97:\"أنشئ، عدّل واحفظ قوالب البريد الإلكترني الديناميكية.\";s:2:\"br\";s:51:\"Criar, editar e salvar modelos de e-mail dinâmicos\";s:2:\"pt\";s:51:\"Criar, editar e salvar modelos de e-mail dinâmicos\";s:2:\"da\";s:49:\"Opret, redigér og gem dynamiske emailskabeloner.\";s:2:\"el\";s:108:\"Δημιουργήστε, επεξεργαστείτε και αποθηκεύστε δυναμικά email.\";s:2:\"es\";s:54:\"Crear, editar y guardar plantillas de email dinámicas\";s:2:\"fr\";s:61:\"Créer, éditer et sauver dynamiquement des modèles d\'emails\";s:2:\"he\";s:54:\"ניהול של תבניות דואר אלקטרוני\";s:2:\"id\";s:55:\"Membuat, mengedit, dan menyimpan template email dinamis\";s:2:\"lt\";s:58:\"Kurk, tvarkyk ir saugok dinaminius el. laiškų šablonus.\";s:2:\"nl\";s:49:\"Maak, bewerk, en beheer dynamische emailsjablonen\";s:2:\"ru\";s:127:\"Создавайте, редактируйте и сохраняйте динамические почтовые шаблоны\";s:2:\"sl\";s:52:\"Ustvari, uredi in shrani spremenljive email predloge\";s:2:\"zh\";s:61:\"新增、編輯與儲存可顯示動態資料的 email 範本\";s:2:\"hu\";s:63:\"Csináld, szerkeszd és mentsd el a dinamikus e-mail sablonokat\";s:2:\"fi\";s:66:\"Lisää, muokkaa ja tallenna dynaamisia sähköposti viestipohjia.\";s:2:\"th\";s:129:\"การสร้างแก้ไขและบันทึกแม่แบบอีเมลแบบไดนามิก\";s:2:\"se\";s:49:\"Skapa, redigera och spara dynamiska E-postmallar.\";}',1,0,1,'design',1,1,1,1360770399),
	(17,'a:23:{s:2:\"en\";s:6:\"Themes\";s:2:\"ar\";s:14:\"السّمات\";s:2:\"br\";s:5:\"Temas\";s:2:\"pt\";s:5:\"Temas\";s:2:\"cs\";s:14:\"Motivy vzhledu\";s:2:\"da\";s:6:\"Temaer\";s:2:\"de\";s:6:\"Themen\";s:2:\"el\";s:31:\"Θέματα Εμφάνισης\";s:2:\"es\";s:5:\"Temas\";s:2:\"fi\";s:6:\"Teemat\";s:2:\"fr\";s:7:\"Thèmes\";s:2:\"he\";s:23:\"ערכות נושאים\";s:2:\"id\";s:4:\"Tema\";s:2:\"it\";s:4:\"Temi\";s:2:\"lt\";s:5:\"Temos\";s:2:\"nl\";s:7:\"Thema\'s\";s:2:\"pl\";s:6:\"Motywy\";s:2:\"ru\";s:8:\"Темы\";s:2:\"sl\";s:8:\"Predloge\";s:2:\"zh\";s:12:\"佈景主題\";s:2:\"hu\";s:8:\"Sablonok\";s:2:\"th\";s:9:\"ธีม\";s:2:\"se\";s:5:\"Teman\";}','themes','1.0',NULL,'a:23:{s:2:\"en\";s:86:\"Allows admins and staff to switch themes, upload new themes, and manage theme options.\";s:2:\"ar\";s:170:\"تمكّن الإدارة وأعضاء الموقع تغيير سِمة الموقع، وتحميل سمات جديدة وإدارتها بطريقة مرئية سلسة.\";s:2:\"br\";s:125:\"Permite aos administradores e membros da equipe fazer upload de novos temas e gerenciá-los através de uma interface visual.\";s:2:\"pt\";s:100:\"Permite aos administradores fazer upload de novos temas e geri-los através de uma interface visual.\";s:2:\"cs\";s:106:\"Umožňuje administrátorům a dalším osobám měnit vzhled webu, nahrávat nové motivy a spravovat je.\";s:2:\"da\";s:108:\"Lader administratore ændre websidens tema, uploade nye temaer og håndtére dem med en mere visual tilgang.\";s:2:\"de\";s:121:\"Ermöglicht es dem Administrator das Seiten Thema auszuwählen, neue Themen hochzulanden oder diese visuell zu verwalten.\";s:2:\"el\";s:222:\"Επιτρέπει στους διαχειριστές να αλλάξουν το θέμα προβολής του ιστοτόπου να ανεβάσουν νέα θέματα και να τα διαχειριστούν.\";s:2:\"es\";s:132:\"Permite a los administradores y miembros del personal cambiar el tema del sitio web, subir nuevos temas y manejar los ya existentes.\";s:2:\"fi\";s:129:\"Mahdollistaa sivuston teeman vaihtamisen, uusien teemojen lataamisen ja niiden hallinnoinnin visuaalisella käyttöliittymällä.\";s:2:\"fr\";s:144:\"Permet aux administrateurs et au personnel de modifier le thème du site, de charger de nouveaux thèmes et de le gérer de façon plus visuelle\";s:2:\"he\";s:63:\"ניהול של ערכות נושאים שונות - עיצוב\";s:2:\"id\";s:104:\"Memungkinkan admin dan staff untuk mengubah tema tampilan, mengupload tema baru, dan mengatur opsi tema.\";s:2:\"it\";s:120:\"Permette ad amministratori e staff di cambiare il tema del sito, carica nuovi temi e gestiscili in um modo più visuale.\";s:2:\"lt\";s:105:\"Leidžiama administratoriams ir personalui keisti puslapio temą, įkraunant naują temą ir valdyti ją.\";s:2:\"nl\";s:153:\"Maakt het voor administratoren en medewerkers mogelijk om het thema van de website te wijzigen, nieuwe thema&apos;s te uploaden en ze visueel te beheren.\";s:2:\"pl\";s:100:\"Umożliwia administratorowi zmianę motywu strony, wgrywanie nowych motywów oraz zarządzanie nimi.\";s:2:\"ru\";s:102:\"Управление темами оформления сайта, загрузка новых тем.\";s:2:\"sl\";s:133:\"Dovoljuje adminom in osebju spremembo izgleda spletne strani, namestitev novega izgleda in urejanja le tega v bolj vizualnem pristopu\";s:2:\"zh\";s:108:\"讓管理者可以更改網站顯示風貌，以視覺化的操作上傳並管理這些網站佈景主題。\";s:2:\"th\";s:219:\"ช่วยให้ผู้ดูแลระบบสามารถอัปโหลดรูปแบบใหม่และการจัดการตัวเลือกชุดรูปแบบได้\";s:2:\"hu\";s:107:\"Az adminok megváltoztathatják az oldal kinézetét, feltölthetnek új kinézeteket és kezelhetik őket.\";s:2:\"se\";s:94:\"Hantera webbplatsens utseende genom teman, ladda upp nya teman och hantera temainställningar.\";}',0,0,1,'design',1,1,1,1360770399),
	(18,'a:23:{s:2:\"en\";s:5:\"Users\";s:2:\"ar\";s:20:\"المستخدمون\";s:2:\"br\";s:9:\"Usuários\";s:2:\"pt\";s:12:\"Utilizadores\";s:2:\"cs\";s:11:\"Uživatelé\";s:2:\"da\";s:7:\"Brugere\";s:2:\"de\";s:8:\"Benutzer\";s:2:\"el\";s:14:\"Χρήστες\";s:2:\"es\";s:8:\"Usuarios\";s:2:\"fi\";s:12:\"Käyttäjät\";s:2:\"fr\";s:12:\"Utilisateurs\";s:2:\"he\";s:14:\"משתמשים\";s:2:\"id\";s:8:\"Pengguna\";s:2:\"it\";s:6:\"Utenti\";s:2:\"lt\";s:10:\"Vartotojai\";s:2:\"nl\";s:10:\"Gebruikers\";s:2:\"pl\";s:12:\"Użytkownicy\";s:2:\"ru\";s:24:\"Пользователи\";s:2:\"sl\";s:10:\"Uporabniki\";s:2:\"zh\";s:6:\"用戶\";s:2:\"hu\";s:14:\"Felhasználók\";s:2:\"th\";s:27:\"ผู้ใช้งาน\";s:2:\"se\";s:10:\"Användare\";}','users','0.9',NULL,'a:23:{s:2:\"en\";s:81:\"Let users register and log in to the site, and manage them via the control panel.\";s:2:\"ar\";s:133:\"تمكين المستخدمين من التسجيل والدخول إلى الموقع، وإدارتهم من لوحة التحكم.\";s:2:\"br\";s:125:\"Permite com que usuários se registrem e entrem no site e também que eles sejam gerenciáveis apartir do painel de controle.\";s:2:\"pt\";s:125:\"Permite com que os utilizadores se registem e entrem no site e também que eles sejam geriveis apartir do painel de controlo.\";s:2:\"cs\";s:103:\"Umožňuje uživatelům se registrovat a přihlašovat a zároveň jejich správu v Kontrolním panelu.\";s:2:\"da\";s:89:\"Lader brugere registrere sig og logge ind på sitet, og håndtér dem via kontrolpanelet.\";s:2:\"de\";s:108:\"Erlaube Benutzern das Registrieren und Einloggen auf der Seite und verwalte sie über die Admin-Oberfläche.\";s:2:\"el\";s:208:\"Παρέχει λειτουργίες εγγραφής και σύνδεσης στους επισκέπτες. Επίσης από εδώ γίνεται η διαχείριση των λογαριασμών.\";s:2:\"es\";s:138:\"Permite el registro de nuevos usuarios quienes podrán loguearse en el sitio. Estos podrán controlarse desde el panel de administración.\";s:2:\"fi\";s:126:\"Antaa käyttäjien rekisteröityä ja kirjautua sisään sivustolle sekä mahdollistaa niiden muokkaamisen hallintapaneelista.\";s:2:\"fr\";s:112:\"Permet aux utilisateurs de s\'enregistrer et de se connecter au site et de les gérer via le panneau de contrôle\";s:2:\"he\";s:62:\"ניהול משתמשים: רישום, הפעלה ומחיקה\";s:2:\"id\";s:102:\"Memungkinkan pengguna untuk mendaftar dan masuk ke dalam situs, dan mengaturnya melalui control panel.\";s:2:\"it\";s:95:\"Fai iscrivere de entrare nel sito gli utenti, e gestiscili attraverso il pannello di controllo.\";s:2:\"lt\";s:106:\"Leidžia vartotojams registruotis ir prisijungti prie puslapio, ir valdyti juos per administravimo panele.\";s:2:\"nl\";s:88:\"Laat gebruikers registreren en inloggen op de site, en beheer ze via het controlepaneel.\";s:2:\"pl\";s:87:\"Pozwól użytkownikom na logowanie się na stronie i zarządzaj nimi za pomocą panelu.\";s:2:\"ru\";s:155:\"Управление зарегистрированными пользователями, активирование новых пользователей.\";s:2:\"sl\";s:96:\"Dovoli uporabnikom za registracijo in prijavo na strani, urejanje le teh preko nadzorne plošče\";s:2:\"zh\";s:87:\"讓用戶可以註冊並登入網站，並且管理者可在控制台內進行管理。\";s:2:\"th\";s:210:\"ให้ผู้ใช้ลงทะเบียนและเข้าสู่เว็บไซต์และจัดการกับพวกเขาผ่านทางแผงควบคุม\";s:2:\"hu\";s:120:\"Hogy a felhasználók tudjanak az oldalra regisztrálni és belépni, valamint lehessen őket kezelni a vezérlőpulton.\";s:2:\"se\";s:111:\"Låt dina besökare registrera sig och logga in på webbplatsen. Hantera sedan användarna via kontrollpanelen.\";}',0,0,1,'0',1,1,1,1360770399),
	(19,'a:23:{s:2:\"en\";s:9:\"Variables\";s:2:\"ar\";s:20:\"المتغيّرات\";s:2:\"br\";s:10:\"Variáveis\";s:2:\"pt\";s:10:\"Variáveis\";s:2:\"cs\";s:10:\"Proměnné\";s:2:\"da\";s:8:\"Variable\";s:2:\"de\";s:9:\"Variablen\";s:2:\"el\";s:20:\"Μεταβλητές\";s:2:\"es\";s:9:\"Variables\";s:2:\"fi\";s:9:\"Muuttujat\";s:2:\"fr\";s:9:\"Variables\";s:2:\"he\";s:12:\"משתנים\";s:2:\"id\";s:8:\"Variabel\";s:2:\"it\";s:9:\"Variabili\";s:2:\"lt\";s:10:\"Kintamieji\";s:2:\"nl\";s:10:\"Variabelen\";s:2:\"pl\";s:7:\"Zmienne\";s:2:\"ru\";s:20:\"Переменные\";s:2:\"sl\";s:13:\"Spremenljivke\";s:2:\"zh\";s:12:\"系統變數\";s:2:\"hu\";s:10:\"Változók\";s:2:\"th\";s:18:\"ตัวแปร\";s:2:\"se\";s:9:\"Variabler\";}','variables','0.4',NULL,'a:23:{s:2:\"en\";s:59:\"Manage global variables that can be accessed from anywhere.\";s:2:\"ar\";s:97:\"إدارة المُتغيّرات العامة لاستخدامها في أرجاء الموقع.\";s:2:\"br\";s:61:\"Gerencia as variáveis globais acessíveis de qualquer lugar.\";s:2:\"pt\";s:58:\"Gerir as variáveis globais acessíveis de qualquer lugar.\";s:2:\"cs\";s:56:\"Spravujte globální proměnné přístupné odkudkoliv.\";s:2:\"da\";s:51:\"Håndtér globale variable som kan tilgås overalt.\";s:2:\"de\";s:74:\"Verwaltet globale Variablen, auf die von überall zugegriffen werden kann.\";s:2:\"el\";s:129:\"Διαχείριση μεταβλητών που είναι προσβάσιμες από παντού στον ιστότοπο.\";s:2:\"es\";s:50:\"Manage global variables to access from everywhere.\";s:2:\"fi\";s:66:\"Hallitse globaali muuttujia, joihin pääsee käsiksi mistä vain.\";s:2:\"fr\";s:50:\"Manage global variables to access from everywhere.\";s:2:\"he\";s:96:\"ניהול משתנים גלובליים אשר ניתנים להמרה בכל חלקי האתר\";s:2:\"id\";s:59:\"Mengatur variabel global yang dapat diakses dari mana saja.\";s:2:\"it\";s:58:\"Gestisci le variabili globali per accedervi da ogni parte.\";s:2:\"lt\";s:64:\"Globalių kintamujų tvarkymas kurie yra pasiekiami iš bet kur.\";s:2:\"nl\";s:54:\"Beheer globale variabelen die overal beschikbaar zijn.\";s:2:\"pl\";s:86:\"Zarządzaj globalnymi zmiennymi do których masz dostęp z każdego miejsca aplikacji.\";s:2:\"ru\";s:136:\"Управление глобальными переменными, которые доступны в любом месте сайта.\";s:2:\"sl\";s:53:\"Urejanje globalnih spremenljivk za dostop od kjerkoli\";s:2:\"th\";s:148:\"จัดการตัวแปรทั่วไปโดยที่สามารถเข้าถึงได้จากทุกที่.\";s:2:\"zh\";s:45:\"管理此網站內可存取的全局變數。\";s:2:\"hu\";s:62:\"Globális változók kezelése a hozzáféréshez, bárhonnan.\";s:2:\"se\";s:66:\"Hantera globala variabler som kan avändas över hela webbplatsen.\";}',0,0,1,'content',1,1,1,1360770399),
	(20,'a:20:{s:2:\"en\";s:7:\"Widgets\";s:2:\"ar\";s:12:\"الودجت\";s:2:\"br\";s:7:\"Widgets\";s:2:\"pt\";s:7:\"Widgets\";s:2:\"cs\";s:7:\"Widgety\";s:2:\"de\";s:7:\"Widgets\";s:2:\"el\";s:7:\"Widgets\";s:2:\"es\";s:7:\"Widgets\";s:2:\"fi\";s:8:\"Widgetit\";s:2:\"fr\";s:7:\"Widgets\";s:2:\"id\";s:6:\"Widget\";s:2:\"it\";s:7:\"Widgets\";s:2:\"lt\";s:11:\"Papildiniai\";s:2:\"nl\";s:7:\"Widgets\";s:2:\"ru\";s:14:\"Виджеты\";s:2:\"sl\";s:9:\"Vtičniki\";s:2:\"zh\";s:9:\"小組件\";s:2:\"hu\";s:9:\"Widget-ek\";s:2:\"th\";s:21:\"วิดเจ็ต\";s:2:\"se\";s:8:\"Widgetar\";}','widgets','1.1',NULL,'a:21:{s:2:\"en\";s:69:\"Manage small sections of self-contained logic in blocks or \"Widgets\".\";s:2:\"ar\";s:138:\"إدارة أقسام صغيرة من البرمجيات في مساحات الموقع أو ما يُسمّى بالـ\"وِدْجِتْ\".\";s:2:\"br\";s:77:\"Gerenciar pequenas seções de conteúdos em bloco conhecidos como \"Widgets\".\";s:2:\"pt\";s:74:\"Gerir pequenas secções de conteúdos em bloco conhecidos como \"Widgets\".\";s:2:\"cs\";s:56:\"Spravujte malé funkční části webu neboli \"Widgety\".\";s:2:\"da\";s:74:\"Håndter små sektioner af selv-opretholdt logik i blokke eller \"Widgets\".\";s:2:\"de\";s:62:\"Verwaltet kleine, eigentständige Bereiche, genannt \"Widgets\".\";s:2:\"el\";s:149:\"Διαχείριση μικρών τμημάτων αυτόνομης προγραμματιστικής λογικής σε πεδία ή \"Widgets\".\";s:2:\"es\";s:75:\"Manejar pequeñas secciones de lógica autocontenida en bloques o \"Widgets\"\";s:2:\"fi\";s:83:\"Hallitse pieniä osioita, jotka sisältävät erillisiä lohkoja tai \"Widgettejä\".\";s:2:\"fr\";s:41:\"Gérer des mini application ou \"Widgets\".\";s:2:\"id\";s:101:\"Mengatur bagian-bagian kecil dari blok-blok yang memuat sesuatu atau dikenal dengan istilah \"Widget\".\";s:2:\"it\";s:70:\"Gestisci piccole sezioni di logica a se stante in blocchi o \"Widgets\".\";s:2:\"lt\";s:43:\"Nedidelių, savarankiškų blokų valdymas.\";s:2:\"nl\";s:75:\"Beheer kleine onderdelen die zelfstandige logica bevatten, ofwel \"Widgets\".\";s:2:\"ru\";s:91:\"Управление небольшими, самостоятельными блоками.\";s:2:\"sl\";s:61:\"Urejanje manjših delov blokov strani ti. Vtičniki (Widgets)\";s:2:\"zh\";s:103:\"可將小段的程式碼透過小組件來管理。即所謂 \"Widgets\"，或稱為小工具、部件。\";s:2:\"hu\";s:56:\"Önálló kis logikai tömbök vagy widget-ek kezelése.\";s:2:\"th\";s:152:\"จัดการส่วนเล็ก ๆ ในรูปแบบของตัวเองในบล็อกหรือวิดเจ็ต\";s:2:\"se\";s:83:\"Hantera små sektioner med egen logik och innehåll på olika delar av webbplatsen.\";}',1,0,1,'content',1,1,1,1360770399),
	(21,'a:3:{s:2:\"en\";s:7:\"WYSIWYG\";s:2:\"pt\";s:7:\"WYSIWYG\";s:2:\"se\";s:15:\"HTML-redigerare\";}','wysiwyg','1.0',NULL,'a:4:{s:2:\"en\";s:60:\"Provides the WYSIWYG editor for PyroCMS powered by CKEditor.\";s:2:\"pt\";s:61:\"Fornece o editor WYSIWYG para o PyroCMS, powered by CKEditor.\";s:2:\"el\";s:113:\"Παρέχει τον επεξεργαστή WYSIWYG για το PyroCMS, χρησιμοποιεί το CKEDitor.\";s:2:\"se\";s:37:\"Redigeringsmodul för HTML, CKEditor.\";}',0,0,0,'0',1,1,1,1360770399),
	(42,'a:2:{s:2:\"en\";s:5:\"Event\";s:2:\"es\";s:6:\"Evento\";}','event','2.4',NULL,'a:2:{s:2:\"en\";s:19:\"Post event entries.\";s:2:\"es\";s:16:\"Añadir eventos.\";}',1,1,1,'content',1,1,0,1374082224);

/*!40000 ALTER TABLE `default_modules` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_navigation_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_navigation_groups`;

CREATE TABLE `default_navigation_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `abbrev` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `abbrev` (`abbrev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `default_navigation_groups` WRITE;
/*!40000 ALTER TABLE `default_navigation_groups` DISABLE KEYS */;

INSERT INTO `default_navigation_groups` (`id`, `title`, `abbrev`)
VALUES
	(2,'Sidebar','sidebar'),
	(3,'Footer','footer'),
	(5,'Header','header');

/*!40000 ALTER TABLE `default_navigation_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_navigation_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_navigation_links`;

CREATE TABLE `default_navigation_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` int(11) DEFAULT NULL,
  `link_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'uri',
  `page_id` int(11) DEFAULT NULL,
  `module_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `navigation_group_id` int(5) NOT NULL DEFAULT '0',
  `position` int(5) NOT NULL DEFAULT '0',
  `target` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `restricted_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `navigation_group_id` (`navigation_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `default_navigation_links` WRITE;
/*!40000 ALTER TABLE `default_navigation_links` DISABLE KEYS */;

INSERT INTO `default_navigation_links` (`id`, `title`, `parent`, `link_type`, `page_id`, `module_name`, `url`, `uri`, `navigation_group_id`, `position`, `target`, `restricted_to`, `class`)
VALUES
	(14,'Submit event',0,'page',7,'','','',5,1,'','0',''),
	(15,'About',0,'uri',0,'','','/about',5,0,'','0',''),
	(17,'Terms',0,'uri',0,'','','/terms',3,3,'','0',''),
	(18,'Home',0,'uri',0,'','','/',3,0,'','0',''),
	(19,'Contact',0,'uri',0,'','','mailto:info@dlineup.net',3,2,'_blank','0',''),
	(20,'About',0,'uri',0,'','','/about',3,1,'','0','');

/*!40000 ALTER TABLE `default_navigation_links` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_page_chunks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_page_chunks`;

CREATE TABLE `default_page_chunks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `page_id` int(11) NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci,
  `type` set('html','markdown','wysiwyg-advanced','wysiwyg-simple') COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `default_page_chunks` WRITE;
/*!40000 ALTER TABLE `default_page_chunks` DISABLE KEYS */;

INSERT INTO `default_page_chunks` (`id`, `slug`, `class`, `page_id`, `body`, `parsed`, `type`, `sort`)
VALUES
	(2,'default','',2,'<p>We cannot find the page you are looking for, please click <a title=\"Home\" href=\"{{ pages:url id=\'1\' }}\">here</a> to go to the homepage.</p>','','html',1),
	(12,'default','',1,'<p>\n	Welcome to our homepage. We have not quite finished setting up our website yet, but please add us to your bookmarks and come back soon.</p>\n\n','<p>\n    Welcome to our homepage. We have not quite finished setting up our website yet, but please add us to your bookmarks and come back soon.</p>\n','markdown',1),
	(20,'default','',8,'Here you can subscribe to the newsletter.','','wysiwyg-advanced',1),
	(21,'default','',3,'<p>To contact us please fill out the form below.</p>\n					{{ contact:form name=\"text|required\" email=\"text|required|valid_email\" subject=\"dropdown|Support|Sales|Feedback|Other\" message=\"textarea\" attachment=\"file|zip\" }}\n						<div><label for=\"name\">Name:</label>{{ name }}</div>\n						<div><label for=\"email\">Email:</label>{{ email }}</div>\n						<div><label for=\"subject\">Subject:</label>{{ subject }}</div>\n						<div><label for=\"message\">Message:</label>{{ message }}</div>\n						<div><label for=\"attachment\">Attach  a zip file:</label>{{ attachment }}</div>\n					{{ /contact:form }}','','html',1),
	(22,'default','',4,'','','wysiwyg-advanced',1),
	(26,'default','',7,'','','wysiwyg-advanced',1);

/*!40000 ALTER TABLE `default_page_chunks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_page_layouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_page_layouts`;

CREATE TABLE `default_page_layouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `css` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `theme_layout` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `updated_on` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `default_page_layouts` WRITE;
/*!40000 ALTER TABLE `default_page_layouts` DISABLE KEYS */;

INSERT INTO `default_page_layouts` (`id`, `title`, `body`, `css`, `js`, `theme_layout`, `updated_on`)
VALUES
	(1,'Default','<h2>{{ page:title }}</h2>\n{{ page:body }}','','','default.html',1360955434);

/*!40000 ALTER TABLE `default_page_layouts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_pages`;

CREATE TABLE `default_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `revision_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `layout_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `css` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `rss_enabled` int(1) NOT NULL DEFAULT '0',
  `comments_enabled` int(1) NOT NULL DEFAULT '0',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `restricted_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_home` int(1) NOT NULL DEFAULT '0',
  `strict_uri` tinyint(1) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `default_pages` WRITE;
/*!40000 ALTER TABLE `default_pages` DISABLE KEYS */;

INSERT INTO `default_pages` (`id`, `slug`, `class`, `title`, `uri`, `parent_id`, `revision_id`, `layout_id`, `css`, `js`, `meta_title`, `meta_keywords`, `meta_description`, `rss_enabled`, `comments_enabled`, `status`, `created_on`, `updated_on`, `restricted_to`, `is_home`, `strict_uri`, `order`)
VALUES
	(1,'home','','Home','home',0,'1','2','','','','','',0,0,'live',1360768592,1361277386,'0',1,1,0),
	(2,'404','','Page missing','404',0,'1','1',NULL,NULL,NULL,NULL,NULL,0,0,'live',1360768592,0,'',0,1,5),
	(3,'contact','','Contact','contact',0,'1','1','','','','','',0,0,'draft',1360768592,1373378531,'0',0,1,4),
	(4,'about','','About','about',0,'1','1','','','','','',0,0,'draft',1360957825,1373378556,'0',0,1,3),
	(7,'submit','','Submit event','submit',0,'1','1','','','','','',0,0,'live',1365053928,1374232128,'0',0,1,2),
	(8,'newsletter','','Newsletter','newsletter',0,'1','1','','','','','',0,0,'live',1365054057,0,'0',0,1,1);

/*!40000 ALTER TABLE `default_pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_permissions`;

CREATE TABLE `default_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `roles` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `default_permissions` WRITE;
/*!40000 ALTER TABLE `default_permissions` DISABLE KEYS */;

INSERT INTO `default_permissions` (`id`, `group_id`, `module`, `roles`)
VALUES
	(1,2,'blog','{\"put_live\":\"1\",\"edit_live\":\"1\",\"delete_live\":\"1\"}'),
	(2,2,'comments',NULL),
	(3,2,'templates',NULL),
	(4,2,'event','{\"put_live\":\"1\",\"edit_live\":\"1\",\"delete_live\":\"1\"}'),
	(5,2,'files','{\"wysiwyg\":\"1\",\"upload\":\"1\",\"download_file\":\"1\",\"edit_file\":\"1\",\"delete_file\":\"1\",\"create_folder\":\"1\",\"set_location\":\"1\",\"synchronize\":\"1\",\"edit_folder\":\"1\",\"delete_folder\":\"1\"}'),
	(6,2,'groups',NULL),
	(7,2,'keywords',NULL),
	(8,2,'maintenance',NULL),
	(9,2,'modules',NULL),
	(10,2,'navigation',NULL),
	(11,2,'pages','{\"put_live\":\"1\",\"edit_live\":\"1\",\"delete_live\":\"1\"}'),
	(12,2,'permissions',NULL),
	(13,2,'redirects',NULL),
	(14,2,'settings',NULL),
	(15,2,'themes',NULL),
	(16,2,'users','{\"admin_profile_fields\":\"1\"}'),
	(17,2,'variables',NULL),
	(18,2,'widgets',NULL);

/*!40000 ALTER TABLE `default_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_profiles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_profiles`;

CREATE TABLE `default_profiles` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `bio` text COLLATE utf8_unicode_ci,
  `dob` int(11) DEFAULT NULL,
  `gender` set('m','f','') COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `default_profiles` WRITE;
/*!40000 ALTER TABLE `default_profiles` DISABLE KEYS */;

INSERT INTO `default_profiles` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `user_id`, `display_name`, `first_name`, `last_name`, `company`, `lang`, `bio`, `dob`, `gender`, `phone`, `mobile`, `address_line1`, `address_line2`, `address_line3`, `postcode`, `website`, `updated_on`)
VALUES
	(1,NULL,NULL,NULL,NULL,1,'Xavier Amoros','Xavier','Amoros','','en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,'2013-02-18 20:04:42',NULL,1,1,2,'testuser1','testuser1 firstname','testuser1 lastname',NULL,'en',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `default_profiles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_redirects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_redirects`;

CREATE TABLE `default_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(3) NOT NULL DEFAULT '302',
  PRIMARY KEY (`id`),
  KEY `from` (`from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table default_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_settings`;

CREATE TABLE `default_settings` (
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox') COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_required` int(1) NOT NULL,
  `is_gui` int(1) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`slug`),
  UNIQUE KEY `unique_slug` (`slug`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `default_settings` WRITE;
/*!40000 ALTER TABLE `default_settings` DISABLE KEYS */;

INSERT INTO `default_settings` (`slug`, `title`, `description`, `type`, `default`, `value`, `options`, `is_required`, `is_gui`, `module`, `order`)
VALUES
	('activation_email','Activation Email','Send out an e-mail with an activation link when a user signs up. Disable this so that admins must manually activate each account.','radio','1','','1=Enabled|0=Disabled',0,1,'users',961),
	('addons_upload','Addons Upload Permissions','Keeps mere admins from uploading addons by default','text','0','1','',1,0,'',0),
	('admin_force_https','Force HTTPS for Control Panel?','Allow only the HTTPS protocol when using the Control Panel?','radio','0','','1=Yes|0=No',1,1,'',0),
	('admin_theme','Control Panel Theme','Select the theme for the control panel.','','','pyrocms','func:get_themes',1,0,'',0),
	('akismet_api_key','Akismet API Key','Akismet is a spam-blocker from the WordPress team. It keeps spam under control without forcing users to get past human-checking CAPTCHA forms.','text','','','',0,1,'integration',981),
	('api_enabled','API Enabled','Allow API access to all modules which have an API controller.','select','0','0','0=Disabled|1=Enabled',0,0,'api',0),
	('api_user_keys','API User Keys','Allow users to sign up for API keys (if the API is Enabled).','select','0','0','0=Disabled|1=Enabled',0,0,'api',0),
	('auto_username','Auto Username','Create the username automatically, meaning users can skip making one on registration.','radio','1','','1=Enabled|0=Disabled',0,1,'users',964),
	('cdn_domain','CDN Domain','CDN domains allow you to offload static content to various edge servers, like Amazon CloudFront or MaxCDN.','text','','','',0,1,'integration',1000),
	('ckeditor_config','CKEditor Config','You can find a list of valid configuration items in <a target=\"_blank\" href=\"http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html\">CKEditor\'s documentation.</a>','textarea','','{{# this is a wysiwyg-simple editor customized for the blog module (it allows images to be inserted) #}}\n$(\'textarea.blog.wysiwyg-simple\').ckeditor({\n	toolbar: [\n		[\'pyroimages\'],\n		[\'Bold\', \'Italic\', \'-\', \'NumberedList\', \'BulletedList\', \'-\', \'Link\', \'Unlink\']\n	  ],\n	extraPlugins: \'pyroimages\',\n	width: \'99%\',\n	height: 100,\n	dialog_backgroundCoverColor: \'#000\',\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\n	language: \'{{ global:current_language }}\'\n});\n\n{{# this is the config for all wysiwyg-simple textareas #}}\n$(\'textarea.wysiwyg-simple\').ckeditor({\n	toolbar: [\n		[\'Bold\', \'Italic\', \'-\', \'NumberedList\', \'BulletedList\', \'-\', \'Link\', \'Unlink\']\n	  ],\n	width: \'99%\',\n	height: 100,\n	dialog_backgroundCoverColor: \'#000\',\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\n	language: \'{{ global:current_language }}\'\n});\n\n{{# and this is the advanced editor #}}\n$(\'textarea.wysiwyg-advanced\').ckeditor({\n	toolbar: [\n		[\'Maximize\'],\n		[\'pyroimages\', \'pyrofiles\'],\n		[\'Cut\',\'Copy\',\'Paste\',\'PasteFromWord\'],\n		[\'Undo\',\'Redo\',\'-\',\'Find\',\'Replace\'],\n		[\'Link\',\'Unlink\'],\n		[\'Table\',\'HorizontalRule\',\'SpecialChar\'],\n		[\'Bold\',\'Italic\',\'StrikeThrough\'],\n		[\'JustifyLeft\',\'JustifyCenter\',\'JustifyRight\',\'JustifyBlock\',\'-\',\'BidiLtr\',\'BidiRtl\'],\n		[\'Format\', \'FontSize\', \'Subscript\',\'Superscript\', \'NumberedList\',\'BulletedList\',\'Outdent\',\'Indent\',\'Blockquote\'],\n		[\'ShowBlocks\', \'RemoveFormat\', \'Source\']\n	],\n	extraPlugins: \'pyroimages,pyrofiles\',\n	width: \'99%\',\n	height: 400,\n	dialog_backgroundCoverColor: \'#000\',\n	removePlugins: \'elementspath\',\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\n	language: \'{{ global:current_language }}\'\n});','',1,1,'wysiwyg',993),
	('comment_markdown','Allow Markdown','Do you want to allow visitors to post comments using Markdown?','select','0','0','0=Text Only|1=Allow Markdown',1,1,'comments',965),
	('comment_order','Comment Order','Sort order in which to display comments.','select','ASC','ASC','ASC=Oldest First|DESC=Newest First',1,1,'comments',966),
	('contact_email','Contact E-mail','All e-mails from users, guests and the site will go to this e-mail address.','text','xaviamoros@gmail.com','','',1,1,'email',979),
	('currency','Currency','The currency symbol for use on products, services, etc.','text','&pound;','&euro;','',1,1,'',994),
	('dashboard_rss','Dashboard RSS Feed','Link to an RSS feed that will be displayed on the dashboard.','text','https://www.pyrocms.com/blog/rss/all.rss','','',0,1,'',990),
	('dashboard_rss_count','Dashboard RSS Items','How many RSS items would you like to display on the dashboard?','text','5','5','',1,1,'',989),
	('date_format','Date Format','How should dates be displayed across the website and control panel? Using the <a target=\"_blank\" href=\"http://php.net/manual/en/function.date.php\">date format</a> from PHP - OR - Using the format of <a target=\"_blank\" href=\"http://php.net/manual/en/function.strftime.php\">strings formatted as date</a> from PHP.','text','Y-m-d','d-m-Y','',1,1,'',995),
	('default_theme','Default Theme','Select the theme you want users to see by default.','','default','base','func:get_themes',1,0,'',0),
	('enable_comments','Enable Comments','Enable comments.','radio','1','1','1=Enabled|0=Disabled',1,1,'comments',968),
	('enable_profiles','Enable profiles','Allow users to add and edit profiles.','radio','1','','1=Enabled|0=Disabled',1,1,'users',963),
	('enable_registration','Enable user registration','Allow users to register in your site.','radio','1','','1=Enabled|0=Disabled',0,1,'users',961),
	('files_cache','Files Cache','When outputting an image via site.com/files what shall we set the cache expiration for?','select','480','480','0=no-cache|1=1-minute|60=1-hour|180=3-hour|480=8-hour|1440=1-day|43200=30-days',1,1,'files',986),
	('files_cf_api_key','Rackspace Cloud Files API Key','You also must provide your Cloud Files API Key. You will find it at the same location as your Username in your Rackspace account.','text','','','',0,1,'files',989),
	('files_cf_username','Rackspace Cloud Files Username','To enable cloud file storage in your Rackspace Cloud Files account please enter your Cloud Files Username. <a href=\"https://manage.rackspacecloud.com/APIAccess.do\">Find your credentials</a>','text','','','',0,1,'files',990),
	('files_enabled_providers','Enabled File Storage Providers','Which file storage providers do you want to enable? (If you enable a cloud provider you must provide valid auth keys below','checkbox','0','0','amazon-s3=Amazon S3|rackspace-cf=Rackspace Cloud Files',0,1,'files',994),
	('files_s3_access_key','Amazon S3 Access Key','To enable cloud file storage in your Amazon S3 account provide your Access Key. <a href=\"https://aws-portal.amazon.com/gp/aws/securityCredentials#access_credentials\">Find your credentials</a>','text','','','',0,1,'files',993),
	('files_s3_geographic_location','Amazon S3 Geographic Location','Either US or EU. If you change this you must also change the S3 URL.','radio','US','US','US=United States|EU=Europe',1,1,'files',991),
	('files_s3_secret_key','Amazon S3 Secret Key','You also must provide your Amazon S3 Secret Key. You will find it at the same location as your Access Key in your Amazon account.','text','','','',0,1,'files',992),
	('files_s3_url','Amazon S3 URL','Change this if using one of Amazon\'s EU locations or a custom domain.','text','http://{{ bucket }}.s3.amazonaws.com/','http://{{ bucket }}.s3.amazonaws.com/','',0,1,'files',991),
	('files_upload_limit','Filesize Limit','Maximum filesize to allow when uploading. Specify the size in MB. Example: 5','text','5','5','',1,1,'files',987),
	('frontend_enabled','Site Status','Use this option to the user-facing part of the site on or off. Useful when you want to take the site down for maintenance.','radio','1','','1=Open|0=Closed',1,1,'',988),
	('ga_email','Google Analytic E-mail','E-mail address used for Google Analytics, we need this to show the graph on the dashboard.','text','','','',0,1,'integration',983),
	('ga_password','Google Analytic Password','This is also needed this to show the graph on the dashboard.','password','','','',0,1,'integration',982),
	('ga_profile','Google Analytic Profile ID','Profile ID for this website in Google Analytics','text','','','',0,1,'integration',984),
	('ga_tracking','Google Tracking Code','Enter your Google Analytic Tracking Code to activate Google Analytics view data capturing. E.g: UA-19483569-6','text','','','',0,1,'integration',985),
	('mail_protocol','Mail Protocol','Select desired email protocol.','select','mail','mail','mail=Mail|sendmail=Sendmail|smtp=SMTP',1,1,'email',977),
	('mail_sendmail_path','Sendmail Path','Path to server sendmail binary.','text','','','',0,1,'email',972),
	('mail_smtp_host','SMTP Host Name','The host name of your smtp server.','text','','','',0,1,'email',976),
	('mail_smtp_pass','SMTP password','SMTP password.','password','','','',0,1,'email',975),
	('mail_smtp_port','SMTP Port','SMTP port number.','text','','','',0,1,'email',974),
	('mail_smtp_user','SMTP User Name','SMTP user name.','text','','','',0,1,'email',973),
	('meta_topic','Meta Topic','Two or three words describing this type of company/website.','text','Content Management','Add your slogan here','',0,1,'',998),
	('moderate_comments','Moderate Comments','Force comments to be approved before they appear on the site.','radio','1','1','1=Enabled|0=Disabled',1,1,'comments',967),
	('records_per_page','Records Per Page','How many records should we show per page in the admin section?','select','25','','10=10|25=25|50=50|100=100',1,1,'',992),
	('registered_email','User Registered Email','Send a notification email to the contact e-mail when someone registers.','radio','1','','1=Enabled|0=Disabled',0,1,'users',962),
	('require_lastname','Require last names?','For some situations, a last name may not be required. Do you want to force users to enter one or not?','radio','1','','1=Required|0=Optional',1,1,'users',962),
	('rss_feed_items','Feed item count','How many items should we show in RSS/blog feeds?','select','25','','10=10|25=25|50=50|100=100',1,1,'',991),
	('server_email','Server E-mail','All e-mails to users will come from this e-mail address.','text','admin@localhost','','',1,1,'email',978),
	('site_lang','Site Language','The native language of the website, used to choose templates of e-mail notifications, contact form, and other features that should not depend on the language of a user.','select','en','en','func:get_supported_lang',1,1,'',997),
	('site_name','Site Name','The name of the website for page titles and for use around the site.','text','Un-named Website','D Line Up','',1,1,'',1000),
	('site_public_lang','Public Languages','Which are the languages really supported and offered on the front-end of your website?','checkbox','en','en','func:get_supported_lang',1,1,'',996),
	('site_slogan','Site Slogan','The slogan of the website for page titles and for use around the site','text','','','',0,1,'',999),
	('twitter_cache','Cache time','How many minutes should your Tweets be stored?','text','300','','',0,1,'twitter',969),
	('twitter_feed_count','Feed Count','How many tweets should be returned to the Twitter feed block?','text','5','','',0,1,'twitter',970),
	('twitter_username','Username','Twitter username.','text','','','',0,1,'twitter',971),
	('unavailable_message','Unavailable Message','When the site is turned off or there is a major problem, this message will show to users.','textarea','Sorry, this website is currently unavailable.','','',0,1,'',987);

/*!40000 ALTER TABLE `default_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_theme_options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_theme_options`;

CREATE TABLE `default_theme_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox') COLLATE utf8_unicode_ci NOT NULL,
  `default` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_required` int(1) NOT NULL,
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `default_theme_options` WRITE;
/*!40000 ALTER TABLE `default_theme_options` DISABLE KEYS */;

INSERT INTO `default_theme_options` (`id`, `slug`, `title`, `description`, `type`, `default`, `value`, `options`, `is_required`, `theme`)
VALUES
	(1,'show_breadcrumbs','Show Breadcrumbs','Would you like to display breadcrumbs?','radio','yes','yes','yes=Yes|no=No',1,'default'),
	(2,'layout','Layout','Which type of layout shall we use?','select','2 column','2 column','2 column=Two Column|full-width=Full Width|full-width-home=Full Width Home Page',1,'default'),
	(3,'cufon_enabled','Use Cufon','Would you like to use Cufon for titles?','radio','yes','yes','yes=Yes|no=No',1,'default'),
	(4,'pyrocms_recent_comments','Recent Comments','Would you like to display recent comments on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'pyrocms'),
	(5,'pyrocms_news_feed','News Feed','Would you like to display the news feed on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'pyrocms'),
	(6,'pyrocms_quick_links','Quick Links','Would you like to display quick links on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'pyrocms'),
	(7,'pyrocms_analytics_graph','Analytics Graph','Would you like to display the graph on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'pyrocms'),
	(20,'background','Background','Choose the default background for the theme.','select','fabric','fabric','black=Black|fabric=Fabric|graph=Graph|leather=Leather|noise=Noise|texture=Texture',1,'base'),
	(21,'slider','Slider','Would you like to display the slider on the homepage?','radio','yes','yes','yes=Yes|no=No',1,'base'),
	(22,'color','Default Theme Color','This changes things like background color, link colors etc…','select','pink','pink','red=Red|orange=Orange|yellow=Yellow|green=Green|blue=Blue|pink=Pink',1,'base'),
	(23,'show_breadcrumbs','Do you want to show breadcrumbs?','If selected it shows a string of breadcrumbs at the top of the page.','radio','yes','yes','yes=Yes|no=No',1,'base');

/*!40000 ALTER TABLE `default_theme_options` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_users`;

CREATE TABLE `default_users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `ip_address` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `activation_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Registered User Information';

LOCK TABLES `default_users` WRITE;
/*!40000 ALTER TABLE `default_users` DISABLE KEYS */;

INSERT INTO `default_users` (`id`, `email`, `password`, `salt`, `group_id`, `ip_address`, `active`, `activation_code`, `created_on`, `last_login`, `username`, `forgotten_password_code`, `remember_code`)
VALUES
	(1,'xaviamoros@gmail.com','19f93d63aed928e70bf7d5c1dc00447ceb9c2aef','6ee45',1,'',1,'',1360768589,1376528213,'xavieramoros',NULL,'ff1b9099a69cacdd63d1b491727e85169db9cdb8'),
	(2,'xavi.amoros@gmail.com','a8407ac0f17f08c100a5f4a435da49472f4f9771','417cab',2,'127.0.0.1',1,NULL,1361210682,1361210695,'testuser1',NULL,NULL);

/*!40000 ALTER TABLE `default_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_variables
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_variables`;

CREATE TABLE `default_variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table default_widget_areas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_widget_areas`;

CREATE TABLE `default_widget_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `default_widget_areas` WRITE;
/*!40000 ALTER TABLE `default_widget_areas` DISABLE KEYS */;

INSERT INTO `default_widget_areas` (`id`, `slug`, `title`)
VALUES
	(1,'sidebar','Sidebar');

/*!40000 ALTER TABLE `default_widget_areas` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_widget_instances
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_widget_instances`;

CREATE TABLE `default_widget_instances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `widget_id` int(11) DEFAULT NULL,
  `widget_area_id` int(11) DEFAULT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table default_widgets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_widgets`;

CREATE TABLE `default_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `enabled` int(1) NOT NULL DEFAULT '1',
  `order` int(10) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `default_widgets` WRITE;
/*!40000 ALTER TABLE `default_widgets` DISABLE KEYS */;

INSERT INTO `default_widgets` (`id`, `slug`, `title`, `description`, `author`, `website`, `version`, `enabled`, `order`, `updated_on`)
VALUES
	(1,'google_maps','a:9:{s:2:\"en\";s:11:\"Google Maps\";s:2:\"el\";s:19:\"Χάρτης Google\";s:2:\"nl\";s:11:\"Google Maps\";s:2:\"br\";s:11:\"Google Maps\";s:2:\"pt\";s:11:\"Google Maps\";s:2:\"ru\";s:17:\"Карты Google\";s:2:\"id\";s:11:\"Google Maps\";s:2:\"fi\";s:11:\"Google Maps\";s:2:\"fr\";s:11:\"Google Maps\";}','a:9:{s:2:\"en\";s:32:\"Display Google Maps on your site\";s:2:\"el\";s:78:\"Προβάλετε έναν Χάρτη Google στον ιστότοπό σας\";s:2:\"nl\";s:27:\"Toon Google Maps in uw site\";s:2:\"br\";s:34:\"Mostra mapas do Google no seu site\";s:2:\"pt\";s:34:\"Mostra mapas do Google no seu site\";s:2:\"ru\";s:80:\"Выводит карты Google на страницах вашего сайта\";s:2:\"id\";s:37:\"Menampilkan Google Maps di Situs Anda\";s:2:\"fi\";s:39:\"Näytä Google Maps kartta sivustollasi\";s:2:\"fr\";s:42:\"Publiez un plan Google Maps sur votre site\";}','Gregory Athons','http://www.gregathons.com','1.0',1,1,1360957838),
	(2,'html','s:4:\"HTML\";','a:9:{s:2:\"en\";s:28:\"Create blocks of custom HTML\";s:2:\"el\";s:80:\"Δημιουργήστε περιοχές με δικό σας κώδικα HTML\";s:2:\"br\";s:41:\"Permite criar blocos de HTML customizados\";s:2:\"pt\";s:41:\"Permite criar blocos de HTML customizados\";s:2:\"nl\";s:30:\"Maak blokken met maatwerk HTML\";s:2:\"ru\";s:83:\"Создание HTML-блоков с произвольным содержимым\";s:2:\"id\";s:24:\"Membuat blok HTML apapun\";s:2:\"fi\";s:32:\"Luo lohkoja omasta HTML koodista\";s:2:\"fr\";s:36:\"Créez des blocs HTML personnalisés\";}','Phil Sturgeon','http://philsturgeon.co.uk/','1.0',1,2,1360957838),
	(3,'login','a:9:{s:2:\"en\";s:5:\"Login\";s:2:\"el\";s:14:\"Σύνδεση\";s:2:\"nl\";s:5:\"Login\";s:2:\"br\";s:5:\"Login\";s:2:\"pt\";s:5:\"Login\";s:2:\"ru\";s:22:\"Вход на сайт\";s:2:\"id\";s:5:\"Login\";s:2:\"fi\";s:13:\"Kirjautuminen\";s:2:\"fr\";s:9:\"Connexion\";}','a:9:{s:2:\"en\";s:36:\"Display a simple login form anywhere\";s:2:\"el\";s:96:\"Προβάλετε μια απλή φόρμα σύνδεσης χρήστη οπουδήποτε\";s:2:\"br\";s:69:\"Permite colocar um formulário de login em qualquer lugar do seu site\";s:2:\"pt\";s:69:\"Permite colocar um formulário de login em qualquer lugar do seu site\";s:2:\"nl\";s:32:\"Toon overal een simpele loginbox\";s:2:\"ru\";s:72:\"Выводит простую форму для входа на сайт\";s:2:\"id\";s:32:\"Menampilkan form login sederhana\";s:2:\"fi\";s:52:\"Näytä yksinkertainen kirjautumislomake missä vain\";s:2:\"fr\";s:54:\"Affichez un formulaire de connexion où vous souhaitez\";}','Phil Sturgeon','http://philsturgeon.co.uk/','1.0',1,3,1360957838),
	(4,'navigation','a:9:{s:2:\"en\";s:10:\"Navigation\";s:2:\"el\";s:16:\"Πλοήγηση\";s:2:\"nl\";s:9:\"Navigatie\";s:2:\"br\";s:11:\"Navegação\";s:2:\"pt\";s:11:\"Navegação\";s:2:\"ru\";s:18:\"Навигация\";s:2:\"id\";s:8:\"Navigasi\";s:2:\"fi\";s:10:\"Navigaatio\";s:2:\"fr\";s:10:\"Navigation\";}','a:9:{s:2:\"en\";s:40:\"Display a navigation group with a widget\";s:2:\"el\";s:100:\"Προβάλετε μια ομάδα στοιχείων πλοήγησης στον ιστότοπο\";s:2:\"nl\";s:38:\"Toon een navigatiegroep met een widget\";s:2:\"br\";s:62:\"Exibe um grupo de links de navegação como widget em seu site\";s:2:\"pt\";s:62:\"Exibe um grupo de links de navegação como widget no seu site\";s:2:\"ru\";s:88:\"Отображает навигационную группу внутри виджета\";s:2:\"id\";s:44:\"Menampilkan grup navigasi menggunakan widget\";s:2:\"fi\";s:37:\"Näytä widgetillä navigaatio ryhmä\";s:2:\"fr\";s:47:\"Affichez un groupe de navigation dans un widget\";}','Phil Sturgeon','http://philsturgeon.co.uk/','1.2',1,4,1360957838),
	(5,'rss_feed','a:9:{s:2:\"en\";s:8:\"RSS Feed\";s:2:\"el\";s:24:\"Τροφοδοσία RSS\";s:2:\"nl\";s:8:\"RSS Feed\";s:2:\"br\";s:8:\"Feed RSS\";s:2:\"pt\";s:8:\"Feed RSS\";s:2:\"ru\";s:31:\"Лента новостей RSS\";s:2:\"id\";s:8:\"RSS Feed\";s:2:\"fi\";s:10:\"RSS Syöte\";s:2:\"fr\";s:8:\"Flux RSS\";}','a:9:{s:2:\"en\";s:41:\"Display parsed RSS feeds on your websites\";s:2:\"el\";s:82:\"Προβάλετε τα περιεχόμενα μιας τροφοδοσίας RSS\";s:2:\"nl\";s:28:\"Toon RSS feeds op uw website\";s:2:\"br\";s:48:\"Interpreta e exibe qualquer feed RSS no seu site\";s:2:\"pt\";s:48:\"Interpreta e exibe qualquer feed RSS no seu site\";s:2:\"ru\";s:94:\"Выводит обработанную ленту новостей на вашем сайте\";s:2:\"id\";s:42:\"Menampilkan kutipan RSS feed di situs Anda\";s:2:\"fi\";s:39:\"Näytä purettu RSS syöte sivustollasi\";s:2:\"fr\";s:39:\"Affichez un flux RSS sur votre site web\";}','Phil Sturgeon','http://philsturgeon.co.uk/','1.2',1,5,1360957838),
	(6,'social_bookmark','a:9:{s:2:\"en\";s:15:\"Social Bookmark\";s:2:\"el\";s:35:\"Κοινωνική δικτύωση\";s:2:\"nl\";s:19:\"Sociale Bladwijzers\";s:2:\"br\";s:15:\"Social Bookmark\";s:2:\"pt\";s:15:\"Social Bookmark\";s:2:\"ru\";s:37:\"Социальные закладки\";s:2:\"id\";s:15:\"Social Bookmark\";s:2:\"fi\";s:24:\"Sosiaalinen kirjanmerkki\";s:2:\"fr\";s:13:\"Liens sociaux\";}','a:9:{s:2:\"en\";s:47:\"Configurable social bookmark links from AddThis\";s:2:\"el\";s:111:\"Παραμετροποιήσιμα στοιχεία κοινωνικής δικτυώσης από το AddThis\";s:2:\"nl\";s:43:\"Voeg sociale bladwijzers toe vanuit AddThis\";s:2:\"br\";s:87:\"Adiciona links de redes sociais usando o AddThis, podendo fazer algumas configurações\";s:2:\"pt\";s:87:\"Adiciona links de redes sociais usando o AddThis, podendo fazer algumas configurações\";s:2:\"ru\";s:90:\"Конфигурируемые социальные закладки с сайта AddThis\";s:2:\"id\";s:60:\"Tautan social bookmark yang dapat dikonfigurasi dari AddThis\";s:2:\"fi\";s:59:\"Konfiguroitava sosiaalinen kirjanmerkki linkit AddThis:stä\";s:2:\"fr\";s:43:\"Liens sociaux personnalisables avec AddThis\";}','Phil Sturgeon','http://philsturgeon.co.uk/','1.0',1,6,1360957838),
	(7,'twitter_feed','a:9:{s:2:\"en\";s:12:\"Twitter Feed\";s:2:\"el\";s:14:\"Ροή Twitter\";s:2:\"fr\";s:12:\"Flux Twitter\";s:2:\"nl\";s:11:\"Twitterfeed\";s:2:\"br\";s:15:\"Feed do Twitter\";s:2:\"pt\";s:15:\"Feed do Twitter\";s:2:\"ru\";s:21:\"Лента Twitter\'а\";s:2:\"id\";s:12:\"Twitter Feed\";s:2:\"fi\";s:14:\"Twitter Syöte\";}','a:9:{s:2:\"en\";s:37:\"Display Twitter feeds on your website\";s:2:\"el\";s:69:\"Προβολή των τελευταίων tweets από το Twitter\";s:2:\"fr\";s:49:\"Afficher les flux Twitter sur votre site Internet\";s:2:\"nl\";s:31:\"Toon Twitterfeeds op uw website\";s:2:\"br\";s:64:\"Mostra os últimos tweets de um usuário do Twitter no seu site.\";s:2:\"pt\";s:66:\"Mostra os últimos tweets de um utilizador do Twitter no seu site.\";s:2:\"ru\";s:98:\"Выводит ленту новостей Twitter на страницах вашего сайта\";s:2:\"id\";s:39:\"Menampilkan koleksi Tweet di situs Anda\";s:2:\"fi\";s:35:\"Näytä Twitter syöte sivustollasi\";}','Phil Sturgeon','http://philsturgeon.co.uk/','1.2',1,7,1360957838),
	(8,'archive','a:7:{s:2:\"en\";s:7:\"Archive\";s:2:\"br\";s:15:\"Arquivo do Blog\";s:2:\"pt\";s:15:\"Arquivo do Blog\";s:2:\"el\";s:33:\"Αρχείο Ιστολογίου\";s:2:\"fr\";s:16:\"Archives du Blog\";s:2:\"ru\";s:10:\"Архив\";s:2:\"id\";s:7:\"Archive\";}','a:7:{s:2:\"en\";s:64:\"Display a list of old months with links to posts in those months\";s:2:\"br\";s:95:\"Mostra uma lista navegação cronológica contendo o índice dos artigos publicados mensalmente\";s:2:\"pt\";s:95:\"Mostra uma lista navegação cronológica contendo o índice dos artigos publicados mensalmente\";s:2:\"el\";s:155:\"Προβάλλει μια λίστα μηνών και συνδέσμους σε αναρτήσεις που έγιναν σε κάθε από αυτούς\";s:2:\"fr\";s:95:\"Permet d\'afficher une liste des mois passés avec des liens vers les posts relatifs à ces mois\";s:2:\"ru\";s:114:\"Выводит список по месяцам со ссылками на записи в этих месяцах\";s:2:\"id\";s:63:\"Menampilkan daftar bulan beserta tautan post di setiap bulannya\";}','Phil Sturgeon','http://philsturgeon.co.uk/','1.0',1,8,1373378477),
	(9,'blog_categories','a:7:{s:2:\"en\";s:15:\"Blog Categories\";s:2:\"br\";s:18:\"Categorias do Blog\";s:2:\"pt\";s:18:\"Categorias do Blog\";s:2:\"el\";s:41:\"Κατηγορίες Ιστολογίου\";s:2:\"fr\";s:19:\"Catégories du Blog\";s:2:\"ru\";s:29:\"Категории Блога\";s:2:\"id\";s:12:\"Kateori Blog\";}','a:7:{s:2:\"en\";s:31:\"Show a list of event categories\";s:2:\"br\";s:57:\"Mostra uma lista de navegação com as categorias do Blog\";s:2:\"pt\";s:57:\"Mostra uma lista de navegação com as categorias do Blog\";s:2:\"el\";s:97:\"Προβάλει την λίστα των κατηγοριών του ιστολογίου σας\";s:2:\"fr\";s:49:\"Permet d\'afficher la liste de Catégories du Blog\";s:2:\"ru\";s:57:\"Выводит список категорий блога\";s:2:\"id\";s:35:\"Menampilkan daftar kategori tulisan\";}','Stephen Cozart','http://github.com/clip/','1.0',1,9,1373378477),
	(10,'latest_posts','a:7:{s:2:\"en\";s:12:\"Latest posts\";s:2:\"br\";s:24:\"Artigos recentes do Blog\";s:2:\"pt\";s:24:\"Artigos recentes do Blog\";s:2:\"el\";s:62:\"Τελευταίες αναρτήσεις ιστολογίου\";s:2:\"fr\";s:17:\"Derniers articles\";s:2:\"ru\";s:31:\"Последние записи\";s:2:\"id\";s:12:\"Post Terbaru\";}','a:7:{s:2:\"en\";s:40:\"Display latest event posts with a widget\";s:2:\"br\";s:81:\"Mostra uma lista de navegação para abrir os últimos artigos publicados no Blog\";s:2:\"pt\";s:81:\"Mostra uma lista de navegação para abrir os últimos artigos publicados no Blog\";s:2:\"el\";s:103:\"Προβάλει τις πιο πρόσφατες αναρτήσεις στο ιστολόγιό σας\";s:2:\"fr\";s:69:\"Permet d\'afficher la liste des derniers posts du event dans un Widget\";s:2:\"ru\";s:100:\"Выводит список последних записей блога внутри виджета\";s:2:\"id\";s:52:\"Menampilkan posting event terbaru menggunakan widget\";}','Erik Berman','http://www.nukleo.fr','1.0',1,10,1373378477);

/*!40000 ALTER TABLE `default_widgets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
