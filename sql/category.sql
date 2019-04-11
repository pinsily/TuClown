/*
 Navicat Premium Data Transfer

 Source Server         : aliyun
 Source Server Type    : MySQL
 Source Server Version : 50560
 Source Host           : 39.108.166.59:3306
 Source Schema         : tuclown

 Target Server Type    : MySQL
 Target Server Version : 50560
 File Encoding         : 65001

 Date: 11/04/2019 13:04:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Django', '2018-06-08 15:07:14', '2018-06-08 15:07:14');
INSERT INTO `category` VALUES (2, 'Docker', '2018-06-15 12:11:37', '2018-06-15 12:11:37');
INSERT INTO `category` VALUES (3, 'Linux', '2018-06-20 09:53:42', '2018-06-20 09:53:42');
INSERT INTO `category` VALUES (4, '小知识', '2018-06-20 10:18:52', '2018-06-20 10:18:52');
INSERT INTO `category` VALUES (5, 'css', '2018-06-20 10:23:06', '2018-06-20 10:23:06');
INSERT INTO `category` VALUES (6, 'Python', '2018-07-04 14:40:51', '2018-07-04 14:40:51');
INSERT INTO `category` VALUES (7, 'SQL', '2018-07-07 03:14:28', '2018-07-07 03:14:28');
INSERT INTO `category` VALUES (8, 'Android', '2018-07-07 06:39:38', '2018-07-07 06:39:38');
INSERT INTO `category` VALUES (9, 'JS', '2018-07-07 06:41:59', '2018-07-07 06:41:59');
INSERT INTO `category` VALUES (10, 'Bootstrap', '2018-07-07 06:44:34', '2018-07-07 06:44:34');
INSERT INTO `category` VALUES (11, 'typecho', '2018-07-22 04:14:42', '2018-07-22 04:14:42');
INSERT INTO `category` VALUES (12, 'Window', '2018-07-22 12:22:58', '2018-07-22 12:22:58');
INSERT INTO `category` VALUES (13, 'Chrome', '2018-07-22 12:39:15', '2018-07-22 12:39:15');
INSERT INTO `category` VALUES (14, 'Algorithme', '2018-07-22 12:42:11', '2018-07-22 12:42:11');
INSERT INTO `category` VALUES (15, 'Database', '2018-07-22 12:43:29', '2018-07-22 12:43:29');
INSERT INTO `category` VALUES (16, 'Nodejs', '2018-07-22 13:12:11', '2018-07-22 13:12:11');
INSERT INTO `category` VALUES (17, 'Scala', '2018-07-22 13:19:27', '2018-07-22 13:19:27');
INSERT INTO `category` VALUES (18, 'Hadoop', '2018-07-23 15:22:08', '2018-07-23 15:22:08');
INSERT INTO `category` VALUES (19, '数据挖掘', '2018-10-07 09:22:04', '2018-10-07 09:22:04');
INSERT INTO `category` VALUES (20, 'Git', '2019-03-24 12:22:58', '2019-03-24 12:22:58');

SET FOREIGN_KEY_CHECKS = 1;
