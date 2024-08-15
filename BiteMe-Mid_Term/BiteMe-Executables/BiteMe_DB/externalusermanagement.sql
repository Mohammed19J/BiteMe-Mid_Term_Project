-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: externalusermanagement
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
-- Table structure for table `certifiedworker`
--

DROP TABLE IF EXISTS `certifiedworker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certifiedworker` (
  `UserID` int NOT NULL,
  `RestaurantID` int DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `RestaurantID` (`RestaurantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certifiedworker`
--

LOCK TABLES `certifiedworker` WRITE;
/*!40000 ALTER TABLE `certifiedworker` DISABLE KEYS */;
INSERT INTO `certifiedworker` VALUES (11,3),(9,4),(10,5),(12,6);
/*!40000 ALTER TABLE `certifiedworker` ENABLE KEYS */;
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
  KEY `BranchID` (`BranchID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (7,'Emma','Johnson','emma','EmJ2024','Manager',1,'0987654321','emma@example.com','',0,0,'Business'),(8,'Liam','Smith','liam','lism','Manager',3,'0987654321','liam@example.com','',0,0,'Business'),(9,'Olivia','Williams','olivia','aabbcc','Supplier',1,'6677889900','olivia@example.com','',0,0,'Business'),(10,'Noah','Brown','noah','112233','Supplier',2,'6677889900','noah@example.com','',0,0,'Business'),(11,'Ava','Davis','ava','qwer123','Supplier',3,'6677889900','ava@example.com','',0,0,'Business'),(12,'Ethan','Martinez','ethan','abcde','Supplier',3,'6677889900','ethan@example.com','',0,0,'Business');
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

-- Dump completed on 2024-08-14 15:14:55
