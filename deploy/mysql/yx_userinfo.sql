-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2018-12-20 09:30:12
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
-- Database: `yx_userinfo`
--

-- --------------------------------------------------------

--
-- 表的结构 `user_online_recode`
--

CREATE TABLE `user_online_recode` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uid` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'uid',
  `online_date` varchar(20) DEFAULT NULL COMMENT '时间',
  `online_desc` varchar(1024) DEFAULT NULL COMMENT '在线信息',
  `total_time` int(10) UNSIGNED DEFAULT NULL COMMENT '今天总在线时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户在线状态表';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user_online_recode`
--
ALTER TABLE `user_online_recode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`) USING BTREE,
  ADD KEY `online_date` (`online_date`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `user_online_recode`
--
ALTER TABLE `user_online_recode`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5118;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
