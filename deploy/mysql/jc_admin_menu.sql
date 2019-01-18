/*
Navicat MySQL Data Transfer

Source Server         : intest
Source Server Version : 50638
Source Host           : 39.108.135.212:3306
Source Database       : dstars_jingcai

Target Server Type    : MYSQL
Target Server Version : 50638
File Encoding         : 65001

Date: 2018-12-20 17:34:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `jc_admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `jc_admin_menu`;
CREATE TABLE `jc_admin_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL DEFAULT '#' COMMENT '前端地址',
  `classname` varchar(50) NOT NULL DEFAULT '' COMMENT '后端验证类',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父节点',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0 可用 1不可用',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序 正序',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '前端图标',
  `ispage` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是页面',
  PRIMARY KEY (`id`),
  KEY `ix_url` (`url`) USING BTREE,
  KEY `classname` (`classname`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COMMENT='后端菜单';

-- ----------------------------
-- Records of jc_admin_menu
-- ----------------------------
INSERT INTO `jc_admin_menu` VALUES ('4', '运营平台', '', '', '0', '0', '1', 'logo-wordpress', '1');
INSERT INTO `jc_admin_menu` VALUES ('5', '管理中心', '', '', '0', '0', '2', 'edit', '1');
INSERT INTO `jc_admin_menu` VALUES ('6', '系统管理', 'system', '6666', '5', '0', '1', 'shuffle', '1');
INSERT INTO `jc_admin_menu` VALUES ('8', '各应用数据', '#', '123', '1', '0', '1', 'log-in', '0');
INSERT INTO `jc_admin_menu` VALUES ('9', '运营数据', '#', '123', '1', '0', '2', 'log-in', '0');
INSERT INTO `jc_admin_menu` VALUES ('10', '运营活动', '#', '123', '1', '0', '3', 'log-in', '0');
INSERT INTO `jc_admin_menu` VALUES ('11', '渠道数据', '#', '123', '1', '0', '4', 'log-in', '0');
INSERT INTO `jc_admin_menu` VALUES ('19', '角色管理', '/home/administerMenu/roleAdminister', 'adminrole', '6', '0', '1', 'ios-alert', '1');
INSERT INTO `jc_admin_menu` VALUES ('20', '后台用户管理', '/home/administerMenu/backstageUserAdminister', 'adminmanager', '6', '0', '2', 'ios-alert', '1');
INSERT INTO `jc_admin_menu` VALUES ('21', '菜单管理', '/home/administerMenu/menuAdminister', 'adminmenu', '6', '0', '3', 'ios-alert', '1');
INSERT INTO `jc_admin_menu` VALUES ('27', '兑换数量', '/home/rodeoTime/eachExchange', '123', '14', '0', '1', 'help-circled', '1');
INSERT INTO `jc_admin_menu` VALUES ('28', '奖率监控', '/home/riskControl/cycleReturn', '123', '15', '0', '1', 'help-circled', '1');
INSERT INTO `jc_admin_menu` VALUES ('29', '用户返奖率', '/home/riskControl/userAwards', '123', '16', '0', '1', 'help-circled', '1');
INSERT INTO `jc_admin_menu` VALUES ('30', '赔率设置', '/home/riskControl/userAwards', '123', '13', '0', '1', 'help-circled', '1');
INSERT INTO `jc_admin_menu` VALUES ('31', '返奖率列表', '/home/riskControl/userAwards', '', '8', '0', '1', 'help-circled', '1');
INSERT INTO `jc_admin_menu` VALUES ('32', '环比昨日新增', '/home/dataReport/yesterdayNew', '123', '9', '0', '1', 'help-circled', '1');
INSERT INTO `jc_admin_menu` VALUES ('33', '星币消耗', '/home/dataReport/activityList', '123', '10', '0', '1', 'help-circled', '1');
INSERT INTO `jc_admin_menu` VALUES ('34', '渠道消耗列表', '/home/dataReport/activityList', '123', '11', '0', '1', 'help-circled', '1');
INSERT INTO `jc_admin_menu` VALUES ('35', '选择竞猜场次', '/home/rodeoTime/selectField', '123', '12', '0', '1', 'star', '1');
INSERT INTO `jc_admin_menu` VALUES ('37', '查看流水', '/home/mallAdminister/viewWater', '', '17', '1', '2', 'plus', '1');
INSERT INTO `jc_admin_menu` VALUES ('46', '资金管理', 'money', 'money', '4', '1', '6', 'arrow-graph-up-right', '1');
INSERT INTO `jc_admin_menu` VALUES ('47', '明细列表', '/home/mallAdminister/moneyMan', 'point-manager', '46', '1', '1', 'asterisk', '1');
INSERT INTO `jc_admin_menu` VALUES ('48', '运营数据', 'data', '', '4', '0', '1', 'ios-stats', '1');
INSERT INTO `jc_admin_menu` VALUES ('49', '重要数据汇总', '/home/mallAdminister/datacollect', 'managerdata', '48', '0', '1', 'md-trending-up', '1');
INSERT INTO `jc_admin_menu` VALUES ('51', '用户管理', 'user', 'inquire', '4', '0', '2', 'ios-people', '1');
INSERT INTO `jc_admin_menu` VALUES ('52', '玩家列表', '/home/mallAdminister/userslist', 'manageruser', '51', '0', '1', 'ios-person', '1');
INSERT INTO `jc_admin_menu` VALUES ('53', '财务系统', 'finance', 'finance', '4', '0', '4', 'logo-usd', '1');
INSERT INTO `jc_admin_menu` VALUES ('54', '提现审批', '/home/mallAdminister/approvallist', 'managerputforward', '53', '0', '1', 'md-add', '1');
INSERT INTO `jc_admin_menu` VALUES ('55', '结算设置', '/home/mallAdminister/bankcardbind', 'managerBank', '53', '1', '2', 'md-add', '1');
INSERT INTO `jc_admin_menu` VALUES ('56', '账号结算', '/home/mallAdminister/accountsettlement', 'managerBalance', '53', '1', '3', 'md-add', '1');
INSERT INTO `jc_admin_menu` VALUES ('59', '代理查询', '/home/mallAdminister/agentmanage', 'manageragent', '71', '0', '3', 'navicon-round', '1');
INSERT INTO `jc_admin_menu` VALUES ('62', '操作日志', '/home/administerMenu/managerAdminlog', 'managerAdminlog', '6', '0', '5', 'ios-alert', '1');
INSERT INTO `jc_admin_menu` VALUES ('63', 'VIP信息配置', '/home/mallAdminister/paytype', 'managerPayType', '73', '1', '1', 'md-megaphone', '1');
INSERT INTO `jc_admin_menu` VALUES ('64', '奖池设置', '/home/mallAdminister/cashpool', 'managerCashPool', '72', '1', '1', 'ios-construct', '1');
INSERT INTO `jc_admin_menu` VALUES ('65', '游戏类别数据', '/home/mallAdminister/gamedata', 'managerGameData', '48', '0', '5', 'md-trending-up', '1');
INSERT INTO `jc_admin_menu` VALUES ('66', '玩家新增', '/home/mallAdminister/adduser', 'managerAddUser', '48', '1', '4', 'md-trending-up', '1');
INSERT INTO `jc_admin_menu` VALUES ('67', '支付信息查询', 'payInfo', 'managerPayInfo', '4', '1', '9', 'logo-yen', '1');
INSERT INTO `jc_admin_menu` VALUES ('68', '代理数据统计', '/home/mallAdminister/agentsearch', 'manageragent', '71', '0', '4', 'navicon-round', '1');
INSERT INTO `jc_admin_menu` VALUES ('69', '活跃玩家查询', '/home/mallAdminister/usersearch', 'manageruser', '51', '1', '2', 'navicon-round', '1');
INSERT INTO `jc_admin_menu` VALUES ('70', '广播消息设置', '/home/mallAdminister/activemessage', 'managerActiveMessage', '73', '0', '3', 'md-megaphone', '1');
INSERT INTO `jc_admin_menu` VALUES ('71', '代理管理', 'inquire', 'inquire', '4', '1', '2', 'android-search', '1');
INSERT INTO `jc_admin_menu` VALUES ('72', '风控管理', 'risk', 'cashpool', '4', '0', '8', 'logo-linkedin', '1');
INSERT INTO `jc_admin_menu` VALUES ('73', '信息配置', 'message', 'notice', '4', '0', '5', 'md-volume-down', '1');
INSERT INTO `jc_admin_menu` VALUES ('74', '捕鱼管理', 'fish', 'outCapital', '4', '0', '7', 'logo-skype', '1');
INSERT INTO `jc_admin_menu` VALUES ('75', '资金兑换记录', '/home/mallAdminister/capitalrecord', 'managerExtren', '74', '0', '1', 'ios-crop', '1');
INSERT INTO `jc_admin_menu` VALUES ('76', '兑换详细信息查询', '/home/mallAdminister/capitaldetail', 'managerExtren', '74', '0', '2', 'ios-crop', '1');
INSERT INTO `jc_admin_menu` VALUES ('77', '支付订单查询', '/home/mallAdminister/paysearch', 'managerPayInfo', '53', '0', '2', 'md-add', '1');
INSERT INTO `jc_admin_menu` VALUES ('78', '返佣配置', '/home/mallAdminister/rateset', 'managerAgentLevel', '72', '0', '7', 'ios-construct', '1');
INSERT INTO `jc_admin_menu` VALUES ('79', '渠道管理', 'pack', '', '4', '0', '3', 'ios-send', '1');
INSERT INTO `jc_admin_menu` VALUES ('80', '渠道列表', '/home/mallAdminister/packlist', 'managerPackList', '79', '0', '1', 'ios-cafe', '1');
INSERT INTO `jc_admin_menu` VALUES ('81', '渠道账户管理', '/home/mallAdminister/packuserlist', 'managerPackUserList', '79', '0', '2', 'ios-cafe', '1');
INSERT INTO `jc_admin_menu` VALUES ('82', '渠道常规数据', '/home/mallAdminister/packdata', 'managerpackData', '48', '0', '7', 'md-trending-up', '1');
INSERT INTO `jc_admin_menu` VALUES ('83', '渠道汇总', '/home/mallAdminister/packcollect', 'managerpackCollect', '79', '1', '3', 'ios-cafe', '1');
INSERT INTO `jc_admin_menu` VALUES ('84', '彩票管理', 'lottery', 'lottery', '4', '0', '6', 'ios-medal', '1');
INSERT INTO `jc_admin_menu` VALUES ('85', '彩票盈亏统计', '/home/mallAdminister/lotterystat', 'managerLotteryStat', '84', '0', '1', 'ios-paper', '1');
INSERT INTO `jc_admin_menu` VALUES ('86', '开奖信息管理', '/home/mallAdminister/lotteryrun', 'managerLotteryRun', '84', '0', '3', 'ios-paper', '1');
INSERT INTO `jc_admin_menu` VALUES ('87', '彩种赔率查询', '/home/mallAdminister/lotteryrate', 'managerLotteryRate', '84', '0', '5', 'ios-paper', '1');
INSERT INTO `jc_admin_menu` VALUES ('88', '彩种投注限制查询', '/home/mallAdminister/lotterylimit', 'managerLotteryLimit', '84', '0', '7', 'ios-paper', '1');
INSERT INTO `jc_admin_menu` VALUES ('89', '彩种订单查询', '/home/mallAdminister/lotteryorder', 'managerLotteryOrder', '84', '0', '9', 'ios-paper', '1');
INSERT INTO `jc_admin_menu` VALUES ('90', '用户推广管理(未开放)', 'promote', 'promote', '4', '1', '11', 'ios-man', '1');
INSERT INTO `jc_admin_menu` VALUES ('91', '推广内容编辑', '/home/mallAdminister/promoteedit', 'managerPromoteEdit', '90', '1', '1', 'help-circled', '1');
INSERT INTO `jc_admin_menu` VALUES ('92', '推广员返利配置(未开放)', '/home/mallAdminister/managerRateSet', 'managerAgentLevel', '72', '1', '11', 'ios-map', '1');
INSERT INTO `jc_admin_menu` VALUES ('93', '推广员返利列表', 'promote', 'managerAgentLevel', '92', '0', '11', 'ios-world-outline', '1');
INSERT INTO `jc_admin_menu` VALUES ('94', '用户限额管理', '/home/mallAdminister/lotteryuserlimit', 'managerLotteryUserLimit', '84', '0', '11', 'ios-paper', '1');
INSERT INTO `jc_admin_menu` VALUES ('95', '开奖号码变更日志', '/home/mallAdminister/lotterymodifylog', 'managerLotteryModifyLog', '84', '0', '13', 'ios-paper', '1');
INSERT INTO `jc_admin_menu` VALUES ('97', '渠道对账用户管理', '/home/administerMenu/packbalanceuser', 'managerPackBalanceUser', '6', '0', '5', 'ios-alert', '1');
INSERT INTO `jc_admin_menu` VALUES ('98', '业绩佣金明细', '/home/mallAdminister/userrecordlist', 'managerdata', '48', '0', '6', 'md-trending-up', '1');
INSERT INTO `jc_admin_menu` VALUES ('99', '客服信息配置', '/home/mallAdminister/customeService', 'managerCustomeService', '73', '0', '5', 'md-megaphone', '1');
INSERT INTO `jc_admin_menu` VALUES ('100', '彩种管理', '/home/mallAdminister/lotterysetting', 'managerLotterySetting', '84', '0', '16', 'ios-paper', '1');
INSERT INTO `jc_admin_menu` VALUES ('101', '游戏流水明细', '/home/mallAdminister/waterdata', 'managerwaterData', '48', '0', '2', 'md-trending-up', '1');
INSERT INTO `jc_admin_menu` VALUES ('102', '渠道对账明细', '/home/mallAdminister/bankstatement', 'managerbankstatement', '53', '0', '3', 'md-add', '1');
INSERT INTO `jc_admin_menu` VALUES ('103', '活跃玩家列表', '/home/mallAdminister/userbalance', 'managerUserBalance', '48', '0', '4', 'md-trending-up', '1');
INSERT INTO `jc_admin_menu` VALUES ('104', '每日结算明细', '/home/mallAdminister/daycommi', 'managerputforward', '53', '1', '1', 'md-add', '1');
INSERT INTO `jc_admin_menu` VALUES ('105', '渠道盈亏明细', '/home/mallAdminister/packprofit', 'managerpackProfit', '48', '0', '8', 'md-trending-up', '1');
INSERT INTO `jc_admin_menu` VALUES ('106', '玩家推广明细', '/home/mallAdminister/userpromote', 'managerUserPromote', '51', '0', '4', 'ios-person', '1');
INSERT INTO `jc_admin_menu` VALUES ('107', '游戏管理', '/home/mallAdminister/gamesetting', 'managerGameAllList', '72', '0', '3', 'ios-construct', '1');
INSERT INTO `jc_admin_menu` VALUES ('108', '充值信息配置', '/home/mallAdminister/paysetting', 'managerPaySetting', '73', '0', '7', 'md-megaphone', '1');
INSERT INTO `jc_admin_menu` VALUES ('109', 'VIP充值信息配置', '/home/mallAdminister/paytype', 'managerPayType', '73', '0', '1', 'md-megaphone', '1');
INSERT INTO `jc_admin_menu` VALUES ('110', '用户充值', '/home/mallAdminister/userrecharge', 'managerUserreCharge', '53', '0', '5', 'md-add', '1');
INSERT INTO `jc_admin_menu` VALUES ('113', '风控设置', '/home/mallAdminister/risksetting', 'managerCashPool', '72', '0', '5', 'ios-construct', '1');
INSERT INTO `jc_admin_menu` VALUES ('114', '开奖管理', 'guess', '', '4', '0', '9', 'logo-octocat', '1');
INSERT INTO `jc_admin_menu` VALUES ('115', '小游戏开奖结果', '/home/mallAdminister/guessaward', 'managerGameAward', '114', '0', '1', 'ios-nuclear', '1');
INSERT INTO `jc_admin_menu` VALUES ('116', '游戏数据删除', '/home/administerMenu/gamedatadel', 'managerDelGameData', '6', '0', '6', 'ios-game-controller-b', '1');
INSERT INTO `jc_admin_menu` VALUES ('117', '在线玩家列表', '/home/mallAdminister/useractive', 'managerUserBalance', '48', '0', '3', 'md-trending-up', '1');
INSERT INTO `jc_admin_menu` VALUES ('118', '彩票开奖监控', '/home/mallAdminister/lotterymonitor', 'managerLotteryMonitor', '84', '0', '12', 'ios-paper', '1');
INSERT INTO `jc_admin_menu` VALUES ('119', '用户赔率管理', '/home/mallAdminister/lotteryuserrate', 'managerLotteryUserRate', '84', '0', '14', 'ios-paper', '1');
INSERT INTO `jc_admin_menu` VALUES ('120', '六合彩风控', '/home/mallAdminister/lotterysixrisk', 'managerLotterySixRisk', '84', '0', '15', 'ios-paper', '1');
INSERT INTO `jc_admin_menu` VALUES ('121', '彩票玩法管理', '/home/mallAdminister/lotteryplay', 'managerLotteryPlay', '84', '0', '17', 'ios-paper', '1');
INSERT INTO `jc_admin_menu` VALUES ('122', '系统彩风控', '/home/mallAdminister/lotterysysrisk', 'managerLotterySysRisk', '84', '0', '18', 'ios-paper', '1');
