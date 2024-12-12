WITH ProductLengths AS (
    SELECT 
        MFR_ID,
        PRODUCT_ID,
        [DESCRIPTION],
        LEN([DESCRIPTION]) AS DescriptionLength
    FROM [dbo].[PRODUCTS]
)
SELECT 
    MFR_ID,
    PRODUCT_ID,
    [DESCRIPTION],
    DescriptionLength
FROM ProductLengths
WHERE DescriptionLength = (SELECT MAX(DescriptionLength) FROM ProductLengths);




WITH NumericProducts AS (
    SELECT 
        MFR_ID,
        PRODUCT_ID,
        [DESCRIPTION],
        RTRIM(CONCAT_WS(' ', MFR_ID, PRODUCT_ID, [DESCRIPTION])) AS ConcatenatedValue,
        LEN(RTRIM(CONCAT_WS(' ', MFR_ID, PRODUCT_ID, [DESCRIPTION]))) AS ConcatenatedLength
    FROM [dbo].[PRODUCTS]
    WHERE PRODUCT_ID NOT LIKE '%[^0-9]%' -- Перевірка, що PRODUCT_ID складається лише з цифр
)
SELECT DISTINCT
    ConcatenatedValue,
    ConcatenatedLength
FROM NumericProducts
ORDER BY ConcatenatedLength DESC;






WITH MinCreditLimit AS (
    SELECT MIN(CREDIT_LIMIT) AS MinLimit FROM [dbo].[CUSTOMERS]
),
FilteredCustomers AS (
    SELECT 
        CUST_NUM AS CUSTOMER_ID,
        COMPANY AS CUSTOMER_NAME,
        CREDIT_LIMIT
    FROM [dbo].[CUSTOMERS]
    WHERE CREDIT_LIMIT = (SELECT MinLimit FROM MinCreditLimit)
)
SELECT 
    CUSTOMER_ID,
    CONCAT(
        LEFT(CUSTOMER_NAME, 2), 
        REPLICATE('*', LEN(CUSTOMER_NAME) - 4), 
        RIGHT(CUSTOMER_NAME, 2)
    ) AS ObfuscatedName,
    CREDIT_LIMIT
FROM FilteredCustomers;
