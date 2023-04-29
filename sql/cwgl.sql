-- MariaDB dump 10.19  Distrib 10.9.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: cwgl
-- ------------------------------------------------------
-- Server version	10.9.2-MariaDB-1:10.9.2+maria~ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
/*!40101 SET character_set_client = utf8 */;
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

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES
(195,'上班',3,200.00,2,'当保安赚200',4,'2022-08-04 16:09:17'),
(196,'去潇洒',3,100.00,1,'呜呜呜钱没了',1,'2022-08-04 16:09:50'),
(197,'工资',3,6000.00,2,'2022年8月份工资',2,'2022-08-04 16:10:18'),
(198,'外快',3,3000.00,2,'2022年8月份外快',1,'2022-08-04 16:10:42'),
(199,'买衣服',3,100.00,1,'买衣服支出',1,'2022-08-04 16:11:13'),
(200,'买裤子支出',3,100.00,1,'买裤子支出',1,'2022-08-04 16:11:22'),
(201,'彩礼',3,99999.00,1,'彩礼',4,'2022-08-04 16:11:48'),
(202,'工资',3,999999.00,2,'2022年全年工资',3,'2022-08-04 16:13:49'),
(203,'打工',1,600.00,2,'卖瓶子',1,'2022-08-04 18:01:20'),
(204,'打工',1,8888.00,2,'打工',3,'2022-08-04 20:09:00'),
(205,'工资',1,9999.00,2,'2022年8月份工资',2,'2022-08-04 20:09:13');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house`
--

DROP TABLE IF EXISTS `house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `house` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ownerid` int(11) NOT NULL COMMENT '户主编号',
  `address` varchar(255) DEFAULT NULL COMMENT '家庭住址',
  `housename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `holderid` (`ownerid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house`
--

LOCK TABLES `house` WRITE;
/*!40000 ALTER TABLE `house` DISABLE KEYS */;
INSERT INTO `house` VALUES
(1,3,'新区','美丽快乐大家庭1号'),
(2,23,NULL,'美丽快乐大家庭2号'),
(3,20,NULL,'美丽快乐大家庭3号'),
(4,21,NULL,'美丽快乐大家庭4号'),
(5,25,NULL,'美丽快乐大家庭5号');
/*!40000 ALTER TABLE `house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match`
--

DROP TABLE IF EXISTS `match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match` (
  `id` int(11) NOT NULL,
  `matchName` varchar(100) NOT NULL,
  `joinHouseID` int(11) NOT NULL,
  `beginDate` date NOT NULL,
  `endDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match`
--

LOCK TABLES `match` WRITE;
/*!40000 ALTER TABLE `match` DISABLE KEYS */;
INSERT INTO `match` VALUES
(1,'财务大赛',1,'2023-01-01','2023-03-01');
/*!40000 ALTER TABLE `match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payway`
--

DROP TABLE IF EXISTS `payway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payway` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payway` varchar(255) DEFAULT NULL,
  `extra` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payway`
--

LOCK TABLES `payway` WRITE;
/*!40000 ALTER TABLE `payway` DISABLE KEYS */;
INSERT INTO `payway` VALUES
(1,'支付宝',NULL),
(2,'微信',NULL),
(3,'银联',NULL),
(4,'现金',NULL),
(5,'其他',NULL);
/*!40000 ALTER TABLE `payway` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilege` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `privilegeNumber` varchar(80) DEFAULT NULL COMMENT '权限编号',
  `privilegeName` varchar(80) DEFAULT NULL COMMENT '权限名称',
  `privilegeTipflag` char(4) DEFAULT NULL COMMENT '菜单级别',
  `privilegeTypeflag` char(4) DEFAULT NULL COMMENT '1启用 0禁用',
  `privilegeUrl` varchar(255) DEFAULT NULL COMMENT '权限URL',
  `icon` varchar(20) DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege`
--

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
INSERT INTO `privilege` VALUES
(62,'001','支出管理','0','1','','&#xe698;'),
(63,'001001','支出详情','1','1','pay_details','&#xe698;'),
(64,'002','收入管理','0','1',NULL,'&#xe702;'),
(65,'002001','收入详情','1','1','income_details','&#xe702;'),
(66,'003','统计报表','0','1',NULL,'&#xe757;'),
(67,'003001','统计报表','1','1','chart_line','&#xe757;'),
(68,'004','家庭成员管理','0','1',NULL,'&#xe726;'),
(69,'005','系统管理','0','1','','&#xe696;'),
(70,'005001','用户管理','1','1','sys_users','&#xe6b8;'),
(71,'005002','角色管理','1','1','sys_roles','&#xe70b;'),
(74,'004001','家庭成员信息','1','1','sys_users','&#xe726;'),
(75,'003002','创建比赛','1','1','eco_matchConfig','&#xe757;'),
(76,'003003','参加比赛','1','1','eco_match','&#xe757;'),
(77,'003004','比赛详情','1','1','eco_matchDetails','&#xe757;');
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rolename` varchar(255) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`roleid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES
(1,'系统管理员'),
(2,'家主'),
(3,'用户');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleprivilieges`
--

DROP TABLE IF EXISTS `roleprivilieges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roleprivilieges` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `roleID` int(11) DEFAULT NULL COMMENT '角色维护表主键',
  `privilegeID` int(11) DEFAULT NULL COMMENT '权限维护表主键',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `roleID` (`roleID`) USING BTREE,
  KEY `privilegeID` (`privilegeID`) USING BTREE,
  CONSTRAINT `roleprivilieges_ibfk_1` FOREIGN KEY (`roleID`) REFERENCES `role` (`roleid`),
  CONSTRAINT `roleprivilieges_ibfk_2` FOREIGN KEY (`privilegeID`) REFERENCES `privilege` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=891 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleprivilieges`
--

LOCK TABLES `roleprivilieges` WRITE;
/*!40000 ALTER TABLE `roleprivilieges` DISABLE KEYS */;
INSERT INTO `roleprivilieges` VALUES
(829,1,62),
(830,1,63),
(831,1,64),
(832,1,65),
(833,1,66),
(834,1,67),
(836,1,69),
(837,1,70),
(838,1,71),
(841,2,62),
(842,2,63),
(843,2,64),
(844,2,65),
(845,2,66),
(846,2,67),
(847,3,62),
(848,3,63),
(849,3,64),
(850,3,65),
(851,2,68),
(852,2,74),
(853,3,66),
(854,3,67),
(855,1,75),
(857,3,77),
(858,2,76),
(859,1,77),
(860,2,77);
/*!40000 ALTER TABLE `roleprivilieges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES
(1,'支出'),
(2,'收入');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) DEFAULT NULL COMMENT '账号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `realname` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `roleid` int(1) NOT NULL DEFAULT 3 COMMENT '角色编号',
  `houseid` int(11) DEFAULT NULL COMMENT '所属家庭编号',
  `photo` varchar(255) DEFAULT NULL COMMENT '用户头像',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `houseid` (`houseid`) USING BTREE,
  KEY `roleid` (`roleid`) USING BTREE,
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`houseid`) REFERENCES `house` (`id`),
  CONSTRAINT `user_ibfk_3` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(1,'admin','123456','admin',1,NULL,NULL),
(2,'A','123456','家主1号Lion',2,1,NULL),
(3,'B','123456','Tinker',3,1,NULL),
(4,'C','123456','Doom',3,1,NULL),
(5,'D','123456','家主2号CK',2,2,NULL),
(6,'E','123456','Viper',3,2,NULL),
(7,'F','123456','BB',3,2,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-29 18:28:52
