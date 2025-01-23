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
-- Table structure for table `maintenanceschedules`
--

DROP TABLE IF EXISTS `maintenanceschedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenanceschedules` (
  `ScheduleID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `VehicleID` int NOT NULL,
  `MaintenanceDate` date NOT NULL,
  `Task` varchar(255) NOT NULL,
  `Status` varchar(20) DEFAULT 'Pending',
  `Cost` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`ScheduleID`),
  UNIQUE KEY `ScheduleID` (`ScheduleID`),
  KEY `VehicleID` (`VehicleID`),
  CONSTRAINT `maintenanceschedules_ibfk_1` FOREIGN KEY (`VehicleID`) REFERENCES `vehicles` (`VehicleID`),
  CONSTRAINT `chk_task_not_empty` CHECK ((char_length(`Task`) > 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenanceschedules`
--

LOCK TABLES `maintenanceschedules` WRITE;
/*!40000 ALTER TABLE `maintenanceschedules` DISABLE KEYS */;
INSERT INTO `maintenanceschedules` VALUES (1,1,'2023-06-01','Wymiana oleju','Completed',0.00),(2,2,'2023-01-15','Wymiana opon','Completed',0.00),(3,3,'2023-02-20','Przegląd techniczny','Completed',0.00),(4,4,'2023-03-25','Wymiana klocków hamulcowych','Completed',0.00),(5,5,'2023-04-10','Diagnostyka','Completed',0.00),(6,6,'2023-05-05','Naprawa klimatyzacji','Completed',0.00),(7,7,'2023-06-20','Czyszczenie filtra','Completed',0.00),(8,8,'2023-07-15','Sprawdzenie geometrii','Completed',0.00),(9,9,'2023-08-05','Kontrola układu paliwowego','Completed',0.00),(10,1,'2023-09-10','Wymiana rozrządu','Completed',0.00);
/*!40000 ALTER TABLE `maintenanceschedules` ENABLE KEYS */;
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
