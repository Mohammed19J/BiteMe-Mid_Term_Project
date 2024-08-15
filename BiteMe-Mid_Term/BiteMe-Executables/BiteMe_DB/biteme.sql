-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: biteme
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `BranchID` int NOT NULL AUTO_INCREMENT,
  `Location` enum('North','South','Center') DEFAULT NULL,
  PRIMARY KEY (`BranchID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'North'),(2,'South'),(3,'Center');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CategoryName` varchar(255) NOT NULL,
  PRIMARY KEY (`CategoryName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('Drinks'),('MainMeal'),('Salad'),('Sweets');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certifiedworker`
--

DROP TABLE IF EXISTS `certifiedworker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certifiedworker` (
  `UserID` int NOT NULL,
  `RestaurantID` int DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `RestaurantID` (`RestaurantID`),
  CONSTRAINT `certifiedworker_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `certifiedworker_ibfk_2` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certifiedworker`
--

LOCK TABLES `certifiedworker` WRITE;
/*!40000 ALTER TABLE `certifiedworker` DISABLE KEYS */;
INSERT INTO `certifiedworker` VALUES (4,1),(6,2);
/*!40000 ALTER TABLE `certifiedworker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drinks`
--

DROP TABLE IF EXISTS `drinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drinks` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ItemID` int NOT NULL,
  `Size` enum('Small','Medium','Large') DEFAULT NULL,
  PRIMARY KEY (`ID`,`ItemID`),
  KEY `ItemID_idx` (`ItemID`),
  CONSTRAINT `FK_ItemID_Drinks` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drinks`
--

LOCK TABLES `drinks` WRITE;
/*!40000 ALTER TABLE `drinks` DISABLE KEYS */;
INSERT INTO `drinks` VALUES (1,3,'Small'),(2,3,'Medium'),(3,3,'Large'),(4,6,'Small'),(5,6,'Medium'),(6,6,'Large');
/*!40000 ALTER TABLE `drinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incomereport`
--

DROP TABLE IF EXISTS `incomereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incomereport` (
  `ReportID` int NOT NULL,
  `TotalRevenue` float DEFAULT NULL,
  `SaladRevenue` float DEFAULT NULL,
  `SweetsRevenue` float DEFAULT NULL,
  `DrinksRevenue` float DEFAULT NULL,
  `MainMealRevenue` float DEFAULT NULL,
  PRIMARY KEY (`ReportID`),
  CONSTRAINT `incomereport_ibfk_1` FOREIGN KEY (`ReportID`) REFERENCES `report` (`ReportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incomereport`
--

LOCK TABLES `incomereport` WRITE;
/*!40000 ALTER TABLE `incomereport` DISABLE KEYS */;
INSERT INTO `incomereport` VALUES (99,53.96,10.99,0,3.98,41.98),(103,136.38,32.97,11.98,5.97,125.94),(107,217.712,43.96,17.97,0,230.89),(111,89.91,21.98,11.98,1.99,41.98),(115,190.732,54.95,0,3.98,188.91),(119,127.41,10.99,17.97,3.98,167.92);
/*!40000 ALTER TABLE `incomereport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `ItemID` int NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(255) DEFAULT NULL,
  `CategoryName` varchar(255) DEFAULT NULL,
  `Description` text,
  `Cost` float DEFAULT NULL,
  PRIMARY KEY (`ItemID`),
  KEY `CategoryName` (`CategoryName`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`CategoryName`) REFERENCES `category` (`CategoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Caesar Salad','Salad','Fresh Caesar Salad',10.99),(2,'Chocolate Cake','Sweets','Delicious chocolate cake',5.99),(3,'Cola','Drinks','Refreshing cola drink',1.99),(4,'Steak','MainMeal','Grilled steak with herbs',20.99),(5,'Cookie','Sweets','Fresh Warm Chocolate Cookie',3.99),(6,'Sprite','Drinks','Refreshing sprite drink',1.99),(7,'Vanilla Cake','Sweets','Delicious vanilla cake',5.99);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemmenu`
--

DROP TABLE IF EXISTS `itemmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemmenu` (
  `ItemID` int NOT NULL,
  `MenuID` int NOT NULL,
  PRIMARY KEY (`ItemID`,`MenuID`),
  KEY `MenuID` (`MenuID`),
  CONSTRAINT `itemmenu_ibfk_1` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`),
  CONSTRAINT `itemmenu_ibfk_2` FOREIGN KEY (`MenuID`) REFERENCES `menu` (`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemmenu`
--

LOCK TABLES `itemmenu` WRITE;
/*!40000 ALTER TABLE `itemmenu` DISABLE KEYS */;
INSERT INTO `itemmenu` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(1,2),(2,2),(3,2),(4,2),(1,3),(2,3),(3,3),(4,3),(1,4),(2,4),(3,4),(4,5),(5,5),(6,5),(1,6),(4,6),(7,6);
/*!40000 ALTER TABLE `itemmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainmeal`
--

DROP TABLE IF EXISTS `mainmeal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mainmeal` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ItemID` int NOT NULL,
  `CookMethod` varchar(255) DEFAULT NULL,
  `Doneness` enum('Rare','MediumRare','Medium','MediumWell','WellDone') DEFAULT NULL,
  PRIMARY KEY (`ID`,`ItemID`),
  KEY `ItemID_idx` (`ItemID`),
  CONSTRAINT `FK_ItemID_MainMeal` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainmeal`
--

LOCK TABLES `mainmeal` WRITE;
/*!40000 ALTER TABLE `mainmeal` DISABLE KEYS */;
INSERT INTO `mainmeal` VALUES (1,4,'Grilled','Rare'),(2,4,'Grilled','MediumRare'),(3,4,'Grilled','Medium'),(4,4,'Grilled','MediumWell'),(5,4,'Grilled','WellDone');
/*!40000 ALTER TABLE `mainmeal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `MenuID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`MenuID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1),(2),(3),(4),(5),(6);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `DateOfOrder` date DEFAULT NULL,
  `TimeOfOrder` varchar(255) DEFAULT NULL,
  `RestaurantID` int DEFAULT NULL,
  `PickUpType` varchar(255) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `RequestedTimeOfDelivery` varchar(255) DEFAULT NULL,
  `RequestedDateOfDelivery` date DEFAULT NULL,
  `ETA` varchar(255) DEFAULT NULL,
  `Duration` varchar(255) DEFAULT NULL,
  `Cost` float DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `UserID` (`UserID`),
  KEY `RestaurantID` (`RestaurantID`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,3,'2024-07-25','12:30',1,'Delivery','Karmiel','Ready','13:00','2024-07-25','17:00','00:15:00',32.97),(2,3,'2024-07-27','02:32',2,'TakeAway','','Received','03:25','2024-07-27',NULL,'1:12:26',65.94),(3,3,'2024-07-27','23:24',3,'Delivery','Acre','Received','23:55','2024-07-27',NULL,'1:13:34',53.96),(4,3,'2024-07-27','23:26',3,'TakeAway','','Pending','23:55','2024-07-29',NULL,NULL,5.99),(5,3,'2024-07-28','13:40',3,'Delivery','Afula','Received','14:00','2024-07-28',NULL,'0:01:45',10.495),(6,3,'2024-07-28','13:43',3,'Delivery','Afula','Received','14:00','2024-07-28',NULL,'0:00:50',10.495),(7,3,'2024-07-28','13:48',2,'TakeAway','','Received','14:00','2024-07-28',NULL,'1:00:02',10.495),(8,3,'2024-07-28','13:50',3,'TakeAway','','Received','14:00','2024-07-28',NULL,NULL,10.495),(9,3,'2024-07-28','13:55',1,'TakeAway','','Received','15:00','2024-07-28','19:30','10:07:07',20.99),(10,3,'2024-07-28','13:59',3,'TakeAway','','Pending','19:30','2024-07-28',NULL,'0:03:53',37.782),(11,3,'2024-07-28','14:00',2,'TakeAway','','Received','15:00','2024-07-28',NULL,'0:23:01',1.99),(12,3,'2024-07-28','14:03',2,'TakeAway','','Received','15:00','2024-07-28',NULL,'0:23:03',2.995),(13,3,'2024-07-28','14:08',2,'TakeAway','','Received','15:00','2024-07-28',NULL,NULL,5.495),(14,3,'2024-07-28','14:53',3,'TakeAway','','Received','15:30','2024-07-28',NULL,'0:00:-2',21.485),(15,5,'2024-07-28','15:20',3,'Delivery','Nazareth','Received','12:50','2024-07-29',NULL,'0:21:29',57.564),(16,3,'2024-07-28','15:51',3,'TakeAway','','Pending','12:50','2024-07-29',NULL,NULL,9.4455),(17,3,'2024-07-29','16:04',2,'Delivery','braude','Pending','19:00','2024-07-29',NULL,NULL,49.465),(18,5,'2024-08-10','21:17',2,'TakeAway','','Pending','22:05','2024-08-10',NULL,NULL,47.97),(19,5,'2024-08-10','21:28',2,'TakeAway','','Pending','21:30','2024-08-10',NULL,NULL,30.96),(20,5,'2024-08-10','21:32',2,'TakeAway','','Pending','21:35','2024-08-10',NULL,NULL,20.99),(21,5,'2024-08-10','21:43',2,'TakeAway','','Pending','22:00','2024-08-10',NULL,NULL,3.98),(22,5,'2024-08-10','21:46',2,'TakeAway','','Pending','22:00','2024-08-10',NULL,NULL,20.99),(23,5,'2024-08-10','23:53',2,'TakeAway','','Pending','00:00','2024-08-11',NULL,NULL,47.97),(24,5,'2024-08-11','00:01',2,'TakeAway','','Pending','00:30','2024-08-11',NULL,NULL,10.99),(26,5,'2024-08-12','21:32',2,'Delivery','Braude','Pending','15:30','2024-08-13',NULL,NULL,29.682),(27,5,'2024-08-12','21:34',1,'Delivery','Braude','Processing','23:32','2024-08-12','23:30',NULL,66.94),(28,5,'2024-08-12','23:56',1,'TakeAway','','Pending','00:00','2024-08-14',NULL,NULL,31.464),(29,5,'2024-08-12','23:59',1,'TakeAway','','Pending','00:00','2024-08-15',NULL,NULL,29.673),(30,5,'2024-08-13','00:02',1,'TakeAway','','Pending','12:30','2024-08-13',NULL,NULL,12.573),(31,5,'2024-08-13','00:08',2,'TakeAway','','Pending','12:30','2024-08-13',NULL,NULL,18.891),(32,5,'2024-08-13','00:09',2,'TakeAway','','Pending','13:50','2024-08-13',NULL,NULL,3.582),(33,5,'2024-08-13','00:10',2,'TakeAway','','Pending','15:50','2024-08-13',NULL,NULL,56.673),(34,5,'2024-08-13','02:17',2,'TakeAway','','Pending','13:50','2024-08-13',NULL,NULL,37.782),(35,5,'2024-08-13','02:18',2,'TakeAway','','Pending','14:20','2024-08-13',NULL,NULL,3.582),(36,5,'2024-08-13','21:54',2,'TakeAway','','Pending','00:00','2024-08-14',NULL,NULL,56.673),(37,3,'2024-07-25','12:30',5,'Delivery','Karmiel','Ready','13:00','2024-07-26','17:00','00:15:00',32.97),(38,3,'2024-07-27','02:32',4,'TakeAway','','Received','03:25','2024-07-19',NULL,'1:12:26',65.94),(39,3,'2024-07-27','23:24',6,'Delivery','Acre','Received','23:55','2024-07-25',NULL,'1:13:34',53.96),(40,3,'2024-07-27','23:26',4,'TakeAway','','Pending','23:55','2024-07-24',NULL,NULL,5.99),(41,3,'2024-07-28','13:40',5,'Delivery','Afula','Received','14:00','2024-07-23',NULL,'0:01:45',10.495),(42,3,'2024-07-28','13:43',6,'Delivery','Afula','Received','14:00','2024-07-29',NULL,'0:00:50',10.495),(43,3,'2024-07-28','13:48',6,'TakeAway','','Received','14:00','2024-07-15',NULL,'1:00:02',10.495),(44,3,'2024-07-28','13:50',4,'TakeAway','','Received','14:00','2024-07-17',NULL,NULL,10.495),(45,3,'2024-07-28','13:55',5,'TakeAway','','Received','15:00','2024-07-22','19:30','10:07:07',20.99),(46,3,'2024-07-28','13:59',5,'TakeAway','','Pending','19:30','2024-07-28',NULL,'0:03:53',37.782),(47,3,'2024-07-28','14:00',4,'TakeAway','','Received','15:00','2024-07-29',NULL,'0:23:01',1.99),(48,3,'2024-07-28','14:03',6,'TakeAway','','Received','15:00','2024-07-13',NULL,'0:23:03',2.995),(49,3,'2024-07-28','14:08',4,'TakeAway','','Received','15:00','2024-07-25',NULL,NULL,5.495),(50,3,'2024-07-28','14:53',5,'TakeAway','','Received','15:30','2024-07-28',NULL,'0:00:-2',21.485),(51,5,'2024-07-28','15:20',5,'Delivery','Nazareth','Received','12:50','2024-07-29',NULL,'0:21:29',57.564),(52,3,'2024-07-28','15:51',5,'TakeAway','','Pending','12:50','2024-07-29',NULL,NULL,9.4455),(53,3,'2024-07-29','16:04',6,'Delivery','braude','Pending','19:00','2024-07-25',NULL,NULL,49.465);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `OrderItemID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int DEFAULT NULL,
  `ItemID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Notes` text,
  PRIMARY KEY (`OrderItemID`),
  KEY `orderitem_ibfk_1` (`OrderID`),
  KEY `orderitem_ibfk_2` (`ItemID`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (1,1,1,1,'No croutons'),(2,1,3,2,'Large'),(3,1,4,1,'Well Done'),(4,2,1,1,'Size: Large'),(5,2,2,1,''),(6,2,4,1,'Doneness: Rare'),(7,3,4,2,'Doneness: Medium'),(8,3,2,1,'No Sugar'),(9,3,2,1,''),(10,4,2,1,''),(11,5,4,1,'Doneness: Medium'),(12,6,4,1,'Doneness: Medium'),(13,7,4,1,'Doneness: Medium'),(14,8,4,1,'Doneness: Medium'),(15,9,4,1,'Doneness: Medium'),(16,10,4,2,'Doneness: Medium'),(17,11,3,1,'Size: Large'),(18,12,2,1,''),(19,13,1,1,'Size: Medium, No Parmesan'),(20,14,4,1,'Doneness: Medium'),(21,14,1,1,'Size: Medium'),(22,14,1,1,'Size: Medium, No Parmesan'),(23,15,4,2,'Doneness: Medium'),(24,15,1,1,'Size: Medium, No Croutons'),(25,15,1,1,'Size: Medium'),(26,16,4,1,'Doneness: Medium'),(27,17,4,4,'Doneness: Medium'),(28,17,3,2,'Size: Large'),(29,17,1,1,'Size: Medium'),(30,18,4,1,'Doneness: Medium'),(31,18,4,1,'Doneness: MediumRare'),(32,18,2,1,'No Sugar'),(33,19,3,1,'Size: Medium'),(34,19,3,1,'Size: Large'),(35,19,2,1,'No Sugar'),(36,19,4,1,'Doneness: Medium'),(37,20,4,1,'Doneness: Medium'),(38,21,3,2,'Size: Large'),(39,22,4,1,'Doneness: Medium'),(40,23,4,2,'Doneness: Medium'),(41,23,2,1,'No Sugar'),(42,24,1,1,'Size: Medium, No Croutons'),(43,26,1,1,'Size: Medium, No Croutons'),(44,26,3,1,'Size: Medium'),(45,27,5,1,''),(46,27,5,1,'No Chocolate'),(47,27,7,2,''),(48,27,1,1,'Size: Large'),(49,27,1,1,'Size: Medium'),(50,28,1,2,'Size: Medium'),(51,28,1,1,'Size: Medium, No Lettuce'),(52,28,3,1,'Size: Large'),(53,29,2,1,''),(54,29,2,1,'No Sugar'),(55,29,4,1,'Doneness: MediumRare'),(56,30,7,1,''),(57,30,7,1,'No Sugar'),(58,30,3,1,'Size: Medium'),(59,31,4,1,'Doneness: Medium'),(60,32,3,1,'Size: Large'),(61,32,3,1,'Size: Medium'),(62,33,4,2,'Doneness: Medium'),(63,33,4,1,'Doneness: MediumRare'),(64,34,4,2,'Doneness: Medium'),(65,35,3,2,'Size: Large'),(66,36,4,1,'Doneness: Medium'),(67,36,4,2,'Doneness: MediumRare'),(68,37,1,1,'No croutons'),(69,37,3,2,'Large'),(70,37,4,1,'Well Done'),(71,38,1,1,'Size: Large'),(72,38,2,1,''),(73,38,4,1,'Doneness: Rare'),(74,39,4,2,'Doneness: Medium'),(75,39,2,1,'No Sugar'),(76,39,2,1,''),(77,40,2,1,''),(78,41,4,1,'Doneness: Medium'),(79,42,4,1,'Doneness: Medium'),(80,43,4,1,'Doneness: Medium'),(81,44,4,1,'Doneness: Medium'),(82,45,4,1,'Doneness: Medium'),(83,46,4,2,'Doneness: Medium'),(84,47,3,1,'Size: Large'),(85,48,2,1,''),(86,49,1,1,'Size: Medium, No Parmesan'),(87,50,4,1,'Doneness: Medium'),(88,50,1,1,'Size: Medium'),(89,50,1,1,'Size: Medium, No Parmesan'),(90,51,4,2,'Doneness: Medium'),(91,51,1,1,'Size: Medium, No Croutons'),(92,51,1,1,'Size: Medium'),(93,52,4,1,'Doneness: Medium'),(94,53,4,4,'Doneness: Medium'),(95,53,3,2,'Size: Large'),(96,53,1,1,'Size: Medium');
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderreport`
--

DROP TABLE IF EXISTS `orderreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderreport` (
  `ReportID` int NOT NULL,
  `TotalOrders` int DEFAULT NULL,
  `MainMealOrders` int DEFAULT NULL,
  `SaladOrders` int DEFAULT NULL,
  `SweetsOrders` int DEFAULT NULL,
  `DrinksOrders` int DEFAULT NULL,
  PRIMARY KEY (`ReportID`),
  CONSTRAINT `orderreport_ibfk_1` FOREIGN KEY (`ReportID`) REFERENCES `report` (`ReportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderreport`
--

LOCK TABLES `orderreport` WRITE;
/*!40000 ALTER TABLE `orderreport` DISABLE KEYS */;
INSERT INTO `orderreport` VALUES (97,2,2,1,0,1),(101,6,3,3,2,2),(105,9,8,4,3,0),(109,5,2,2,2,1),(113,7,7,5,0,1),(117,5,4,1,3,1);
/*!40000 ALTER TABLE `orderreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performancereport`
--

DROP TABLE IF EXISTS `performancereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performancereport` (
  `ReportID` int NOT NULL,
  `OnTimeOrders` int DEFAULT NULL,
  `LateOrders` int DEFAULT NULL,
  `AverageDelayTime` time DEFAULT NULL,
  PRIMARY KEY (`ReportID`),
  CONSTRAINT `performancereport_ibfk_1` FOREIGN KEY (`ReportID`) REFERENCES `report` (`ReportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performancereport`
--

LOCK TABLES `performancereport` WRITE;
/*!40000 ALTER TABLE `performancereport` DISABLE KEYS */;
INSERT INTO `performancereport` VALUES (98,0,1,'05:11:03'),(102,0,4,'00:44:38'),(106,2,3,'00:16:55'),(110,0,2,'00:47:43'),(114,1,3,'01:48:12'),(118,0,4,'00:39:22');
/*!40000 ALTER TABLE `performancereport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quarterreport`
--

DROP TABLE IF EXISTS `quarterreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quarterreport` (
  `ReportID` int NOT NULL,
  `Quarter` enum('Q1','Q2','Q3','Q4') DEFAULT NULL,
  `DailyOrders` int DEFAULT NULL,
  `TotalRevenue` float DEFAULT NULL,
  PRIMARY KEY (`ReportID`),
  CONSTRAINT `quarterreport_ibfk_1` FOREIGN KEY (`ReportID`) REFERENCES `report` (`ReportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quarterreport`
--

LOCK TABLES `quarterreport` WRITE;
/*!40000 ALTER TABLE `quarterreport` DISABLE KEYS */;
INSERT INTO `quarterreport` VALUES (96,'Q3',3,194.61),(100,'Q3',5,527.095),(104,'Q3',4,217.712),(108,'Q3',2,89.91),(112,'Q3',3,190.732),(116,'Q3',1,127.41);
/*!40000 ALTER TABLE `quarterreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quarterreportdailyorders`
--

DROP TABLE IF EXISTS `quarterreportdailyorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quarterreportdailyorders` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ReportID` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `NumberOfOrders` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ReportID_idx` (`ReportID`),
  CONSTRAINT `ReportID` FOREIGN KEY (`ReportID`) REFERENCES `quarterreport` (`ReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quarterreportdailyorders`
--

LOCK TABLES `quarterreportdailyorders` WRITE;
/*!40000 ALTER TABLE `quarterreportdailyorders` DISABLE KEYS */;
INSERT INTO `quarterreportdailyorders` VALUES (33,96,'2024-08-13',1),(34,96,'2024-07-28',1),(35,96,'2024-08-12',3),(36,96,'2024-07-25',1),(37,100,'2024-07-29',1),(38,100,'2024-08-13',6),(39,100,'2024-07-28',4),(40,100,'2024-08-12',1),(41,100,'2024-07-27',1),(42,100,'2024-08-11',1),(43,100,'2024-08-10',6),(44,104,'2024-07-27',2),(45,104,'2024-07-28',7),(46,108,'2024-07-27',2),(47,108,'2024-07-28',3),(48,112,'2024-07-25',1),(49,112,'2024-07-28',6),(50,116,'2024-07-29',1),(51,116,'2024-07-28',3),(52,116,'2024-07-27',1);
/*!40000 ALTER TABLE `quarterreportdailyorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `ReportID` int NOT NULL AUTO_INCREMENT,
  `RestaurantID` int DEFAULT NULL,
  `Year` year DEFAULT NULL,
  `Month` varchar(255) DEFAULT NULL,
  `ReportType` enum('QuarterReport','OrderReport','IncomeReport','PerformanceReport') DEFAULT NULL,
  PRIMARY KEY (`ReportID`),
  KEY `RestaurantID` (`RestaurantID`),
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (96,1,2024,'7','QuarterReport'),(97,1,2024,'7','OrderReport'),(98,1,2024,'7','PerformanceReport'),(99,1,2024,'7','IncomeReport'),(100,2,2024,'7','QuarterReport'),(101,2,2024,'7','OrderReport'),(102,2,2024,'7','PerformanceReport'),(103,2,2024,'7','IncomeReport'),(104,3,2024,'7','QuarterReport'),(105,3,2024,'7','OrderReport'),(106,3,2024,'7','PerformanceReport'),(107,3,2024,'7','IncomeReport'),(108,4,2024,'7','QuarterReport'),(109,4,2024,'7','OrderReport'),(110,4,2024,'7','PerformanceReport'),(111,4,2024,'7','IncomeReport'),(112,5,2024,'7','QuarterReport'),(113,5,2024,'7','OrderReport'),(114,5,2024,'7','PerformanceReport'),(115,5,2024,'7','IncomeReport'),(116,6,2024,'7','QuarterReport'),(117,6,2024,'7','OrderReport'),(118,6,2024,'7','PerformanceReport'),(119,6,2024,'7','IncomeReport');
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `RestaurantID` int NOT NULL AUTO_INCREMENT,
  `RestaurantName` varchar(255) DEFAULT NULL,
  `BranchID` int DEFAULT NULL,
  `MenuID` int DEFAULT NULL,
  PRIMARY KEY (`RestaurantID`),
  KEY `BranchID` (`BranchID`),
  CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`BranchID`) REFERENCES `branch` (`BranchID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'Cody\'s Restaurant',1,1),(2,'Madilin\'s Restaurant',2,2),(3,'Eataliano Restaurant',3,3),(4,'Paradise Restaurant',1,4),(5,'The King Restaurant',2,5),(6,'Palace Restaurant',3,6);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salad`
--

DROP TABLE IF EXISTS `salad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salad` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ItemID` int NOT NULL,
  `Size` enum('Small','Medium','Large') DEFAULT NULL,
  `Ingredients` text,
  PRIMARY KEY (`ID`,`ItemID`),
  KEY `ItemID_idx` (`ItemID`),
  CONSTRAINT `ItemID` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salad`
--

LOCK TABLES `salad` WRITE;
/*!40000 ALTER TABLE `salad` DISABLE KEYS */;
INSERT INTO `salad` VALUES (1,1,'Small','Lettuce, Croutons, Parmesan, Caesar Dressing'),(2,1,'Medium','Lettuce, Croutons, Parmesan, Caesar Dressing'),(3,1,'Large','Lettuce, Croutons, Parmesan, Caesar Dressing');
/*!40000 ALTER TABLE `salad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sweets`
--

DROP TABLE IF EXISTS `sweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sweets` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ItemID` int NOT NULL,
  `Ingredients` text,
  PRIMARY KEY (`ID`,`ItemID`),
  KEY `ItemID_idx` (`ItemID`),
  CONSTRAINT `FK_ItemID` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sweets`
--

LOCK TABLES `sweets` WRITE;
/*!40000 ALTER TABLE `sweets` DISABLE KEYS */;
INSERT INTO `sweets` VALUES (1,2,'Flour, Sugar, Cocoa, Eggs'),(2,5,'Chocolate, Dough, Milk'),(3,7,'Flour, Sugar, Vanilla, Eggs');
/*!40000 ALTER TABLE `sweets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `UserType` enum('CEO','Manager','Customer','Supplier') DEFAULT NULL,
  `BranchID` int DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `CreditCard` varchar(255) DEFAULT NULL,
  `isLogged` tinyint NOT NULL DEFAULT '0',
  `amountOfCopuns` int NOT NULL DEFAULT '0',
  `AccountType` varchar(255) NOT NULL DEFAULT 'Private',
  PRIMARY KEY (`UserID`),
  KEY `BranchID` (`BranchID`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`BranchID`) REFERENCES `branch` (`BranchID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Alice','Smith','alice','password123','CEO',1,'1234567890','alice@example.com','',0,0,'Business'),(2,'Bob','Johnson','bob','password123','Manager',2,'0987654321','bob@example.com','',0,0,'Business'),(3,'Charlie','Brown','charlie','password123','Customer',3,'1122334455','charlie@example.com','5555444433332222',0,5,'Private'),(4,'David','Williams','david','123456','Supplier',1,'6677889900','david@example.com','',0,0,'Business'),(5,'aa','aa','aa','aa','Customer',1,'0543112220','aa@example.com','',0,0,'Business'),(6,'bb','bb','bb','bb','Supplier',2,'1231231231','bb@example.com','',0,0,'Business');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-14 16:32:06
