# ************************************************************
# Sequel Pro SQL dump
# Version (null)
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.16)
# Database: crm_api
# Generation Time: 2019-10-09 09:07:23 +0000
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
	(1,'name','收款人','收款人姓名','2019-10-07 18:03:06','2019-10-07 18:03:06'),
	(2,'bankcard','6222021206000093171','银行卡号','2019-10-07 18:03:27','2019-10-07 18:03:27'),
	(3,'bankname','中国银行','开户行','2019-10-07 18:03:41','2019-10-07 18:03:41'),
	(4,'total_amount','10002','每个用户单日可抢单总金额，但剩余金额小于1万时，则无法再抢单','2019-10-07 18:28:53','2019-10-09 16:17:17'),
	(5,'brokerage_fee','0.5','佣金：用户每笔交易得到的佣金，如0.5（100%），则交易10000得到的佣金为50','2019-10-07 18:49:39','2019-10-08 23:34:58'),
	(6,'operation_fee','0.1','平台运营手续费','2019-10-08 23:25:53','2019-10-08 23:29:37'),
	(7,'deposit','4000','用户的风险金小于后台设置的风险金时，无法抢单','2019-10-09 14:03:40','2019-10-09 14:07:46'),
	(8,'parent_brokerage_fee','0.3','下级返佣给上级比例，推荐的用户交易一笔后上级得到的佣金比例（100%）','2019-10-09 14:05:41','2019-10-09 14:05:41'),
	(9,'stop','false','是否暂停交易 true 为暂停 否则为正常','2019-10-09 14:06:48','2019-10-09 15:49:15'),
	(10,'stop_message','暂停交易时提示文字','暂停交易时提示文字','2019-10-09 14:07:22','2019-10-09 14:07:22'),
	(11,'deposit_shortage_message','保证金至少4000','保证金不足时的提示文字','2019-10-09 14:08:50','2019-10-09 15:37:27'),
	(12,'deposit_submit_message','用于用户提交保证金时的提示语','用于用户提交保证金时的提示语','2019-10-09 14:09:21','2019-10-09 14:13:40'),
	(13,'deposit_enough_message','保证金足够时的提示文字','保证金足够时的提示文字','2019-10-09 14:09:51','2019-10-09 14:13:31'),
	(14,'total_amount_shortage_message','用户剩余金额小于1万时的提示文字','用户剩余金额小于1万时的提示文字','2019-10-09 14:11:19','2019-10-09 14:13:24'),
	(15,'grabbed_message','抢单成功后弹框提示语','抢单成功后弹框提示语','2019-10-09 14:12:13','2019-10-09 14:13:11'),
	(16,'no_list_message','后台无单子弹框提示语','后台无单子弹框提示语','2019-10-09 14:13:00','2019-10-09 14:13:00'),
	(17,'account_freeze_message','用户账户被冻结后提示语','用户账户被冻结后提示语','2019-10-09 14:14:48','2019-10-09 14:16:02'),
	(18,'not_completed_message','无论是抢单还是提现，只要还有一笔交易未完成，则不能进行下一次交易时候的提示语','无论是抢单还是提现，只要还有一笔交易未完成，则不能进行下一次交易时候的提示语','2019-10-09 14:15:35','2019-10-09 14:15:35'),
	(19,'complaint_message','用户点击投诉时的警告提示文字 投诉弹框后可取消','用户点击投诉时的警告提示文字 投诉弹框后可取消','2019-10-09 14:16:27','2019-10-09 14:16:27'),
	(20,'withdra_unconfirmed_message','提现待确认消息','提现已经有用户打款后的新消息提示文字','2019-10-09 14:17:35','2019-10-09 17:02:40'),
	(21,'payment_confirmed_message','交易确认消息','对方已收到款项后并确认时，付款方的消息提示文字','2019-10-09 14:18:16','2019-10-09 17:05:07');

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
	(35,1,'admin/config','GET','127.0.0.1','[]','2019-10-07 18:54:41','2019-10-07 18:54:41'),
	(36,1,'admin','GET','123.152.174.253','[]','2019-10-08 22:37:46','2019-10-08 22:37:46'),
	(37,1,'admin/config','GET','123.152.174.253','{\"_pjax\":\"#pjax-container\"}','2019-10-08 22:37:49','2019-10-08 22:37:49'),
	(38,1,'admin','GET','127.0.0.1','[]','2019-10-09 14:02:47','2019-10-09 14:02:47'),
	(39,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:02:53','2019-10-09 14:02:53'),
	(40,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:03:08','2019-10-09 14:03:08'),
	(41,1,'admin/config','POST','127.0.0.1','{\"name\":\"deposit\",\"value\":\"4000\",\"description\":\"\\u4fdd\\u8bc1\\u91d1\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 14:03:40','2019-10-09 14:03:40'),
	(42,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 14:03:40','2019-10-09 14:03:40'),
	(43,1,'admin/config/5/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:04:58','2019-10-09 14:04:58'),
	(44,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:05:01','2019-10-09 14:05:01'),
	(45,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:05:01','2019-10-09 14:05:01'),
	(46,1,'admin/config','POST','127.0.0.1','{\"name\":\"parent_brokerage_fee\",\"value\":\"0.3\",\"description\":\"\\u4e0b\\u7ea7\\u8fd4\\u4f63\\u7ed9\\u4e0a\\u7ea7\\u6bd4\\u4f8b\\uff0c\\u63a8\\u8350\\u7684\\u7528\\u6237\\u4ea4\\u6613\\u4e00\\u7b14\\u540e\\u4e0a\\u7ea7\\u5f97\\u5230\\u7684\\u4f63\\u91d1\\u6bd4\\u4f8b\\uff08100%\\uff09\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 14:05:41','2019-10-09 14:05:41'),
	(47,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 14:05:41','2019-10-09 14:05:41'),
	(48,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:05:59','2019-10-09 14:05:59'),
	(49,1,'admin/config','POST','127.0.0.1','{\"name\":\"stop\",\"value\":\"false\",\"description\":\"\\u662f\\u5426\\u6682\\u505c\\u4ea4\\u6613 true \\u4e3a\\u6682\\u505c \\u5426\\u5219\\u4e3a\\u6b63\\u5e38\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 14:06:48','2019-10-09 14:06:48'),
	(50,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 14:06:48','2019-10-09 14:06:48'),
	(51,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:06:57','2019-10-09 14:06:57'),
	(52,1,'admin/config','POST','127.0.0.1','{\"name\":\"stop_message\",\"value\":\"\\u6682\\u505c\\u4ea4\\u6613\\u65f6\\u63d0\\u793a\\u6587\\u5b57\",\"description\":\"\\u6682\\u505c\\u4ea4\\u6613\\u65f6\\u63d0\\u793a\\u6587\\u5b57\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 14:07:22','2019-10-09 14:07:22'),
	(53,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 14:07:22','2019-10-09 14:07:22'),
	(54,1,'admin/config/7/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:07:38','2019-10-09 14:07:38'),
	(55,1,'admin/config/7','PUT','127.0.0.1','{\"name\":\"deposit\",\"value\":\"4000\",\"description\":\"\\u7528\\u6237\\u7684\\u98ce\\u9669\\u91d1\\u5c0f\\u4e8e\\u540e\\u53f0\\u8bbe\\u7f6e\\u7684\\u98ce\\u9669\\u91d1\\u65f6\\uff0c\\u65e0\\u6cd5\\u62a2\\u5355\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 14:07:46','2019-10-09 14:07:46'),
	(56,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 14:07:46','2019-10-09 14:07:46'),
	(57,1,'admin/config/7/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:08:05','2019-10-09 14:08:05'),
	(58,1,'admin/config/7','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:08:07','2019-10-09 14:08:07'),
	(59,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:08:08','2019-10-09 14:08:08'),
	(60,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:08:09','2019-10-09 14:08:09'),
	(61,1,'admin/config','POST','127.0.0.1','{\"name\":\"deposit_shortage\",\"value\":\"\\u4fdd\\u8bc1\\u91d1\\u4e0d\\u8db3\\u65f6\\u7684\\u63d0\\u793a\\u6587\\u5b57\",\"description\":\"\\u4fdd\\u8bc1\\u91d1\\u4e0d\\u8db3\\u65f6\\u7684\\u63d0\\u793a\\u6587\\u5b57\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 14:08:50','2019-10-09 14:08:50'),
	(62,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 14:08:50','2019-10-09 14:08:50'),
	(63,1,'admin/config/11/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:09:01','2019-10-09 14:09:01'),
	(64,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:09:04','2019-10-09 14:09:04'),
	(65,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:09:05','2019-10-09 14:09:05'),
	(66,1,'admin/config','POST','127.0.0.1','{\"name\":\"deposit_submit\",\"value\":\"\\u7528\\u4e8e\\u7528\\u6237\\u63d0\\u4ea4\\u4fdd\\u8bc1\\u91d1\\u65f6\\u7684\\u63d0\\u793a\\u8bed\",\"description\":\"\\u7528\\u4e8e\\u7528\\u6237\\u63d0\\u4ea4\\u4fdd\\u8bc1\\u91d1\\u65f6\\u7684\\u63d0\\u793a\\u8bed\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 14:09:21','2019-10-09 14:09:21'),
	(67,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 14:09:21','2019-10-09 14:09:21'),
	(68,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:09:27','2019-10-09 14:09:27'),
	(69,1,'admin/config','POST','127.0.0.1','{\"name\":\"deposit_enough\",\"value\":\"\\u4fdd\\u8bc1\\u91d1\\u8db3\\u591f\\u65f6\\u7684\\u63d0\\u793a\\u6587\\u5b57\",\"description\":\"\\u4fdd\\u8bc1\\u91d1\\u8db3\\u591f\\u65f6\\u7684\\u63d0\\u793a\\u6587\\u5b57\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 14:09:51','2019-10-09 14:09:51'),
	(70,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 14:09:51','2019-10-09 14:09:51'),
	(71,1,'admin/config/4/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:10:07','2019-10-09 14:10:07'),
	(72,1,'admin/config/4','PUT','127.0.0.1','{\"name\":\"total_amount\",\"value\":\"500000\",\"description\":\"\\u6bcf\\u4e2a\\u7528\\u6237\\u5355\\u65e5\\u53ef\\u62a2\\u5355\\u603b\\u91d1\\u989d\\uff0c\\u4f46\\u5269\\u4f59\\u91d1\\u989d\\u5c0f\\u4e8e1\\u4e07\\u65f6\\uff0c\\u5219\\u65e0\\u6cd5\\u518d\\u62a2\\u5355\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 14:10:19','2019-10-09 14:10:19'),
	(73,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 14:10:19','2019-10-09 14:10:19'),
	(74,1,'admin/config/4/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:10:50','2019-10-09 14:10:50'),
	(75,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:10:53','2019-10-09 14:10:53'),
	(76,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:11:00','2019-10-09 14:11:00'),
	(77,1,'admin/config','POST','127.0.0.1','{\"name\":\"total_amount_less\",\"value\":\"\\u7528\\u6237\\u5269\\u4f59\\u91d1\\u989d\\u5c0f\\u4e8e1\\u4e07\\u65f6\\u7684\\u63d0\\u793a\\u6587\\u5b57\",\"description\":\"\\u7528\\u6237\\u5269\\u4f59\\u91d1\\u989d\\u5c0f\\u4e8e1\\u4e07\\u65f6\\u7684\\u63d0\\u793a\\u6587\\u5b57\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 14:11:19','2019-10-09 14:11:19'),
	(78,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 14:11:19','2019-10-09 14:11:19'),
	(79,1,'admin/config/11/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:11:23','2019-10-09 14:11:23'),
	(80,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:11:26','2019-10-09 14:11:26'),
	(81,1,'admin/config/14/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:11:28','2019-10-09 14:11:28'),
	(82,1,'admin/config/14','PUT','127.0.0.1','{\"name\":\"total_amount_shortage\",\"value\":\"\\u7528\\u6237\\u5269\\u4f59\\u91d1\\u989d\\u5c0f\\u4e8e1\\u4e07\\u65f6\\u7684\\u63d0\\u793a\\u6587\\u5b57\",\"description\":\"\\u7528\\u6237\\u5269\\u4f59\\u91d1\\u989d\\u5c0f\\u4e8e1\\u4e07\\u65f6\\u7684\\u63d0\\u793a\\u6587\\u5b57\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 14:11:33','2019-10-09 14:11:33'),
	(83,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 14:11:33','2019-10-09 14:11:33'),
	(84,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:11:43','2019-10-09 14:11:43'),
	(85,1,'admin/config','POST','127.0.0.1','{\"name\":\"grabbed\",\"value\":\"\\u62a2\\u5355\\u6210\\u529f\\u540e\\u5f39\\u6846\\u63d0\\u793a\\u8bed\",\"description\":\"\\u62a2\\u5355\\u6210\\u529f\\u540e\\u5f39\\u6846\\u63d0\\u793a\\u8bed\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 14:12:13','2019-10-09 14:12:13'),
	(86,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 14:12:13','2019-10-09 14:12:13'),
	(87,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:12:42','2019-10-09 14:12:42'),
	(88,1,'admin/config','POST','127.0.0.1','{\"name\":\"no_list_message\",\"value\":\"\\u540e\\u53f0\\u65e0\\u5355\\u5b50\\u5f39\\u6846\\u63d0\\u793a\\u8bed\",\"description\":\"\\u540e\\u53f0\\u65e0\\u5355\\u5b50\\u5f39\\u6846\\u63d0\\u793a\\u8bed\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 14:13:00','2019-10-09 14:13:00'),
	(89,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 14:13:00','2019-10-09 14:13:00'),
	(90,1,'admin/config/15/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:13:03','2019-10-09 14:13:03'),
	(91,1,'admin/config/15','PUT','127.0.0.1','{\"name\":\"grabbed_message\",\"value\":\"\\u62a2\\u5355\\u6210\\u529f\\u540e\\u5f39\\u6846\\u63d0\\u793a\\u8bed\",\"description\":\"\\u62a2\\u5355\\u6210\\u529f\\u540e\\u5f39\\u6846\\u63d0\\u793a\\u8bed\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 14:13:11','2019-10-09 14:13:11'),
	(92,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 14:13:11','2019-10-09 14:13:11'),
	(93,1,'admin/config/14/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:13:20','2019-10-09 14:13:20'),
	(94,1,'admin/config/14','PUT','127.0.0.1','{\"name\":\"total_amount_shortage_message\",\"value\":\"\\u7528\\u6237\\u5269\\u4f59\\u91d1\\u989d\\u5c0f\\u4e8e1\\u4e07\\u65f6\\u7684\\u63d0\\u793a\\u6587\\u5b57\",\"description\":\"\\u7528\\u6237\\u5269\\u4f59\\u91d1\\u989d\\u5c0f\\u4e8e1\\u4e07\\u65f6\\u7684\\u63d0\\u793a\\u6587\\u5b57\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 14:13:24','2019-10-09 14:13:24'),
	(95,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 14:13:24','2019-10-09 14:13:24'),
	(96,1,'admin/config/13/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:13:27','2019-10-09 14:13:27'),
	(97,1,'admin/config/13','PUT','127.0.0.1','{\"name\":\"deposit_enough_message\",\"value\":\"\\u4fdd\\u8bc1\\u91d1\\u8db3\\u591f\\u65f6\\u7684\\u63d0\\u793a\\u6587\\u5b57\",\"description\":\"\\u4fdd\\u8bc1\\u91d1\\u8db3\\u591f\\u65f6\\u7684\\u63d0\\u793a\\u6587\\u5b57\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 14:13:31','2019-10-09 14:13:31'),
	(98,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 14:13:31','2019-10-09 14:13:31'),
	(99,1,'admin/config/12/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:13:36','2019-10-09 14:13:36'),
	(100,1,'admin/config/12','PUT','127.0.0.1','{\"name\":\"deposit_submit_message\",\"value\":\"\\u7528\\u4e8e\\u7528\\u6237\\u63d0\\u4ea4\\u4fdd\\u8bc1\\u91d1\\u65f6\\u7684\\u63d0\\u793a\\u8bed\",\"description\":\"\\u7528\\u4e8e\\u7528\\u6237\\u63d0\\u4ea4\\u4fdd\\u8bc1\\u91d1\\u65f6\\u7684\\u63d0\\u793a\\u8bed\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 14:13:40','2019-10-09 14:13:40'),
	(101,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 14:13:40','2019-10-09 14:13:40'),
	(102,1,'admin/config/11/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:13:44','2019-10-09 14:13:44'),
	(103,1,'admin/config/11','PUT','127.0.0.1','{\"name\":\"deposit_shortage_message\",\"value\":\"\\u4fdd\\u8bc1\\u91d1\\u4e0d\\u8db3\\u65f6\\u7684\\u63d0\\u793a\\u6587\\u5b57\",\"description\":\"\\u4fdd\\u8bc1\\u91d1\\u4e0d\\u8db3\\u65f6\\u7684\\u63d0\\u793a\\u6587\\u5b57\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 14:13:47','2019-10-09 14:13:47'),
	(104,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 14:13:47','2019-10-09 14:13:47'),
	(105,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:14:35','2019-10-09 14:14:35'),
	(106,1,'admin/config','POST','127.0.0.1','{\"name\":\"account_freeze\",\"value\":\"\\u7528\\u6237\\u8d26\\u6237\\u88ab\\u51bb\\u7ed3\\u540e\\u63d0\\u793a\\u8bed\",\"description\":\"\\u7528\\u6237\\u8d26\\u6237\\u88ab\\u51bb\\u7ed3\\u540e\\u63d0\\u793a\\u8bed\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 14:14:48','2019-10-09 14:14:48'),
	(107,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 14:14:48','2019-10-09 14:14:48'),
	(108,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:15:13','2019-10-09 14:15:13'),
	(109,1,'admin/config','POST','127.0.0.1','{\"name\":\"not_completed_message\",\"value\":\"\\u65e0\\u8bba\\u662f\\u62a2\\u5355\\u8fd8\\u662f\\u63d0\\u73b0\\uff0c\\u53ea\\u8981\\u8fd8\\u6709\\u4e00\\u7b14\\u4ea4\\u6613\\u672a\\u5b8c\\u6210\\uff0c\\u5219\\u4e0d\\u80fd\\u8fdb\\u884c\\u4e0b\\u4e00\\u6b21\\u4ea4\\u6613\\u65f6\\u5019\\u7684\\u63d0\\u793a\\u8bed\",\"description\":\"\\u65e0\\u8bba\\u662f\\u62a2\\u5355\\u8fd8\\u662f\\u63d0\\u73b0\\uff0c\\u53ea\\u8981\\u8fd8\\u6709\\u4e00\\u7b14\\u4ea4\\u6613\\u672a\\u5b8c\\u6210\\uff0c\\u5219\\u4e0d\\u80fd\\u8fdb\\u884c\\u4e0b\\u4e00\\u6b21\\u4ea4\\u6613\\u65f6\\u5019\\u7684\\u63d0\\u793a\\u8bed\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 14:15:35','2019-10-09 14:15:35'),
	(110,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 14:15:35','2019-10-09 14:15:35'),
	(111,1,'admin/config/17/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:15:57','2019-10-09 14:15:57'),
	(112,1,'admin/config/17','PUT','127.0.0.1','{\"name\":\"account_freeze_message\",\"value\":\"\\u7528\\u6237\\u8d26\\u6237\\u88ab\\u51bb\\u7ed3\\u540e\\u63d0\\u793a\\u8bed\",\"description\":\"\\u7528\\u6237\\u8d26\\u6237\\u88ab\\u51bb\\u7ed3\\u540e\\u63d0\\u793a\\u8bed\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 14:16:02','2019-10-09 14:16:02'),
	(113,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 14:16:02','2019-10-09 14:16:02'),
	(114,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:16:13','2019-10-09 14:16:13'),
	(115,1,'admin/config','POST','127.0.0.1','{\"name\":\"complaint_message\",\"value\":\"\\u7528\\u6237\\u70b9\\u51fb\\u6295\\u8bc9\\u65f6\\u7684\\u8b66\\u544a\\u63d0\\u793a\\u6587\\u5b57 \\u6295\\u8bc9\\u5f39\\u6846\\u540e\\u53ef\\u53d6\\u6d88\",\"description\":\"\\u7528\\u6237\\u70b9\\u51fb\\u6295\\u8bc9\\u65f6\\u7684\\u8b66\\u544a\\u63d0\\u793a\\u6587\\u5b57 \\u6295\\u8bc9\\u5f39\\u6846\\u540e\\u53ef\\u53d6\\u6d88\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 14:16:27','2019-10-09 14:16:27'),
	(116,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 14:16:27','2019-10-09 14:16:27'),
	(117,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:17:07','2019-10-09 14:17:07'),
	(118,1,'admin/config','POST','127.0.0.1','{\"name\":\"withdra_unconfirmed_message\",\"value\":\"\\u63d0\\u73b0\\u5f85\\u786e\\u8ba4\\u6d88\\u606f\",\"description\":\"\\u63d0\\u73b0\\u5f85\\u786e\\u8ba4\\u6d88\\u606f\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 14:17:35','2019-10-09 14:17:35'),
	(119,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 14:17:35','2019-10-09 14:17:35'),
	(120,1,'admin/config/20/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:17:44','2019-10-09 14:17:44'),
	(121,1,'admin/config/20','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:17:45','2019-10-09 14:17:45'),
	(122,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:17:47','2019-10-09 14:17:47'),
	(123,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:17:47','2019-10-09 14:17:47'),
	(124,1,'admin/config','POST','127.0.0.1','{\"name\":\"payment_unconfirmed_message\",\"value\":\"\\u4ed8\\u6b3e\\u5f85\\u786e\\u8ba4\\u6d88\\u606f\",\"description\":\"\\u4ed8\\u6b3e\\u5f85\\u786e\\u8ba4\\u6d88\\u606f\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 14:18:16','2019-10-09 14:18:16'),
	(125,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 14:18:16','2019-10-09 14:18:16'),
	(126,1,'admin/config/13/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:37:38','2019-10-09 14:37:38'),
	(127,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 14:41:33','2019-10-09 14:41:33'),
	(128,1,'admin/config/13/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 15:12:31','2019-10-09 15:12:31'),
	(129,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 15:23:43','2019-10-09 15:23:43'),
	(130,1,'admin/config/16/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 15:28:25','2019-10-09 15:28:25'),
	(131,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 15:31:45','2019-10-09 15:31:45'),
	(132,1,'admin/config/15/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 15:31:59','2019-10-09 15:31:59'),
	(133,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 15:33:01','2019-10-09 15:33:01'),
	(134,1,'admin/config/18/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 15:33:17','2019-10-09 15:33:17'),
	(135,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 15:35:06','2019-10-09 15:35:06'),
	(136,1,'admin/config/11/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 15:36:00','2019-10-09 15:36:00'),
	(137,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 15:37:06','2019-10-09 15:37:06'),
	(138,1,'admin/config/11','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 15:37:14','2019-10-09 15:37:14'),
	(139,1,'admin/config/11/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 15:37:16','2019-10-09 15:37:16'),
	(140,1,'admin/config/11','PUT','127.0.0.1','{\"name\":\"deposit_shortage_message\",\"value\":\"\\u4fdd\\u8bc1\\u91d1\\u81f3\\u5c114000\",\"description\":\"\\u4fdd\\u8bc1\\u91d1\\u4e0d\\u8db3\\u65f6\\u7684\\u63d0\\u793a\\u6587\\u5b57\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\\/11\"}','2019-10-09 15:37:27','2019-10-09 15:37:27'),
	(141,1,'admin/config/11','GET','127.0.0.1','[]','2019-10-09 15:37:27','2019-10-09 15:37:27'),
	(142,1,'admin/config/11/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 15:38:58','2019-10-09 15:38:58'),
	(143,1,'admin/config/11','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 15:40:02','2019-10-09 15:40:02'),
	(144,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 15:40:04','2019-10-09 15:40:04'),
	(145,1,'admin/config/12/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 15:40:22','2019-10-09 15:40:22'),
	(146,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 15:45:31','2019-10-09 15:45:31'),
	(147,1,'admin/config/10/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 15:46:56','2019-10-09 15:46:56'),
	(148,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 15:47:02','2019-10-09 15:47:02'),
	(149,1,'admin/config/9/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 15:47:17','2019-10-09 15:47:17'),
	(150,1,'admin/config/9','PUT','127.0.0.1','{\"name\":\"stop\",\"value\":\"true\",\"description\":\"\\u662f\\u5426\\u6682\\u505c\\u4ea4\\u6613 true \\u4e3a\\u6682\\u505c \\u5426\\u5219\\u4e3a\\u6b63\\u5e38\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 15:47:20','2019-10-09 15:47:20'),
	(151,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 15:47:20','2019-10-09 15:47:20'),
	(152,1,'admin/config/9/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 15:49:11','2019-10-09 15:49:11'),
	(153,1,'admin/config/9','PUT','127.0.0.1','{\"name\":\"stop\",\"value\":\"false\",\"description\":\"\\u662f\\u5426\\u6682\\u505c\\u4ea4\\u6613 true \\u4e3a\\u6682\\u505c \\u5426\\u5219\\u4e3a\\u6b63\\u5e38\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 15:49:15','2019-10-09 15:49:15'),
	(154,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 15:49:15','2019-10-09 15:49:15'),
	(155,1,'admin/config/18/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 16:08:43','2019-10-09 16:08:43'),
	(156,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 16:14:59','2019-10-09 16:14:59'),
	(157,1,'admin/config/14/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 16:16:13','2019-10-09 16:16:13'),
	(158,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 16:16:25','2019-10-09 16:16:25'),
	(159,1,'admin/config/9/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 16:16:26','2019-10-09 16:16:26'),
	(160,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 16:17:03','2019-10-09 16:17:03'),
	(161,1,'admin/config/4/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 16:17:07','2019-10-09 16:17:07'),
	(162,1,'admin/config/4','PUT','127.0.0.1','{\"name\":\"total_amount\",\"value\":\"10002\",\"description\":\"\\u6bcf\\u4e2a\\u7528\\u6237\\u5355\\u65e5\\u53ef\\u62a2\\u5355\\u603b\\u91d1\\u989d\\uff0c\\u4f46\\u5269\\u4f59\\u91d1\\u989d\\u5c0f\\u4e8e1\\u4e07\\u65f6\\uff0c\\u5219\\u65e0\\u6cd5\\u518d\\u62a2\\u5355\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-09 16:17:17','2019-10-09 16:17:17'),
	(163,1,'admin/config','GET','127.0.0.1','[]','2019-10-09 16:17:17','2019-10-09 16:17:17'),
	(164,1,'admin/config/17/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 16:29:25','2019-10-09 16:29:25'),
	(165,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 16:44:22','2019-10-09 16:44:22'),
	(166,1,'admin/config/19/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 16:45:17','2019-10-09 16:45:17'),
	(167,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 16:59:47','2019-10-09 16:59:47'),
	(168,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}','2019-10-09 17:00:01','2019-10-09 17:00:01'),
	(169,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"page\":\"2\",\"per_page\":\"30\"}','2019-10-09 17:00:04','2019-10-09 17:00:04'),
	(170,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"page\":\"1\",\"per_page\":\"30\"}','2019-10-09 17:00:04','2019-10-09 17:00:04'),
	(171,1,'admin/config/21/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 17:00:49','2019-10-09 17:00:49'),
	(172,1,'admin/config/21','PUT','127.0.0.1','{\"name\":\"payment_unconfirmed_message\",\"value\":\"\\u4ed8\\u6b3e\\u5f85\\u786e\\u8ba4\\u6d88\\u606f\",\"description\":\"\\u5bf9\\u65b9\\u5df2\\u6536\\u5230\\u6b3e\\u9879\\u540e\\u5e76\\u786e\\u8ba4\\u65f6\\uff0c\\u4ed8\\u6b3e\\u65b9\\u7684\\u6d88\\u606f\\u63d0\\u793a\\u6587\\u5b57\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config?&page=1&per_page=30\"}','2019-10-09 17:00:55','2019-10-09 17:00:55'),
	(173,1,'admin/config','GET','127.0.0.1','{\"page\":\"1\",\"per_page\":\"30\"}','2019-10-09 17:00:55','2019-10-09 17:00:55'),
	(174,1,'admin/config/21/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 17:00:57','2019-10-09 17:00:57'),
	(175,1,'admin/config','GET','127.0.0.1','{\"page\":\"1\",\"per_page\":\"30\",\"_pjax\":\"#pjax-container\"}','2019-10-09 17:02:29','2019-10-09 17:02:29'),
	(176,1,'admin/config/20/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 17:02:33','2019-10-09 17:02:33'),
	(177,1,'admin/config/20','PUT','127.0.0.1','{\"name\":\"withdra_unconfirmed_message\",\"value\":\"\\u63d0\\u73b0\\u5f85\\u786e\\u8ba4\\u6d88\\u606f\",\"description\":\"\\u63d0\\u73b0\\u5df2\\u7ecf\\u6709\\u7528\\u6237\\u6253\\u6b3e\\u540e\\u7684\\u65b0\\u6d88\\u606f\\u63d0\\u793a\\u6587\\u5b57\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config?&page=1&per_page=30\"}','2019-10-09 17:02:40','2019-10-09 17:02:40'),
	(178,1,'admin/config','GET','127.0.0.1','{\"page\":\"1\",\"per_page\":\"30\"}','2019-10-09 17:02:40','2019-10-09 17:02:40'),
	(179,1,'admin/config/21/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 17:04:48','2019-10-09 17:04:48'),
	(180,1,'admin/config/21','PUT','127.0.0.1','{\"name\":\"payment_confirmed_message\",\"value\":\"\\u4ea4\\u6613\\u786e\\u8ba4\\u6d88\\u606f\",\"description\":\"\\u5bf9\\u65b9\\u5df2\\u6536\\u5230\\u6b3e\\u9879\\u540e\\u5e76\\u786e\\u8ba4\\u65f6\\uff0c\\u4ed8\\u6b3e\\u65b9\\u7684\\u6d88\\u606f\\u63d0\\u793a\\u6587\\u5b57\",\"_token\":\"8Dcv3dCKq8ESC5wI9TAt90HfosFk0DoOhxyBwONB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config?&page=1&per_page=30\"}','2019-10-09 17:05:07','2019-10-09 17:05:07'),
	(181,1,'admin/config','GET','127.0.0.1','{\"page\":\"1\",\"per_page\":\"30\"}','2019-10-09 17:05:07','2019-10-09 17:05:07'),
	(182,1,'admin/config/21/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 17:05:20','2019-10-09 17:05:20');

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
	(1,'admin','$2y$10$i1gW4O351IVMVMzDtVLIruSd7bXOlZetGbWwcGPU0ym8H9Vl/BqkS','Administrator',NULL,'fdVtDoOhHA44TPE5l19Eyuj4vdl29tEFJMTxPhhtFZR46ftPhYsBFWEjmROL','2019-10-07 17:56:52','2019-10-07 17:56:52');

/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table banks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `banks`;

CREATE TABLE `banks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `bank_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '银行名称',
  `bank_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '银行编码',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '银行logo',
  `background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '银行卡背景',
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
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `replay` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '回复',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '类型1:我付款的单子；2:我提现的单子',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态0:待受理；1:客服处理中;2:处理完毕',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `complaints_withdraw_id_unique` (`withdraw_id`)
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
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态0:待审核；1:已确认',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



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
	(17,'2019_10_07_221606_create_complaints_table',5),
	(18,'2019_10_08_142509_create_messages_table',6);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`)
VALUES
	('208492a2d972bb85b7018757a611ac5e26f6505dd10ae810420aa6213809af45b5965b3cba8b707f',6,2,NULL,'[]',0,'2019-10-08 22:00:05','2019-10-08 22:00:05','2019-10-23 22:00:04'),
	('29f0168bcfb7ec9d0605fad50ccd25a67c61ccc0df769f0f50fd92ff86036ac43533ed937b9fa25a',7,2,NULL,'[]',0,'2019-10-08 22:04:02','2019-10-08 22:04:02','2019-10-23 22:04:02'),
	('2b7111dbeebd20b3032d093d16df696e6763aad65b420f1a787db7764d2778345de3ca1c4d9010c0',1,2,NULL,'[]',0,'2019-10-07 13:19:27','2019-10-07 13:19:27','2019-10-22 13:19:27'),
	('6e74b6c03b6372fbe2305f02eb0b4d1063b6b6a70b35bfb7b63383db6089a00fd70f3959c23c9f0f',6,2,NULL,'[]',0,'2019-10-08 22:35:22','2019-10-08 22:35:22','2019-10-23 22:35:22'),
	('78eddb4dc97f084ae8578d347e2c6904d62ccdd1cde7c2f5be80849e7643177bbf43c8b23df094f7',6,2,NULL,'[]',0,'2019-10-08 23:39:38','2019-10-08 23:39:38','2019-10-23 23:39:38'),
	('8ffc018aaf2d1316f3667d6646d065afa63c66ff5e68cc788d4a8bca423f006c074a3e935ee58fbb',6,2,NULL,'[]',0,'2019-10-08 20:59:08','2019-10-08 20:59:08','2019-10-23 20:59:07'),
	('a5fa0b0ab359fa18ea2749a339b9bd249c15dea29ed085599a55003f5013751339b440147963a847',1,2,NULL,'[]',0,'2019-10-07 13:34:49','2019-10-07 13:34:49','2019-10-22 13:34:49'),
	('b050861c4385fcc32564fe5b3b944248e5e4f7372da93215102032cc217ca46e4f785a76468086c2',6,2,NULL,'[]',0,'2019-10-09 14:28:40','2019-10-09 14:28:40','2019-10-24 14:28:40'),
	('c00ec24f79ad1edee2b9c3d0c0ffb667e5d939eff8a2e21ea05be7b5b5f177b206c99c1afded26da',6,2,NULL,'[]',0,'2019-10-09 00:07:40','2019-10-09 00:07:40','2019-10-24 00:07:40'),
	('efc7213a0c666ba8330cec3335e47532faa73c5e92b8b0081c558306146e6d0f0c6721b45996dd88',1,2,NULL,'[]',0,'2019-10-07 13:25:44','2019-10-07 13:25:44','2019-10-22 13:25:43');

/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;


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
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
	('3f86b10dc63d9351e3f298580bd6c224d45d6cbe69bdcae343ef2b9e729b0875d67abdcff1e58d44','b050861c4385fcc32564fe5b3b944248e5e4f7372da93215102032cc217ca46e4f785a76468086c2',0,'2019-11-08 14:28:40'),
	('5abd4e05a4569737911f98df836deb35784124f0fc91a824137dffe49162fc0733a8e3dceeab8723','78eddb4dc97f084ae8578d347e2c6904d62ccdd1cde7c2f5be80849e7643177bbf43c8b23df094f7',0,'2019-11-07 23:39:38'),
	('6c4638000b7897756eabc27240800709c93018458ab60b71d9c9d34a7a33c8ec7c79fad09f0dc08c','c00ec24f79ad1edee2b9c3d0c0ffb667e5d939eff8a2e21ea05be7b5b5f177b206c99c1afded26da',0,'2019-11-08 00:07:40'),
	('81522c62ce759ff0cdd253fb9159f0e2d2e7a1e26514d12448dc5af8b98cbd7406818e46d0077236','8ffc018aaf2d1316f3667d6646d065afa63c66ff5e68cc788d4a8bca423f006c074a3e935ee58fbb',0,'2019-11-07 20:59:07'),
	('9f349363f3bbadb68576f8b83cd3374045bcc6cfd26a034a6fcd6e5a900185269590097aece40711','6e74b6c03b6372fbe2305f02eb0b4d1063b6b6a70b35bfb7b63383db6089a00fd70f3959c23c9f0f',0,'2019-11-07 22:35:22'),
	('e8c7a1faa73b61064d43cb9278a53539b6da70144dadbe85a16e757a9a1109f99a9d47ee20920a9c','29f0168bcfb7ec9d0605fad50ccd25a67c61ccc0df769f0f50fd92ff86036ac43533ed937b9fa25a',0,'2019-11-07 22:04:02'),
	('f132b8e906a6e5fcbbaa171d22202ae8af79ac25e5f6e4bf27e16fe967ffc9e28d1f04dc7ced7f06','208492a2d972bb85b7018757a611ac5e26f6505dd10ae810420aa6213809af45b5965b3cba8b707f',0,'2019-11-07 22:00:04'),
	('f2641afe20f4a773cb11cdee568694fa3e3112dfaf25913785ff009bd365fb32dbd9e09b49ff1dea','efc7213a0c666ba8330cec3335e47532faa73c5e92b8b0081c558306146e6d0f0c6721b45996dd88',0,'2019-11-06 13:25:43');

/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '邀请人ID',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态1正常；0冻结',
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '可用额度',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `invitation_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邀请码',
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '银行名称',
  `bank_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '银行卡号',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_invitation_code_unique` (`invitation_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table withdraws
# ------------------------------------------------------------

DROP TABLE IF EXISTS `withdraws`;

CREATE TABLE `withdraws` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `payer_user_id` int(10) unsigned DEFAULT NULL COMMENT '付款人ID',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单号',
  `amount` decimal(20,2) NOT NULL COMMENT '提现时金额',
  `withdraw_amount` decimal(20,2) NOT NULL COMMENT '提现金额',
  `brokerage_fee` decimal(20,2) NOT NULL COMMENT '佣金',
  `operation_fee` decimal(20,2) NOT NULL COMMENT '平台运营手续费',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收款人',
  `bankname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '开户银行',
  `bankcard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '银行卡号',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '图片',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态0:待抢单；1:已接单;2:已出款;3:已完成',
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
