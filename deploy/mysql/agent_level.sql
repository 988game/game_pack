/*
Navicat MySQL Data Transfer

Source Server         : intest
Source Server Version : 50638
Source Host           : 39.108.135.212:3306
Source Database       : dstars_jingcai

Target Server Type    : MYSQL
Target Server Version : 50638
File Encoding         : 65001

Date: 2018-12-20 17:31:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `agent_level`
-- ----------------------------
DROP TABLE IF EXISTS `agent_level`;
CREATE TABLE `agent_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `min_point` int(11) NOT NULL,
  `max_point` int(11) NOT NULL,
  `commi` int(11) NOT NULL DEFAULT '0' COMMENT '每万返佣',
  `info` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COMMENT='代理级别';

-- ----------------------------
-- Records of agent_level
-- ----------------------------
INSERT INTO `agent_level` VALUES ('1', '12', '新手', '100', '2000', '30', '每万返佣30元');
INSERT INTO `agent_level` VALUES ('2', '12', '市场专员', '2000', '5000', '40', '每万返佣40元');
INSERT INTO `agent_level` VALUES ('3', '12', '见习会员', '5000', '10000', '50', '每万返佣50元');
INSERT INTO `agent_level` VALUES ('4', '12', '初级会员', '10000', '50000', '60', '每万返佣60元');
INSERT INTO `agent_level` VALUES ('5', '12', '中级会员', '50000', '110000', '70', '每万返佣70元');
INSERT INTO `agent_level` VALUES ('6', '12', '高级会员', '110000', '210000', '80', '每万返佣80元');
INSERT INTO `agent_level` VALUES ('7', '12', '代理', '210000', '510000', '90', '每万返佣90元');
INSERT INTO `agent_level` VALUES ('8', '12', '区域代理', '510000', '1010000', '100', '每万返佣100元');
INSERT INTO `agent_level` VALUES ('9', '12', '市场总代', '1010000', '2010000', '120', '每万返佣120元');
INSERT INTO `agent_level` VALUES ('10', '12', '监事', '2010000', '4010000', '140', '每万返佣140元');
INSERT INTO `agent_level` VALUES ('11', '12', '副总监', '4010000', '6010000', '160', '每万返佣160元');
INSERT INTO `agent_level` VALUES ('12', '12', '总监', '6010000', '8010000', '180', '每万返佣180元');
INSERT INTO `agent_level` VALUES ('13', '12', '副经理', '8010000', '10010000', '200', '每万返佣200元');
INSERT INTO `agent_level` VALUES ('14', '12', '总经理', '10010000', '0', '220', '每万返佣220元');
