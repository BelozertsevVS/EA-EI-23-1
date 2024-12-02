--Блок 1: Додавання обмежень після створення таблиць

--Завдання 1.1: Створення бази даних та таблиць

CREATE DATABASE UniversityDB; -- Створює базу даних під назвою UniversityDB
USE UniversityDB; -- Вибирає базу даних UniversityDB для подальшої роботи


CREATE TABLE Departments (
    DepartmentID INT NOT NULL, -- Колонка DepartmentID, тип INT, не допускає NULL значення
    DepartmentName VARCHAR(100) -- Колонка DepartmentName, тип VARCHAR, дозволяє NULL
);


CREATE TABLE Professors (
    ProfessorID INT NOT NULL, -- Колонка ProfessorID, тип INT, не допускає NULL значення
    FirstName VARCHAR(50), -- Колонка FirstName, тип VARCHAR, допускає NULL значення
    LastName VARCHAR(50), -- Колонка LastName, тип VARCHAR, допускає NULL значення
    Age TINYINT, -- Колонка Age, тип TINYINT, допускає NULL значення
    DepartmentID INT, -- Колонка DepartmentID для зберігання ідентифікатора відділу
    Email VARCHAR(100) -- Колонка Email, тип VARCHAR, допускає NULL значення
);

--Завдання 1.2: Додавання обмежень до існуючих таблиць

ALTER TABLE Departments 
ADD CONSTRAINT PK_Department PRIMARY KEY (DepartmentID); 
-- Додає обмеження PRIMARY KEY до DepartmentID у таблиці Departments

ALTER TABLE Professors 
ADD CONSTRAINT PK_Professor PRIMARY KEY (ProfessorID); 
-- Додає обмеження PRIMARY KEY до ProfessorID у таблиці Professors


ALTER TABLE Professors 
ADD CONSTRAINT UQ_Professor_Email UNIQUE (Email); 
-- Додає обмеження UNIQUE для Email, щоб значення були унікальними


ALTER TABLE Professors 
ADD CONSTRAINT FK_Professor_Department FOREIGN KEY (DepartmentID) 
REFERENCES Departments(DepartmentID); 
-- Додає зовнішній ключ для DepartmentID у Professors, що посилається на DepartmentID у Departments


ALTER TABLE Professors 
ADD CONSTRAINT CK_Age CHECK (Age >= 20); 
-- Додає обмеження CHECK для Age, щоб значення було не менше 20


ALTER TABLE Professors 
ALTER COLUMN FirstName VARCHAR(50) NOT NULL; 
-- Змінює колонку FirstName, щоб вона не допускала NULL значення

ALTER TABLE Professors 
ALTER COLUMN LastName VARCHAR(50) NOT NULL; 
-- Змінює колонку LastName, щоб вона не допускала NULL значення


ALTER TABLE Departments 
ADD CONSTRAINT DF_DepartmentName DEFAULT 'General' FOR DepartmentName; 
-- Додає значення за замовчуванням ('General') для DepartmentName, якщо значення не вказане

--Завдання 1.3: Введення та тестування даних

INSERT INTO Departments (DepartmentID) VALUES (1); 
-- Вставляє запис із DepartmentID = 1, використовуючи значення за замовчуванням 'General' для DepartmentName


INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email)
VALUES (1, 'John', 'Smith', 57, 1, 'john.smith@university.com'); 
-- Вставляє дані до Professors, зв’язуючи професора з DepartmentID = 1


INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email)
VALUES (2, 'Jane', 'Doe', 35, 1, 'john.smith@university.com'); 
-- Викличе помилку через обмеження UNIQUE на Email, бо таке значення вже існує


INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email)
VALUES (3, 'Bob', 'Doe', 17, 1, 'bob@university.com'); 
-- Викличе помилку через обмеження CHECK на Age, бо значення менше 20

--Завдання 1.4: Очищення

DROP TABLE Professors; 
-- Видаляє таблицю Professors
DROP TABLE Departments; 
-- Видаляє таблицю Departments


DROP DATABASE UniversityDB; 
-- Видаляє базу даних UniversityDB


--Блок 2: Створення таблиць з обмеженнями

CREATE DATABASE CompanyDB; -- Створює базу даних CompanyDB
USE CompanyDB; -- Вибирає базу CompanyDB для подальшої роботи


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY, -- PRIMARY KEY для EmployeeID
    FirstName VARCHAR(50) NOT NULL, -- Колонка FirstName не допускає NULL значення
    LastName VARCHAR(50) NOT NULL, -- Колонка LastName не допускає NULL значення
    Email VARCHAR(100) UNIQUE, -- Email має бути унікальним у таблиці
    Position VARCHAR(50) DEFAULT 'Junior Developer' -- Значення за замовчуванням для Position
);
