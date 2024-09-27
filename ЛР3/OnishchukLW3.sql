CREATE DATABASE University;
-- Використовую БД за допомогою команди "USE"
USE University; 
-- Створив таблицю за допомогою команди "CREATE TABLE"
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    EnrollmentDate DATE
);
	-- Створив таблицю за допомогою команди "CREATE TABLE"
	CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    CourseDescription TEXT,
    Credits INT
);

-- Заповнив таблицю даними завдяки команді "INSERT INTO"
INSERT INTO Students (StudentID, FirstName, LastName, EnrollmentDate)
VALUES 
(1, 'Назар', 'Оніщук', '2024-09-26'),
(2, 'Олена', 'Павленко', '2023-08-15'),
(3, 'Антон', 'Ковальчук', '2022-01-10');

-- Заповнив таблицю даними завдяки команді "INSERT INTO"
INSERT INTO Courses (CourseID, CourseName, CourseDescription, Credits)
VALUES 
(101, 'Інформатика', 'Основи програмування', 5),
(102, 'Математика', 'Вища математика для технічних спеціальностей', 4),
(103, 'Економіка', 'Історія та розвиток економіки', 2);

SELECT * FROM Students;

SELECT * FROM Courses;
-- додав новий рядок в таблицю через команду "ADD"
ALTER TABLE Students
ADD Email VARCHAR(100);
-- додав новий рядок в таблицю через команду "ADD"
ALTER TABLE Courses
ADD Department VARCHAR(100);

SELECT * FROM Students;

SELECT * FROM Courses;
-- Видалив таблицю через команду "DROP"
DROP DATABASE University;