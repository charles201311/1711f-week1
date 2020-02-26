/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50639
Source Host           : localhost:3306
Source Database       : 1710e

Target Server Type    : MYSQL
Target Server Version : 50639
File Encoding         : 65001

Date: 2020-02-25 08:49:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_brand`
-- ----------------------------
DROP TABLE IF EXISTS `t_brand`;
CREATE TABLE `t_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '品牌名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_brand
-- ----------------------------
INSERT INTO `t_brand` VALUES ('1', '小米');
INSERT INTO `t_brand` VALUES ('2', '海尔');
INSERT INTO `t_brand` VALUES ('3', '华为');

-- ----------------------------
-- Table structure for `t_goods`
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `ename` varchar(50) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  `size` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `tab` varchar(50) DEFAULT NULL,
  `pic` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bid` (`bid`),
  KEY `tid` (`tid`),
  CONSTRAINT `t_goods_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `t_brand` (`id`),
  CONSTRAINT `t_goods_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `t_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('1', '小米9', 'mi9', '1', '1', '6', '3999', '1000', '通讯', '1.jpg');
INSERT INTO `t_goods` VALUES ('2', 'mate30', 'mate30', '3', '1', '6.5', '6999', '2000', '通讯', '2.jpg');
INSERT INTO `t_goods` VALUES ('3', '格力', 'geli', '2', '2', '12', '2888', '1500', '家电', '2.jpg');
INSERT INTO `t_goods` VALUES ('4', '汽车', 'car', '2', '2', '20', '120000', '12', '汽车', '3.jpg');
INSERT INTO `t_goods` VALUES ('5', '美的', 'media', '2', '1', '12', '3999', '2300', '家电', '3.jpg');
INSERT INTO `t_goods` VALUES ('6', '联想电脑', 'lenovo', '3', '2', '15', '5000', '400', '办公', '4.jpg');
INSERT INTO `t_goods` VALUES ('7', '饮水机', '饮水机', '1', '1', null, '299', '900', null, '1507725c-78d0-42f4-ac7a-d9490f949a4c.jpg');
INSERT INTO `t_goods` VALUES ('8', '猪猪侠', '猪猪侠', '2', '3', null, '3456', '1000', null, '5700043e-8b89-445c-871a-91213ad06986.jpg');

-- ----------------------------
-- Table structure for `t_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES ('1', '手机');
INSERT INTO `t_type` VALUES ('2', '电视');
INSERT INTO `t_type` VALUES ('3', '空调');
