CREATE DATABASE University;
GO
/* Створила базу даних "University" */


USE University;
GO

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    EnrollmentDate DATE
);
GO
/* Створила таблицю "Students" */


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName NVARCHAR(100),
    CourseDescription TEXT,
    Credits INT
);
GO
/* Створила таблицю "Courses" */


INSERT INTO Students (StudentID, FirstName, LastName, EnrollmentDate)
VALUES 
(1, 'John', 'Doe', '2023-09-01'),
(2, 'Jane', 'Smith', '2022-09-01'),
(3, 'Alex', 'Johnson', '2021-09-01');
GO
/* Виконую вставку записів у таблицю "Students" */

INSERT INTO Courses (CourseID, CourseName, CourseDescription, Credits)
VALUES 
(1, 'Mathematics', 'Introduction to Mathematics', 3),
(2, 'Computer Science', 'Basics of Computing', 4),
(3, 'Physics', 'Fundamentals of Physics', 3);
GO
/* Виконую вставку записів у таблицю "Courses" */


SELECT * FROM Students;
GO

SELECT * FROM Courses;
GO
/* Виконую вибірку даних з таблиць "Courses" та "Students" */


ALTER TABLE Students
ADD Email NVARCHAR(100);
GO
/* Виконую модифікацію таблиці "Students" шляхом додавання стовпця "Email" */


ALTER TABLE Courses
ADD Department NVARCHAR(100);
GO
/* Виконую модифікацію таблиці "Courses" шляхом додавання стовпця "Department" */


SELECT * FROM Students;
GO

SELECT * FROM Courses;
GO
/* Виконую повторну вибірку даних з таблиць "Courses" та "Students" */


DROP DATABASE University;
GO
/* Виконую видалення бази даних "University" */