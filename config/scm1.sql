/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.40 : Database - scm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`scm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `scm`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `acc_id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_login` varchar(20) DEFAULT NULL,
  `acc_name` varchar(20) DEFAULT NULL,
  `acc_pass` varchar(80) DEFAULT NULL,
  `acc_type` varchar(25) DEFAULT NULL,
  `acc_email` varchar(25) DEFAULT NULL,
  `acc_validatacode` varchar(255) DEFAULT NULL,
  `acc_registerdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`acc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `account` */

insert  into `account`(`acc_id`,`acc_login`,`acc_name`,`acc_pass`,`acc_type`,`acc_email`,`acc_validatacode`,`acc_registerdate`) values (3,'admin','那个抽烟的大爷','admin','管理员','1352490133@qq.com','d46a98dc-d3b8-4930-9761-ff1b3fe2a2e9','2017-04-28 15:15:45'),(20,'小米粥','user002','admin','操作员','1083339085@qq.com',NULL,NULL),(21,'admin2','那个抽烟的美女','2017hf1995125','普通用户','1352490133@qq.com',NULL,NULL),(24,'admin3','adfad','123456,123456','操作员','1083339085@qq.com',NULL,NULL),(25,'admin4','小米粥','admin2','操作员','1352490133@qq.com',NULL,NULL);

/*Table structure for table `account_records` */

DROP TABLE IF EXISTS `account_records`;

CREATE TABLE `account_records` (
  `ar_id` varchar(36) NOT NULL,
  `sup_id` int(11) DEFAULT NULL,
  `ar_date` varchar(255) DEFAULT NULL,
  `ar_order_id` varchar(36) DEFAULT NULL,
  `ar_bus_type` varchar(10) DEFAULT NULL,
  `ar_payable` decimal(12,2) DEFAULT NULL,
  `ar_paid` decimal(12,2) DEFAULT NULL,
  `ar_arrears` decimal(12,2) DEFAULT NULL,
  `ar_discount` decimal(12,2) DEFAULT NULL,
  `ar_attn` varchar(20) DEFAULT NULL,
  `ar_operator` varchar(25) DEFAULT NULL,
  `ar_remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `account_records` */

insert  into `account_records`(`ar_id`,`sup_id`,`ar_date`,`ar_order_id`,`ar_bus_type`,`ar_payable`,`ar_paid`,`ar_arrears`,`ar_discount`,`ar_attn`,`ar_operator`,`ar_remark`) values ('ar0631e4e6b89e4261b69fdc5f8f43c055',11,'2017-04-27 13:33:05','bof5ead7efc80e41349eacb2fa6dd66b40','Bo','700000.00','7000000.00','0.00','0.00','341325','小刘','发达省份嘎'),('ar17dc1476fe3541af92b944f3f2d8e92e',1,'2017-04-24 09:18:39','boe8eb58db62794e8fbf170a2037a1dd83','Bo','126000.00','13000.00','120.00','112880.00','343125435','小王','的撒发多少'),('ar2025f2da7d8640999b614422c78ed2c1',12,'2017-04-25 11:41:59','boa9ec4fc61f424d3a9f6b0822df4c45ca','Bo','750000.00','7500000.00','0.00','0.00','34344312','小计','的发声方法大师傅'),('ar2691f3f780ef4086a26d6813cdd6e265',5,'2017-04-28 11:03:16','bo0c0ac0a164b14e0a9c190bd6d2e38de1','Bo','900000.00','1000000.00','1000.00','-101000.00','432143','小娃','反对司法'),('ar2ce6352a583f455ea677c2340f46df6d',2,'2017-04-18 09:18:37','bo0f9e8f3b929448e79946dc56683d05f9','Bo','343243.00','312435.00','120.00','30688.00','343125435','小王','法大师傅'),('ar42f9c47390f0448985f6fb1bb8c119a7',7,'2017-04-18 10:03:12','bo646961935aab47c09454c14ab0cf4d97','Bo','21000.00','22000.00','100.00','-1100.00','341234','小明','打发手动阀'),('ar4fe5c62ca3824c569d7871b60b0629f6',8,'2017-04-18 10:06:54','bo796db18030db41f6901b96b02c94afcd','Bo','5000.00','6000.00','100.00','-1100.00','341234341331234','小明','打发十分大师傅'),('ar631ed405d3474f3faf7ba67fb9d314b7',7,'2017-04-18 10:06:54','bo637061595fe24faab26412068a1c680e','Bo','570000.00','600000.00','100.00','-30100.00','3412343413','小周','大发大水发大水'),('ar7d23faac37b14699afe74bf4de02867c',2,'2017-04-19 09:21:08','ro4c0254622bf14f58833fdeb328826991','Ro','225000.00','300000.00','300.00','-75300.00','343214','小王','的撒发射点发'),('ar894aa34245b347b08758b331642b646b',9,'2017-04-28 09:48:48','bof6f6da455a1f4a078ab2e3f077f4eeca','Bo','550000.00','600000.00','1000.00','-51000.00','3432545','小王','大水法大水法'),('ara4dc7f2996a249b78318af73ab1f63dd',10,'2017-04-28 11:31:40','bof1d8371668b643c7bbde13e5a8f2a871','Bo','869700.00','86970000.00','0.00','0.00','3432545','小李','的发生广大'),('arbffd177d0e1c4cbf9ed6240eb2024143',6,'2017-04-28 10:13:37','bo23f61fe5a137405ab6e9083a5722deb8','Bo','165000.00','165000.00','0.00','0.00','342314325','小屋','发射点法大师傅'),('arc4dcf5fea2b142aa83edae0c0620ce01',3,'2017-04-28 11:03:16','bo6f57be5c5e6a48c497ead768ab563cde','Bo','45000.00','50000.00','1000.00','-6000.00','432143','小娃','豆腐干反对和');

/*Table structure for table `buy_order` */

DROP TABLE IF EXISTS `buy_order`;

CREATE TABLE `buy_order` (
  `bo_id` varchar(36) NOT NULL,
  `sup_id` int(11) DEFAULT NULL,
  `sh_id` varchar(10) DEFAULT NULL,
  `bo_date` varchar(255) DEFAULT NULL,
  `bo_payable` decimal(12,2) DEFAULT NULL,
  `bo_paid` decimal(12,2) DEFAULT NULL,
  `bo_arrears` decimal(12,2) DEFAULT NULL,
  `bo_original` varchar(20) DEFAULT NULL,
  `bo_remark` varchar(100) DEFAULT NULL,
  `bo_attn` varchar(20) DEFAULT NULL,
  `bo_operator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `buy_order` */

insert  into `buy_order`(`bo_id`,`sup_id`,`sh_id`,`bo_date`,`bo_payable`,`bo_paid`,`bo_arrears`,`bo_original`,`bo_remark`,`bo_attn`,`bo_operator`) values ('bo0c0ac0a164b14e0a9c190bd6d2e38de1',5,'2','2017-04-28 11:03:16','900000.00','1000000.00','1000.00','范德萨','反对司法','432143','小娃'),('bo0f9e8f3b929448e79946dc56683d05f9',2,'3','2017-04-18 09:18:37','343243.00','312435.00','120.00','小虎','法大师傅','343125435','小王'),('bo23f61fe5a137405ab6e9083a5722deb8',6,'3','2017-04-28 10:13:37','16500000.00','165000.00','0.00','小汪','发射点法大师傅','342314325','小屋'),('bo637061595fe24faab26412068a1c680e',7,'2','2017-04-18 10:06:54','570000.00','600000.00','100.00','小王','大发大水发大水','3412343413','小周'),('bo646961935aab47c09454c14ab0cf4d97',7,'1','2017-04-18 10:03:12','21000.00','22000.00','100.00','小胡','打发手动阀','341234','小明'),('bo6f57be5c5e6a48c497ead768ab563cde',3,'2','2017-04-28 11:03:16','45000.00','50000.00','1000.00','小董','豆腐干反对和','432143','小娃'),('bo796db18030db41f6901b96b02c94afcd',8,'2','2017-04-18 10:06:54','5000.00','6000.00','100.00','小汪','打发十分大师傅','341234341331234','小明'),('boa9ec4fc61f424d3a9f6b0822df4c45ca',12,'1','2017-04-25 11:41:59','7500000.00','7500000.00','0.00','小黄','的发声方法大师傅','34344312','小计'),('boe8eb58db62794e8fbf170a2037a1dd83',1,'3','2017-04-24 09:18:39','126000.00','13000.00','120.00','小虎','的撒发多少','343125435','小王'),('bof1d8371668b643c7bbde13e5a8f2a871',10,'2','2017-04-28 11:31:40','86970000.00','86970000.00','0.00','小董','的发生广大','3432545','小李'),('bof5ead7efc80e41349eacb2fa6dd66b40',11,'4','2017-04-27 13:33:05','7000000.00','7000000.00','0.00','小虎','发达省份嘎','341325','小刘'),('bof6f6da455a1f4a078ab2e3f077f4eeca',9,'2','2017-04-28 09:48:48','550000.00','600000.00','1000.00','小虎','大水法大水法','3432545','小王');

/*Table structure for table `buy_order_detail` */

DROP TABLE IF EXISTS `buy_order_detail`;

CREATE TABLE `buy_order_detail` (
  `bod_id` varchar(36) NOT NULL,
  `goods_id` varchar(36) DEFAULT NULL,
  `goods_name` varchar(20) DEFAULT NULL,
  `goods_unit` varchar(10) DEFAULT NULL,
  `goods_type` varchar(10) DEFAULT NULL,
  `goods_color` varchar(10) DEFAULT NULL,
  `bod_amount` int(11) DEFAULT NULL,
  `bod_buy_price` decimal(12,2) DEFAULT NULL,
  `bod_total_price` decimal(12,2) DEFAULT NULL,
  `bo_id` varchar(36) DEFAULT NULL,
  `bod_imei_list` text,
  PRIMARY KEY (`bod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `buy_order_detail` */

insert  into `buy_order_detail`(`bod_id`,`goods_id`,`goods_name`,`goods_unit`,`goods_type`,`goods_color`,`bod_amount`,`bod_buy_price`,`bod_total_price`,`bo_id`,`bod_imei_list`) values ('0e5e9fb0acf74dec99b1492c0ec9fe6a','4','iphone 7 plus','部','A3432','土豪金',3000,'5500.00','16500000.00','bo23f61fe5a137405ab6e9083a5722deb8','3333'),('2c143c5f40a649358d5e177c4afdb0ac','1','华为Mate 9','部','H3413','黑色',30,'4200.00','126000.00','boe8eb58db62794e8fbf170a2037a1dd83','4213523'),('2de4c8bfd9d446c6ab5d6605d404244a','2','Sumsung Note7','部','F4324','白色',100,'5500.00','550000.00','bof6f6da455a1f4a078ab2e3f077f4eeca','3333'),('501a1096687745419e784e8ce6017a2a','2','Sumsung Note7','部','F4324','白色',46,'5500.00','253000.00','bo0f9e8f3b929448e79946dc56683d05f9','314321'),('7d9116bf37ec4cbe976a565f2f4da219','3','小米5 plus','部','D43412','金色',2000,'45000.00','90000000.00','bo0c0ac0a164b14e0a9c190bd6d2e38de1','3333'),('a2874a75671c49d2858f3624fce23101','6','魅族6 pro','部','H9878','黑色',150,'3800.00','570000.00','bo796db18030db41f6901b96b02c94afcd','34123'),('a7c51c33149647c0bba6b5e7bfc65dc4','9','VIVO X9 Plus','部','V9894','白色',2000,'3500.00','7000000.00','bof5ead7efc80e41349eacb2fa6dd66b40','3333'),('af63651adf254509b90b6269df7e1a07','8','OPOP R9s','部','54325','白色',30000,'2899.00','86970000.00','bof1d8371668b643c7bbde13e5a8f2a871','3333'),('bd3d54cf2ba34c848a724a5fceaa85eb','3','小米5 plus','部','D43412','金色',6,'3500.00','21000.00','bo646961935aab47c09454c14ab0cf4d97','32143'),('c64f8a5935424397bc00176a7ed6c2a4','6','魅族6 pro','部','H9878','黑色',150,'3800.00','570000.00','bo637061595fe24faab26412068a1c680e','34123'),('c98c7096691a4f2f98495845d54c0bc6','1','华为Mate 9','部','H3413','黑色',30,'4200.00','126000.00','bo0f9e8f3b929448e79946dc56683d05f9','4213523'),('e5cad4098d4e428faf03cee00586e365','1','华为Mate 9','部','H3413','黑色',1000,'45000.00','45000000.00','bo6f57be5c5e6a48c497ead768ab563cde','3333'),('f179a1a6de1446e69d4e24fdea78507f','7','一加3T','部','T34543','黑色',3000,'2500.00','7500000.00','boa9ec4fc61f424d3a9f6b0822df4c45ca','3333');

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `goods_Id` varchar(36) NOT NULL,
  `goods_name` varchar(20) DEFAULT NULL,
  `goods_unit` varchar(10) DEFAULT NULL,
  `goods_type` varchar(10) DEFAULT NULL,
  `goods_color` varchar(10) DEFAULT NULL,
  `goods_store` int(11) DEFAULT NULL,
  `goods_limit` int(11) DEFAULT NULL,
  `goods_commission` decimal(2,2) DEFAULT NULL,
  `goods_producer` varchar(50) DEFAULT NULL,
  `goods_remark` varchar(100) DEFAULT NULL,
  `goods_sel_price` decimal(12,2) DEFAULT NULL,
  `goods_buy_price` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`goods_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`goods_Id`,`goods_name`,`goods_unit`,`goods_type`,`goods_color`,`goods_store`,`goods_limit`,`goods_commission`,`goods_producer`,`goods_remark`,`goods_sel_price`,`goods_buy_price`) values ('1','华为Mate 9','部','H3413','黑色',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('10','华为P10','部','P45245','黑色',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('11','小米6','部','M54235','金色',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2','Sumsung Note7','部','F4324','白色',NULL,NULL,NULL,NULL,'red note5','3500.00','3000.00'),('234','金立M2017','部','M4524','黑色',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('3','小米5 plus','部','D43412','金色',NULL,NULL,NULL,NULL,'blue note5','4500.00','4000.00'),('4','iphone 7 plus','部','A3432','土豪金',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('5','Sumsung S8','部','I9508','紫色',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('6','魅族6 pro','部','H9878','黑色',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('7','一加3T','部','T34543','黑色',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('8','OPOP R9s','部','54325','白色',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('9','VIVO X9 Plus','部','V9894','白色',NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `return_order` */

DROP TABLE IF EXISTS `return_order`;

CREATE TABLE `return_order` (
  `ro_original` varchar(20) DEFAULT NULL,
  `ro_id` varchar(36) NOT NULL,
  `sup_id` int(11) DEFAULT NULL,
  `sh_id` varchar(10) DEFAULT NULL,
  `ro_date` varchar(255) DEFAULT NULL,
  `ro_payable` decimal(12,2) DEFAULT NULL,
  `ro_paid` decimal(12,2) DEFAULT NULL,
  `ro_remark` varchar(100) DEFAULT NULL,
  `ro_attn` varchar(20) DEFAULT NULL,
  `ro_operator` varchar(25) DEFAULT NULL,
  `ro_arrears` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`ro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `return_order` */

insert  into `return_order`(`ro_original`,`ro_id`,`sup_id`,`sh_id`,`ro_date`,`ro_payable`,`ro_paid`,`ro_remark`,`ro_attn`,`ro_operator`,`ro_arrears`) values ('小虎','ro4c0254622bf14f58833fdeb328826991',2,'2','2017-04-19 09:21:08','225000.00','300000.00','的撒发射点发','343214','小王','300.00');

/*Table structure for table `return_order_detail` */

DROP TABLE IF EXISTS `return_order_detail`;

CREATE TABLE `return_order_detail` (
  `rod_id` varchar(36) NOT NULL,
  `goods_id` varchar(36) DEFAULT NULL,
  `goods_unit` varchar(10) DEFAULT NULL,
  `goods_name` varchar(20) DEFAULT NULL,
  `goods_type` varchar(10) DEFAULT NULL,
  `goods_color` varchar(10) DEFAULT NULL,
  `rod_amount` int(11) DEFAULT NULL,
  `rod_return_price` decimal(12,2) DEFAULT NULL,
  `rod_total_price` decimal(12,2) DEFAULT NULL,
  `rod_imei_list` text,
  `ro_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`rod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `return_order_detail` */

insert  into `return_order_detail`(`rod_id`,`goods_id`,`goods_unit`,`goods_name`,`goods_type`,`goods_color`,`rod_amount`,`rod_return_price`,`rod_total_price`,`rod_imei_list`,`ro_id`) values ('12ad13890bff4433b4214dc866e921b5','2','部','Sumsung Note7','F4324','白色',45,'5000.00','225000.00','431241325','ro4c0254622bf14f58833fdeb328826991');

/*Table structure for table `store_house` */

DROP TABLE IF EXISTS `store_house`;

CREATE TABLE `store_house` (
  `sh_id` varchar(10) NOT NULL,
  `sh_name` varchar(20) DEFAULT NULL,
  `sh_responsible` varchar(20) DEFAULT NULL,
  `sh_phone` varchar(11) DEFAULT NULL,
  `sh_address` varchar(50) DEFAULT NULL,
  `sh_type` varchar(10) DEFAULT NULL,
  `sh_remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `store_house` */

insert  into `store_house`(`sh_id`,`sh_name`,`sh_responsible`,`sh_phone`,`sh_address`,`sh_type`,`sh_remark`) values ('1','北京主仓库',NULL,NULL,'北京',NULL,NULL),('2','深圳分仓库',NULL,NULL,'广州',NULL,NULL),('3','郑州分仓库',NULL,NULL,'河北',NULL,NULL),('4','合肥分仓库',NULL,NULL,'安徽',NULL,NULL);

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `sup_id` int(11) NOT NULL,
  `sup_name` varchar(20) DEFAULT NULL,
  `sup_linkman` varchar(20) DEFAULT NULL,
  `sup_phone` varchar(11) DEFAULT NULL,
  `sup_address` varchar(100) DEFAULT NULL,
  `sup_remark` varchar(100) DEFAULT NULL,
  `sup_pay` decimal(12,2) DEFAULT NULL,
  `sup_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`sup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `supplier` */

insert  into `supplier`(`sup_id`,`sup_name`,`sup_linkman`,`sup_phone`,`sup_address`,`sup_remark`,`sup_pay`,`sup_type`) values (1,'索尼供应商','小汪','15554235432','河北武汉','发士大夫','43214.00','1'),(2,'三星供应商','小王','12388888888','广州增城','普通供应商','50000.00','1'),(3,'华为供应商','小王','12388888889','广东深圳','一级供应商','0.00','2'),(4,'TCL供应商','小王','12388888666','广州增城','普通供应商','0.00','1'),(5,'Nokia供应商','小王','12388888777','广东深圳','一级供应商','0.00','2'),(6,'苹果供应商','小周','2321432','广州东莞','阿斯蒂芬','234213.00','1'),(7,'小米供应商','小虎','1552324324','安徽合肥','飞洒地方','30000.00','2'),(8,'魅族供应商','小汪','18345646326','中国北京','的萨芬大师傅','50000.00','1'),(9,'华硕供应商','小周','1834565436','中国上海','发达省份申达股份vs大概','40000.00','1'),(10,'OPPO供应商','晓东','1465765734','中国北京','法发给对方很','5000.00','2'),(11,'VIVO供应商','小胡','18934543546','中国上海','的广泛大使馆是','10000.00','1'),(12,'一加供应商','小州','2543634','中国香港','大使馆的哈是否','20000.00','1');

/*Table structure for table `sys_param` */

DROP TABLE IF EXISTS `sys_param`;

CREATE TABLE `sys_param` (
  `sys_param_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sys_param_field` varchar(50) DEFAULT NULL,
  `sys_param_value` varchar(500) DEFAULT NULL,
  `sys_param_text` varchar(50) DEFAULT NULL,
  `sys_param_type` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`sys_param_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `sys_param` */

insert  into `sys_param`(`sys_param_id`,`sys_param_field`,`sys_param_value`,`sys_param_text`,`sys_param_type`) values (1,'shId','select s.sh_id as sys_param_value,s.sh_name as sys_param_text from store_house s',NULL,'1'),(2,'supType','1','一级供应商',NULL),(3,'supType','2','二级供应商',NULL),(4,'supType','3','普通供应商',NULL),(5,'goodsColor','1','红色',NULL),(6,'goodsColor','2','绿色',NULL),(7,'goodsColor','3','蓝色',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
