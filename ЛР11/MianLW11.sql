-- Завдання 1

-- Вибираємо унікальні ідентифікатори виробників із таблиці замовлень
SELECT DISTINCT MFR
FROM [dbo].[ORDERS]
WHERE YEAR(Order_Date) = 2008  -- Відбір записів, де рік дати замовлення дорівнює 2008
ORDER BY MFR;                 -- Сортування результатів за ідентифікатором виробника

-- Завдання 2
SELECT 
    DATEDIFF(YEAR, HIRE_DATE, GETDATE()) AS YearsWorked,  -- Розрахунок років роботи
    COUNT(*) AS EmployeeCount                           -- Підрахунок працівників для кожного року роботи
FROM [dbo].[SALESREPS]
GROUP BY DATEDIFF(YEAR, HIRE_DATE, GETDATE())            -- Групування за кількістю років роботи
ORDER BY EmployeeCount DESC;                            -- Сортування за кількістю працівників у спадаючому порядку

-- Задача 3
WITH HireStats AS (
    SELECT 
        YEAR(HIRE_DATE) AS HireYear,               -- Рік найму
        MONTH(HIRE_DATE) AS HireMonth,            -- Місяць найму
        COUNT(*) AS HiresCount                    -- Кількість наймів
    FROM [dbo].[SALESREPS]
    GROUP BY YEAR(HIRE_DATE), MONTH(HIRE_DATE)    -- Групування за роком і місяцем
)
SELECT HireYear, HireMonth, HiresCount
FROM HireStats
WHERE HiresCount = (SELECT MAX(HiresCount) FROM HireStats);  -- Вибір записів із максимальною кількістю наймів

-- Задача 4
SELECT 
    DATEPART(WEEKDAY, ORDER_DATE) AS DayOfWeekNumber,  -- Номер дня тижня
    DATENAME(WEEKDAY, ORDER_DATE) AS DayOfWeekName,   -- Назва дня тижня
    COUNT(DISTINCT ORDER_NUM) AS UniqueOrders,        -- Кількість унікальних замовлень
    SUM(AMOUNT) AS TotalSales,                        -- Загальна сума продажів
    SUM(QTY) AS TotalQuantity                         -- Загальна кількість одиниць товару
FROM [dbo].[ORDERS]
WHERE MONTH(ORDER_DATE) IN (12, 1, 2)                 -- Вибірка замовлень у зимові місяці
GROUP BY DATEPART(WEEKDAY, ORDER_DATE),               -- Групування за днями тижня
         DATENAME(WEEKDAY, ORDER_DATE)
ORDER BY DayOfWeekNumber;                             -- Сортування за номером дня тижня

