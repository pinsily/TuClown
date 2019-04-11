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

 Date: 11/04/2019 13:03:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for nav_category
-- ----------------------------
DROP TABLE IF EXISTS `nav_category`;
CREATE TABLE `nav_category`  (
  `commonclass_ptr_id` int(11) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `english_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`commonclass_ptr_id`) USING BTREE,
  CONSTRAINT `nav_category_commonclass_ptr_id_34ed657a_fk_Navigatio` FOREIGN KEY (`commonclass_ptr_id`) REFERENCES `Navigation_commonclass` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of nav_category
-- ----------------------------
INSERT INTO `nav_category` VALUES (1, 'Window工具箱', 'window');
INSERT INTO `nav_category` VALUES (3, '前端开发', 'front_end');
INSERT INTO `nav_category` VALUES (5, '音乐电台', 'music');
INSERT INTO `nav_category` VALUES (43, '编程软件', 'code_software');
INSERT INTO `nav_category` VALUES (50, '论坛社群', 'forum');
INSERT INTO `nav_category` VALUES (61, '在线工具', 'online_tool');
INSERT INTO `nav_category` VALUES (66, '镜像资源', 'image_source');
INSERT INTO `nav_category` VALUES (68, '科技资讯', 'tech_know');
INSERT INTO `nav_category` VALUES (74, '图片长廊', 'gallery');
INSERT INTO `nav_category` VALUES (79, 'python花园', 'python');
INSERT INTO `nav_category` VALUES (99, '趣网几何', 'interest');

SET FOREIGN_KEY_CHECKS = 1;
