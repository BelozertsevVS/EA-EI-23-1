
/* Завдання 1: Створення бази даних "University" */
CREATE DATABASE University;
USE University;

/* Завдання 2: Створення таблиці Students */
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    EnrollmentDate DATE
);

/* Завдання 2: Створення таблиці Courses */
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName NVARCHAR(100),
    CourseDescription TEXT,
    Credits INT
);

/* Завдання 3: Заповнення таблиці Students */
INSERT INTO Students (StudentID, FirstName, LastName, EnrollmentDate) VALUES
    (1, 'Андрій', 'Шевченко', '2022-09-01'),
    (2, 'Олена', 'Петрівна', '2023-01-15'),
    (3, 'Марко', 'Зубенко', '2023-09-10');

/* Завдання 3: Заповнення таблиці Courses */
INSERT INTO Courses (CourseID, CourseName, CourseDescription, Credits) VALUES
    (101, 'Програмування', 'Основи програмування та алгоритмізації', 4),
    (102, 'Математика', 'Математичний аналіз та лінійна алгебра', 3),
    (103, 'Фізика', 'Основи фізики', 4);

/* Завдання 4: Вибірка даних з таблиці Students */
SELECT * FROM Students;

/* Завдання 4: Вибірка даних з таблиці Courses */
SELECT * FROM Courses;

/* Завдання 5: Додавання стовпця Email до таблиці Students */
ALTER TABLE Students ADD Email NVARCHAR(100);

/* Завдання 5: Додавання стовпця Department до таблиці Courses */
ALTER TABLE Courses ADD Department NVARCHAR(100);

/* Завдання 6: Повторна вибірка даних з таблиці Students */
SELECT * FROM Students;

/* Завдання 6: Повторна вибірка даних з таблиці Courses */
SELECT * FROM Courses;

/* Завдання 7: Видалення бази даних University */
DROP DATABASE University;
