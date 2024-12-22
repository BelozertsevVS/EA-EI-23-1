SELECT 
MFR AS MFR,
SUM(Amount) AS TotalSales
FROM 
[dbo].[ORDERS]
WHERE 
YEAR(Order_Date) = 2008
GROUP BY 
MFR
ORDER BY 
MFR ASC;

SELECT 
DATEDIFF(YEAR, Hire_Date, GETDATE()) AS YearsOfService,
COUNT(*) AS EmployeeCount
FROM 
[dbo].[SALESREPS]
GROUP BY 
DATEDIFF(YEAR, Hire_Date, GETDATE())
ORDER BY 
EmployeeCount DESC;

SELECT 
YEAR(Hire_Date) AS HireYear,
MONTH(Hire_Date) AS HireMonth,
COUNT(*) AS HiredCount
FROM 
[dbo].[SALESREPS]
GROUP BY 
YEAR(Hire_Date),
MONTH(Hire_Date)
ORDER BY 
HireYear ASC,
HireMonth ASC;
