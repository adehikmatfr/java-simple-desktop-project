-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2019 at 03:29 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `makanan`
--

CREATE TABLE `makanan` (
  `MakananID` int(11) NOT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `TypeID` int(11) DEFAULT NULL,
  `Harga` int(11) DEFAULT NULL,
  `Stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `makanan`
--

INSERT INTO `makanan` (`MakananID`, `Nama`, `TypeID`, `Harga`, `Stok`) VALUES
(1, 'Sebak Ceker', 1, 9000, 5),
(2, 'Sebak Pedas', 1, 5000, 30),
(3, 'Sebak Mix', 1, 130000, 40);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `PenjualanID` int(11) NOT NULL,
  `MakananID` int(11) DEFAULT NULL,
  `Qty` int(11) DEFAULT NULL,
  `Harga` int(11) DEFAULT NULL,
  `Tanggal` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`PenjualanID`, `MakananID`, `Qty`, `Harga`, `Tanggal`) VALUES
(1, 1, 3, 30000, '2019-10-24 19:11:36'),
(2, 1, 1, 9000, '2019-10-24 20:15:47'),
(3, 1, 1, 9000, '2019-10-24 20:15:47');

--
-- Triggers `penjualan`
--
DELIMITER $$
CREATE TRIGGER `del_beli` AFTER DELETE ON `penjualan` FOR EACH ROW Update makanan set Stok=Stok+old.Qty WHERE MakananID=old.MakananID
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ins_beli` AFTER INSERT ON `penjualan` FOR EACH ROW Update makanan set Stok=Stok-new.Qty WHERE MakananID=new.MakananID
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `upd_beli` AFTER UPDATE ON `penjualan` FOR EACH ROW Update makanan set Stok=Stok+old.Qty-new.Qty WHERE MakananID=old.MakananID
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `TypeID` int(11) NOT NULL,
  `Nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`TypeID`, `Nama`) VALUES
(1, 'Seblak'),
(2, 'Bakso'),
(3, 'Juice'),
(4, 'Nasi Goreng');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `makanan`
--
ALTER TABLE `makanan`
  ADD PRIMARY KEY (`MakananID`),
  ADD KEY `TypeID` (`TypeID`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`PenjualanID`),
  ADD KEY `MakananID` (`MakananID`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`TypeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `makanan`
--
ALTER TABLE `makanan`
  MODIFY `MakananID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `PenjualanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `TypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `makanan`
--
ALTER TABLE `makanan`
  ADD CONSTRAINT `makanan_ibfk_1` FOREIGN KEY (`TypeID`) REFERENCES `type` (`TypeID`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`MakananID`) REFERENCES `makanan` (`MakananID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
