--DATA CONSTRAINTS 

-- NOT NULL
--PRIMARY KEY
-- FOREIGN KEY
--=UNIQUE
--CHECK
--DEFAULT





CREATE DATABASE UNIVERSITY;



--PRIMARY KEY
--1) � ������� ������� ����� ������� ��������
--2) � ������� �� ���� ���� ������� NULL
--3) ������� ���� ������ ����� ���� ��
--4) ���� ���� ����������� �� (���������� � �������� ��������)


--1-� ����� ������ ��


CREATE TABLE Groups (
GroupID INT NOT NULL, --PRIMARY KEY
Title NVARCHAR(20),
Curator NVARCHAR(100)
)
;


--2-� ����� ������ ��
ALTER TABLE Groups ADD CONSTRAINT  PK_GroupID PRIMARY KEY (GroupID);



-- FOREIGN KEY
-- �� ���� ���� �������, �� ������ � ���� �������, �� ���� ���������� FK
-- �� ���� ���� �������� NULL

--1-� ����� ������ F�
CREATE TABLE Students (
StudentID INT PRIMARY KEY,
[Name] NVARCHAR(100),
GroupID INT
                --FOREIGN KEY (GroupID) REFERENCES [dbo].[Groups] (GroupID)
)
;


--2-� ����� ������ F�
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
VALUES (1,'E�-20-1', '����� �. �.')

INSERT INTO [dbo].[Students] ([StudentID], [Name], [GroupID], [E-MAL], [AGE])
VALUES (4,'���������� �. �.', 1, '126@mail.com', 29);


SELECT*
FROM  [dbo].[Groups];

SELECT*
FROM  [dbo].[Students];


DROP TABLE Groups
DROP TABLE [dbo].[Students]
