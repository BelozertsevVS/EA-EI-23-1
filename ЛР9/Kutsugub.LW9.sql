-- Задача 1. Запит для отримання продукту з найбільшою довжиною опису --
WITH MaxLength AS (
    SELECT 
        MFR_ID,
        PRODUCT_ID,
        DESCRIPTION,
        LEN(DESCRIPTION) AS DescriptionLength
    FROM dbo.PRODUCTS
),
MaxLengthValue AS (
    SELECT MAX(DescriptionLength) AS MaxLength
    FROM MaxLength
)
SELECT 
    MFR_ID,
    PRODUCT_ID,
    DESCRIPTION,
    DescriptionLength
FROM MaxLength
WHERE DescriptionLength = (SELECT MaxLength FROM MaxLengthValue);

-- Задача 2. Запит для отримання продуктів, ідентифікатор яких містить лише цифри --
SELECT DISTINCT 
    CONCAT_WS(' ', MFR_ID, PRODUCT_ID, RTRIM(DESCRIPTION)) AS ConcatenatedString,
    LEN(CONCAT_WS(' ', MFR_ID, PRODUCT_ID, RTRIM(DESCRIPTION))) AS StringLength
FROM dbo.PRODUCTS
WHERE PRODUCT_ID NOT LIKE '%[^0-9]%'
ORDER BY StringLength DESC;

--Задача 3. Запит для отримання списку клієнтів з найменшим кредитним лімітом --
WITH MinCreditLimit AS (
    SELECT 
        CUST_NUM,
        COMPANY,
        CREDIT_LIMIT
    FROM dbo.CUSTOMERS
    WHERE CREDIT_LIMIT = (SELECT MIN(CREDIT_LIMIT) FROM dbo.CUSTOMERS)
)
SELECT 
    CUST_NUM,
    LEFT(COMPANY, 2) + REPLICATE('*', LEN(COMPANY) - 4) + RIGHT(COMPANY, 2) AS MaskedCompanyName,
    CREDIT_LIMIT
FROM MinCreditLimit;