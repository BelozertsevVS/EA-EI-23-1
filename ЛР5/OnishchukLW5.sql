﻿CREATE DATABASE UniversityDB;
    USE UniversityDB;

	-- Создав таблицю за допомогою команди CREATE TABLE 
	    CREATE TABLE Departments (
      DepartmentID INT NOT NULL,
      DepartmentName VARCHAR(100)
  );
 -- Создав таблицю за допомогою команди CREATE TABLE 
    CREATE TABLE Professors (
      ProfessorID INT NOT NULL,
      FirstName VARCHAR(50),
      LastName VARCHAR(50),
      Age TINYINT,
      DepartmentID INT,
      Email VARCHAR(100)
  );
  -- Через команду ALTER додав PRIMARY KEY `Departments` та `Professors`
  ALTER TABLE Departments ADD CONSTRAINT PK_Department PRIMARY KEY (DepartmentID);

  ALTER TABLE Professors ADD CONSTRAINT PK_Professor PRIMARY KEY (ProfessorID);

  -- Через команду UNIQUE додав PRIMARY KEY `Departments` та `Professors`
  ALTER TABLE Professors ADD CONSTRAINT UQ_Professor_Email UNIQUE (Email);
  -- ДодаВ FOREIGN KEY обмеження до `Professors`, щоб пов'язати `DepartmentID` з `Departments`.
  ALTER TABLE Professors ADD CONSTRAINT FK_Professor_Department  FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);
  -- - Додав CHECK обмеження на `Age` в ` Professors`, щоб значення віку не було менше 20.
  ALTER TABLE Professors ADD CONSTRAINT CK_Age CHECK (Age > = 20);
  -- Додав NOT NULL обмеження на `FirstName` і `LastName` в `Professors`
  ALTER TABLE Professors ALTER COLUMN FirstName VARCHAR(50) NOT NULL;
  ALTER TABLE Professors ALTER COLUMN LastName VARCHAR(50) NOT NULL;

  -- Додав DEFAULT значення для `DepartmentName` в `Departments`
  ALTER TABLE Departments ADD CONSTRAINT DF_DepartmentName DEFAULT 'General' FOR DepartmentName;

  INSERT INTO Departments (DepartmentID) VALUES (1); -- Застосується DEFAULT значення 'General'

  INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email) 
  VALUES (1, 'John', 'Smith', 57, 1, 'john.smith@university.com');

  INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email) 
VALUES (2, 'Jane', 'Doe', 35, 1, 'john.smith@university.com'); -- Це викличе помилку через UNIQUE обмеження

 INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email) 
VALUES (3, 'Bob', 'Doe', 17, 1, 'bob@university.com'); -- Це викличе помилку через CHECK обмеження


  DROP TABLE Professors;
  DROP TABLE Departments;

    DROP DATABASE UniversityDB;

	  CREATE DATABASE CompanyDB;
  USE CompanyDB;

  CREATE TABLE Employees (
      EmployeeID INT PRIMARY KEY,
      FirstName VARCHAR(50) NOT NULL,
      LastName VARCHAR(50) NOT NULL,
      Email VARCHAR(100) UNIQUE,
      Position VARCHAR(50) DEFAULT 'Junior Developer'
  );


  CREATE TABLE Departments (
      DepartmentID INT PRIMARY KEY,
      DepartmentName VARCHAR(100) NOT NULL CHECK (DepartmentName <> ''),
      Budget DECIMAL(10, 2) CHECK (Budget > 0),
      DefaultRoomNumber INT DEFAULT 101
  );


  CREATE TABLE Assignments (
      AssignmentID INT PRIMARY KEY,
      EmployeeID INT NOT NULL,
      DepartmentID INT NOT NULL,
      AssignmentDate DATE DEFAULT GETDATE(),
      FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
      FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
  );

  INSERT INTO Departments (DepartmentID, DepartmentName, Budget) 
VALUES (1, 'Human Resources', 50000);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Email) 
VALUES (1, 'John', 'Smith', 'john.smith@company.com');


INSERT INTO Assignments (AssignmentID, EmployeeID, DepartmentID) 
VALUES (1, 1, 1);


INSERT INTO Assignments (AssignmentID, EmployeeID, DepartmentID) 
VALUES (2, 999, 1); -- Це викличе помилку через FOREIGN KEY обмеження


DROP TABLE Assignments;
  DROP TABLE Employees;
  DROP TABLE Departments;


  DROP DATABASE CompanyDB;




