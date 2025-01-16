
-- Tabela Vehicles
CREATE TABLE Vehicles (
    VehicleID SERIAL PRIMARY KEY,
    Make VARCHAR(50) NOT NULL,
    Model VARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    RegistrationNumber VARCHAR(15) UNIQUE NOT NULL,
    TypeID INT,
    BranchID INT,
    FOREIGN KEY (TypeID) REFERENCES VehicleTypes(TypeID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);

-- Tabela Drivers
CREATE TABLE Drivers (
    DriverID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    LicenseNumber VARCHAR(20) UNIQUE NOT NULL
);

-- Tabela Assignments
CREATE TABLE Assignments (
    AssignmentID SERIAL PRIMARY KEY,
    VehicleID INT NOT NULL,
    DriverID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

-- Tabela Inspections
CREATE TABLE Inspections (
    InspectionID SERIAL PRIMARY KEY,
    VehicleID INT NOT NULL,
    InspectionDate DATE NOT NULL,
    InspectionType VARCHAR(50) NOT NULL,
    Result VARCHAR(20),
    Cost DECIMAL(10, 2),
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
);

-- Tabela FuelLogs
CREATE TABLE FuelLogs (
    FuelLogID SERIAL PRIMARY KEY,
    VehicleID INT NOT NULL,
    Date DATE NOT NULL,
    Liters DECIMAL(10, 2) NOT NULL,
    Cost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
);

-- Tabela Repairs
CREATE TABLE Repairs (
    RepairID SERIAL PRIMARY KEY,
    VehicleID INT NOT NULL,
    RepairDate DATE NOT NULL,
    Description TEXT NOT NULL,
    Cost DECIMAL(10, 2),
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
);

-- Tabela Routes
CREATE TABLE Routes (
    RouteID SERIAL PRIMARY KEY,
    VehicleID INT NOT NULL,
    DriverID INT NOT NULL,
    StartLocation VARCHAR(255) NOT NULL,
    EndLocation VARCHAR(255) NOT NULL,
    Distance DECIMAL(10, 2),
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

-- Tabela Accidents
CREATE TABLE Accidents (
    AccidentID SERIAL PRIMARY KEY,
    VehicleID INT NOT NULL,
    DriverID INT NOT NULL,
    AccidentDate DATE NOT NULL,
    Description TEXT NOT NULL,
    DamageCost DECIMAL(10, 2),
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

-- Tabela MaintenanceSchedules
CREATE TABLE MaintenanceSchedules (
    ScheduleID SERIAL PRIMARY KEY,
    VehicleID INT NOT NULL,
    MaintenanceDate DATE NOT NULL,
    Task VARCHAR(255) NOT NULL,
    Status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
);

-- Tabela Companies
CREATE TABLE Companies (
    CompanyID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    ContactNumber VARCHAR(20)
);

-- Tabela VehicleTypes
CREATE TABLE VehicleTypes (
    TypeID SERIAL PRIMARY KEY,
    TypeName VARCHAR(50) NOT NULL
);

-- Tabela Branches
CREATE TABLE Branches (
    BranchID SERIAL PRIMARY KEY,
    BranchName VARCHAR(100) NOT NULL,
    Address VARCHAR(255)
);
