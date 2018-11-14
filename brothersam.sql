/*
Navicat MySQL Data Transfer

Source Server         : bendi
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : brothersam

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2018-11-13 12:49:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for brothersamteam
-- ----------------------------
DROP TABLE IF EXISTS `brothersamteam`;
CREATE TABLE `brothersamteam` (
  `TeamId` int(12) NOT NULL AUTO_INCREMENT,
  `TeamName` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TeamLeaderId` int(12) DEFAULT NULL,
  `TeamSlogen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TeamRemark` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`TeamId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for brothersamuser
-- ----------------------------
DROP TABLE IF EXISTS `brothersamuser`;
CREATE TABLE `brothersamuser` (
  `UserId` int(12) NOT NULL AUTO_INCREMENT,
  `UserName` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TeamId` int(12) DEFAULT NULL,
  `UserSex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `UserPhoneNumber` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `UserEmail` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `UserRemark` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`UserId`),
  KEY `TeamId` (`TeamId`),
  CONSTRAINT `brothersamuser_ibfk_1` FOREIGN KEY (`TeamId`) REFERENCES `brothersamteam` (`teamid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
