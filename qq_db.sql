/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 60011
Source Host           : localhost:3306
Source Database       : qq_db

Target Server Type    : MYSQL
Target Server Version : 60011
File Encoding         : 65001

Date: 2017-05-21 08:25:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `daily`
-- ----------------------------
DROP TABLE IF EXISTS `daily`;
CREATE TABLE `daily` (
  `dailyId` int(11) NOT NULL AUTO_INCREMENT,
  `dailyTitle` varchar(50) NOT NULL,
  `dailyContentFile` varchar(50) NOT NULL,
  `publishDate` datetime NOT NULL,
  `QQ_No` int(11) NOT NULL,
  PRIMARY KEY (`dailyId`),
  KEY `QQ_No` (`QQ_No`),
  CONSTRAINT `daily_ibfk_1` FOREIGN KEY (`QQ_No`) REFERENCES `qquser` (`QQ_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of daily
-- ----------------------------

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `messageId` int(11) NOT NULL AUTO_INCREMENT,
  `messageContent` varchar(200) NOT NULL,
  `publishDate` datetime NOT NULL,
  `QQ_No` int(11) NOT NULL,
  `QQ_friend_No` int(11) NOT NULL,
  PRIMARY KEY (`messageId`),
  KEY `QQ_No` (`QQ_No`),
  KEY `QQ_friend_No` (`QQ_friend_No`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`QQ_No`) REFERENCES `qquser` (`QQ_No`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`QQ_friend_No`) REFERENCES `qquser` (`QQ_No`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('2', 'bbb', '2017-05-04 02:51:28', '10000', '10003');
INSERT INTO `message` VALUES ('3', 'ccc', '2017-05-03 02:51:44', '10000', '10004');
INSERT INTO `message` VALUES ('4', 'ddd', '2017-05-03 03:05:41', '10000', '10001');
INSERT INTO `message` VALUES ('5', 'qqqqqqq', '2017-05-07 11:01:40', '10000', '10000');
INSERT INTO `message` VALUES ('7', '王老吉，和其正，来一瓶!', '2017-05-07 11:02:59', '10000', '10000');
INSERT INTO `message` VALUES ('8', 'jjhkhjkh', '2017-05-16 15:25:23', '10000', '10000');

-- ----------------------------
-- Table structure for `photo`
-- ----------------------------
DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `photoId` int(11) NOT NULL AUTO_INCREMENT,
  `photoName` varchar(80) NOT NULL,
  `size` varchar(20) NOT NULL,
  `uploadDate` datetime NOT NULL,
  `photoAlbumId` int(11) NOT NULL,
  PRIMARY KEY (`photoId`),
  KEY `photo_ibfk_1` (`photoAlbumId`),
  CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`photoAlbumId`) REFERENCES `photoalbum` (`photoAlbumId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of photo
-- ----------------------------
INSERT INTO `photo` VALUES ('47', 'IMG_6811.JPG', '268KB', '2017-05-06 19:04:29', '11');
INSERT INTO `photo` VALUES ('48', 'IMG_6806.JPG', '2.0MB', '2017-05-06 19:04:29', '11');
INSERT INTO `photo` VALUES ('50', 'IMG_6835.JPG', '2.0MB', '2017-05-06 19:06:47', '11');
INSERT INTO `photo` VALUES ('51', 'IMG_6814.JPG', '194KB', '2017-05-06 19:09:27', '11');
INSERT INTO `photo` VALUES ('52', 'IMG_6841.JPG', '97KB', '2017-05-06 19:13:20', '11');
INSERT INTO `photo` VALUES ('53', 'IMG_6849.JPG', '1.0MB', '2017-05-06 19:13:20', '11');
INSERT INTO `photo` VALUES ('54', 'IMGxxx.JPG', '146KB', '2017-05-06 19:19:35', '11');
INSERT INTO `photo` VALUES ('55', 'IMGxxx (2).JPG', '92KB', '2017-05-06 19:19:35', '11');
INSERT INTO `photo` VALUES ('56', 'IMG_6866.JPG', '2.0MB', '2017-05-06 21:43:11', '11');
INSERT INTO `photo` VALUES ('57', 'IMG_7660.JPG', '112KB', '2017-05-06 21:43:11', '11');
INSERT INTO `photo` VALUES ('58', 'IMG_7664.JPG', '113KB', '2017-05-06 21:43:11', '11');
INSERT INTO `photo` VALUES ('59', 'IMG_7481.JPG', '3.0MB', '2017-05-06 22:02:48', '11');
INSERT INTO `photo` VALUES ('60', 'IMG_7483.JPG', '2.0MB', '2017-05-06 22:02:49', '11');
INSERT INTO `photo` VALUES ('61', 'IMG_7490.JPG', '1.0MB', '2017-05-06 22:02:49', '11');
INSERT INTO `photo` VALUES ('62', 'IMG_7491.JPG', '2.0MB', '2017-05-06 22:05:01', '11');
INSERT INTO `photo` VALUES ('63', 'IMG_7508.JPG', '2.0MB', '2017-05-06 22:05:01', '11');
INSERT INTO `photo` VALUES ('64', 'IMG_7524.JPG', '2.0MB', '2017-05-06 22:06:49', '11');
INSERT INTO `photo` VALUES ('65', 'IMG_7543.JPG', '2.0MB', '2017-05-06 22:06:49', '11');
INSERT INTO `photo` VALUES ('67', 'IMG_7542.JPG', '2.0MB', '2017-05-06 22:19:34', '11');
INSERT INTO `photo` VALUES ('79', 'tx (2).jpg', '42KB', '2017-05-13 00:58:28', '6');
INSERT INTO `photo` VALUES ('80', 'IMG_7516.JPG', '2.0MB', '2017-05-14 17:40:30', '11');
INSERT INTO `photo` VALUES ('81', '4.png', '43KB', '2017-05-16 15:24:41', '11');

-- ----------------------------
-- Table structure for `photoalbum`
-- ----------------------------
DROP TABLE IF EXISTS `photoalbum`;
CREATE TABLE `photoalbum` (
  `photoAlbumId` int(11) NOT NULL AUTO_INCREMENT,
  `photoAlbumName` varchar(50) NOT NULL,
  `EditDate` datetime NOT NULL,
  `photoAlbumImg` varchar(80) DEFAULT NULL,
  `QQ_No` int(11) NOT NULL,
  PRIMARY KEY (`photoAlbumId`),
  KEY `QQ_No` (`QQ_No`),
  CONSTRAINT `photoalbum_ibfk_1` FOREIGN KEY (`QQ_No`) REFERENCES `qquser` (`QQ_No`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of photoalbum
-- ----------------------------
INSERT INTO `photoalbum` VALUES ('1', '重庆', '2017-05-04 04:00:36', null, '10000');
INSERT INTO `photoalbum` VALUES ('2', '广东', '2017-05-03 04:00:52', null, '10000');
INSERT INTO `photoalbum` VALUES ('3', 'family', '2017-05-05 04:07:57', null, '10000');
INSERT INTO `photoalbum` VALUES ('6', '大学', '2017-05-06 16:30:42', 'tx (2).jpg', '10000');
INSERT INTO `photoalbum` VALUES ('11', '广州1', '2017-05-16 15:24:53', '4.png', '10000');

-- ----------------------------
-- Table structure for `qqadmin`
-- ----------------------------
DROP TABLE IF EXISTS `qqadmin`;
CREATE TABLE `qqadmin` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `passwd` varchar(16) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qqadmin
-- ----------------------------

-- ----------------------------
-- Table structure for `qquser`
-- ----------------------------
DROP TABLE IF EXISTS `qquser`;
CREATE TABLE `qquser` (
  `QQ_No` int(11) NOT NULL AUTO_INCREMENT,
  `QQ_webname` varchar(30) NOT NULL,
  `QQ_pswd` varchar(20) NOT NULL,
  `QQ_sign` varchar(50) DEFAULT NULL,
  `u_sex` varchar(8) NOT NULL,
  `u_age` int(11) DEFAULT NULL,
  `u_birthday` date DEFAULT NULL,
  `u_hometown` varchar(30) DEFAULT NULL,
  `u_staycity` varchar(30) DEFAULT NULL,
  `u_education` varchar(10) DEFAULT NULL,
  `u_profession` varchar(20) DEFAULT NULL,
  `isOnline` int(11) DEFAULT '0',
  PRIMARY KEY (`QQ_No`)
) ENGINE=InnoDB AUTO_INCREMENT=10019 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qquser
-- ----------------------------
INSERT INTO `qquser` VALUES ('10000', '小风', '1234567', '我的快乐我做主', '男', '1', '2016-01-01', '江苏南京', '江苏南京', '初中', '计算机/互联网/通信', '0');
INSERT INTO `qquser` VALUES ('10001', '会飞的鱼', '1234567', '我是会飞的鱼', '男', '12', '1994-02-01', null, '中国北京东城区', null, null, '0');
INSERT INTO `qquser` VALUES ('10002', '程序猿', '123456', null, '男', '15', '1994-02-01', null, '中国北京东城区', null, null, '0');
INSERT INTO `qquser` VALUES ('10003', '战神', '123456', null, '男', '16', '1994-02-01', null, '中国北京东城区', null, null, '0');
INSERT INTO `qquser` VALUES ('10004', '李林峰', '123456', '', '男', '1', '2016-08-01', '北京东城', '北京东城', '小学', '计算机/互联网/通信', '0');
INSERT INTO `qquser` VALUES ('10005', '林峰', '123456', null, '男', '48', '1993-02-01', null, '中国北京东城区', null, null, '0');
INSERT INTO `qquser` VALUES ('10006', '李小疯先森', '123456', '我是小风哈哈', '男', '27', '1990-04-02', '北京东城', '北京东城', '小学', '计算机/互联网/通信', '0');
INSERT INTO `qquser` VALUES ('10007', '风之子', '123456', '神秘的风之子', '男', '7', '2010-06-06', '北京东城', '江苏南京', '高中', '生产/工艺/制造', '0');
INSERT INTO `qquser` VALUES ('10008', '小敏', '123456', null, '女', '16', '2001-01-01', null, '中国北京东城', null, null, '0');
INSERT INTO `qquser` VALUES ('10009', 'xql', '123456', null, '女', '97', '1920-01-01', null, '中国北京东城', null, null, '0');
INSERT INTO `qquser` VALUES ('10010', 'zhangsan', '123456', null, '男', '49', '1968-01-01', null, '中国北京东城', null, null, '0');
INSERT INTO `qquser` VALUES ('10011', 'xxxx', '123456', null, '男', '0', '2017-01-01', null, '中国北京东城', null, null, '0');
INSERT INTO `qquser` VALUES ('10012', 'dcs', '12345678', null, '男', '15', '2002-01-01', null, '中国北京东城', null, null, '0');
INSERT INTO `qquser` VALUES ('10013', 'vvv', '123456', null, '男', '13', '2004-01-01', null, '中国北京东城', null, null, '0');
INSERT INTO `qquser` VALUES ('10014', 'lijie', '12345678', null, '男', '0', '2017-01-01', null, '中国重庆渝中', null, null, '0');
INSERT INTO `qquser` VALUES ('10015', 'linfeng1993', '12345678', null, '男', '24', '1993-11-16', null, '中国重庆南岸', null, null, '0');
INSERT INTO `qquser` VALUES ('10016', 'xiaowang', '12345678', '我是小王', '男', '17', '2000-06-06', '北京东城', '重庆渝中', '大专', '计算机/互联网/通信', '0');
INSERT INTO `qquser` VALUES ('10017', 'ceshi', '123456', '我是阿Q，哈哈', '男', '25', '1992-09-19', '中国辽宁沈阳', '中国北京朝阳', '本科', '计算机/互联网/通信', '0');
INSERT INTO `qquser` VALUES ('10018', 'test', '12345678', null, '男', '17', '2000-01-01', null, '中国江苏南京', null, null, '0');

-- ----------------------------
-- Table structure for `qq_friend`
-- ----------------------------
DROP TABLE IF EXISTS `qq_friend`;
CREATE TABLE `qq_friend` (
  `QQ_friendId` int(11) NOT NULL AUTO_INCREMENT,
  `QQ_No` int(11) NOT NULL,
  `QQ_friend_No` int(11) NOT NULL,
  PRIMARY KEY (`QQ_friendId`),
  KEY `QQ_No` (`QQ_No`),
  KEY `QQ_friend_No` (`QQ_friend_No`),
  CONSTRAINT `qq_friend_ibfk_1` FOREIGN KEY (`QQ_No`) REFERENCES `qquser` (`QQ_No`),
  CONSTRAINT `qq_friend_ibfk_2` FOREIGN KEY (`QQ_friend_No`) REFERENCES `qquser` (`QQ_No`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qq_friend
-- ----------------------------
INSERT INTO `qq_friend` VALUES ('1', '10000', '10001');
INSERT INTO `qq_friend` VALUES ('2', '10000', '10002');
INSERT INTO `qq_friend` VALUES ('3', '10000', '10004');
INSERT INTO `qq_friend` VALUES ('4', '10001', '10000');
INSERT INTO `qq_friend` VALUES ('5', '10002', '10000');
INSERT INTO `qq_friend` VALUES ('6', '10004', '10000');
INSERT INTO `qq_friend` VALUES ('19', '10007', '10004');
INSERT INTO `qq_friend` VALUES ('20', '10004', '10007');
INSERT INTO `qq_friend` VALUES ('21', '10000', '10007');
INSERT INTO `qq_friend` VALUES ('22', '10007', '10000');
INSERT INTO `qq_friend` VALUES ('91', '10000', '10014');
INSERT INTO `qq_friend` VALUES ('92', '10014', '10000');
INSERT INTO `qq_friend` VALUES ('93', '10000', '10018');
INSERT INTO `qq_friend` VALUES ('94', '10018', '10000');

-- ----------------------------
-- Table structure for `talk`
-- ----------------------------
DROP TABLE IF EXISTS `talk`;
CREATE TABLE `talk` (
  `talkId` int(11) NOT NULL AUTO_INCREMENT,
  `talkcontent` varchar(200) NOT NULL,
  `talkTime` datetime NOT NULL,
  `QQ_No` int(11) NOT NULL,
  PRIMARY KEY (`talkId`),
  KEY `QQ_No` (`QQ_No`),
  CONSTRAINT `talk_ibfk_1` FOREIGN KEY (`QQ_No`) REFERENCES `qquser` (`QQ_No`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of talk
-- ----------------------------
INSERT INTO `talk` VALUES ('1', '好累啊，啊啊啊啊啊啊啊啊啊啊', '2017-05-04 00:44:39', '10000');
INSERT INTO `talk` VALUES ('3', 'go go go，lalalallalalalal', '2017-05-05 01:40:00', '10000');
INSERT INTO `talk` VALUES ('4', '发表说说测试...', '2017-05-06 11:22:57', '10000');
INSERT INTO `talk` VALUES ('12', '哇哈哈，动感光波!!!!!!', '2017-05-06 11:38:04', '10000');
INSERT INTO `talk` VALUES ('16', 'drfg', '2017-05-08 13:43:21', '10013');
INSERT INTO `talk` VALUES ('17', '发表说说测试。。。', '2017-05-16 14:53:13', '10000');
INSERT INTO `talk` VALUES ('18', 'shsjd ', '2017-05-16 15:25:10', '10000');

-- ----------------------------
-- Table structure for `talkcomment`
-- ----------------------------
DROP TABLE IF EXISTS `talkcomment`;
CREATE TABLE `talkcomment` (
  `talkCommentId` int(11) NOT NULL AUTO_INCREMENT,
  `talkCommentContent` varchar(100) NOT NULL,
  `publishDate` datetime NOT NULL,
  `talkId` int(11) NOT NULL,
  `QQ_No` int(11) NOT NULL,
  PRIMARY KEY (`talkCommentId`),
  KEY `talkcomment_ibfk_2` (`QQ_No`),
  KEY `talkcomment_ibfk_1` (`talkId`),
  CONSTRAINT `talkcomment_ibfk_1` FOREIGN KEY (`talkId`) REFERENCES `talk` (`talkId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `talkcomment_ibfk_2` FOREIGN KEY (`QQ_No`) REFERENCES `qquser` (`QQ_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of talkcomment
-- ----------------------------
INSERT INTO `talkcomment` VALUES ('3', '来一波', '2017-05-06 13:34:54', '4', '10000');
INSERT INTO `talkcomment` VALUES ('6', '那就休息一下呗', '2017-05-06 13:37:32', '1', '10000');
INSERT INTO `talkcomment` VALUES ('16', '和其正', '2017-05-06 13:45:45', '4', '10000');
INSERT INTO `talkcomment` VALUES ('17', '蜡笔小新啊', '2017-05-06 14:08:12', '12', '10004');
INSERT INTO `talkcomment` VALUES ('18', '瓶装更尽兴...', '2017-05-06 14:09:14', '4', '10000');

-- ----------------------------
-- Table structure for `zoneaccesspermission`
-- ----------------------------
DROP TABLE IF EXISTS `zoneaccesspermission`;
CREATE TABLE `zoneaccesspermission` (
  `ZoneAccessPermissionId` int(11) NOT NULL AUTO_INCREMENT,
  `QQ_No` int(11) NOT NULL,
  `QQ_friend_No` int(11) NOT NULL,
  PRIMARY KEY (`ZoneAccessPermissionId`),
  KEY `QQ_No` (`QQ_No`),
  KEY `QQ_friend_No` (`QQ_friend_No`),
  CONSTRAINT `zoneaccesspermission_ibfk_1` FOREIGN KEY (`QQ_No`) REFERENCES `qquser` (`QQ_No`),
  CONSTRAINT `zoneaccesspermission_ibfk_2` FOREIGN KEY (`QQ_friend_No`) REFERENCES `qquser` (`QQ_No`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zoneaccesspermission
-- ----------------------------
INSERT INTO `zoneaccesspermission` VALUES ('6', '10000', '10004');

-- ----------------------------
-- Table structure for `zoneaccesstoken`
-- ----------------------------
DROP TABLE IF EXISTS `zoneaccesstoken`;
CREATE TABLE `zoneaccesstoken` (
  `zonetokenId` varchar(10) NOT NULL,
  `QQ_No` int(11) NOT NULL,
  `QQ_No_Access` int(11) NOT NULL,
  PRIMARY KEY (`zonetokenId`),
  KEY `QQ_No` (`QQ_No`),
  KEY `QQ_No_Access` (`QQ_No_Access`),
  CONSTRAINT `zoneaccesstoken_ibfk_1` FOREIGN KEY (`QQ_No`) REFERENCES `qquser` (`QQ_No`),
  CONSTRAINT `zoneaccesstoken_ibfk_2` FOREIGN KEY (`QQ_No_Access`) REFERENCES `qquser` (`QQ_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zoneaccesstoken
-- ----------------------------
INSERT INTO `zoneaccesstoken` VALUES ('25d25be2', '10000', '10000');
INSERT INTO `zoneaccesstoken` VALUES ('2b159acc', '10000', '10002');
INSERT INTO `zoneaccesstoken` VALUES ('5b9dc6c5', '10000', '10000');
INSERT INTO `zoneaccesstoken` VALUES ('64g3d5d8', '10000', '10002');
INSERT INTO `zoneaccesstoken` VALUES ('6ef9fa3c', '10000', '10000');
INSERT INTO `zoneaccesstoken` VALUES ('89ccf451', '10000', '10000');
INSERT INTO `zoneaccesstoken` VALUES ('a6aceg2g', '10000', '10000');
INSERT INTO `zoneaccesstoken` VALUES ('ae6d6ac7', '10000', '10000');
INSERT INTO `zoneaccesstoken` VALUES ('c376e421', '10000', '10000');
INSERT INTO `zoneaccesstoken` VALUES ('g12afdde', '10000', '10000');
INSERT INTO `zoneaccesstoken` VALUES ('g736d2bd', '10000', '10000');
INSERT INTO `zoneaccesstoken` VALUES ('gcd53945', '10000', '10002');
