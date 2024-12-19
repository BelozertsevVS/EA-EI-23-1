CREATE DATABASE University;
/*������� ���� ����� University*/
USE University;

CREATE TABLE Students (
        StudentID INT PRIMARY KEY,
        FirstName NVARCHAR(50),
        LastName NVARCHAR(50),
    EnrollmentDate DATE NOT NULL
);
/*������� ������� Students*/

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName NVARCHAR(100),
    CourseDescription TEXT,
    Credits INT NOT NULL
);
/*������ ������� Courses*/

INSERT INTO STUDENTS (StudentID, FirstName, LastName, EnrollmentDate)
VALUES 
    (1, '�����', '�������', '2023-07-15'),
    (2, '����', '��������', '2023-09-22'),
    (3, '������', '���������', '2023-11-09');


	INSERT INTO Courses (CourseID, CourseName, CourseDescription, Credits) 
VALUES
(1, 'ҳ������', '����� �� �������',3),
(2, '����������', '������������ �����',4),
(3, '���������', '������ ����������',3);

/*����� �� 3 ������ �� ������� Courses �� Students*/

SELECT * FROM Students;
SELECT * FROM Courses;
/*���������� ���*/

ALTER TABLE Students ADD Email NVARCHAR(100);
ALTER TABLE Courses ADD Department NVARCHAR(100);
/*����� ������� �� �������*/

SELECT * FROM Students;
SELECT * FROM Courses;
/* �������� ������� ������ ��� ��������� ��������� ������� */

Drop DATABASE UNIVERSITY;
/*������� ���� �����*/