-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 
-- 伺服器版本： 10.3.16-MariaDB
-- PHP 版本： 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `todolist`
--

-- --------------------------------------------------------

--
-- 資料表結構 `list`
--

CREATE TABLE `list` (
  `Id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT 'NULL',
  `todo` varchar(300) DEFAULT 'NULL',
  `ymd` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `list`
--

INSERT INTO `list` (`Id`, `title`, `todo`, `ymd`) VALUES
(17, '水費', '記得繳水費', '2019-08-09'),
(18, '學費', '繳學費', '2019-08-31'),
(19, '網路費', '繳網路費', '2019-08-30'),
(20, '午餐便當', '午餐出去買便當', '2019-08-23'),
(21, '我不知道還有甚麼代辦事項', '我不知道還有甚麼代辦事項 只好隨便打', '2019-08-24'),
(22, '剛剛新增十幾筆', '剛剛新增十幾筆 但是都沒進資料庫 QQ', '2019-08-17'),
(23, '瓦斯費', '記得繳瓦斯費', '2019-08-29');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `list`
--
ALTER TABLE `list`
  ADD PRIMARY KEY (`Id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `list`
--
ALTER TABLE `list`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
