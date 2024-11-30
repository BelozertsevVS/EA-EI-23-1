-- Завдання 1

-- Вибираємо унікальні ідентифікатори виробників із таблиці замовлень
SELECT DISTINCT ManufacturerID
FROM [dbo].[ORDERS]
-- Фільтруємо лише ті замовлення, що були зроблені у 2008 році
WHERE YEAR(OrderDate) = 2008
-- Сортуємо результати за ідентифікатором виробника у зростаючому порядку
ORDER BY ManufacturerID ASC;


-- Завдання 2

-- Вираховуємо кількість відпрацьованих років для кожного працівника
SELECT DATEDIFF(YEAR, HireDate, GETDATE()) AS YearsWorked, 
       -- Підраховуємо кількість працівників для кожного відпрацьованого періоду
       COUNT(*) AS EmployeeCount
FROM [dbo].[SALESREPS]
-- Групуємо працівників за кількістю відпрацьованих років
GROUP BY DATEDIFF(YEAR, HireDate, GETDATE())
-- Сортуємо результат за кількістю працівників у спадному порядку
ORDER BY EmployeeCount DESC;


-- Задача 3

-- Визначаємо рік та місяць із найбільшою кількістю найнятих працівників
SELECT YEAR(HireDate) AS HireYear,       -- Витягуємо рік найму
       MONTH(HireDate) AS HireMonth,    -- Витягуємо місяць найму
       COUNT(*) AS EmployeeCount        -- Підраховуємо кількість працівників
FROM [dbo].[SALESREPS]
-- Групуємо дані за роком та місяцем найму
GROUP BY YEAR(HireDate), MONTH(HireDate)
-- Фільтруємо лише ті періоди, де кількість найнятих працівників дорівнює максимуму
HAVING COUNT(*) = (
    SELECT MAX(EmployeeCount)           -- Підзапит для визначення максимального значення
    FROM (
        SELECT COUNT(*) AS EmployeeCount
        FROM [dbo].[SALESREPS]
        GROUP BY YEAR(HireDate), MONTH(HireDate)
    ) AS SubQuery
)
-- Сортуємо результат за роком та місяцем найму
ORDER BY HireYear, HireMonth;


-- Задача 4

-- Аналізуємо замовлення за днями тижня для зимових місяців
SELECT DATEPART(WEEKDAY, OrderDate) AS WeekdayNumber, -- Номер дня тижня
       DATENAME(WEEKDAY, OrderDate) AS WeekdayName,   -- Назва дня тижня
       COUNT(DISTINCT OrderID) AS TotalOrders,        -- Кількість унікальних замовлень
       SUM(TotalAmount) AS TotalSales,                -- Загальна сума продажів
       SUM(TotalQuantity) AS TotalUnitsSold           -- Загальна кількість проданих одиниць товару
FROM [dbo].[ORDERS]
-- Фільтруємо дані, враховуючи лише зимові місяці: грудень, січень, лютий
WHERE MONTH(OrderDate) IN (12, 1, 2)
-- Групуємо результати за номером і назвою дня тижня
GROUP BY DATEPART(WEEKDAY, OrderDate), DATENAME(WEEKDAY, OrderDate)
-- Сортуємо за номером дня тижня у зростаючому порядку
ORDER BY WeekdayNumber ASC;


