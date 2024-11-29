
--- Завдання 1. Запит, який повертає ідентифікатор клієнта (CUST_NUM) з найбільшим кредитним лімітом (CREDIT_LIMIT) ---
SELECT CUST_NUM
FROM CUSTOMERS
WHERE CREDIT_LIMIT = (SELECT MAX(CREDIT_LIMIT) FROM CUSTOMERS);

--- Завдання 2. Запит, що повертає список замовлень клієнта з найбільшим кредитним лімітом (CREDIT_LIMIT) ---
SELECT O.ORDER_NUM, O.ORDER_DATE, O.MFR, O.PRODUCT, O.QTY, O.AMOUNT
FROM ORDERS O
WHERE O.CUST IN (
    SELECT CUST
    FROM CUSTOMERS
    WHERE CREDIT_LIMIT = (SELECT MAX(CREDIT_LIMIT) FROM CUSTOMERS)
);

--- Завдання 3. Запит, що повертає найновіше (за датою ORDER_DATE) замовлення клієнта з найбільшим кредитним лімітом (CREDIT_LIMIT) ---
SELECT TOP 1 O.ORDER_NUM, O.ORDER_DATE, O.CUST, O.MFR, O.PRODUCT, O.QTY, O.AMOUNT
FROM ORDERS O
WHERE O.CUST IN (
    SELECT CUST
    FROM CUSTOMERS
    WHERE CREDIT_LIMIT = (SELECT MAX(CREDIT_LIMIT) FROM CUSTOMERS)
)
ORDER BY O.ORDER_DATE DESC;
