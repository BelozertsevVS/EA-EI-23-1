/*Задача 1
Написала запит, який поверне дані продукту з найбільшою довжиною (за кількістю символів) опису. */
SELECT MFR_ID, PRODUCT_ID, DESCRIPTION, LEN(DESCRIPTION) AS DescriptionLength
FROM dbo.PRODUCTS
WHERE LEN(DESCRIPTION) = (SELECT MAX(LEN(DESCRIPTION)) FROM dbo.PRODUCTS);

/*Задача 2
Написала запит, що повертає дані продуктів, ідентифікатор яких містить лише цифри. */
SELECT DISTINCT 
    CONCAT_WS(' ', RTRIM(MFR_ID), RTRIM(PRODUCT_ID), RTRIM(DESCRIPTION)) AS ConcatenatedString,
    LEN(CONCAT_WS(' ', RTRIM(MFR_ID), RTRIM(PRODUCT_ID), RTRIM(DESCRIPTION))) AS StringLength
FROM dbo.PRODUCTS
WHERE PRODUCT_ID NOT LIKE '%[^0-9]%'
ORDER BY StringLength DESC;

/*Задача 3
Написала запит, який поверне список клієнтів з найменшим кредитним лімітом.*/
SELECT CUST_NUM, 
       CONCAT(LEFT(COMPANY, 2), REPLICATE('*', LEN(COMPANY) - 4), RIGHT(COMPANY, 2)) AS AnonymizedName,
       CREDIT_LIMIT
FROM dbo.CUSTOMERS
WHERE CREDIT_LIMIT = (SELECT MIN(CREDIT_LIMIT) FROM dbo.CUSTOMERS);