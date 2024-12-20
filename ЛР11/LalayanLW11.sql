
-- Завдання 1: Отримати список унікальних ідентифікаторів виробників для замовлень, проведених у 2008 році
SELECT DISTINCT MFR
FROM ORDERS
WHERE YEAR(ORDER_DATE) = 2008
ORDER BY MFR;

-- Завдання 2: Отримати кількість працівників у розрізі кількості відпрацьованих років
SELECT 
    DATEDIFF(YEAR, HIRE_DATE, GETDATE()) AS YEARS_WORKED,
    COUNT(*) AS EMPLOYEE_COUNT
FROM SALESREPS
GROUP BY DATEDIFF(YEAR, HIRE_DATE, GETDATE())
ORDER BY EMPLOYEE_COUNT DESC;

-- Завдання 3: Знайти рік і місяць найму з найбільшою кількістю працівників
SELECT 
    YEAR(HIRE_DATE) AS HIRE_YEAR,
    MONTH(HIRE_DATE) AS HIRE_MONTH,
    COUNT(*) AS EMPLOYEE_COUNT
FROM SALESREPS
GROUP BY YEAR(HIRE_DATE), MONTH(HIRE_DATE)
HAVING COUNT(*) = (
    SELECT MAX(EMP_COUNT)
    FROM (
        SELECT COUNT(*) AS EMP_COUNT
        FROM SALESREPS
        GROUP BY YEAR(HIRE_DATE), MONTH(HIRE_DATE)
    ) AS TEMP
)
ORDER BY HIRE_YEAR, HIRE_MONTH;

-- Завдання 4: Підрахувати кількість замовлень, суму продажів та кількість одиниць товару в зимові місяці
SET DATEFIRST 1; -- Встановлюємо понеділок першим днем тижня для уникнення неточностей
SELECT 
    DATEPART(WEEKDAY, ORDER_DATE) AS DAY_OF_WEEK,
    DATENAME(WEEKDAY, ORDER_DATE) AS DAY_NAME,
    COUNT(DISTINCT ORDER_NUM) AS ORDER_COUNT,
    SUM(AMOUNT) AS TOTAL_SALES,
    SUM(QTY) AS TOTAL_QUANTITY
FROM ORDERS
WHERE MONTH(ORDER_DATE) IN (12, 1, 2)
GROUP BY DATEPART(WEEKDAY, ORDER_DATE), DATENAME(WEEKDAY, ORDER_DATE)
ORDER BY DAY_OF_WEEK;
