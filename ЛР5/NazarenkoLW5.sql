CREATE DATABASE UniversityDB;
    USE UniversityDB;
	/*Створила базу даних `UniversityDB`*/

	/*Створила таблицю `Departments` */
	CREATE TABLE Departments (
      DepartmentID INT NOT NULL,
      DepartmentName VARCHAR(100)
  );

  /*Створила таблицю `Professors`*/
    CREATE TABLE Professors (
      ProfessorID INT NOT NULL,
      FirstName VARCHAR(50),
      LastName VARCHAR(50),
      Age TINYINT,
      DepartmentID INT,
      Email VARCHAR(100)
  );


  ALTER TABLE Departments ADD CONSTRAINT PK_Department PRIMARY KEY (DepartmentID);

ALTER TABLE Professors ADD CONSTRAINT PK_Professor PRIMARY KEY (ProfessorID);
/*Додала PRIMARY KEY до `Departments` та `Professors`*/

ALTER TABLE Professors ADD CONSTRAINT UQ_Professor_Email UNIQUE (Email);
/*Додала UNIQUE обмеження на `Email` в `Professors`*/

ALTER TABLE Professors ADD CONSTRAINT FK_Professor_Department  FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);
/*Додала FOREIGN KEY обмеження до `Professors`, щоб пов'язати `DepartmentID` з `Departments`*/

ALTER TABLE Professors ADD CONSTRAINT CK_Age CHECK (Age > = 20);
/*Додала CHECK обмеження на `Age` в ` Professors`*/

ALTER TABLE Professors ALTER COLUMN FirstName VARCHAR(50) NOT NULL;
ALTER TABLE Professors ALTER COLUMN LastName VARCHAR(50) NOT NULL;
/*Додала NOT NULL обмеження на `FirstName` і `LastName` в `Professors`*/

ALTER TABLE Departments ADD CONSTRAINT DF_DepartmentName DEFAULT 'General' FOR DepartmentName;
/*Додала DEFAULT значення для `DepartmentName` в `Departments`*/

INSERT INTO Departments (DepartmentID) VALUES (1); -- Застосується DEFAULT значення 'General'
/*Ввела дані до `Departments`*/

  INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email) 
  VALUES (1, 'John', 'Smith', 57, 1, 'john.smith@university.com');
  /*Ввела дані до `Professors`, включаючи їх прив'язку до відділів через `DepartmentID`.*/

  INSERT INTO Professors (ProfessorID, FirstName, LastName, DepartmentID, Email) 
  VALUES (2, 'Jane', 'Doe', 1, 35, 'john.smith@university.com'); -- Це викличе помилку через UNIQUE обмеження
  /*вставила запис до `Professors` з існуючим `Email`, щоб перевірити UNIQUE обмеження*/

  INSERT INTO Professors (ProfessorID, FirstName, LastName, DepartmentID, Email) 
  VALUES (3, 'Bob', 'Doe', 1, 17, 'bob@university.com'); 
  /*вставила запис до `Professors` з існуючим віком менше 20, щоб перевірити CHECK обмеження*/

    DROP TABLE Professors;
  DROP TABLE Departments;
  /*Видалила таблиці `Professors` та `Departments`*/

    DROP DATABASE UniversityDB;
	/*Видалила базу даних `UniversityDB`*/

	  CREATE DATABASE CompanyDB;
  USE CompanyDB;
  /*Створила базу даних `CompanyDB`*/

  CREATE TABLE Employees (
      EmployeeID INT PRIMARY KEY,
      FirstName VARCHAR(50) NOT NULL,
      LastName VARCHAR(50) NOT NULL,
      Email VARCHAR(100) UNIQUE,
      Position VARCHAR(50) DEFAULT 'Junior Developer'
  );
  /*Створила таблицю `Employees` з PRIMARY KEY, NOT NULL, UNIQUE, і DEFAULT обмеженнями*/

  CREATE TABLE Departments (
      DepartmentID INT PRIMARY KEY,
      DepartmentName VARCHAR(100) NOT NULL CHECK (DepartmentName <> ''),
      Budget DECIMAL(10, 2) CHECK (Budget > 0),
      DefaultRoomNumber INT DEFAULT 101
  );
  /*Створила таблицю `Departments` з PRIMARY KEY та CHECK обмеженнями*/

  CREATE TABLE Assignments (
      AssignmentID INT PRIMARY KEY,
      EmployeeID INT NOT NULL,
      DepartmentID INT NOT NULL,
      AssignmentDate DATE DEFAULT GETDATE(),
      FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
      FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
  );
  /*Створила таблицю `Assignments` з FOREIGN KEY, що вказує на `Employees` та `Departments`*/

    INSERT INTO Departments (DepartmentID, DepartmentName, Budget) 
  VALUES (1, 'Human Resources', 50000);
  
  INSERT INTO Employees (EmployeeID, FirstName, LastName, Email) 
  VALUES (1, 'John', 'Smith', 'john.smith@company.com');
  
  INSERT INTO Assignments (AssignmentID, EmployeeID, DepartmentID) 
  VALUES (1, 1, 1);
  /*Ввела дані до `Departments` і `Employees`, потім створила призначення у `Assignments`*/

  INSERT INTO Assignments (AssignmentID, EmployeeID, DepartmentID) 
  VALUES (2, 999, 1); -- Це викличе помилку через FOREIGN KEY обмеження

  
  DROP TABLE Assignments;
  DROP TABLE Employees;
  DROP TABLE Departments;
  /*Видалила таблиці `Assignments`, `Employees` та `Departments`*/

  DROP DATABASE CompanyDB;
  /*Видалила базу даних `CompanyDB`.*/
