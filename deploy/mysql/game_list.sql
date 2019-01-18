/*
Navicat MySQL Data Transfer

Source Server         : intest
Source Server Version : 50638
Source Host           : 39.108.135.212:3306
Source Database       : dstars_jingcai

Target Server Type    : MYSQL
Target Server Version : 50638
File Encoding         : 65001

Date: 2018-12-20 17:33:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `game_list`
-- ----------------------------
DROP TABLE IF EXISTS `game_list`;
CREATE TABLE `game_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL DEFAULT '0' COMMENT '竞猜APPID',
  `gameid` int(11) NOT NULL DEFAULT '0' COMMENT '竞猜APP拥有的游戏ID',
  `name` varchar(30) NOT NULL DEFAULT '',
  `power` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用，算期号',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示 1显示 0不 2代开放',
  `created_date` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bet_max` int(11) NOT NULL DEFAULT '0' COMMENT '投注上线',
  `ctype` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型 1小游戏 2cp 3外接',
  `href` varchar(200) NOT NULL DEFAULT '' COMMENT '外接游戏url',
  `icon` varchar(200) NOT NULL DEFAULT '' COMMENT '游戏ICON',
  PRIMARY KEY (`id`),
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of game_list
-- ----------------------------
INSERT INTO `game_list` VALUES ('21', '12', '3101002', '百人牛牛', '12', '1', '1', '2018-01-25 13:19:00', '2018-12-14 17:24:06', '10000', '1', '', '');
INSERT INTO `game_list` VALUES ('22', '12', '3101001', '骰宝', '16', '1', '1', '2017-10-23 11:30:45', '2018-12-04 19:39:51', '10000', '1', '', '');
INSERT INTO `game_list` VALUES ('27', '12', '3101005', '龙虎大战', '11', '1', '1', '2017-10-23 11:30:55', '2018-12-10 14:36:47', '5000', '1', '', '');
INSERT INTO `game_list` VALUES ('28', '12', '3101006', '红黑大战', '15', '1', '1', '2017-10-23 11:30:55', '2018-12-04 20:15:10', '10000', '1', '', '');
INSERT INTO `game_list` VALUES ('29', '12', '3101007', '百家乐', '14', '1', '1', '2017-10-23 11:30:55', '2018-12-05 15:26:05', '0', '1', '', '');
INSERT INTO `game_list` VALUES ('30', '12', '3101101', '六合彩', '13', '0', '0', '2017-10-23 11:30:55', '2018-12-17 12:07:14', '1', '2', '', '');
INSERT INTO `game_list` VALUES ('32', '12', '4101002', '金蟾捕鱼', '42', '0', '1', '2017-10-23 11:30:55', '2018-12-14 16:44:41', '1000', '3', 'https://buyu.iyougame.com:18080/jcfish/index.html?uid=[uid]&token=[token]&ncode=[uname]&sign=[sign]&backurl=[backurl] ', '');
INSERT INTO `game_list` VALUES ('33', '12', '4101003', '悟空闹海', '43', '0', '1', '2017-10-23 11:30:55', '2018-12-13 17:07:40', '0', '3', 'https://buyu.iyougame.com:18080/wkfish/index.html?uid=[uid]&token=[token]&ncode=[uname]&sign=[sign]&backurl=[backurl]', '');
INSERT INTO `game_list` VALUES ('34', '12', '3101008', '水果机', '17', '1', '1', '2017-10-23 11:30:55', '2018-10-29 15:49:39', '0', '1', '', '');
INSERT INTO `game_list` VALUES ('35', '12', '3101009', '奔驰宝马', '18', '1', '1', '2017-10-23 11:30:55', '2018-11-30 18:19:52', '0', '1', '', '');
INSERT INTO `game_list` VALUES ('36', '12', '3101102', '北京pk10', '19', '0', '1', '2017-10-23 11:30:55', '2018-12-14 17:24:17', '0', '2', '', '');
INSERT INTO `game_list` VALUES ('37', '12', '3101103', '重庆时时彩', '20', '0', '1', '2017-10-23 11:30:55', '2018-12-10 20:13:22', '0', '2', '', '');
INSERT INTO `game_list` VALUES ('38', '12', '3102001', '抢庄牛牛4人版', '21', '0', '1', '2017-10-23 11:30:55', '2018-11-30 18:19:50', '0', '1', '', '');
INSERT INTO `game_list` VALUES ('39', '12', '3101104', '新疆时时彩', '20', '0', '1', '2017-10-23 11:30:55', '2018-12-10 20:13:24', '0', '2', '', '');
INSERT INTO `game_list` VALUES ('40', '12', '3101105', '腾讯分分彩', '20', '0', '1', '2017-10-23 11:30:55', '2018-12-14 17:24:24', '0', '2', '', '');
INSERT INTO `game_list` VALUES ('41', '12', '3101106', '极速六合彩', '20', '0', '1', '2017-10-23 11:30:55', '2018-12-10 20:13:27', '0', '2', '', '');
INSERT INTO `game_list` VALUES ('42', '12', '3101010', '推筒子', '18', '1', '1', '2017-10-23 11:30:55', '2018-11-19 17:55:56', '0', '1', '', '');
INSERT INTO `game_list` VALUES ('43', '12', '3101011', '欢乐至尊', '18', '1', '1', '2017-10-23 11:30:55', '2018-12-06 14:17:19', '0', '1', '', '');
INSERT INTO `game_list` VALUES ('44', '12', '3101107', '广东十一选五', '20', '0', '1', '2017-10-23 11:30:55', '2018-12-10 20:13:31', '0', '2', '', '');
INSERT INTO `game_list` VALUES ('45', '12', '3101108', '极速赛车', '20', '0', '1', '2017-10-23 11:30:55', '2018-12-10 20:13:32', '0', '2', '', '');
INSERT INTO `game_list` VALUES ('46', '12', '3101109', '幸运飞艇', '20', '0', '1', '2017-10-23 11:30:55', '2018-12-10 20:13:38', '0', '2', '', '');
INSERT INTO `game_list` VALUES ('47', '12', '3101110', '山东十一选五', '20', '0', '1', '2017-10-23 11:30:55', '2018-12-10 20:13:37', '0', '2', '', '');
INSERT INTO `game_list` VALUES ('48', '12', '3101111', '江西十一选五', '20', '0', '1', '2017-10-23 11:30:55', '2018-12-10 20:13:40', '0', '2', '', '');
INSERT INTO `game_list` VALUES ('49', '12', '3101112', '上海十一选五', '20', '0', '1', '2017-10-23 11:30:55', '2018-12-19 15:37:29', '0', '2', '', '');
INSERT INTO `game_list` VALUES ('50', '12', '3101113', '安徽十一选五', '20', '0', '1', '2017-10-23 11:30:55', '2018-12-10 20:14:40', '0', '2', '', '');
INSERT INTO `game_list` VALUES ('51', '12', '3101100', '彩票合集', '12', '0', '1', '2017-10-23 11:30:55', '2018-12-17 14:23:21', '0', '2', '', '');
INSERT INTO `game_list` VALUES ('58', '12', '4101004', 'master option币', '44', '0', '1', '0000-00-00 00:00:00', '2018-12-14 09:48:01', '0', '3', 'http://www.masteroption.com/#/mobileMainpage?app=[app]&account=[uid]&token=[token]&uname=[uname]&ch=[ch]&appid=[appid]&backurl=[backurl]', '');
INSERT INTO `dstars_jingcai`.`game_list`( `app_id`, `gameid`, `name`, `power`, `status`, `is_show`, `created_date`, `update_date`, `bet_max`, `ctype`, `href`, `icon`) VALUES ( 12, 3102002, '抢庄牛牛2人版', 19, 0, 1, '2017-10-23 11:30:55', '2018-12-25 11:07:30', 0, 1, '', '');