Use WebStor;
/*Використала базу даних WebStor*/

/*Завдання 1
Написала запит, який повертає список ідентифікаторів виробників та ідентифікаторів товарів без дублікатів.*/
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

/*Завдання 2
Написала запит, що повертає список замовлень на товари, які продавалися більше одного разу (за кількістю замовлень на <MFR>, <PRODUCT>).*/
SELECT 
    MFR, 
    PRODUCT
FROM ORDERS
GROUP BY MFR, PRODUCT
HAVING COUNT(*) > 1;

/*Завдання 3
Написала запит, який для кожної окремої посади поверне найбільш досвідченого працівника (за кількістю відпрацьованих років).*/
WITH RankedEmployees AS (
    SELECT 
        TITLE, 
        EMPL_NUM, 
        DATEDIFF(YEAR, HIRE_DATE, GETDATE()) AS Experience,
        DENSE_RANK() OVER (PARTITION BY TITLE ORDER BY DATEDIFF(YEAR, HIRE_DATE, GETDATE()) DESC) AS Rank
    FROM SALESREPS
)
SELECT 
    TITLE, 
    EMPL_NUM, 
    Experience
FROM RankedEmployees
WHERE Rank = 1;
