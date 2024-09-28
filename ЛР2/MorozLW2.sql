ALTER TABLE AcademicInfo
   ALTER COLUMN Faculty NVARCHAR(150);

           CREATE TABLE Extracurricular (
        ActivityID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        ActivityName NVARCHAR(100),
        JoinDate DATE
    );


	DROP TABLE Extracurricular;
	

	CREATE DATABASE TEACHER;

	DROP DATABASE TEACHER;


	USE STUDENTS;

     INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth)
     VALUES   (1, 'Олександр', 'Петров', '2000-05-15'),
             (2, 'Марія', 'Іваненко', '2001-03-22'),
             (3, 'Василь', 'Коваленко', '1999-10-10');

SELECT *

FROM [dbo].[PersonalInfo];



	

