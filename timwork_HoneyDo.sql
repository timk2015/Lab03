-- phpMyAdmin SQL Dump
-- version 4.3.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 16, 2015 at 10:43 PM
-- Server version: 5.5.42-37.1
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `timwork_HoneyDo`
--

-- --------------------------------------------------------

--
-- Table structure for table `BRAND`
--

CREATE TABLE IF NOT EXISTS `BRAND` (
  `BrandID` int(11) NOT NULL,
  `BrandName` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `Store` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `BRAND`
--

INSERT INTO `BRAND` (`BrandID`, `BrandName`, `Store`) VALUES
(1, 'Mead', 1),
(2, 'Giant', 1),
(3, 'Pringles', 1),
(4, 'Turkey Hill', 1),
(5, 'Minute Maid', 1),
(6, 'Alcon', 1),
(7, 'ConAgra Foods', 1);

-- --------------------------------------------------------

--
-- Table structure for table `HOME_ITEM`
--

CREATE TABLE IF NOT EXISTS `HOME_ITEM` (
  `ItemID` int(11) NOT NULL,
  `ItemName` char(35) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Item Name',
  `BrandID` int(11) NOT NULL,
  `ItemDescription` char(40) COLLATE utf8_unicode_ci DEFAULT 'Item Description',
  `upcNumber` char(15) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `HOME_ITEM`
--

INSERT INTO `HOME_ITEM` (`ItemID`, `ItemName`, `BrandID`, `ItemDescription`, `upcNumber`) VALUES
(1, 'Quad-Ruled Notebook', 1, '80 Sheets', '0-43100-59878-7'),
(2, 'Pacific Blend Ground Coffee', 2, 'Premium Ground Coffee - Great taste', '6-88267-10417-6'),
(3, 'Acadia Natural Spring Water', 2, '16.9 Fluid Ounces', '6-88267-02276-0'),
(4, 'Chef Boyardee Overstuffed Ravioli', 7, '15 ounces', '0-64144-04212-8'),
(5, 'Classic Potato Chips', 2, '10 ounce bag', '6-88267-11970-5');

-- --------------------------------------------------------

--
-- Table structure for table `PREFERRED_BRAND`
--

CREATE TABLE IF NOT EXISTS `PREFERRED_BRAND` (
  `ItemID` int(11) NOT NULL,
  `brandID` int(11) NOT NULL,
  `IsPreferred` tinyint(1) NOT NULL DEFAULT '0',
  `IsAlternate` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PREFERRED_BRAND`
--

INSERT INTO `PREFERRED_BRAND` (`ItemID`, `brandID`, `IsPreferred`, `IsAlternate`) VALUES
(0, 0, 0, 0),
(1, 1, 1, 1),
(2, 2, 1, 1),
(3, 2, 0, 1),
(4, 7, 1, 1),
(5, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `STORE`
--

CREATE TABLE IF NOT EXISTS `STORE` (
  `storeID` int(11) NOT NULL,
  `storeName` char(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `storeStreetAddress` char(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `storeCity` char(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `storeState` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `storeZipCode` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `storeWebAddress` char(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `STORE`
--

INSERT INTO `STORE` (`storeID`, `storeName`, `storeStreetAddress`, `storeCity`, `storeState`, `storeZipCode`, `storeWebAddress`) VALUES
(1, 'Giant', '4357 West Swamp Road', 'Doylestown', 'PA', '18902-1039', 'http://giantfoodstores.com/sto'),
(2, 'True Value', '4373 West Swamp Road', 'Doylestown', 'PA', '18901', 'http://ww3.truevalue.com/doyle'),
(3, 'Walmart', '1515 Bethlehem Pike', 'Hatfield', 'PA', '19440', 'http://www.walmart.com/store/2'),
(4, 'Weis Markets', '73 Old Dublin Pike', 'Doylestown', 'PA', '18901', 'http://weismarkets.mywebgrocer'),
(5, 'Acme Markets', '480 N Main St', 'Doylestown', 'PA', '18901', 'http://www.acmemarkets.com/pd/'),
(6, 'Staples', '436 N Main Street', 'Doylestown', 'PA', '18901', 'http://storelocator.staples.co');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `BRAND`
--
ALTER TABLE `BRAND`
  ADD PRIMARY KEY (`BrandID`), ADD KEY `fk_Store` (`Store`);

--
-- Indexes for table `HOME_ITEM`
--
ALTER TABLE `HOME_ITEM`
  ADD PRIMARY KEY (`ItemID`);

--
-- Indexes for table `PREFERRED_BRAND`
--
ALTER TABLE `PREFERRED_BRAND`
  ADD UNIQUE KEY `pk` (`ItemID`,`brandID`), ADD KEY `BRAND_ID_PK` (`brandID`);

--
-- Indexes for table `STORE`
--
ALTER TABLE `STORE`
  ADD PRIMARY KEY (`storeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `BRAND`
--
ALTER TABLE `BRAND`
  MODIFY `BrandID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `HOME_ITEM`
--
ALTER TABLE `HOME_ITEM`
  MODIFY `ItemID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `STORE`
--
ALTER TABLE `STORE`
  MODIFY `storeID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
