DELIMITER //

CREATE TRIGGER trg_vehicles_year_check
BEFORE INSERT ON Vehicles
FOR EACH ROW
BEGIN
    IF NEW.Year < 1900 OR NEW.Year > YEAR(CURDATE()) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid year: must be between 1900 and the current year';
    END IF;
END;
//

DELIMITER ;


DELIMITER $$

CREATE TRIGGER trg_update_maintenance_status_before_update
BEFORE UPDATE ON MaintenanceSchedules
FOR EACH ROW
BEGIN
    IF NEW.MaintenanceDate < CURDATE() THEN
        SET NEW.Status = 'Completed';
    END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_update_maintenance_status_before_insert
BEFORE INSERT ON MaintenanceSchedules
FOR EACH ROW
BEGIN
    IF NEW.MaintenanceDate < CURDATE() THEN
        SET NEW.Status = 'Completed';
    END IF;
END$$

DELIMITER ;




-- Trigger: Walidacja negatywnych kosztów w tabelach kosztowych
DELIMITER $$

CREATE TRIGGER trg_validate_positive_costs_fuel_insert
BEFORE INSERT ON FuelLogs
FOR EACH ROW
BEGIN
    IF NEW.Cost < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Fuel cost cannot be negative';
    END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_validate_positive_costs_fuel_update
BEFORE UPDATE ON FuelLogs
FOR EACH ROW
BEGIN
    IF NEW.Cost < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Fuel cost cannot be negative';
    END IF;
END$$

DELIMITER ;



-- Trigger: Logowanie dodawania nowych kierowców
DELIMITER $$

CREATE TRIGGER trg_log_driver_insert
AFTER INSERT ON Drivers
FOR EACH ROW
BEGIN
    INSERT INTO Logs (LogDate, LogMessage)
    VALUES (NOW(), CONCAT('New driver added: ', NEW.FirstName, ' ', NEW.LastName));
END$$

DELIMITER ;


CREATE TABLE Logs (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    LogDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    LogMessage TEXT NOT NULL
);




-- Trigger: Automatyczne przypisywanie pojazdów do "defaultowego" oddziału, jeśli nie podano
DELIMITER $$

CREATE TRIGGER trg_assign_default_branch
BEFORE INSERT ON Vehicles
FOR EACH ROW
BEGIN
    IF NEW.BranchID IS NULL THEN
        SET NEW.BranchID = (SELECT BranchID FROM Branches WHERE BranchName = 'Default' LIMIT 1);
    END IF;
END$$

DELIMITER ;


-- Wyzwalacz, który automatycznie usuwa dane z tabeli Logs starsze niż 90 dni

DELIMITER $$

CREATE EVENT CleanupOldLogs
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    DELETE FROM Logs WHERE LogDate < NOW() - INTERVAL 90 DAY;
END$$

DELIMITER ;
