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
-- Table structure for table `repairs`
--

DROP TABLE IF EXISTS `repairs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repairs` (
  `RepairID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `VehicleID` int NOT NULL,
  `RepairDate` date NOT NULL,
  `Description` text NOT NULL,
  `Cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`RepairID`),
  UNIQUE KEY `RepairID` (`RepairID`),
  KEY `VehicleID` (`VehicleID`),
  CONSTRAINT `repairs_ibfk_1` FOREIGN KEY (`VehicleID`) REFERENCES `vehicles` (`VehicleID`),
  CONSTRAINT `chk_repair_cost_positive` CHECK ((`Cost` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repairs`
--

LOCK TABLES `repairs` WRITE;
/*!40000 ALTER TABLE `repairs` DISABLE KEYS */;
INSERT INTO `repairs` VALUES (1,1,'2023-04-01','Wymiana opon',800.00),(2,2,'2023-01-15','Wymiana oleju',150.00),(3,3,'2023-02-20','Naprawa zawieszenia',800.00),(4,4,'2023-03-25','Regeneracja hamulców',600.00),(5,5,'2023-04-10','Wymiana rozrządu',1200.00),(6,6,'2023-05-05','Naprawa klimatyzacji',500.00),(7,7,'2023-06-20','Wymiana opon',400.00),(8,8,'2023-07-15','Naprawa układu wydechowego',900.00),(9,9,'2023-08-05','Naprawa silnika',3000.00),(10,1,'2023-09-10','Wymiana świec',200.00);
/*!40000 ALTER TABLE `repairs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-23 19:42:18
