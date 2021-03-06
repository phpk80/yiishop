-- MySQL dump 10.13  Distrib 5.7.11, for Linux (x86_64)
--
-- Host: localhost    Database: imooc_shop
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS imooc_shop DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;
USE  imooc_shop;

--
-- Table structure for table `shop_address`
--

DROP TABLE IF EXISTS `shop_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_address` (
  `addressid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL DEFAULT '',
  `lastname` varchar(32) NOT NULL DEFAULT '',
  `company` varchar(100) NOT NULL DEFAULT '',
  `address` text,
  `postcode` char(6) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `telephone` varchar(20) NOT NULL DEFAULT '',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`addressid`),
  KEY `shop_address_userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_address`
--

LOCK TABLES `shop_address` WRITE;
/*!40000 ALTER TABLE `shop_address` DISABLE KEYS */;
INSERT INTO `shop_address` VALUES (2,'蜡笔','小新','','北京市朝阳区某某街道','100000','test@test.com','13888888888',1,0);
/*!40000 ALTER TABLE `shop_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_admin`
--

DROP TABLE IF EXISTS `shop_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_admin` (
  `adminid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `adminuser` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员账号',
  `adminpass` char(64) NOT NULL DEFAULT '',
  `adminemail` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员电子邮箱',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `loginip` bigint(20) NOT NULL DEFAULT '0' COMMENT '登录IP',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`adminid`),
  UNIQUE KEY `shop_admin_adminuser_adminpass` (`adminuser`,`adminpass`),
  UNIQUE KEY `shop_admin_adminuser_adminemail` (`adminuser`,`adminemail`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_admin`
--

LOCK TABLES `shop_admin` WRITE;
/*!40000 ALTER TABLE `shop_admin` DISABLE KEYS */;
INSERT INTO `shop_admin` VALUES (12,'admintest','$2y$13$Mg0SLCS1fXHlvP6W57vFweNYqbLZ4QG91rrLSHzu.JE3tyOBZ18S6','admintest@admintest.com',0,0,0),(15,'testuser','$2y$13$rt8KZr3rwQsZN.ppMnMYIeZqe5FlsbHyaSDhRO2LBg8qvFVE1leJe','testuser123@test.com',0,0,0),(18,'ruler','$2y$13$hFIhJxyDbw/da./ZlXNZqeAOdlF4tT0I0qlCA2xWZMnCCqsq8mDny','test@tes123.com',0,0,0),(19,'test1','$2y$13$WQvJErEPjc1Bze5ryydLHeYqwgw92MDrrhX4rUchYinauA4ls5Gby','test@test1.com',0,0,0),(20,'test2','$2y$13$xh6EFVdMqKa4obdi/Yl2DecaGpXdj2JqNcXVOUTjZgBNxDVxn55hm','test2@test2.com',0,0,0);
/*!40000 ALTER TABLE `shop_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_auth_assignment`
--

DROP TABLE IF EXISTS `shop_auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `shop_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `shop_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_auth_assignment`
--

LOCK TABLES `shop_auth_assignment` WRITE;
/*!40000 ALTER TABLE `shop_auth_assignment` DISABLE KEYS */;
INSERT INTO `shop_auth_assignment` VALUES ('admin','12',1480370458),('category','15',1480370643),('category/*','16',1480378369),('default','19',1480432021),('default/*','16',1480378369),('testrule','18',1480391980);
/*!40000 ALTER TABLE `shop_auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_auth_item`
--

DROP TABLE IF EXISTS `shop_auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `shop_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `shop_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_auth_item`
--

LOCK TABLES `shop_auth_item` WRITE;
/*!40000 ALTER TABLE `shop_auth_item` DISABLE KEYS */;
INSERT INTO `shop_auth_item` VALUES ('admin',1,'超级管理员',NULL,NULL,1480370333,1480370333),('category',1,'分类管理员',NULL,NULL,1480370572,1480370572),('category/*',2,'category/*',NULL,NULL,1480370372,1480370372),('category/add',2,'category/add',NULL,NULL,1480370372,1480370372),('category/del',2,'category/del',NULL,NULL,1480370372,1480370372),('category/delete',2,'category/delete',NULL,NULL,1480370372,1480370372),('category/list',2,'category/list',NULL,NULL,1480370372,1480370372),('category/mod',2,'category/mod',NULL,NULL,1480370372,1480370372),('category/rename',2,'category/rename',NULL,NULL,1480370372,1480370372),('category/tree',2,'category/tree',NULL,NULL,1480370372,1480370372),('common/*',2,'common/*',NULL,NULL,1480370372,1480370372),('default',1,'游客',NULL,NULL,1480431968,1480431968),('default/*',2,'default/*',NULL,NULL,1480370372,1480370372),('default/index',2,'default/index',NULL,NULL,1480370372,1480370372),('manage/*',2,'manage/*',NULL,NULL,1480370372,1480370372),('manage/assign',2,'manage/assign',NULL,NULL,1480370372,1480370372),('manage/changeemail',2,'manage/changeemail',NULL,NULL,1480370372,1480370372),('manage/changepass',2,'manage/changepass',NULL,NULL,1480370372,1480370372),('manage/del',2,'manage/del',NULL,NULL,1480370372,1480370372),('manage/mailchangepass',2,'manage/mailchangepass',NULL,NULL,1480370372,1480370372),('manage/managers',2,'manage/managers',NULL,NULL,1480370372,1480370372),('manage/reg',2,'manage/reg',NULL,NULL,1480370372,1480370372),('order/*',2,'order/*',NULL,NULL,1480370372,1480370372),('order/detail',2,'order/detail',NULL,NULL,1480370372,1480370372),('order/list',2,'order/list',NULL,NULL,1480370372,1480370372),('order/send',2,'order/send',NULL,NULL,1480370372,1480370372),('product/*',2,'product/*',NULL,NULL,1480370372,1480370372),('product/add',2,'product/add',NULL,NULL,1480370372,1480370372),('product/del',2,'product/del',NULL,NULL,1480370372,1480370372),('product/list',2,'product/list',NULL,NULL,1480370372,1480370372),('product/mod',2,'product/mod',NULL,NULL,1480370372,1480370372),('product/off',2,'product/off',NULL,NULL,1480370372,1480370372),('product/on',2,'product/on',NULL,NULL,1480370372,1480370372),('product/removepic',2,'product/removepic',NULL,NULL,1480370372,1480370372),('public/*',2,'public/*',NULL,NULL,1480370372,1480370372),('public/login',2,'public/login',NULL,NULL,1480370372,1480370372),('public/logout',2,'public/logout',NULL,NULL,1480370372,1480370372),('public/seekpassword',2,'public/seekpassword',NULL,NULL,1480370372,1480370372),('rbac/*',2,'rbac/*',NULL,NULL,1480370372,1480370372),('rbac/assignitem',2,'rbac/assignitem',NULL,NULL,1480370372,1480370372),('rbac/createrole',2,'rbac/createrole',NULL,NULL,1480370372,1480370372),('rbac/roles',2,'rbac/roles',NULL,NULL,1480370372,1480370372),('testrule',1,'测试规则','isAuthor',NULL,1480391834,1480391834),('user/*',2,'user/*',NULL,NULL,1480370372,1480370372),('user/del',2,'user/del',NULL,NULL,1480370372,1480370372),('user/reg',2,'user/reg',NULL,NULL,1480370372,1480370372),('user/users',2,'user/users',NULL,NULL,1480370372,1480370372);
/*!40000 ALTER TABLE `shop_auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_auth_item_child`
--

DROP TABLE IF EXISTS `shop_auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `shop_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `shop_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shop_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `shop_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_auth_item_child`
--

LOCK TABLES `shop_auth_item_child` WRITE;
/*!40000 ALTER TABLE `shop_auth_item_child` DISABLE KEYS */;
INSERT INTO `shop_auth_item_child` VALUES ('admin','category/*'),('category','category/*'),('testrule','category/*'),('category','category/add'),('category','category/del'),('category','category/delete'),('category','category/list'),('category','category/mod'),('category','category/rename'),('category','category/tree'),('admin','common/*'),('admin','default/*'),('category','default/*'),('default','default/*'),('testrule','default/*'),('admin','manage/*'),('admin','order/*'),('admin','product/*'),('admin','public/*'),('admin','rbac/*'),('admin','user/*');
/*!40000 ALTER TABLE `shop_auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_auth_rule`
--

DROP TABLE IF EXISTS `shop_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_auth_rule`
--

LOCK TABLES `shop_auth_rule` WRITE;
/*!40000 ALTER TABLE `shop_auth_rule` DISABLE KEYS */;
INSERT INTO `shop_auth_rule` VALUES ('isAuthor','O:21:\"app\\models\\AuthorRule\":3:{s:4:\"name\";s:8:\"isAuthor\";s:9:\"createdAt\";i:1480391749;s:9:\"updatedAt\";i:1480391749;}',1480391749,1480391749);
/*!40000 ALTER TABLE `shop_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_cart`
--

DROP TABLE IF EXISTS `shop_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_cart` (
  `cartid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `productid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `productnum` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cartid`),
  KEY `shop_cart_productid` (`productid`),
  KEY `shop_cart_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_cart`
--

LOCK TABLES `shop_cart` WRITE;
/*!40000 ALTER TABLE `shop_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_category`
--

DROP TABLE IF EXISTS `shop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_category` (
  `cateid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `adminid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cateid`),
  KEY `shop_category_parentid` (`parentid`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_category`
--

LOCK TABLES `shop_category` WRITE;
/*!40000 ALTER TABLE `shop_category` DISABLE KEYS */;
INSERT INTO `shop_category` VALUES (7,'家用电器',0,1467541004,0),(8,'手机',0,1467541036,0),(9,'电脑',0,1467541047,0),(10,'办公',0,1467541057,0),(11,'家居',0,1467541066,0),(12,'男装',0,1467541082,0),(13,'女装',0,1467541091,0),(14,'个护化妆',0,1467541099,0),(15,'汽车用品',0,1467541111,0),(16,'玩具乐器',0,1467541131,0),(17,'食品222',0,1467541144,0),(18,'平板电视',7,1467541223,0),(19,'空调',7,1467541235,0),(20,'冰箱',7,1467541243,0),(21,'洗衣机',7,1467541254,0),(22,'家庭影院',7,1467541263,0),(23,'DVD',7,1467541273,0),(24,'迷你音响',7,1467541282,0),(25,'冷柜/冰吧',7,1467541294,0),(26,'酒柜',7,1467541302,0),(27,'家电配件',7,1467541310,0),(28,'油烟机',7,1467541343,0),(29,'燃气灶',7,1467541353,0),(30,'烟灶套装',7,1467541361,0),(31,'消毒柜',7,1467541368,0),(32,'洗碗机',7,1467541376,0),(33,'电热水器',7,1467541385,0),(34,'嵌入式厨电',7,1467541471,0),(35,'移动电源',8,1467557001,0),(36,'蓝牙耳机',8,1467557013,0),(37,'充电器',8,1467557023,0),(38,'数据线',8,1467557031,0),(39,'手机耳机',8,1467557039,0),(40,'手机支架',8,1467557048,0),(41,'贴膜',8,1467557055,0),(42,'手机存储卡',8,1467557062,0),(43,'CPU',9,1467557083,0),(44,'键盘',9,1467557088,0),(47,'显卡',9,1467557102,0),(48,'硬盘',9,1467557108,0),(49,'打印纸',10,1467557130,0),(50,'圆珠笔',10,1467557142,0),(51,'中性笔',10,1467557147,0),(52,'投影机',10,1467557168,0),(53,'打印机',10,1467557173,0),(54,'沙发',11,1467557187,0),(55,'壁柜',11,1467557192,0),(57,'写字台',11,1467557205,0),(58,'椅子',11,1467557209,0),(59,'空调',11,1467557217,0),(60,'衬衫',12,1467557244,0),(64,'短裤',12,1467557273,0),(65,'棉服',12,1467557278,0),(66,'连衣裙',13,1467557293,0),(67,'雪纺衫',13,1467557298,0),(68,'吊带',13,1467557307,0),(69,'背心',13,1467557311,0),(71,'洁面',14,1467557354,0),(72,'爽肤水',14,1467557359,0),(73,'行车记录仪',15,1467557377,0),(74,'导航仪',15,1467557381,0),(75,'车蜡',15,1467557391,0),(76,'钢琴',16,1467557414,0),(78,'打击乐器',16,1467557425,0),(81,'猪牛羊肉',17,1467557473,0),(88,'测试分类',0,1480390320,12);
/*!40000 ALTER TABLE `shop_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_migration`
--

DROP TABLE IF EXISTS `shop_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_migration`
--

LOCK TABLES `shop_migration` WRITE;
/*!40000 ALTER TABLE `shop_migration` DISABLE KEYS */;
INSERT INTO `shop_migration` VALUES ('m000000_000000_base',1480304961),('m140506_102106_rbac_init',1480306877);
/*!40000 ALTER TABLE `shop_migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_order`
--

DROP TABLE IF EXISTS `shop_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_order` (
  `orderid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `addressid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `expressid` int(10) unsigned NOT NULL DEFAULT '0',
  `expressno` varchar(50) NOT NULL DEFAULT '',
  `tradeno` varchar(100) NOT NULL DEFAULT '',
  `tradeext` text,
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`orderid`),
  KEY `shop_order_userid` (`userid`),
  KEY `shop_order_addressid` (`addressid`),
  KEY `shop_order_expressid` (`expressid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_order`
--

LOCK TABLES `shop_order` WRITE;
/*!40000 ALTER TABLE `shop_order` DISABLE KEYS */;
INSERT INTO `shop_order` VALUES (1,1,2,6710.00,100,2,'','',NULL,1468308342,'2016-11-26 02:42:17'),(2,1,2,2894.00,100,3,'','',NULL,1468308474,'2016-07-12 07:28:05'),(3,1,0,0.00,0,0,'','',NULL,1480128001,'2016-11-26 02:40:01'),(4,1,0,0.00,0,0,'','',NULL,1480128041,'2016-11-26 02:40:41'),(5,1,0,0.00,0,0,'','',NULL,1480128079,'2016-11-26 02:41:19'),(6,1,0,0.00,0,0,'','',NULL,1480128109,'2016-11-26 02:41:49'),(7,1,0,0.00,0,0,'','',NULL,1480128193,'2016-11-26 02:43:13'),(8,1,2,1518.00,100,2,'','',NULL,1480128231,'2016-11-26 02:57:22'),(9,1,0,0.00,0,0,'','',NULL,1480193198,'2016-11-26 20:46:38'),(10,1,0,0.00,0,0,'','',NULL,1480194095,'2016-11-26 21:01:35'),(11,12,0,0.00,0,0,'','',NULL,1481656816,'2016-12-13 19:20:16'),(12,12,0,0.00,0,0,'','',NULL,1481656865,'2016-12-13 19:21:05'),(13,12,0,0.00,0,0,'','',NULL,1481661237,'2016-12-13 20:33:57'),(14,12,0,0.00,0,0,'','',NULL,1481661280,'2016-12-13 20:34:40');
/*!40000 ALTER TABLE `shop_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_order_detail`
--

DROP TABLE IF EXISTS `shop_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_order_detail` (
  `detailid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `productid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `productnum` int(10) unsigned NOT NULL DEFAULT '0',
  `orderid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`detailid`),
  KEY `shop_order_detail_productid` (`productid`),
  KEY `shop_order_detail_orderid` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_order_detail`
--

LOCK TABLES `shop_order_detail` WRITE;
/*!40000 ALTER TABLE `shop_order_detail` DISABLE KEYS */;
INSERT INTO `shop_order_detail` VALUES (1,7,6690.00,1,1,1468308342),(2,8,1396.00,1,2,1468308474),(3,10,1498.00,1,2,1468308474),(4,8,1396.00,1,3,1480128001),(5,8,1396.00,1,4,1480128041),(6,7,6690.00,6,5,1480128079),(7,12,688.00,1,6,1480128109),(8,10,1498.00,1,7,1480128193),(9,11,1498.00,1,8,1480128231),(10,7,6690.00,3,9,1480193198),(11,7,6690.00,1,10,1480194095),(12,27,92.00,1,11,1481656816),(13,26,90.00,1,11,1481656816),(14,8,1396.00,1,11,1481656816),(15,7,6690.00,1,11,1481656816),(16,7,6690.00,1,12,1481656865),(17,8,1396.00,1,13,1481661237),(18,26,90.00,1,14,1481661280);
/*!40000 ALTER TABLE `shop_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_product`
--

DROP TABLE IF EXISTS `shop_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_product` (
  `productid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '',
  `descr` text,
  `num` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cover` varchar(200) NOT NULL DEFAULT '',
  `pics` text,
  `issale` enum('0','1') NOT NULL DEFAULT '0',
  `ishot` enum('0','1') NOT NULL DEFAULT '0',
  `istui` enum('0','1') NOT NULL DEFAULT '0',
  `saleprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ison` enum('0','1') NOT NULL DEFAULT '1',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`productid`),
  KEY `shop_product_cateid` (`cateid`),
  KEY `shop_product_ison` (`ison`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product`
--

LOCK TABLES `shop_product` WRITE;
/*!40000 ALTER TABLE `shop_product` DISABLE KEYS */;
INSERT INTO `shop_product` VALUES (7,20,'22222222222222222222Heilan Home/海澜之家2016夏季热卖男装圆领休闲印花潮流短袖T恤','<span><img alt=\"\"><img alt=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t2941/22/706006802/406075/2b1e6c4/5763937dN29718543.jpg\"></span>',108,6690.00,'http://o7zgluxwg.bkt.clouddn.com/584f344d79c54','{\"5779288c0a72b\":\"http:\\/\\/o7zgluxwg.bkt.clouddn.com\\/5779288c0a72b\",\"577928b3757a0\":\"http:\\/\\/o7zgluxwg.bkt.clouddn.com\\/577928b3757a0\"}','0','1','0',6690.00,'1',0,0),(8,20,'美的(Midea) BCD-206TM(E) 206升 三门冰箱 节能保鲜 闪白银','&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt=\"\"><img alt=\"\" src=\"http://img11.360buyimg.com/cms/jfs/t2056/173/1898915458/101187/470cf666/56e26684Nb3eee304.jpg\">',95,1396.00,'http://o7zgluxwg.bkt.clouddn.com/57792cf85ecfd','{\"57792a5460862\":\"http:\\/\\/o7zgluxwg.bkt.clouddn.com\\/57792a5460862\",\"57792a561af7c\":\"http:\\/\\/o7zgluxwg.bkt.clouddn.com\\/57792a561af7c\"}','0','1','1',1396.00,'1',0,0),(9,20,'风冷无霜 电脑控温 纤薄设计 节能静音','<img alt=\"\"><img alt=\"\" src=\"http://img14.360buyimg.com/cms/jfs/t1942/44/2725816430/124244/653162f6/56f0f1cdN4790e3df.jpg\">',100,3699.00,'http://o7zgluxwg.bkt.clouddn.com/584ead8ae098f','{\"57792c3b02c73\":\"http:\\/\\/o7zgluxwg.bkt.clouddn.com\\/57792c3b02c73\",\"584ead8b1d370\":\"http:\\/\\/o7zgluxwg.bkt.clouddn.com\\/584ead8b1d370\"}','0','1','1',3699.00,'1',0,0),(10,20,'美的(Midea) BCD-216TM（E）216升 三门冰箱 三温区 省电节能 悦动白','<img src=\"http://img10.360buyimg.com/cms/jfs/t2347/106/1920014229/122925/5034d0d7/56e23b6cNbd4ebf19.jpg\" alt=\"\"><br>',198,1498.00,'http://o7zgluxwg.bkt.clouddn.com/5783058723468','[]','1','1','1',1498.00,'1',0,0),(11,20,'美的(Midea) BCD-303WTZM(E ) 303升 多门冰箱 风冷智能 WIFI远程操控 太空银 ','<img src=\"http://img11.360buyimg.com/cms/jfs/t2629/257/1719908740/241985/827f171c/5746e372N471d7aec.jpg\" alt=\"\"><br>',199,1498.00,'http://o7zgluxwg.bkt.clouddn.com/5783096f1499d','[]','1','1','1',1498.00,'1',0,0),(12,20,'海尔（Haier）BC-93TMPF 93升 单门冰箱 一级节能 ','<img src=\"http://img20.360buyimg.com/vc/jfs/t2644/268/1090705966/61725/c38b957/573463b5N9923a2d6.jpg\" alt=\"\"><br>',199,688.00,'http://o7zgluxwg.bkt.clouddn.com/57830af934641','[]','1','1','1',688.00,'1',0,0),(25,7,'一级节能的冰箱，很厉害','一级节能的冰箱，很厉害一级节能的冰箱，很厉害一级节能的冰箱，很厉害一级节能的冰箱，很厉害一级节能的冰箱，很厉害一级节能的冰箱，很厉害一级节能的冰箱，很厉害一级节能的冰箱，很厉害一级节能的冰箱，很厉害一级节能的冰箱，很厉害一级节能的冰箱，很厉害',100,100.00,'http://o7zgluxwg.bkt.clouddn.com/584f340345843','{\"584f34037e48c\":\"http:\\/\\/o7zgluxwg.bkt.clouddn.com\\/584f34037e48c\"}','1','1','1',90.00,'1',0,0),(26,7,'测试商品2222222','测试商品22222',98,100.00,'http://o7zgluxwg.bkt.clouddn.com/584f36a5eca35','{\"584f3684bd2a8\":\"http:\\/\\/o7zgluxwg.bkt.clouddn.com\\/584f3684bd2a8\"}','1','1','1',90.00,'1',1481586308,1481586342),(27,7,'测试导入22222222','测试导入',99,100.00,'http://o7zgluxwg.bkt.clouddn.com/584f38e980226','{\"584f38bfc318a\":\"http:\\/\\/o7zgluxwg.bkt.clouddn.com\\/584f38bfc318a\"}','1','0','1',92.00,'1',1481586879,1481586921);
/*!40000 ALTER TABLE `shop_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_profile`
--

DROP TABLE IF EXISTS `shop_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_profile` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `truename` varchar(32) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `age` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '年龄',
  `sex` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '2016-01-01' COMMENT '生日',
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '昵称',
  `company` varchar(100) NOT NULL DEFAULT '' COMMENT '公司',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户的ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_profile_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_profile`
--

LOCK TABLES `shop_profile` WRITE;
/*!40000 ALTER TABLE `shop_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_user`
--

DROP TABLE IF EXISTS `shop_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_user` (
  `userid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(32) NOT NULL DEFAULT '',
  `userpass` char(64) NOT NULL DEFAULT '',
  `useremail` varchar(100) NOT NULL DEFAULT '',
  `openid` char(32) NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `shop_user_username_userpass` (`username`,`userpass`),
  UNIQUE KEY `shop_user_useremail_userpass` (`useremail`,`userpass`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_user`
--

LOCK TABLES `shop_user` WRITE;
/*!40000 ALTER TABLE `shop_user` DISABLE KEYS */;
INSERT INTO `shop_user` VALUES (8,'imooc_584ff2d3690df','$2y$13$IIHLV1c6b5L2TVdmqmVkVux5zfHRAlekvoc90EYvQbGkaj2RSUD1y','86267659@qq.com','0',1481634515),(9,'imooc_584ff2e9cf596','$2y$13$fOfENY.LLav0Lyv0x99JveKkun8QuUjmLPobtpepIGC.xpPsxvWs.','86267659222222@qq.com','0',1481634537),(10,'imooc_585009f93169f','$2y$13$MbfHFopQnzfkcciH49ax/OSbifK1W5lXBOre7dFF1ovd3astSyuVq','zhangsan@163.com','0',1481640441),(11,'imooc_5850119de9ecd','$2y$13$szqUH0mYsgsWOPjBp5yFUesmyzKf.grbsbwyGaObOEjx5ozdEr0Km','zhangsan123@imooc.com','0',1481642398),(12,'zhangsan','$2y$13$Pk5nMHtAmzMxYVnyGb7ywO8RKAc70C3DpYU.1NRUSeXbBJe5IysHW','zhangsan@zhangsan.com','0',1481652118);
/*!40000 ALTER TABLE `shop_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-14  0:07:20
