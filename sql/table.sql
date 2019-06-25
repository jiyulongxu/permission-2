/*
Navicat MySQL Data Transfer

Source Server         : 123.206.82.234
Source Server Version : 50724
Source Host           : 123.206.82.234:3306
Source Database       : permission

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-06-18 15:15:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) DEFAULT NULL COMMENT '权限名称',
  `icon` varchar(255) DEFAULT '' COMMENT '图标',
  `url` varchar(255) DEFAULT NULL COMMENT '资源路径',
  `spread` tinyint(255) DEFAULT NULL COMMENT '是否默认展开',
  `parent_id` int(11) DEFAULT '0' COMMENT '父编号',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限字符串',
  `type` int(11) DEFAULT '0' COMMENT '资源类型:0目录 1菜单 2按钮',
  `status` int(11) DEFAULT '1' COMMENT '用户状态：1有效2删除',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '主页', '', '/index', '0', '0', 'index', '0', '1', '');
INSERT INTO `sys_permission` VALUES ('2', '后台首页', 'icon-computer', '/page/main', '0', '0', 'computer', '1', '1', '');
INSERT INTO `sys_permission` VALUES ('3', '文章列表', 'icon-text', '/page/news/newsList', '0', '0', 'text', '1', '1', '');
INSERT INTO `sys_permission` VALUES ('4', '友情链接', '&#xe64c;', '/page/links/linksList', '0', '0', 'link', '1', '1', '');
INSERT INTO `sys_permission` VALUES ('5', '系统基本参数', '&#xe631;', 'page/systemParameter/systemParameter', '0', '0', 'parameter', '1', '1', '');
INSERT INTO `sys_permission` VALUES ('6', '其他页面', '&#xe630;', '', '0', '0', 'other', '1', '1', '');
INSERT INTO `sys_permission` VALUES ('7', '404页面', '&#xe61c;', '/page/404', '0', '6', '404', '1', '1', '');
INSERT INTO `sys_permission` VALUES ('8', '登录', '&#xe609;', '/page/login/login', '0', '6', 'login', '1', '1', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色名',
  `role` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'admin', '1', '管理员');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `permission_id` int(11) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '1', '1');
INSERT INTO `sys_role_permission` VALUES ('3', '1', '3');
INSERT INTO `sys_role_permission` VALUES ('4', '1', '4');
INSERT INTO `sys_role_permission` VALUES ('5', '1', '5');
INSERT INTO `sys_role_permission` VALUES ('6', '1', '6');
INSERT INTO `sys_role_permission` VALUES ('7', '1', '7');
INSERT INTO `sys_role_permission` VALUES ('8', '1', '8');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) DEFAULT NULL COMMENT '盐',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) DEFAULT '' COMMENT '联系方式',
  `sex` int(11) DEFAULT '0' COMMENT '性别',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'e9e38f4785af638faee697314387606d', '8A0SUW+RWGipDZgEevhplg==', null, '', '0', null, null, null, null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1');