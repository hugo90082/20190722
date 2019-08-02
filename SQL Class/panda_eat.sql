-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 
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
-- 資料庫： `panda_eat`
--

-- --------------------------------------------------------

--
-- 資料表結構 `commodity`
--

CREATE TABLE `commodity` (
  `CommodityID` int(11) NOT NULL,
  `shopID` int(11) NOT NULL,
  `commodityName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `commodity`
--

INSERT INTO `commodity` (`CommodityID`, `shopID`, `commodityName`, `price`) VALUES
(1, 1, '陽春麵', 30),
(2, 1, '鴨蛋', 50);

-- --------------------------------------------------------

--
-- 資料表結構 `food`
--

CREATE TABLE `food` (
  `foodID` int(11) NOT NULL,
  `transactionID` int(11) NOT NULL,
  `CommodityID` int(11) NOT NULL,
  `userID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `food`
--

INSERT INTO `food` (`foodID`, `transactionID`, `CommodityID`, `userID`, `amount`) VALUES
(1, 2, 1, 'shawn70020', 5),
(2, 2, 2, 'shawn70020', 4);

-- --------------------------------------------------------

--
-- 資料表結構 `shop`
--

CREATE TABLE `shop` (
  `shopID` int(11) NOT NULL,
  `shopName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `shopPhone` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `shopAddress` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `shopTime` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `shop`
--

INSERT INTO `shop` (`shopID`, `shopName`, `shopPhone`, `shopAddress`, `shopTime`) VALUES
(1, '布萊德大公司', '0912345678', '台中市南屯區公益路二段51號\r\n', '星期一公休 其餘營業時間24小時');

-- --------------------------------------------------------

--
-- 資料表結構 `transaction`
--

CREATE TABLE `transaction` (
  `transactionID` int(11) NOT NULL,
  `userID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `transactionTime` datetime NOT NULL DEFAULT current_timestamp(),
  `shopID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `transaction`
--

INSERT INTO `transaction` (`transactionID`, `userID`, `transactionTime`, `shopID`) VALUES
(2, 'shawn70020', '2019-08-02 13:33:32', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `userID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ext` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `PWD` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `user`
--

INSERT INTO `user` (`userID`, `name`, `ext`, `PWD`) VALUES
('shawn70020', '王大明', '3306', 'mypassword');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `commodity`
--
ALTER TABLE `commodity`
  ADD PRIMARY KEY (`CommodityID`),
  ADD KEY `shopID` (`shopID`);

--
-- 資料表索引 `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`foodID`),
  ADD KEY `transactionID` (`transactionID`),
  ADD KEY `CommodityID` (`CommodityID`),
  ADD KEY `userID` (`userID`);

--
-- 資料表索引 `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`shopID`);

--
-- 資料表索引 `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transactionID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `shopID` (`shopID`);

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
  MODIFY `CommodityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `food`
--
ALTER TABLE `food`
  MODIFY `foodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `shop`
--
ALTER TABLE `shop`
  MODIFY `shopID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transactionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `commodity`
--
ALTER TABLE `commodity`
  ADD CONSTRAINT `commodity_ibfk_1` FOREIGN KEY (`shopID`) REFERENCES `shop` (`shopID`);

--
-- 資料表的限制式 `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `food_ibfk_1` FOREIGN KEY (`CommodityID`) REFERENCES `commodity` (`CommodityID`),
  ADD CONSTRAINT `food_ibfk_2` FOREIGN KEY (`transactionID`) REFERENCES `transaction` (`transactionID`),
  ADD CONSTRAINT `food_ibfk_3` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- 資料表的限制式 `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`shopID`) REFERENCES `shop` (`shopID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
