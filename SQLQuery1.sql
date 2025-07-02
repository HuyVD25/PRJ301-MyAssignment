
USE LeaveManagementSystem;
GO

-- Creating table for Departments
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(100) NOT NULL
);

-- Creating table for Roles
CREATE TABLE Roles (
    RoleID INT PRIMARY KEY IDENTITY(1,1),
    RoleName NVARCHAR(50) NOT NULL
);

-- Creating table for Users
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) NOT NULL UNIQUE,
    Password NVARCHAR(255) NOT NULL,
    FullName NVARCHAR(100) NOT NULL,
    DepartmentID INT,
    ManagerID INT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    FOREIGN KEY (ManagerID) REFERENCES Users(UserID)
);

-- Creating table for UserRoles (many-to-many relationship between Users and Roles)
CREATE TABLE UserRoles (
    UserID INT,
    RoleID INT,
    PRIMARY KEY (UserID, RoleID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

-- Creating table for LeaveRequests
CREATE TABLE LeaveRequests (
    RequestID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Reason NVARCHAR(500),
    Status NVARCHAR(20) NOT NULL CHECK (Status IN ('Inprogress', 'Approved', 'Rejected')),
    CreatedAt DATETIME DEFAULT GETDATE(),
    ProcessedBy INT NULL,
    ProcessReason NVARCHAR(500) NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ProcessedBy) REFERENCES Users(UserID)
);

-- Insert sample data
INSERT INTO Departments (DepartmentName) VALUES ('IT'), ('HR'), ('Finance');
INSERT INTO Roles (RoleName) VALUES ('Employee'), ('Manager'), ('Admin');
INSERT INTO Users (Username, Password, FullName, DepartmentID, ManagerID) 
VALUES ('teo', 'hashed_password', 'Mr Tèo', 1, NULL),
       ('tit', 'hashed_password', 'Mr Tít', 1, 1);
INSERT INTO UserRoles (UserID, RoleID) VALUES (1, 1), (2, 2);
INSERT INTO LeaveRequests (UserID, StartDate, EndDate, Reason, Status)
VALUES (1, '2025-01-01', '2025-01-03', 'Nghỉ cưới', 'Inprogress');