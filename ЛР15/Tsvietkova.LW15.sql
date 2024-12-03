--- Завдання 1. Напишіть запит, який поверне список ідентифікаторів виробників та ідентифікаторів товарів без дублікатів ---
SELECT MFR, PRODUCT
FROM (
    SELECT MFR, PRODUCT, ROW_NUMBER() OVER (PARTITION BY MFR, PRODUCT ORDER BY MFR) AS RowNum
    FROM ORDERS
) AS Ranked
WHERE RowNum = 1;

--- Завдання 2. Напишіть запит, що повертає список замовлень на товари, які продавалися більше одного разу ---
SELECT PRODUCT, COUNT(*) AS OrderCount
FROM ORDERS
GROUP BY PRODUCT
HAVING COUNT(*) > 1;

--- Завдання 3. Напишіть запит, який для кожної посади поверне найбільш досвідченого працівника за стажем ---
SELECT TITLE, NAME, HIRE_DATE, YearsWorked
FROM (
    SELECT TITLE, NAME, HIRE_DATE,
           DATEDIFF(YEAR, HIRE_DATE, GETDATE()) AS YearsWorked,
           DENSE_RANK() OVER (PARTITION BY TITLE ORDER BY DATEDIFF(YEAR, HIRE_DATE, GETDATE()) DESC) AS Rank
    FROM SALESREPS
) AS Ranked
WHERE Rank = 1;
