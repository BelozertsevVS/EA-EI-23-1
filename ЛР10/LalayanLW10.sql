
-- Задача 1
-- Список унікальних ідентифікаторів виробників з умовами на суму замовлення та кількість одиниць товару
SELECT DISTINCT ManufacturerID
FROM [dbo].[ORDERS]
WHERE (OrderTotal % 2 = 0) AND (Quantity % 2 = 1)
ORDER BY ManufacturerID;

-- Задача 2
-- Загальна та середня вартість одиниць товару на складі в розрізі виробників
SELECT 
    ManufacturerID,
    ROUND(SUM(Quantity * UnitPrice), 2) AS TotalValue,
    ROUND(AVG(UnitPrice), 2) AS AveragePrice
FROM [dbo].[PRODUCTS]
GROUP BY ManufacturerID
ORDER BY ManufacturerID;

-- Задача 3
-- Працівник з найбільшою різницею між ціллю та поточними продажами
-- Разом із кількістю років на момент найму
WITH SalesDifference AS (
    SELECT 
        EmployeeID,
        ABS(SalesTarget - CurrentSales) AS AbsoluteDifference,
        ROUND(DATEDIFF(YEAR, HireDate, GETDATE()), 2) AS YearsWithCompany
    FROM [dbo].[SALESREPS]
),
MaxDifference AS (
    SELECT MAX(AbsoluteDifference) AS MaxDiff
    FROM SalesDifference
)
SELECT 
    s.EmployeeID,
    s.AbsoluteDifference,
    s.YearsWithCompany
FROM SalesDifference s
JOIN MaxDifference m ON s.AbsoluteDifference = m.MaxDiff;
