-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2022-08-04 20:12:19
-- 服务器版本： 5.7.26
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `cwgl`
--

-- --------------------------------------------------------

--
-- 表的结构 `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL COMMENT '主键',
  `title` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `money` float(10,2) DEFAULT NULL COMMENT '金额',
  `typeid` int(1) NOT NULL COMMENT '类型 1 收入 2 支出',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `paywayid` int(11) DEFAULT NULL COMMENT '支付方式',
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '交易时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `bill`
--

INSERT INTO `bill` (`id`, `title`, `userid`, `money`, `typeid`, `remark`, `paywayid`, `time`) VALUES
(195, '上班', 3, 200.00, 2, '当保安赚200', 4, '2022-08-04 16:09:17'),
(196, '去潇洒', 3, 100.00, 1, '呜呜呜钱没了', 1, '2022-08-04 16:09:50'),
(197, '工资', 3, 6000.00, 2, '2022年8月份工资', 2, '2022-08-04 16:10:18'),
(198, '外快', 3, 3000.00, 2, '2022年8月份外快', 1, '2022-08-04 16:10:42'),
(199, '买衣服', 3, 100.00, 1, '买衣服支出', 1, '2022-08-04 16:11:13'),
(200, '买裤子支出', 3, 100.00, 1, '买裤子支出', 1, '2022-08-04 16:11:22'),
(201, '彩礼', 3, 99999.00, 1, '彩礼', 4, '2022-08-04 16:11:48'),
(202, '工资', 3, 999999.00, 2, '2022年全年工资', 3, '2022-08-04 16:13:49'),
(203, '打工', 1, 600.00, 2, '卖瓶子', 1, '2022-08-04 18:01:20'),
(204, '打工', 1, 8888.00, 2, '打工', 3, '2022-08-04 20:09:00'),
(205, '工资', 1, 9999.00, 2, '2022年8月份工资', 2, '2022-08-04 20:09:13');

-- --------------------------------------------------------

--
-- 表的结构 `house`
--

CREATE TABLE `house` (
  `id` int(11) NOT NULL COMMENT '主键',
  `ownerid` int(11) NOT NULL COMMENT '户主编号',
  `address` varchar(255) DEFAULT NULL COMMENT '家庭住址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `house`
--

INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES
(1, 3, '新区'),
(3, 20, NULL),
(4, 21, NULL),
(5, 25, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `payway`
--

CREATE TABLE `payway` (
  `id` int(11) NOT NULL,
  `payway` varchar(255) DEFAULT NULL,
  `extra` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `payway`
--

INSERT INTO `payway` (`id`, `payway`, `extra`) VALUES
(1, '支付宝', NULL),
(2, '微信', NULL),
(3, '银联', NULL),
(4, '现金', NULL),
(5, '其他', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `privilege`
--

CREATE TABLE `privilege` (
  `ID` int(11) NOT NULL COMMENT '主键',
  `privilegeNumber` varchar(80) DEFAULT NULL COMMENT '权限编号',
  `privilegeName` varchar(80) DEFAULT NULL COMMENT '权限名称',
  `privilegeTipflag` char(4) DEFAULT NULL COMMENT '菜单级别',
  `privilegeTypeflag` char(4) DEFAULT NULL COMMENT '1启用 0禁用',
  `privilegeUrl` varchar(255) DEFAULT NULL COMMENT '权限URL',
  `icon` varchar(20) DEFAULT NULL COMMENT '图标'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `privilege`
--

INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES
(62, '001', '支出管理', '0', '1', '', '&#xe698;'),
(63, '001001', '支出详情', '1', '1', 'pay_details', '&#xe698;'),
(64, '002', '收入管理', '0', '1', NULL, '&#xe702;'),
(65, '002001', '收入详情', '1', '1', 'income_details', '&#xe702;'),
(66, '003', '统计报表', '0', '1', NULL, '&#xe757;'),
(67, '003001', '统计报表', '1', '1', 'chart_line', '&#xe757;'),
(68, '004', '家庭成员管理', '0', '1', NULL, '&#xe726;'),
(69, '005', '系统管理', '0', '1', '', '&#xe696;'),
(70, '005001', '用户管理', '1', '1', 'sys_users', '&#xe6b8;'),
(71, '005002', '角色管理', '1', '1', 'sys_roles', '&#xe70b;'),
(74, '004001', '家庭成员信息', '1', '1', 'sys_users', '&#xe726;');

-- --------------------------------------------------------

--
-- 表的结构 `role`
--

CREATE TABLE `role` (
  `roleid` int(11) NOT NULL COMMENT '主键',
  `rolename` varchar(255) DEFAULT NULL COMMENT '角色名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `role`
--

INSERT INTO `role` (`roleid`, `rolename`) VALUES
(1, '系统管理员'),
(2, '家主'),
(3, '用户');

-- --------------------------------------------------------

--
-- 表的结构 `roleprivilieges`
--

CREATE TABLE `roleprivilieges` (
  `ID` int(11) NOT NULL COMMENT '主键',
  `roleID` int(11) DEFAULT NULL COMMENT '角色维护表主键',
  `privilegeID` int(11) DEFAULT NULL COMMENT '权限维护表主键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `roleprivilieges`
--

INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES
(829, 1, 62),
(830, 1, 63),
(831, 1, 64),
(832, 1, 65),
(833, 1, 66),
(834, 1, 67),
(836, 1, 69),
(837, 1, 70),
(838, 1, 71),
(841, 2, 62),
(842, 2, 63),
(843, 2, 64),
(844, 2, 65),
(845, 2, 66),
(846, 2, 67),
(847, 3, 62),
(848, 3, 63),
(849, 3, 64),
(850, 3, 65),
(851, 2, 68),
(852, 2, 74),
(853, 3, 66),
(854, 3, 67);

-- --------------------------------------------------------

--
-- 表的结构 `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `type`
--

INSERT INTO `type` (`id`, `name`) VALUES
(1, '支出'),
(2, '收入');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL COMMENT '主键',
  `username` varchar(255) DEFAULT NULL COMMENT '账号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `realname` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `roleid` int(1) NOT NULL DEFAULT '3' COMMENT '角色编号',
  `houseid` int(11) DEFAULT NULL COMMENT '所属家庭编号',
  `photo` varchar(255) DEFAULT NULL COMMENT '用户头像'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `realname`, `roleid`, `houseid`, `photo`) VALUES
(1, 'admin', '123456', 'admin', 1, NULL, NULL),
(3, 'A', '123456', '家主1号', 2, 1, NULL),
(25, '赵云', '123456', '赵云', 2, 5, NULL);

--
-- 转储表的索引
--

--
-- 表的索引 `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `userid` (`userid`) USING BTREE,
  ADD KEY `type` (`typeid`) USING BTREE,
  ADD KEY `payway` (`paywayid`) USING BTREE;

--
-- 表的索引 `house`
--
ALTER TABLE `house`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `holderid` (`ownerid`) USING BTREE;

--
-- 表的索引 `payway`
--
ALTER TABLE `payway`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `privilege`
--
ALTER TABLE `privilege`
  ADD PRIMARY KEY (`ID`) USING BTREE;

--
-- 表的索引 `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`roleid`) USING BTREE;

--
-- 表的索引 `roleprivilieges`
--
ALTER TABLE `roleprivilieges`
  ADD PRIMARY KEY (`ID`) USING BTREE,
  ADD KEY `roleID` (`roleID`) USING BTREE,
  ADD KEY `privilegeID` (`privilegeID`) USING BTREE;

--
-- 表的索引 `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `houseid` (`houseid`) USING BTREE,
  ADD KEY `roleid` (`roleid`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=206;

--
-- 使用表AUTO_INCREMENT `house`
--
ALTER TABLE `house`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `payway`
--
ALTER TABLE `payway`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `privilege`
--
ALTER TABLE `privilege`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=75;

--
-- 使用表AUTO_INCREMENT `role`
--
ALTER TABLE `role`
  MODIFY `roleid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `roleprivilieges`
--
ALTER TABLE `roleprivilieges`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=867;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=26;

--
-- 限制导出的表
--

--
-- 限制表 `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`typeid`) REFERENCES `type` (`id`),
  ADD CONSTRAINT `bill_ibfk_3` FOREIGN KEY (`paywayid`) REFERENCES `payway` (`id`);

--
-- 限制表 `roleprivilieges`
--
ALTER TABLE `roleprivilieges`
  ADD CONSTRAINT `roleprivilieges_ibfk_1` FOREIGN KEY (`roleID`) REFERENCES `role` (`roleid`),
  ADD CONSTRAINT `roleprivilieges_ibfk_2` FOREIGN KEY (`privilegeID`) REFERENCES `privilege` (`ID`);

--
-- 限制表 `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`houseid`) REFERENCES `house` (`id`),
  ADD CONSTRAINT `user_ibfk_3` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
