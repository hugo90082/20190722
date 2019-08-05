-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2019-07-31 04:04:18
-- 伺服器版本： 10.3.16-MariaDB
-- PHP 版本： 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `hugolin`
--

-- --------------------------------------------------------

--
-- 資料表結構 `commodity`
--

CREATE TABLE `commodity` (
  `CommodityID` int(11) NOT NULL,
  `commodityName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `photo1` blob DEFAULT NULL,
  `photo2` blob DEFAULT NULL,
  `photo3` blob DEFAULT NULL,
  `photo4` blob DEFAULT NULL,
  `photo5` blob DEFAULT NULL,
  `photo6` blob DEFAULT NULL,
  `photo7` blob DEFAULT NULL,
  `photo8` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `transaction`
--

CREATE TABLE `transaction` (
  `transactionID` int(11) NOT NULL,
  `CommodityID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `transactionTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `userID` int(10) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `userPic` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `commodity`
--
ALTER TABLE `commodity`
  ADD PRIMARY KEY (`CommodityID`);

--
-- 資料表索引 `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transactionID`),
  ADD KEY `FK_UserID` (`userID`),
  ADD KEY `FK_CommodityID` (`CommodityID`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `commodity`
--
ALTER TABLE `commodity`
  MODIFY `CommodityID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transactionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(10) NOT NULL AUTO_INCREMENT;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `FK_CommodityID` FOREIGN KEY (`CommodityID`) REFERENCES `commodity` (`CommodityID`),
  ADD CONSTRAINT `FK_UserID` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;