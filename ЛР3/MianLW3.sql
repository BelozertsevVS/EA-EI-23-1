-- Створення нової бази даних для роботи
CREATE DATABASE University;

-- Переключення на нову базу даних, щоб всі подальші команди виконувалися в її межах
USE University;

-- Створення таблиці Students для зберігання даних про студентів
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    EnrollmentDate DATE
);

-- Створення таблиці Courses для зберігання даних про курси
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName NVARCHAR(100),
    CourseDescription TEXT,
    Credits INT
);

-- Вставка даних у таблицю Students
INSERT INTO Students (StudentID, FirstName, LastName, EnrollmentDate) VALUES
(1, 'Іван', 'Іванов', '2023-09-01'),
(2, 'Марія', 'Петренко', '2023-09-02'),
(3, 'Олексій', 'Сидоров', '2023-09-03');


-- Вставка даних у таблицю Courses
INSERT INTO Courses (CourseID, CourseName, CourseDescription, Credits) VALUES
(1, 'Математика', 'Основи математики', 3),
(2, 'Інформатика', 'Вступ до програмування', 4),
(3, 'Економіка', 'Основи економіки', 3);

-- Вибірка всіх даних з таблиці Students
SELECT * FROM Students;

-- Вибірка всіх даних з таблиці Courses
SELECT * FROM Courses;

-- Додавання нового стовпця Email до таблиці Students
ALTER TABLE Students
ADD Email NVARCHAR(100);-- Стовпець Email для зберігання електронної пошти студента


-- Додавання нового стовпця Department до таблиці Courses
ALTER TABLE Courses
ADD Department NVARCHAR(50);-- Стовпець Department для зберігання назви кафедри

-- Перевірка оновленої структури та даних таблиці Students
SELECT * FROM Students;


-- Перевірка оновленої структури та даних таблиці Courses
SELECT * FROM Courses;

-- Видалення бази даних University після завершення всіх операцій
DROP DATABASE University;
