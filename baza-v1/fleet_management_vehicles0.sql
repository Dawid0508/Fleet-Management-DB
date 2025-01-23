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
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `VehicleID` int NOT NULL AUTO_INCREMENT,
  `Make` varchar(50) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Year` int NOT NULL,
  `RegistrationNumber` varchar(15) NOT NULL,
  `TypeID` int DEFAULT NULL,
  `BranchID` int DEFAULT NULL,
  PRIMARY KEY (`VehicleID`),
  UNIQUE KEY `RegistrationNumber` (`RegistrationNumber`),
  KEY `TypeID` (`TypeID`),
  KEY `BranchID` (`BranchID`),
  CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`TypeID`) REFERENCES `vehicletypes` (`TypeID`),
  CONSTRAINT `vehicles_ibfk_2` FOREIGN KEY (`BranchID`) REFERENCES `branches` (`BranchID`),
  CONSTRAINT `chk_registration_length` CHECK ((char_length(`RegistrationNumber`) between 5 and 15)),
  CONSTRAINT `chk_year_static` CHECK (((`Year` >= 1900) and (`Year` <= 2100)))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (1,'Toyota','Corolla',2020,'KR12345',1,1),(2,'Ford','Focus',2018,'KR54321',2,2),(3,'Volkswagen','Golf',2019,'KR78901',1,3),(4,'BMW','X5',2022,'KR65432',4,4),(5,'Audi','A6',2017,'KR45678',1,5),(6,'Mercedes','Sprinter',2021,'KR11223',2,6),(7,'Fiat','Ducato',2020,'KR99887',2,7),(8,'Skoda','Octavia',2018,'KR77665',1,8),(9,'Toyota','RAV4',2023,'KR22334',4,1),(10,'Ford','Transit',2015,'KR66554',2,9),(11,'Peugeot','208',2021,'KR55443',1,2);
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
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
