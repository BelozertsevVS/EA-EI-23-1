Use WebStor;
/*Використала базу даних WebStore*/

/*Завдання 1
Написала запит, який поверне список ідентифікаторів виробників (без дублікатів).*/
SELECT DISTINCT MFR AS ManufacturerID
FROM ORDERS
WHERE YEAR(ORDER_DATE) = 2008
ORDER BY MFR;

/*Завдання 2
Написала запит, який у розрізі кількості відпрацьованих років (математична різниця в роках) поверне кількість працівників.*/
SELECT 
    DATEDIFF(year, HIRE_DATE, GETDATE()) AS YearsWorked, 
    COUNT(*) AS EmployeeCount
FROM SALESREPS
GROUP BY DATEDIFF(year, HIRE_DATE, GETDATE())
ORDER BY EmployeeCount DESC;

/*Завдання 3
Написала запит, який поверне період (рік, місяць) найму з найбільшою кількістю працівників.*/
WITH HireCounts AS (
    SELECT 
        YEAR(HIRE_DATE) AS HireYear,
        MONTH(HIRE_DATE) AS HireMonth,
        COUNT(*) AS EmployeeCount
    FROM SALESREPS
    GROUP BY YEAR(HIRE_DATE), MONTH(HIRE_DATE)
)
SELECT HireYear, HireMonth, EmployeeCount
FROM HireCounts
WHERE EmployeeCount = (
    SELECT MAX(EmployeeCount)
    FROM HireCounts
);

/*Завдання 4
Написала запит, який у розрізі дня тижня (у строковому представленні) поверне кількість унікальних замовлень, загальну суму продаж, загальну кількість проданих од. товару (за весь час).*/
SELECT 
    DATEPART(weekday, ORDER_DATE) AS WeekdayNumber,
    DATENAME(weekday, ORDER_DATE) AS WeekdayName,
    COUNT(DISTINCT ORDER_NUM) AS UniqueOrders,
    SUM(AMOUNT) AS TotalSales,
    SUM(QTY) AS TotalQuantity
FROM ORDERS
WHERE MONTH(ORDER_DATE) IN (12, 1, 2)
GROUP BY DATEPART(weekday, ORDER_DATE), DATENAME(weekday, ORDER_DATE)
ORDER BY WeekdayNumber;