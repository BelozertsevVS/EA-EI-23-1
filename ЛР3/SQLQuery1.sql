CREATE DATABASE University;
/*Створила базу даних University*/
USE University;

CREATE TABLE Students (
        StudentID INT PRIMARY KEY,
        FirstName NVARCHAR(50),
        LastName NVARCHAR(50),
    EnrollmentDate DATE NOT NULL
);
/*Створила таблицю Students*/

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName NVARCHAR(100),
    CourseDescription TEXT,
    Credits INT NOT NULL
);
/*Стврила таблицю Courses*/

USE UNIVERSITY;

INSERT INTO STUDENTS (StudentID, FirstName, LastName, EnrollmentDate)
VALUES 
    (1, 'Олександр', 'Петров', '2023-09-15'),
    (2, 'Марія', 'Іваненко', '2023-08-22'),
    (3, 'Василь', 'Коваленко', '2023-10-10');


	INSERT INTO Courses (CourseID, CourseName, CourseDescription, Credits) 
VALUES
(1, 'Фінанси', 'Вступ до фінансів',3),
(2, 'Статистика', 'Статистичний аналіз',4),
(3, 'Маркетинг', 'Основи маркетингу',3);

/*Додала по 3 записи до таблиці Courses та Students*/

SELECT * FROM Students;
SELECT * FROM Courses;
/*Переглянула дані*/

ALTER TABLE Students ADD Email NVARCHAR(100);
ALTER TABLE Courses ADD Department NVARCHAR(100);
/*Додала стовпці до таблиць*/

SELECT * FROM Students;
SELECT * FROM Courses;


Drop DATABASE UNIVERSITY;
/*Видалила базу даних*/