CREATE DATABASE STUDENTS;
/*Створення бази даних "STUDENTS"*/
/*Перейшла до бази даних "STUDENTS"*/
USE STUDENTS;

/*Створила таблицю "PersonalInfo"*/
CREATE TABLE PersonalInfo (
        StudentID INT PRIMARY KEY,
        FirstName NVARCHAR(50),
        LastName NVARCHAR(50),
        DateOfBirth DATE
		);

/*Створила таблицю "AcademicInfo"*/
CREATE TABLE AcademicInfo (
RecordID INT PRIMARY KEY,
StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
Faculty NVARCHAR(100),
Curator NVARCHAR(100),
EnrollmentYear INT
    );

/*Створила таблицю "ContactInfo"*/
CREATE TABLE ContactInfo (
ContactID INT PRIMARY KEY,
StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
Email NVARCHAR(100),
PhoneNumber NVARCHAR(15)
    );

/*Додала стовбець "Address"*/
ALTER TABLE ContactInfo ADD Address NVARCHAR(200);

/*Видалила стовбець "PhoneNumber"*/
ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;

/*Змінила ім'я стовбця "Email" на "EmailAddress"*/
EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN';

/*Змінила тип даних стовбця*/
ALTER TABLE AcademicInfo
ALTER COLUMN Faculty NVARCHAR(150);

/*Додала нову таблицю "Extracurricular"*/
CREATE TABLE Extracurricular (
ActivityID INT PRIMARY KEY,
StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
ActivityName NVARCHAR(100),
JoinDate DATE
    );

/*Видалила таблицю "Extracurricular"*/
DROP TABLE Extracurricular;

/*Створила бази даних "TEACHER"*/
CREATE DATABASE TEACHER;
/*Перевірила її наявність та видалила*/
DROP DATABASE TEACHER;

/*Переключила на потрібну базу даних*/
USE STUDENTS;

/*Додала три рядки даних до таблиці "PersonalInfo"*/
INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth)
VALUES 
    (1, 'Олександр', 'Петров', '2000-05-15'),
    (2, 'Марія', 'Іваненко', '2001-03-22'),
    (3, 'Василь', 'Коваленко', '1999-10-10');
