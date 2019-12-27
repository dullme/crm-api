# ************************************************************
# Sequel Pro SQL dump
# Version (null)
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.16)
# Database: crm_api_old
# Generation Time: 2019-12-27 05:21:55 +0000
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_config_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_config` WRITE;
/*!40000 ALTER TABLE `admin_config` DISABLE KEYS */;

INSERT INTO `admin_config` (`id`, `name`, `value`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'name','杨涛','保证金收款人姓名','2019-10-08 10:03:06','2019-12-27 12:27:21'),
	(2,'bankcard','6214837321873451','保证金收款银行卡号','2019-10-08 10:03:27','2019-12-05 18:31:44'),
	(3,'bankname','招商银行','保证金收款银行','2019-10-08 10:03:41','2019-12-05 18:31:35'),
	(4,'total_amount','110000','每个用户单日可抢单总金额，但剩余金额小于1万时，则无法再抢单','2019-10-08 10:28:53','2019-10-10 12:27:59'),
	(5,'brokerage_fee','0.6','佣金：用户每笔交易得到的佣金，如0.5（100%），则交易10000得到的佣金为50','2019-10-08 10:49:39','2019-10-16 07:36:20'),
	(6,'operation_fee','0','平台运营手续费','2019-10-09 15:25:53','2019-10-10 15:03:37'),
	(7,'deposit','2000','用户的保证金小于后台设置的保证金金额时，无法抢单','2019-10-10 06:03:40','2019-11-29 06:26:51'),
	(8,'parent_brokerage_fee','0.1','下级返佣给上级比例，推荐的用户交易一笔后上级得到的佣金比例（100%）','2019-10-10 06:05:41','2019-10-15 17:51:51'),
	(9,'stop','true','是否暂停交易 true 为暂停 否则为正常','2019-10-10 06:06:48','2019-12-11 16:04:41'),
	(10,'stop_message','系统交易结算中...请等待重新开放','暂停交易时提示文字','2019-10-10 06:07:22','2019-10-20 17:50:26'),
	(11,'deposit_shortage_message','您的保证金不足2000，暂无法抢单','保证金不足时的提示文字','2019-10-10 06:08:50','2019-11-29 06:27:09'),
	(12,'deposit_submit_message','保证金提交成功，请等待审核后参与交易，请勿重复提交！','用于用户提交保证金时的提示语','2019-10-10 06:09:21','2019-10-20 19:14:48'),
	(13,'deposit_enough_message','您的保证金已足够，无需再缴纳保证金！','保证金足够时的提示文字','2019-10-10 06:09:51','2019-10-10 15:29:30'),
	(14,'total_amount_shortage_message','您的今日额度已抢完','用户剩余金额小于1万时的提示文字','2019-10-10 06:11:19','2019-10-16 07:44:50'),
	(15,'grabbed_message','抢单成功请在30分钟内打款','抢单成功后弹框提示语','2019-10-10 06:12:13','2019-10-16 07:50:35'),
	(16,'no_list_message','系统暂时未为您成功分配到合适的订单，请稍后再试！','后台无单子弹框提示语','2019-10-10 06:13:00','2019-10-10 15:30:09'),
	(17,'account_freeze_message','您的账户被冻结，可能是您有订单投诉或被投诉，请等待客服介入处理。','用户账户被冻结后提示语','2019-10-10 06:14:48','2019-10-10 15:31:18'),
	(18,'not_completed_message','您有一笔出款或提现订单尚未完成，请等待订单完成后再试！','无论是抢单还是提现，只要还有一笔交易未完成，则不能进行下一次交易时候的提示语','2019-10-10 06:15:35','2019-10-10 15:46:02'),
	(19,'complaint_message','一旦投诉，您双方账号都暂时会被冻结，如果您的交易已经超过了30分钟，您可以选择投诉，但未超过，建议先等待，以免账号冻结后造成不必要的麻烦！','用户点击投诉时的警告提示文字 投诉弹框后可取消','2019-10-10 06:16:27','2019-10-16 07:51:43'),
	(20,'withdra_unconfirmed_message','您有新的订单待处理，请核实后到提现记录里面确认！','提现已经有用户打款后的新消息提示文字','2019-10-10 06:17:35','2019-10-10 15:35:55'),
	(21,'payment_confirmed_message','您的款项对方已确认！','对方已收到款项后并确认时，付款方的消息提示文字','2019-10-10 06:18:16','2019-10-10 15:37:37'),
	(22,'announcement','false','公告信息 当值为 false 时不显示','2019-10-11 03:28:52','2019-12-01 01:29:50'),
	(23,'withdraw_min','1000','提现最小金额','2019-10-13 01:07:12','2019-10-16 07:29:40'),
	(24,'withdraw_max','5000','提现最大金额','2019-10-13 01:07:28','2019-12-07 10:36:04'),
	(25,'withdraw_min_message','提现最小金额1000元','提现最小金额提示语','2019-10-13 01:09:37','2019-10-16 07:27:36'),
	(26,'withdraw_max_message','提现最大金额5000元','提现最大金额提示语','2019-10-13 01:09:59','2019-10-20 08:07:20'),
	(27,'auto_cancel','30','自动取消时间，以分钟为单位（整数），例如：120 为2小时','2019-10-13 01:50:08','2019-10-21 22:28:53'),
	(28,'deposit_free_amount','5000000','总交易额达该值后保证金退还免手续费','2019-10-13 07:23:22','2019-10-16 08:48:03'),
	(29,'deposit_fee','50','保证金退还默认手续费 【deposit_fee】➗ 100  ✖️【保证金】','2019-10-13 07:25:39','2019-10-16 08:09:19'),
	(30,'deposit_back_message','保证金确定提现后，可提现额度将无法使用，账户自动注销！','保证金退回时提示文字','2019-10-13 07:26:13','2019-10-16 08:15:21'),
	(31,'display_days','1','APP的提现记录和交易记录默认显示天数(整数) 单位天','2019-10-13 09:21:19','2019-12-11 21:02:09'),
	(32,'deposit_back_page_message','保证金是您在平台交易的一个风险保证，如需提现，请认真阅读下列文字;保证金提现后，您的账户将会注销，切无法恢复，包括您的代理体系以及剩余金额都将无法恢复;提现到账时间为1-5个工作日;如您的交易额度达到500万元后，提现将免收手续费，但您的代理体系以及剩余金额一样无法恢复','保证金退回页面显示的内容，换行用英文状态下的分号（  ;  ）隔开','2019-10-13 09:47:22','2019-10-16 08:48:22'),
	(33,'grabbed_complaints_minutes','30','用户抢单且提交截图N分钟后(整数)，提现方和抢单方才可投诉','2019-10-13 11:41:53','2019-10-16 08:13:53'),
	(34,'grabbed_complaints_minutes_message','对方打款至当前时间不足30分钟，请稍后再试！','未达到提交截图N分钟内投诉时的提示文字','2019-10-13 11:49:28','2019-10-16 08:34:20'),
	(35,'deposit_back_page_modal_message','保证金提现后您的账户将会注销，余额清零，确认提现？','保证金提现时的二次确认提示语','2019-10-16 04:41:10','2019-10-16 08:57:36'),
	(36,'deduction','20','扣除抢单人N元金额','2019-12-27 11:33:26','2019-12-27 12:37:22'),
	(37,'interval','20','打款和确认收款时间不能小于 N 分钟','2019-12-27 12:50:02','2019-12-27 12:50:02');

/*!40000 ALTER TABLE `admin_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_menu`;

CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`)
VALUES
	(2,0,15,'系统管理','fa-tasks',NULL,NULL,NULL,'2019-12-11 20:47:04'),
	(3,2,16,'管理员','fa-users','auth/users',NULL,NULL,'2019-12-11 20:47:04'),
	(4,2,17,'角色','fa-user','auth/roles',NULL,NULL,'2019-12-11 20:47:04'),
	(5,2,18,'权限','fa-ban','auth/permissions',NULL,NULL,'2019-12-11 20:47:04'),
	(6,2,19,'菜单','fa-bars','auth/menu',NULL,NULL,'2019-12-11 20:47:04'),
	(7,2,20,'操作日志','fa-history','auth/logs',NULL,NULL,'2019-12-11 20:47:04'),
	(8,0,14,'配置','fa-toggle-on','configs',NULL,'2019-10-08 10:02:12','2019-12-27 12:19:54'),
	(9,0,3,'订单管理','fa-book','withdraws',NULL,'2019-10-10 12:56:05','2019-10-14 06:41:53'),
	(10,0,1,'会员管理','fa-users','users',NULL,'2019-10-10 12:56:41','2019-10-13 08:56:48'),
	(11,17,5,'保证金充值','fa-cny','deposits',NULL,'2019-10-10 12:57:01','2019-10-14 06:41:53'),
	(12,0,10,'银行管理','fa-bank','banks',NULL,'2019-10-11 05:30:31','2019-10-14 06:41:53'),
	(13,0,9,'帮助中心','fa-whatsapp','helps',NULL,'2019-10-11 06:16:24','2019-10-14 06:41:53'),
	(14,0,8,'消息管理','fa-comments-o','messages',NULL,'2019-10-11 06:31:17','2019-10-14 06:41:53'),
	(15,0,7,'投诉管理','fa-gavel','complaints',NULL,'2019-10-11 07:28:15','2019-10-14 06:41:53'),
	(16,17,6,'保证金提现','fa-500px','deposit-withdraws',NULL,'2019-10-13 08:56:28','2019-10-14 06:41:53'),
	(17,0,4,'保证金管理','fa-bars',NULL,NULL,'2019-10-13 08:59:19','2019-10-14 06:41:53'),
	(18,0,2,'余额调节','fa-bitcoin','user-amounts',NULL,'2019-10-14 06:41:36','2019-10-14 07:17:22'),
	(19,0,12,'版本管理','fa-bars','versions',NULL,'2019-10-15 02:49:56','2019-12-11 20:47:04'),
	(20,0,13,'文件管理','fa-file-picture-o','media',NULL,'2019-10-15 03:06:03','2019-12-11 20:47:04'),
	(21,0,11,'抢单日志','fa-bars','grab-logs',NULL,'2019-12-11 20:47:00','2019-12-11 20:47:04');

/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_operation_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_operation_log`;

CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_operation_log` WRITE;
/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`)
VALUES
	(1,1,'admin/asd','GET','127.0.0.1','[]','2019-12-27 13:19:16','2019-12-27 13:19:16'),
	(2,1,'admin/asd','GET','127.0.0.1','[]','2019-12-27 13:20:17','2019-12-27 13:20:17'),
	(3,1,'admin/asd','GET','127.0.0.1','[]','2019-12-27 13:21:18','2019-12-27 13:21:18');

/*!40000 ALTER TABLE `admin_operation_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_permissions`;

CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
	(6,'BANKS列表','banks.list','GET','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(7,'BANKS查看','banks.view','GET','/banks/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(8,'BANKS创建','banks.create','POST','/banks','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(9,'BANKS编辑','banks.edit','PUT,PATCH','/banks/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(10,'BANKS删除','banks.delete','DELETE','/banks/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(11,'BANKS导出','banks.export','GET','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(12,'BANKS筛选','banks.filter','','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(13,'DEPOSITS列表','deposits.list','GET','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(14,'DEPOSITS查看','deposits.view','GET','/deposits/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(15,'DEPOSITS创建','deposits.create','POST','/deposits','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(16,'DEPOSITS编辑','deposits.edit','PUT,PATCH','/deposits/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(17,'DEPOSITS删除','deposits.delete','DELETE','/deposits/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(18,'DEPOSITS导出','deposits.export','GET','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(19,'DEPOSITS筛选','deposits.filter','','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(20,'MIGRATIONS列表','migrations.list','GET','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(21,'MIGRATIONS查看','migrations.view','GET','/migrations/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(22,'MIGRATIONS创建','migrations.create','POST','/migrations','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(23,'MIGRATIONS编辑','migrations.edit','PUT,PATCH','/migrations/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(24,'MIGRATIONS删除','migrations.delete','DELETE','/migrations/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(25,'MIGRATIONS导出','migrations.export','GET','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(26,'MIGRATIONS筛选','migrations.filter','','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(27,'OAUTH-ACCESS-TOKENS列表','oauth-access-tokens.list','GET','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(28,'OAUTH-ACCESS-TOKENS查看','oauth-access-tokens.view','GET','/oauth-access-tokens/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(29,'OAUTH-ACCESS-TOKENS创建','oauth-access-tokens.create','POST','/oauth-access-tokens','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(30,'OAUTH-ACCESS-TOKENS编辑','oauth-access-tokens.edit','PUT,PATCH','/oauth-access-tokens/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(31,'OAUTH-ACCESS-TOKENS删除','oauth-access-tokens.delete','DELETE','/oauth-access-tokens/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(32,'OAUTH-ACCESS-TOKENS导出','oauth-access-tokens.export','GET','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(33,'OAUTH-ACCESS-TOKENS筛选','oauth-access-tokens.filter','','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(34,'OAUTH-AUTH-CODES列表','oauth-auth-codes.list','GET','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(35,'OAUTH-AUTH-CODES查看','oauth-auth-codes.view','GET','/oauth-auth-codes/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(36,'OAUTH-AUTH-CODES创建','oauth-auth-codes.create','POST','/oauth-auth-codes','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(37,'OAUTH-AUTH-CODES编辑','oauth-auth-codes.edit','PUT,PATCH','/oauth-auth-codes/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(38,'OAUTH-AUTH-CODES删除','oauth-auth-codes.delete','DELETE','/oauth-auth-codes/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(39,'OAUTH-AUTH-CODES导出','oauth-auth-codes.export','GET','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(40,'OAUTH-AUTH-CODES筛选','oauth-auth-codes.filter','','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(41,'OAUTH-CLIENTS列表','oauth-clients.list','GET','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(42,'OAUTH-CLIENTS查看','oauth-clients.view','GET','/oauth-clients/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(43,'OAUTH-CLIENTS创建','oauth-clients.create','POST','/oauth-clients','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(44,'OAUTH-CLIENTS编辑','oauth-clients.edit','PUT,PATCH','/oauth-clients/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(45,'OAUTH-CLIENTS删除','oauth-clients.delete','DELETE','/oauth-clients/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(46,'OAUTH-CLIENTS导出','oauth-clients.export','GET','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(47,'OAUTH-CLIENTS筛选','oauth-clients.filter','','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(48,'OAUTH-PERSONAL-ACCESS-CLIENTS列表','oauth-personal-access-clients.list','GET','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(49,'OAUTH-PERSONAL-ACCESS-CLIENTS查看','oauth-personal-access-clients.view','GET','/oauth-personal-access-clients/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(50,'OAUTH-PERSONAL-ACCESS-CLIENTS创建','oauth-personal-access-clients.create','POST','/oauth-personal-access-clients','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(51,'OAUTH-PERSONAL-ACCESS-CLIENTS编辑','oauth-personal-access-clients.edit','PUT,PATCH','/oauth-personal-access-clients/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(52,'OAUTH-PERSONAL-ACCESS-CLIENTS删除','oauth-personal-access-clients.delete','DELETE','/oauth-personal-access-clients/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(53,'OAUTH-PERSONAL-ACCESS-CLIENTS导出','oauth-personal-access-clients.export','GET','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(54,'OAUTH-PERSONAL-ACCESS-CLIENTS筛选','oauth-personal-access-clients.filter','','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(55,'OAUTH-REFRESH-TOKENS列表','oauth-refresh-tokens.list','GET','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(56,'OAUTH-REFRESH-TOKENS查看','oauth-refresh-tokens.view','GET','/oauth-refresh-tokens/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(57,'OAUTH-REFRESH-TOKENS创建','oauth-refresh-tokens.create','POST','/oauth-refresh-tokens','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(58,'OAUTH-REFRESH-TOKENS编辑','oauth-refresh-tokens.edit','PUT,PATCH','/oauth-refresh-tokens/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(59,'OAUTH-REFRESH-TOKENS删除','oauth-refresh-tokens.delete','DELETE','/oauth-refresh-tokens/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(60,'OAUTH-REFRESH-TOKENS导出','oauth-refresh-tokens.export','GET','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(61,'OAUTH-REFRESH-TOKENS筛选','oauth-refresh-tokens.filter','','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(62,'PASSWORD-RESETS列表','password-resets.list','GET','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(63,'PASSWORD-RESETS查看','password-resets.view','GET','/password-resets/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(64,'PASSWORD-RESETS创建','password-resets.create','POST','/password-resets','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(65,'PASSWORD-RESETS编辑','password-resets.edit','PUT,PATCH','/password-resets/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(66,'PASSWORD-RESETS删除','password-resets.delete','DELETE','/password-resets/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(67,'PASSWORD-RESETS导出','password-resets.export','GET','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(68,'PASSWORD-RESETS筛选','password-resets.filter','','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(69,'USERS列表','users.list','GET','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(70,'USERS查看','users.view','GET','/users/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(71,'USERS创建','users.create','POST','/users','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(72,'USERS编辑','users.edit','PUT,PATCH','/users/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(73,'USERS删除','users.delete','DELETE','/users/*','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(74,'USERS导出','users.export','GET','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(75,'USERS筛选','users.filter','','','2019-10-08 09:57:19','2019-10-08 09:57:19'),
	(76,'Admin Config','ext.config',NULL,'/config*','2019-10-08 10:02:12','2019-10-08 10:02:12');

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
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
	(1,'Administrator','administrator','2019-10-08 09:56:52','2019-10-08 09:56:52');

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
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'admin','$2y$10$dUaaRx.O1MCaV3NehZkqHORmQBEhftcCcM9uJsG07eFPAc45r562i','Administrator',NULL,'ljJUd5n7V0Qp6ti11TvzTMw2R1e5aRh5TMTFW9N1LapLT3iYNlDe4HUzh5to','2019-10-08 09:56:52','2019-11-29 22:30:38');

/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table banks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `banks`;

CREATE TABLE `banks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `bank_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '银行名称',
  `bank_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '银行编码',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '银行logo',
  `background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '银行卡背景',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;

INSERT INTO `banks` (`id`, `status`, `bank_name`, `bank_code`, `icon`, `background`, `created_at`, `updated_at`)
VALUES
	(1,1,'中国农业银行','','images/nonghang1.png',NULL,'2019-10-11 10:23:33','2019-10-15 16:03:19'),
	(2,1,'中国工商银行','','images/gonghang1.png',NULL,'2019-10-11 10:24:47','2019-10-15 16:03:09'),
	(3,1,'中国建设银行','','images/jianhang1.png',NULL,'2019-10-11 10:25:48','2019-10-15 16:04:15'),
	(4,1,'邮政储蓄银行','','images/youzheng1.png',NULL,'2019-10-11 10:27:04','2019-10-15 16:02:46'),
	(5,1,'中国银行','','images/zhongguoyhang1.png',NULL,'2019-10-11 10:28:05','2019-10-15 16:02:36'),
	(6,1,'招商银行','','images/zhaoshang1.png',NULL,'2019-10-11 10:29:02','2019-10-15 16:02:24'),
	(7,1,'交通银行','','images/jiaotong1.png',NULL,'2019-10-11 10:30:10','2019-10-15 16:04:02'),
	(8,1,'华夏银行','','images/huaxia1.png',NULL,'2019-10-11 10:31:59','2019-10-15 16:02:02'),
	(9,1,'中信银行','','images/zhongxin.png',NULL,'2019-10-11 10:33:48','2019-10-15 16:01:11'),
	(11,1,'浦发银行','','images/timg.png',NULL,'2019-12-03 02:44:47','2019-12-03 02:44:47');

/*!40000 ALTER TABLE `banks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table complaints
# ------------------------------------------------------------

DROP TABLE IF EXISTS `complaints`;

CREATE TABLE `complaints` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `withdraw_id` int(11) unsigned NOT NULL COMMENT '提现单ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `replay` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '回复',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '类型1:我付款的单子；2:我提现的单子',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态0:待受理；1:客服处理中;2:交易正常;3:交易取消',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table deposit_withdraws
# ------------------------------------------------------------

DROP TABLE IF EXISTS `deposit_withdraws`;

CREATE TABLE `deposit_withdraws` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `withdraw_amount` decimal(20,2) NOT NULL COMMENT '提现金额',
  `operation_fee` decimal(20,2) NOT NULL COMMENT '平台运营手续费',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收款人',
  `bankname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '开户银行',
  `bankcard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '银行卡号',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '图片',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态0:已申请；1已完成',
  `payment_at` timestamp NULL DEFAULT NULL COMMENT '确认付款时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `deposit_withdraws_user_id_unique` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table deposits
# ------------------------------------------------------------

DROP TABLE IF EXISTS `deposits`;

CREATE TABLE `deposits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `amount` int(11) NOT NULL COMMENT '金额',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收款人',
  `bankname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '开户银行',
  `bankcard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '银行卡号',
  `remitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '汇款人',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态0:待审核；1:已确认',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table grab_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grab_logs`;

CREATE TABLE `grab_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单号',
  `withdraw_amount` decimal(20,2) NOT NULL COMMENT '提现金额',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grab_logs_order_no_unique` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table helps
# ------------------------------------------------------------

DROP TABLE IF EXISTS `helps`;

CREATE TABLE `helps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `helps` WRITE;
/*!40000 ALTER TABLE `helps` DISABLE KEYS */;

INSERT INTO `helps` (`id`, `title`, `content`, `created_at`, `updated_at`)
VALUES
	(6,'保证金','保证金是为了束约所有用户行为的风险保障，创造良好的支付环境！','2019-10-16 11:09:54','2019-10-16 11:09:54'),
	(7,'用户必读及注意事项！！！','1.用户抢单，完成打款后忘记上传打款截图或忘记点击我已付款，此时对方无法给您点击确认收款，这种情况下所造成的任何损失均由个人承担！\r\n2.用户抢单，如在30分钟内没有完成打款视为放弃本次订单，该笔订单将在30分钟后自动返回抢单区\r\n3.用户抢单，恶意不打款并上传与该笔订单无关的交易截图视为违规操作行为，将面临账户冻结，封号及相关处罚！！！\r\n4.提现用户收到款项后如未及时点击确认将面临被投诉，账号冻结等风险！\r\n5.提现用户未收到款项，请耐心等待，30分钟后可点击投诉按钮进行申诉\r\n最终解释权归聚财通汇所有！','2019-10-16 11:12:56','2019-11-24 06:33:27'),
	(8,'聚财通汇具体操作说明','1.首先下载并注册app,根据提示完善个人信息;并缴纳保证金\r\n\r\n2.进入抢单区开始抢单，根据订单提示完成打款并上传打款截图点击我已付款按钮\r\n\r\n3.完成打款以后请耐心等待对方给予确认收款\r\n4.完成后即可根据首页可提现金额进行提现，等待对方打款，收到款后及时点击确认收款\r\n最终解释权归聚财通汇所有！','2019-10-16 11:13:20','2019-11-24 06:33:07');

/*!40000 ALTER TABLE `helps` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '详情',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '消息类型',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table oauth_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table oauth_auth_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



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



# Dump of table oauth_refresh_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table user_amounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_amounts`;

CREATE TABLE `user_amounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `withdraw_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '提现ID',
  `amount` decimal(20,2) NOT NULL COMMENT '调节值',
  `before_amount` decimal(20,2) NOT NULL COMMENT '调节前金额',
  `after_amount` decimal(20,2) NOT NULL COMMENT '调节后金额',
  `type` int(11) NOT NULL COMMENT '调节方式1:增加；2:减少',
  `source` int(11) NOT NULL DEFAULT '0' COMMENT '调节来源0:后台操作',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '邀请人ID',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态1正常；0冻结；2已注销',
  `vip` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为vip',
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '可用额度',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `invitation_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邀请码',
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '银行名称',
  `bank_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '银行卡号',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_invitation_code_unique` (`invitation_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table versions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `versions`;

CREATE TABLE `versions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '版本号',
  `packge_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新包大小',
  `android_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'android更新地址',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'release' COMMENT '类型',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'force' COMMENT '类型',
  `ios_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ios更新地址',
  `info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '更新详情',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;

INSERT INTO `versions` (`id`, `name`, `number`, `packge_size`, `android_link`, `type`, `method`, `ios_link`, `info`, `created_at`, `updated_at`)
VALUES
	(2170,'聚财通汇','2.1.7','1.2','http://cc.c8080.xyz/storage/file/2.1.7.wgt','release','force',NULL,'修复帮助中心显示问题','2019-10-15 09:05:24','2019-11-24 06:28:58'),
	(3000,'聚财通汇','3.0.0','1.203','http://cc.c8080.xyz/storage/file/3.0.0.wgt','release','force',NULL,'无','2019-11-23 04:45:52','2019-12-03 06:23:39');

/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table withdraws
# ------------------------------------------------------------

DROP TABLE IF EXISTS `withdraws`;

CREATE TABLE `withdraws` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `payer_user_id` int(10) unsigned DEFAULT NULL COMMENT '付款人ID',
  `payer_parent_user_id` int(11) DEFAULT NULL COMMENT '付款人的上级ID',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单号',
  `amount` decimal(20,2) NOT NULL COMMENT '提现时金额',
  `withdraw_amount` decimal(20,2) NOT NULL COMMENT '提现金额',
  `brokerage_fee` decimal(20,2) NOT NULL COMMENT '佣金',
  `parent_brokerage_fee` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '上级佣金',
  `operation_fee` decimal(20,2) NOT NULL COMMENT '平台运营手续费',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收款人',
  `remitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '汇款人',
  `bankname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '开户银行',
  `bankcard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '银行卡号',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '图片',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态0:待抢单；1:已接单;2:已出款;3:交易正常;4:交易取消',
  `vip` int(11) NOT NULL DEFAULT '0' COMMENT '是否为vip',
  `grab_at` timestamp NULL DEFAULT NULL COMMENT '抢单时间',
  `payment_at` timestamp NULL DEFAULT NULL COMMENT '确认付款时间',
  `time_out_at` timestamp NULL DEFAULT NULL COMMENT '订单超时时间',
  `finished_at` timestamp NULL DEFAULT NULL COMMENT '订单结束时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `withdraws_order_no_unique` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
