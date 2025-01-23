-- Funkcja: Obliczenie całkowitego kosztu dla pojazdu (naprawy, tankowania, szkody)
DELIMITER $$

CREATE FUNCTION GetTotalVehicleCost(vehicle_id INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total_cost DECIMAL(10, 2);

    SET total_cost = (
        IFNULL((SELECT SUM(Cost) FROM FuelLogs WHERE VehicleID = vehicle_id), 0) +
        IFNULL((SELECT SUM(Cost) FROM Repairs WHERE VehicleID = vehicle_id), 0) +
        IFNULL((SELECT SUM(DamageCost) FROM Accidents WHERE VehicleID = vehicle_id), 0)
    );

    RETURN total_cost;
END$$

DELIMITER ;


-- Funkcja: Pobranie liczby wypadków dla danego kierowcy
DELIMITER $$

CREATE FUNCTION GetDriverAccidentCount(driver_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE accident_count INT;

    SET accident_count = (
        SELECT COUNT(*) FROM Accidents WHERE DriverID = driver_id
    );

    RETURN accident_count;
END$$

DELIMITER ;


-- Funkcja: Sprawdzenie, czy pojazd jest przypisany do kierowcy w danej dacie
DELIMITER $$

CREATE FUNCTION IsVehicleAssigned(vehicle_id INT, check_date DATE)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE is_assigned BOOLEAN;

    SET is_assigned = EXISTS (
        SELECT 1
        FROM Assignments
        WHERE VehicleID = vehicle_id
            AND StartDate <= check_date
            AND (EndDate IS NULL OR EndDate >= check_date)
    );

    RETURN is_assigned;
END$$

DELIMITER ;


-- Obliczanie całkowitej liczby kilometrów przejechanych przez pojazd

DELIMITER $$

CREATE FUNCTION GetTotalDistanceDriven(vehicle_id INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total_distance DECIMAL(10, 2);

    SELECT COALESCE(SUM(Distance), 0) INTO total_distance
    FROM Routes
    WHERE VehicleID = vehicle_id;

    RETURN total_distance;
END$$

DELIMITER ;

-- Ta funkcja sprawdza, czy kierowca ma uprawnienia do prowadzenia pojazdu danego typu (bazuje na hipotetycznej tabeli DriverPermissions

DELIMITER $$

CREATE FUNCTION CanDriverOperateVehicle(driver_id INT, type_id INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE permission_count INT;

    SELECT COUNT(*) INTO permission_count
    FROM DriverPermissions
    WHERE DriverID = driver_id AND TypeID = type_id;

    RETURN permission_count > 0;
END$$

DELIMITER ;


-- Ta funkcja oblicza średnie zużycie paliwa na 100 km dla pojazdu, bazując na danych z tabel FuelLogs i Routes

DELIMITER $$

CREATE FUNCTION GetAverageFuelConsumption(vehicle_id INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total_distance DECIMAL(10, 2);
    DECLARE total_fuel DECIMAL(10, 2);
    DECLARE avg_consumption DECIMAL(10, 2);

    SELECT COALESCE(SUM(Distance), 0) INTO total_distance
    FROM Routes
    WHERE VehicleID = vehicle_id;

    SELECT COALESCE(SUM(Liters), 0) INTO total_fuel
    FROM FuelLogs
    WHERE VehicleID = vehicle_id;

    IF total_distance > 0 THEN
        SET avg_consumption = (total_fuel / total_distance) * 100;
    ELSE
        SET avg_consumption = 0;
    END IF;

    RETURN avg_consumption;
END$$

DELIMITER ;



