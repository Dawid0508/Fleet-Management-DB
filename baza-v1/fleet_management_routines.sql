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
-- Temporary view structure for view `monthlyaveragecosts`
--

DROP TABLE IF EXISTS `monthlyaveragecosts`;
/*!50001 DROP VIEW IF EXISTS `monthlyaveragecosts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `monthlyaveragecosts` AS SELECT 
 1 AS `Month`,
 1 AS `AvgFuelCost`,
 1 AS `AvgRepairCost`,
 1 AS `AvgMaintenanceCost`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `driveraccidentcounts`
--

DROP TABLE IF EXISTS `driveraccidentcounts`;
/*!50001 DROP VIEW IF EXISTS `driveraccidentcounts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `driveraccidentcounts` AS SELECT 
 1 AS `DriverID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `AccidentCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `driverassignments`
--

DROP TABLE IF EXISTS `driverassignments`;
/*!50001 DROP VIEW IF EXISTS `driverassignments`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `driverassignments` AS SELECT 
 1 AS `DriverID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `VehicleID`,
 1 AS `StartDate`,
 1 AS `EndDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vehicledetails`
--

DROP TABLE IF EXISTS `vehicledetails`;
/*!50001 DROP VIEW IF EXISTS `vehicledetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vehicledetails` AS SELECT 
 1 AS `VehicleID`,
 1 AS `Make`,
 1 AS `Model`,
 1 AS `VehicleType`,
 1 AS `Branch`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `currentvehicleassignments`
--

DROP TABLE IF EXISTS `currentvehicleassignments`;
/*!50001 DROP VIEW IF EXISTS `currentvehicleassignments`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `currentvehicleassignments` AS SELECT 
 1 AS `VehicleID`,
 1 AS `Make`,
 1 AS `Model`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `StartDate`,
 1 AS `EndDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vehiclecosts`
--

DROP TABLE IF EXISTS `vehiclecosts`;
/*!50001 DROP VIEW IF EXISTS `vehiclecosts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vehiclecosts` AS SELECT 
 1 AS `VehicleID`,
 1 AS `Make`,
 1 AS `Model`,
 1 AS `TotalFuelCost`,
 1 AS `TotalRepairCost`,
 1 AS `TotalAccidentCost`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `monthlyaveragecosts`
--

/*!50001 DROP VIEW IF EXISTS `monthlyaveragecosts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `monthlyaveragecosts` AS select date_format(`fuellogs`.`Date`,'%Y-%m') AS `Month`,avg(`fuellogs`.`Cost`) AS `AvgFuelCost`,avg(`repairs`.`Cost`) AS `AvgRepairCost`,avg(`maintenanceschedules`.`Cost`) AS `AvgMaintenanceCost` from ((`fuellogs` left join `repairs` on(((month(`fuellogs`.`Date`) = month(`repairs`.`RepairDate`)) and (year(`fuellogs`.`Date`) = year(`repairs`.`RepairDate`))))) left join `maintenanceschedules` on(((month(`fuellogs`.`Date`) = month(`maintenanceschedules`.`MaintenanceDate`)) and (year(`fuellogs`.`Date`) = year(`maintenanceschedules`.`MaintenanceDate`))))) group by date_format(`fuellogs`.`Date`,'%Y-%m') order by `Month` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `driveraccidentcounts`
--

/*!50001 DROP VIEW IF EXISTS `driveraccidentcounts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `driveraccidentcounts` AS select `d`.`DriverID` AS `DriverID`,`d`.`FirstName` AS `FirstName`,`d`.`LastName` AS `LastName`,count(`a`.`AccidentID`) AS `AccidentCount` from (`drivers` `d` left join `accidents` `a` on((`d`.`DriverID` = `a`.`DriverID`))) group by `d`.`DriverID`,`d`.`FirstName`,`d`.`LastName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `driverassignments`
--

/*!50001 DROP VIEW IF EXISTS `driverassignments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `driverassignments` AS select `d`.`DriverID` AS `DriverID`,`d`.`FirstName` AS `FirstName`,`d`.`LastName` AS `LastName`,`a`.`VehicleID` AS `VehicleID`,`a`.`StartDate` AS `StartDate`,`a`.`EndDate` AS `EndDate` from (`drivers` `d` left join `assignments` `a` on((`d`.`DriverID` = `a`.`DriverID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vehicledetails`
--

/*!50001 DROP VIEW IF EXISTS `vehicledetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vehicledetails` AS select `v`.`VehicleID` AS `VehicleID`,`v`.`Make` AS `Make`,`v`.`Model` AS `Model`,`vt`.`TypeName` AS `VehicleType`,`b`.`BranchName` AS `Branch` from ((`vehicles` `v` left join `vehicletypes` `vt` on((`v`.`TypeID` = `vt`.`TypeID`))) left join `branches` `b` on((`v`.`BranchID` = `b`.`BranchID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `currentvehicleassignments`
--

/*!50001 DROP VIEW IF EXISTS `currentvehicleassignments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `currentvehicleassignments` AS select `v`.`VehicleID` AS `VehicleID`,`v`.`Make` AS `Make`,`v`.`Model` AS `Model`,`d`.`FirstName` AS `FirstName`,`d`.`LastName` AS `LastName`,`a`.`StartDate` AS `StartDate`,`a`.`EndDate` AS `EndDate` from ((`vehicles` `v` left join `assignments` `a` on((`v`.`VehicleID` = `a`.`VehicleID`))) left join `drivers` `d` on((`a`.`DriverID` = `d`.`DriverID`))) where ((`a`.`EndDate` is null) or (`a`.`EndDate` >= curdate())) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vehiclecosts`
--

/*!50001 DROP VIEW IF EXISTS `vehiclecosts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vehiclecosts` AS select `v`.`VehicleID` AS `VehicleID`,`v`.`Make` AS `Make`,`v`.`Model` AS `Model`,coalesce(sum(`f`.`Cost`),0) AS `TotalFuelCost`,coalesce(sum(`r`.`Cost`),0) AS `TotalRepairCost`,coalesce(sum(`a`.`DamageCost`),0) AS `TotalAccidentCost` from (((`vehicles` `v` left join `fuellogs` `f` on((`v`.`VehicleID` = `f`.`VehicleID`))) left join `repairs` `r` on((`v`.`VehicleID` = `r`.`VehicleID`))) left join `accidents` `a` on((`v`.`VehicleID` = `a`.`VehicleID`))) group by `v`.`VehicleID`,`v`.`Make`,`v`.`Model` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-23 19:42:20
