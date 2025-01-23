ALTER TABLE Vehicles
ADD CONSTRAINT chk_year_static CHECK (Year >= 1900 AND Year <= 2100),
ADD CONSTRAINT chk_registration_length CHECK (CHAR_LENGTH(RegistrationNumber) BETWEEN 5 AND 15);


-- Ograniczenia dla tabeli Drivers
ALTER TABLE Drivers
ADD CONSTRAINT chk_license_length CHECK (CHAR_LENGTH(LicenseNumber) BETWEEN 5 AND 20); -- Długość numeru prawa jazdy

-- Ograniczenia dla tabeli Assignments
ALTER TABLE Assignments
ADD CONSTRAINT chk_dates CHECK (EndDate IS NULL OR EndDate >= StartDate); -- Data zakończenia >= data rozpoczęcia

-- Ograniczenia dla tabeli Inspections
ALTER TABLE Inspections
ADD CONSTRAINT chk_cost_positive CHECK (Cost >= 0); -- Koszt przeglądu nie może być ujemny

-- Ograniczenia dla tabeli FuelLogs
ALTER TABLE FuelLogs
ADD CONSTRAINT chk_liters_positive CHECK (Liters > 0), -- Ilość paliwa musi być dodatnia
ADD CONSTRAINT chk_fuel_cost_positive CHECK (Cost >= 0); -- Koszt paliwa nie może być ujemny

-- Ograniczenia dla tabeli Repairs
ALTER TABLE Repairs
ADD CONSTRAINT chk_repair_cost_positive CHECK (Cost >= 0); -- Koszt naprawy nie może być ujemny

-- Ograniczenia dla tabeli Routes
ALTER TABLE Routes
ADD CONSTRAINT chk_distance_positive CHECK (Distance >= 0); -- Dystans musi być dodatni

-- Ograniczenia dla tabeli Accidents
ALTER TABLE Accidents
ADD CONSTRAINT chk_damage_cost_positive CHECK (DamageCost >= 0); -- Koszt szkód nie może być ujemny

-- Ograniczenia dla tabeli MaintenanceSchedules
ALTER TABLE MaintenanceSchedules
ADD CONSTRAINT chk_task_not_empty CHECK (CHAR_LENGTH(Task) > 0); -- Opis zadania nie może być pusty

-- Ograniczenia dla tabeli Companies
ALTER TABLE Companies
ADD CONSTRAINT chk_contact_number_length CHECK (CHAR_LENGTH(ContactNumber) BETWEEN 7 AND 20); -- Długość numeru kontaktowego

-- Ograniczenia dla tabeli VehicleTypes
ALTER TABLE VehicleTypes
ADD CONSTRAINT chk_typename_length CHECK (CHAR_LENGTH(TypeName) BETWEEN 3 AND 50); -- Nazwa typu pojazdu

-- Ograniczenia dla tabeli Branches
ALTER TABLE Branches
ADD CONSTRAINT chk_branchname_length CHECK (CHAR_LENGTH(BranchName) BETWEEN 3 AND 100); -- Nazwa oddziału
