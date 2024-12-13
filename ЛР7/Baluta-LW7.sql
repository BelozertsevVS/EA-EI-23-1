SELECT *
FROM [dbo].[SALESREPS];
SELECT 
    EMPL_NUM AS EmployeeID,      
    NAME AS EmployeeName,        
    AGE,                        
    TITLE AS Position            
FROM [dbo].[SALESREPS]
WHERE AGE > 45
ORDER BY AGE DESC;

SELECT DISTINCT MFR, PRODUCT
FROM [dbo].[ORDERS]
WHERE YEAR(Order_Date) = 2008;

SELECT TOP 1 WITH TIES REP, COUNT(*) AS OrderCount
FROM [dbo].[ORDERS]
WHERE YEAR(Order_Date) = 2008
GROUP BY REP
ORDER BY COUNT(*) DESC;