
-- Przykładowe typy pojazdów
INSERT INTO VehicleTypes (TypeName)
VALUES
    ('Osobowy'),
    ('Dostawczy'),
    ('Ciężarowy');
    ('SUV'),
    ('Sportowy'),
    ('Hybrydowy'),
    ('Elektryczny'),
    ('Minivan'),
    ('Kabriolet'),
    ('Autobus'),
    ('Motocykl'),
    ('Pickup');

-- Przykładowe oddziały firmy
INSERT INTO Branches (BranchName, Address)
VALUES
    ('Kraków', 'ul. Główna 1'),
    ('Warszawa', 'ul. Marszałkowska 10');
    ('Poznań', 'ul. Święty Marcin 5'),
    ('Gdańsk', 'ul. Długa 20'),
    ('Wrocław', 'ul. Ratuszowa 15'),
    ('Łódź', 'ul. Piotrkowska 50'),
    ('Katowice', 'ul. 3 Maja 10'),
    ('Szczecin', 'ul. Krzywoustego 25'),
    ('Lublin', 'ul. Lipowa 4'),
    ('Białystok', 'ul. Sienkiewicza 12'),
    ('Rzeszów', 'ul. Kościuszki 8');

-- Przykładowe pojazdy z przypisanymi typami i oddziałami
INSERT INTO Vehicles (Make, Model, Year, RegistrationNumber, TypeID, BranchID)
VALUES
    ('Toyota', 'Corolla', 2020, 'KR12345', 1, 1),
    ('Ford', 'Focus', 2018, 'KR54321', 2, 2);
    ('Volkswagen', 'Golf', 2019, 'KR78901', 1, 3),
    ('BMW', 'X5', 2022, 'KR65432', 4, 4),
    ('Audi', 'A6', 2017, 'KR45678', 1, 5),
    ('Mercedes', 'Sprinter', 2021, 'KR11223', 2, 6),
    ('Fiat', 'Ducato', 2020, 'KR99887', 2, 7),
    ('Skoda', 'Octavia', 2018, 'KR77665', 1, 8),
    ('Toyota', 'RAV4', 2023, 'KR22334', 4, 1),
    ('Ford', 'Transit', 2015, 'KR66554', 2, 9),
    ('Peugeot', '208', 2021, 'KR55443', 1, 2);

-- Przykładowi kierowcy
INSERT INTO Drivers (FirstName, LastName, LicenseNumber)
VALUES
    ('Jan', 'Kowalski', 'ABC123456'),
    ('Anna', 'Nowak', 'DEF654321');
    ('Krzysztof', 'Nowak', 'GHI123456'),
    ('Maria', 'Wiśniewska', 'JKL654321'),
    ('Piotr', 'Wójcik', 'MNO789123'),
    ('Ewa', 'Kowalczyk', 'PQR321987'),
    ('Tomasz', 'Kamiński', 'STU456789'),
    ('Agnieszka', 'Zielińska', 'VWX987654'),
    ('Janusz', 'Mazur', 'YZA654321'),
    ('Monika', 'Dąbrowska', 'BCD789456'),
    ('Grzegorz', 'Lewandowski', 'EFG123789');

-- Przykładowe przypisania
INSERT INTO Assignments (VehicleID, DriverID, StartDate, EndDate)
VALUES
    (1, 1, '2023-01-01', '2023-01-15');
    (2, 2, '2023-02-01', '2023-02-15'),
    (3, 3, '2023-03-01', '2023-03-20'),
    (4, 4, '2023-04-01', '2023-04-25'),
    (5, 5, '2023-05-01', NULL),
    (6, 6, '2023-06-01', '2023-06-15'),
    (7, 7, '2023-07-01', '2023-07-20'),
    (8, 8, '2023-08-01', '2023-08-30'),
    (9, 9, '2023-09-01', NULL),
    (1, 1, '2023-10-01', '2023-10-15');

-- Przykładowe przeglądy
INSERT INTO Inspections (VehicleID, InspectionDate, InspectionType, Result, Cost)
VALUES
    (1, '2023-02-01', 'Techniczny', 'Passed', 500.00);
    (2, '2023-01-20', 'Techniczny', 'Failed', 400.00),
    (3, '2023-02-15', 'Emisja spalin', 'Passed', 300.00),
    (4, '2023-03-10', 'Techniczny', 'Passed', 450.00),
    (5, '2023-04-05', 'Techniczny', 'Passed', 500.00),
    (6, '2023-05-01', 'Diagnostyka', 'Failed', 200.00),
    (7, '2023-06-25', 'Techniczny', 'Passed', 600.00),
    (8, '2023-07-15', 'Emisja spalin', 'Failed', 350.00),
    (9, '2023-08-10', 'Techniczny', 'Passed', 700.00),
    (1, '2023-09-05', 'Diagnostyka', 'Passed', 550.00);

-- Przykładowe tankowania
INSERT INTO FuelLogs (VehicleID, Date, Liters, Cost)
VALUES
    (1, '2023-03-01', 50.5, 300.00);
    (2, '2023-01-10', 40.0, 250.00),
    (3, '2023-02-15', 30.5, 180.00),
    (4, '2023-03-20', 50.0, 300.00),
    (5, '2023-04-25', 60.0, 350.00),
    (6, '2023-05-15', 70.0, 400.00),
    (7, '2023-06-10', 80.0, 450.00),
    (8, '2023-07-05', 90.0, 500.00),
    (9, '2023-08-01', 100.0, 550.00),
    (1, '2023-09-25', 50.5, 300.00);

-- Przykładowe naprawy
INSERT INTO Repairs (VehicleID, RepairDate, Description, Cost)
VALUES
    (1, '2023-04-01', 'Wymiana opon', 800.00);
    (2, '2023-01-15', 'Wymiana oleju', 150.00),
    (3, '2023-02-20', 'Naprawa zawieszenia', 800.00),
    (4, '2023-03-25', 'Regeneracja hamulców', 600.00),
    (5, '2023-04-10', 'Wymiana rozrządu', 1200.00),
    (6, '2023-05-05', 'Naprawa klimatyzacji', 500.00),
    (7, '2023-06-20', 'Wymiana opon', 400.00),
    (8, '2023-07-15', 'Naprawa układu wydechowego', 900.00),
    (9, '2023-08-05', 'Naprawa silnika', 3000.00),
    (1, '2023-09-10', 'Wymiana świec', 200.00);

-- Przykładowe trasy
INSERT INTO Routes (VehicleID, DriverID, StartLocation, EndLocation, Distance)
VALUES
    (1, 1, 'Kraków', 'Warszawa', 300.00);
    (2, 2, 'Warszawa', 'Łódź', 140.00),
    (3, 3, 'Łódź', 'Poznań', 200.00),
    (4, 4, 'Poznań', 'Wrocław', 150.00),
    (5, 5, 'Wrocław', 'Kraków', 300.00),
    (6, 6, 'Kraków', 'Katowice', 100.00),
    (7, 7, 'Katowice', 'Gdańsk', 500.00),
    (8, 8, 'Gdańsk', 'Szczecin', 400.00),
    (9, 9, 'Szczecin', 'Rzeszów', 600.00),
    (1, 1, 'Rzeszów', 'Kraków', 350.00);

-- Przykładowe wypadki
INSERT INTO Accidents (VehicleID, DriverID, AccidentDate, Description, DamageCost)
VALUES
    (1, 1, '2023-05-01', 'Kolizja z innym pojazdem', 2000.00);
    (2, 2, '2023-02-01', 'Stłuczka na skrzyżowaniu', 1500.00),
    (3, 3, '2023-03-05', 'Kolizja z pieszym', 2000.00),
    (4, 4, '2023-04-10', 'Wypadek na autostradzie', 5000.00),
    (5, 5, '2023-05-15', 'Uszkodzenie pojazdu przez zwierzę', 1000.00),
    (6, 6, '2023-06-20', 'Stłuczka na parkingu', 800.00),
    (7, 7, '2023-07-25', 'Wypadek z udziałem motocykla', 2500.00),
    (8, 8, '2023-08-30', 'Kolizja z innym pojazdem', 2000.00),
    (9, 9, '2023-09-05', 'Zderzenie czołowe', 7000.00),
    (1, 1, '2023-10-01', 'Kolizja z barierą', 1500.00);

-- Przykładowe harmonogramy konserwacji
INSERT INTO MaintenanceSchedules (VehicleID, MaintenanceDate, Task, Status)
VALUES
    (1, '2023-06-01', 'Wymiana oleju', 'Pending');
    (2, '2023-01-15', 'Wymiana opon', 'Completed'),
    (3, '2023-02-20', 'Przegląd techniczny', 'Pending'),
    (4, '2023-03-25', 'Wymiana klocków hamulcowych', 'Completed'),
    (5, '2023-04-10', 'Diagnostyka', 'Pending'),
    (6, '2023-05-05', 'Naprawa klimatyzacji', 'Completed'),
    (7, '2023-06-20', 'Czyszczenie filtra', 'Pending'),
    (8, '2023-07-15', 'Sprawdzenie geometrii', 'Completed'),
    (9, '2023-08-05', 'Kontrola układu paliwowego', 'Pending'),
    (1, '2023-09-10', 'Wymiana rozrządu', 'Completed');


-- Przykładowe firmy
INSERT INTO Companies (Name, Address, ContactNumber)
VALUES
    ('Transport Co', 'Kraków, ul. Główna 1', '123456789');
    ('Logistics Inc', 'Warszawa, ul. Marszałkowska 10', '987654321'),
    ('AutoTransport', 'Poznań, ul. Święty Marcin 5', '654321987'),
    ('Fleet Solutions', 'Gdańsk, ul. Długa 20', '321987654'),
    ('Eco Transport', 'Wrocław, ul. Ratuszowa 15', '456789012'),
    ('Urban Logistics', 'Łódź, ul. Piotrkowska 50', '567890123'),
    ('Express Delivery', 'Katowice, ul. 3 Maja 10', '678901234'),
    ('Green Logistics', 'Szczecin, ul. Krzywoustego 25', '789012345'),
    ('Premium Transport', 'Lublin, ul. Lipowa 4', '890123456'),
    ('FastMove', 'Białystok, ul. Sienkiewicza 12', '901234567');
