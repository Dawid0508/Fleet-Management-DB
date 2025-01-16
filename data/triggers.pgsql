-- Trigger: Automatyczne ustawianie statusu "Completed" dla harmonogramów konserwacji po dacie
CREATE OR REPLACE FUNCTION UpdateMaintenanceStatus()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.MaintenanceDate < CURRENT_DATE THEN
        NEW.Status := 'Completed';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_maintenance_status
BEFORE INSERT OR UPDATE ON MaintenanceSchedules
FOR EACH ROW
EXECUTE FUNCTION UpdateMaintenanceStatus();


-- Trigger: Walidacja negatywnych kosztów w tabelach kosztowych
CREATE OR REPLACE FUNCTION ValidatePositiveCosts()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_TABLE_NAME = 'FuelLogs' AND NEW.Cost < 0 THEN
        RAISE EXCEPTION 'Fuel cost cannot be negative';
    ELSIF TG_TABLE_NAME = 'Repairs' AND NEW.Cost < 0 THEN
        RAISE EXCEPTION 'Repair cost cannot be negative';
    ELSIF TG_TABLE_NAME = 'Accidents' AND NEW.DamageCost < 0 THEN
        RAISE EXCEPTION 'Damage cost cannot be negative';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_validate_positive_costs
BEFORE INSERT OR UPDATE ON FuelLogs
FOR EACH ROW
EXECUTE FUNCTION ValidatePositiveCosts();

CREATE TRIGGER trg_validate_positive_costs_repairs
BEFORE INSERT OR UPDATE ON Repairs
FOR EACH ROW
EXECUTE FUNCTION ValidatePositiveCosts();

CREATE TRIGGER trg_validate_positive_costs_accidents
BEFORE INSERT OR UPDATE ON Accidents
FOR EACH ROW
EXECUTE FUNCTION ValidatePositiveCosts();


-- Trigger: Logowanie dodawania nowych kierowców
CREATE OR REPLACE FUNCTION LogDriverInsert()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Logs (LogDate, LogMessage)
    VALUES (CURRENT_TIMESTAMP, 'New driver added: ' || NEW.FirstName || ' ' || NEW.LastName);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TABLE Logs (
    LogID SERIAL PRIMARY KEY,
    LogDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    LogMessage TEXT NOT NULL
);

CREATE TRIGGER trg_log_driver_insert
AFTER INSERT ON Drivers
FOR EACH ROW
EXECUTE FUNCTION LogDriverInsert();


-- Trigger: Automatyczne przypisywanie pojazdów do "defaultowego" oddziału, jeśli nie podano
CREATE OR REPLACE FUNCTION AssignDefaultBranch()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.BranchID IS NULL THEN
        NEW.BranchID := (SELECT BranchID FROM Branches WHERE BranchName = 'Default' LIMIT 1);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_assign_default_branch
BEFORE INSERT ON Vehicles
FOR EACH ROW
EXECUTE FUNCTION AssignDefaultBranch();
