--DATA CONSTRAINTS 

-- NOT NULL
--PRIMARY KEY
-- FOREIGN KEY
--=UNIQUE
--CHECK
--DEFAULT





CREATE DATABASE UNIVERSITY;



--PRIMARY KEY
--1) в стовбці місяться тільки унікальні значення
--2) в стовбці не може бути значень NULL
--3) таблиця може містити тільки один РК
--4) може бути композитний РК (складатись з декількох стовбців)


--1-й спосіб задати РК


CREATE TABLE Groups (
GroupID INT NOT NULL, --PRIMARY KEY
Title NVARCHAR(20),
Curator NVARCHAR(100)
)
;


--2-й спосіб задати РК
ALTER TABLE Groups ADD CONSTRAINT  PK_GroupID PRIMARY KEY (GroupID);



-- FOREIGN KEY
-- Не може бути значень, які відсутні в іншої баблиці, на який посилається FK
-- Не може бути значення NULL

--1-й спосіб задати FК
CREATE TABLE Students (
StudentID INT PRIMARY KEY,
[Name] NVARCHAR(100),
GroupID INT
                --FOREIGN KEY (GroupID) REFERENCES [dbo].[Groups] (GroupID)
)
;


--2-й спосіб задати FК
ALTER TABLE [dbo].[Students] ADD CONSTRAINT FK_GroupID 
FOREIGN KEY (GroupID) REFERENCES [dbo].[Groups] (GroupID)



--=UNIQUE
ALTER TABLE [dbo].[Students] ADD [E-MAL] NVARCHAR(50);

ALTER TABLE [dbo].[Students] ADD CONSTRAINT UQ_EMAIL UNIQUE ([E-MAL]);




--CHECK
ALTER TABLE [dbo].[Students] ADD AGE INT

ALTER TABLE [dbo].[Students] ADD CONSTRAINT CHE_AGE CHECK (AGE>=15);



--DEFAULT
ALTER TABLE [dbo].[Students] ADD Date_Of_Entry DATE;



ALTER TABLE [dbo].[Students] ADD CONSTRAINT DF_Date_Of_Entry DEFAULT GETDATE() FOR Date_Of_Entry;



INSERT INTO Groups ([GroupID], [Title], [Curator])
VALUES (1,'EК-20-1', 'Оглих В. В.')

INSERT INTO [dbo].[Students] ([StudentID], [Name], [GroupID], [E-MAL], [AGE])
VALUES (4,'Сидорчуков Щ. І.', 1, '126@mail.com', 29);


SELECT*
FROM  [dbo].[Groups];

SELECT*
FROM  [dbo].[Students];


DROP TABLE Groups
DROP TABLE [dbo].[Students]
