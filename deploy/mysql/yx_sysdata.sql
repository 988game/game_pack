-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2018-12-20 09:29:40
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
-- Database: `yx_sysdata`
--

-- --------------------------------------------------------

--
-- 表的结构 `id_factory`
--

CREATE TABLE `id_factory` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(20) NOT NULL DEFAULT '' COMMENT 'id生成标志明',
  `current_id` bigint(20) UNSIGNED NOT NULL COMMENT '当前使用的id 这个字段 redis 为准',
  `inc_count` int(10) UNSIGNED NOT NULL COMMENT '一次生成id块里面id的总数！建议100 到1000  内存占用小 ',
  `start_id` bigint(20) UNSIGNED NOT NULL COMMENT 'id 生成器 开始id 创建之后不可以改(这个值和redis里面意义不同) ',
  `need_rand` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否需要随机0不需要1需要',
  `no_good` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '需要过滤靓号 0 不需要过滤 1需要',
  `black_array` text NOT NULL COMMENT '黑名单处理'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='id 工厂生成器 严禁随便修改这里面的数值';

--
-- 转存表中的数据 `id_factory`
--

INSERT INTO `id_factory` (`id`, `table_name`, `current_id`, `inc_count`, `start_id`, `need_rand`, `no_good`, `black_array`) VALUES
(9, 'jc_user', 101000, 1000, 100000, 1, 1, ''),
(10, 'jc_msg_id', 18699001, 1000, 1, 0, 1, ''),
(14, 'jc_invite_code', 100910, 100, 100000, 1, 0, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `id_factory`
--
ALTER TABLE `id_factory`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `id_factory`
--
ALTER TABLE `id_factory`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
