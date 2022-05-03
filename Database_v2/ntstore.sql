-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 03, 2022 at 03:53 PM
-- Server version: 10.2.41-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ntstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='danh m?c';

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `CustomerCode` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Address` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `PhoneNumber` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Gender` int(11) DEFAULT NULL,
  `DateOfBirth` datetime DEFAULT NULL,
  `CustomerName` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='B?ng khách hàng';

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmployeeID` int(11) NOT NULL,
  `EmployeeCode` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Position` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `AccoutName` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Password` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `EmployeeName` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Gender` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Nhân viên';

-- --------------------------------------------------------

--
-- Table structure for table `export_invoice`
--

CREATE TABLE `export_invoice` (
  `InvoiceID` int(11) NOT NULL,
  `InvoiceName` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `DateCreate` date DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='hóa don xuát';

-- --------------------------------------------------------

--
-- Table structure for table `export_invoice_product`
--

CREATE TABLE `export_invoice_product` (
  `InvoiceID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `TotalExport` int(11) DEFAULT NULL,
  `PriceExport` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Hóa don xu?t - s?n ph?m';

-- --------------------------------------------------------

--
-- Table structure for table `import_invoice`
--

CREATE TABLE `import_invoice` (
  `InvoiceID` int(11) NOT NULL,
  `InvoiceName` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `DateCreate` date DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `ManufactureID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Hóa don nh?p';

-- --------------------------------------------------------

--
-- Table structure for table `import_invoice_product`
--

CREATE TABLE `import_invoice_product` (
  `InvoiceID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `TotalImport` int(11) DEFAULT NULL,
  `PriceImport` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Hóa don nh?p s?n ph?m';

-- --------------------------------------------------------

--
-- Table structure for table `manufacture`
--

CREATE TABLE `manufacture` (
  `ManufactureID` int(11) NOT NULL,
  `ManufactureName` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Address` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `PhoneNumber` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `ManufactureCode` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Nhà cung c?p';

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `ExportPrice` double DEFAULT NULL,
  `ImportPrice` double DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `Description` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Quality` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='S?n ph?m';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Indexes for table `export_invoice`
--
ALTER TABLE `export_invoice`
  ADD PRIMARY KEY (`InvoiceID`),
  ADD KEY `FK_export_invoice_CustomerID` (`CustomerID`),
  ADD KEY `FK_export_invoice_EmployeeID` (`EmployeeID`);

--
-- Indexes for table `export_invoice_product`
--
ALTER TABLE `export_invoice_product`
  ADD KEY `FK_export_invoice_product_InvoiceID` (`InvoiceID`),
  ADD KEY `FK_export_invoice_product_ProductID` (`ProductID`);

--
-- Indexes for table `import_invoice`
--
ALTER TABLE `import_invoice`
  ADD PRIMARY KEY (`InvoiceID`),
  ADD KEY `FK_import_invoice_ManufactureID` (`ManufactureID`),
  ADD KEY `FK_import_invoice_EmployeeID` (`EmployeeID`);

--
-- Indexes for table `import_invoice_product`
--
ALTER TABLE `import_invoice_product`
  ADD KEY `FK_import_invoice_product_InvoiceID` (`InvoiceID`),
  ADD KEY `FK_import_invoice_product_ProductID` (`ProductID`);

--
-- Indexes for table `manufacture`
--
ALTER TABLE `manufacture`
  ADD PRIMARY KEY (`ManufactureID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `FK_product_CategoryID` (`CategoryID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `export_invoice`
--
ALTER TABLE `export_invoice`
  MODIFY `InvoiceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `import_invoice`
--
ALTER TABLE `import_invoice`
  MODIFY `InvoiceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manufacture`
--
ALTER TABLE `manufacture`
  MODIFY `ManufactureID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `export_invoice`
--
ALTER TABLE `export_invoice`
  ADD CONSTRAINT `FK_export_invoice_CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_export_invoice_EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `export_invoice_product`
--
ALTER TABLE `export_invoice_product`
  ADD CONSTRAINT `FK_export_invoice_product_InvoiceID` FOREIGN KEY (`InvoiceID`) REFERENCES `export_invoice` (`InvoiceID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_export_invoice_product_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `import_invoice`
--
ALTER TABLE `import_invoice`
  ADD CONSTRAINT `FK_import_invoice_EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_import_invoice_ManufactureID` FOREIGN KEY (`ManufactureID`) REFERENCES `manufacture` (`ManufactureID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `import_invoice_product`
--
ALTER TABLE `import_invoice_product`
  ADD CONSTRAINT `FK_import_invoice_product_InvoiceID` FOREIGN KEY (`InvoiceID`) REFERENCES `import_invoice` (`InvoiceID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_import_invoice_product_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_product_CategoryID` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
