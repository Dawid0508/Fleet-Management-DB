-- Raport: Lista pojazdów z kosztami tankowania, napraw i wypadków
CREATE VIEW VehicleCosts AS
SELECT
    v.VehicleID,
    v.Make,
    v.Model,
    COALESCE(SUM(f.Cost), 0) AS TotalFuelCost,
    COALESCE(SUM(r.Cost), 0) AS TotalRepairCost,
    COALESCE(SUM(a.DamageCost), 0) AS TotalAccidentCost
FROM Vehicles v
LEFT JOIN FuelLogs f ON v.VehicleID = f.VehicleID
LEFT JOIN Repairs r ON v.VehicleID = r.VehicleID
LEFT JOIN Accidents a ON v.VehicleID = a.VehicleID
GROUP BY v.VehicleID, v.Make, v.Model;


-- Raport: Liczba wypadków przypisanych do każdego kierowcy
CREATE VIEW DriverAccidentCounts AS
SELECT
    d.DriverID,
    d.FirstName,
    d.LastName,
    COUNT(a.AccidentID) AS AccidentCount
FROM Drivers d
LEFT JOIN Accidents a ON d.DriverID = a.DriverID
GROUP BY d.DriverID, d.FirstName, d.LastName;

-- Raport: Lista pojazdów i ich aktualnych przypisań
CREATE VIEW CurrentVehicleAssignments AS
SELECT
    v.VehicleID,
    v.Make,
    v.Model,
    d.FirstName,
    d.LastName,
    a.StartDate,
    a.EndDate
FROM Vehicles v
LEFT JOIN Assignments a ON v.VehicleID = a.VehicleID
LEFT JOIN Drivers d ON a.DriverID = d.DriverID
WHERE a.EndDate IS NULL OR a.EndDate >= CURRENT_DATE;


-- Raport: Lista pojazdów z ich typem i oddziałem
CREATE VIEW VehicleDetails AS
SELECT
    v.VehicleID,
    v.Make,
    v.Model,
    vt.TypeName AS VehicleType,
    b.BranchName AS Branch
FROM Vehicles v
LEFT JOIN VehicleTypes vt ON v.TypeID = vt.TypeID
LEFT JOIN Branches b ON v.BranchID = b.BranchID;

-- Tworzy widok, który łączy informacje o kierowcach z ich aktualnymi i przeszłymi przypisaniami.

CREATE VIEW DriverAssignments AS
SELECT 
    d.DriverID, 
    d.FirstName, 
    d.LastName, 
    a.VehicleID, 
    a.StartDate, 
    a.EndDate
FROM Drivers d
LEFT JOIN Assignments a ON d.DriverID = a.DriverID;

-- Średnie koszty miesięczne

CREATE VIEW MonthlyAverageCosts AS
SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS Month,
    AVG(FuelLogs.Cost) AS AvgFuelCost,
    AVG(Repairs.Cost) AS AvgRepairCost,
    AVG(MaintenanceSchedules.Cost) AS AvgMaintenanceCost
FROM 
    FuelLogs
LEFT JOIN Repairs ON MONTH(FuelLogs.Date) = MONTH(Repairs.RepairDate) AND YEAR(FuelLogs.Date) = YEAR(Repairs.RepairDate)
LEFT JOIN MaintenanceSchedules ON MONTH(FuelLogs.Date) = MONTH(MaintenanceSchedules.MaintenanceDate) AND YEAR(FuelLogs.Date) = YEAR(MaintenanceSchedules.MaintenanceDate)
GROUP BY 
    DATE_FORMAT(Date, '%Y-%m')
ORDER BY 
    Month;
