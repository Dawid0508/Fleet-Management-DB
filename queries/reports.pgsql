-- Raport: Lista pojazdów z kosztami tankowania, napraw i wypadków
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
SELECT
    d.DriverID,
    d.FirstName,
    d.LastName,
    COUNT(a.AccidentID) AS AccidentCount
FROM Drivers d
LEFT JOIN Accidents a ON d.DriverID = a.DriverID
GROUP BY d.DriverID, d.FirstName, d.LastName;

-- Raport: Lista pojazdów i ich aktualnych przypisań
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
SELECT
    v.VehicleID,
    v.Make,
    v.Model,
    vt.TypeName AS VehicleType,
    b.BranchName AS Branch
FROM Vehicles v
LEFT JOIN VehicleTypes vt ON v.TypeID = vt.TypeID
LEFT JOIN Branches b ON v.BranchID = b.BranchID;
