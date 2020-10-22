/*
 Navicat Premium Data Transfer

 Source Server         : 个人数据库
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 22/10/2020 10:31:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for a_copy_tb
-- ----------------------------
DROP TABLE IF EXISTS `a_copy_tb`;
CREATE TABLE `a_copy_tb`  (
  `a_id` int(11) NOT NULL,
  `a_u_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a_copy_tb
-- ----------------------------
INSERT INTO `a_copy_tb` VALUES (1, '1');
INSERT INTO `a_copy_tb` VALUES (2, '2,3');
INSERT INTO `a_copy_tb` VALUES (3, '1,3');
INSERT INTO `a_copy_tb` VALUES (4, '1,2,3');

-- ----------------------------
-- Table structure for a_tb
-- ----------------------------
DROP TABLE IF EXISTS `a_tb`;
CREATE TABLE `a_tb`  (
  `a_id` int(11) NOT NULL,
  `a_u_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a_tb
-- ----------------------------
INSERT INTO `a_tb` VALUES (1, '1');
INSERT INTO `a_tb` VALUES (2, '2,3');
INSERT INTO `a_tb` VALUES (3, '1,3');
INSERT INTO `a_tb` VALUES (4, '1,2,3');

-- ----------------------------
-- Table structure for b_tb
-- ----------------------------
DROP TABLE IF EXISTS `b_tb`;
CREATE TABLE `b_tb`  (
  `b_id` int(11) NOT NULL,
  `b_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`b_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_tb
-- ----------------------------
INSERT INTO `b_tb` VALUES (1, '赵大');
INSERT INTO `b_tb` VALUES (2, '王二');
INSERT INTO `b_tb` VALUES (3, '张三');
INSERT INTO `b_tb` VALUES (4, '李四');

-- ----------------------------
-- Table structure for sc_menu_role_tb
-- ----------------------------
DROP TABLE IF EXISTS `sc_menu_role_tb`;
CREATE TABLE `sc_menu_role_tb`  (
  `menu_no` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单NO',
  `role_no` int(11) NOT NULL DEFAULT 0 COMMENT '职位No',
  `is_open` int(1) NOT NULL DEFAULT 1,
  `create_time` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成时间',
  `update_time` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sc_menu_role_tb
-- ----------------------------
INSERT INTO `sc_menu_role_tb` VALUES ('#AI0001', 1, 1, NULL, NULL);
INSERT INTO `sc_menu_role_tb` VALUES ('#AI0002', 1, 1, NULL, NULL);
INSERT INTO `sc_menu_role_tb` VALUES ('#AI00021', 1, 1, NULL, NULL);
INSERT INTO `sc_menu_role_tb` VALUES ('#AI00022', 1, 1, NULL, NULL);
INSERT INTO `sc_menu_role_tb` VALUES ('#AI000', 2, 1, '2019-09-20 14:32:04', NULL);
INSERT INTO `sc_menu_role_tb` VALUES ('#AI0002', 2, 1, '2019-09-20 14:32:04', NULL);
INSERT INTO `sc_menu_role_tb` VALUES ('#AI00021', 2, 1, '2019-09-20 14:32:04', NULL);
INSERT INTO `sc_menu_role_tb` VALUES ('#AI00022', 2, 1, '2019-09-20 14:32:04', NULL);

-- ----------------------------
-- Table structure for sc_menu_tb
-- ----------------------------
DROP TABLE IF EXISTS `sc_menu_tb`;
CREATE TABLE `sc_menu_tb`  (
  `menu_no` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单ID',
  `menu_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'menu' COMMENT '菜单名称',
  `parent_no` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '#AI0000' COMMENT '上级菜单ID',
  `menu_desc` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单中文标识',
  `menu_level` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`menu_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sc_menu_tb
-- ----------------------------
INSERT INTO `sc_menu_tb` VALUES ('#AI0001', 'index', '#AI0000', '首页', 1);
INSERT INTO `sc_menu_tb` VALUES ('#AI0002', 'person', '#AI0000', '人员管理', 1);
INSERT INTO `sc_menu_tb` VALUES ('#AI00021', 'manage', '#AI0002', '人员信息', 2);
INSERT INTO `sc_menu_tb` VALUES ('#AI00022', 'role', '#AI0002', '权限管理', 2);

-- ----------------------------
-- Table structure for sc_role_tb
-- ----------------------------
DROP TABLE IF EXISTS `sc_role_tb`;
CREATE TABLE `sc_role_tb`  (
  `role_no` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '超级管理员' COMMENT '职位名称',
  `role_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_open` int(1) NOT NULL DEFAULT 1,
  `create_time` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`role_no`) USING BTREE,
  UNIQUE INDEX `role_name`(`role_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sc_role_tb
-- ----------------------------
INSERT INTO `sc_role_tb` VALUES (1, '超级管理员', '拥有全部权限的用户', 1, '2019-07-02 09:16:56', NULL);
INSERT INTO `sc_role_tb` VALUES (2, '总经理', '拥有大部分权限', 1, '2019-07-03 09:16:56', NULL);
INSERT INTO `sc_role_tb` VALUES (3, '测试', NULL, 1, '2019-07-03 09:16:56', NULL);
INSERT INTO `sc_role_tb` VALUES (4, '普通员工', NULL, 1, NULL, NULL);

-- ----------------------------
-- Table structure for sc_user_tb
-- ----------------------------
DROP TABLE IF EXISTS `sc_user_tb`;
CREATE TABLE `sc_user_tb`  (
  `user_no` int(11) NOT NULL AUTO_INCREMENT,
  `auto_name` varchar(127) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `create_time` varchar(127) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户生成时间',
  `update_time` varchar(127) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息修改时间',
  `is_open` int(1) NULL DEFAULT 1,
  `group_status` int(1) NOT NULL DEFAULT 0 COMMENT '分组状态',
  `user_phone` varchar(127) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话',
  `user_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户地址',
  `user_email` varchar(127) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `role_no` int(11) NOT NULL DEFAULT 4 COMMENT '该用户的No',
  PRIMARY KEY (`user_no`) USING BTREE,
  UNIQUE INDEX `user_name`(`auto_name`) USING BTREE COMMENT '人员名称'
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '人员信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sc_user_tb
-- ----------------------------
INSERT INTO `sc_user_tb` VALUES (1, 'admin', 'oZVYDNXRjJd+uoDv/pGjJQ==', '2019/07/02', '2019-07-03 09:25:41', 1, 1, '15857191706', '杭州', '1422189@qq.com', '男', 'admin', 1);
INSERT INTO `sc_user_tb` VALUES (2, 'zhugaopo', 'oZVYDNXRjJd+uoDv/pGjJQ==', '2019-08-14 15:16:52', NULL, 1, 0, '1234567', '浙江杭州', '未设置', '未设置', 'zhugaopo', 1);
INSERT INTO `sc_user_tb` VALUES (3, 'user1', 'WgmuiVeZRbergKncCPZvqg==', '2019-08-16 10:02:52', NULL, 1, 0, '1234567', '浙江杭州', '未设置', '未设置', 'user1', 1);
INSERT INTO `sc_user_tb` VALUES (4, 'user2', 'WgmuiVeZRbergKncCPZvqg==', '2019-08-16 10:03:08', '2019-08-21 15:31:50', 1, 0, '1234567', '浙江杭州', '未设置', '未设置', 'user2', 5);
INSERT INTO `sc_user_tb` VALUES (5, 'user3', 'WgmuiVeZRbergKncCPZvqg==', '2019-08-16 10:18:39', '2019-08-21 15:32:31', 1, 0, '1234567', '浙江杭州', '未设置', '未设置', 'user3', 6);
INSERT INTO `sc_user_tb` VALUES (6, '黄勃', 'WgmuiVeZRbergKncCPZvqg==', '2019-08-21 13:35:00', NULL, 1, 0, '1234567', '浙江杭州', '未设置', '未设置', '黄勃', 5);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL,
  `numberCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stuName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stuSex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男',
  `stuAge` int(255) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '20200101', '张三1', '男', 10);
INSERT INTO `student` VALUES (2, '20200102', '张三2', '男', 10);
INSERT INTO `student` VALUES (3, '20200103', '张三3', '男', 10);

-- ----------------------------
-- Table structure for t_score_tb
-- ----------------------------
DROP TABLE IF EXISTS `t_score_tb`;
CREATE TABLE `t_score_tb`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scores` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_score_tb
-- ----------------------------
INSERT INTO `t_score_tb` VALUES (1, '100');
INSERT INTO `t_score_tb` VALUES (2, '100');
INSERT INTO `t_score_tb` VALUES (3, '90');
INSERT INTO `t_score_tb` VALUES (4, '80');
INSERT INTO `t_score_tb` VALUES (5, '80');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_age` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', '20');
INSERT INTO `t_user` VALUES (2, 'robot', '21');

-- ----------------------------
-- View structure for sc_menu_role_v
-- ----------------------------
DROP VIEW IF EXISTS `sc_menu_role_v`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `sc_menu_role_v` AS select `t1`.`menu_no` AS `MENU_NO`,`t1`.`menu_name` AS `MENU_NAME`,`t1`.`parent_no` AS `PARENT_NO`,`t1`.`menu_desc` AS `MENU_DESC`,`t1`.`menu_level` AS `MENU_LEVEL`,`t2`.`role_no` AS `ROLE_NO` from ((`sc_menu_tb` `t1` join `sc_role_tb` `t2`) join `sc_menu_role_tb` `t3`) where ((`t1`.`menu_no` = `t3`.`menu_no`) and (`t2`.`role_no` = `t3`.`role_no`));

SET FOREIGN_KEY_CHECKS = 1;
