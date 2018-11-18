/*
Navicat MySQL Data Transfer

Source Server         : bendi
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : brothersam

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2018-11-15 23:11:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for brothersamteam
-- ----------------------------
DROP TABLE IF EXISTS `brothersamteam`;
CREATE TABLE `brothersamteam` (
  `TeamId` int(12) NOT NULL AUTO_INCREMENT COMMENT '团队Id',
  `TeamName` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '团队名称',
  `TeamLeaderId` int(12) DEFAULT NULL,
  `TeamSlogen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TeamRemark` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`TeamId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of brothersamteam
-- ----------------------------
