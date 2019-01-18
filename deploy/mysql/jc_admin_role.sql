/*
Navicat MySQL Data Transfer

Source Server         : intest
Source Server Version : 50638
Source Host           : 39.108.135.212:3306
Source Database       : dstars_jingcai

Target Server Type    : MYSQL
Target Server Version : 50638
File Encoding         : 65001

Date: 2018-12-20 17:34:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `jc_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `jc_admin_role`;
CREATE TABLE `jc_admin_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '角色名字',
  `description` varchar(500) NOT NULL COMMENT '详细介绍',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0 可用 1不可用',
  `menus` varchar(2000) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='后台角色表';

-- ----------------------------
-- Records of jc_admin_role
-- ----------------------------
INSERT INTO `jc_admin_role` VALUES ('1', '系统管理员', '系统管理员', '0', '4,48,49,101,117,103,65,98,82,105,51,52,106,79,80,81,53,54,77,102,110,73,109,70,99,108,84,85,86,87,88,89,94,118,95,119,120,100,121,122,74,75,76,72,107,113,78,114,115,5,6,19,20,21,97,62,116', '0000-00-00 00:00:00', '2018-12-13 19:04:36');
