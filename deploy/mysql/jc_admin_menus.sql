/*
Navicat MySQL Data Transfer

Source Server         : intest
Source Server Version : 50638
Source Host           : 39.108.135.212:3306
Source Database       : dstars_jingcai

Target Server Type    : MYSQL
Target Server Version : 50638
File Encoding         : 65001

Date: 2018-12-20 17:34:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `jc_admin_menus`
-- ----------------------------
DROP TABLE IF EXISTS `jc_admin_menus`;
CREATE TABLE `jc_admin_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `func` varchar(50) NOT NULL COMMENT '函数名 mod+func',
  `classname` varchar(50) NOT NULL COMMENT '菜单权限验证',
  PRIMARY KEY (`id`),
  UNIQUE KEY `un_func` (`func`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of jc_admin_menus
-- ----------------------------
INSERT INTO `jc_admin_menus` VALUES ('1', 'jcmanagerGetRoleList', 'adminrole');
INSERT INTO `jc_admin_menus` VALUES ('2', 'jcmanagerGetManagerList', 'adminmanager');
INSERT INTO `jc_admin_menus` VALUES ('3', 'jcmanagerGetRole', 'adminrole');
INSERT INTO `jc_admin_menus` VALUES ('4', 'jcmanagerDelManager', 'adminmanager');
INSERT INTO `jc_admin_menus` VALUES ('5', 'jcmanagerSaveManager', 'adminmanager');
INSERT INTO `jc_admin_menus` VALUES ('6', 'jcmanagerGetMenu', 'adminmenu');
INSERT INTO `jc_admin_menus` VALUES ('7', 'jcmanagerSaveMenu', 'adminmenu');
INSERT INTO `jc_admin_menus` VALUES ('8', 'jcmanagerDelMenu', 'adminmenu');
INSERT INTO `jc_admin_menus` VALUES ('9', 'jcmanagerSaveRole', 'adminrole');
INSERT INTO `jc_admin_menus` VALUES ('11', 'jcmanagerGetData', 'managerdata');
INSERT INTO `jc_admin_menus` VALUES ('12', 'jcmanagerGetUserList', 'manageruser');
INSERT INTO `jc_admin_menus` VALUES ('13', 'jcmanagerBlackAction', 'manageruser');
INSERT INTO `jc_admin_menus` VALUES ('14', 'jcmanagerPointLog', 'manageruser');
INSERT INTO `jc_admin_menus` VALUES ('15', 'jcmanagerGetUserInfo', 'manageruser');
INSERT INTO `jc_admin_menus` VALUES ('16', 'jcmanagerGetUserPoint', 'manageruser');
INSERT INTO `jc_admin_menus` VALUES ('17', 'jcmanagerGetUserBankInfo', 'manageruser');
INSERT INTO `jc_admin_menus` VALUES ('18', 'jcmanagerPutForwardAudit', 'managerputforward');
INSERT INTO `jc_admin_menus` VALUES ('19', 'jcmanagerAddPoint', 'manageruser');
INSERT INTO `jc_admin_menus` VALUES ('20', 'jcmanagerPutAudit', 'managerputforward');
INSERT INTO `jc_admin_menus` VALUES ('21', 'jcmanagerGetBankInfo', 'managerBank');
INSERT INTO `jc_admin_menus` VALUES ('22', 'jcmanagerBindBankInfo', 'managerBank');
INSERT INTO `jc_admin_menus` VALUES ('23', 'jcmanagerGetBalance', 'managerBalance');
INSERT INTO `jc_admin_menus` VALUES ('24', 'jcmanagerActionBalance', 'managerBalance');
INSERT INTO `jc_admin_menus` VALUES ('25', 'jcmanagerAddAgent', 'manageragent');
INSERT INTO `jc_admin_menus` VALUES ('26', 'jcmanagerGetAgentList', 'manageragent');
INSERT INTO `jc_admin_menus` VALUES ('27', 'jcmanagerGetAdminLog', 'managerAdminlog');
INSERT INTO `jc_admin_menus` VALUES ('28', 'jcmanagerGetPayType', 'managerPayType');
INSERT INTO `jc_admin_menus` VALUES ('29', 'jcmanagerActionPayType', 'managerPayType');
INSERT INTO `jc_admin_menus` VALUES ('30', 'jcmanagerGetCashPoolConfig', 'managerCashPool');
INSERT INTO `jc_admin_menus` VALUES ('31', 'jcmanagerGetCashPoolHit', 'managerCashPool');
INSERT INTO `jc_admin_menus` VALUES ('32', 'jcmanagerSetCashPoolConfig', 'managerCashPool');
INSERT INTO `jc_admin_menus` VALUES ('33', 'jcmanagerSetAgentInfo', 'manageragent');
INSERT INTO `jc_admin_menus` VALUES ('34', 'jcmanagerGetDataInfo', 'managerdata');
INSERT INTO `jc_admin_menus` VALUES ('35', 'jcmanagerGetActiveAgent', 'manageragent');
INSERT INTO `jc_admin_menus` VALUES ('36', 'jcmanagerGetActiveUser', 'manageruser');
INSERT INTO `jc_admin_menus` VALUES ('37', 'jcmanagerGetGameData', 'managerGameData');
INSERT INTO `jc_admin_menus` VALUES ('38', 'jcmanagerGetAddUserInfo', 'managerAddUser');
INSERT INTO `jc_admin_menus` VALUES ('39', 'jcmanagerGetActiveMessage', 'managerActiveMessage');
INSERT INTO `jc_admin_menus` VALUES ('40', 'jcmanagerActionActiveMessage', 'managerActiveMessage');
INSERT INTO `jc_admin_menus` VALUES ('41', 'jcmanagerDelActiveMessage', 'managerActiveMessage');
INSERT INTO `jc_admin_menus` VALUES ('42', 'jcmanagerGetExternData', 'managerExtren');
INSERT INTO `jc_admin_menus` VALUES ('43', 'jcmanagerGetExternInfo', 'managerExtren');
INSERT INTO `jc_admin_menus` VALUES ('44', 'jcmanagerGetExternDetails', 'managerExtren');
INSERT INTO `jc_admin_menus` VALUES ('45', 'jcmanagerGetAgentShareInfo', 'manageruser');
INSERT INTO `jc_admin_menus` VALUES ('46', 'jcmanagerGetOrderList', 'managerPayInfo');
INSERT INTO `jc_admin_menus` VALUES ('47', 'jcmanagerUpdateOrder', 'managerPayInfo');
INSERT INTO `jc_admin_menus` VALUES ('48', 'jcmanagerGetShareCfg', 'managerRateSet');
INSERT INTO `jc_admin_menus` VALUES ('49', 'jcmanagerUpdateShareCfg', 'managerRateSet');
INSERT INTO `jc_admin_menus` VALUES ('50', 'jcmanagerGetPackList', 'managerPackList');
INSERT INTO `jc_admin_menus` VALUES ('51', 'jcmanagerAddPack', 'managerPackList');
INSERT INTO `jc_admin_menus` VALUES ('52', 'jcmanagerUpdatePack', 'managerPackList');
INSERT INTO `jc_admin_menus` VALUES ('53', 'jcmanagerGetPackUserList', 'managerPackUserList');
INSERT INTO `jc_admin_menus` VALUES ('54', 'jcmanagerUpdatePackUser', 'managerPackUserList');
INSERT INTO `jc_admin_menus` VALUES ('55', 'jcmanagerAddPackUser', 'managerPackUserList');
INSERT INTO `jc_admin_menus` VALUES ('56', 'jcmanagerGetPackAllList', 'managerPackUserList');
INSERT INTO `jc_admin_menus` VALUES ('57', 'jcmanagerGetTimePackData', 'managerpackData');
INSERT INTO `jc_admin_menus` VALUES ('58', 'jcmanagerGetPackTotal', 'managerpackCollect');
INSERT INTO `jc_admin_menus` VALUES ('64', 'jcmanagerGetLotteryOdd', 'managerLotteryRate');
INSERT INTO `jc_admin_menus` VALUES ('65', 'jcmanagerUpdateLotteryOdd', 'managerLotteryRate');
INSERT INTO `jc_admin_menus` VALUES ('66', 'jcmanagerGetLotteryCfg', 'managerLotteryLimit');
INSERT INTO `jc_admin_menus` VALUES ('67', 'jcmanagerUpdateLotteryCfg', 'managerLotteryLimit');
INSERT INTO `jc_admin_menus` VALUES ('68', 'jcmanagerGetLotteryQh', 'managerLotteryRun');
INSERT INTO `jc_admin_menus` VALUES ('69', 'jcmanagerAddLotteryQh', 'managerLotteryRun');
INSERT INTO `jc_admin_menus` VALUES ('70', 'jcmanagerChangeLotteryQh', 'managerLotteryRun');
INSERT INTO `jc_admin_menus` VALUES ('71', 'jcmanagerOpenLotteryPrize', 'managerLotteryRun');
INSERT INTO `jc_admin_menus` VALUES ('72', 'jcmanagerGetLotteryProfitData', 'managerLotteryStat');
INSERT INTO `jc_admin_menus` VALUES ('73', 'jcmanagerGetLotteryProfitDetail', 'managerLotteryStat');
INSERT INTO `jc_admin_menus` VALUES ('74', 'jcmanagerGetLotteryOrder', 'managerLotteryOrder');
INSERT INTO `jc_admin_menus` VALUES ('75', 'jcmanagerGetLotteryShareCfg', 'managerRateSet');
INSERT INTO `jc_admin_menus` VALUES ('76', 'jcmanagerUpdateLotteryShareCfg', 'managerRateSet');
INSERT INTO `jc_admin_menus` VALUES ('77', 'jcmanagerGetAgentLevelList', 'managerAgentLevel');
INSERT INTO `jc_admin_menus` VALUES ('78', 'jcmanagerAddAgentLevel', 'managerAgentLevel');
INSERT INTO `jc_admin_menus` VALUES ('79', 'jcmanagerUpdateAgentLevel', 'managerAgentLevel');
INSERT INTO `jc_admin_menus` VALUES ('80', 'jcmanagerDelAgentLevel', 'managerAgentLevel');
INSERT INTO `jc_admin_menus` VALUES ('81', 'jcmanagerupdateUserLimit', 'managerLotteryUserLimit');
INSERT INTO `jc_admin_menus` VALUES ('82', 'jcmanagerGetUserLimit', 'managerLotteryUserLimit');
INSERT INTO `jc_admin_menus` VALUES ('83', 'jcmanagerAddUserLimit', 'managerLotteryUserLimit');
INSERT INTO `jc_admin_menus` VALUES ('84', 'jcmanagerGetUpdateKjhm', 'managerLotteryModifyLog');
INSERT INTO `jc_admin_menus` VALUES ('85', 'jcmanagerGetSysLimit', 'managerLotteryOrder');
INSERT INTO `jc_admin_menus` VALUES ('86', 'jcmanagerGetPackBalanceUserList', 'managerPackBalanceUser');
INSERT INTO `jc_admin_menus` VALUES ('87', 'jcmanagerAddPackBalanceUser', 'managerPackBalanceUser');
INSERT INTO `jc_admin_menus` VALUES ('88', 'jcmanagerUpdatePackBalanceUser', 'managerPackBalanceUser');
INSERT INTO `jc_admin_menus` VALUES ('89', 'jcmanagerDelPackBalanceUser', 'managerPackBalanceUser');
INSERT INTO `jc_admin_menus` VALUES ('90', 'jcmanagerGetUserRecordList', 'managerdata');
INSERT INTO `jc_admin_menus` VALUES ('91', 'jcmanagerGetUserRecordInfo', 'manageruser');
INSERT INTO `jc_admin_menus` VALUES ('92', 'jcmanagerGetUserDayRecord', 'manageruser');
INSERT INTO `jc_admin_menus` VALUES ('93', 'jcmanagerUpdateUserInfo', 'manageruser');
INSERT INTO `jc_admin_menus` VALUES ('94', 'jcmanagerGetCustomeServiceList', 'managerCustomeService');
INSERT INTO `jc_admin_menus` VALUES ('95', 'jcmanagerUpdateCustomeService', 'managerCustomeService');
INSERT INTO `jc_admin_menus` VALUES ('96', 'jcmanagerdelCustomeService', 'managerCustomeService');
INSERT INTO `jc_admin_menus` VALUES ('97', 'jcmanagerGetUserUnderList', 'manageruser');
INSERT INTO `jc_admin_menus` VALUES ('98', 'jcmanagerGetUserOddList', 'managerLotteryUserRate');
INSERT INTO `jc_admin_menus` VALUES ('99', 'jcmanagerUpdateUserOddList', 'managerLotteryUserRate');
INSERT INTO `jc_admin_menus` VALUES ('100', 'jcmanagerGetPackBalanceList', 'managerbankstatement');
INSERT INTO `jc_admin_menus` VALUES ('101', 'jcmanagerGetBalanceList', 'managerbankstatement');
INSERT INTO `jc_admin_menus` VALUES ('102', 'jcmanagerActionBalanceStatus', 'managerbankstatement');
INSERT INTO `jc_admin_menus` VALUES ('103', 'jcmanagerGetPackBankInfo', 'managerbankstatement');
INSERT INTO `jc_admin_menus` VALUES ('104', 'jcmanagerGetUserBalanceList', 'managerCashPool');
INSERT INTO `jc_admin_menus` VALUES ('105', 'jcmanagerGetUserDayDataList', 'managerputforward');
INSERT INTO `jc_admin_menus` VALUES ('106', 'jcmanagerGetBalancePackData', 'managerpackData');
INSERT INTO `jc_admin_menus` VALUES ('109', 'jcmanagerGetGameList', 'managerGameAllList');
INSERT INTO `jc_admin_menus` VALUES ('110', 'jcmanagerUpdateGameList', 'managerGameAllList');
INSERT INTO `jc_admin_menus` VALUES ('111', 'jcmanagerAddGameGrayUid', 'managerGameAllList');
INSERT INTO `jc_admin_menus` VALUES ('112', 'jcmanagerGetAllGameGray', 'managerGameAllList');
INSERT INTO `jc_admin_menus` VALUES ('113', 'jcmanagerGetPayInfoList', 'managerPayType');
INSERT INTO `jc_admin_menus` VALUES ('114', 'jcmanagerUpdatePayInfo', 'managerPayType');
INSERT INTO `jc_admin_menus` VALUES ('115', 'jcmanagerGetGameAwardList', 'managerGameAward');
INSERT INTO `jc_admin_menus` VALUES ('116', 'jcmanagerGetGameRiskList', 'managerCashPool');
INSERT INTO `jc_admin_menus` VALUES ('117', 'jcmanagerUpdateGameRisk', 'managerCashPool');
INSERT INTO `jc_admin_menus` VALUES ('118', 'jcmanagerDelGameRisk', 'managerCashPool');
INSERT INTO `jc_admin_menus` VALUES ('119', 'jcmanagerDelGameTabName', 'managerDelGameData');
INSERT INTO `jc_admin_menus` VALUES ('120', 'jcmanagerDelGameDbTab', 'managerDelGameData');
INSERT INTO `jc_admin_menus` VALUES ('121', 'jcmanagerDelGameGrayUid', 'managerGameAllList');
INSERT INTO `jc_admin_menus` VALUES ('122', 'jcmanagerGetCallThePolice', 'managerLotteryMonitor');
INSERT INTO `jc_admin_menus` VALUES ('123', 'jcmanagerGetMk6RiskList', 'managerLotterySixRisk');
INSERT INTO `jc_admin_menus` VALUES ('124', 'jcmanagerUpdateMk6Risk', 'managerLotterySixRisk');
INSERT INTO `jc_admin_menus` VALUES ('125', 'jcmanagerAddGameList', 'managerGameAllList');
INSERT INTO `jc_admin_menus` VALUES ('126', 'jcmanagerDelGameList', 'managerGameAllList');
INSERT INTO `jc_admin_menus` VALUES ('127', 'jcmanagerGetAllGameInfo', 'managerLotterySetting');
INSERT INTO `jc_admin_menus` VALUES ('128', 'jcmanagerUpdateAllGameStatus', 'managerLotterySetting');
INSERT INTO `jc_admin_menus` VALUES ('129', 'jcmanagerGetSubTypeInfo', 'managerLotteryPlay');
INSERT INTO `jc_admin_menus` VALUES ('130', 'jcmanagerUpdateSubType', 'managerLotteryPlay');
INSERT INTO `jc_admin_menus` VALUES ('131', 'jcmanagerUpdateLotterySysControl', 'managerLotterySysRisk');
INSERT INTO `jc_admin_menus` VALUES ('132', 'jcmanagerGetLotterySysControl', 'managerLotterySysRisk');
