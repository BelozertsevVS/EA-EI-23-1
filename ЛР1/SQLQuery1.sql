CREATE TABLE [dbo].[SALESREPS] (
    EmployeeID INT PRIMARY KEY,  
    Name NVARCHAR(100),          
    Age INT,                     
    Position NVARCHAR(100)       
);

CREATE TABLE [dbo].[ORDERS] (
    OrderID INT PRIMARY KEY,     
    MFR NVARCHAR(50),            
    PRODUCT NVARCHAR(50),        
    OrderDate DATE,              
    REP INT                     
);

    INSERT INTO [dbo].[SALESREPS] (EmployeeID, Name, Age, Position)
VALUES 
(1, 'Іван Петренко', 50, 'Менеджер з продажу'),
(2, 'Ольга Іванова', 46, 'Спеціаліст з обслуговування клієнтів'),
(3, 'Сергій Коваль', 40, 'Старший продавець'),
(4, 'Марія Шевченко', 55, 'Керівник відділу продажів'),
(5, 'Андрій Сидоренко', 33, 'Продавець');


INSERT INTO [dbo].[ORDERS] (OrderID, MFR, PRODUCT, OrderDate, REP)
VALUES 
(101, 'MFR01', 'PRD01', '2008-03-15', 1),
(102, 'MFR02', 'PRD02', '2008-06-20', 1),
(103, 'MFR01', 'PRD03', '2008-07-25', 2),
(104, 'MFR03', 'PRD01', '2008-09-30', 3),
(105, 'MFR02', 'PRD04', '2008-11-12', 2),
(106, 'MFR03', 'PRD02', '2009-01-05', 1),
(107, 'MFR01', 'PRD05', '2008-12-10', 4);






SELECT 
    EmployeeID,  
    Name,        
    Age,         
    Position     
FROM 
    [dbo].[SALESREPS]
WHERE 
    Age > 45
ORDER BY 
    Age DESC;


	SELECT DISTINCT 
    MFR,      
    PRODUCT   
FROM 
    [dbo].[ORDERS]
WHERE 
    YEAR(OrderDate) = 2008;

	SELECT TOP 1 WITH TIES 
    REP,                
    COUNT(*) AS OrderCount  
FROM 
    [dbo].[ORDERS]
WHERE 
    YEAR(OrderDate) = 2008
GROUP BY 
    REP
ORDER BY 
    OrderCount DESC;




