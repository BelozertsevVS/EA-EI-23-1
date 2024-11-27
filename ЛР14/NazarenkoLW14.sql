Use WebStor;
/* Використала базу даних WebStor*/

/*Завдання 1
Написала запит, який повертає ідентифікатор клієнта з найбільшим кредитним лімітом.*/
SELECT CUST_NUM
FROM CUSTOMERS
WHERE CREDIT_LIMIT = (SELECT MAX(CREDIT_LIMIT) FROM CUSTOMERS);

/*Завдання 2
Написала запит, що повертає список замовлень клієнта з найбільшим кредитним лімітом */
SELECT o.ORDER_NUM, o.ORDER_DATE, o.CUST, o.AMOUNT
FROM ORDERS o
WHERE o.CUST IN (
    SELECT CUST_NUM
    FROM CUSTOMERS
    WHERE CREDIT_LIMIT = (SELECT MAX(CREDIT_LIMIT) FROM CUSTOMERS)
);

/*Завдання 3
Написала запит, що повертає найновіше (за датою проведення ORDER_DATE) замовлення серед списку замовлень клієнта з найбільшим кредитним лімітом*/
SELECT TOP 1 o.ORDER_NUM, o.ORDER_DATE, o.CUST, o.AMOUNT
FROM ORDERS o
WHERE o.CUST IN (
    SELECT CUST_NUM
    FROM CUSTOMERS
    WHERE CREDIT_LIMIT = (SELECT MAX(CREDIT_LIMIT) FROM CUSTOMERS)
)
ORDER BY o.ORDER_DATE DESC;
