CREATE DATABASE NewDB;


USE [NewDB];

CREATE TABLE Employees (
ID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50)
);

SELECT *
FROM [dbo].[Employees];


ALTER TABLE [dbo].[Employees] ADD Email VARCHAR(100);


DROP TABLE [dbo].[Employees]; 


DROP DATABASE [NewDB]; 