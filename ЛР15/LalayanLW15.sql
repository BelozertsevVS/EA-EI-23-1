
USE WebStor;
/* Використовуємо базу даних WebStor */

/* Завдання 1
Запит повертає список ідентифікаторів виробників та ідентифікаторів товарів без дублікатів.
Використовуємо ROW_NUMBER для уникнення дублікатів.
*/
WITH RankedOrders AS (
    SELECT 
        MFR, 
        PRODUCT,
        ROW_NUMBER() OVER (PARTITION BY MFR, PRODUCT ORDER BY ORDER_DATE) AS RowNum
    FROM ORDERS
)
SELECT 
    MFR, 
    PRODUCT
FROM RankedOrders
WHERE RowNum = 1;


/* Завдання 2
Запит повертає список товарів, які продавалися більше одного разу.
Використовуємо COUNT для підрахунку замовлень і фільтруємо за HAVING.
*/
WITH RankedProducts AS (
    SELECT 
        MFR, 
        PRODUCT,
        COUNT(*) OVER (PARTITION BY MFR, PRODUCT) AS OrderCount
    FROM ORDERS
)
SELECT DISTINCT 
    MFR, 
    PRODUCT
FROM RankedProducts
WHERE OrderCount > 1;


/* Завдання 3
Запит повертає найбільш досвідчених працівників для кожної посади.
Розраховуємо стаж працівників і використовуємо DENSE_RANK для визначення першого місця.
*/
WITH RankedEmployees AS (
    SELECT 
        TITLE, 
        NAME, 
        HIRE_DATE,
        DATEDIFF(YEAR, HIRE_DATE, GETDATE()) AS Experience,
        DENSE_RANK() OVER (PARTITION BY TITLE ORDER BY DATEDIFF(YEAR, HIRE_DATE, GETDATE()) DESC) AS Rank
    FROM SALESREPS
)
SELECT 
    TITLE, 
    NAME, 
    HIRE_DATE,
    Experience
FROM RankedEmployees
WHERE Rank = 1;
