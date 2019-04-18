/*
SQLyog Professional v12.08 (64 bit)
MySQL - 8.0.15 : Database - managsystem
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`managsystem` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `managsystem`;

/*Table structure for table `business_adminstoretype` */

DROP TABLE IF EXISTS `business_adminstoretype`;

CREATE TABLE `business_adminstoretype` (
  `storeType_id` varchar(255) NOT NULL,
  `storeType_name` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`storeType_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `business_adminstoretype` */

insert  into `business_adminstoretype`(`storeType_id`,`storeType_name`) values ('402880fe67c583410167c58c09830000','早餐'),('402880fe67c583410167c58c1fd60001','中餐'),('402880fe67c583410167c58cb91e0002','快餐');

/*Table structure for table `business_comment` */

DROP TABLE IF EXISTS `business_comment`;

CREATE TABLE `business_comment` (
  `comment_id` varchar(255) NOT NULL,
  `comment_main` varchar(225) DEFAULT NULL,
  `food_id` varchar(125) DEFAULT NULL,
  `order_id` varchar(125) DEFAULT NULL,
  `user_id` varchar(125) DEFAULT NULL,
  `comment_data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `business_comment` */

/*Table structure for table `business_foodmenu` */

DROP TABLE IF EXISTS `business_foodmenu`;

CREATE TABLE `business_foodmenu` (
  `food_menu_id` varchar(255) NOT NULL,
  `food_image_path` varchar(125) DEFAULT NULL,
  `food_menu_foodname` varchar(125) DEFAULT NULL,
  `food_menu_foodpic` varchar(125) DEFAULT NULL,
  `food_menu_foodprice` int(11) DEFAULT NULL,
  `food_menu_foodtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` varchar(125) DEFAULT NULL,
  `type_id` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`food_menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `business_foodmenu` */

insert  into `business_foodmenu`(`food_menu_id`,`food_image_path`,`food_menu_foodname`,`food_menu_foodpic`,`food_menu_foodprice`,`food_menu_foodtime`,`tenant_id`,`type_id`) values ('4028b481699477aa0169947ce5d60002','uploadImages/2019-03-19/f077cafb06d449a1b831b4c1267f77fa','垃圾食物','http://127.0.0.1:8080/uploadImages/2019-03-19/f077cafb06d449a1b831b4c1267f77fa.jpeg',11000,'2019-03-24 16:00:00','e0582f891ea742eb9fa7ac18b473def2','4028b481699477aa01699479260a0000'),('4028b48169a456860169a459b1f30000','uploadImages/2019-03-22/592e8cf57872458cab5a764a1f2da8d7','威龙','http://127.0.0.1:8080/uploadImages/2019-03-22/592e8cf57872458cab5a764a1f2da8d7.jpeg',1100,'2019-03-20 16:00:00','e0582f891ea742eb9fa7ac18b473def2','4028b481699477aa01699479260a0000'),('4028b48169a456860169a45a3af30001','uploadImages/2019-03-22/c15c90c9302743dcaf887e46669de2d9','小虾肉','http://127.0.0.1:8080/uploadImages/2019-03-22/c15c90c9302743dcaf887e46669de2d9.jpeg',1200,'2019-03-20 16:00:00','e0582f891ea742eb9fa7ac18b473def2','4028b481699477aa01699479260a0000'),('ff80808167c972c60167c9753a7a0003','uploadImages/2018-12-20/511c82dd90d04b5199be756686564d86','可乐','http://127.0.0.1/uploadImages/2018-12-20/511c82dd90d04b5199be756686564d86.jpeg',600,'2018-12-19 00:00:00','1c19c5189c6b414a817e79c51376a490','ff80808167c972c60167c974dcee0001'),('ff80808167c972c60167c975a66e0004','uploadImages/2018-12-20/e94471beab984036a55f478e264bf657','包子','http://127.0.0.1/uploadImages/2018-12-20/e94471beab984036a55f478e264bf657.jpeg',100,'2018-12-12 00:00:00','1c19c5189c6b414a817e79c51376a490','ff80808167c972c60167c974c3f60000'),('ff80808167c972c60167c975e7f70005','uploadImages/2018-12-20/142e92c73b7445b8b02d4ee1b56561c7','油条','http://127.0.0.1/uploadImages/2018-12-20/142e92c73b7445b8b02d4ee1b56561c7.jpeg',200,'2018-12-19 00:00:00','1c19c5189c6b414a817e79c51376a490','ff80808167c972c60167c974f49b0002'),('ff80808167c972c60167c97777cf0008','uploadImages/2018-12-20/2a833358b9b34ca9bb781a345d60d7d3','红烧肉','http://127.0.0.1/uploadImages/2018-12-20/2a833358b9b34ca9bb781a345d60d7d3.jpeg',1300,'2018-12-19 00:00:00','4ec5853194ae4920a0e3fba1cded5eb9','ff80808167c972c60167c976f1550006'),('ff80808167c972c60167c977d1400009','uploadImages/2018-12-20/5c0b384ae71343928a9a331668d834d9','干煸肥肠','http://127.0.0.1/uploadImages/2018-12-20/5c0b384ae71343928a9a331668d834d9.jpeg',1800,'2018-12-20 00:00:00','4ec5853194ae4920a0e3fba1cded5eb9','ff80808167c972c60167c97713950007'),('ff80808167c9cee80167c9d03ce10000','uploadImages/2018-12-20/22f745ff28394265819f34c05a980dea','豆浆','http://127.0.0.1/uploadImages/2018-12-20/22f745ff28394265819f34c05a980dea.jpeg',200,'2018-12-19 00:00:00','1c19c5189c6b414a817e79c51376a490','ff80808167c972c60167c974dcee0001'),('ff80808167c9cee80167c9d096570001','uploadImages/2018-12-20/ea34315e6f6e4a86a15213f1973c0e3c','馒头','http://127.0.0.1/uploadImages/2018-12-20/ea34315e6f6e4a86a15213f1973c0e3c.jpeg',100,'2018-12-20 00:00:00','1c19c5189c6b414a817e79c51376a490','ff80808167c972c60167c974c3f60000'),('ff80808167c9cee80167c9d1a85e0002','uploadImages/2018-12-20/e01890fc12a942d68bf731649c2c7119','麻婆豆腐','http://127.0.0.1/uploadImages/2018-12-20/e01890fc12a942d68bf731649c2c7119.jpeg',800,'2018-12-20 00:00:00','4ec5853194ae4920a0e3fba1cded5eb9','ff80808167c972c60167c976f1550006'),('ff80808167c9cee80167c9d1feaa0003','uploadImages/2018-12-20/c783216243a84087a5b8747e013f9329','回锅肉','http://127.0.0.1/uploadImages/2018-12-20/c783216243a84087a5b8747e013f9329.jpeg',1100,'2018-12-20 00:00:00','4ec5853194ae4920a0e3fba1cded5eb9','ff80808167c972c60167c976f1550006'),('ff80808167c9cee80167c9d26f3f0004','uploadImages/2018-12-20/44d63ff87e9c418e85a3c1c9c6edcb74','粉蒸肉','http://127.0.0.1/uploadImages/2018-12-20/44d63ff87e9c418e85a3c1c9c6edcb74.jpeg',1800,'2018-12-20 00:00:00','4ec5853194ae4920a0e3fba1cded5eb9','ff80808167c972c60167c97713950007'),('ff80808167c9d7150167c9d7e7320000','uploadImages/2018-12-20/af238badcd4f49fea0813535d099823d','黄瓜炒鸡蛋','http://127.0.0.1/uploadImages/2018-12-20/af238badcd4f49fea0813535d099823d.jpeg',800,'2018-12-20 00:00:00','4ec5853194ae4920a0e3fba1cded5eb9','ff80808167c972c60167c976f1550006'),('ff80808167c9d7150167c9d83eab0001','uploadImages/2018-12-20/6600f1c5e91b4792896d5e37254d03f9','家常豆腐','http://127.0.0.1/uploadImages/2018-12-20/6600f1c5e91b4792896d5e37254d03f9.jpeg',800,'2018-12-19 00:00:00','4ec5853194ae4920a0e3fba1cded5eb9','ff80808167c972c60167c976f1550006'),('ff80808167c9d7150167c9d886330002','uploadImages/2018-12-20/7c58c9f274594e83bcf16ab7fa4a13c0','蒜薹肉丝','http://127.0.0.1/uploadImages/2018-12-20/7c58c9f274594e83bcf16ab7fa4a13c0.jpeg',1200,'2018-12-20 00:00:00','4ec5853194ae4920a0e3fba1cded5eb9','ff80808167c972c60167c976f1550006'),('ff80808167c9d7150167c9d8df3d0003','uploadImages/2018-12-20/530d182a4ec14def80fa37fab23768cd','金针菇肉丝','http://127.0.0.1/uploadImages/2018-12-20/530d182a4ec14def80fa37fab23768cd.jpeg',1200,'2018-12-20 00:00:00','4ec5853194ae4920a0e3fba1cded5eb9','ff80808167c972c60167c976f1550006'),('ff80808167c9d7150167c9d9313d0004','uploadImages/2018-12-20/21e0670380bf4db48c5547b1046ed5dd','黄焖鸡翅','http://127.0.0.1/uploadImages/2018-12-20/21e0670380bf4db48c5547b1046ed5dd.jpeg',1800,'2018-12-20 00:00:00','4ec5853194ae4920a0e3fba1cded5eb9','ff80808167c972c60167c97713950007'),('ff80808167c9e2e10167c9e3d3720000','uploadImages/2018-12-20/db1636988ac948aba1a492b3dfeb2992','蒸羊肉','http://127.0.0.1/uploadImages/2018-12-20/db1636988ac948aba1a492b3dfeb2992.jpeg',2200,'2018-12-20 00:00:00','4ec5853194ae4920a0e3fba1cded5eb9','ff80808167c972c60167c97713950007');

/*Table structure for table `business_order` */

DROP TABLE IF EXISTS `business_order`;

CREATE TABLE `business_order` (
  `order_id` varchar(255) NOT NULL,
  `menu_id` varchar(125) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `remarks` varchar(125) DEFAULT NULL,
  `seat` varchar(125) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `store_id` varchar(125) DEFAULT NULL,
  `user_id` varchar(125) DEFAULT NULL,
  `cTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `food_id` varchar(125) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `business_order` */

insert  into `business_order`(`order_id`,`menu_id`,`money`,`remarks`,`seat`,`status`,`store_id`,`user_id`,`cTime`,`food_id`,`count`) values ('4028b48169a462600169a464c4f60001',NULL,11000,'老子能吃辣','117',1,'e0582f891ea742eb9fa7ac18b473def2','4028b48169a462600169a46370570000','2019-03-20 07:54:21','4028b481699477aa0169947ce5d60002',1),('4028b48169aa065c0169aa1104cf0000',NULL,11000,'111','垃圾食品来一份',1,'e0582f891ea742eb9fa7ac18b473def2','4028b48169a456860169a45c21b20002','2019-03-19 10:20:36','4028b481699477aa0169947ce5d60002',1),('4028b48169aa065c0169aa1104e40001',NULL,1100,'111','垃圾食品来一份',1,'e0582f891ea742eb9fa7ac18b473def2','4028b48169a456860169a45c21b20002','2019-03-21 10:20:36','4028b48169a456860169a459b1f30000',1),('4028b48169aa065c0169aa1104f10002',NULL,1200,'111','垃圾食品来一份',1,'e0582f891ea742eb9fa7ac18b473def2','4028b48169a456860169a45c21b20002','2019-03-22 10:20:36','4028b48169a456860169a45a3af30001',1),('ff80808167c97ced0167c97e41060001',NULL,600,'快点','1',1,'1c19c5189c6b414a817e79c51376a490','ff80808167c972c60167c978b7eb000a','2018-12-23 10:42:33','ff80808167c972c60167c9753a7a0003',1),('ff80808167c97ced0167c97e42200002',NULL,200,'快点','1',1,'1c19c5189c6b414a817e79c51376a490','ff80808167c972c60167c978b7eb000a','2018-12-20 10:42:34','ff80808167c972c60167c975e7f70005',1),('ff80808167ca016e0167ca11af3d0000',NULL,1800,'K方法','14',1,'4ec5853194ae4920a0e3fba1cded5eb9','ff80808167c972c60167c978b7eb000a','2018-12-20 13:23:35','ff80808167c972c60167c977d1400009',1),('ff80808167ca016e0167ca11b0020001',NULL,1800,'K方法','14',1,'4ec5853194ae4920a0e3fba1cded5eb9','ff80808167c972c60167c978b7eb000a','2018-12-20 13:23:36','ff80808167c9cee80167c9d26f3f0004',1);

/*Table structure for table `business_recharge` */

DROP TABLE IF EXISTS `business_recharge`;

CREATE TABLE `business_recharge` (
  `recharge_id` varchar(255) NOT NULL,
  `recharge_data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `recharge_money` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`recharge_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `business_recharge` */

insert  into `business_recharge`(`recharge_id`,`recharge_data`,`recharge_money`,`user_id`) values ('ff80808167c97ced0167c97e0f550000','2018-12-20 10:42:21',580,'ff80808167c972c60167c978b7eb000a');

/*Table structure for table `business_staff` */

DROP TABLE IF EXISTS `business_staff`;

CREATE TABLE `business_staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `phone` varchar(125) DEFAULT NULL,
  `staffAddress` varchar(125) DEFAULT NULL,
  `store_name` varchar(125) DEFAULT NULL,
  `staff_position` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `business_staff` */

/*Table structure for table `business_store` */

DROP TABLE IF EXISTS `business_store`;

CREATE TABLE `business_store` (
  `store_id` varchar(255) NOT NULL,
  `createDate` date DEFAULT NULL,
  `image_path` varchar(125) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `store_image` varchar(125) DEFAULT NULL,
  `store_introduc` varchar(125) DEFAULT NULL,
  `store_name` varchar(125) DEFAULT NULL,
  `store_user_id` varchar(125) DEFAULT NULL,
  `store_user_name` varchar(125) DEFAULT NULL,
  `storeType_id` varchar(125) DEFAULT NULL,
  `storeType_name` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `business_store` */

insert  into `business_store`(`store_id`,`createDate`,`image_path`,`status`,`store_image`,`store_introduc`,`store_name`,`store_user_id`,`store_user_name`,`storeType_id`,`storeType_name`) values ('1c19c5189c6b414a817e79c51376a490','2018-12-20','uploadImages/2018-12-20/1c19c5189c6b414a817e79c51376a490',-1,'http://127.0.0.1/uploadImages/2018-12-20/1c19c5189c6b414a817e79c51376a490.jpeg',NULL,'天天早点','402880fe67c574580167c57584670000','szf','402880fe67c583410167c58c09830000','早餐'),('28eac8fa87a94f86aa3dc3f961d447fe','2019-03-15','uploadImages/2019-03-15/28eac8fa87a94f86aa3dc3f961d447fe',-1,'http://127.0.0.1:8080/uploadImages/2019-03-15/28eac8fa87a94f86aa3dc3f961d447fe.jpeg',NULL,'cvvv','402880fe67c574580167c57584670000','szf','402880fe67c583410167c58c09830000','早餐'),('449c865731e94f71abd74df3599da17a','2019-03-15','uploadImages/2019-03-15/449c865731e94f71abd74df3599da17a',-1,'http://127.0.0.1:8080/uploadImages/2019-03-15/449c865731e94f71abd74df3599da17a.jpeg',NULL,'qweqwe','402880fe67c574580167c57584670000','szf','402880fe67c583410167c58c09830000','早餐'),('4873589d4b614e72ad9a28506ae7141c','2019-03-15','uploadImages/2019-03-15/4873589d4b614e72ad9a28506ae7141c',-1,'http://127.0.0.1:8080/uploadImages/2019-03-15/4873589d4b614e72ad9a28506ae7141c.jpeg',NULL,'测试店铺','e4c05c29673bde0201673bfa558c0000','dc','402880fe67c583410167c58c09830000','早餐'),('4ec5853194ae4920a0e3fba1cded5eb9','2018-12-20','uploadImages/2018-12-20/4ec5853194ae4920a0e3fba1cded5eb9',-1,'http://127.0.0.1/uploadImages/2018-12-20/4ec5853194ae4920a0e3fba1cded5eb9.jpeg',NULL,'大江大河','e4c05c29673bde0201673bfa558c0000','dc','402880fe67c583410167c58c1fd60001','中餐'),('980cc13ced2546cc822e3b8b8827ba0a','2019-03-15','uploadImages/2019-03-15/980cc13ced2546cc822e3b8b8827ba0a',-1,'http://127.0.0.1:8080/uploadImages/2019-03-15/980cc13ced2546cc822e3b8b8827ba0a.jpeg',NULL,'测试店铺','e4c05c29673bde0201673bfa558c0000','dc','402880fe67c583410167c58c09830000','早餐'),('a9d8c190f3e140b49f77f4229fb798fe','2019-03-15','uploadImages/2019-03-15/a9d8c190f3e140b49f77f4229fb798fe',-1,'http://127.0.0.1:8080/uploadImages/2019-03-15/a9d8c190f3e140b49f77f4229fb798fe.jpeg',NULL,'sadasd','402880fe67c574580167c57584670000','szf','402880fe67c583410167c58c09830000','早餐'),('b67519ce79b94e3aa848a7d89e707689','2019-03-15','uploadImages/2019-03-15/b67519ce79b94e3aa848a7d89e707689',-1,'http://127.0.0.1:8080/uploadImages/2019-03-15/b67519ce79b94e3aa848a7d89e707689.jpeg',NULL,'沃尔沃二','e4c05c29673bde0201673bfa558c0000','dc','402880fe67c583410167c58c09830000','早餐'),('e0582f891ea742eb9fa7ac18b473def2','2019-03-15','uploadImages/2019-03-15/e0582f891ea742eb9fa7ac18b473def2',1,'http://127.0.0.1:8080/uploadImages/2019-03-15/e0582f891ea742eb9fa7ac18b473def2.jpeg','不好意思，本店铺只出售垃圾食品 不想吃的请不要吃','垃圾食品','e4c05c29673bde0201673bfa558c0000','dc','402880fe67c583410167c58c09830000','早餐');

/*Table structure for table `business_storetype` */

DROP TABLE IF EXISTS `business_storetype`;

CREATE TABLE `business_storetype` (
  `storeType_id` varchar(255) NOT NULL,
  `storeType_name` varchar(125) DEFAULT NULL,
  `tenant_id` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`storeType_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `business_storetype` */

insert  into `business_storetype`(`storeType_id`,`storeType_name`,`tenant_id`) values ('4028b481699477aa01699479260a0000','垃圾食品','e0582f891ea742eb9fa7ac18b473def2'),('4028b481699477aa01699479f0820001','测完hi','e0582f891ea742eb9fa7ac18b473def2'),('ff80808167c972c60167c974c3f60000','面点','1c19c5189c6b414a817e79c51376a490'),('ff80808167c972c60167c974dcee0001','饮料','1c19c5189c6b414a817e79c51376a490'),('ff80808167c972c60167c974f49b0002','油炸','1c19c5189c6b414a817e79c51376a490'),('ff80808167c972c60167c976f1550006','普通','4ec5853194ae4920a0e3fba1cded5eb9'),('ff80808167c972c60167c97713950007','特色','4ec5853194ae4920a0e3fba1cded5eb9');

/*Table structure for table `business_test` */

DROP TABLE IF EXISTS `business_test`;

CREATE TABLE `business_test` (
  `db_id` varchar(125) NOT NULL,
  `db_age` varchar(125) DEFAULT NULL,
  `db_name` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`db_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `business_test` */

insert  into `business_test`(`db_id`,`db_age`,`db_name`) values ('4028b481699f55e901699f5c1a7c0000','13','董'),('4028b481699f8d3601699f913cf50000','1231223','测试2');

/*Table structure for table `hibernate_sequence` */

DROP TABLE IF EXISTS `hibernate_sequence`;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hibernate_sequence` */

insert  into `hibernate_sequence`(`next_val`) values (1);

/*Table structure for table `system_manage` */

DROP TABLE IF EXISTS `system_manage`;

CREATE TABLE `system_manage` (
  `id` int(11) NOT NULL,
  `ip` varchar(125) DEFAULT NULL,
  `systemName` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `system_manage` */

insert  into `system_manage`(`id`,`ip`,`systemName`) values (1,'127.0.0.1:8080','食堂后台管理');

/*Table structure for table `system_menu` */

DROP TABLE IF EXISTS `system_menu`;

CREATE TABLE `system_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_font` varchar(125) DEFAULT NULL,
  `menu_name` varchar(125) DEFAULT NULL,
  `menu_order` varchar(125) DEFAULT NULL,
  `menu_url` varchar(125) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `FK2himn2gh6ug89ogqpxdenojyo` (`parent_id`),
  CONSTRAINT `FK2himn2gh6ug89ogqpxdenojyo` FOREIGN KEY (`parent_id`) REFERENCES `system_menu` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `system_menu` */

insert  into `system_menu`(`menu_id`,`menu_font`,`menu_name`,`menu_order`,`menu_url`,`parent_id`) values (1,'fa fa-calendar-o','系统菜单','01','',NULL),(2,NULL,'用户管理','01','/systemUser/toUserList',1),(3,NULL,'菜单管理','02','/menuAction/toMenuList',1),(4,'fa fa-archive','店铺管理','02','',NULL),(5,NULL,'店铺列表','01','/storeAction/toStoreList',4),(6,'fa fa-bank','我的店铺','03','',NULL),(7,NULL,'店铺管理','01','/storeManageAction/toStoreManage',6),(8,NULL,'菜谱列表','02','/foodMenu/tofoodMenuList',6),(9,NULL,'类型','04','/storeType/toStoreType',6),(10,NULL,'系统管理','04','/systemAction/toSystemAction',1),(11,'fa fa-futbol-o','二维码','04','',NULL),(12,NULL,'二维码展示','01','/systemAction/toQrcode',11),(13,NULL,'店铺类型','02','/storeTypeAdminAction/toStoreTypeList',4),(14,NULL,'订单列表','04','/storeAction/toOrderList',6),(15,'fa fa-diamond','食堂人员管理','5','',NULL),(17,'fa fa-clone','代码生成','6','',NULL),(18,NULL,'代码生成','1','/generateAction/toGenerateList',17),(20,NULL,'我的员工','06','/staffAction/toStaffList',6),(21,'fa fa-diamond','财务统计','7','',NULL),(22,NULL,'财务报表','01','/financeAction/toFinanceList',21),(23,NULL,'人员列表','01','/staffAction/toStaffList',15),(25,NULL,'营销金额','07','/financeAction/toFinanceList',6);

/*Table structure for table `system_user` */

DROP TABLE IF EXISTS `system_user`;

CREATE TABLE `system_user` (
  `user_id` varchar(255) NOT NULL,
  `ip` varchar(125) DEFAULT NULL,
  `last_login` varchar(125) DEFAULT NULL,
  `name` varchar(125) DEFAULT NULL,
  `password` varchar(125) DEFAULT NULL,
  `role_id` varchar(125) DEFAULT NULL,
  `tenant_id` varchar(125) DEFAULT NULL,
  `username` varchar(125) DEFAULT NULL,
  `rights` int(11) DEFAULT '0',
  `type_id` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `system_user` */

insert  into `system_user`(`user_id`,`ip`,`last_login`,`name`,`password`,`role_id`,`tenant_id`,`username`,`rights`,`type_id`) values ('402880fe67c574580167c57584670000','0:0:0:0:0:0:0:1','2019-03-23 18:17:56','佘正丰','e10adc3949ba59abbe56e057f20f883e',NULL,'a9d8c190f3e140b49f77f4229fb798fe','szf',25584,NULL),('4028abc96671444a0166714529920000','0:0:0:0:0:0:0:1','2019-03-23 18:21:14','系统管理员','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,'admin',15121470,NULL),('e4c05c29673bde0201673bfa558c0000','0:0:0:0:0:0:0:1','2019-03-23 18:21:32','dc','e10adc3949ba59abbe56e057f20f883e',NULL,'e0582f891ea742eb9fa7ac18b473def2','dc',34628592,NULL);

/*Table structure for table `wx_user` */

DROP TABLE IF EXISTS `wx_user`;

CREATE TABLE `wx_user` (
  `user_id` varchar(255) NOT NULL,
  `password` varchar(125) DEFAULT NULL,
  `phone` varchar(125) DEFAULT NULL,
  `money` int(11) DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wx_user` */

insert  into `wx_user`(`user_id`,`password`,`phone`,`money`) values ('4028b48169a456860169a45c21b20002','e10adc3949ba59abbe56e057f20f883e','17671725404',40300),('4028b48169a45e2f0169a45fc6e50000','e10adc3949ba59abbe56e057f20f883e','17671725405',53600),('4028b48169a462600169a46370570000','e10adc3949ba59abbe56e057f20f883e','17671725409',42600),('ff80808167c972c60167c978b7eb000a','e10adc3949ba59abbe56e057f20f883e','17828895385',53600);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
