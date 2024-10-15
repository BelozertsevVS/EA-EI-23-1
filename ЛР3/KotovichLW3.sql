CREATE TABLE Students 
(StudentID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
EnrollmentDate DATE);

CREATE TABLE Courses 
(CourseID INT PRIMARY KEY,
CourseName VARCHAR(100),
CourseDescription TEXT,
Credits INT);

INSERT INTO Students (StudentID, FirstName, LastName, EnrollmentDate)
VALUES 
(1, 'Сергій', 'Смирнов', '2023-09-26'),
(2, 'Миколай', 'Малько', '2023-09-18'),
(3, 'Оксана', 'Мельникова', '2023-09-12');

INSERT INTO Courses (CourseID, CourseName, CourseDescription, Credits)
VALUES 
(1, 'Інформатика', 'Основи програмування', 35),
(2, 'Економіка', 'Маркетинг', 40),
(3, 'Економіка', 'Бізнес аналітика', 50);

SELECT * FROM Students;

SELECT * FROM Courses;

ALTER TABLE Students
ADD Email VARCHAR(100);

ALTER TABLE Courses
ADD Department VARCHAR(100);

SELECT * FROM Students;

SELECT * FROM Courses;

DROP DATABASE University;