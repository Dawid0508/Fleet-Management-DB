-- Funkcja: Obliczenie całkowitego kosztu dla pojazdu (naprawy, tankowania, szkody)
CREATE OR REPLACE FUNCTION GetTotalVehicleCost(vehicle_id INT)
RETURNS DECIMAL(10, 2) AS $$
BEGIN
    RETURN (
        COALESCE((SELECT SUM(Cost) FROM FuelLogs WHERE VehicleID = vehicle_id), 0) +
        COALESCE((SELECT SUM(Cost) FROM Repairs WHERE VehicleID = vehicle_id), 0) +
        COALESCE((SELECT SUM(DamageCost) FROM Accidents WHERE VehicleID = vehicle_id), 0)
    );
END;
$$ LANGUAGE plpgsql;

-- Funkcja: Pobranie liczby wypadków dla danego kierowcy
CREATE OR REPLACE FUNCTION GetDriverAccidentCount(driver_id INT)
RETURNS INT AS $$
BEGIN
    RETURN (
        SELECT COUNT(*) FROM Accidents WHERE DriverID = driver_id
    );
END;
$$ LANGUAGE plpgsql;

-- Funkcja: Sprawdzenie, czy pojazd jest przypisany do kierowcy w danej dacie
CREATE OR REPLACE FUNCTION IsVehicleAssigned(vehicle_id INT, check_date DATE)
RETURNS BOOLEAN AS $$
BEGIN
    RETURN EXISTS (
        SELECT 1
        FROM Assignments
        WHERE VehicleID = vehicle_id
        AND StartDate <= check_date
        AND (EndDate IS NULL OR EndDate >= check_date)
    );
END;
$$ LANGUAGE plpgsql;
