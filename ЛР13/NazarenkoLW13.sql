Use WebStor;
/*Використала базу даних WebStor*/

/*Завдання 1
Написала запит, який поверне список унікальних ідентифікаторів виробників товару (MFR).*/
SELECT DISTINCT o.MFR
FROM ORDERS o
INNER JOIN CUSTOMERS c ON o.CUST = c.CUST_NUM
WHERE c.COMPANY LIKE '%CORP%'
  AND YEAR(o.ORDER_DATE) = 2008;

 /*Завдання 2
 Написала запит, який у розрізі ідентифікатора клієнта (CUST_NUM) та місяця проведення замовлення (ORDER_DATE) поверне кількість унікальних замовлень (для цього використовується GROUP BY). */
  SELECT 
    c.CUST_NUM,
    MONTH(o.ORDER_DATE) AS OrderMonth,
    COUNT(DISTINCT o.ORDER_NUM) AS UniqueOrders
FROM CUSTOMERS c
LEFT JOIN ORDERS o ON c.CUST_NUM = o.CUST
WHERE c.COMPANY LIKE '%CORP%'
  AND (YEAR(o.ORDER_DATE) = 2008 OR o.ORDER_NUM IS NULL)
GROUP BY c.CUST_NUM, MONTH(o.ORDER_DATE)
ORDER BY UniqueOrders DESC;

/*Завдання 3
Написала запит, який поверне список (без дублікатів) придбаних товарів. */
SELECT DISTINCT 
    c.CUST_NUM,
    UPPER(c.COMPANY) AS CompanyName,
    p.DESCRIPTION
FROM CUSTOMERS c
LEFT JOIN ORDERS o ON c.CUST_NUM = o.CUST
LEFT JOIN PRODUCTS p ON o.MFR = p.MFR_ID AND o.PRODUCT = p.PRODUCT_ID
WHERE c.COMPANY LIKE '%CORP%'
  AND (YEAR(o.ORDER_DATE) = 2008 OR o.ORDER_NUM IS NULL);
