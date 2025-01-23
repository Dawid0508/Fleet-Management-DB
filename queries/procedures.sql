-- Procedura UpdateDriverStatus zmienia status kierowcy na Inactive, 
-- jeśli liczba wypadków przekracza 5.

DELIMITER $$

CREATE PROCEDURE UpdateDriverStatus(driver_id INT)
BEGIN
    DECLARE accident_count INT;

    SELECT COUNT(*) INTO accident_count
    FROM Accidents
    WHERE DriverID = driver_id;

    IF accident_count > 5 THEN
        UPDATE Drivers
        SET Status = 'Inactive'
        WHERE DriverID = driver_id;
    END IF;
END$$

DELIMITER ;

-- Procedura GenerateVehicleCostReport zwraca całkowite koszty dla danego pojazdu.

DELIMITER $$

CREATE PROCEDURE GenerateVehicleCostReport(vehicle_id INT)
BEGIN
    DECLARE total_fuel_cost DECIMAL(10, 2);
    DECLARE total_repair_cost DECIMAL(10, 2);
    DECLARE total_accident_cost DECIMAL(10, 2);

    SELECT COALESCE(SUM(Cost), 0) INTO total_fuel_cost FROM FuelLogs WHERE VehicleID = vehicle_id;
    SELECT COALESCE(SUM(Cost), 0) INTO total_repair_cost FROM Repairs WHERE VehicleID = vehicle_id;
    SELECT COALESCE(SUM(DamageCost), 0) INTO total_accident_cost FROM Accidents WHERE VehicleID = vehicle_id;

    SELECT total_fuel_cost AS FuelCost, total_repair_cost AS RepairCost, total_accident_cost AS AccidentCost;
END$$

DELIMITER ;

-- Procedura przypisuje wszystkie pojazdy starsze niż 10 lat do oddziału "Archiwum".

DELIMITER $$

CREATE PROCEDURE AssignOldVehiclesToArchive()
BEGIN
    DECLARE archive_branch_id INT;

    SELECT BranchID INTO archive_branch_id
    FROM Branches
    WHERE BranchName = 'Archiwum';

    UPDATE Vehicles
    SET BranchID = archive_branch_id
    WHERE YEAR(CURDATE()) - Year > 10;
END$$

DELIMITER ;

-- Procedura AddNewVehicle wstawia nowy pojazd i przypisuje go do oddziału w zależności o jego typu.

DELIMITER $$

CREATE PROCEDURE AddNewVehicle(
    IN make VARCHAR(50),
    IN model VARCHAR(50),
    IN year INT,
    IN reg_number VARCHAR(15),
    IN type_id INT
)
BEGIN
    DECLARE branch_id INT;

    -- Przypisz oddział w zależności od typu pojazdu
    SELECT BranchID INTO branch_id
    FROM Branches
    WHERE BranchName = CASE
        WHEN type_id = 1 THEN 'Osobowy'
        WHEN type_id = 2 THEN 'Dostawczy'
        WHEN type_id = 3 THEN 'Ciężarowy'
        ELSE 'Inne'
    END;

    -- Wstaw pojazd do tabeli Vehicles
    INSERT INTO Vehicles (Make, Model, Year, RegistrationNumber, TypeID, BranchID)
    VALUES (make, model, year, reg_number, type_id, branch_id);
END$$

DELIMITER ;


-- Przypisuje konserwację wszystkim pojazdom, które jej wymagają (np. pojazdy, które nie były serwisowane przez 12 miesięcy).

DELIMITER $$

CREATE PROCEDURE AssignMaintenanceTasks()
BEGIN
    INSERT INTO MaintenanceSchedules (VehicleID, MaintenanceDate, Task, Status)
    SELECT VehicleID, CURDATE(), 'Roczny serwis', 'Pending'
    FROM Vehicles
    WHERE VehicleID NOT IN (
        SELECT VehicleID
        FROM MaintenanceSchedules
        WHERE MaintenanceDate >= CURDATE() - INTERVAL 1 YEAR
    );
END$$

DELIMITER ;

-- Procedura wyszukuje wszystkie pojazdy, które nie mają przypisania w tabeli Assignments

DELIMITER $$

CREATE PROCEDURE GenerateUnassignedVehiclesReport()
BEGIN
    SELECT v.VehicleID, v.Make, v.Model, v.RegistrationNumber
    FROM Vehicles v
    LEFT JOIN Assignments a ON v.VehicleID = a.VehicleID
    WHERE a.VehicleID IS NULL OR (a.EndDate IS NOT NULL AND a.EndDate < CURDATE());
END$$

DELIMITER ;


