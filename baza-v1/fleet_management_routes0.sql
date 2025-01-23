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
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routes` (
  `RouteID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `VehicleID` int NOT NULL,
  `DriverID` bigint unsigned NOT NULL,
  `StartLocation` varchar(255) NOT NULL,
  `EndLocation` varchar(255) NOT NULL,
  `Distance` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`RouteID`),
  UNIQUE KEY `RouteID` (`RouteID`),
  KEY `VehicleID` (`VehicleID`),
  KEY `DriverID` (`DriverID`),
  CONSTRAINT `routes_ibfk_1` FOREIGN KEY (`VehicleID`) REFERENCES `vehicles` (`VehicleID`),
  CONSTRAINT `routes_ibfk_2` FOREIGN KEY (`DriverID`) REFERENCES `drivers` (`DriverID`),
  CONSTRAINT `chk_distance_positive` CHECK ((`Distance` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (1,1,1,'Kraków','Warszawa',300.00),(2,2,2,'Warszawa','Łódź',140.00),(3,3,3,'Łódź','Poznań',200.00),(4,4,4,'Poznań','Wrocław',150.00),(5,5,5,'Wrocław','Kraków',300.00),(6,6,6,'Kraków','Katowice',100.00),(7,7,7,'Katowice','Gdańsk',500.00),(8,8,8,'Gdańsk','Szczecin',400.00),(9,9,9,'Szczecin','Rzeszów',600.00),(10,1,1,'Rzeszów','Kraków',350.00);
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-23 19:42:19
