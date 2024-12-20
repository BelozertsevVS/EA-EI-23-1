CREATE DATABASE University;
/*Створив базу даних University*/
USE University;

CREATE TABLE Students (
        StudentID INT PRIMARY KEY,
        FirstName NVARCHAR(50),
        LastName NVARCHAR(50),
    EnrollmentDate DATE NOT NULL
);
/*Створив таблицю Students*/

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName NVARCHAR(100),
    CourseDescription TEXT,
    Credits INT NOT NULL
);
/*Стврив таблицю Courses*/

INSERT INTO STUDENTS (StudentID, FirstName, LastName, EnrollmentDate)
VALUES 
    (1, 'Андрій', 'Назаров', '2023-07-15'),
    (2, 'Марія', 'Кравцова', '2023-09-22'),
    (3, 'Василь', 'Симоненко', '2023-11-09');


	INSERT INTO Courses (CourseID, CourseName, CourseDescription, Credits) 
VALUES
(1, 'Тімбілдінг', 'Вступ до команди',3),
(2, 'Статистика', 'Статистичний аналіз',4),
(3, 'Маркетинг', 'Основи маркетингу',3);

/*Додав по 3 записи до таблиці Courses та Students*/

SELECT * FROM Students;
SELECT * FROM Courses;
/*Переглянув дані*/

ALTER TABLE Students ADD Email NVARCHAR(100);
ALTER TABLE Courses ADD Department NVARCHAR(100);
/*Додав стовпці до таблиць*/

SELECT * FROM Students;
SELECT * FROM Courses;
/* Повторно виконав запити для перегляду оновлених таблиць */

Drop DATABASE UNIVERSITY;
/*Видалив базу даних*/