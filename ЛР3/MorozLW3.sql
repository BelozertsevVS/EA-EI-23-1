CREATE DATABASE University;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    EnrollmentDate DATE
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    CourseDescription TEXT,
    Credits INT
);

INSERT INTO Students (StudentID, FirstName, LastName, EnrollmentDate) 
VALUES (1, '����', '��������', '2021-09-01'),
       (2, '����', '������', '2022-01-15'),
       (3, '������', '��������', '2023-03-10');

INSERT INTO Courses (CourseID, CourseName, CourseDescription, Credits)
VALUES (1, '����������', '������ ���� ����������', 5),
       (2, '�������������', '������ ������������� �� Python', 4),
       (3, 'Գ����', '�������� ������', 3);

SELECT * FROM Students;

SELECT * FROM Courses;

ALTER TABLE Students ADD Email VARCHAR(100);

ALTER TABLE Courses ADD Department VARCHAR(100);




SELECT * FROM Students;

SELECT * FROM Courses;

DROP DATABASE University;





