-- Завдання 1: Список унікальних ідентифікаторів виробників товарів (MFR)
SELECT DISTINCT [MFR_ID] AS Manufacturer
FROM dbo.CUSTOMERS C
INNER JOIN dbo.ORDERS O 
    ON C.CUST_NUM = O.CUST
INNER JOIN dbo.PRODUCTS P 
    ON O.PRODUCT = P.PRODUCT_ID
WHERE O.ORDER_DATE >= '2008-01-01' AND O.ORDER_DATE <= '2008-12-31'
  AND C.COMPANY LIKE '%CORP%';

-- Завдання 2: Кількість унікальних замовлень за клієнтом та місяцем
SELECT 
    C.CUST_NUM AS CustomerID,
    MONTH(O.ORDER_DATE) AS OrderMonth,
    COUNT(DISTINCT O.ORDER_NUM) AS UniqueOrders
FROM dbo.CUSTOMERS C
LEFT JOIN dbo.ORDERS O 
    ON C.CUST_NUM = O.CUST
WHERE (O.ORDER_DATE >= '2008-01-01' AND O.ORDER_DATE <= '2008-12-31' OR O.ORDER_DATE IS NULL)
  AND C.COMPANY LIKE '%CORP%'
GROUP BY C.CUST_NUM, MONTH(O.ORDER_DATE)
ORDER BY UniqueOrders DESC;

-- Завдання 3: Список придбаних товарів
SELECT 
    C.CUST_NUM AS CustomerID,
    UPPER(C.COMPANY) AS CompanyName,
    UPPER(P.DESCRIPTION) AS ProductDescription
FROM dbo.CUSTOMERS C
LEFT JOIN dbo.ORDERS O 
    ON C.CUST_NUM = O.CUST
LEFT JOIN dbo.PRODUCTS P 
    ON O.PRODUCT = P.PRODUCT_ID
WHERE (O.ORDER_DATE >= '2008-01-01' AND O.ORDER_DATE <= '2008-12-31' OR O.ORDER_DATE IS NULL)
  AND C.COMPANY LIKE '%CORP%'
GROUP BY C.CUST_NUM, C.COMPANY, P.DESCRIPTION;
