-- ��������� ���� ���� ����� ��� ������
CREATE DATABASE University;

-- ������������ �� ���� ���� �����, ��� �� �������� ������� ������������ � �� �����
USE University;

-- ��������� ������� Students ��� ��������� ����� ��� ��������
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    EnrollmentDate DATE
);

-- ��������� ������� Courses ��� ��������� ����� ��� �����
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName NVARCHAR(100),
    CourseDescription TEXT,
    Credits INT
);

-- ������� ����� � ������� Students
INSERT INTO Students (StudentID, FirstName, LastName, EnrollmentDate) VALUES
(1, '����', '������', '2023-09-01'),
(2, '����', '��������', '2023-09-02'),
(3, '������', '�������', '2023-09-03');


-- ������� ����� � ������� Courses
INSERT INTO Courses (CourseID, CourseName, CourseDescription, Credits) VALUES
(1, '����������', '������ ����������', 3),
(2, '�����������', '����� �� �������������', 4),
(3, '��������', '������ ��������', 3);

-- ������ ��� ����� � ������� Students
SELECT * FROM Students;

-- ������ ��� ����� � ������� Courses
SELECT * FROM Courses;

-- ��������� ������ ������� Email �� ������� Students
ALTER TABLE Students
ADD Email NVARCHAR(100);-- �������� Email ��� ��������� ���������� ����� ��������


-- ��������� ������ ������� Department �� ������� Courses
ALTER TABLE Courses
ADD Department NVARCHAR(50);-- �������� Department ��� ��������� ����� �������

-- �������� �������� ��������� �� ����� ������� Students
SELECT * FROM Students;


-- �������� �������� ��������� �� ����� ������� Courses
SELECT * FROM Courses;

-- ��������� ���� ����� University ���� ���������� ��� ��������
DROP DATABASE University;
