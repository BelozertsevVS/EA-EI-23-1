-- Створення бази даних UniversityDB
CREATE DATABASE UniversityDB;
USE UniversityDB;

-- Створення таблиці Departments без обмежень
CREATE TABLE Departments (
    DepartmentID INT NOT NULL,
    DepartmentName VARCHAR(100)
);

-- Створення таблиці Professors без обмежень
CREATE TABLE Professors (
    ProfessorID INT NOT NULL,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age TINYINT,
    DepartmentID INT,
    Email VARCHAR(100)
);

-- Додавання PRIMARY KEY до Departments та Professors
ALTER TABLE Departments ADD CONSTRAINT PK_Department PRIMARY KEY (DepartmentID);
ALTER TABLE Professors ADD CONSTRAINT PK_Professor PRIMARY KEY (ProfessorID);

-- Додавання UNIQUE обмеження на Email в Professors
ALTER TABLE Professors ADD CONSTRAINT UQ_Professor_Email UNIQUE (Email);

-- Додавання FOREIGN KEY обмеження для зв'язку DepartmentID з Departments
ALTER TABLE Professors ADD CONSTRAINT FK_Professor_Department FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);

-- Додавання CHECK обмеження на Age для Professors
ALTER TABLE Professors ADD CONSTRAINT CK_Age CHECK (Age >= 20);

-- Додавання NOT NULL обмеження на FirstName і LastName в Professors
ALTER TABLE Professors ALTER COLUMN FirstName VARCHAR(50) NOT NULL;
ALTER TABLE Professors ALTER COLUMN LastName VARCHAR(50) NOT NULL;

-- Додавання DEFAULT значення для DepartmentName в Departments
ALTER TABLE Departments ADD CONSTRAINT DF_DepartmentName DEFAULT 'General' FOR DepartmentName;

-- Введення даних до Departments
INSERT INTO Departments (DepartmentID) VALUES (1); -- Застосується значення 'General'

-- Введення даних до Professors
INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email) 
VALUES (1, 'John', 'Smith', 57, 1, 'john.smith@university.com');

-- Тестування обмежень (спроба вставити запис з існуючим Email)
INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email) 
VALUES (2, 'Jane', 'Doe', 35, 1, 'john.smith@university.com'); -- Помилка через UNIQUE обмеження

-- Тестування обмежень (спроба вставити запис з віком менше 20)
INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email) 
VALUES (3, 'Bob', 'Doe', 17, 1, 'bob@university.com'); -- Помилка через CHECK обмеження

-- Видалення таблиць Professors та Departments
DROP TABLE Professors;
DROP TABLE Departments;

-- Видалення бази даних UniversityDB
DROP DATABASE UniversityDB;

-- Створення бази даних CompanyDB
CREATE DATABASE CompanyDB;
USE CompanyDB;

-- Створення таблиці Employees з обмеженнями
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Position VARCHAR(50) DEFAULT 'Junior Developer'
);

-- Створення таблиці Departments з обмеженнями
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL CHECK (DepartmentName <> ''),
    Budget DECIMAL(10, 2) CHECK (Budget > 0),
    DefaultRoomNumber INT DEFAULT 101
);

-- Створення таблиці Assignments з обмеженням FOREIGN KEY
CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    DepartmentID INT NOT NULL,
    AssignmentDate DATE DEFAULT GETDATE(),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Введення даних до Departments
INSERT INTO Departments (DepartmentID, DepartmentName, Budget) 
VALUES (1, 'Human Resources', 50000);

-- Введення даних до Employees
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email) 
VALUES (1, 'John', 'Smith', 'john.smith@company.com');

-- Створення призначення у Assignments
INSERT INTO Assignments (AssignmentID, EmployeeID, DepartmentID) 
VALUES (1, 1, 1);

-- Тестування обмежень (спроба вставити неіснуючий EmployeeID)
INSERT INTO Assignments (AssignmentID, EmployeeID, DepartmentID) 
VALUES (2, 999, 1); -- Помилка через FOREIGN KEY обмеження

-- Видалення таблиць Assignments, Employees та Departments
DROP TABLE Assignments;
DROP TABLE Employees;
DROP TABLE Departments;

-- Видалення бази даних CompanyDB
DROP DATABASE CompanyDB;