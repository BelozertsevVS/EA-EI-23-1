SELECT DISTINCT MFR
FROM [dbo].[ORDERS]
WHERE YEAR(Order_Date) = 2008
ORDER BY MFR;

SELECT 
	DATEDIFF(YEAR, Hire_Date, GETDATE()) AS YearsWorked,
	COUNT(*) AS EmployeeCount
FROM [dbo].[SALESREPS]
GROUP BY DATEDIFF(YEAR, Hire_Date, GETDATE())
ORDER BY EmployeeCount DESC;

SELECT 
	   YEAR(Hire_Date) AS HireYear,
       MONTH(Hire_Date) AS HireMonth,
       COUNT(*) AS EmployeeCount
FROM [dbo].[SALESREPS]
GROUP BY YEAR(Hire_Date), MONTH(Hire_Date)
HAVING COUNT(*) = (
    SELECT MAX(EmployeeCount)
    FROM (
        SELECT COUNT(*) AS EmployeeCount
        FROM [dbo].[SALESREPS]
        GROUP BY YEAR(Hire_Date), MONTH(Hire_Date)
    ) AS SubQuery
)
ORDER BY HireYear, HireMonth;

SELECT 
	   DATENAME(WEEKDAY, Order_Date) AS WeekdayName,
       DATEPART(WEEKDAY, Order_Date) AS WeekdayNumber,
       COUNT(DISTINCT Order_num) AS UniqueOrders,
       SUM(Amount) AS TotalSales,
       SUM(QTY) AS TotalQuantity
FROM [dbo].[ORDERS]
WHERE MONTH(Order_Date) IN (12, 1, 2)
GROUP BY DATENAME(WEEKDAY, Order_Date), DATEPART(WEEKDAY, Order_Date)
ORDER BY WeekdayNumber;	