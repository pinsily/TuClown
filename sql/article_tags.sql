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

 Date: 11/04/2019 11:44:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article_tags
-- ----------------------------
DROP TABLE IF EXISTS `article_tags`;
CREATE TABLE `article_tags`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `article_tags_article_id_tag_id_9ea24d7b_uniq`(`article_id`, `tag_id`) USING BTREE,
  INDEX `article_tags_tag_id_55b93824_fk_tag_id`(`tag_id`) USING BTREE,
  CONSTRAINT `article_tags_article_id_ebbe35ec_fk_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `article_tags_tag_id_55b93824_fk_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 178 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article_tags
-- ----------------------------
INSERT INTO `article_tags` VALUES (1, 1, 1);
INSERT INTO `article_tags` VALUES (2, 1, 2);
INSERT INTO `article_tags` VALUES (3, 2, 1);
INSERT INTO `article_tags` VALUES (4, 3, 1);
INSERT INTO `article_tags` VALUES (5, 4, 1);
INSERT INTO `article_tags` VALUES (6, 4, 3);
INSERT INTO `article_tags` VALUES (7, 5, 1);
INSERT INTO `article_tags` VALUES (8, 5, 4);
INSERT INTO `article_tags` VALUES (9, 6, 1);
INSERT INTO `article_tags` VALUES (10, 6, 5);
INSERT INTO `article_tags` VALUES (11, 7, 1);
INSERT INTO `article_tags` VALUES (12, 7, 5);
INSERT INTO `article_tags` VALUES (13, 8, 1);
INSERT INTO `article_tags` VALUES (14, 9, 1);
INSERT INTO `article_tags` VALUES (15, 9, 6);
INSERT INTO `article_tags` VALUES (16, 10, 1);
INSERT INTO `article_tags` VALUES (17, 10, 7);
INSERT INTO `article_tags` VALUES (18, 11, 1);
INSERT INTO `article_tags` VALUES (19, 11, 4);
INSERT INTO `article_tags` VALUES (20, 12, 8);
INSERT INTO `article_tags` VALUES (21, 13, 8);
INSERT INTO `article_tags` VALUES (22, 14, 8);
INSERT INTO `article_tags` VALUES (23, 15, 8);
INSERT INTO `article_tags` VALUES (24, 16, 9);
INSERT INTO `article_tags` VALUES (25, 16, 10);
INSERT INTO `article_tags` VALUES (26, 16, 11);
INSERT INTO `article_tags` VALUES (27, 17, 9);
INSERT INTO `article_tags` VALUES (28, 17, 10);
INSERT INTO `article_tags` VALUES (31, 19, 9);
INSERT INTO `article_tags` VALUES (32, 19, 10);
INSERT INTO `article_tags` VALUES (33, 20, 9);
INSERT INTO `article_tags` VALUES (34, 20, 10);
INSERT INTO `article_tags` VALUES (35, 21, 9);
INSERT INTO `article_tags` VALUES (36, 21, 10);
INSERT INTO `article_tags` VALUES (37, 22, 10);
INSERT INTO `article_tags` VALUES (38, 22, 12);
INSERT INTO `article_tags` VALUES (39, 23, 9);
INSERT INTO `article_tags` VALUES (40, 23, 10);
INSERT INTO `article_tags` VALUES (41, 24, 9);
INSERT INTO `article_tags` VALUES (42, 24, 10);
INSERT INTO `article_tags` VALUES (43, 25, 10);
INSERT INTO `article_tags` VALUES (44, 25, 13);
INSERT INTO `article_tags` VALUES (45, 26, 9);
INSERT INTO `article_tags` VALUES (46, 26, 10);
INSERT INTO `article_tags` VALUES (47, 26, 13);
INSERT INTO `article_tags` VALUES (48, 28, 14);
INSERT INTO `article_tags` VALUES (49, 29, 14);
INSERT INTO `article_tags` VALUES (50, 30, 14);
INSERT INTO `article_tags` VALUES (51, 31, 15);
INSERT INTO `article_tags` VALUES (52, 32, 15);
INSERT INTO `article_tags` VALUES (53, 33, 15);
INSERT INTO `article_tags` VALUES (54, 34, 15);
INSERT INTO `article_tags` VALUES (55, 35, 15);
INSERT INTO `article_tags` VALUES (56, 36, 15);
INSERT INTO `article_tags` VALUES (57, 37, 15);
INSERT INTO `article_tags` VALUES (58, 38, 16);
INSERT INTO `article_tags` VALUES (59, 39, 9);
INSERT INTO `article_tags` VALUES (60, 40, 9);
INSERT INTO `article_tags` VALUES (61, 41, 9);
INSERT INTO `article_tags` VALUES (62, 42, 17);
INSERT INTO `article_tags` VALUES (63, 43, 9);
INSERT INTO `article_tags` VALUES (65, 44, 4);
INSERT INTO `article_tags` VALUES (64, 44, 18);
INSERT INTO `article_tags` VALUES (66, 45, 4);
INSERT INTO `article_tags` VALUES (67, 45, 14);
INSERT INTO `article_tags` VALUES (68, 46, 4);
INSERT INTO `article_tags` VALUES (69, 46, 14);
INSERT INTO `article_tags` VALUES (70, 46, 15);
INSERT INTO `article_tags` VALUES (72, 48, 15);
INSERT INTO `article_tags` VALUES (73, 49, 15);
INSERT INTO `article_tags` VALUES (74, 50, 15);
INSERT INTO `article_tags` VALUES (75, 51, 15);
INSERT INTO `article_tags` VALUES (76, 52, 15);
INSERT INTO `article_tags` VALUES (77, 53, 15);
INSERT INTO `article_tags` VALUES (79, 55, 14);
INSERT INTO `article_tags` VALUES (80, 56, 19);
INSERT INTO `article_tags` VALUES (81, 57, 4);
INSERT INTO `article_tags` VALUES (82, 58, 14);
INSERT INTO `article_tags` VALUES (83, 59, 19);
INSERT INTO `article_tags` VALUES (84, 60, 15);
INSERT INTO `article_tags` VALUES (85, 61, 15);
INSERT INTO `article_tags` VALUES (86, 62, 15);
INSERT INTO `article_tags` VALUES (87, 63, 15);
INSERT INTO `article_tags` VALUES (88, 64, 15);
INSERT INTO `article_tags` VALUES (89, 65, 15);
INSERT INTO `article_tags` VALUES (90, 66, 15);
INSERT INTO `article_tags` VALUES (91, 67, 15);
INSERT INTO `article_tags` VALUES (92, 68, 15);
INSERT INTO `article_tags` VALUES (93, 69, 15);
INSERT INTO `article_tags` VALUES (94, 70, 15);
INSERT INTO `article_tags` VALUES (95, 71, 9);
INSERT INTO `article_tags` VALUES (96, 72, 9);
INSERT INTO `article_tags` VALUES (97, 73, 9);
INSERT INTO `article_tags` VALUES (98, 74, 9);
INSERT INTO `article_tags` VALUES (99, 75, 9);
INSERT INTO `article_tags` VALUES (100, 76, 20);
INSERT INTO `article_tags` VALUES (101, 77, 20);
INSERT INTO `article_tags` VALUES (102, 78, 9);
INSERT INTO `article_tags` VALUES (103, 79, 16);
INSERT INTO `article_tags` VALUES (104, 80, 15);
INSERT INTO `article_tags` VALUES (105, 81, 15);
INSERT INTO `article_tags` VALUES (106, 82, 9);
INSERT INTO `article_tags` VALUES (107, 83, 15);
INSERT INTO `article_tags` VALUES (108, 84, 15);
INSERT INTO `article_tags` VALUES (109, 85, 21);
INSERT INTO `article_tags` VALUES (110, 86, 22);
INSERT INTO `article_tags` VALUES (111, 87, 23);
INSERT INTO `article_tags` VALUES (112, 88, 9);
INSERT INTO `article_tags` VALUES (113, 89, 9);
INSERT INTO `article_tags` VALUES (114, 90, 15);
INSERT INTO `article_tags` VALUES (115, 91, 9);
INSERT INTO `article_tags` VALUES (116, 92, 17);
INSERT INTO `article_tags` VALUES (117, 93, 15);
INSERT INTO `article_tags` VALUES (118, 94, 15);
INSERT INTO `article_tags` VALUES (119, 95, 15);
INSERT INTO `article_tags` VALUES (120, 96, 15);
INSERT INTO `article_tags` VALUES (121, 97, 15);
INSERT INTO `article_tags` VALUES (122, 98, 9);
INSERT INTO `article_tags` VALUES (123, 99, 9);
INSERT INTO `article_tags` VALUES (124, 100, 15);
INSERT INTO `article_tags` VALUES (125, 101, 19);
INSERT INTO `article_tags` VALUES (126, 102, 15);
INSERT INTO `article_tags` VALUES (127, 103, 15);
INSERT INTO `article_tags` VALUES (128, 104, 15);
INSERT INTO `article_tags` VALUES (129, 105, 1);
INSERT INTO `article_tags` VALUES (130, 105, 15);
INSERT INTO `article_tags` VALUES (132, 107, 1);
INSERT INTO `article_tags` VALUES (133, 107, 15);
INSERT INTO `article_tags` VALUES (134, 108, 1);
INSERT INTO `article_tags` VALUES (135, 108, 15);
INSERT INTO `article_tags` VALUES (136, 109, 1);
INSERT INTO `article_tags` VALUES (137, 109, 15);
INSERT INTO `article_tags` VALUES (138, 110, 4);
INSERT INTO `article_tags` VALUES (139, 111, 1);
INSERT INTO `article_tags` VALUES (140, 111, 15);
INSERT INTO `article_tags` VALUES (141, 112, 1);
INSERT INTO `article_tags` VALUES (142, 112, 15);
INSERT INTO `article_tags` VALUES (143, 113, 25);
INSERT INTO `article_tags` VALUES (144, 114, 25);
INSERT INTO `article_tags` VALUES (145, 115, 25);
INSERT INTO `article_tags` VALUES (146, 116, 25);
INSERT INTO `article_tags` VALUES (147, 117, 9);
INSERT INTO `article_tags` VALUES (148, 118, 8);
INSERT INTO `article_tags` VALUES (149, 119, 1);
INSERT INTO `article_tags` VALUES (151, 119, 9);
INSERT INTO `article_tags` VALUES (150, 119, 13);
INSERT INTO `article_tags` VALUES (152, 120, 9);
INSERT INTO `article_tags` VALUES (153, 121, 14);
INSERT INTO `article_tags` VALUES (154, 122, 5);
INSERT INTO `article_tags` VALUES (155, 123, 14);
INSERT INTO `article_tags` VALUES (156, 124, 15);
INSERT INTO `article_tags` VALUES (157, 125, 20);
INSERT INTO `article_tags` VALUES (158, 126, 8);
INSERT INTO `article_tags` VALUES (159, 127, 15);
INSERT INTO `article_tags` VALUES (160, 128, 15);
INSERT INTO `article_tags` VALUES (161, 129, 22);
INSERT INTO `article_tags` VALUES (162, 130, 9);
INSERT INTO `article_tags` VALUES (163, 131, 22);
INSERT INTO `article_tags` VALUES (164, 132, 22);
INSERT INTO `article_tags` VALUES (165, 133, 22);
INSERT INTO `article_tags` VALUES (166, 134, 1);
INSERT INTO `article_tags` VALUES (167, 135, 1);
INSERT INTO `article_tags` VALUES (168, 136, 1);
INSERT INTO `article_tags` VALUES (169, 137, 1);
INSERT INTO `article_tags` VALUES (170, 138, 20);
INSERT INTO `article_tags` VALUES (171, 139, 26);
INSERT INTO `article_tags` VALUES (172, 140, 25);
INSERT INTO `article_tags` VALUES (173, 141, 9);
INSERT INTO `article_tags` VALUES (174, 142, 1);
INSERT INTO `article_tags` VALUES (175, 142, 3);
INSERT INTO `article_tags` VALUES (176, 143, 20);
INSERT INTO `article_tags` VALUES (177, 144, 15);

SET FOREIGN_KEY_CHECKS = 1;
