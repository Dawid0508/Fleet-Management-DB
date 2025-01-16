
-- Przykładowe typy pojazdów
INSERT INTO VehicleTypes (TypeName)
VALUES
    ('Osobowy'),
    ('Dostawczy'),
    ('Ciężarowy');

-- Przykładowe oddziały firmy
INSERT INTO Branches (BranchName, Address)
VALUES
    ('Kraków', 'ul. Główna 1'),
    ('Warszawa', 'ul. Marszałkowska 10');

-- Przykładowe pojazdy z przypisanymi typami i oddziałami
INSERT INTO Vehicles (Make, Model, Year, RegistrationNumber, TypeID, BranchID)
VALUES
    ('Toyota', 'Corolla', 2020, 'KR12345', 1, 1),
    ('Ford', 'Focus', 2018, 'KR54321', 2, 2);

-- Przykładowi kierowcy
INSERT INTO Drivers (FirstName, LastName, LicenseNumber)
VALUES
    ('Jan', 'Kowalski', 'ABC123456'),
    ('Anna', 'Nowak', 'DEF654321');

-- Przykładowe przypisania
INSERT INTO Assignments (VehicleID, DriverID, StartDate, EndDate)
VALUES
    (1, 1, '2023-01-01', '2023-01-15');

-- Przykładowe przeglądy
INSERT INTO Inspections (VehicleID, InspectionDate, InspectionType, Result, Cost)
VALUES
    (1, '2023-02-01', 'Techniczny', 'Passed', 500.00);

-- Przykładowe tankowania
INSERT INTO FuelLogs (VehicleID, Date, Liters, Cost)
VALUES
    (1, '2023-03-01', 50.5, 300.00);

-- Przykładowe naprawy
INSERT INTO Repairs (VehicleID, RepairDate, Description, Cost)
VALUES
    (1, '2023-04-01', 'Wymiana opon', 800.00);

-- Przykładowe trasy
INSERT INTO Routes (VehicleID, DriverID, StartLocation, EndLocation, Distance)
VALUES
    (1, 1, 'Kraków', 'Warszawa', 300.00);

-- Przykładowe wypadki
INSERT INTO Accidents (VehicleID, DriverID, AccidentDate, Description, DamageCost)
VALUES
    (1, 1, '2023-05-01', 'Kolizja z innym pojazdem', 2000.00);

-- Przykładowe harmonogramy konserwacji
INSERT INTO MaintenanceSchedules (VehicleID, MaintenanceDate, Task, Status)
VALUES
    (1, '2023-06-01', 'Wymiana oleju', 'Pending');

-- Przykładowe firmy
INSERT INTO Companies (Name, Address, ContactNumber)
VALUES
    ('Transport Co', 'Kraków, ul. Główna 1', '123456789');
