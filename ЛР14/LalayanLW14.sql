
-- Задача 1: Повернути ідентифікатор клієнта (CUST_NUM) з найбільшим кредитним лімітом (CREDIT_LIMIT)
SELECT CUST_NUM
FROM [dbo].[CUSTOMERS]
WHERE CREDIT_LIMIT = (SELECT MAX(CREDIT_LIMIT) FROM [dbo].[CUSTOMERS]);

-- Задача 2: Повернути список замовлень клієнта з найбільшим кредитним лімітом (CREDIT_LIMIT)
SELECT o.ORDER_ID, o.CUST_NUM
FROM [dbo].[ORDERS] o
WHERE o.CUST_NUM IN (
    SELECT CUST_NUM
    FROM [dbo].[CUSTOMERS]
    WHERE CREDIT_LIMIT = (SELECT MAX(CREDIT_LIMIT) FROM [dbo].[CUSTOMERS])
);

-- Задача 3: Повернути найновіше замовлення клієнта з найбільшим кредитним лімітом (CREDIT_LIMIT)
SELECT TOP 1 o.ORDER_ID, o.CUST_NUM, o.ORDER_DATE
FROM [dbo].[ORDERS] o
WHERE o.CUST_NUM IN (
    SELECT CUST_NUM
    FROM [dbo].[CUSTOMERS]
    WHERE CREDIT_LIMIT = (SELECT MAX(CREDIT_LIMIT) FROM [dbo].[CUSTOMERS])
)
ORDER BY o.ORDER_DATE DESC;
