# ************************************************************
# Sequel Pro SQL dump
# Version (null)
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.16)
# Database: crm_api
# Generation Time: 2019-10-10 09:15:40 +0000
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
	(1,'name','李思思','保证金收款人姓名','2019-10-07 18:03:06','2019-10-09 20:35:12'),
	(2,'bankcard','6222021206000093171','保证金收款银行卡号','2019-10-07 18:03:27','2019-10-09 20:35:26'),
	(3,'bankname','中国银行','保证金开户行','2019-10-07 18:03:41','2019-10-09 20:35:38'),
	(4,'total_amount','110000','每个用户单日可抢单总金额，但剩余金额小于1万时，则无法再抢单','2019-10-07 18:28:53','2019-10-09 20:27:59'),
	(5,'brokerage_fee','0.5','佣金：用户每笔交易得到的佣金，如0.5（100%），则交易10000得到的佣金为50','2019-10-07 18:49:39','2019-10-08 23:34:58'),
	(6,'operation_fee','0','平台运营手续费','2019-10-08 23:25:53','2019-10-09 23:03:37'),
	(7,'deposit','4000','用户的风险金小于后台设置的风险金时，无法抢单','2019-10-09 14:03:40','2019-10-09 14:07:46'),
	(8,'parent_brokerage_fee','0.3','下级返佣给上级比例，推荐的用户交易一笔后上级得到的佣金比例（100%）','2019-10-09 14:05:41','2019-10-09 14:05:41'),
	(9,'stop','123','是否暂停交易 true 为暂停 否则为正常','2019-10-09 14:06:48','2019-10-09 20:27:23'),
	(10,'stop_message','系统交易结算中...，请等待重新开放','暂停交易时提示文字','2019-10-09 14:07:22','2019-10-09 20:27:01'),
	(11,'deposit_shortage_message','您的保证金不足4000，暂无法抢单','保证金不足时的提示文字','2019-10-09 14:08:50','2019-10-09 20:56:54'),
	(12,'deposit_submit_message','保证金提交成功，请等待后台审核后参与交易，请勿重复提交！','用于用户提交保证金时的提示语','2019-10-09 14:09:21','2019-10-09 20:57:53'),
	(13,'deposit_enough_message','您的保证金已足够，无需再缴纳保证金！','保证金足够时的提示文字','2019-10-09 14:09:51','2019-10-09 23:29:30'),
	(14,'total_amount_shortage_message','用户剩余金额小于1万时的提示文字','用户剩余金额小于1万时的提示文字','2019-10-09 14:11:19','2019-10-09 14:13:24'),
	(15,'grabbed_message','抢单成功请在30分钟内打款','抢单成功后弹框提示语','2019-10-09 14:12:13','2019-10-09 23:32:39'),
	(16,'no_list_message','系统暂时未为您成功分配到合适的订单，请稍后再试！','后台无单子弹框提示语','2019-10-09 14:13:00','2019-10-09 23:30:09'),
	(17,'account_freeze_message','您的账户被冻结，可能是您有订单投诉或被投诉，请等待客服介入处理。','用户账户被冻结后提示语','2019-10-09 14:14:48','2019-10-09 23:31:18'),
	(18,'not_completed_message','您有一笔出款或提现订单尚未完成，请等待订单完成后再试！','无论是抢单还是提现，只要还有一笔交易未完成，则不能进行下一次交易时候的提示语','2019-10-09 14:15:35','2019-10-09 23:46:02'),
	(19,'complaint_message','一旦投诉，您双方账号都暂时会被冻结，如果您的交易已经超过了12小时，您可以选择投诉，但未超过，建议先等待，以免账号冻结后造成不必要的麻烦！','用户点击投诉时的警告提示文字 投诉弹框后可取消','2019-10-09 14:16:27','2019-10-09 23:25:39'),
	(20,'withdra_unconfirmed_message','您有新的订单待处理，请核实后到提现记录里面确认！','提现已经有用户打款后的新消息提示文字','2019-10-09 14:17:35','2019-10-09 23:35:55'),
	(21,'payment_confirmed_message','您的款项对方已确认！','对方已收到款项后并确认时，付款方的消息提示文字','2019-10-09 14:18:16','2019-10-09 23:37:37'),
	(22,'announcement','公告信息信息信息信息信息信息','公告信息','2019-10-10 11:28:52','2019-10-10 11:28:52');

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
	(2,0,10,'系统管理','fa-tasks',NULL,NULL,NULL,'2019-10-10 17:10:02'),
	(3,2,11,'管理员','fa-users','auth/users',NULL,NULL,'2019-10-10 17:10:02'),
	(4,2,12,'角色','fa-user','auth/roles',NULL,NULL,'2019-10-10 17:10:02'),
	(5,2,13,'权限','fa-ban','auth/permissions',NULL,NULL,'2019-10-10 17:10:02'),
	(6,2,14,'菜单','fa-bars','auth/menu',NULL,NULL,'2019-10-10 17:10:02'),
	(7,2,15,'操作日志','fa-history','auth/logs',NULL,NULL,'2019-10-10 17:10:02'),
	(8,0,9,'配置','fa-toggle-on','config',NULL,'2019-10-07 18:02:12','2019-10-10 17:10:02'),
	(9,0,4,'订单管理','fa-book','withdraws',NULL,'2019-10-09 20:56:05','2019-10-10 17:11:20'),
	(10,0,2,'会员管理','fa-users','users',NULL,'2019-10-09 20:56:41','2019-10-10 17:10:41'),
	(11,0,3,'保证金管理','fa-cny','deposits',NULL,'2019-10-09 20:57:01','2019-10-10 17:11:03'),
	(12,0,8,'银行管理','fa-bank','banks',NULL,'2019-10-10 13:30:31','2019-10-10 17:13:05'),
	(13,0,7,'帮助中心','fa-whatsapp','helps',NULL,'2019-10-10 14:16:24','2019-10-10 17:12:48'),
	(14,0,6,'消息管理','fa-comments-o','messages',NULL,'2019-10-10 14:31:17','2019-10-10 17:12:24'),
	(15,0,5,'投诉管理','fa-gavel','complaints',NULL,'2019-10-10 15:28:15','2019-10-10 17:12:11');

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
	(182,1,'admin/config/21/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-09 17:05:20','2019-10-09 17:05:20'),
	(183,1,'admin','GET','60.12.220.56','[]','2019-10-09 20:00:56','2019-10-09 20:00:56'),
	(184,1,'admin','GET','223.88.214.0','[]','2019-10-09 20:01:03','2019-10-09 20:01:03'),
	(185,1,'admin','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:01:19','2019-10-09 20:01:19'),
	(186,1,'admin/config','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:01:23','2019-10-09 20:01:23'),
	(187,1,'admin/config','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:01:27','2019-10-09 20:01:27'),
	(188,1,'admin/config','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:01:31','2019-10-09 20:01:31'),
	(189,1,'admin/config','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:01:35','2019-10-09 20:01:35'),
	(190,1,'admin','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:04:23','2019-10-09 20:04:23'),
	(191,1,'admin/config','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:04:24','2019-10-09 20:04:24'),
	(192,1,'admin/config/create','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:04:40','2019-10-09 20:04:40'),
	(193,1,'admin/config','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:04:43','2019-10-09 20:04:43'),
	(194,1,'admin/auth/users','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:04:52','2019-10-09 20:04:52'),
	(195,1,'admin','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:04:53','2019-10-09 20:04:53'),
	(196,1,'admin','GET','223.88.214.0','[]','2019-10-09 20:11:22','2019-10-09 20:11:22'),
	(197,1,'admin/auth/roles','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:11:33','2019-10-09 20:11:33'),
	(198,1,'admin/auth/users','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:11:34','2019-10-09 20:11:34'),
	(199,1,'admin/auth/users','GET','223.88.214.0','[]','2019-10-09 20:11:38','2019-10-09 20:11:38'),
	(200,1,'admin/auth/users','GET','223.88.214.0','[]','2019-10-09 20:12:42','2019-10-09 20:12:42'),
	(201,1,'admin/config','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:14:26','2019-10-09 20:14:26'),
	(202,1,'admin/config','GET','223.88.214.0','[]','2019-10-09 20:15:24','2019-10-09 20:15:24'),
	(203,1,'admin/config','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:16:51','2019-10-09 20:16:51'),
	(204,1,'admin/config','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}','2019-10-09 20:17:01','2019-10-09 20:17:01'),
	(205,1,'admin/config','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}','2019-10-09 20:17:19','2019-10-09 20:17:19'),
	(206,1,'admin/config','GET','223.88.214.0','{\"page\":\"1\"}','2019-10-09 20:21:19','2019-10-09 20:21:19'),
	(207,1,'admin/config/19/edit','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:22:29','2019-10-09 20:22:29'),
	(208,1,'admin/config/19','PUT','223.88.214.0','{\"name\":\"complaint_message\",\"value\":\"\\u5982\\u679c\\u60a8\\u7684\\u4ea4\\u6613\\u5df2\\u7ecf\\u8d85\\u8fc7\\u4e8612\\u5c0f\\u65f6\\uff0c\\u60a8\\u53ef\\u4ee5\\u9009\\u62e9\\u6295\\u8bc9\\uff0c\\u4f46\\u672a\\u8d85\\u8fc7\\uff0c\\u5efa\\u8bae\\u5148\\u7b49\\u5f85\\uff0c\\u4ee5\\u514d\\u8d26\\u53f7\\u51bb\\u7ed3\\u540e\\u9020\\u6210\\u4e0d\\u5fc5\\u8981\\u7684\\u9ebb\\u70e6\\uff01\",\"description\":\"\\u7528\\u6237\\u70b9\\u51fb\\u6295\\u8bc9\\u65f6\\u7684\\u8b66\\u544a\\u63d0\\u793a\\u6587\\u5b57 \\u6295\\u8bc9\\u5f39\\u6846\\u540e\\u53ef\\u53d6\\u6d88\",\"_token\":\"lqJI99OQlpJ5aF8FcJ5C8TIqOmZei1PbIh6vqRkL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/config?&page=1\"}','2019-10-09 20:23:35','2019-10-09 20:23:35'),
	(209,1,'admin/config','GET','223.88.214.0','{\"page\":\"1\"}','2019-10-09 20:23:35','2019-10-09 20:23:35'),
	(210,1,'admin/config/9/edit','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:25:53','2019-10-09 20:25:53'),
	(211,1,'admin/config/9','PUT','223.88.214.0','{\"name\":\"stop\",\"value\":\"true\",\"description\":\"\\u662f\\u5426\\u6682\\u505c\\u4ea4\\u6613 true \\u4e3a\\u6682\\u505c \\u5426\\u5219\\u4e3a\\u6b63\\u5e38\",\"_token\":\"lqJI99OQlpJ5aF8FcJ5C8TIqOmZei1PbIh6vqRkL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/config?&page=1\"}','2019-10-09 20:25:59','2019-10-09 20:25:59'),
	(212,1,'admin/config','GET','223.88.214.0','{\"page\":\"1\"}','2019-10-09 20:25:59','2019-10-09 20:25:59'),
	(213,1,'admin/config/10/edit','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:26:12','2019-10-09 20:26:12'),
	(214,1,'admin/config','GET','223.88.214.0','{\"page\":\"1\",\"_pjax\":\"#pjax-container\"}','2019-10-09 20:26:20','2019-10-09 20:26:20'),
	(215,1,'admin/config/10/edit','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:26:31','2019-10-09 20:26:31'),
	(216,1,'admin/config/10','PUT','223.88.214.0','{\"name\":\"stop_message\",\"value\":\"\\u7cfb\\u7edf\\u4ea4\\u6613\\u7ed3\\u7b97\\u4e2d...\\uff0c\\u8bf7\\u7b49\\u5f85\\u91cd\\u65b0\\u5f00\\u653e\",\"description\":\"\\u6682\\u505c\\u4ea4\\u6613\\u65f6\\u63d0\\u793a\\u6587\\u5b57\",\"_token\":\"lqJI99OQlpJ5aF8FcJ5C8TIqOmZei1PbIh6vqRkL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/config?&page=1\"}','2019-10-09 20:27:01','2019-10-09 20:27:01'),
	(217,1,'admin/config','GET','223.88.214.0','{\"page\":\"1\"}','2019-10-09 20:27:01','2019-10-09 20:27:01'),
	(218,1,'admin/config/9/edit','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:27:14','2019-10-09 20:27:14'),
	(219,1,'admin/config/9','PUT','223.88.214.0','{\"name\":\"stop\",\"value\":\"123\",\"description\":\"\\u662f\\u5426\\u6682\\u505c\\u4ea4\\u6613 true \\u4e3a\\u6682\\u505c \\u5426\\u5219\\u4e3a\\u6b63\\u5e38\",\"_token\":\"lqJI99OQlpJ5aF8FcJ5C8TIqOmZei1PbIh6vqRkL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/config?&page=1\"}','2019-10-09 20:27:23','2019-10-09 20:27:23'),
	(220,1,'admin/config','GET','223.88.214.0','{\"page\":\"1\"}','2019-10-09 20:27:23','2019-10-09 20:27:23'),
	(221,1,'admin/config/4/edit','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:27:48','2019-10-09 20:27:48'),
	(222,1,'admin/config/4','PUT','223.88.214.0','{\"name\":\"total_amount\",\"value\":\"110000\",\"description\":\"\\u6bcf\\u4e2a\\u7528\\u6237\\u5355\\u65e5\\u53ef\\u62a2\\u5355\\u603b\\u91d1\\u989d\\uff0c\\u4f46\\u5269\\u4f59\\u91d1\\u989d\\u5c0f\\u4e8e1\\u4e07\\u65f6\\uff0c\\u5219\\u65e0\\u6cd5\\u518d\\u62a2\\u5355\",\"_token\":\"lqJI99OQlpJ5aF8FcJ5C8TIqOmZei1PbIh6vqRkL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/config?&page=1\"}','2019-10-09 20:27:59','2019-10-09 20:27:59'),
	(223,1,'admin/config','GET','223.88.214.0','{\"page\":\"1\"}','2019-10-09 20:27:59','2019-10-09 20:27:59'),
	(224,1,'admin/config','GET','223.88.214.0','{\"page\":\"1\"}','2019-10-09 20:34:21','2019-10-09 20:34:21'),
	(225,1,'admin/config','GET','223.88.214.0','[]','2019-10-09 20:34:33','2019-10-09 20:34:33'),
	(226,1,'admin/config','GET','223.88.214.0','[]','2019-10-09 20:34:36','2019-10-09 20:34:36'),
	(227,1,'admin/config/1/edit','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:34:51','2019-10-09 20:34:51'),
	(228,1,'admin/config/1','PUT','223.88.214.0','{\"name\":\"name\",\"value\":\"\\u674e\\u601d\\u601d\",\"description\":\"\\u4fdd\\u8bc1\\u91d1\\u6536\\u6b3e\\u4eba\\u59d3\\u540d\",\"_token\":\"lqJI99OQlpJ5aF8FcJ5C8TIqOmZei1PbIh6vqRkL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/config\"}','2019-10-09 20:35:12','2019-10-09 20:35:12'),
	(229,1,'admin/config','GET','223.88.214.0','[]','2019-10-09 20:35:12','2019-10-09 20:35:12'),
	(230,1,'admin/config/2/edit','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:35:18','2019-10-09 20:35:18'),
	(231,1,'admin/config/2','PUT','223.88.214.0','{\"name\":\"bankcard\",\"value\":\"6222021206000093171\",\"description\":\"\\u4fdd\\u8bc1\\u91d1\\u6536\\u6b3e\\u94f6\\u884c\\u5361\\u53f7\",\"_token\":\"lqJI99OQlpJ5aF8FcJ5C8TIqOmZei1PbIh6vqRkL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/config\"}','2019-10-09 20:35:26','2019-10-09 20:35:26'),
	(232,1,'admin/config','GET','223.88.214.0','[]','2019-10-09 20:35:26','2019-10-09 20:35:26'),
	(233,1,'admin/config/3/edit','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:35:29','2019-10-09 20:35:29'),
	(234,1,'admin/config/3','PUT','223.88.214.0','{\"name\":\"bankname\",\"value\":\"\\u4e2d\\u56fd\\u94f6\\u884c\",\"description\":\"\\u4fdd\\u8bc1\\u91d1\\u5f00\\u6237\\u884c\",\"_token\":\"lqJI99OQlpJ5aF8FcJ5C8TIqOmZei1PbIh6vqRkL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/config\"}','2019-10-09 20:35:38','2019-10-09 20:35:38'),
	(235,1,'admin/config','GET','223.88.214.0','[]','2019-10-09 20:35:38','2019-10-09 20:35:38'),
	(236,1,'admin/config','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:38:02','2019-10-09 20:38:02'),
	(237,1,'admin/auth/menu','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:38:11','2019-10-09 20:38:11'),
	(238,1,'admin','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:38:16','2019-10-09 20:38:16'),
	(239,1,'admin/auth/users','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:38:27','2019-10-09 20:38:27'),
	(240,1,'admin/config','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:38:29','2019-10-09 20:38:29'),
	(241,1,'admin/config','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:40:01','2019-10-09 20:40:01'),
	(242,1,'admin/config','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}','2019-10-09 20:40:08','2019-10-09 20:40:08'),
	(243,1,'admin/config','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}','2019-10-09 20:40:33','2019-10-09 20:40:33'),
	(244,1,'admin/config','GET','223.88.214.0','{\"page\":\"1\"}','2019-10-09 20:43:30','2019-10-09 20:43:30'),
	(245,1,'admin','GET','60.12.220.56','[]','2019-10-09 20:55:37','2019-10-09 20:55:37'),
	(246,1,'admin/auth/menu','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:55:42','2019-10-09 20:55:42'),
	(247,1,'admin/config/7/edit','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:56:03','2019-10-09 20:56:03'),
	(248,1,'admin/config','GET','223.88.214.0','{\"page\":\"1\",\"_pjax\":\"#pjax-container\"}','2019-10-09 20:56:05','2019-10-09 20:56:05'),
	(249,1,'admin/auth/menu','POST','60.12.220.56','{\"parent_id\":\"0\",\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"withdraws\",\"roles\":[null],\"permission\":null,\"_token\":\"iVnCP2rHnJtkSDKtJ4X0sKcZD5h0uXmdiBiIbe8G\"}','2019-10-09 20:56:05','2019-10-09 20:56:05'),
	(250,1,'admin/auth/menu','GET','60.12.220.56','[]','2019-10-09 20:56:05','2019-10-09 20:56:05'),
	(251,1,'admin/auth/menu','GET','60.12.220.56','[]','2019-10-09 20:56:07','2019-10-09 20:56:07'),
	(252,1,'admin/withdraws','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:56:08','2019-10-09 20:56:08'),
	(253,1,'admin/config/11/edit','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:56:09','2019-10-09 20:56:09'),
	(254,1,'admin/auth/menu','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:56:20','2019-10-09 20:56:20'),
	(255,1,'admin/auth/menu/8/edit','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:56:22','2019-10-09 20:56:22'),
	(256,1,'admin/auth/menu/8','PUT','60.12.220.56','{\"parent_id\":\"0\",\"title\":\"\\u914d\\u7f6e\",\"icon\":\"fa-toggle-on\",\"uri\":\"config\",\"roles\":[null],\"permission\":null,\"_token\":\"iVnCP2rHnJtkSDKtJ4X0sKcZD5h0uXmdiBiIbe8G\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/auth\\/menu\"}','2019-10-09 20:56:28','2019-10-09 20:56:28'),
	(257,1,'admin/auth/menu','GET','60.12.220.56','[]','2019-10-09 20:56:28','2019-10-09 20:56:28'),
	(258,1,'admin/auth/menu','POST','60.12.220.56','{\"parent_id\":\"0\",\"title\":\"\\u4f1a\\u5458\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"users\",\"roles\":[null],\"permission\":null,\"_token\":\"iVnCP2rHnJtkSDKtJ4X0sKcZD5h0uXmdiBiIbe8G\"}','2019-10-09 20:56:41','2019-10-09 20:56:41'),
	(259,1,'admin/auth/menu','GET','60.12.220.56','[]','2019-10-09 20:56:42','2019-10-09 20:56:42'),
	(260,1,'admin/config/11','PUT','223.88.214.0','{\"name\":\"deposit_shortage_message\",\"value\":\"\\u60a8\\u7684\\u4fdd\\u8bc1\\u91d1\\u4e0d\\u8db34000\\uff0c\\u6682\\u65e0\\u6cd5\\u62a2\\u5355\",\"description\":\"\\u4fdd\\u8bc1\\u91d1\\u4e0d\\u8db3\\u65f6\\u7684\\u63d0\\u793a\\u6587\\u5b57\",\"_token\":\"lqJI99OQlpJ5aF8FcJ5C8TIqOmZei1PbIh6vqRkL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/config?&page=1\"}','2019-10-09 20:56:54','2019-10-09 20:56:54'),
	(261,1,'admin/config','GET','223.88.214.0','{\"page\":\"1\"}','2019-10-09 20:56:54','2019-10-09 20:56:54'),
	(262,1,'admin/auth/menu','POST','60.12.220.56','{\"parent_id\":\"0\",\"title\":\"\\u4fdd\\u8bc1\\u91d1\",\"icon\":\"fa-bars\",\"uri\":\"deposits\",\"roles\":[null],\"permission\":null,\"_token\":\"iVnCP2rHnJtkSDKtJ4X0sKcZD5h0uXmdiBiIbe8G\"}','2019-10-09 20:57:01','2019-10-09 20:57:01'),
	(263,1,'admin/auth/menu','GET','60.12.220.56','[]','2019-10-09 20:57:01','2019-10-09 20:57:01'),
	(264,1,'admin/auth/menu','GET','60.12.220.56','[]','2019-10-09 20:57:02','2019-10-09 20:57:02'),
	(265,1,'admin/deposits','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:57:03','2019-10-09 20:57:03'),
	(266,1,'admin/config/12/edit','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:57:11','2019-10-09 20:57:11'),
	(267,1,'admin/users','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:57:13','2019-10-09 20:57:13'),
	(268,1,'admin/deposits','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:57:32','2019-10-09 20:57:32'),
	(269,1,'admin/withdraws','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:57:36','2019-10-09 20:57:36'),
	(270,1,'admin/users','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:57:38','2019-10-09 20:57:38'),
	(271,1,'admin/withdraws','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:57:39','2019-10-09 20:57:39'),
	(272,1,'admin/withdraws/7/edit','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:57:53','2019-10-09 20:57:53'),
	(273,1,'admin/config/12','PUT','223.88.214.0','{\"name\":\"deposit_submit_message\",\"value\":\"\\u4fdd\\u8bc1\\u91d1\\u63d0\\u4ea4\\u6210\\u529f\\uff0c\\u8bf7\\u7b49\\u5f85\\u540e\\u53f0\\u5ba1\\u6838\\u540e\\u53c2\\u4e0e\\u4ea4\\u6613\\uff0c\\u8bf7\\u52ff\\u91cd\\u590d\\u63d0\\u4ea4\\uff01\",\"description\":\"\\u7528\\u4e8e\\u7528\\u6237\\u63d0\\u4ea4\\u4fdd\\u8bc1\\u91d1\\u65f6\\u7684\\u63d0\\u793a\\u8bed\",\"_token\":\"lqJI99OQlpJ5aF8FcJ5C8TIqOmZei1PbIh6vqRkL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/config?&page=1\"}','2019-10-09 20:57:53','2019-10-09 20:57:53'),
	(274,1,'admin/config','GET','223.88.214.0','{\"page\":\"1\"}','2019-10-09 20:57:53','2019-10-09 20:57:53'),
	(275,1,'admin/withdraws/7','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:57:56','2019-10-09 20:57:56'),
	(276,1,'admin/withdraws','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:57:58','2019-10-09 20:57:58'),
	(277,1,'admin/users','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:58:00','2019-10-09 20:58:00'),
	(278,1,'admin/users/1/edit','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:58:07','2019-10-09 20:58:07'),
	(279,1,'admin/users','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:58:13','2019-10-09 20:58:13'),
	(280,1,'admin/deposits','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:58:27','2019-10-09 20:58:27'),
	(281,1,'admin/deposits/4/edit','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:58:32','2019-10-09 20:58:32'),
	(282,1,'admin/deposits/4','PUT','60.12.220.56','{\"user_id\":\"8\",\"amount\":\"4000\",\"name\":\"\\u674e\\u601d\\u601d\",\"bankname\":\"\\u4e2d\\u56fd\\u94f6\\u884c\",\"bankcard\":\"6222021206000093171\",\"images\":\"[\\\"2019_10_09\\\\\\/d865567d8a987ca06f27a7f168d59bb51734.png\\\"]\",\"status\":\"1\",\"_token\":\"iVnCP2rHnJtkSDKtJ4X0sKcZD5h0uXmdiBiIbe8G\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/deposits\"}','2019-10-09 20:58:42','2019-10-09 20:58:42'),
	(283,1,'admin/deposits','GET','60.12.220.56','[]','2019-10-09 20:58:42','2019-10-09 20:58:42'),
	(284,1,'admin/deposits/4','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:59:07','2019-10-09 20:59:07'),
	(285,1,'admin/deposits','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:59:13','2019-10-09 20:59:13'),
	(286,1,'admin/users','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:59:21','2019-10-09 20:59:21'),
	(287,1,'admin/users/6/edit','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:59:37','2019-10-09 20:59:37'),
	(288,1,'admin/users/6','PUT','60.12.220.56','{\"status\":\"on\",\"username\":\"13333333333\",\"name\":\"\\u5f20\\u4e09\",\"invitation_code\":\"6K725D\",\"bank_name\":\"\\u4e2d\\u56fd\\u519c\\u4e1a\\u94f6\\u884c\",\"bank_card\":\"6222132525251344498\",\"password\":\"$2y$10$FeBbtgOl6lXjeqGZt1MXEetwD3O9DYZWdnZ9Vks0C4xzoFh\\/\\/2sSu\",\"_token\":\"iVnCP2rHnJtkSDKtJ4X0sKcZD5h0uXmdiBiIbe8G\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/users\"}','2019-10-09 20:59:40','2019-10-09 20:59:40'),
	(289,1,'admin/users','GET','60.12.220.56','[]','2019-10-09 20:59:40','2019-10-09 20:59:40'),
	(290,1,'admin/users/7/edit','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 20:59:42','2019-10-09 20:59:42'),
	(291,1,'admin/users/7','PUT','60.12.220.56','{\"status\":\"on\",\"username\":\"13444444444\",\"name\":\"\\u674e\\u601d\",\"invitation_code\":\"SN5PSC\",\"bank_name\":\"\\u4e2d\\u56fd\\u94f6\\u884c\",\"bank_card\":\"6542365243615462361\",\"password\":\"$2y$10$gV5vLY6.jT2upoKGRzCCsOOFSGFCxvhy\\/WWxBE\\/NsbhcehI4NJDdO\",\"_token\":\"iVnCP2rHnJtkSDKtJ4X0sKcZD5h0uXmdiBiIbe8G\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/users\"}','2019-10-09 20:59:46','2019-10-09 20:59:46'),
	(292,1,'admin/users','GET','60.12.220.56','[]','2019-10-09 20:59:46','2019-10-09 20:59:46'),
	(293,1,'admin/deposits','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:00:00','2019-10-09 21:00:00'),
	(294,1,'admin/withdraws','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:00:01','2019-10-09 21:00:01'),
	(295,1,'admin/withdraws/7/edit','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:00:40','2019-10-09 21:00:40'),
	(296,1,'admin/withdraws','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:00:42','2019-10-09 21:00:42'),
	(297,1,'admin/users','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:00:43','2019-10-09 21:00:43'),
	(298,1,'admin/users/1/edit','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:00:45','2019-10-09 21:00:45'),
	(299,1,'admin/config','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:01:05','2019-10-09 21:01:05'),
	(300,1,'admin/users','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:01:07','2019-10-09 21:01:07'),
	(301,1,'admin/deposits','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:01:07','2019-10-09 21:01:07'),
	(302,1,'admin/withdraws','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:01:09','2019-10-09 21:01:09'),
	(303,1,'admin/deposits','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:01:11','2019-10-09 21:01:11'),
	(304,1,'admin/users','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:01:12','2019-10-09 21:01:12'),
	(305,1,'admin/deposits','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:01:14','2019-10-09 21:01:14'),
	(306,1,'admin/config','GET','60.12.220.56','[]','2019-10-09 21:08:29','2019-10-09 21:08:29'),
	(307,1,'admin/users','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:08:47','2019-10-09 21:08:47'),
	(308,1,'admin/withdraws','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:08:48','2019-10-09 21:08:48'),
	(309,1,'admin/deposits','GET','60.12.220.56','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:08:49','2019-10-09 21:08:49'),
	(310,1,'admin/config','GET','223.88.214.0','{\"page\":\"1\"}','2019-10-09 21:09:05','2019-10-09 21:09:05'),
	(311,1,'admin/users','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:17:55','2019-10-09 21:17:55'),
	(312,1,'admin/deposits','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:17:56','2019-10-09 21:17:56'),
	(313,1,'admin/users','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:18:04','2019-10-09 21:18:04'),
	(314,1,'admin/withdraws','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:18:17','2019-10-09 21:18:17'),
	(315,1,'admin/withdraws/7/edit','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:18:27','2019-10-09 21:18:27'),
	(316,1,'admin/withdraws','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:18:34','2019-10-09 21:18:34'),
	(317,1,'admin/users','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:21:49','2019-10-09 21:21:49'),
	(318,1,'admin','GET','106.19.2.106','[]','2019-10-09 21:31:54','2019-10-09 21:31:54'),
	(319,1,'admin','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:32:21','2019-10-09 21:32:21'),
	(320,1,'admin/auth/users','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:32:30','2019-10-09 21:32:30'),
	(321,1,'admin/config','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:32:33','2019-10-09 21:32:33'),
	(322,1,'admin/withdraws','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:32:52','2019-10-09 21:32:52'),
	(323,1,'admin/users','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:33:00','2019-10-09 21:33:00'),
	(324,1,'admin/deposits','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:33:02','2019-10-09 21:33:02'),
	(325,1,'admin/users','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:33:54','2019-10-09 21:33:54'),
	(326,1,'admin/users','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:35:38','2019-10-09 21:35:38'),
	(327,1,'admin/users','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:35:44','2019-10-09 21:35:44'),
	(328,1,'admin/users','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:35:47','2019-10-09 21:35:47'),
	(329,1,'admin/users','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:35:50','2019-10-09 21:35:50'),
	(330,1,'admin/users','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:35:54','2019-10-09 21:35:54'),
	(331,1,'admin/users','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:35:59','2019-10-09 21:35:59'),
	(332,1,'admin/deposits','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:36:40','2019-10-09 21:36:40'),
	(333,1,'admin/config','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:36:45','2019-10-09 21:36:45'),
	(334,1,'admin/deposits','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:36:46','2019-10-09 21:36:46'),
	(335,1,'admin/deposits','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:36:58','2019-10-09 21:36:58'),
	(336,1,'admin/deposits','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:37:29','2019-10-09 21:37:29'),
	(337,1,'admin/deposits','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:38:52','2019-10-09 21:38:52'),
	(338,1,'admin/deposits','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:39:02','2019-10-09 21:39:02'),
	(339,1,'admin/deposits','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:39:07','2019-10-09 21:39:07'),
	(340,1,'admin/deposits','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:39:19','2019-10-09 21:39:19'),
	(341,1,'admin/deposits/5/edit','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:39:33','2019-10-09 21:39:33'),
	(342,1,'admin/deposits','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:39:41','2019-10-09 21:39:41'),
	(343,1,'admin/deposits/5/edit','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:39:45','2019-10-09 21:39:45'),
	(344,1,'admin/deposits/5','PUT','106.19.2.106','{\"user_id\":\"9\",\"amount\":\"4000\",\"name\":\"\\u674e\\u601d\\u601d\",\"bankname\":\"\\u4e2d\\u56fd\\u94f6\\u884c\",\"bankcard\":\"6222021206000093171\",\"images\":\"[\\\"2019_10_09\\\\\\/80055baa99ef15e38ed29baab512255f6041.jpg\\\"]\",\"status\":\"1\",\"_token\":\"aNd2250N0lXWBZbZmp8qD8gjzWrdiX3aGL49rWxZ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/deposits\"}','2019-10-09 21:39:52','2019-10-09 21:39:52'),
	(345,1,'admin/deposits','GET','106.19.2.106','[]','2019-10-09 21:39:52','2019-10-09 21:39:52'),
	(346,1,'admin/deposits/5/edit','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:40:05','2019-10-09 21:40:05'),
	(347,1,'admin/deposits','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:40:22','2019-10-09 21:40:22'),
	(348,1,'admin/config','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:40:30','2019-10-09 21:40:30'),
	(349,1,'admin/deposits','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:40:42','2019-10-09 21:40:42'),
	(350,1,'admin/withdraws','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:44:10','2019-10-09 21:44:10'),
	(351,1,'admin/deposits','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:46:28','2019-10-09 21:46:28'),
	(352,1,'admin/users','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:46:30','2019-10-09 21:46:30'),
	(353,1,'admin/withdraws','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:46:34','2019-10-09 21:46:34'),
	(354,1,'admin/withdraws','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:47:12','2019-10-09 21:47:12'),
	(355,1,'admin/users','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:48:35','2019-10-09 21:48:35'),
	(356,1,'admin/deposits','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:52:28','2019-10-09 21:52:28'),
	(357,1,'admin/config','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:52:29','2019-10-09 21:52:29'),
	(358,1,'admin/withdraws','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:56:34','2019-10-09 21:56:34'),
	(359,1,'admin/withdraws','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:58:30','2019-10-09 21:58:30'),
	(360,1,'admin/withdraws','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 21:59:06','2019-10-09 21:59:06'),
	(361,1,'admin/config','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:00:35','2019-10-09 22:00:35'),
	(362,1,'admin/config','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:01:23','2019-10-09 22:01:23'),
	(363,1,'admin/withdraws','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:01:32','2019-10-09 22:01:32'),
	(364,1,'admin/withdraws','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:01:38','2019-10-09 22:01:38'),
	(365,1,'admin/withdraws','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:01:51','2019-10-09 22:01:51'),
	(366,1,'admin/withdraws','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:04:23','2019-10-09 22:04:23'),
	(367,1,'admin/withdraws','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:05:48','2019-10-09 22:05:48'),
	(368,1,'admin/users','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:11:15','2019-10-09 22:11:15'),
	(369,1,'admin/withdraws','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:15:08','2019-10-09 22:15:08'),
	(370,1,'admin/users','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:15:17','2019-10-09 22:15:17'),
	(371,1,'admin/withdraws','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:15:34','2019-10-09 22:15:34'),
	(372,1,'admin/withdraws','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\",\"id\":\"a123451\",\"order_no\":null}','2019-10-09 22:15:39','2019-10-09 22:15:39'),
	(373,1,'admin/withdraws','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:15:45','2019-10-09 22:15:45'),
	(374,1,'admin/withdraws','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\",\"id\":null,\"order_no\":\"1570623580040457\"}','2019-10-09 22:16:28','2019-10-09 22:16:28'),
	(375,1,'admin/users','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:17:43','2019-10-09 22:17:43'),
	(376,1,'admin/users/8/edit','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:17:47','2019-10-09 22:17:47'),
	(377,1,'admin/users/8','PUT','106.19.2.106','{\"status\":\"on\",\"username\":\"13555555555\",\"name\":\"\\u5218\\u6210\",\"invitation_code\":\"KOB8LH\",\"bank_name\":\"\\u4e2d\\u56fd\\u5efa\\u8bbe\\u94f6\\u884c\",\"bank_card\":\"6525251124365462134\",\"password\":\"$2y$10$dotHBqmwLLbX3Vce0HmjcO0C2PD9.ay5b47es1PF.meeUAp\\/WURxu\",\"_token\":\"aNd2250N0lXWBZbZmp8qD8gjzWrdiX3aGL49rWxZ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/users\"}','2019-10-09 22:17:52','2019-10-09 22:17:52'),
	(378,1,'admin/users','GET','106.19.2.106','[]','2019-10-09 22:17:52','2019-10-09 22:17:52'),
	(379,1,'admin/users/9/edit','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:18:11','2019-10-09 22:18:11'),
	(380,1,'admin/users/9','PUT','106.19.2.106','{\"status\":\"on\",\"username\":\"a123451\",\"name\":\"\\u4f60\\u731c\",\"invitation_code\":\"D11CC2\",\"bank_name\":\"\\u4e2d\\u56fd\\u90ae\\u653f\\u50a8\\u84c4\\u94f6\\u884c\",\"bank_card\":\"1235564564562254\",\"password\":\"$2y$10$kh8is7mvyOa59Ref3z.yFeNiYPR8JsEuDTLdMWWR8tJJwNDmQGtdG\",\"_token\":\"aNd2250N0lXWBZbZmp8qD8gjzWrdiX3aGL49rWxZ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/users\"}','2019-10-09 22:18:13','2019-10-09 22:18:13'),
	(381,1,'admin/users','GET','106.19.2.106','[]','2019-10-09 22:18:13','2019-10-09 22:18:13'),
	(382,1,'admin/withdraws','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:21:48','2019-10-09 22:21:48'),
	(383,1,'admin/withdraws','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:25:14','2019-10-09 22:25:14'),
	(384,1,'admin/config','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:34:27','2019-10-09 22:34:27'),
	(385,1,'admin/config','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}','2019-10-09 22:34:47','2019-10-09 22:34:47'),
	(386,1,'admin/users','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:35:08','2019-10-09 22:35:08'),
	(387,1,'admin/withdraws','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:36:51','2019-10-09 22:36:51'),
	(388,1,'admin/config','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:39:45','2019-10-09 22:39:45'),
	(389,1,'admin/deposits','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:47:45','2019-10-09 22:47:45'),
	(390,1,'admin/users','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:57:11','2019-10-09 22:57:11'),
	(391,1,'admin/withdraws','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:57:11','2019-10-09 22:57:11'),
	(392,1,'admin/withdraws','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:57:19','2019-10-09 22:57:19'),
	(393,1,'admin/withdraws','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 22:59:52','2019-10-09 22:59:52'),
	(394,1,'admin/withdraws','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 23:01:06','2019-10-09 23:01:06'),
	(395,1,'admin/config','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 23:03:11','2019-10-09 23:03:11'),
	(396,1,'admin/config/6/edit','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 23:03:31','2019-10-09 23:03:31'),
	(397,1,'admin/config/6','PUT','106.19.2.106','{\"name\":\"operation_fee\",\"value\":\"0\",\"description\":\"\\u5e73\\u53f0\\u8fd0\\u8425\\u624b\\u7eed\\u8d39\",\"_token\":\"aNd2250N0lXWBZbZmp8qD8gjzWrdiX3aGL49rWxZ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/config\"}','2019-10-09 23:03:37','2019-10-09 23:03:37'),
	(398,1,'admin/config','GET','106.19.2.106','[]','2019-10-09 23:03:37','2019-10-09 23:03:37'),
	(399,1,'admin/deposits','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 23:24:20','2019-10-09 23:24:20'),
	(400,1,'admin/users','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 23:24:21','2019-10-09 23:24:21'),
	(401,1,'admin/config','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 23:24:22','2019-10-09 23:24:22'),
	(402,1,'admin/config/19/edit','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 23:25:12','2019-10-09 23:25:12'),
	(403,1,'admin/config/19','PUT','106.19.2.106','{\"name\":\"complaint_message\",\"value\":\"\\u4e00\\u65e6\\u6295\\u8bc9\\uff0c\\u60a8\\u53cc\\u65b9\\u8d26\\u53f7\\u90fd\\u6682\\u65f6\\u4f1a\\u88ab\\u51bb\\u7ed3\\uff0c\\u5982\\u679c\\u60a8\\u7684\\u4ea4\\u6613\\u5df2\\u7ecf\\u8d85\\u8fc7\\u4e8612\\u5c0f\\u65f6\\uff0c\\u60a8\\u53ef\\u4ee5\\u9009\\u62e9\\u6295\\u8bc9\\uff0c\\u4f46\\u672a\\u8d85\\u8fc7\\uff0c\\u5efa\\u8bae\\u5148\\u7b49\\u5f85\\uff0c\\u4ee5\\u514d\\u8d26\\u53f7\\u51bb\\u7ed3\\u540e\\u9020\\u6210\\u4e0d\\u5fc5\\u8981\\u7684\\u9ebb\\u70e6\\uff01\",\"description\":\"\\u7528\\u6237\\u70b9\\u51fb\\u6295\\u8bc9\\u65f6\\u7684\\u8b66\\u544a\\u63d0\\u793a\\u6587\\u5b57 \\u6295\\u8bc9\\u5f39\\u6846\\u540e\\u53ef\\u53d6\\u6d88\",\"_token\":\"aNd2250N0lXWBZbZmp8qD8gjzWrdiX3aGL49rWxZ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/config\"}','2019-10-09 23:25:39','2019-10-09 23:25:39'),
	(404,1,'admin/config','GET','106.19.2.106','[]','2019-10-09 23:25:39','2019-10-09 23:25:39'),
	(405,1,'admin/config/15/edit','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 23:28:22','2019-10-09 23:28:22'),
	(406,1,'admin/config/15/edit','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 23:28:36','2019-10-09 23:28:36'),
	(407,1,'admin/config','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 23:28:57','2019-10-09 23:28:57'),
	(408,1,'admin/config/13/edit','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 23:29:13','2019-10-09 23:29:13'),
	(409,1,'admin/config/13','PUT','223.88.214.0','{\"name\":\"deposit_enough_message\",\"value\":\"\\u60a8\\u7684\\u4fdd\\u8bc1\\u91d1\\u5df2\\u8db3\\u591f\\uff0c\\u65e0\\u9700\\u518d\\u7f34\\u7eb3\\u4fdd\\u8bc1\\u91d1\\uff01\",\"description\":\"\\u4fdd\\u8bc1\\u91d1\\u8db3\\u591f\\u65f6\\u7684\\u63d0\\u793a\\u6587\\u5b57\",\"_token\":\"lqJI99OQlpJ5aF8FcJ5C8TIqOmZei1PbIh6vqRkL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/config\"}','2019-10-09 23:29:30','2019-10-09 23:29:30'),
	(410,1,'admin/config','GET','223.88.214.0','[]','2019-10-09 23:29:30','2019-10-09 23:29:30'),
	(411,1,'admin/config/16/edit','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 23:29:45','2019-10-09 23:29:45'),
	(412,1,'admin/config/16','PUT','223.88.214.0','{\"name\":\"no_list_message\",\"value\":\"\\u7cfb\\u7edf\\u6682\\u65f6\\u672a\\u4e3a\\u60a8\\u6210\\u529f\\u5206\\u914d\\u5230\\u5408\\u9002\\u7684\\u8ba2\\u5355\\uff0c\\u8bf7\\u7a0d\\u540e\\u518d\\u8bd5\\uff01\",\"description\":\"\\u540e\\u53f0\\u65e0\\u5355\\u5b50\\u5f39\\u6846\\u63d0\\u793a\\u8bed\",\"_token\":\"lqJI99OQlpJ5aF8FcJ5C8TIqOmZei1PbIh6vqRkL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/config\"}','2019-10-09 23:30:09','2019-10-09 23:30:09'),
	(413,1,'admin/config','GET','223.88.214.0','[]','2019-10-09 23:30:09','2019-10-09 23:30:09'),
	(414,1,'admin/config/17/edit','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 23:30:15','2019-10-09 23:30:15'),
	(415,1,'admin/config','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 23:30:22','2019-10-09 23:30:22'),
	(416,1,'admin/config/15/edit','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 23:30:42','2019-10-09 23:30:42'),
	(417,1,'admin/config/15','PUT','106.19.2.106','{\"name\":\"grabbed_message\",\"value\":\"\\u62a2\\u5355\\u6210\\u529f\\u8bf7\\u572820\\u5206\\u949f\\u5185\\u6253\\u6b3e\",\"description\":\"\\u62a2\\u5355\\u6210\\u529f\\u540e\\u5f39\\u6846\\u63d0\\u793a\\u8bed\",\"_token\":\"aNd2250N0lXWBZbZmp8qD8gjzWrdiX3aGL49rWxZ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/config\"}','2019-10-09 23:30:59','2019-10-09 23:30:59'),
	(418,1,'admin/config','GET','106.19.2.106','[]','2019-10-09 23:30:59','2019-10-09 23:30:59'),
	(419,1,'admin/config/17','PUT','223.88.214.0','{\"name\":\"account_freeze_message\",\"value\":\"\\u60a8\\u7684\\u8d26\\u6237\\u88ab\\u51bb\\u7ed3\\uff0c\\u53ef\\u80fd\\u662f\\u60a8\\u6709\\u8ba2\\u5355\\u6295\\u8bc9\\u6216\\u88ab\\u6295\\u8bc9\\uff0c\\u8bf7\\u7b49\\u5f85\\u5ba2\\u670d\\u4ecb\\u5165\\u5904\\u7406\\u3002\",\"description\":\"\\u7528\\u6237\\u8d26\\u6237\\u88ab\\u51bb\\u7ed3\\u540e\\u63d0\\u793a\\u8bed\",\"_token\":\"lqJI99OQlpJ5aF8FcJ5C8TIqOmZei1PbIh6vqRkL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/config\"}','2019-10-09 23:31:18','2019-10-09 23:31:18'),
	(420,1,'admin/config','GET','223.88.214.0','[]','2019-10-09 23:31:18','2019-10-09 23:31:18'),
	(421,1,'admin/config','GET','223.88.214.0','{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}','2019-10-09 23:31:54','2019-10-09 23:31:54'),
	(422,1,'admin/config/21/edit','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 23:32:01','2019-10-09 23:32:01'),
	(423,1,'admin/config/15/edit','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-09 23:32:28','2019-10-09 23:32:28'),
	(424,1,'admin/config/15','PUT','106.19.2.106','{\"name\":\"grabbed_message\",\"value\":\"\\u62a2\\u5355\\u6210\\u529f\\u8bf7\\u572830\\u5206\\u949f\\u5185\\u6253\\u6b3e\",\"description\":\"\\u62a2\\u5355\\u6210\\u529f\\u540e\\u5f39\\u6846\\u63d0\\u793a\\u8bed\",\"_token\":\"aNd2250N0lXWBZbZmp8qD8gjzWrdiX3aGL49rWxZ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/config\"}','2019-10-09 23:32:39','2019-10-09 23:32:39'),
	(425,1,'admin/config','GET','106.19.2.106','[]','2019-10-09 23:32:39','2019-10-09 23:32:39'),
	(426,1,'admin/config/21','PUT','223.88.214.0','{\"name\":\"payment_confirmed_message\",\"value\":\"\\u5bf9\\u65b9\\u5df2\\u7ecf\\u786e\\u8ba4\\u6536\\u6b3e\",\"description\":\"\\u5bf9\\u65b9\\u5df2\\u6536\\u5230\\u6b3e\\u9879\\u540e\\u5e76\\u786e\\u8ba4\\u65f6\\uff0c\\u4ed8\\u6b3e\\u65b9\\u7684\\u6d88\\u606f\\u63d0\\u793a\\u6587\\u5b57\",\"_token\":\"lqJI99OQlpJ5aF8FcJ5C8TIqOmZei1PbIh6vqRkL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/config?page=2\"}','2019-10-09 23:32:45','2019-10-09 23:32:45'),
	(427,1,'admin/config','GET','223.88.214.0','{\"page\":\"2\"}','2019-10-09 23:32:45','2019-10-09 23:32:45'),
	(428,1,'admin/config','GET','223.88.214.0','{\"page\":\"1\",\"_pjax\":\"#pjax-container\"}','2019-10-09 23:32:47','2019-10-09 23:32:47'),
	(429,1,'admin/config/20/edit','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 23:32:50','2019-10-09 23:32:50'),
	(430,1,'admin/config/20','PUT','223.88.214.0','{\"name\":\"withdra_unconfirmed_message\",\"value\":\"\\u60a8\\u6709\\u65b0\\u7684\\u8ba2\\u5355\\u5f85\\u5904\\u7406\\uff0c\\u8bf7\\u6838\\u5b9e\\u540e\\u5230\\u63d0\\u73b0\\u8bb0\\u5f55\\u91cc\\u9762\\u786e\\u8ba4\\uff01\",\"description\":\"\\u63d0\\u73b0\\u5df2\\u7ecf\\u6709\\u7528\\u6237\\u6253\\u6b3e\\u540e\\u7684\\u65b0\\u6d88\\u606f\\u63d0\\u793a\\u6587\\u5b57\",\"_token\":\"lqJI99OQlpJ5aF8FcJ5C8TIqOmZei1PbIh6vqRkL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/config?page=1\"}','2019-10-09 23:35:55','2019-10-09 23:35:55'),
	(431,1,'admin/config','GET','223.88.214.0','{\"page\":\"1\"}','2019-10-09 23:35:55','2019-10-09 23:35:55'),
	(432,1,'admin/config','GET','223.88.214.0','{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}','2019-10-09 23:35:57','2019-10-09 23:35:57'),
	(433,1,'admin/config/21/edit','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 23:36:00','2019-10-09 23:36:00'),
	(434,1,'admin/config/21','PUT','223.88.214.0','{\"name\":\"payment_confirmed_message\",\"value\":\"\\u60a8\\u7684\\u6b3e\\u9879\\u5bf9\\u65b9\\u5df2\\u786e\\u8ba4\\uff01\",\"description\":\"\\u5bf9\\u65b9\\u5df2\\u6536\\u5230\\u6b3e\\u9879\\u540e\\u5e76\\u786e\\u8ba4\\u65f6\\uff0c\\u4ed8\\u6b3e\\u65b9\\u7684\\u6d88\\u606f\\u63d0\\u793a\\u6587\\u5b57\",\"_token\":\"lqJI99OQlpJ5aF8FcJ5C8TIqOmZei1PbIh6vqRkL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/config?page=2\"}','2019-10-09 23:37:37','2019-10-09 23:37:37'),
	(435,1,'admin/config','GET','223.88.214.0','{\"page\":\"2\"}','2019-10-09 23:37:37','2019-10-09 23:37:37'),
	(436,1,'admin/config','GET','223.88.214.0','{\"page\":\"1\",\"_pjax\":\"#pjax-container\"}','2019-10-09 23:37:39','2019-10-09 23:37:39'),
	(437,1,'admin','GET','106.19.2.106','[]','2019-10-09 23:41:03','2019-10-09 23:41:03'),
	(438,1,'admin/config/18/edit','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 23:44:37','2019-10-09 23:44:37'),
	(439,1,'admin/config/18','PUT','223.88.214.0','{\"name\":\"not_completed_message\",\"value\":\"\\u60a8\\u6709\\u4e00\\u7b14\\u6253\\u6b3e\\u6216\\u63d0\\u73b0\\u8ba2\\u5355\\u5c1a\\u672a\\u5b8c\\u6210\\uff0c\\u8bf7\\u7b49\\u5f85\\u8ba2\\u5355\\u5b8c\\u6210\\u540e\\u518d\\u8bd5\\uff01\",\"description\":\"\\u65e0\\u8bba\\u662f\\u62a2\\u5355\\u8fd8\\u662f\\u63d0\\u73b0\\uff0c\\u53ea\\u8981\\u8fd8\\u6709\\u4e00\\u7b14\\u4ea4\\u6613\\u672a\\u5b8c\\u6210\\uff0c\\u5219\\u4e0d\\u80fd\\u8fdb\\u884c\\u4e0b\\u4e00\\u6b21\\u4ea4\\u6613\\u65f6\\u5019\\u7684\\u63d0\\u793a\\u8bed\",\"_token\":\"lqJI99OQlpJ5aF8FcJ5C8TIqOmZei1PbIh6vqRkL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/config?page=1\"}','2019-10-09 23:45:37','2019-10-09 23:45:37'),
	(440,1,'admin/config','GET','223.88.214.0','{\"page\":\"1\"}','2019-10-09 23:45:37','2019-10-09 23:45:37'),
	(441,1,'admin/config/18/edit','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-09 23:45:56','2019-10-09 23:45:56'),
	(442,1,'admin/config/18','PUT','223.88.214.0','{\"name\":\"not_completed_message\",\"value\":\"\\u60a8\\u6709\\u4e00\\u7b14\\u51fa\\u6b3e\\u6216\\u63d0\\u73b0\\u8ba2\\u5355\\u5c1a\\u672a\\u5b8c\\u6210\\uff0c\\u8bf7\\u7b49\\u5f85\\u8ba2\\u5355\\u5b8c\\u6210\\u540e\\u518d\\u8bd5\\uff01\",\"description\":\"\\u65e0\\u8bba\\u662f\\u62a2\\u5355\\u8fd8\\u662f\\u63d0\\u73b0\\uff0c\\u53ea\\u8981\\u8fd8\\u6709\\u4e00\\u7b14\\u4ea4\\u6613\\u672a\\u5b8c\\u6210\\uff0c\\u5219\\u4e0d\\u80fd\\u8fdb\\u884c\\u4e0b\\u4e00\\u6b21\\u4ea4\\u6613\\u65f6\\u5019\\u7684\\u63d0\\u793a\\u8bed\",\"_token\":\"lqJI99OQlpJ5aF8FcJ5C8TIqOmZei1PbIh6vqRkL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/config?page=1\"}','2019-10-09 23:46:02','2019-10-09 23:46:02'),
	(443,1,'admin/config','GET','223.88.214.0','{\"page\":\"1\"}','2019-10-09 23:46:02','2019-10-09 23:46:02'),
	(444,1,'admin/deposits','GET','106.19.2.106','{\"_pjax\":\"#pjax-container\"}','2019-10-10 00:00:52','2019-10-10 00:00:52'),
	(445,1,'admin/deposits','GET','117.136.89.78','{\"_pjax\":\"#pjax-container\"}','2019-10-10 00:01:26','2019-10-10 00:01:26'),
	(446,1,'admin/users','GET','117.136.89.78','{\"_pjax\":\"#pjax-container\"}','2019-10-10 00:01:26','2019-10-10 00:01:26'),
	(447,1,'admin/deposits','GET','117.136.89.78','{\"_pjax\":\"#pjax-container\"}','2019-10-10 00:01:27','2019-10-10 00:01:27'),
	(448,1,'admin/users','GET','117.136.89.78','{\"_pjax\":\"#pjax-container\"}','2019-10-10 00:02:49','2019-10-10 00:02:49'),
	(449,1,'admin/users','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-10 00:03:03','2019-10-10 00:03:03'),
	(450,1,'admin/users','GET','117.136.89.78','{\"_pjax\":\"#pjax-container\"}','2019-10-10 00:03:11','2019-10-10 00:03:11'),
	(451,1,'admin/deposits','GET','117.136.89.78','{\"_pjax\":\"#pjax-container\"}','2019-10-10 00:03:13','2019-10-10 00:03:13'),
	(452,1,'admin/deposits','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-10 00:03:22','2019-10-10 00:03:22'),
	(453,1,'admin/deposits/6/edit','GET','117.136.89.78','{\"_pjax\":\"#pjax-container\"}','2019-10-10 00:03:25','2019-10-10 00:03:25'),
	(454,1,'admin/deposits/6','PUT','117.136.89.78','{\"user_id\":\"10\",\"amount\":\"4000\",\"name\":\"\\u674e\\u601d\\u601d\",\"bankname\":\"\\u4e2d\\u56fd\\u94f6\\u884c\",\"bankcard\":\"6222021206000093171\",\"images\":\"[\\\"2019_10_10\\\\\\/414d7a38f8bff105ae9c524bdf7133651455.jpg\\\"]\",\"status\":\"1\",\"_token\":\"aNd2250N0lXWBZbZmp8qD8gjzWrdiX3aGL49rWxZ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/deposits\"}','2019-10-10 00:03:37','2019-10-10 00:03:37'),
	(455,1,'admin/deposits','GET','117.136.89.78','[]','2019-10-10 00:03:38','2019-10-10 00:03:38'),
	(456,1,'admin/deposits','GET','117.136.89.78','{\"_pjax\":\"#pjax-container\"}','2019-10-10 00:03:41','2019-10-10 00:03:41'),
	(457,1,'admin/deposits','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-10 00:03:50','2019-10-10 00:03:50'),
	(458,1,'admin/deposits','GET','117.136.89.78','{\"_pjax\":\"#pjax-container\"}','2019-10-10 00:05:01','2019-10-10 00:05:01'),
	(459,1,'admin/withdraws','GET','117.136.89.78','{\"_pjax\":\"#pjax-container\"}','2019-10-10 00:05:04','2019-10-10 00:05:04'),
	(460,1,'admin/withdraws','GET','117.136.89.78','{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}','2019-10-10 00:05:37','2019-10-10 00:05:37'),
	(461,1,'admin/withdraws/28/edit','GET','117.136.89.78','{\"_pjax\":\"#pjax-container\"}','2019-10-10 00:05:57','2019-10-10 00:05:57'),
	(462,1,'admin/users','GET','117.136.89.78','{\"_pjax\":\"#pjax-container\"}','2019-10-10 00:08:37','2019-10-10 00:08:37'),
	(463,1,'admin/withdraws','GET','117.136.89.78','{\"_pjax\":\"#pjax-container\"}','2019-10-10 00:09:02','2019-10-10 00:09:02'),
	(464,1,'admin/withdraws','GET','117.136.89.78','{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}','2019-10-10 00:09:10','2019-10-10 00:09:10'),
	(465,1,'admin/_handle_action_','POST','117.136.89.78','{\"_key\":\"29\",\"_model\":\"App_Withdraw\",\"_token\":\"aNd2250N0lXWBZbZmp8qD8gjzWrdiX3aGL49rWxZ\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}','2019-10-10 00:09:35','2019-10-10 00:09:35'),
	(466,1,'admin/withdraws','GET','117.136.89.78','{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}','2019-10-10 00:09:35','2019-10-10 00:09:35'),
	(467,1,'admin/withdraws','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-10 00:12:44','2019-10-10 00:12:44'),
	(468,1,'admin/withdraws','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-10 00:13:53','2019-10-10 00:13:53'),
	(469,1,'admin/withdraws','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}','2019-10-10 00:14:00','2019-10-10 00:14:00'),
	(470,1,'admin/users','GET','117.136.89.78','{\"_pjax\":\"#pjax-container\"}','2019-10-10 00:15:30','2019-10-10 00:15:30'),
	(471,1,'admin/users','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-10 00:16:02','2019-10-10 00:16:02'),
	(472,1,'admin/users/9/edit','GET','117.136.89.78','{\"_pjax\":\"#pjax-container\"}','2019-10-10 00:18:27','2019-10-10 00:18:27'),
	(473,1,'admin/users/9','PUT','117.136.89.78','{\"status\":\"on\",\"username\":\"a123451\",\"name\":\"\\u4f60\\u731c\",\"invitation_code\":\"D11CC2\",\"bank_name\":\"\\u4e2d\\u56fd\\u90ae\\u653f\\u50a8\\u84c4\\u94f6\\u884c\",\"bank_card\":\"1235564564562254\",\"password\":\"$2y$10$kh8is7mvyOa59Ref3z.yFeNiYPR8JsEuDTLdMWWR8tJJwNDmQGtdG\",\"_token\":\"aNd2250N0lXWBZbZmp8qD8gjzWrdiX3aGL49rWxZ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/users\"}','2019-10-10 00:18:33','2019-10-10 00:18:33'),
	(474,1,'admin/users','GET','117.136.89.78','[]','2019-10-10 00:18:33','2019-10-10 00:18:33'),
	(475,1,'admin/users/10/edit','GET','117.136.89.78','{\"_pjax\":\"#pjax-container\"}','2019-10-10 00:18:35','2019-10-10 00:18:35'),
	(476,1,'admin/users/10','PUT','117.136.89.78','{\"status\":\"on\",\"username\":\"lq666999\",\"name\":\"\\u5218\\u4e09\",\"invitation_code\":\"P6C2I4\",\"bank_name\":\"\\u4e2d\\u56fd\\u5de5\\u5546\\u94f6\\u884c\",\"bank_card\":\"6212881106000029747\",\"password\":\"$2y$10$F7NKiecgo\\/Rh\\/Yi.0zCPtOlbYE2cm0dI2T2sSOxOStDRsy3wK4xb6\",\"_token\":\"aNd2250N0lXWBZbZmp8qD8gjzWrdiX3aGL49rWxZ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.dullme.com\\/admin\\/users\"}','2019-10-10 00:18:40','2019-10-10 00:18:40'),
	(477,1,'admin/users','GET','117.136.89.78','[]','2019-10-10 00:18:40','2019-10-10 00:18:40'),
	(478,1,'admin','GET','223.88.214.0','[]','2019-10-10 09:24:58','2019-10-10 09:24:58'),
	(479,1,'admin/users','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-10 09:25:06','2019-10-10 09:25:06'),
	(480,1,'admin/users/2/edit','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-10 09:26:00','2019-10-10 09:26:00'),
	(481,1,'admin/users','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-10 09:26:09','2019-10-10 09:26:09'),
	(482,1,'admin/users/6/edit','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-10 09:26:13','2019-10-10 09:26:13'),
	(483,1,'admin/users','GET','223.88.214.0','{\"_pjax\":\"#pjax-container\"}','2019-10-10 09:26:15','2019-10-10 09:26:15'),
	(484,1,'admin','GET','127.0.0.1','[]','2019-10-10 10:35:35','2019-10-10 10:35:35'),
	(485,1,'admin/deposits','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:35:38','2019-10-10 10:35:38'),
	(486,1,'admin/deposits','GET','127.0.0.1','[]','2019-10-10 10:36:08','2019-10-10 10:36:08'),
	(487,1,'admin/withdraws','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:37:09','2019-10-10 10:37:09'),
	(488,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:37:10','2019-10-10 10:37:10'),
	(489,1,'admin/withdraws','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:37:11','2019-10-10 10:37:11'),
	(490,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:37:12','2019-10-10 10:37:12'),
	(491,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:39:34','2019-10-10 10:39:34'),
	(492,1,'admin/withdraws','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:39:35','2019-10-10 10:39:35'),
	(493,1,'admin/withdraws/7/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:39:51','2019-10-10 10:39:51'),
	(494,1,'admin/withdraws','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:40:01','2019-10-10 10:40:01'),
	(495,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:40:16','2019-10-10 10:40:16'),
	(496,1,'admin/users/2/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:40:28','2019-10-10 10:40:28'),
	(497,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:40:31','2019-10-10 10:40:31'),
	(498,1,'admin/deposits','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:40:35','2019-10-10 10:40:35'),
	(499,1,'admin/deposits/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:40:41','2019-10-10 10:40:41'),
	(500,1,'admin/deposits','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:40:45','2019-10-10 10:40:45'),
	(501,1,'admin/deposits/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:40:50','2019-10-10 10:40:50'),
	(502,1,'admin/deposits','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:40:58','2019-10-10 10:40:58'),
	(503,1,'admin/withdraws','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:41:07','2019-10-10 10:41:07'),
	(504,1,'admin/withdraws/7/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:41:11','2019-10-10 10:41:11'),
	(505,1,'admin/withdraws','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:41:14','2019-10-10 10:41:14'),
	(506,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:41:15','2019-10-10 10:41:15'),
	(507,1,'admin/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:41:17','2019-10-10 10:41:17'),
	(508,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:41:24','2019-10-10 10:41:24'),
	(509,1,'admin/deposits','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:41:26','2019-10-10 10:41:26'),
	(510,1,'admin/deposits/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:41:32','2019-10-10 10:41:32'),
	(511,1,'admin/deposits','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:41:40','2019-10-10 10:41:40'),
	(512,1,'admin/deposits/1','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:41:50','2019-10-10 10:41:50'),
	(513,1,'admin/deposits','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:41:52','2019-10-10 10:41:52'),
	(514,1,'admin/deposits/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:41:57','2019-10-10 10:41:57'),
	(515,1,'admin/deposits','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:42:00','2019-10-10 10:42:00'),
	(516,1,'admin/withdraws','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:42:30','2019-10-10 10:42:30'),
	(517,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:42:38','2019-10-10 10:42:38'),
	(518,1,'admin/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:42:43','2019-10-10 10:42:43'),
	(519,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:42:53','2019-10-10 10:42:53'),
	(520,1,'admin/deposits','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:42:56','2019-10-10 10:42:56'),
	(521,1,'admin/deposits/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:42:58','2019-10-10 10:42:58'),
	(522,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:43:20','2019-10-10 10:43:20'),
	(523,1,'admin/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:43:22','2019-10-10 10:43:22'),
	(524,1,'admin/deposits','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 10:43:28','2019-10-10 10:43:28'),
	(525,1,'admin/deposits','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 11:28:32','2019-10-10 11:28:32'),
	(526,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 11:28:33','2019-10-10 11:28:33'),
	(527,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 11:28:38','2019-10-10 11:28:38'),
	(528,1,'admin/config','POST','127.0.0.1','{\"name\":\"announcement\",\"value\":\"\\u516c\\u544a\\u4fe1\\u606f\\u4fe1\\u606f\\u4fe1\\u606f\\u4fe1\\u606f\\u4fe1\\u606f\\u4fe1\\u606f\",\"description\":\"\\u516c\\u544a\\u4fe1\\u606f\",\"_token\":\"LihSXB9CNvWlrAYrlmlQH6s7YRpITpFgowLmPeZD\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/config\"}','2019-10-10 11:28:52','2019-10-10 11:28:52'),
	(529,1,'admin/config','GET','127.0.0.1','[]','2019-10-10 11:28:52','2019-10-10 11:28:52'),
	(530,1,'admin/config','GET','127.0.0.1','{\"per_page\":\"50\",\"_pjax\":\"#pjax-container\"}','2019-10-10 11:28:57','2019-10-10 11:28:57'),
	(531,1,'admin/config/22/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 11:29:01','2019-10-10 11:29:01'),
	(532,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:30:23','2019-10-10 13:30:23'),
	(533,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u94f6\\u884c\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"banks\",\"roles\":[null],\"permission\":null,\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\"}','2019-10-10 13:30:31','2019-10-10 13:30:31'),
	(534,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 13:30:31','2019-10-10 13:30:31'),
	(535,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 13:30:34','2019-10-10 13:30:34'),
	(536,1,'admin/banks','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:30:36','2019-10-10 13:30:36'),
	(537,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:31:33','2019-10-10 13:31:33'),
	(538,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:31:39','2019-10-10 13:31:39'),
	(539,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:32:05','2019-10-10 13:32:05'),
	(540,1,'admin/banks/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:32:09','2019-10-10 13:32:09'),
	(541,1,'admin/banks/create','GET','127.0.0.1','[]','2019-10-10 13:33:05','2019-10-10 13:33:05'),
	(542,1,'admin/banks/create','GET','127.0.0.1','[]','2019-10-10 13:33:11','2019-10-10 13:33:11'),
	(543,1,'admin/banks/create','GET','127.0.0.1','[]','2019-10-10 13:33:36','2019-10-10 13:33:36'),
	(544,1,'admin/banks/create','GET','127.0.0.1','[]','2019-10-10 13:34:23','2019-10-10 13:34:23'),
	(545,1,'admin/banks/create','GET','127.0.0.1','[]','2019-10-10 13:34:44','2019-10-10 13:34:44'),
	(546,1,'admin/banks','POST','127.0.0.1','{\"bank_name\":null,\"icon\":null,\"status\":\"on\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\"}','2019-10-10 13:34:45','2019-10-10 13:34:45'),
	(547,1,'admin/banks/create','GET','127.0.0.1','[]','2019-10-10 13:34:45','2019-10-10 13:34:45'),
	(548,1,'admin/banks/create','GET','127.0.0.1','[]','2019-10-10 13:35:07','2019-10-10 13:35:07'),
	(549,1,'admin/banks/create','GET','127.0.0.1','[]','2019-10-10 13:35:21','2019-10-10 13:35:21'),
	(550,1,'admin/banks','POST','127.0.0.1','{\"bank_name\":\"asd\",\"status\":\"on\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\"}','2019-10-10 13:35:32','2019-10-10 13:35:32'),
	(551,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:35:32','2019-10-10 13:35:32'),
	(552,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:35:45','2019-10-10 13:35:45'),
	(553,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:35:53','2019-10-10 13:35:53'),
	(554,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:35:58','2019-10-10 13:35:58'),
	(555,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:36:24','2019-10-10 13:36:24'),
	(556,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:36:30','2019-10-10 13:36:30'),
	(557,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:36:36','2019-10-10 13:36:36'),
	(558,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:37:02','2019-10-10 13:37:02'),
	(559,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:37:23','2019-10-10 13:37:23'),
	(560,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:37:33','2019-10-10 13:37:33'),
	(561,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:37:38','2019-10-10 13:37:38'),
	(562,1,'admin/banks/1','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:37:43','2019-10-10 13:37:43'),
	(563,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:38:29','2019-10-10 13:38:29'),
	(564,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:38:37','2019-10-10 13:38:37'),
	(565,1,'admin/banks/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:38:41','2019-10-10 13:38:41'),
	(566,1,'admin/banks/1','PUT','127.0.0.1','{\"bank_name\":\"asd\",\"status\":\"off\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/banks\"}','2019-10-10 13:38:48','2019-10-10 13:38:48'),
	(567,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:38:48','2019-10-10 13:38:48'),
	(568,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:39:33','2019-10-10 13:39:33'),
	(569,1,'admin/banks/1','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\"}','2019-10-10 13:39:34','2019-10-10 13:39:34'),
	(570,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:39:38','2019-10-10 13:39:38'),
	(571,1,'admin/banks/1','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\"}','2019-10-10 13:39:39','2019-10-10 13:39:39'),
	(572,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:39:40','2019-10-10 13:39:40'),
	(573,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:40:49','2019-10-10 13:40:49'),
	(574,1,'admin/banks/1','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\"}','2019-10-10 13:40:50','2019-10-10 13:40:50'),
	(575,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:40:57','2019-10-10 13:40:57'),
	(576,1,'admin/banks/1','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\"}','2019-10-10 13:40:58','2019-10-10 13:40:58'),
	(577,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:40:59','2019-10-10 13:40:59'),
	(578,1,'admin/banks/1','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\"}','2019-10-10 13:41:01','2019-10-10 13:41:01'),
	(579,1,'admin/banks/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:41:05','2019-10-10 13:41:05'),
	(580,1,'admin/banks/1/edit','GET','127.0.0.1','[]','2019-10-10 13:41:24','2019-10-10 13:41:24'),
	(581,1,'admin/banks/1/edit','GET','127.0.0.1','[]','2019-10-10 13:41:41','2019-10-10 13:41:41'),
	(582,1,'admin/banks/1','PUT','127.0.0.1','{\"bank_name\":\"asd\",\"status\":\"off\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/banks\\/1\"}','2019-10-10 13:41:47','2019-10-10 13:41:47'),
	(583,1,'admin/banks/1','GET','127.0.0.1','[]','2019-10-10 13:41:47','2019-10-10 13:41:47'),
	(584,1,'admin/banks/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:41:52','2019-10-10 13:41:52'),
	(585,1,'admin/banks','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:41:54','2019-10-10 13:41:54'),
	(586,1,'admin/banks/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:41:59','2019-10-10 13:41:59'),
	(587,1,'admin/banks/1','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:42:11','2019-10-10 13:42:11'),
	(588,1,'admin/banks/1','GET','127.0.0.1','[]','2019-10-10 13:42:38','2019-10-10 13:42:38'),
	(589,1,'admin/banks/1','GET','127.0.0.1','[]','2019-10-10 13:43:25','2019-10-10 13:43:25'),
	(590,1,'admin/banks/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:43:30','2019-10-10 13:43:30'),
	(591,1,'admin/banks/1','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:43:31','2019-10-10 13:43:31'),
	(592,1,'admin/banks','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:43:32','2019-10-10 13:43:32'),
	(593,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:43:39','2019-10-10 13:43:39'),
	(594,1,'admin/banks/1','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:43:40','2019-10-10 13:43:40'),
	(595,1,'admin/banks/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:43:42','2019-10-10 13:43:42'),
	(596,1,'admin/banks','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:43:44','2019-10-10 13:43:44'),
	(597,1,'admin/banks/1','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\"}','2019-10-10 13:45:22','2019-10-10 13:45:22'),
	(598,1,'admin/banks/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:53:07','2019-10-10 13:53:07'),
	(599,1,'admin/banks/1','PUT','127.0.0.1','{\"bank_name\":\"\\u4e2d\\u56fd\\u94f6\\u884c\",\"status\":\"on\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/banks\"}','2019-10-10 13:53:13','2019-10-10 13:53:13'),
	(600,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:53:13','2019-10-10 13:53:13'),
	(601,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:53:19','2019-10-10 13:53:19'),
	(602,1,'admin/banks/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:54:32','2019-10-10 13:54:32'),
	(603,1,'admin/banks/1','PUT','127.0.0.1','{\"bank_name\":\"\\u4e2d\\u56fd\\u94f6\\u884c2\",\"status\":\"on\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/banks\"}','2019-10-10 13:54:34','2019-10-10 13:54:34'),
	(604,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:54:34','2019-10-10 13:54:34'),
	(605,1,'admin/banks/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:54:45','2019-10-10 13:54:45'),
	(606,1,'admin/banks/1','PUT','127.0.0.1','{\"bank_name\":\"\\u4e2d\\u56fd\\u94f6\\u884c\",\"status\":\"on\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/banks\"}','2019-10-10 13:54:47','2019-10-10 13:54:47'),
	(607,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:54:47','2019-10-10 13:54:47'),
	(608,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:54:56','2019-10-10 13:54:56'),
	(609,1,'admin/banks/1','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\"}','2019-10-10 13:54:58','2019-10-10 13:54:58'),
	(610,1,'admin/banks/1','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\"}','2019-10-10 13:55:05','2019-10-10 13:55:05'),
	(611,1,'admin/banks/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:55:22','2019-10-10 13:55:22'),
	(612,1,'admin/banks/1','PUT','127.0.0.1','{\"bank_name\":\"\\u4e2d\\u56fd\\u94f6\\u884c\",\"status\":\"on\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/banks\"}','2019-10-10 13:55:41','2019-10-10 13:55:41'),
	(613,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:55:41','2019-10-10 13:55:41'),
	(614,1,'admin/banks/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:56:51','2019-10-10 13:56:51'),
	(615,1,'admin/banks/1','PUT','127.0.0.1','{\"bank_name\":\"\\u4e2d\\u56fd\\u94f6\\u884c2\",\"status\":\"on\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/banks\"}','2019-10-10 13:56:53','2019-10-10 13:56:53'),
	(616,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:56:53','2019-10-10 13:56:53'),
	(617,1,'admin/banks/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:57:14','2019-10-10 13:57:14'),
	(618,1,'admin/banks/1','PUT','127.0.0.1','{\"bank_name\":\"\\u4e2d\\u56fd\\u94f6\\u884c\",\"status\":\"on\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/banks\"}','2019-10-10 13:57:19','2019-10-10 13:57:19'),
	(619,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 13:57:19','2019-10-10 13:57:19'),
	(620,1,'admin/withdraws','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:58:00','2019-10-10 13:58:00'),
	(621,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:58:02','2019-10-10 13:58:02'),
	(622,1,'admin/users/2/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:58:05','2019-10-10 13:58:05'),
	(623,1,'admin/users/2','PUT','127.0.0.1','{\"status\":\"on\",\"username\":\"18606520987\",\"name\":\"Pixel\",\"invitation_code\":\"OCK91M\",\"bank_name\":\"\\u4e2d\\u56fd\\u94f6\\u884c\",\"bank_card\":\"8888765645666615245\",\"password\":\"$2y$10$MLRsIHJY.zaD6xGdeps\\/fe2R5e\\/iiGhjJQh8QYKUZsA4pLAfQrPcK\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/users\"}','2019-10-10 13:58:07','2019-10-10 13:58:07'),
	(624,1,'admin/users','GET','127.0.0.1','[]','2019-10-10 13:58:07','2019-10-10 13:58:07'),
	(625,1,'admin/users/9/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 13:58:09','2019-10-10 13:58:09'),
	(626,1,'admin/users/9','PUT','127.0.0.1','{\"status\":\"on\",\"username\":\"a123451\",\"name\":\"\\u4f60\\u731c\",\"invitation_code\":\"D11CC2\",\"bank_name\":\"\\u4e2d\\u56fd\\u90ae\\u653f\\u50a8\\u84c4\\u94f6\\u884c\",\"bank_card\":\"1235564564562254\",\"password\":\"$2y$10$kh8is7mvyOa59Ref3z.yFeNiYPR8JsEuDTLdMWWR8tJJwNDmQGtdG\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/users\"}','2019-10-10 13:58:10','2019-10-10 13:58:10'),
	(627,1,'admin/users','GET','127.0.0.1','[]','2019-10-10 13:58:10','2019-10-10 13:58:10'),
	(628,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:16:07','2019-10-10 14:16:07'),
	(629,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:16:08','2019-10-10 14:16:08'),
	(630,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u5e2e\\u52a9\\u4e2d\\u5fc3\",\"icon\":\"fa-bars\",\"uri\":\"helps\",\"roles\":[null],\"permission\":null,\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\"}','2019-10-10 14:16:24','2019-10-10 14:16:24'),
	(631,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 14:16:24','2019-10-10 14:16:24'),
	(632,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 14:16:25','2019-10-10 14:16:25'),
	(633,1,'admin/helps','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:16:26','2019-10-10 14:16:26'),
	(634,1,'admin/helps','GET','127.0.0.1','[]','2019-10-10 14:16:59','2019-10-10 14:16:59'),
	(635,1,'admin/helps','GET','127.0.0.1','[]','2019-10-10 14:18:13','2019-10-10 14:18:13'),
	(636,1,'admin/helps/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:18:15','2019-10-10 14:18:15'),
	(637,1,'admin/helps','POST','127.0.0.1','{\"title\":\"\\u8fd9\\u662f\\u6807\\u9898\",\"content\":\"\\u8fd9\\u662f\\u5f3a\\u884c\\u6253\\u7b97\\u6253\\u5361\\u5feb\\u4e50\\u5230\\u5bb6\\u5566\\u5feb\\u7ed3\\u675f\\u7684\\u79bb\\u5f00\\u8fd9\\u662f\\u5f3a\\u884c\\u6253\\u7b97\\u6253\\u5361\\u5feb\\u4e50\\u5230\\u5bb6\\u5566\\u5feb\\u7ed3\\u675f\\u7684\\u79bb\\u5f00\\u8fd9\\u662f\\u5f3a\\u884c\\u6253\\u7b97\\u6253\\u5361\\u5feb\\u4e50\\u5230\\u5bb6\\u5566\\u5feb\\u7ed3\\u675f\\u7684\\u79bb\\u5f00\\u8fd9\\u662f\\u5f3a\\u884c\\u6253\\u7b97\\u6253\\u5361\\u5feb\\u4e50\\u5230\\u5bb6\\u5566\\u5feb\\u7ed3\\u675f\\u7684\\u79bb\\u5f00\\u8fd9\\u662f\\u5f3a\\u884c\\u6253\\u7b97\\u6253\\u5361\\u5feb\\u4e50\\u5230\\u5bb6\\u5566\\u5feb\\u7ed3\\u675f\\u7684\\u79bb\\u5f00\\u8fd9\\u662f\\u5f3a\\u884c\\u6253\\u7b97\\u6253\\u5361\\u5feb\\u4e50\\u5230\\u5bb6\\u5566\\u5feb\\u7ed3\\u675f\\u7684\\u79bb\\u5f00\\u8fd9\\u662f\\u5f3a\\u884c\\u6253\\u7b97\\u6253\\u5361\\u5feb\\u4e50\\u5230\\u5bb6\\u5566\\u5feb\\u7ed3\\u675f\\u7684\\u79bb\\u5f00\\u8fd9\\u662f\\u5f3a\\u884c\\u6253\\u7b97\\u6253\\u5361\\u5feb\\u4e50\\u5230\\u5bb6\\u5566\\u5feb\\u7ed3\\u675f\\u7684\\u79bb\\u5f00\\u8fd9\\u662f\\u5f3a\\u884c\\u6253\\u7b97\\u6253\\u5361\\u5feb\\u4e50\\u5230\\u5bb6\\u5566\\u5feb\\u7ed3\\u675f\\u7684\\u79bb\\u5f00\\u8fd9\\u662f\\u5f3a\\u884c\\u6253\\u7b97\\u6253\\u5361\\u5feb\\u4e50\\u5230\\u5bb6\\u5566\\u5feb\\u7ed3\\u675f\\u7684\\u79bb\\u5f00\\u8fd9\\u662f\\u5f3a\\u884c\\u6253\\u7b97\\u6253\\u5361\\u5feb\\u4e50\\u5230\\u5bb6\\u5566\\u5feb\\u7ed3\\u675f\\u7684\\u79bb\\u5f00\\u8fd9\\u662f\\u5f3a\\u884c\\u6253\\u7b97\\u6253\\u5361\\u5feb\\u4e50\\u5230\\u5bb6\\u5566\\u5feb\\u7ed3\\u675f\\u7684\\u79bb\\u5f00\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/helps\"}','2019-10-10 14:18:29','2019-10-10 14:18:29'),
	(638,1,'admin/helps','GET','127.0.0.1','[]','2019-10-10 14:18:29','2019-10-10 14:18:29'),
	(639,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:19:52','2019-10-10 14:19:52'),
	(640,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:19:53','2019-10-10 14:19:53'),
	(641,1,'admin/helps','GET','127.0.0.1','[]','2019-10-10 14:25:10','2019-10-10 14:25:10'),
	(642,1,'admin/helps','GET','127.0.0.1','[]','2019-10-10 14:25:33','2019-10-10 14:25:33'),
	(643,1,'admin/helps/1','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:25:40','2019-10-10 14:25:40'),
	(644,1,'admin/helps/1','GET','127.0.0.1','[]','2019-10-10 14:25:54','2019-10-10 14:25:54'),
	(645,1,'admin/helps/1','GET','127.0.0.1','[]','2019-10-10 14:26:03','2019-10-10 14:26:03'),
	(646,1,'admin/helps','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:27:23','2019-10-10 14:27:23'),
	(647,1,'admin/deposits','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:27:30','2019-10-10 14:27:30'),
	(648,1,'admin/banks','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:27:30','2019-10-10 14:27:30'),
	(649,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 14:28:02','2019-10-10 14:28:02'),
	(650,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 14:28:03','2019-10-10 14:28:03'),
	(651,1,'admin/helps','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:28:06','2019-10-10 14:28:06'),
	(652,1,'admin/banks','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:28:08','2019-10-10 14:28:08'),
	(653,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 14:29:11','2019-10-10 14:29:11'),
	(654,1,'admin/withdraws','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:29:12','2019-10-10 14:29:12'),
	(655,1,'admin/withdraws','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:29:13','2019-10-10 14:29:13'),
	(656,1,'admin/helps','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:30:02','2019-10-10 14:30:02'),
	(657,1,'admin/banks','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:30:04','2019-10-10 14:30:04'),
	(658,1,'admin/helps','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:30:05','2019-10-10 14:30:05'),
	(659,1,'admin/banks','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:30:06','2019-10-10 14:30:06'),
	(660,1,'admin/deposits','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:30:07','2019-10-10 14:30:07'),
	(661,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:30:08','2019-10-10 14:30:08'),
	(662,1,'admin/withdraws','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:30:09','2019-10-10 14:30:09'),
	(663,1,'admin/withdraws','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:30:12','2019-10-10 14:30:12'),
	(664,1,'admin/withdraws','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"id\":null,\"order_no\":null}','2019-10-10 14:30:22','2019-10-10 14:30:22'),
	(665,1,'admin/deposits','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:30:23','2019-10-10 14:30:23'),
	(666,1,'admin/helps','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:30:32','2019-10-10 14:30:32'),
	(667,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:30:47','2019-10-10 14:30:47'),
	(668,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:30:52','2019-10-10 14:30:52'),
	(669,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u6d88\\u606f\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"messages\",\"roles\":[null],\"permission\":null,\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\"}','2019-10-10 14:31:17','2019-10-10 14:31:17'),
	(670,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 14:31:17','2019-10-10 14:31:17'),
	(671,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 14:31:31','2019-10-10 14:31:31'),
	(672,1,'admin/messages','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:31:33','2019-10-10 14:31:33'),
	(673,1,'admin/messages','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 14:31:46','2019-10-10 14:31:46'),
	(674,1,'admin/messages','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:04:13','2019-10-10 15:04:13'),
	(675,1,'admin/messages/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:04:17','2019-10-10 15:04:17'),
	(676,1,'admin/messages','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:04:24','2019-10-10 15:04:24'),
	(677,1,'admin/messages','GET','127.0.0.1','[]','2019-10-10 15:05:25','2019-10-10 15:05:25'),
	(678,1,'admin/messages','GET','127.0.0.1','[]','2019-10-10 15:05:28','2019-10-10 15:05:28'),
	(679,1,'admin/messages','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:05:30','2019-10-10 15:05:30'),
	(680,1,'admin/messages','GET','127.0.0.1','[]','2019-10-10 15:06:14','2019-10-10 15:06:14'),
	(681,1,'admin/messages','GET','127.0.0.1','[]','2019-10-10 15:06:37','2019-10-10 15:06:37'),
	(682,1,'admin/messages','GET','127.0.0.1','[]','2019-10-10 15:06:49','2019-10-10 15:06:49'),
	(683,1,'admin/messages','GET','127.0.0.1','[]','2019-10-10 15:07:37','2019-10-10 15:07:37'),
	(684,1,'admin/messages','GET','127.0.0.1','[]','2019-10-10 15:08:31','2019-10-10 15:08:31'),
	(685,1,'admin/messages/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:08:39','2019-10-10 15:08:39'),
	(686,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:09:51','2019-10-10 15:09:51'),
	(687,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:10:06','2019-10-10 15:10:06'),
	(688,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:10:16','2019-10-10 15:10:16'),
	(689,1,'admin/withdraws','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:10:20','2019-10-10 15:10:20'),
	(690,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:10:23','2019-10-10 15:10:23'),
	(691,1,'admin/withdraws','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:10:39','2019-10-10 15:10:39'),
	(692,1,'admin/messages','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:10:42','2019-10-10 15:10:42'),
	(693,1,'admin/messages/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:10:43','2019-10-10 15:10:43'),
	(694,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:10:52','2019-10-10 15:10:52'),
	(695,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:11:51','2019-10-10 15:11:51'),
	(696,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:11:56','2019-10-10 15:11:56'),
	(697,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:12:51','2019-10-10 15:12:51'),
	(698,1,'admin/messages','POST','127.0.0.1','{\"user_id\":\"1\",\"title\":\"123\",\"content\":\"123\",\"is_read\":\"off\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\"}','2019-10-10 15:12:59','2019-10-10 15:12:59'),
	(699,1,'admin/messages','GET','127.0.0.1','[]','2019-10-10 15:12:59','2019-10-10 15:12:59'),
	(700,1,'admin/messages','GET','127.0.0.1','[]','2019-10-10 15:13:36','2019-10-10 15:13:36'),
	(701,1,'admin/messages/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:13:43','2019-10-10 15:13:43'),
	(702,1,'admin/messages','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:13:45','2019-10-10 15:13:45'),
	(703,1,'admin/messages','GET','127.0.0.1','[]','2019-10-10 15:14:02','2019-10-10 15:14:02'),
	(704,1,'admin/messages/48','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:14:06','2019-10-10 15:14:06'),
	(705,1,'admin/messages/48','GET','127.0.0.1','[]','2019-10-10 15:14:37','2019-10-10 15:14:37'),
	(706,1,'admin/messages/48/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:14:40','2019-10-10 15:14:40'),
	(707,1,'admin/messages','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:14:46','2019-10-10 15:14:46'),
	(708,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:15:06','2019-10-10 15:15:06'),
	(709,1,'admin/messages','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:16:11','2019-10-10 15:16:11'),
	(710,1,'admin/messages/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:16:12','2019-10-10 15:16:12'),
	(711,1,'admin/messages','POST','127.0.0.1','{\"user_id\":\"1\",\"title\":\"222\",\"content\":\"222\",\"is_read\":\"off\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/messages\"}','2019-10-10 15:16:24','2019-10-10 15:16:24'),
	(712,1,'admin/messages','GET','127.0.0.1','[]','2019-10-10 15:16:24','2019-10-10 15:16:24'),
	(713,1,'admin/messages/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:16:43','2019-10-10 15:16:43'),
	(714,1,'admin/messages','POST','127.0.0.1','{\"user_id\":\"2\",\"title\":\"99\",\"content\":\"213123\",\"is_read\":\"off\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/messages\"}','2019-10-10 15:16:49','2019-10-10 15:16:49'),
	(715,1,'admin/messages','GET','127.0.0.1','[]','2019-10-10 15:16:49','2019-10-10 15:16:49'),
	(716,1,'admin/messages/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:16:59','2019-10-10 15:16:59'),
	(717,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:17:36','2019-10-10 15:17:36'),
	(718,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:17:37','2019-10-10 15:17:37'),
	(719,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:17:37','2019-10-10 15:17:37'),
	(720,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:17:37','2019-10-10 15:17:37'),
	(721,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:17:38','2019-10-10 15:17:38'),
	(722,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:17:38','2019-10-10 15:17:38'),
	(723,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:17:38','2019-10-10 15:17:38'),
	(724,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:17:48','2019-10-10 15:17:48'),
	(725,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:17:51','2019-10-10 15:17:51'),
	(726,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:17:51','2019-10-10 15:17:51'),
	(727,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:17:51','2019-10-10 15:17:51'),
	(728,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:17:52','2019-10-10 15:17:52'),
	(729,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:17:52','2019-10-10 15:17:52'),
	(730,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:18:11','2019-10-10 15:18:11'),
	(731,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:18:12','2019-10-10 15:18:12'),
	(732,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:18:12','2019-10-10 15:18:12'),
	(733,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:18:12','2019-10-10 15:18:12'),
	(734,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:18:13','2019-10-10 15:18:13'),
	(735,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:18:33','2019-10-10 15:18:33'),
	(736,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:18:45','2019-10-10 15:18:45'),
	(737,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:18:45','2019-10-10 15:18:45'),
	(738,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:18:46','2019-10-10 15:18:46'),
	(739,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:18:46','2019-10-10 15:18:46'),
	(740,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:18:46','2019-10-10 15:18:46'),
	(741,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:18:50','2019-10-10 15:18:50'),
	(742,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:18:50','2019-10-10 15:18:50'),
	(743,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:18:50','2019-10-10 15:18:50'),
	(744,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:18:53','2019-10-10 15:18:53'),
	(745,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:19:15','2019-10-10 15:19:15'),
	(746,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:19:16','2019-10-10 15:19:16'),
	(747,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:19:16','2019-10-10 15:19:16'),
	(748,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:19:16','2019-10-10 15:19:16'),
	(749,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:19:16','2019-10-10 15:19:16'),
	(750,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:19:17','2019-10-10 15:19:17'),
	(751,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:19:17','2019-10-10 15:19:17'),
	(752,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:19:17','2019-10-10 15:19:17'),
	(753,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:19:17','2019-10-10 15:19:17'),
	(754,1,'admin/messages','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:19:18','2019-10-10 15:19:18'),
	(755,1,'admin/helps','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:19:19','2019-10-10 15:19:19'),
	(756,1,'admin/messages','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:19:19','2019-10-10 15:19:19'),
	(757,1,'admin/messages/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:19:21','2019-10-10 15:19:21'),
	(758,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:19:32','2019-10-10 15:19:32'),
	(759,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:19:51','2019-10-10 15:19:51'),
	(760,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:20:00','2019-10-10 15:20:00'),
	(761,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:21:03','2019-10-10 15:21:03'),
	(762,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:21:04','2019-10-10 15:21:04'),
	(763,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:21:04','2019-10-10 15:21:04'),
	(764,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:21:04','2019-10-10 15:21:04'),
	(765,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:21:04','2019-10-10 15:21:04'),
	(766,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:21:25','2019-10-10 15:21:25'),
	(767,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:21:26','2019-10-10 15:21:26'),
	(768,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:21:26','2019-10-10 15:21:26'),
	(769,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:21:26','2019-10-10 15:21:26'),
	(770,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:21:27','2019-10-10 15:21:27'),
	(771,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:21:27','2019-10-10 15:21:27'),
	(772,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:21:27','2019-10-10 15:21:27'),
	(773,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:21:27','2019-10-10 15:21:27'),
	(774,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:21:27','2019-10-10 15:21:27'),
	(775,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:21:27','2019-10-10 15:21:27'),
	(776,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:21:28','2019-10-10 15:21:28'),
	(777,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:21:28','2019-10-10 15:21:28'),
	(778,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:21:29','2019-10-10 15:21:29'),
	(779,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:21:29','2019-10-10 15:21:29'),
	(780,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:21:29','2019-10-10 15:21:29'),
	(781,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:21:29','2019-10-10 15:21:29'),
	(782,1,'admin/messages','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:21:30','2019-10-10 15:21:30'),
	(783,1,'admin/messages/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:21:33','2019-10-10 15:21:33'),
	(784,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:22:03','2019-10-10 15:22:03'),
	(785,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:22:07','2019-10-10 15:22:07'),
	(786,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:22:45','2019-10-10 15:22:45'),
	(787,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:23:03','2019-10-10 15:23:03'),
	(788,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:23:20','2019-10-10 15:23:20'),
	(789,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:23:28','2019-10-10 15:23:28'),
	(790,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:23:32','2019-10-10 15:23:32'),
	(791,1,'admin/messages/create','GET','127.0.0.1','[]','2019-10-10 15:25:11','2019-10-10 15:25:11'),
	(792,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:28:04','2019-10-10 15:28:04'),
	(793,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u6295\\u8bc9\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"complaints\",\"roles\":[null],\"permission\":null,\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\"}','2019-10-10 15:28:15','2019-10-10 15:28:15'),
	(794,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 15:28:15','2019-10-10 15:28:15'),
	(795,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 15:28:18','2019-10-10 15:28:18'),
	(796,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:28:19','2019-10-10 15:28:19'),
	(797,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:28:57','2019-10-10 15:28:57'),
	(798,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:29:26','2019-10-10 15:29:26'),
	(799,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:29:27','2019-10-10 15:29:27'),
	(800,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:29:27','2019-10-10 15:29:27'),
	(801,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:29:27','2019-10-10 15:29:27'),
	(802,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:29:28','2019-10-10 15:29:28'),
	(803,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:29:43','2019-10-10 15:29:43'),
	(804,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:29:47','2019-10-10 15:29:47'),
	(805,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:30:29','2019-10-10 15:30:29'),
	(806,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:30:54','2019-10-10 15:30:54'),
	(807,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:31:30','2019-10-10 15:31:30'),
	(808,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:31:45','2019-10-10 15:31:45'),
	(809,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:32:07','2019-10-10 15:32:07'),
	(810,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:32:57','2019-10-10 15:32:57'),
	(811,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:33:07','2019-10-10 15:33:07'),
	(812,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:35:35','2019-10-10 15:35:35'),
	(813,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:37:34','2019-10-10 15:37:34'),
	(814,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:37:54','2019-10-10 15:37:54'),
	(815,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:38:05','2019-10-10 15:38:05'),
	(816,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:38:19','2019-10-10 15:38:19'),
	(817,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:38:47','2019-10-10 15:38:47'),
	(818,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:39:36','2019-10-10 15:39:36'),
	(819,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:39:53','2019-10-10 15:39:53'),
	(820,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:40:06','2019-10-10 15:40:06'),
	(821,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:40:17','2019-10-10 15:40:17'),
	(822,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:40:37','2019-10-10 15:40:37'),
	(823,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:40:42','2019-10-10 15:40:42'),
	(824,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:41:22','2019-10-10 15:41:22'),
	(825,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:41:34','2019-10-10 15:41:34'),
	(826,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:41:43','2019-10-10 15:41:43'),
	(827,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:41:56','2019-10-10 15:41:56'),
	(828,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:42:53','2019-10-10 15:42:53'),
	(829,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:43:08','2019-10-10 15:43:08'),
	(830,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:43:39','2019-10-10 15:43:39'),
	(831,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:43:40','2019-10-10 15:43:40'),
	(832,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:43:40','2019-10-10 15:43:40'),
	(833,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:43:40','2019-10-10 15:43:40'),
	(834,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:43:50','2019-10-10 15:43:50'),
	(835,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:44:09','2019-10-10 15:44:09'),
	(836,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:44:15','2019-10-10 15:44:15'),
	(837,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:44:46','2019-10-10 15:44:46'),
	(838,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:45:21','2019-10-10 15:45:21'),
	(839,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:46:10','2019-10-10 15:46:10'),
	(840,1,'admin/users','GET','127.0.0.1','[]','2019-10-10 15:47:01','2019-10-10 15:47:01'),
	(841,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:47:05','2019-10-10 15:47:05'),
	(842,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:47:42','2019-10-10 15:47:42'),
	(843,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:47:43','2019-10-10 15:47:43'),
	(844,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:47:43','2019-10-10 15:47:43'),
	(845,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:47:43','2019-10-10 15:47:43'),
	(846,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:47:43','2019-10-10 15:47:43'),
	(847,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:48:36','2019-10-10 15:48:36'),
	(848,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:48:41','2019-10-10 15:48:41'),
	(849,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:49:30','2019-10-10 15:49:30'),
	(850,1,'admin/complaints/4','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:50:45','2019-10-10 15:50:45'),
	(851,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:50:47','2019-10-10 15:50:47'),
	(852,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:51:35','2019-10-10 15:51:35'),
	(853,1,'admin/complaints/4','PUT','127.0.0.1','{\"name\":\"replay\",\"value\":\"asdasdajsdlkajsld\",\"pk\":\"4\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2019-10-10 15:51:40','2019-10-10 15:51:40'),
	(854,1,'admin/complaints/5','PUT','127.0.0.1','{\"name\":\"replay\",\"value\":\"asdasdasasdasdasasdasdasasdasdasasdasdasasdasdasasdasdasasdasdasasdasdasasdasdasasdasdasasdasdas\",\"pk\":\"5\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2019-10-10 15:51:46','2019-10-10 15:51:46'),
	(855,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:51:59','2019-10-10 15:51:59'),
	(856,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:52:20','2019-10-10 15:52:20'),
	(857,1,'admin/complaints/4/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:52:28','2019-10-10 15:52:28'),
	(858,1,'admin/complaints/4/edit','GET','127.0.0.1','[]','2019-10-10 15:53:02','2019-10-10 15:53:02'),
	(859,1,'admin/complaints/4/edit','GET','127.0.0.1','[]','2019-10-10 15:53:22','2019-10-10 15:53:22'),
	(860,1,'admin/complaints/4','PUT','127.0.0.1','{\"replay\":\"asdasdajsdlkajsld\\u6492\\u6253\\u7b97\\u6253\\u7b97\\u7684\\u591a\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\"}','2019-10-10 15:53:27','2019-10-10 15:53:27'),
	(861,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 15:53:27','2019-10-10 15:53:27'),
	(862,1,'admin/deposits','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:55:05','2019-10-10 15:55:05'),
	(863,1,'admin/deposits','GET','127.0.0.1','[]','2019-10-10 15:55:20','2019-10-10 15:55:20'),
	(864,1,'admin/deposits','GET','127.0.0.1','[]','2019-10-10 15:59:29','2019-10-10 15:59:29'),
	(865,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 15:59:33','2019-10-10 15:59:33'),
	(866,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:00:18','2019-10-10 16:00:18'),
	(867,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:00:40','2019-10-10 16:00:40'),
	(868,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:01:00','2019-10-10 16:01:00'),
	(869,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:02:32','2019-10-10 16:02:32'),
	(870,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"4\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaint\",\"_input\":\"true\"}','2019-10-10 16:02:41','2019-10-10 16:02:41'),
	(871,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:02:41','2019-10-10 16:02:41'),
	(872,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:05:02','2019-10-10 16:05:02'),
	(873,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"4\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintSuccess\",\"_input\":\"true\"}','2019-10-10 16:05:06','2019-10-10 16:05:06'),
	(874,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:05:06','2019-10-10 16:05:06'),
	(875,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"5\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintSuccess\",\"_input\":\"true\"}','2019-10-10 16:05:23','2019-10-10 16:05:23'),
	(876,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:05:23','2019-10-10 16:05:23'),
	(877,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:06:33','2019-10-10 16:06:33'),
	(878,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:06:47','2019-10-10 16:06:47'),
	(879,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"4\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintSuccess\",\"_input\":\"true\"}','2019-10-10 16:06:51','2019-10-10 16:06:51'),
	(880,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:06:51','2019-10-10 16:06:51'),
	(881,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"4\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintSuccess\",\"_input\":\"true\"}','2019-10-10 16:07:08','2019-10-10 16:07:08'),
	(882,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:07:08','2019-10-10 16:07:08'),
	(883,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:07:19','2019-10-10 16:07:19'),
	(884,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"4\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintSuccess\",\"_input\":\"true\"}','2019-10-10 16:07:24','2019-10-10 16:07:24'),
	(885,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:07:24','2019-10-10 16:07:24'),
	(886,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:08:56','2019-10-10 16:08:56'),
	(887,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"4\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintSuccess\",\"_input\":\"true\"}','2019-10-10 16:09:02','2019-10-10 16:09:02'),
	(888,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:09:02','2019-10-10 16:09:02'),
	(889,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:09:23','2019-10-10 16:09:23'),
	(890,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"4\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintSuccess\",\"_input\":\"true\"}','2019-10-10 16:09:26','2019-10-10 16:09:26'),
	(891,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:09:26','2019-10-10 16:09:26'),
	(892,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:09:45','2019-10-10 16:09:45'),
	(893,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:09:56','2019-10-10 16:09:56'),
	(894,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"4\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintFail\",\"_input\":\"true\"}','2019-10-10 16:10:00','2019-10-10 16:10:00'),
	(895,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:10:00','2019-10-10 16:10:00'),
	(896,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:12:32','2019-10-10 16:12:32'),
	(897,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"6\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintFail\",\"_input\":\"true\"}','2019-10-10 16:12:38','2019-10-10 16:12:38'),
	(898,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:12:38','2019-10-10 16:12:38'),
	(899,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:12:51','2019-10-10 16:12:51'),
	(900,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:13:14','2019-10-10 16:13:14'),
	(901,1,'admin/complaints/4/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:13:40','2019-10-10 16:13:40'),
	(902,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:15:28','2019-10-10 16:15:28'),
	(903,1,'admin/deposits','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:15:28','2019-10-10 16:15:28'),
	(904,1,'admin/deposits','GET','127.0.0.1','[]','2019-10-10 16:15:28','2019-10-10 16:15:28'),
	(905,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:15:29','2019-10-10 16:15:29'),
	(906,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:15:29','2019-10-10 16:15:29'),
	(907,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:15:30','2019-10-10 16:15:30'),
	(908,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:15:30','2019-10-10 16:15:30'),
	(909,1,'admin/complaints/4/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:15:33','2019-10-10 16:15:33'),
	(910,1,'admin/complaints/4','PUT','127.0.0.1','{\"replay\":\"asdasdajsdlkajsld\\u6492\\u6253\\u7b97\\u6253\\u7b97\\u7684\\u591a123123\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/complaints\"}','2019-10-10 16:15:37','2019-10-10 16:15:37'),
	(911,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:15:37','2019-10-10 16:15:37'),
	(912,1,'admin/complaints/7/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:15:40','2019-10-10 16:15:40'),
	(913,1,'admin/complaints/7','PUT','127.0.0.1','{\"replay\":\"1231232\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/complaints\"}','2019-10-10 16:15:42','2019-10-10 16:15:42'),
	(914,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:15:42','2019-10-10 16:15:42'),
	(915,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:15:44','2019-10-10 16:15:44'),
	(916,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:17:05','2019-10-10 16:17:05'),
	(917,1,'admin/complaints/7/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:17:08','2019-10-10 16:17:08'),
	(918,1,'admin/complaints/7','PUT','127.0.0.1','{\"replay\":\"1231232sdasd\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/complaints\"}','2019-10-10 16:17:09','2019-10-10 16:17:09'),
	(919,1,'admin/complaints/7','GET','127.0.0.1','[]','2019-10-10 16:17:23','2019-10-10 16:17:23'),
	(920,1,'admin/complaints/7/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:17:24','2019-10-10 16:17:24'),
	(921,1,'admin/complaints/7','PUT','127.0.0.1','{\"replay\":\"1231232asdasd\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/complaints\\/7\"}','2019-10-10 16:17:26','2019-10-10 16:17:26'),
	(922,1,'admin/complaints/7','GET','127.0.0.1','[]','2019-10-10 16:17:26','2019-10-10 16:17:26'),
	(923,1,'admin/complaints/7/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:17:29','2019-10-10 16:17:29'),
	(924,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:17:29','2019-10-10 16:17:29'),
	(925,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:17:31','2019-10-10 16:17:31'),
	(926,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:17:31','2019-10-10 16:17:31'),
	(927,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:17:32','2019-10-10 16:17:32'),
	(928,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:17:32','2019-10-10 16:17:32'),
	(929,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:17:32','2019-10-10 16:17:32'),
	(930,1,'admin/complaints/7/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:18:31','2019-10-10 16:18:31'),
	(931,1,'admin/complaints/7','PUT','127.0.0.1','{\"replay\":\"1231232asdasd123123\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/complaints\"}','2019-10-10 16:18:33','2019-10-10 16:18:33'),
	(932,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:18:33','2019-10-10 16:18:33'),
	(933,1,'admin/complaints/6/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:18:43','2019-10-10 16:18:43'),
	(934,1,'admin/complaints/6','PUT','127.0.0.1','{\"replay\":\"123123\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/complaints\"}','2019-10-10 16:18:45','2019-10-10 16:18:45'),
	(935,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:18:45','2019-10-10 16:18:45'),
	(936,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:18:53','2019-10-10 16:18:53'),
	(937,1,'admin/complaints/4/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:19:19','2019-10-10 16:19:19'),
	(938,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:19:20','2019-10-10 16:19:20'),
	(939,1,'admin/complaints/4','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:19:22','2019-10-10 16:19:22'),
	(940,1,'admin/complaints/4','GET','127.0.0.1','[]','2019-10-10 16:19:54','2019-10-10 16:19:54'),
	(941,1,'admin/complaints/4/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:19:56','2019-10-10 16:19:56'),
	(942,1,'admin/complaints/4','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:19:57','2019-10-10 16:19:57'),
	(943,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:19:58','2019-10-10 16:19:58'),
	(944,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:20:24','2019-10-10 16:20:24'),
	(945,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:21:06','2019-10-10 16:21:06'),
	(946,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:21:07','2019-10-10 16:21:07'),
	(947,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:21:17','2019-10-10 16:21:17'),
	(948,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:21:17','2019-10-10 16:21:17'),
	(949,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:21:17','2019-10-10 16:21:17'),
	(950,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"7\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintFail\",\"_input\":\"true\"}','2019-10-10 16:21:26','2019-10-10 16:21:26'),
	(951,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:21:26','2019-10-10 16:21:26'),
	(952,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:21:29','2019-10-10 16:21:29'),
	(953,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:21:30','2019-10-10 16:21:30'),
	(954,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:21:30','2019-10-10 16:21:30'),
	(955,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:21:30','2019-10-10 16:21:30'),
	(956,1,'admin/complaints/4/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:21:34','2019-10-10 16:21:34'),
	(957,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:21:36','2019-10-10 16:21:36'),
	(958,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:22:08','2019-10-10 16:22:08'),
	(959,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:22:08','2019-10-10 16:22:08'),
	(960,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:22:08','2019-10-10 16:22:08'),
	(961,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:22:09','2019-10-10 16:22:09'),
	(962,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:22:09','2019-10-10 16:22:09'),
	(963,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:22:09','2019-10-10 16:22:09'),
	(964,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:22:09','2019-10-10 16:22:09'),
	(965,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:22:09','2019-10-10 16:22:09'),
	(966,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:22:10','2019-10-10 16:22:10'),
	(967,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:22:10','2019-10-10 16:22:10'),
	(968,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:22:10','2019-10-10 16:22:10'),
	(969,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:22:26','2019-10-10 16:22:26'),
	(970,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:22:37','2019-10-10 16:22:37'),
	(971,1,'admin/complaints/4/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:22:42','2019-10-10 16:22:42'),
	(972,1,'admin/complaints/4','PUT','127.0.0.1','{\"replay\":\"asdasd\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/complaints\"}','2019-10-10 16:22:45','2019-10-10 16:22:45'),
	(973,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:22:45','2019-10-10 16:22:45'),
	(974,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"4\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintSuccess\",\"_input\":\"true\"}','2019-10-10 16:22:51','2019-10-10 16:22:51'),
	(975,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:22:51','2019-10-10 16:22:51'),
	(976,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"5\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintFail\",\"_input\":\"true\"}','2019-10-10 16:22:57','2019-10-10 16:22:57'),
	(977,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:22:57','2019-10-10 16:22:57'),
	(978,1,'admin/complaints/5','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:23:02','2019-10-10 16:23:02'),
	(979,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:23:06','2019-10-10 16:23:06'),
	(980,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"6\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintSuccess\",\"_input\":\"true\"}','2019-10-10 16:23:11','2019-10-10 16:23:11'),
	(981,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:23:11','2019-10-10 16:23:11'),
	(982,1,'admin/complaints/4','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:23:19','2019-10-10 16:23:19'),
	(983,1,'admin/complaints/4/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:23:20','2019-10-10 16:23:20'),
	(984,1,'admin/complaints/4','PUT','127.0.0.1','{\"replay\":\"asdasd2222\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/complaints\\/4\"}','2019-10-10 16:23:24','2019-10-10 16:23:24'),
	(985,1,'admin/complaints/4','GET','127.0.0.1','[]','2019-10-10 16:23:24','2019-10-10 16:23:24'),
	(986,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:23:27','2019-10-10 16:23:27'),
	(987,1,'admin/complaints/4','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:23:33','2019-10-10 16:23:33'),
	(988,1,'admin/complaints/4','GET','127.0.0.1','[]','2019-10-10 16:25:42','2019-10-10 16:25:42'),
	(989,1,'admin/complaints/4','GET','127.0.0.1','[]','2019-10-10 16:25:51','2019-10-10 16:25:51'),
	(990,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:25:53','2019-10-10 16:25:53'),
	(991,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:26:20','2019-10-10 16:26:20'),
	(992,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"7\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintFail\",\"_input\":\"true\"}','2019-10-10 16:26:24','2019-10-10 16:26:24'),
	(993,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:26:36','2019-10-10 16:26:36'),
	(994,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:26:38','2019-10-10 16:26:38'),
	(995,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"7\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintFail\",\"_input\":\"true\"}','2019-10-10 16:26:44','2019-10-10 16:26:44'),
	(996,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"7\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintFail\",\"_input\":\"true\"}','2019-10-10 16:27:51','2019-10-10 16:27:51'),
	(997,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"7\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintFail\",\"_input\":\"true\"}','2019-10-10 16:28:02','2019-10-10 16:28:02'),
	(998,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"7\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintFail\",\"_input\":\"true\"}','2019-10-10 16:28:25','2019-10-10 16:28:25'),
	(999,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"7\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintFail\",\"_input\":\"true\"}','2019-10-10 16:28:36','2019-10-10 16:28:36'),
	(1000,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"7\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintFail\",\"_input\":\"true\"}','2019-10-10 16:28:45','2019-10-10 16:28:45'),
	(1001,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"7\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintFail\",\"_input\":\"true\"}','2019-10-10 16:29:02','2019-10-10 16:29:02'),
	(1002,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"7\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintFail\",\"_input\":\"true\"}','2019-10-10 16:29:50','2019-10-10 16:29:50'),
	(1003,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"7\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintFail\",\"_input\":\"true\"}','2019-10-10 16:50:45','2019-10-10 16:50:45'),
	(1004,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 16:50:46','2019-10-10 16:50:46'),
	(1005,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:50:52','2019-10-10 16:50:52'),
	(1006,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 16:54:48','2019-10-10 16:54:48'),
	(1007,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 17:01:30','2019-10-10 17:01:30'),
	(1008,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"4\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintSuccess\",\"_input\":\"true\"}','2019-10-10 17:01:36','2019-10-10 17:01:36'),
	(1009,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:01:36','2019-10-10 17:01:36'),
	(1010,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 17:01:51','2019-10-10 17:01:51'),
	(1011,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 17:03:23','2019-10-10 17:03:23'),
	(1012,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"4\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintSuccess\",\"_input\":\"true\"}','2019-10-10 17:03:26','2019-10-10 17:03:26'),
	(1013,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:03:26','2019-10-10 17:03:26'),
	(1014,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 17:04:32','2019-10-10 17:04:32'),
	(1015,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"5\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintSuccess\",\"_input\":\"true\"}','2019-10-10 17:04:35','2019-10-10 17:04:35'),
	(1016,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:04:35','2019-10-10 17:04:35'),
	(1017,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 17:06:08','2019-10-10 17:06:08'),
	(1018,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"6\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintFail\",\"_input\":\"true\"}','2019-10-10 17:06:11','2019-10-10 17:06:11'),
	(1019,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:06:11','2019-10-10 17:06:11'),
	(1020,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"7\",\"_model\":\"App_Complaint\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_action\":\"App_Admin_Actions_Complaint_ReviewComplaintSuccess\",\"_input\":\"true\"}','2019-10-10 17:06:15','2019-10-10 17:06:15'),
	(1021,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:06:15','2019-10-10 17:06:15'),
	(1022,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 17:09:07','2019-10-10 17:09:07'),
	(1023,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:09:13','2019-10-10 17:09:13'),
	(1024,1,'admin/auth/menu','POST','127.0.0.1','{\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":9},{\\\"id\\\":15},{\\\"id\\\":14},{\\\"id\\\":13},{\\\"id\\\":12},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2019-10-10 17:10:02','2019-10-10 17:10:02'),
	(1025,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:10:02','2019-10-10 17:10:02'),
	(1026,1,'admin/auth/menu/11/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:10:06','2019-10-10 17:10:06'),
	(1027,1,'admin/auth/menu/11','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u4fdd\\u8bc1\\u91d1\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"deposits\",\"roles\":[null],\"permission\":null,\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/menu\"}','2019-10-10 17:10:12','2019-10-10 17:10:12'),
	(1028,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 17:10:12','2019-10-10 17:10:12'),
	(1029,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 17:10:13','2019-10-10 17:10:13'),
	(1030,1,'admin/auth/menu/10/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:10:19','2019-10-10 17:10:19'),
	(1031,1,'admin/auth/menu/10','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u4f1a\\u5458\\u7ba1\\u7406\",\"icon\":\"fa-users\",\"uri\":\"users\",\"roles\":[null],\"permission\":null,\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/menu\"}','2019-10-10 17:10:41','2019-10-10 17:10:41'),
	(1032,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 17:10:41','2019-10-10 17:10:41'),
	(1033,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 17:10:43','2019-10-10 17:10:43'),
	(1034,1,'admin/auth/menu/11/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:10:45','2019-10-10 17:10:45'),
	(1035,1,'admin/auth/menu/11','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u4fdd\\u8bc1\\u91d1\\u7ba1\\u7406\",\"icon\":\"fa-cny\",\"uri\":\"deposits\",\"roles\":[null],\"permission\":null,\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/menu\"}','2019-10-10 17:11:03','2019-10-10 17:11:03'),
	(1036,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 17:11:03','2019-10-10 17:11:03'),
	(1037,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 17:11:05','2019-10-10 17:11:05'),
	(1038,1,'admin/auth/menu/9/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:11:08','2019-10-10 17:11:08'),
	(1039,1,'admin/auth/menu/9','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-book\",\"uri\":\"withdraws\",\"roles\":[null],\"permission\":null,\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/menu\"}','2019-10-10 17:11:20','2019-10-10 17:11:20'),
	(1040,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 17:11:20','2019-10-10 17:11:20'),
	(1041,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 17:11:22','2019-10-10 17:11:22'),
	(1042,1,'admin/auth/menu/15/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:11:25','2019-10-10 17:11:25'),
	(1043,1,'admin/auth/menu/15','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u6295\\u8bc9\\u7ba1\\u7406\",\"icon\":\"fa-gavel\",\"uri\":\"complaints\",\"roles\":[null],\"permission\":null,\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/menu\"}','2019-10-10 17:12:11','2019-10-10 17:12:11'),
	(1044,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 17:12:11','2019-10-10 17:12:11'),
	(1045,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 17:12:12','2019-10-10 17:12:12'),
	(1046,1,'admin/auth/menu/14/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:12:15','2019-10-10 17:12:15'),
	(1047,1,'admin/auth/menu/14','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u6d88\\u606f\\u7ba1\\u7406\",\"icon\":\"fa-comments-o\",\"uri\":\"messages\",\"roles\":[null],\"permission\":null,\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/menu\"}','2019-10-10 17:12:24','2019-10-10 17:12:24'),
	(1048,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 17:12:24','2019-10-10 17:12:24'),
	(1049,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 17:12:26','2019-10-10 17:12:26'),
	(1050,1,'admin/auth/menu/13/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:12:30','2019-10-10 17:12:30'),
	(1051,1,'admin/auth/menu/13','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u5e2e\\u52a9\\u4e2d\\u5fc3\",\"icon\":\"fa-whatsapp\",\"uri\":\"helps\",\"roles\":[null],\"permission\":null,\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/menu\"}','2019-10-10 17:12:48','2019-10-10 17:12:48'),
	(1052,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 17:12:48','2019-10-10 17:12:48'),
	(1053,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 17:12:49','2019-10-10 17:12:49'),
	(1054,1,'admin/auth/menu/12/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:12:52','2019-10-10 17:12:52'),
	(1055,1,'admin/auth/menu/12','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u94f6\\u884c\\u7ba1\\u7406\",\"icon\":\"fa-bank\",\"uri\":\"banks\",\"roles\":[null],\"permission\":null,\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/menu\"}','2019-10-10 17:13:05','2019-10-10 17:13:05'),
	(1056,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 17:13:05','2019-10-10 17:13:05'),
	(1057,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 17:13:07','2019-10-10 17:13:07'),
	(1058,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:13:10','2019-10-10 17:13:10'),
	(1059,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:13:18','2019-10-10 17:13:18'),
	(1060,1,'admin/deposits','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:13:19','2019-10-10 17:13:19'),
	(1061,1,'admin/withdraws','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:13:19','2019-10-10 17:13:19'),
	(1062,1,'admin/complaints','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:13:20','2019-10-10 17:13:20'),
	(1063,1,'admin/complaints','GET','127.0.0.1','[]','2019-10-10 17:13:43','2019-10-10 17:13:43'),
	(1064,1,'admin/messages','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:13:44','2019-10-10 17:13:44'),
	(1065,1,'admin/helps','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:13:45','2019-10-10 17:13:45'),
	(1066,1,'admin/helps','GET','127.0.0.1','[]','2019-10-10 17:13:54','2019-10-10 17:13:54'),
	(1067,1,'admin/messages','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:13:57','2019-10-10 17:13:57'),
	(1068,1,'admin/helps','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:13:58','2019-10-10 17:13:58'),
	(1069,1,'admin/banks','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:13:59','2019-10-10 17:13:59'),
	(1070,1,'admin/banks','GET','127.0.0.1','[]','2019-10-10 17:14:08','2019-10-10 17:14:08'),
	(1071,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:14:10','2019-10-10 17:14:10'),
	(1072,1,'admin/deposits','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:14:15','2019-10-10 17:14:15'),
	(1073,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:14:18','2019-10-10 17:14:18'),
	(1074,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:14:36','2019-10-10 17:14:36'),
	(1075,1,'admin','GET','127.0.0.1','[]','2019-10-10 17:14:48','2019-10-10 17:14:48'),
	(1076,1,'admin/users','GET','127.0.0.1','[]','2019-10-10 17:14:48','2019-10-10 17:14:48'),
	(1077,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:14:54','2019-10-10 17:14:54'),
	(1078,1,'admin/users','GET','127.0.0.1','[]','2019-10-10 17:14:54','2019-10-10 17:14:54'),
	(1079,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:14:55','2019-10-10 17:14:55'),
	(1080,1,'admin/users','GET','127.0.0.1','[]','2019-10-10 17:14:55','2019-10-10 17:14:55'),
	(1081,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:14:57','2019-10-10 17:14:57'),
	(1082,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:14:59','2019-10-10 17:14:59'),
	(1083,1,'admin/auth/menu/1','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"bBHso3C3mhRNos0NLQQjP0dq0pXkwlu1qNyaany4\"}','2019-10-10 17:15:04','2019-10-10 17:15:04'),
	(1084,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:15:04','2019-10-10 17:15:04'),
	(1085,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 17:15:06','2019-10-10 17:15:06'),
	(1086,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 17:15:07','2019-10-10 17:15:07'),
	(1087,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-10-10 17:15:07','2019-10-10 17:15:07'),
	(1088,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-10-10 17:15:20','2019-10-10 17:15:20');

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
  `bank_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '银行编码',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '银行logo',
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
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态0:待受理；1:客服处理中;2:交易正常;3:交易取消',
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



# Dump of table helps
# ------------------------------------------------------------

DROP TABLE IF EXISTS `helps`;

CREATE TABLE `helps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `helps` WRITE;
/*!40000 ALTER TABLE `helps` DISABLE KEYS */;

INSERT INTO `helps` (`id`, `title`, `content`, `created_at`, `updated_at`)
VALUES
	(1,'提现记录问题说明','前几天的GQ举办的一场活动，引来了无数讨论的题。首先就是主持人董又霖的拙劣表演，让不少网友吐槽。随后GQ官方号又曝光了不少幕后','2019-10-10 11:04:42','2019-10-10 11:04:42'),
	(2,'2提现记录问题说明','前几天的GQ举办的一场活动，引来了无数讨论的题。首先就是主持人董又霖的拙劣表演，让不少网友吐槽。随后GQ官方号又曝光了不少幕后','2019-10-10 11:04:42','2019-10-10 11:04:42'),
	(3,'这是标题','这是强行打算打卡快乐到家啦快结束的离开这是强行打算打卡快乐到家啦快结束的离开这是强行打算打卡快乐到家啦快结束的离开这是强行打算打卡快乐到家啦快结束的离开这是强行打算打卡快乐到家啦快结束的离开这是强行打算打卡快乐到家啦快结束的离开这是强行打算打卡快乐到家啦快结束的离开这是强行打算打卡快乐到家啦快结束的离开这是强行打算打卡快乐到家啦快结束的离开这是强行打算打卡快乐到家啦快结束的离开这是强行打算打卡快乐到家啦快结束的离开这是强行打算打卡快乐到家啦快结束的离开','2019-10-10 14:18:29','2019-10-10 14:18:29');

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
	(18,'2019_10_08_142509_create_messages_table',6),
	(19,'2019_10_10_104438_create_helps_table',7);

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
	('115aeab82016117e2c64f0098c5355de144211e9bd0ff71dc1b00f1e10efb7237574bfbd487a20e4',1,2,NULL,'[]',0,'2019-10-09 19:27:18','2019-10-09 19:27:18','2019-10-24 19:27:18'),
	('157b815702591d9007775693aaf2a053679a8ed0c1504153b9cbfbd110d0809a6c573002f133570d',2,2,NULL,'[]',0,'2019-10-09 23:56:39','2019-10-09 23:56:39','2019-10-24 23:56:39'),
	('18bb4778305af3ae221fc33e5515222144f7e775819e2c3b17a83b5de2dd8a3385590917aa4d5444',2,2,NULL,'[]',0,'2019-10-10 00:15:02','2019-10-10 00:15:02','2019-10-25 00:15:02'),
	('208492a2d972bb85b7018757a611ac5e26f6505dd10ae810420aa6213809af45b5965b3cba8b707f',6,2,NULL,'[]',0,'2019-10-08 22:00:05','2019-10-08 22:00:05','2019-10-23 22:00:04'),
	('29f0168bcfb7ec9d0605fad50ccd25a67c61ccc0df769f0f50fd92ff86036ac43533ed937b9fa25a',7,2,NULL,'[]',0,'2019-10-08 22:04:02','2019-10-08 22:04:02','2019-10-23 22:04:02'),
	('2b7111dbeebd20b3032d093d16df696e6763aad65b420f1a787db7764d2778345de3ca1c4d9010c0',1,2,NULL,'[]',0,'2019-10-07 13:19:27','2019-10-07 13:19:27','2019-10-22 13:19:27'),
	('34b9b77f9e13893852d33e646fffa54d441bcd9b38670edd2f29100b184ac4a381624a77fe1c05d0',7,2,NULL,'[]',0,'2019-10-10 00:02:51','2019-10-10 00:02:51','2019-10-25 00:02:51'),
	('4992f295d6b2c5a0e8e18383cfd41b9924b29160ca1119957098b7a3d5850fd2941e0d9b51b5cdc7',8,2,NULL,'[]',0,'2019-10-10 00:43:34','2019-10-10 00:43:34','2019-10-25 00:43:34'),
	('4ca1d943a7d5aa5ae28ea1c22b117498b4545b4d13b4ebf1c7723982e5f5e758b7447f2cf10a3871',7,2,NULL,'[]',0,'2019-10-09 20:09:44','2019-10-09 20:09:44','2019-10-24 20:09:44'),
	('61f1b9bf19112fb96876c61fff7eaee9b6744bb138e2c32df434397a72e24f8bd2deaacf06ef7179',2,2,NULL,'[]',0,'2019-10-10 10:39:05','2019-10-10 10:39:05','2019-10-25 10:39:05'),
	('6e74b6c03b6372fbe2305f02eb0b4d1063b6b6a70b35bfb7b63383db6089a00fd70f3959c23c9f0f',6,2,NULL,'[]',0,'2019-10-08 22:35:22','2019-10-08 22:35:22','2019-10-23 22:35:22'),
	('78eddb4dc97f084ae8578d347e2c6904d62ccdd1cde7c2f5be80849e7643177bbf43c8b23df094f7',6,2,NULL,'[]',0,'2019-10-08 23:39:38','2019-10-08 23:39:38','2019-10-23 23:39:38'),
	('8ffc018aaf2d1316f3667d6646d065afa63c66ff5e68cc788d4a8bca423f006c074a3e935ee58fbb',6,2,NULL,'[]',0,'2019-10-08 20:59:08','2019-10-08 20:59:08','2019-10-23 20:59:07'),
	('940bf5fe0cb15f441de893d34171cbd93fd617667c24f3124c6b050ac67181abb0936258577b44b3',2,2,NULL,'[]',0,'2019-10-09 17:20:12','2019-10-09 17:20:12','2019-10-24 17:20:12'),
	('a5fa0b0ab359fa18ea2749a339b9bd249c15dea29ed085599a55003f5013751339b440147963a847',1,2,NULL,'[]',0,'2019-10-07 13:34:49','2019-10-07 13:34:49','2019-10-22 13:34:49'),
	('b050861c4385fcc32564fe5b3b944248e5e4f7372da93215102032cc217ca46e4f785a76468086c2',6,2,NULL,'[]',0,'2019-10-09 14:28:40','2019-10-09 14:28:40','2019-10-24 14:28:40'),
	('babcf3013ca29bfa861d8a0eb185712fdb50c0cb0a11666d5e429fd69cd083a6434e261e7d54d57c',9,2,NULL,'[]',0,'2019-10-09 21:35:22','2019-10-09 21:35:22','2019-10-24 21:35:22'),
	('c00ec24f79ad1edee2b9c3d0c0ffb667e5d939eff8a2e21ea05be7b5b5f177b206c99c1afded26da',6,2,NULL,'[]',0,'2019-10-09 00:07:40','2019-10-09 00:07:40','2019-10-24 00:07:40'),
	('c14dc93e8b8c21fc945002e57b1c22a3cc00c0cc233afcf5f92f64f4366918451fea5ed587904470',1,2,NULL,'[]',0,'2019-10-09 17:14:38','2019-10-09 17:14:38','2019-10-24 17:14:38'),
	('c2460e2c72f4cfafc852c2fe4fa539af486798e05f121e7b66d76172e67afacaf429ef433504dd93',10,2,NULL,'[]',0,'2019-10-09 23:59:28','2019-10-09 23:59:28','2019-10-24 23:59:28'),
	('c51ed87aff7b3b3a282442dfcb1acfd780b8e4b8e6d67c3ffed4c192bdd5a87142ed8b79d4bddec7',8,2,NULL,'[]',0,'2019-10-09 20:54:08','2019-10-09 20:54:08','2019-10-24 20:54:08'),
	('efc7213a0c666ba8330cec3335e47532faa73c5e92b8b0081c558306146e6d0f0c6721b45996dd88',1,2,NULL,'[]',0,'2019-10-07 13:25:44','2019-10-07 13:25:44','2019-10-22 13:25:43'),
	('f91ce9a046b34bf7c6188aab52f5974b0457a32316f7c07f9bda261fa605cb86d684d642f8ae98ea',6,2,NULL,'[]',0,'2019-10-09 19:53:28','2019-10-09 19:53:28','2019-10-24 19:53:28');

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
  `payer_parent_user_id` int(11) DEFAULT NULL COMMENT '付款人的上级ID',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单号',
  `amount` decimal(20,2) NOT NULL COMMENT '提现时金额',
  `withdraw_amount` decimal(20,2) NOT NULL COMMENT '提现金额',
  `brokerage_fee` decimal(20,2) NOT NULL COMMENT '佣金',
  `parent_brokerage_fee` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '上级佣金',
  `operation_fee` decimal(20,2) NOT NULL COMMENT '平台运营手续费',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收款人',
  `bankname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '开户银行',
  `bankcard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '银行卡号',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '图片',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态0:待抢单；1:已接单;2:已出款;3:交易正常;4:交易取消',
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
