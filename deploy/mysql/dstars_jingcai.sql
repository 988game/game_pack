-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2018-12-20 09:26:20
-- 服务器版本： 5.6.38-log
-- PHP Version: 7.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dstars_jingcai`
--

-- --------------------------------------------------------

--
-- 表的结构 `activete_list`
--

CREATE TABLE `activete_list` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT '活动名字',
  `point` int(11) NOT NULL COMMENT '奖励积分',
  `status` tinyint(1) NOT NULL COMMENT '0否 1是',
  `app_id` int(11) NOT NULL COMMENT 'app_id',
  `config` varchar(1000) NOT NULL COMMENT '活动配置',
  `unique_key` varchar(50) NOT NULL COMMENT '活动唯一KEY,不使用下划线'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='活动列表';

-- --------------------------------------------------------

--
-- 表的结构 `active_message`
--

CREATE TABLE `active_message` (
  `id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `gwhere` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 小游戏 1CP',
  `message` varchar(1000) NOT NULL COMMENT '消息内容',
  `type` int(1) NOT NULL COMMENT '消息类型 3高级系统消息 2玩家盈利信息  1低级系统消息',
  `start` date NOT NULL COMMENT '开始时间',
  `end` date NOT NULL COMMENT '结束时间',
  `todayStart` varchar(20) NOT NULL DEFAULT '00:00' COMMENT '当天开始时间',
  `todayEnd` varchar(20) NOT NULL DEFAULT '23:59' COMMENT '当天结束时间',
  `space` int(11) NOT NULL COMMENT '时间间隔 分钟',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1正常 0不显示',
  `created_date` datetime NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `active_user`
--

CREATE TABLE `active_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `update_date` datetime NOT NULL,
  `pack_no` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '渠道号'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `admin_log`
--

CREATE TABLE `admin_log` (
  `id` int(11) UNSIGNED NOT NULL,
  `route` varchar(50) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip_address` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `agent_level`
--

CREATE TABLE `agent_level` (
  `id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `min_point` int(11) NOT NULL,
  `max_point` int(11) NOT NULL,
  `commi` int(11) NOT NULL DEFAULT '0' COMMENT '每万返佣',
  `info` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代理级别';

-- --------------------------------------------------------

--
-- 表的结构 `agent_point_log`
--

CREATE TABLE `agent_point_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ctype` tinyint(1) NOT NULL COMMENT '0直属 1团队',
  `point` bigint(20) NOT NULL,
  `ctime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `app_balance`
--

CREATE TABLE `app_balance` (
  `id` int(11) NOT NULL,
  `dateline` varchar(50) NOT NULL COMMENT '月份-日期',
  `app_id` int(11) NOT NULL,
  `new_user` int(11) NOT NULL COMMENT '新增用户',
  `recharge` int(11) NOT NULL COMMENT '充值金额',
  `putforward` int(11) NOT NULL COMMENT '提现金额',
  `bet` int(11) NOT NULL COMMENT '总投注',
  `award` int(11) NOT NULL COMMENT '总返奖',
  `balance` int(11) NOT NULL DEFAULT '0' COMMENT '分成',
  `ratio` double(4,2) NOT NULL COMMENT '分成比例',
  `status` int(11) NOT NULL COMMENT '状态 0 默认 1结算 2已结算',
  `created_date` datetime NOT NULL COMMENT '创建',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pack_no` int(11) NOT NULL,
  `user_blance` bigint(20) NOT NULL COMMENT '用户余额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='渠道结算表';

-- --------------------------------------------------------

--
-- 表的结构 `bank_info`
--

CREATE TABLE `bank_info` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `entrusBankAccount` varchar(200) NOT NULL COMMENT '银行账号',
  `entrusBankUser` varchar(200) NOT NULL COMMENT '姓名',
  `entrusBankName` varchar(200) NOT NULL COMMENT '银行名称',
  `bankName` varchar(200) NOT NULL COMMENT '银行支行',
  `bankProvcince` varchar(200) NOT NULL COMMENT '开户省',
  `bankCity` varchar(200) NOT NULL COMMENT '开户市',
  `certificateCode` varchar(20) NOT NULL COMMENT '身份证',
  `bankCode` varchar(20) NOT NULL COMMENT '银行代码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='银行信息';

-- --------------------------------------------------------

--
-- 表的结构 `bind_pay_info`
--

CREATE TABLE `bind_pay_info` (
  `id` int(11) UNSIGNED NOT NULL,
  `account` varchar(50) NOT NULL COMMENT '账号',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `user_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 支付宝'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='绑定的支付信息';

-- --------------------------------------------------------

--
-- 表的结构 `black_list`
--

CREATE TABLE `black_list` (
  `id` int(11) UNSIGNED NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `nickname` varchar(200) NOT NULL COMMENT '用户昵称',
  `level` int(11) NOT NULL COMMENT '黑名单级别',
  `is_delete` tinyint(1) NOT NULL COMMENT '是否删除 0否 1是',
  `created_date` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reason` varchar(200) NOT NULL DEFAULT '' COMMENT '封号原因',
  `black_end` int(11) NOT NULL DEFAULT '0' COMMENT '封号天数 0 永久'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='黑名单';

-- --------------------------------------------------------

--
-- 表的结构 `channel_info`
--

CREATE TABLE `channel_info` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT '',
  `sign_key` varchar(100) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'type=0次公众号 1主公众号 2WEB版',
  `app_id` int(11) NOT NULL COMMENT 'app id',
  `flag` tinyint(1) NOT NULL DEFAULT '2' COMMENT '提审标志位 1提审2正常',
  `bind_url` varchar(200) NOT NULL COMMENT '代理渠道的推广URL',
  `cash_pool` bigint(20) NOT NULL DEFAULT '100000000' COMMENT '资金池',
  `bet_max` int(11) NOT NULL DEFAULT '1000000' COMMENT '最大投注额',
  `bet_min` int(11) NOT NULL DEFAULT '5000' COMMENT '下注限额',
  `cash_pool_config` varchar(200) NOT NULL DEFAULT '{"risk_begin":0.5,"risk_begin_val":0}' COMMENT '资金池配置',
  `cfg` varchar(255) NOT NULL COMMENT '配置',
  `cp_cfg` varchar(1024) NOT NULL COMMENT '彩票配置'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `channel_user`
--

CREATE TABLE `channel_user` (
  `id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL DEFAULT '0',
  `channel_uid` varchar(50) NOT NULL DEFAULT '',
  `password` char(32) DEFAULT '' COMMENT 'WEB版密码',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `is_bind_phone` tinyint(1) DEFAULT '1' COMMENT '是否绑定手机',
  `created_date` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL COMMENT '配置信息',
  `app_id` int(11) NOT NULL DEFAULT '0',
  `jckey` varchar(50) CHARACTER SET utf8 NOT NULL,
  `value` varchar(20000) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='配置信息';

-- --------------------------------------------------------

--
-- 表的结构 `custome_service`
--

CREATE TABLE `custome_service` (
  `id` int(11) UNSIGNED NOT NULL,
  `app_id` int(11) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1QQ2微信',
  `info` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客服表';

-- --------------------------------------------------------

--
-- 表的结构 `fish_point_log`
--

CREATE TABLE `fish_point_log` (
  `id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL COMMENT 'appid',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `form_type` varchar(20) NOT NULL COMMENT 'jc 金蟾 lk 李逵 wk悟空',
  `orderid` varchar(50) NOT NULL COMMENT '订单号',
  `coin` bigint(20) UNSIGNED NOT NULL COMMENT '捕鱼金币',
  `chip` bigint(20) UNSIGNED NOT NULL COMMENT '我们金币',
  `uin` int(11) NOT NULL COMMENT '捕鱼账户ID',
  `created_date` datetime NOT NULL,
  `source` int(11) NOT NULL COMMENT '类型 1平台->捕鱼币  2捕鱼币->平台币  '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `fish_tax`
--

CREATE TABLE `fish_tax` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `uin` int(11) UNSIGNED NOT NULL COMMENT '捕鱼平台UID',
  `betid` varchar(50) NOT NULL COMMENT '单号ID',
  `bet` bigint(20) NOT NULL COMMENT '投注',
  `betresult` bigint(20) NOT NULL COMMENT '中奖金额',
  `restcoin` bigint(20) NOT NULL COMMENT '身上金币',
  `tax` bigint(20) NOT NULL COMMENT '税费',
  `created_date` datetime NOT NULL,
  `time` int(11) NOT NULL,
  `from_type` varchar(20) NOT NULL COMMENT '来源'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='外接游戏抽水分成';

-- --------------------------------------------------------

--
-- 表的结构 `fish_user`
--

CREATE TABLE `fish_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `third_uid` int(11) DEFAULT '0' COMMENT '别人的 third_uid',
  `from_type` varchar(20) NOT NULL COMMENT 'jc 金蟾 lk 李逵 wk悟空',
  `created_date` datetime NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `app_id` int(11) NOT NULL COMMENT 'appid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='捕鱼游戏账号转换记录';

-- --------------------------------------------------------

--
-- 表的结构 `game_config`
--

CREATE TABLE `game_config` (
  `id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL COMMENT 'APP',
  `odds` varchar(2000) NOT NULL COMMENT '赔率配置',
  `game_time` varchar(2000) NOT NULL COMMENT '游戏时间配置',
  `chips` varchar(2000) NOT NULL COMMENT '筹码配置',
  `configs` varchar(2000) NOT NULL DEFAULT '' COMMENT '其他配置',
  `robotcomfig` text NOT NULL COMMENT '机器人配置'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='游戏配置表';

-- --------------------------------------------------------

--
-- 表的结构 `game_list`
--

CREATE TABLE `game_list` (
  `id` int(11) NOT NULL,
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
  `icon` varchar(200) NOT NULL DEFAULT '' COMMENT '游戏ICON'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `game_qihao`
--

CREATE TABLE `game_qihao` (
  `id` int(11) UNSIGNED NOT NULL,
  `gameid` int(11) NOT NULL COMMENT '游戏的gamelist-ID',
  `app_id` int(11) NOT NULL COMMENT '竞猜APPID',
  `qihao` varchar(30) NOT NULL COMMENT '期号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `tz_begin_time` datetime NOT NULL COMMENT '投注开始时间',
  `tz_end_time` datetime NOT NULL COMMENT '投注结束时间',
  `award` varchar(5000) NOT NULL COMMENT '开奖信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='骰宝类游戏期号';

-- --------------------------------------------------------

--
-- 表的结构 `iospay`
--

CREATE TABLE `iospay` (
  `pid` bigint(20) NOT NULL COMMENT '订单id',
  `transaction_id` varchar(50) NOT NULL COMMENT '苹果支付流水号',
  `receipt` text NOT NULL COMMENT '苹果支付记录'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='苹果支付记录表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `jc_admin_manager`
--

CREATE TABLE `jc_admin_manager` (
  `id` int(11) UNSIGNED NOT NULL,
  `app_id` int(11) NOT NULL DEFAULT '0' COMMENT 'appid',
  `username` varchar(50) NOT NULL COMMENT '用户名字',
  `nickname` varchar(50) DEFAULT '',
  `password` char(32) NOT NULL COMMENT '密码',
  `last_login` datetime NOT NULL COMMENT '最后登录时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `role_name` varchar(50) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型  0 总管理员 1 站点管理员 2渠道',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0可用 1不可用',
  `point_limit` int(11) NOT NULL COMMENT '单笔限制',
  `day_point_limit` int(11) NOT NULL COMMENT '每日限制'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台用户';

-- --------------------------------------------------------

--
-- 表的结构 `jc_admin_menu`
--

CREATE TABLE `jc_admin_menu` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL DEFAULT '#' COMMENT '前端地址',
  `classname` varchar(50) NOT NULL DEFAULT '' COMMENT '后端验证类',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父节点',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0 可用 1不可用',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序 正序',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '前端图标',
  `ispage` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是页面'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后端菜单';

-- --------------------------------------------------------

--
-- 表的结构 `jc_admin_menus`
--

CREATE TABLE `jc_admin_menus` (
  `id` int(11) NOT NULL,
  `func` varchar(50) NOT NULL COMMENT '函数名 mod+func',
  `classname` varchar(50) NOT NULL COMMENT '菜单权限验证'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `jc_admin_role`
--

CREATE TABLE `jc_admin_role` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '角色名字',
  `description` varchar(500) NOT NULL COMMENT '详细介绍',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0 可用 1不可用',
  `menus` varchar(2000) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台角色表';

-- --------------------------------------------------------

--
-- 表的结构 `pack_balance`
--

CREATE TABLE `pack_balance` (
  `id` int(11) NOT NULL,
  `dateline` varchar(50) NOT NULL COMMENT '月份-日期',
  `app_id` int(11) NOT NULL,
  `new_user` int(11) NOT NULL COMMENT '新增用户',
  `act_user` int(11) NOT NULL COMMENT '活跃',
  `pay_user` int(11) NOT NULL COMMENT '支付的',
  `recharge` bigint(20) NOT NULL COMMENT '充值金额',
  `putforward` bigint(20) NOT NULL COMMENT '提现金额',
  `bet` bigint(20) NOT NULL COMMENT '总投注',
  `award` bigint(20) NOT NULL COMMENT '总返奖',
  `pack_share` bigint(20) NOT NULL COMMENT '渠道总分成',
  `agent_share` bigint(20) NOT NULL COMMENT '代理分成',
  `ctime` bigint(20) NOT NULL COMMENT '创建时间',
  `pack_no` int(11) NOT NULL,
  `user_blance` bigint(20) NOT NULL COMMENT '用户余额',
  `click_sum` int(11) NOT NULL COMMENT '推广链接点击数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='渠道结算表';

-- --------------------------------------------------------

--
-- 表的结构 `pack_balance_user`
--

CREATE TABLE `pack_balance_user` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `ctime` datetime NOT NULL,
  `utime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='渠道结算账号';

-- --------------------------------------------------------

--
-- 表的结构 `pack_bank_info`
--

CREATE TABLE `pack_bank_info` (
  `id` int(11) UNSIGNED NOT NULL,
  `pack_no` int(11) NOT NULL COMMENT '渠道号',
  `entrusBankAccount` varchar(200) NOT NULL COMMENT '银行账号',
  `entrusBankUser` varchar(200) NOT NULL COMMENT '姓名',
  `entrusBankName` varchar(200) NOT NULL COMMENT '银行名称',
  `bankName` varchar(200) NOT NULL COMMENT '银行支行',
  `bankProvcince` varchar(200) NOT NULL COMMENT '开户省',
  `bankCity` varchar(200) NOT NULL COMMENT '开户市',
  `certificateCode` varchar(200) NOT NULL COMMENT '身份证',
  `bankCode` varchar(20) NOT NULL COMMENT '银行代码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='银行信息';

-- --------------------------------------------------------

--
-- 表的结构 `pack_click_record`
--

CREATE TABLE `pack_click_record` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pack_no` int(11) UNSIGNED DEFAULT NULL COMMENT '渠道包号',
  `ip` varchar(255) DEFAULT NULL COMMENT 'ip收集',
  `divice_id` varchar(255) DEFAULT NULL COMMENT '设备号',
  `ctime` bigint(22) UNSIGNED DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `pack_list`
--

CREATE TABLE `pack_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'appid',
  `pack_name` varchar(255) DEFAULT NULL COMMENT '渠道名称',
  `status` int(10) UNSIGNED DEFAULT '1' COMMENT '1上线2 下线',
  `pack_no` int(10) UNSIGNED DEFAULT NULL COMMENT '渠道号',
  `banker_ratio` float NOT NULL DEFAULT '0' COMMENT '庄家分成',
  `record_commi` int(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '业绩比例',
  `ext_mode` int(1) NOT NULL DEFAULT '0' COMMENT '推广模式',
  `ctime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `pack_url` varchar(255) DEFAULT NULL COMMENT '渠道地址',
  `ptime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `reason` varchar(200) NOT NULL DEFAULT '' COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `pack_manager`
--

CREATE TABLE `pack_manager` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` int(10) NOT NULL COMMENT 'appid',
  `pack_no` int(10) UNSIGNED DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL COMMENT '渠道管理用户名称',
  `account` varchar(255) DEFAULT NULL COMMENT '账户',
  `pwd` varchar(255) DEFAULT NULL COMMENT '密码',
  `ctime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_login_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后登录时间',
  `status` int(10) UNSIGNED DEFAULT '1' COMMENT '1可用2不可用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='渠道管理账户';

-- --------------------------------------------------------

--
-- 表的结构 `pay_type`
--

CREATE TABLE `pay_type` (
  `id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL DEFAULT '0' COMMENT 'appid',
  `name` varchar(20) NOT NULL COMMENT '支付方式',
  `pay_type` varchar(20) NOT NULL COMMENT '支付方式 KEY',
  `status` tinyint(1) NOT NULL COMMENT '0关闭 1打开',
  `config` varchar(500) NOT NULL DEFAULT '' COMMENT '配置信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付方式';

-- --------------------------------------------------------

--
-- 表的结构 `pay_vip`
--

CREATE TABLE `pay_vip` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` int(11) NOT NULL COMMENT 'APP_ID ',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '代理ID',
  `name` varchar(50) NOT NULL COMMENT '代理名称',
  `wx` varchar(50) NOT NULL COMMENT '微信号',
  `qq` varchar(50) NOT NULL COMMENT 'QQ号',
  `describes` varchar(50) NOT NULL COMMENT '介绍',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0不可用 1可用',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `point_give_log`
--

CREATE TABLE `point_give_log` (
  `id` int(11) NOT NULL,
  `point` bigint(20) UNSIGNED NOT NULL COMMENT '赠送的point',
  `order_no` varchar(20) NOT NULL,
  `from_user` int(11) NOT NULL COMMENT '赠送人',
  `from_user_name` varchar(50) NOT NULL COMMENT '赠送人名字',
  `to_user` int(11) NOT NULL COMMENT '接收人',
  `to_user_name` varchar(50) NOT NULL COMMENT '接收人名字',
  `created_date` datetime NOT NULL,
  `descs` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='赠送表';

-- --------------------------------------------------------

--
-- 表的结构 `putforward_order`
--

CREATE TABLE `putforward_order` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户名',
  `app_id` int(11) NOT NULL COMMENT 'appid',
  `user_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '提现的用户身份',
  `order_no` varchar(50) NOT NULL COMMENT '订单号',
  `sysnumber` varchar(200) NOT NULL COMMENT '五星支付订单号码',
  `status` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '0默认 待审核 1已审核 3 兑换成功 -1 已拒绝',
  `point` int(11) NOT NULL COMMENT '提现金额，分',
  `money` decimal(10,2) NOT NULL COMMENT '提现金额',
  `service_charge` decimal(10,2) NOT NULL COMMENT '提现服务费',
  `type` int(1) NOT NULL COMMENT '方式 0支付宝 1五星 2 365商城',
  `entrus_bank_account` varchar(200) NOT NULL COMMENT '银行卡账号',
  `entrus_bank_user` varchar(200) NOT NULL COMMENT '银行卡所有人',
  `entrus_bank_name` varchar(200) NOT NULL COMMENT '银行名称',
  `bank_name` varchar(200) NOT NULL COMMENT '开户行网点',
  `bank_provcince` varchar(200) NOT NULL COMMENT '开户省',
  `bank_city` varchar(200) NOT NULL COMMENT '开户市',
  `certificate_code` varchar(200) NOT NULL COMMENT '身份证',
  `created_date` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pack_no` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '渠道号',
  `reason` varchar(100) NOT NULL DEFAULT '',
  `action_uid` int(11) NOT NULL DEFAULT '0' COMMENT 'caouzoren '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='提现订单';

-- --------------------------------------------------------

--
-- 表的结构 `recharge_gift_info`
--

CREATE TABLE `recharge_gift_info` (
  `id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL DEFAULT '0' COMMENT 'app_id ',
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '充值商品名称',
  `spid` varchar(50) NOT NULL COMMENT '苹果商品ID',
  `price` bigint(20) NOT NULL DEFAULT '0' COMMENT '单位分',
  `point` bigint(20) NOT NULL DEFAULT '0',
  `status` tinyint(8) NOT NULL DEFAULT '0' COMMENT '0-未开始 1-上线 2-下线',
  `created_date` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `recharge_gift_order`
--

CREATE TABLE `recharge_gift_order` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '支付别名',
  `price` bigint(11) NOT NULL DEFAULT '0' COMMENT '单位分',
  `point` bigint(11) NOT NULL DEFAULT '0',
  `status` tinyint(8) NOT NULL DEFAULT '0' COMMENT '0-未支付 1-已支付 2-退单 99-异常',
  `type` tinyint(8) NOT NULL DEFAULT '0' COMMENT '0-VIP充值 1-5x 2 365sc  3 ronghang 4美联支付',
  `uid` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `app_id` int(11) NOT NULL COMMENT 'appid',
  `platform` int(11) NOT NULL DEFAULT '1',
  `order_no` varchar(50) NOT NULL COMMENT '订单号',
  `sysnumber` varchar(200) NOT NULL DEFAULT '' COMMENT '支付系统订单号码',
  `created_date` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pack_no` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '渠道号',
  `source_opt` int(11) NOT NULL DEFAULT '0' COMMENT '充值类型 渠道号 操作的ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `server_info`
--

CREATE TABLE `server_info` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '服务名字',
  `server_id` int(11) NOT NULL COMMENT '服务ID',
  `server_addr` varchar(20) NOT NULL COMMENT '服务地址',
  `server_port` int(11) NOT NULL COMMENT '服务地址端口',
  `app_ids` varchar(100) NOT NULL COMMENT 'appid',
  `gameids` varchar(500) NOT NULL COMMENT 'gameid',
  `uri` varchar(50) NOT NULL COMMENT 'uri',
  `status` int(11) NOT NULL COMMENT '状态 1可用 0不可用',
  `is_ssl` tinyint(1) NOT NULL COMMENT '是否走ssl  0不走 1走',
  `server_port1` int(10) NOT NULL DEFAULT '0' COMMENT '端口1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='服务列表';

-- --------------------------------------------------------

--
-- 表的结构 `user_coin`
--

CREATE TABLE `user_coin` (
  `uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `appid` int(11) NOT NULL DEFAULT '0' COMMENT 'app标识号',
  `coin_type_id` int(11) NOT NULL DEFAULT '0' COMMENT '金币种类id',
  `coin` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户金币数',
  `update_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户金币信息表';

-- --------------------------------------------------------

--
-- 表的结构 `user_info`
--

CREATE TABLE `user_info` (
  `id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL COMMENT 'app_id',
  `nickname` varchar(30) NOT NULL DEFAULT '',
  `headimg` varchar(200) NOT NULL DEFAULT '',
  `point` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `safe_point` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pack_no` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '渠道号',
  `pack_type` int(11) NOT NULL COMMENT '渠道来源类型0 是渠道链接 1是上级渠道',
  `reg_info` varchar(500) NOT NULL DEFAULT '' COMMENT '注册信息',
  `user_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'user_type 123'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `user_point_log`
--

CREATE TABLE `user_point_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `app_id` int(11) NOT NULL COMMENT 'appid',
  `update_time` datetime DEFAULT NULL,
  `point` int(11) NOT NULL DEFAULT '0',
  `real_point` int(11) NOT NULL DEFAULT '0' COMMENT '真实的金币信息',
  `old_point` int(11) NOT NULL DEFAULT '0',
  `new_point` int(11) NOT NULL DEFAULT '0',
  `order_no` varchar(500) NOT NULL DEFAULT '',
  `unique_key` varchar(150) NOT NULL DEFAULT '',
  `source` int(11) NOT NULL DEFAULT '0',
  `game_id` int(11) UNSIGNED NOT NULL COMMENT '游戏的gamelist-ID',
  `percentage_point` int(11) NOT NULL DEFAULT '0' COMMENT '赢钱抽水',
  `pack_no` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '渠道号',
  `flow_point` bigint(20) NOT NULL DEFAULT '0' COMMENT '业绩',
  `source_opt` varchar(2000) NOT NULL DEFAULT '' COMMENT '充值操作类型',
  `remarks` varchar(500) NOT NULL DEFAULT '' COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `user_point_share`
--

CREATE TABLE `user_point_share` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pid` bigint(20) UNSIGNED DEFAULT '0' COMMENT '上级',
  `gid` bigint(20) UNSIGNED DEFAULT '0' COMMENT '上上级',
  `tid` bigint(20) UNSIGNED DEFAULT '0' COMMENT '上上上级',
  `pid_share` int(11) UNSIGNED DEFAULT '0' COMMENT '上级分成',
  `gid_share` int(11) UNSIGNED DEFAULT '0' COMMENT '上上级分成',
  `tid_share` int(11) UNSIGNED DEFAULT '0' COMMENT '上上上级分成',
  `ctime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cfg` varchar(255) NOT NULL COMMENT '当时的配置',
  `point` bigint(20) NOT NULL COMMENT '总共分享金额',
  `pack_no` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '渠道号',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0 小游戏，1彩票'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `user_record`
--

CREATE TABLE `user_record` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ctype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 小游戏 1CP',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `app_id` int(11) NOT NULL COMMENT 'appid',
  `gameid` int(11) NOT NULL COMMENT '游戏ID',
  `pack_no` int(11) NOT NULL COMMENT '渠道号',
  `qihao` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `tz_point` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `hit_point` bigint(20) NOT NULL DEFAULT '0',
  `percentage_point` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `flow_point` bigint(20) UNSIGNED NOT NULL COMMENT '业绩',
  `tz_content` varchar(2000) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '时间'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='业绩流水统计';

-- --------------------------------------------------------

--
-- 表的结构 `user_share`
--

CREATE TABLE `user_share` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '用户分享',
  `app_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `pid` int(11) UNSIGNED NOT NULL COMMENT '上级id',
  `gid` int(11) UNSIGNED NOT NULL COMMENT '上上级id',
  `tid` int(11) UNSIGNED NOT NULL COMMENT '上上上级',
  `parents` varchar(5000) NOT NULL DEFAULT '' COMMENT '所有上级',
  `created_time` datetime NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `user_share_level`
--

CREATE TABLE `user_share_level` (
  `user_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `level` tinyint(2) NOT NULL,
  `ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activete_list`
--
ALTER TABLE `activete_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_key` (`unique_key`),
  ADD KEY `app_id` (`app_id`);

--
-- Indexes for table `active_message`
--
ALTER TABLE `active_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `app_id` (`app_id`);

--
-- Indexes for table `active_user`
--
ALTER TABLE `active_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `app_id` (`app_id`),
  ADD KEY `update_date` (`update_date`),
  ADD KEY `pack_no` (`pack_no`);

--
-- Indexes for table `admin_log`
--
ALTER TABLE `admin_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_level`
--
ALTER TABLE `agent_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_point_log`
--
ALTER TABLE `agent_point_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_uid` (`user_id`);

--
-- Indexes for table `app_balance`
--
ALTER TABLE `app_balance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_info`
--
ALTER TABLE `bank_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `bind_pay_info`
--
ALTER TABLE `bind_pay_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_uid` (`user_id`);

--
-- Indexes for table `black_list`
--
ALTER TABLE `black_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `black_end` (`black_end`),
  ADD KEY `is_delete` (`is_delete`);

--
-- Indexes for table `channel_info`
--
ALTER TABLE `channel_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sign_key` (`sign_key`),
  ADD KEY `app_id` (`app_id`);

--
-- Indexes for table `channel_user`
--
ALTER TABLE `channel_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `channel_id` (`channel_id`,`channel_uid`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_id_2` (`user_id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix` (`jckey`,`app_id`);

--
-- Indexes for table `custome_service`
--
ALTER TABLE `custome_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_id` (`app_id`);

--
-- Indexes for table `fish_point_log`
--
ALTER TABLE `fish_point_log`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderid` (`orderid`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `form_type` (`form_type`),
  ADD KEY `source` (`source`),
  ADD KEY `app_id` (`app_id`);

--
-- Indexes for table `fish_tax`
--
ALTER TABLE `fish_tax`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `betid` (`betid`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `fish_user`
--
ALTER TABLE `fish_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `from_type` (`from_type`);

--
-- Indexes for table `game_config`
--
ALTER TABLE `game_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_id` (`app_id`);

--
-- Indexes for table `game_list`
--
ALTER TABLE `game_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`) USING BTREE;

--
-- Indexes for table `game_qihao`
--
ALTER TABLE `game_qihao`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_appid_gameid` (`gameid`,`app_id`,`qihao`) USING BTREE,
  ADD KEY `ix_gq` (`qihao`,`gameid`) USING BTREE,
  ADD KEY `status` (`status`);

--
-- Indexes for table `iospay`
--
ALTER TABLE `iospay`
  ADD PRIMARY KEY (`pid`),
  ADD UNIQUE KEY `transaction_id` (`transaction_id`) USING BTREE;

--
-- Indexes for table `jc_admin_manager`
--
ALTER TABLE `jc_admin_manager`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `jc_admin_menu`
--
ALTER TABLE `jc_admin_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_url` (`url`) USING BTREE,
  ADD KEY `classname` (`classname`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `jc_admin_menus`
--
ALTER TABLE `jc_admin_menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `un_func` (`func`);

--
-- Indexes for table `jc_admin_role`
--
ALTER TABLE `jc_admin_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pack_balance`
--
ALTER TABLE `pack_balance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pack_balance_user`
--
ALTER TABLE `pack_balance_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `pack_bank_info`
--
ALTER TABLE `pack_bank_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pack_no` (`pack_no`);

--
-- Indexes for table `pack_click_record`
--
ALTER TABLE `pack_click_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pack_list`
--
ALTER TABLE `pack_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_id` (`app_id`) USING BTREE,
  ADD KEY `pack_no` (`pack_no`) USING BTREE;

--
-- Indexes for table `pack_manager`
--
ALTER TABLE `pack_manager`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pack_no` (`pack_no`) USING BTREE,
  ADD KEY `account` (`account`(191)) USING BTREE;

--
-- Indexes for table `pay_type`
--
ALTER TABLE `pay_type`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `pay_vip`
--
ALTER TABLE `pay_vip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_id` (`app_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `point_give_log`
--
ALTER TABLE `point_give_log`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_order_no` (`order_no`),
  ADD KEY `from_user` (`from_user`),
  ADD KEY `to_user` (`to_user`);

--
-- Indexes for table `putforward_order`
--
ALTER TABLE `putforward_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_no` (`order_no`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `pack_no` (`pack_no`);

--
-- Indexes for table `recharge_gift_info`
--
ALTER TABLE `recharge_gift_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `AK_Key_status` (`status`);

--
-- Indexes for table `recharge_gift_order`
--
ALTER TABLE `recharge_gift_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `AK_Key_type` (`type`),
  ADD KEY `AK_Key_status` (`status`),
  ADD KEY `order_no` (`order_no`),
  ADD KEY `ix_uid` (`uid`),
  ADD KEY `pack_no` (`pack_no`);

--
-- Indexes for table `server_info`
--
ALTER TABLE `server_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_coin`
--
ALTER TABLE `user_coin`
  ADD UNIQUE KEY `uac` (`uid`,`coin_type_id`) USING BTREE,
  ADD KEY `uid` (`uid`) USING BTREE;

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_id` (`app_id`),
  ADD KEY `point` (`point`),
  ADD KEY `pack_no` (`pack_no`);

--
-- Indexes for table `user_point_log`
--
ALTER TABLE `user_point_log`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_key` (`unique_key`),
  ADD KEY `source` (`source`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `game_id` (`game_id`),
  ADD KEY `ix_time` (`update_time`),
  ADD KEY `pack_no` (`pack_no`);

--
-- Indexes for table `user_point_share`
--
ALTER TABLE `user_point_share`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `pid` (`pid`) USING BTREE,
  ADD KEY `gid` (`gid`) USING BTREE,
  ADD KEY `tid` (`tid`) USING BTREE,
  ADD KEY `pack_no` (`pack_no`);

--
-- Indexes for table `user_record`
--
ALTER TABLE `user_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_time` (`ctime`),
  ADD KEY `ix_appid` (`app_id`),
  ADD KEY `ix_uid` (`user_id`) USING BTREE;

--
-- Indexes for table `user_share`
--
ALTER TABLE `user_share`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `ix_time` (`created_time`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `user_share_level`
--
ALTER TABLE `user_share_level`
  ADD UNIQUE KEY `uq_uid_pid` (`user_id`,`pid`),
  ADD KEY `ix_uid` (`user_id`),
  ADD KEY `ix_pid` (`pid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `activete_list`
--
ALTER TABLE `activete_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `active_message`
--
ALTER TABLE `active_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- 使用表AUTO_INCREMENT `active_user`
--
ALTER TABLE `active_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33507;

--
-- 使用表AUTO_INCREMENT `admin_log`
--
ALTER TABLE `admin_log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1303;

--
-- 使用表AUTO_INCREMENT `agent_level`
--
ALTER TABLE `agent_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- 使用表AUTO_INCREMENT `agent_point_log`
--
ALTER TABLE `agent_point_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3993;

--
-- 使用表AUTO_INCREMENT `app_balance`
--
ALTER TABLE `app_balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `bank_info`
--
ALTER TABLE `bank_info`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- 使用表AUTO_INCREMENT `bind_pay_info`
--
ALTER TABLE `bind_pay_info`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- 使用表AUTO_INCREMENT `black_list`
--
ALTER TABLE `black_list`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- 使用表AUTO_INCREMENT `channel_info`
--
ALTER TABLE `channel_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- 使用表AUTO_INCREMENT `channel_user`
--
ALTER TABLE `channel_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1031;

--
-- 使用表AUTO_INCREMENT `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '配置信息', AUTO_INCREMENT=15;

--
-- 使用表AUTO_INCREMENT `custome_service`
--
ALTER TABLE `custome_service`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `fish_point_log`
--
ALTER TABLE `fish_point_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1131;

--
-- 使用表AUTO_INCREMENT `fish_tax`
--
ALTER TABLE `fish_tax`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `fish_user`
--
ALTER TABLE `fish_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

--
-- 使用表AUTO_INCREMENT `game_config`
--
ALTER TABLE `game_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `game_list`
--
ALTER TABLE `game_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- 使用表AUTO_INCREMENT `game_qihao`
--
ALTER TABLE `game_qihao`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=664049;

--
-- 使用表AUTO_INCREMENT `jc_admin_manager`
--
ALTER TABLE `jc_admin_manager`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112951;

--
-- 使用表AUTO_INCREMENT `jc_admin_menu`
--
ALTER TABLE `jc_admin_menu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- 使用表AUTO_INCREMENT `jc_admin_menus`
--
ALTER TABLE `jc_admin_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- 使用表AUTO_INCREMENT `jc_admin_role`
--
ALTER TABLE `jc_admin_role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- 使用表AUTO_INCREMENT `pack_balance`
--
ALTER TABLE `pack_balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=971;

--
-- 使用表AUTO_INCREMENT `pack_balance_user`
--
ALTER TABLE `pack_balance_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112990;

--
-- 使用表AUTO_INCREMENT `pack_bank_info`
--
ALTER TABLE `pack_bank_info`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `pack_click_record`
--
ALTER TABLE `pack_click_record`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- 使用表AUTO_INCREMENT `pack_list`
--
ALTER TABLE `pack_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- 使用表AUTO_INCREMENT `pack_manager`
--
ALTER TABLE `pack_manager`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168989448;

--
-- 使用表AUTO_INCREMENT `pay_type`
--
ALTER TABLE `pay_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `pay_vip`
--
ALTER TABLE `pay_vip`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- 使用表AUTO_INCREMENT `point_give_log`
--
ALTER TABLE `point_give_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- 使用表AUTO_INCREMENT `putforward_order`
--
ALTER TABLE `putforward_order`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=435;

--
-- 使用表AUTO_INCREMENT `recharge_gift_info`
--
ALTER TABLE `recharge_gift_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `recharge_gift_order`
--
ALTER TABLE `recharge_gift_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2058;

--
-- 使用表AUTO_INCREMENT `server_info`
--
ALTER TABLE `server_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `user_info`
--
ALTER TABLE `user_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113001;

--
-- 使用表AUTO_INCREMENT `user_point_log`
--
ALTER TABLE `user_point_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37658;

--
-- 使用表AUTO_INCREMENT `user_point_share`
--
ALTER TABLE `user_point_share`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2896;

--
-- 使用表AUTO_INCREMENT `user_record`
--
ALTER TABLE `user_record`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12042;

--
-- 使用表AUTO_INCREMENT `user_share`
--
ALTER TABLE `user_share`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户分享', AUTO_INCREMENT=2656;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
