-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: cwgl
-- ------------------------------------------------------
-- Server version	5.5.5-10.9.2-MariaDB-1:10.9.2+maria~ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `money` float(10,2) DEFAULT NULL COMMENT '金额',
  `typeid` int(1) NOT NULL COMMENT '类型 1 收入 2 支出',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `paywayid` int(11) DEFAULT NULL COMMENT '支付方式',
  `time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '交易时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid` (`userid`) USING BTREE,
  KEY `type` (`typeid`) USING BTREE,
  KEY `payway` (`paywayid`) USING BTREE,
  CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`typeid`) REFERENCES `type` (`id`),
  CONSTRAINT `bill_ibfk_3` FOREIGN KEY (`paywayid`) REFERENCES `payway` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (195,'上班',3,200.00,2,'当保安赚200',4,'2022-08-04 16:09:17'),(196,'去潇洒',3,100.00,1,'呜呜呜钱没了',1,'2022-08-04 16:09:50'),(197,'工资',3,6000.00,2,'2022年8月份工资',2,'2022-08-04 16:10:18'),(198,'外快',3,3000.00,2,'2022年8月份外快',1,'2022-08-04 16:10:42'),(199,'买衣服',3,100.00,1,'买衣服支出',1,'2022-08-04 16:11:13'),(200,'买裤子支出',3,100.00,1,'买裤子支出',1,'2022-08-04 16:11:22'),(201,'彩礼',3,99999.00,1,'彩礼',4,'2022-08-04 16:11:48'),(202,'工资',3,999999.00,2,'2022年全年工资',3,'2022-08-04 16:13:49'),(203,'打工',1,600.00,2,'卖瓶子',1,'2022-08-04 18:01:20'),(204,'打工',1,8888.00,2,'打工',3,'2022-08-04 20:09:00'),(205,'工资',1,9999.00,2,'2022年8月份工资',2,'2022-08-04 20:09:13');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
