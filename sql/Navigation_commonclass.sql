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

 Date: 11/04/2019 13:03:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Navigation_commonclass
-- ----------------------------
DROP TABLE IF EXISTS `Navigation_commonclass`;
CREATE TABLE `Navigation_commonclass`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Navigation_commonclass
-- ----------------------------
INSERT INTO `Navigation_commonclass` VALUES (1, '2019-01-17 12:33:30', '2019-01-17 12:33:30');
INSERT INTO `Navigation_commonclass` VALUES (2, '2019-01-17 12:34:18', '2019-01-17 12:34:18');
INSERT INTO `Navigation_commonclass` VALUES (3, '2019-01-17 12:36:34', '2019-01-17 12:36:34');
INSERT INTO `Navigation_commonclass` VALUES (4, '2019-01-17 12:36:41', '2019-01-17 12:36:41');
INSERT INTO `Navigation_commonclass` VALUES (5, '2019-01-17 12:37:06', '2019-01-17 12:37:06');
INSERT INTO `Navigation_commonclass` VALUES (6, '2019-01-17 12:37:13', '2019-01-17 12:37:13');
INSERT INTO `Navigation_commonclass` VALUES (7, '2019-01-17 15:32:44', '2019-01-17 15:32:44');
INSERT INTO `Navigation_commonclass` VALUES (8, '2019-01-17 15:34:44', '2019-01-18 02:49:59');
INSERT INTO `Navigation_commonclass` VALUES (9, '2019-01-17 15:36:31', '2019-01-17 15:36:31');
INSERT INTO `Navigation_commonclass` VALUES (10, '2019-01-17 15:37:52', '2019-01-17 15:37:52');
INSERT INTO `Navigation_commonclass` VALUES (11, '2019-01-17 15:39:12', '2019-01-17 15:39:12');
INSERT INTO `Navigation_commonclass` VALUES (12, '2019-01-17 15:40:45', '2019-01-17 15:40:45');
INSERT INTO `Navigation_commonclass` VALUES (13, '2019-01-17 15:42:05', '2019-01-17 15:42:05');
INSERT INTO `Navigation_commonclass` VALUES (14, '2019-01-17 15:43:17', '2019-01-17 15:43:17');
INSERT INTO `Navigation_commonclass` VALUES (15, '2019-01-17 15:44:57', '2019-01-17 15:44:57');
INSERT INTO `Navigation_commonclass` VALUES (16, '2019-01-17 15:45:59', '2019-01-17 15:45:59');
INSERT INTO `Navigation_commonclass` VALUES (17, '2019-01-17 15:46:37', '2019-01-18 02:50:14');
INSERT INTO `Navigation_commonclass` VALUES (18, '2019-01-17 15:48:14', '2019-01-18 02:50:24');
INSERT INTO `Navigation_commonclass` VALUES (19, '2019-01-17 15:50:07', '2019-01-18 02:50:34');
INSERT INTO `Navigation_commonclass` VALUES (20, '2019-01-17 15:51:45', '2019-01-18 02:50:42');
INSERT INTO `Navigation_commonclass` VALUES (21, '2019-01-17 15:52:43', '2019-01-17 15:52:43');
INSERT INTO `Navigation_commonclass` VALUES (22, '2019-01-17 15:53:48', '2019-01-17 16:14:40');
INSERT INTO `Navigation_commonclass` VALUES (23, '2019-01-17 15:55:09', '2019-01-17 15:55:09');
INSERT INTO `Navigation_commonclass` VALUES (24, '2019-01-17 15:56:52', '2019-01-17 15:56:52');
INSERT INTO `Navigation_commonclass` VALUES (25, '2019-01-17 15:57:44', '2019-01-18 02:50:59');
INSERT INTO `Navigation_commonclass` VALUES (26, '2019-01-17 15:58:56', '2019-01-17 15:58:56');
INSERT INTO `Navigation_commonclass` VALUES (27, '2019-01-17 16:00:16', '2019-01-17 16:00:16');
INSERT INTO `Navigation_commonclass` VALUES (28, '2019-01-17 16:01:11', '2019-01-17 16:01:11');
INSERT INTO `Navigation_commonclass` VALUES (29, '2019-01-17 16:02:08', '2019-01-18 02:51:10');
INSERT INTO `Navigation_commonclass` VALUES (30, '2019-01-17 16:03:49', '2019-01-17 16:03:49');
INSERT INTO `Navigation_commonclass` VALUES (31, '2019-01-17 16:05:13', '2019-01-17 16:05:13');
INSERT INTO `Navigation_commonclass` VALUES (32, '2019-01-17 16:06:38', '2019-01-18 02:51:20');
INSERT INTO `Navigation_commonclass` VALUES (33, '2019-01-17 16:08:42', '2019-01-17 16:08:42');
INSERT INTO `Navigation_commonclass` VALUES (34, '2019-01-17 16:09:48', '2019-01-17 16:09:48');
INSERT INTO `Navigation_commonclass` VALUES (35, '2019-01-17 16:11:13', '2019-01-17 16:11:13');
INSERT INTO `Navigation_commonclass` VALUES (36, '2019-01-17 16:12:50', '2019-01-17 16:12:50');
INSERT INTO `Navigation_commonclass` VALUES (37, '2019-01-17 16:15:37', '2019-01-17 16:15:37');
INSERT INTO `Navigation_commonclass` VALUES (38, '2019-01-17 16:18:00', '2019-01-17 16:18:00');
INSERT INTO `Navigation_commonclass` VALUES (39, '2019-01-17 16:19:20', '2019-01-18 02:51:33');
INSERT INTO `Navigation_commonclass` VALUES (40, '2019-01-17 16:20:15', '2019-01-18 02:50:50');
INSERT INTO `Navigation_commonclass` VALUES (41, '2019-01-17 16:22:23', '2019-01-17 16:22:23');
INSERT INTO `Navigation_commonclass` VALUES (42, '2019-01-18 02:47:14', '2019-01-18 02:47:14');
INSERT INTO `Navigation_commonclass` VALUES (43, '2019-01-18 02:49:53', '2019-01-18 02:56:24');
INSERT INTO `Navigation_commonclass` VALUES (44, '2019-01-18 02:59:17', '2019-01-18 02:59:17');
INSERT INTO `Navigation_commonclass` VALUES (45, '2019-01-18 03:02:06', '2019-01-18 03:02:06');
INSERT INTO `Navigation_commonclass` VALUES (46, '2019-01-18 03:04:00', '2019-01-18 03:04:00');
INSERT INTO `Navigation_commonclass` VALUES (47, '2019-01-18 03:05:54', '2019-01-18 03:05:54');
INSERT INTO `Navigation_commonclass` VALUES (48, '2019-01-18 03:09:37', '2019-01-18 03:09:37');
INSERT INTO `Navigation_commonclass` VALUES (49, '2019-01-18 03:11:21', '2019-01-18 03:11:21');
INSERT INTO `Navigation_commonclass` VALUES (50, '2019-01-18 04:58:06', '2019-01-18 04:58:06');
INSERT INTO `Navigation_commonclass` VALUES (51, '2019-01-18 04:59:21', '2019-01-18 05:00:01');
INSERT INTO `Navigation_commonclass` VALUES (52, '2019-01-18 05:01:14', '2019-01-18 05:01:14');
INSERT INTO `Navigation_commonclass` VALUES (53, '2019-01-18 05:03:16', '2019-01-18 05:03:16');
INSERT INTO `Navigation_commonclass` VALUES (54, '2019-01-18 05:05:27', '2019-01-18 05:05:27');
INSERT INTO `Navigation_commonclass` VALUES (55, '2019-01-18 05:07:34', '2019-01-18 05:07:34');
INSERT INTO `Navigation_commonclass` VALUES (56, '2019-01-18 05:09:44', '2019-01-18 05:09:44');
INSERT INTO `Navigation_commonclass` VALUES (57, '2019-01-18 05:19:53', '2019-01-18 05:19:53');
INSERT INTO `Navigation_commonclass` VALUES (58, '2019-01-18 05:20:58', '2019-01-18 05:20:58');
INSERT INTO `Navigation_commonclass` VALUES (59, '2019-01-18 05:23:05', '2019-01-18 05:23:05');
INSERT INTO `Navigation_commonclass` VALUES (60, '2019-01-19 06:32:38', '2019-01-19 06:32:38');
INSERT INTO `Navigation_commonclass` VALUES (61, '2019-01-19 06:34:23', '2019-01-19 06:34:23');
INSERT INTO `Navigation_commonclass` VALUES (62, '2019-01-19 06:38:02', '2019-01-19 06:38:02');
INSERT INTO `Navigation_commonclass` VALUES (63, '2019-01-19 06:40:03', '2019-01-19 06:40:03');
INSERT INTO `Navigation_commonclass` VALUES (64, '2019-01-19 06:41:21', '2019-01-19 06:41:21');
INSERT INTO `Navigation_commonclass` VALUES (65, '2019-01-19 06:44:17', '2019-01-19 06:44:17');
INSERT INTO `Navigation_commonclass` VALUES (66, '2019-01-19 06:45:52', '2019-01-19 06:45:52');
INSERT INTO `Navigation_commonclass` VALUES (67, '2019-01-19 06:46:38', '2019-01-19 06:46:38');
INSERT INTO `Navigation_commonclass` VALUES (68, '2019-01-19 06:50:22', '2019-01-19 06:50:22');
INSERT INTO `Navigation_commonclass` VALUES (69, '2019-01-19 06:51:34', '2019-01-19 06:51:34');
INSERT INTO `Navigation_commonclass` VALUES (70, '2019-01-19 06:52:49', '2019-01-19 06:52:49');
INSERT INTO `Navigation_commonclass` VALUES (71, '2019-01-19 06:55:11', '2019-01-19 06:55:11');
INSERT INTO `Navigation_commonclass` VALUES (72, '2019-01-19 06:56:31', '2019-01-19 06:56:31');
INSERT INTO `Navigation_commonclass` VALUES (73, '2019-01-19 06:58:12', '2019-01-19 06:58:12');
INSERT INTO `Navigation_commonclass` VALUES (74, '2019-01-19 07:01:39', '2019-01-19 07:01:39');
INSERT INTO `Navigation_commonclass` VALUES (75, '2019-01-19 07:02:20', '2019-01-19 07:02:20');
INSERT INTO `Navigation_commonclass` VALUES (76, '2019-01-19 07:05:46', '2019-01-19 07:05:46');
INSERT INTO `Navigation_commonclass` VALUES (77, '2019-01-19 07:07:11', '2019-01-19 07:07:11');
INSERT INTO `Navigation_commonclass` VALUES (78, '2019-01-19 07:09:06', '2019-01-19 07:09:06');
INSERT INTO `Navigation_commonclass` VALUES (79, '2019-01-19 07:12:05', '2019-01-19 07:12:05');
INSERT INTO `Navigation_commonclass` VALUES (80, '2019-01-19 07:12:33', '2019-01-19 07:12:33');
INSERT INTO `Navigation_commonclass` VALUES (81, '2019-01-19 07:14:38', '2019-01-19 07:14:38');
INSERT INTO `Navigation_commonclass` VALUES (82, '2019-01-19 07:22:44', '2019-01-19 07:22:44');
INSERT INTO `Navigation_commonclass` VALUES (83, '2019-01-19 07:25:54', '2019-01-19 07:25:54');
INSERT INTO `Navigation_commonclass` VALUES (84, '2019-01-19 07:29:44', '2019-01-19 07:29:44');
INSERT INTO `Navigation_commonclass` VALUES (85, '2019-01-19 07:32:08', '2019-01-19 07:32:08');
INSERT INTO `Navigation_commonclass` VALUES (86, '2019-01-19 07:34:45', '2019-01-19 07:34:45');
INSERT INTO `Navigation_commonclass` VALUES (87, '2019-01-19 07:40:34', '2019-01-19 07:40:34');
INSERT INTO `Navigation_commonclass` VALUES (88, '2019-01-19 07:44:18', '2019-01-19 07:44:18');
INSERT INTO `Navigation_commonclass` VALUES (89, '2019-01-19 07:48:32', '2019-01-19 07:48:32');
INSERT INTO `Navigation_commonclass` VALUES (90, '2019-01-19 07:55:48', '2019-01-19 07:55:48');
INSERT INTO `Navigation_commonclass` VALUES (91, '2019-01-19 07:58:08', '2019-01-19 07:58:08');
INSERT INTO `Navigation_commonclass` VALUES (92, '2019-01-19 07:59:43', '2019-01-19 07:59:43');
INSERT INTO `Navigation_commonclass` VALUES (93, '2019-01-19 08:01:26', '2019-01-19 08:01:26');
INSERT INTO `Navigation_commonclass` VALUES (94, '2019-01-19 08:03:37', '2019-01-19 08:03:37');
INSERT INTO `Navigation_commonclass` VALUES (95, '2019-01-19 08:07:37', '2019-01-19 08:07:37');
INSERT INTO `Navigation_commonclass` VALUES (96, '2019-01-19 08:09:06', '2019-01-19 08:09:06');
INSERT INTO `Navigation_commonclass` VALUES (97, '2019-01-19 08:10:46', '2019-01-19 08:10:46');
INSERT INTO `Navigation_commonclass` VALUES (98, '2019-01-19 08:16:11', '2019-01-19 08:16:11');
INSERT INTO `Navigation_commonclass` VALUES (99, '2019-01-20 02:31:42', '2019-01-20 02:31:42');
INSERT INTO `Navigation_commonclass` VALUES (100, '2019-01-20 02:31:47', '2019-01-20 02:31:47');
INSERT INTO `Navigation_commonclass` VALUES (101, '2019-01-20 02:33:14', '2019-01-20 02:33:14');
INSERT INTO `Navigation_commonclass` VALUES (102, '2019-01-20 02:35:58', '2019-01-20 02:35:58');
INSERT INTO `Navigation_commonclass` VALUES (103, '2019-01-20 02:37:33', '2019-01-20 02:37:33');
INSERT INTO `Navigation_commonclass` VALUES (104, '2019-01-20 02:39:38', '2019-01-20 02:39:38');
INSERT INTO `Navigation_commonclass` VALUES (105, '2019-01-20 02:43:40', '2019-01-20 02:43:40');

SET FOREIGN_KEY_CHECKS = 1;
