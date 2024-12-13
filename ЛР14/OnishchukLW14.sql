SELECT  CUST_NUM
FROM [dbo].[CUSTOMERS]
  Where CREDIT_LIMIT =(SELECT MAX(CREDIT_LIMIT) FROM [dbo].[CUSTOMERS])


  SELECT ORDERS.ORDER_NUM, ORDERS.CUST
FROM dbo.ORDERS
WHERE ORDERS.CUST IN (SELECT CUSTOMERS.CUST_NUM FROM dbo.CUSTOMERS
    WHERE CUSTOMERS.CREDIT_LIMIT = (SELECT MAX(CREDIT_LIMIT) FROM dbo.CUSTOMERS)
);

SELECT ORDERS.CUST, ORDERS.ORDER_NUM, ORDERS.ORDER_DATE
FROM dbo.ORDERS
WHERE ORDERS.ORDER_DATE = (
    SELECT MAX(ORDER_DATE)
    FROM dbo.ORDERS
    WHERE CUST IN (
        SELECT CUST_NUM
        FROM dbo.CUSTOMERS
        WHERE CREDIT_LIMIT = (SELECT MAX(CREDIT_LIMIT) FROM dbo.CUSTOMERS)));

