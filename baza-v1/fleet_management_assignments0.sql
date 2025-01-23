-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fleet_management
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignments` (
  `AssignmentID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `VehicleID` int NOT NULL,
  `DriverID` bigint unsigned NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  PRIMARY KEY (`AssignmentID`),
  UNIQUE KEY `AssignmentID` (`AssignmentID`),
  KEY `VehicleID` (`VehicleID`),
  KEY `DriverID` (`DriverID`),
  CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`VehicleID`) REFERENCES `vehicles` (`VehicleID`),
  CONSTRAINT `assignments_ibfk_2` FOREIGN KEY (`DriverID`) REFERENCES `drivers` (`DriverID`),
  CONSTRAINT `chk_dates` CHECK (((`EndDate` is null) or (`EndDate` >= `StartDate`)))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES (1,1,1,'2023-01-01','2023-01-15'),(2,2,2,'2023-02-01','2023-02-15'),(3,3,3,'2023-03-01','2023-03-20'),(4,4,4,'2023-04-01','2023-04-25'),(5,5,5,'2023-05-01',NULL),(6,6,6,'2023-06-01','2023-06-15'),(7,7,7,'2023-07-01','2023-07-20'),(8,8,8,'2023-08-01','2023-08-30'),(9,9,9,'2023-09-01',NULL),(10,1,1,'2023-10-01','2023-10-15');
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-23 19:42:20
