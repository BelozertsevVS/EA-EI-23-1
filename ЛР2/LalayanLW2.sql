
/* Завдання 1: Створення бази даних "STUDENTS" */
CREATE DATABASE STUDENTS;
USE STUDENTS;

/* Завдання 2: Створення таблиці PersonalInfo */
CREATE TABLE PersonalInfo (
    StudentID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DateOfBirth DATE
);

/* Завдання 2: Створення таблиці AcademicInfo */
CREATE TABLE AcademicInfo (
    RecordID INT PRIMARY KEY,
    StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
    Faculty NVARCHAR(100),
    Curator NVARCHAR(100),
    EnrollmentYear INT
);

/* Завдання 2: Створення таблиці ContactInfo */
CREATE TABLE ContactInfo (
    ContactID INT PRIMARY KEY,
    StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
    Email NVARCHAR(100),
    PhoneNumber NVARCHAR(15)
);

/* Завдання 3a: Додання стовпця "Address" до таблиці ContactInfo */
ALTER TABLE ContactInfo ADD Address NVARCHAR(200);

/* Завдання 3b: Видалення стовпця "PhoneNumber" з таблиці ContactInfo */
ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;

/* Завдання 3c: Зміна імені стовпця "Email" на "EmailAddress" у таблиці ContactInfo */
EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN';

/* Завдання 4: Зміна типу даних для стовпця "Faculty" у таблиці AcademicInfo */
ALTER TABLE AcademicInfo ALTER COLUMN Faculty NVARCHAR(150);

/* Завдання 5: Додання нової таблиці "Extracurricular" */
CREATE TABLE Extracurricular (
    ActivityID INT PRIMARY KEY,
    StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
    ActivityName NVARCHAR(100),
    JoinDate DATE
);

/* Перевірка таблиці та її видалення */
DROP TABLE Extracurricular;

/* Завдання 6: Створення бази даних "TEACHER" */
CREATE DATABASE TEACHER;

/* Після перевірки бази даних, видалення бази "TEACHER" */
DROP DATABASE TEACHER;

/* Завдання 7: Перехід до бази "STUDENTS" */
USE STUDENTS;

/* Додавання трьох рядків даних до таблиці "PersonalInfo" */
INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth)
VALUES 
    (1, 'Олександр', 'Петров', '2000-05-15'),
    (2, 'Марія', 'Іваненко', '2001-03-22'),
    (3, 'Василь', 'Коваленко', '1999-10-10');
