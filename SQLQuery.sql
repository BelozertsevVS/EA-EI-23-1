
/* Знайти продукт із найдовшим описом, враховуючи можливість, що декілька товарів можуть мати однакову довжину опису. */

SELECT 
    MFR_ID, 
    PRODUCT_ID, 
    DESCRIPTION, 
    LEN(DESCRIPTION) AS DescriptionLength
FROM 
    [dbo].[PRODUCTS]
WHERE 
    LEN(DESCRIPTION) = (
        SELECT MAX(LEN(DESCRIPTION)) 
        FROM [dbo].[PRODUCTS]
    );

/* Вивести дані продуктів, ідентифікатори яких містять лише цифри, з конкатенацією та видаленням дубльованих рядків. */

SELECT DISTINCT
    CONCAT_WS(' ', RTRIM(MFR_ID), RTRIM(PRODUCT_ID), RTRIM([DESCRIPTION])) AS ConcatenatedText,
    LEN(CONCAT_WS(' ', RTRIM(MFR_ID), RTRIM(PRODUCT_ID), RTRIM([DESCRIPTION]))) AS TextLength
FROM 
    [dbo].[PRODUCTS]
WHERE 
    PRODUCT_ID NOT LIKE '%[^0-9]%'  -- Лише числові ідентифікатори
ORDER BY 
    TextLength DESC;



/* Вивести список клієнтів із найменшим кредитним лімітом, при цьому назва клієнта повинна відображатися з двома буквами на початку і в кінці, а інші літери замінено на *. */

SELECT 
    [CUST_NUM], 
    LEFT([CUST_NUM], 2) + REPLICATE('*', LEN([CUST_NUM]) - 4) + RIGHT([CUST_NUM], 2) AS MaskedCustomerName,
    CREDIT_LIMIT
FROM 
    [dbo].[CUSTOMERS]
WHERE 
    CREDIT_LIMIT = (
        SELECT MIN(CREDIT_LIMIT) 
        FROM [dbo].[CUSTOMERS]
    );




