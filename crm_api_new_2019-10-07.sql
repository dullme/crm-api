# ************************************************************
# Sequel Pro SQL dump
# Version (null)
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.16)
# Database: crm_api_new
# Generation Time: 2019-10-07 15:35:33 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_config`;

CREATE TABLE `admin_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_config_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_config` WRITE;
/*!40000 ALTER TABLE `admin_config` DISABLE KEYS */;

INSERT INTO `admin_config` (`id`, `name`, `value`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'name','收款人','收款人姓名','2019-10-07 18:03:06','2019-10-07 18:03:06'),
	(2,'bankcard','6222021206000093171','银行卡号','2019-10-07 18:03:27','2019-10-07 18:03:27'),
	(3,'bankname','中国银行','开户行','2019-10-07 18:03:41','2019-10-07 18:03:41'),
	(4,'total_amount','500000','当日可抢总额度','2019-10-07 18:28:53','2019-10-07 18:28:53'),
	(5,'handling_fee','0.5','手续费：用户每笔交易得到的佣金，如0.5（100%），则交易10000得到的佣金为50','2019-10-07 18:49:39','2019-10-07 18:54:41');

/*!40000 ALTER TABLE `admin_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_menu`;

CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`)
VALUES
	(1,0,5,'仪表盘','fa-bar-chart','/',NULL,NULL,'2019-08-21 16:39:17'),
	(2,0,6,'系统管理','fa-tasks',NULL,NULL,NULL,'2019-08-21 16:36:52'),
	(3,2,7,'管理员','fa-users','auth/users',NULL,NULL,'2019-08-21 16:36:52'),
	(4,2,8,'角色','fa-user','auth/roles',NULL,NULL,'2019-08-21 16:36:52'),
	(5,2,9,'权限','fa-ban','auth/permissions',NULL,NULL,'2019-08-21 16:36:52'),
	(6,2,10,'菜单','fa-bars','auth/menu',NULL,NULL,'2019-08-21 16:36:52'),
	(7,2,11,'操作日志','fa-history','auth/logs',NULL,NULL,'2019-08-21 16:36:52'),
	(8,0,12,'Config','fa-toggle-on','config',NULL,'2019-10-07 18:02:12','2019-10-07 18:02:12');

/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_operation_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_operation_log`;

CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_operation_log` WRITE;
/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`)
VALUES
	(1,1,'admin','GET','127.0.0.1','[]','2019-10-07 17:57:47','2019-10-07 17:57:47'),
	(2,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-07 17:57:50','2019-10-07 17:57:50'),
	(3,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-07 17:57:52','2019-10-07 17:57:52'),
	(4,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-07 17:57:53','2019-10-07 17:57:53'),
	(5,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-07 17:57:53','2019-10-07 17:57:53'),
	(6,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-07 17:58:01','2019-10-07 17:58:01'),
	(7,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-07 17:58:05','2019-10-07 17:58:05'),
	(8,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-07 17:58:07','2019-10-07 17:58:07'),
	(9,1,'admin/auth/users','GET','127.0.0.1','[]','2019-10-07 17:58:49','2019-10-07 17:58:49'),
	(10,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-07 17:58:50','2019-10-07 17:58:50'),
	(11,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-07 17:58:52','2019-10-07 17:58:52'),
	(12,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-07 17:58:52','2019-10-07 17:58:52'),
	(13,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-07 17:58:53','2019-10-07 17:58:53'),
	(14,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-07 17:58:54','2019-10-07 17:58:54'),
	(15,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-07 17:58:58','2019-10-07 17:58:58'),
	(16,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-07 18:02:20','2019-10-07 18:02:20'),
	(17,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-07 18:02:21','2019-10-07 18:02:21'),
	(18,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-07 18:02:27','2019-10-07 18:02:27'),
	(19,1,'admin/config','POST','127.0.0.1','{\"name\":\"name\",\"value\":\"\\u6536\\u6b3e\\u4eba\",\"description\":\"\\u6536\\u6b3e\\u4eba\\u59d3\\u540d\",\"_token\":\"E2jpwg22K8pF1WnFdrKQ7iWbcIs73UCYvqWtl7U5\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-07 18:03:06','2019-10-07 18:03:06'),
	(20,1,'admin/config','GET','127.0.0.1','[]','2019-10-07 18:03:06','2019-10-07 18:03:06'),
	(21,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-07 18:03:09','2019-10-07 18:03:09'),
	(22,1,'admin/config','POST','127.0.0.1','{\"name\":\"bankcard\",\"value\":\"6222021206000093171\",\"description\":\"\\u94f6\\u884c\\u5361\\u53f7\",\"_token\":\"E2jpwg22K8pF1WnFdrKQ7iWbcIs73UCYvqWtl7U5\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-07 18:03:27','2019-10-07 18:03:27'),
	(23,1,'admin/config','GET','127.0.0.1','[]','2019-10-07 18:03:27','2019-10-07 18:03:27'),
	(24,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-07 18:03:31','2019-10-07 18:03:31'),
	(25,1,'admin/config','POST','127.0.0.1','{\"name\":\"bankname\",\"value\":\"\\u4e2d\\u56fd\\u94f6\\u884c\",\"description\":\"\\u5f00\\u6237\\u884c\",\"_token\":\"E2jpwg22K8pF1WnFdrKQ7iWbcIs73UCYvqWtl7U5\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-07 18:03:41','2019-10-07 18:03:41'),
	(26,1,'admin/config','GET','127.0.0.1','[]','2019-10-07 18:03:41','2019-10-07 18:03:41'),
	(27,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-07 18:28:13','2019-10-07 18:28:13'),
	(28,1,'admin/config','POST','127.0.0.1','{\"name\":\"total_amount\",\"value\":\"500000\",\"description\":\"\\u5f53\\u65e5\\u53ef\\u62a2\\u603b\\u989d\\u5ea6\",\"_token\":\"E2jpwg22K8pF1WnFdrKQ7iWbcIs73UCYvqWtl7U5\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-07 18:28:53','2019-10-07 18:28:53'),
	(29,1,'admin/config','GET','127.0.0.1','[]','2019-10-07 18:28:53','2019-10-07 18:28:53'),
	(30,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-07 18:49:22','2019-10-07 18:49:22'),
	(31,1,'admin/config','POST','127.0.0.1','{\"name\":\"handling_fee\",\"value\":\"10\",\"description\":\"\\u624b\\u7eed\\u8d39\",\"_token\":\"E2jpwg22K8pF1WnFdrKQ7iWbcIs73UCYvqWtl7U5\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-07 18:49:39','2019-10-07 18:49:39'),
	(32,1,'admin/config','GET','127.0.0.1','[]','2019-10-07 18:49:39','2019-10-07 18:49:39'),
	(33,1,'admin/config/5/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-07 18:54:25','2019-10-07 18:54:25'),
	(34,1,'admin/config/5','PUT','127.0.0.1','{\"name\":\"handling_fee\",\"value\":\"0.5\",\"description\":\"\\u624b\\u7eed\\u8d39\\uff1a\\u7528\\u6237\\u6bcf\\u7b14\\u4ea4\\u6613\\u5f97\\u5230\\u7684\\u4f63\\u91d1\\uff0c\\u59820.5\\uff08100%\\uff09\\uff0c\\u5219\\u4ea4\\u661310000\\u5f97\\u5230\\u7684\\u4f63\\u91d1\\u4e3a50\",\"_token\":\"E2jpwg22K8pF1WnFdrKQ7iWbcIs73UCYvqWtl7U5\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-07 18:54:41','2019-10-07 18:54:41'),
	(35,1,'admin/config','GET','127.0.0.1','[]','2019-10-07 18:54:41','2019-10-07 18:54:41');

/*!40000 ALTER TABLE `admin_operation_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_permissions`;

CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`)
VALUES
	(1,'All permission','*','','*',NULL,NULL),
	(2,'Dashboard','dashboard','GET','/',NULL,NULL),
	(3,'Login','auth.login','','/auth/login\r\n/auth/logout',NULL,NULL),
	(4,'User setting','auth.setting','GET,PUT','/auth/setting',NULL,NULL),
	(5,'Auth management','auth.management','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',NULL,NULL),
	(6,'BANKS列表','banks.list','GET','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(7,'BANKS查看','banks.view','GET','/banks/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(8,'BANKS创建','banks.create','POST','/banks','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(9,'BANKS编辑','banks.edit','PUT,PATCH','/banks/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(10,'BANKS删除','banks.delete','DELETE','/banks/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(11,'BANKS导出','banks.export','GET','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(12,'BANKS筛选','banks.filter','','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(13,'DEPOSITS列表','deposits.list','GET','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(14,'DEPOSITS查看','deposits.view','GET','/deposits/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(15,'DEPOSITS创建','deposits.create','POST','/deposits','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(16,'DEPOSITS编辑','deposits.edit','PUT,PATCH','/deposits/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(17,'DEPOSITS删除','deposits.delete','DELETE','/deposits/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(18,'DEPOSITS导出','deposits.export','GET','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(19,'DEPOSITS筛选','deposits.filter','','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(20,'MIGRATIONS列表','migrations.list','GET','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(21,'MIGRATIONS查看','migrations.view','GET','/migrations/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(22,'MIGRATIONS创建','migrations.create','POST','/migrations','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(23,'MIGRATIONS编辑','migrations.edit','PUT,PATCH','/migrations/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(24,'MIGRATIONS删除','migrations.delete','DELETE','/migrations/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(25,'MIGRATIONS导出','migrations.export','GET','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(26,'MIGRATIONS筛选','migrations.filter','','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(27,'OAUTH-ACCESS-TOKENS列表','oauth-access-tokens.list','GET','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(28,'OAUTH-ACCESS-TOKENS查看','oauth-access-tokens.view','GET','/oauth-access-tokens/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(29,'OAUTH-ACCESS-TOKENS创建','oauth-access-tokens.create','POST','/oauth-access-tokens','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(30,'OAUTH-ACCESS-TOKENS编辑','oauth-access-tokens.edit','PUT,PATCH','/oauth-access-tokens/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(31,'OAUTH-ACCESS-TOKENS删除','oauth-access-tokens.delete','DELETE','/oauth-access-tokens/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(32,'OAUTH-ACCESS-TOKENS导出','oauth-access-tokens.export','GET','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(33,'OAUTH-ACCESS-TOKENS筛选','oauth-access-tokens.filter','','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(34,'OAUTH-AUTH-CODES列表','oauth-auth-codes.list','GET','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(35,'OAUTH-AUTH-CODES查看','oauth-auth-codes.view','GET','/oauth-auth-codes/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(36,'OAUTH-AUTH-CODES创建','oauth-auth-codes.create','POST','/oauth-auth-codes','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(37,'OAUTH-AUTH-CODES编辑','oauth-auth-codes.edit','PUT,PATCH','/oauth-auth-codes/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(38,'OAUTH-AUTH-CODES删除','oauth-auth-codes.delete','DELETE','/oauth-auth-codes/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(39,'OAUTH-AUTH-CODES导出','oauth-auth-codes.export','GET','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(40,'OAUTH-AUTH-CODES筛选','oauth-auth-codes.filter','','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(41,'OAUTH-CLIENTS列表','oauth-clients.list','GET','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(42,'OAUTH-CLIENTS查看','oauth-clients.view','GET','/oauth-clients/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(43,'OAUTH-CLIENTS创建','oauth-clients.create','POST','/oauth-clients','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(44,'OAUTH-CLIENTS编辑','oauth-clients.edit','PUT,PATCH','/oauth-clients/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(45,'OAUTH-CLIENTS删除','oauth-clients.delete','DELETE','/oauth-clients/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(46,'OAUTH-CLIENTS导出','oauth-clients.export','GET','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(47,'OAUTH-CLIENTS筛选','oauth-clients.filter','','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(48,'OAUTH-PERSONAL-ACCESS-CLIENTS列表','oauth-personal-access-clients.list','GET','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(49,'OAUTH-PERSONAL-ACCESS-CLIENTS查看','oauth-personal-access-clients.view','GET','/oauth-personal-access-clients/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(50,'OAUTH-PERSONAL-ACCESS-CLIENTS创建','oauth-personal-access-clients.create','POST','/oauth-personal-access-clients','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(51,'OAUTH-PERSONAL-ACCESS-CLIENTS编辑','oauth-personal-access-clients.edit','PUT,PATCH','/oauth-personal-access-clients/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(52,'OAUTH-PERSONAL-ACCESS-CLIENTS删除','oauth-personal-access-clients.delete','DELETE','/oauth-personal-access-clients/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(53,'OAUTH-PERSONAL-ACCESS-CLIENTS导出','oauth-personal-access-clients.export','GET','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(54,'OAUTH-PERSONAL-ACCESS-CLIENTS筛选','oauth-personal-access-clients.filter','','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(55,'OAUTH-REFRESH-TOKENS列表','oauth-refresh-tokens.list','GET','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(56,'OAUTH-REFRESH-TOKENS查看','oauth-refresh-tokens.view','GET','/oauth-refresh-tokens/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(57,'OAUTH-REFRESH-TOKENS创建','oauth-refresh-tokens.create','POST','/oauth-refresh-tokens','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(58,'OAUTH-REFRESH-TOKENS编辑','oauth-refresh-tokens.edit','PUT,PATCH','/oauth-refresh-tokens/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(59,'OAUTH-REFRESH-TOKENS删除','oauth-refresh-tokens.delete','DELETE','/oauth-refresh-tokens/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(60,'OAUTH-REFRESH-TOKENS导出','oauth-refresh-tokens.export','GET','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(61,'OAUTH-REFRESH-TOKENS筛选','oauth-refresh-tokens.filter','','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(62,'PASSWORD-RESETS列表','password-resets.list','GET','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(63,'PASSWORD-RESETS查看','password-resets.view','GET','/password-resets/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(64,'PASSWORD-RESETS创建','password-resets.create','POST','/password-resets','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(65,'PASSWORD-RESETS编辑','password-resets.edit','PUT,PATCH','/password-resets/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(66,'PASSWORD-RESETS删除','password-resets.delete','DELETE','/password-resets/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(67,'PASSWORD-RESETS导出','password-resets.export','GET','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(68,'PASSWORD-RESETS筛选','password-resets.filter','','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(69,'USERS列表','users.list','GET','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(70,'USERS查看','users.view','GET','/users/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(71,'USERS创建','users.create','POST','/users','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(72,'USERS编辑','users.edit','PUT,PATCH','/users/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(73,'USERS删除','users.delete','DELETE','/users/*','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(74,'USERS导出','users.export','GET','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(75,'USERS筛选','users.filter','','','2019-10-07 17:57:19','2019-10-07 17:57:19'),
	(76,'Admin Config','ext.config',NULL,'/config*','2019-10-07 18:02:12','2019-10-07 18:02:12');

/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_menu`;

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_menu` WRITE;
/*!40000 ALTER TABLE `admin_role_menu` DISABLE KEYS */;

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`)
VALUES
	(1,2,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_permissions`;

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_permissions` WRITE;
/*!40000 ALTER TABLE `admin_role_permissions` DISABLE KEYS */;

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_users`;

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_users` WRITE;
/*!40000 ALTER TABLE `admin_role_users` DISABLE KEYS */;

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_roles`;

CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Administrator','administrator','2019-10-07 17:56:52','2019-10-07 17:56:52');

/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_user_permissions`;

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table admin_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'admin','$2y$10$i1gW4O351IVMVMzDtVLIruSd7bXOlZetGbWwcGPU0ym8H9Vl/BqkS','Administrator',NULL,'fdVtDoOhHA44TPE5l19Eyuj4vdl29tEFJMTxPhhtFZR46ftPhYsBFWEjmROL','2019-10-07 17:56:52','2019-10-07 17:56:52');

/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table banks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `banks`;

CREATE TABLE `banks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `bank_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '银行名称',
  `bank_code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '银行编码',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '银行logo',
  `background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '银行卡背景',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table complaints
# ------------------------------------------------------------

DROP TABLE IF EXISTS `complaints`;

CREATE TABLE `complaints` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `withdraw_id` int(11) NOT NULL COMMENT '提现单ID',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `replay` text COLLATE utf8mb4_unicode_ci COMMENT '回复',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态0:待受理；1:客服处理中;2:处理完毕',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `complaints_withdraw_id_unique` (`withdraw_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;

INSERT INTO `complaints` (`id`, `user_id`, `withdraw_id`, `content`, `replay`, `status`, `created_at`, `updated_at`)
VALUES
	(1,1,4,'dasdasd',NULL,0,'2019-10-07 22:25:59','2019-10-07 22:32:57'),
	(2,1,3,'这里是具体的投诉内容这里是具体的投诉内容这色的 里是具体的投诉内容这里是具体的投诉内容','请把资料发送至邮箱xxxx@163.com',1,'2019-10-07 22:33:14','2019-10-07 22:36:27'),
	(3,1,2,'123123213',NULL,2,'2019-10-07 22:41:20','2019-10-07 22:41:20');

/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table deposits
# ------------------------------------------------------------

DROP TABLE IF EXISTS `deposits`;

CREATE TABLE `deposits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `amount` int(11) NOT NULL COMMENT '金额',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收款人',
  `bankname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '开户银行',
  `bankcard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '银行卡号',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态0:待审核；1:已确认',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `deposits` WRITE;
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;

INSERT INTO `deposits` (`id`, `user_id`, `amount`, `name`, `bankname`, `bankcard`, `images`, `status`, `created_at`, `updated_at`)
VALUES
	(1,1,200,'收款人','中国银行','6222021206000093171','http://crm-api.test/storage/2019_10_07/01b4d7ad835cd7ee5a053b71064559739147.jpeg;http://crm-api.test/storage/2019_10_07/98e2491eb6882e111e657b39ec9599dc1561.jpeg',0,'2019-10-07 18:06:59','2019-10-07 18:06:59');

/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2016_01_04_173148_create_admin_tables',1),
	(4,'2016_06_01_000001_create_oauth_auth_codes_table',1),
	(5,'2016_06_01_000002_create_oauth_access_tokens_table',1),
	(6,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),
	(7,'2016_06_01_000004_create_oauth_clients_table',1),
	(8,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),
	(9,'2019_10_07_092623_create_banks_table',1),
	(10,'2019_10_07_173658_create_deposits_table',2),
	(11,'2017_07_17_040159_create_config_table',3),
	(15,'2019_10_07_191216_create_withdraws_table',4),
	(17,'2019_10_07_221606_create_complaints_table',5);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`)
VALUES
	('2b7111dbeebd20b3032d093d16df696e6763aad65b420f1a787db7764d2778345de3ca1c4d9010c0',1,2,NULL,'[]',0,'2019-10-07 13:19:27','2019-10-07 13:19:27','2019-10-22 13:19:27'),
	('a5fa0b0ab359fa18ea2749a339b9bd249c15dea29ed085599a55003f5013751339b440147963a847',1,2,NULL,'[]',0,'2019-10-07 13:34:49','2019-10-07 13:34:49','2019-10-22 13:34:49'),
	('efc7213a0c666ba8330cec3335e47532faa73c5e92b8b0081c558306146e6d0f0c6721b45996dd88',1,2,NULL,'[]',0,'2019-10-07 13:25:44','2019-10-07 13:25:44','2019-10-22 13:25:43');

/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_auth_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table oauth_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'Laravel Personal Access Client','7EDnSER00uHdhqVyxeq7rlRJ29Guu6A34700ORIB','http://localhost',1,0,0,'2019-10-07 11:50:04','2019-10-07 11:50:04'),
	(2,NULL,'Laravel Password Grant Client','OXnYocQU8POCfHr4nmGvAlHTKBZrhA7zDAAbPBEO','http://localhost',0,1,0,'2019-10-07 11:50:04','2019-10-07 11:50:04');

/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_personal_access_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`)
VALUES
	(1,1,'2019-10-07 11:50:04','2019-10-07 11:50:04');

/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_refresh_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`)
VALUES
	('08cd71d9606a1cf7ae4aabf9ee174cc9c2fec06bce3eab85cdc8d02f68b77ecf5492f90a8d119e31','2b7111dbeebd20b3032d093d16df696e6763aad65b420f1a787db7764d2778345de3ca1c4d9010c0',0,'2019-11-06 13:19:27'),
	('0a85a71faf81f9a26122f62448e116173786b338cec7f1fffc1cbda45834c65aa25816032fbad0b2','a5fa0b0ab359fa18ea2749a339b9bd249c15dea29ed085599a55003f5013751339b440147963a847',0,'2019-11-06 13:34:49'),
	('f2641afe20f4a773cb11cdee568694fa3e3112dfaf25913785ff009bd365fb32dbd9e09b49ff1dea','efc7213a0c666ba8330cec3335e47532faa73c5e92b8b0081c558306146e6d0f0c6721b45996dd88',0,'2019-11-06 13:25:43');

/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '邀请人ID',
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '可用额度',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `invitation_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邀请码',
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '银行名称',
  `bank_card` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '银行卡号',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_invitation_code_unique` (`invitation_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `pid`, `amount`, `username`, `name`, `invitation_code`, `bank_name`, `bank_card`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,0,1.47,'123456','金佳垒','FHOS6J','中国建设银行','6222021206000093171',NULL,'$2y$10$f3y6qhEwWe4UIj6ogRTdDu4xHINVWoHjahSxonOS7DFsrjOi.T2fG',NULL,'2019-10-07 11:50:23','2019-10-07 20:30:19'),
	(3,1,0.00,'123123',NULL,'BHAAO3',NULL,NULL,NULL,'$2y$10$OjYtwFTwjpRPGbQw4kt0A.6/2xQRM7PSCgQ6bmR46Fw.XvvzyKqKW',NULL,'2019-10-07 11:57:04','2019-10-07 11:57:04'),
	(4,3,0.00,'222222',NULL,'FI0V0S',NULL,NULL,NULL,'$2y$10$5BVfx1pzbjhwkZQJL1k.PuKGdt/vxqrstQ1ekKHcIi.uL.cnwjgn2',NULL,'2019-10-07 11:58:54','2019-10-07 11:58:54'),
	(5,0,0.00,'111111',NULL,'D71BMC',NULL,NULL,NULL,'$2y$10$xjzhtCWF0EMf/yQLUPQk1.D0m6dEgQsB5i3s65U2elQJNJPpciGLu',NULL,'2019-10-07 11:59:51','2019-10-07 11:59:51');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table withdraws
# ------------------------------------------------------------

DROP TABLE IF EXISTS `withdraws`;

CREATE TABLE `withdraws` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `payer_user_id` int(10) unsigned DEFAULT NULL COMMENT '付款人ID',
  `order_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单号',
  `amount` decimal(20,2) NOT NULL COMMENT '提现时金额',
  `withdraw_amount` decimal(20,2) NOT NULL COMMENT '提现金额',
  `handing_fee` decimal(20,2) NOT NULL COMMENT '手续费',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收款人',
  `bankname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '开户银行',
  `bankcard` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '银行卡号',
  `images` text COLLATE utf8mb4_unicode_ci COMMENT '图片',
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态0:待抢单；1:已接单;2:已完成',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `withdraws_order_no_unique` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `withdraws` WRITE;
/*!40000 ALTER TABLE `withdraws` DISABLE KEYS */;

INSERT INTO `withdraws` (`id`, `user_id`, `payer_user_id`, `order_no`, `amount`, `withdraw_amount`, `handing_fee`, `name`, `bankname`, `bankcard`, `images`, `remarks`, `status`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,'15704512412992343873',7.53,1.00,0.01,'金佳垒','中国建设银行','6222021206000093171',NULL,NULL,0,'2019-10-07 20:27:21','2019-10-07 20:27:21'),
	(2,1,NULL,'15704512958740380227',6.52,1.00,0.01,'金佳垒','中国建设银行','6222021206000093171',NULL,NULL,1,'2019-10-07 20:28:15','2019-10-07 20:28:15'),
	(3,1,NULL,'15704513590465277954',5.51,1.00,0.01,'金佳垒','中国建设银行','6222021206000093171',NULL,NULL,2,'2019-10-07 20:29:19','2019-10-07 21:34:28'),
	(4,1,NULL,'15704513778221779837',4.50,1.00,0.01,'金佳垒','中国建设银行','6222021206000093171',NULL,NULL,3,'2019-10-07 20:29:37','2019-10-07 22:33:35'),
	(5,1,NULL,'15704514097499874685',3.49,1.00,0.01,'金佳垒','中国建设银行','6222021206000093171',NULL,NULL,3,'2019-10-07 20:30:09','2019-10-07 21:37:27'),
	(6,1,NULL,'15704514198474877830',2.48,1.00,0.01,'金佳垒','中国建设银行','6222021206000093171',NULL,NULL,3,'2019-10-07 20:30:19','2019-10-07 21:36:07');

/*!40000 ALTER TABLE `withdraws` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
