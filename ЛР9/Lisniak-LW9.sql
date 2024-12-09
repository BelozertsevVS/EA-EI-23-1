SELECT MFR_ID, PRODUCT_ID, DESCRIPTION, LEN(DESCRIPTION) AS DescriptionLength

FROM dbo.PRODUCTS

WHERE LEN(DESCRIPTION) = (SELECT MAX(LEN(DESCRIPTION)) FROM dbo.PRODUCTS); --Рахує довжину текстового поля DESCRIPTION

SELECT DISTINCT 
    CONCAT_WS(' ', RTRIM(MFR_ID), RTRIM(PRODUCT_ID), RTRIM(DESCRIPTION)) AS ConcatenatedString,
    LEN(CONCAT_WS(' ', RTRIM(MFR_ID), RTRIM(PRODUCT_ID), RTRIM(DESCRIPTION))) AS StringLength

FROM dbo.PRODUCTS

WHERE PRODUCT_ID NOT LIKE '%[^0-9]%' --Перевіряє, чи ідентифікатор складається лише з цифр (символи поза діапазоном 0-9 відсутні)

ORDER BY StringLength DESC; --Сортує результати за довжиною рядка у спадному порядкур

SELECT CUST_NUM, 
       CONCAT(LEFT(COMPANY, 2), REPLICATE('*', LEN(COMPANY) - 4), RIGHT(COMPANY, 2)) AS AnonymizedName,
       CREDIT_LIMIT

FROM dbo.CUSTOMERS
WHERE CREDIT_LIMIT = (SELECT MIN(CREDIT_LIMIT) FROM dbo.CUSTOMERS);
