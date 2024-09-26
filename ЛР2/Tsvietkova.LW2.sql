   CREATE DATABASE STUDENTS;

/* Створила базу даних "STUDENTS" за допомогою команди CREATE DATABASE */

   USE STUDENTS;

 /* Використовуючи команду "USE" перейшла до бази даних "STUDENTS" */ 

   CREATE TABLE PersonalInfo (
        StudentID INT PRIMARY KEY,
        FirstName NVARCHAR(50),
        LastName NVARCHAR(50),
        DateOfBirth DATE
    );

/* Використовуючи команду "CREATE TABLE" створила таблицю "PersonalInfo" */ 

	CREATE TABLE AcademicInfo (
        RecordID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        Faculty NVARCHAR(100),
        Curator NVARCHAR(100),
        EnrollmentYear INT
    );

/* Використовуючи команду "CREATE TABLE" створила таблицю "AcademicInfo" */ 

	    CREATE TABLE ContactInfo (
        ContactID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        Email NVARCHAR(100),
        PhoneNumber NVARCHAR(15)
    );
   
/* Використовуючи команду "CREATE TABLE" створила таблицю "ContactInfo" */ 

   ALTER TABLE ContactInfo ADD Address NVARCHAR(200);

 /* За допомогою команд "ALTER TABLE", "ADD", "NVARCHAR(200);" додала стовбець "Address" до таблиці "ContactInfo" */ 

   ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;

/* За допомогою команд "ALTER TABLE", "DROP COLUMN" видалила стовбець "PhoneNumber" в таблиці "ContactInfo" */ 

   EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN';

 /* Змінила ім'я стовбця "Email" на "EmailAddress" */ 

   ALTER TABLE AcademicInfo
   ALTER COLUMN Faculty NVARCHAR(150);

 /* Змінила тип даних для стовбця "Faculty" у таблиці "AcademicInfo" на NVARCHAR(150) */ 

           CREATE TABLE Extracurricular (
        ActivityID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        ActivityName NVARCHAR(100),
        JoinDate DATE
    );

/* Додала нову таблицю "Extracurricular" */ 

	DROP TABLE Extracurricular;

/* Видалила нову таблицю "Extracurricular" :( */

	CREATE DATABASE TEACHER;

/* Створила бази даних "TEACHER" */ 

	DROP DATABASE TEACHER;

/* Видалила базу даних "TEACHER" :( */ 

	USE STUDENTS;

/* Перейшла до бази даних "STUDENTS" */

	INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth)
VALUES 
    (1, 'Олександр', 'Петров', '2000-05-15'),
    (2, 'Марія', 'Іваненко', '2001-03-22'),
    (3, 'Василь', 'Коваленко', '1999-10-10');

/* Додала три рядки даних до таблиці "PersonalInfo" */ 
