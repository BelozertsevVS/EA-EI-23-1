--���� 1: ��������� �������� ���� ��������� �������

--�������� 1.1: ��������� ���� ����� �� �������

CREATE DATABASE UniversityDB; -- ������� ���� ����� �� ������ UniversityDB
USE UniversityDB; -- ������ ���� ����� UniversityDB ��� �������� ������


CREATE TABLE Departments (
    DepartmentID INT NOT NULL, -- ������� DepartmentID, ��� INT, �� ������� NULL ��������
    DepartmentName VARCHAR(100) -- ������� DepartmentName, ��� VARCHAR, �������� NULL
);


CREATE TABLE Professors (
    ProfessorID INT NOT NULL, -- ������� ProfessorID, ��� INT, �� ������� NULL ��������
    FirstName VARCHAR(50), -- ������� FirstName, ��� VARCHAR, ������� NULL ��������
    LastName VARCHAR(50), -- ������� LastName, ��� VARCHAR, ������� NULL ��������
    Age TINYINT, -- ������� Age, ��� TINYINT, ������� NULL ��������
    DepartmentID INT, -- ������� DepartmentID ��� ��������� �������������� �����
    Email VARCHAR(100) -- ������� Email, ��� VARCHAR, ������� NULL ��������
);

--�������� 1.2: ��������� �������� �� �������� �������

ALTER TABLE Departments 
ADD CONSTRAINT PK_Department PRIMARY KEY (DepartmentID); 
-- ���� ��������� PRIMARY KEY �� DepartmentID � ������� Departments

ALTER TABLE Professors 
ADD CONSTRAINT PK_Professor PRIMARY KEY (ProfessorID); 
-- ���� ��������� PRIMARY KEY �� ProfessorID � ������� Professors


ALTER TABLE Professors 
ADD CONSTRAINT UQ_Professor_Email UNIQUE (Email); 
-- ���� ��������� UNIQUE ��� Email, ��� �������� ���� ����������


ALTER TABLE Professors 
ADD CONSTRAINT FK_Professor_Department FOREIGN KEY (DepartmentID) 
REFERENCES Departments(DepartmentID); 
-- ���� ������� ���� ��� DepartmentID � Professors, �� ���������� �� DepartmentID � Departments


ALTER TABLE Professors 
ADD CONSTRAINT CK_Age CHECK (Age >= 20); 
-- ���� ��������� CHECK ��� Age, ��� �������� ���� �� ����� 20


ALTER TABLE Professors 
ALTER COLUMN FirstName VARCHAR(50) NOT NULL; 
-- ����� ������� FirstName, ��� ���� �� ��������� NULL ��������

ALTER TABLE Professors 
ALTER COLUMN LastName VARCHAR(50) NOT NULL; 
-- ����� ������� LastName, ��� ���� �� ��������� NULL ��������


ALTER TABLE Departments 
ADD CONSTRAINT DF_DepartmentName DEFAULT 'General' FOR DepartmentName; 
-- ���� �������� �� ������������� ('General') ��� DepartmentName, ���� �������� �� �������

--�������� 1.3: �������� �� ���������� �����

INSERT INTO Departments (DepartmentID) VALUES (1); 
-- �������� ����� �� DepartmentID = 1, �������������� �������� �� ������������� 'General' ��� DepartmentName


INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email)
VALUES (1, 'John', 'Smith', 57, 1, 'john.smith@university.com'); 
-- �������� ��� �� Professors, �������� ��������� � DepartmentID = 1


INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email)
VALUES (2, 'Jane', 'Doe', 35, 1, 'john.smith@university.com'); 
-- ������� ������� ����� ��������� UNIQUE �� Email, �� ���� �������� ��� ����


INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email)
VALUES (3, 'Bob', 'Doe', 17, 1, 'bob@university.com'); 
-- ������� ������� ����� ��������� CHECK �� Age, �� �������� ����� 20

--�������� 1.4: ��������

DROP TABLE Professors; 
-- ������� ������� Professors
DROP TABLE Departments; 
-- ������� ������� Departments


DROP DATABASE UniversityDB; 
-- ������� ���� ����� UniversityDB


--���� 2: ��������� ������� � �����������

CREATE DATABASE CompanyDB; -- ������� ���� ����� CompanyDB
USE CompanyDB; -- ������ ���� CompanyDB ��� �������� ������


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY, -- PRIMARY KEY ��� EmployeeID
    FirstName VARCHAR(50) NOT NULL, -- ������� FirstName �� ������� NULL ��������
    LastName VARCHAR(50) NOT NULL, -- ������� LastName �� ������� NULL ��������
    Email VARCHAR(100) UNIQUE, -- Email �� ���� ��������� � �������
    Position VARCHAR(50) DEFAULT 'Junior Developer' -- �������� �� ������������� ��� Position
);
