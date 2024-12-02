-- Задача 1. Вивести дані про продукт з найбільшою довжиною опису.
-- Використовується строкова функція LEN для підрахунку кількості символів в описі.
-- Повертаються стовпці: ідентифікатор виробника (MFR_ID), ідентифікатор продукту (PRODUCT_ID), 
-- опис продукту (DESCRIPTION) та довжина опису (DescriptionLength).
SELECT TOP 1 WITH TIES
    MFR_ID, 
    PRODUCT_ID, 
    DESCRIPTION, 
    LEN(DESCRIPTION) AS DescriptionLength  -- Підрахунок довжини опису
FROM 
    dbo.PRODUCTS
ORDER BY 
    LEN(DESCRIPTION) DESC;  -- Сортування за довжиною опису у порядку спадання для отримання найдовших описів


-- Задача 2. Вивести дані продуктів, ідентифікатор яких складається лише з цифр.
-- Виконується конкатенація значень MFR_ID, PRODUCT_ID та DESCRIPTION через один пробіл.
-- Підраховується довжина сконкатенованого рядка без дублюючих рядків, сортування за зменшенням.
SELECT DISTINCT 
    CONCAT_WS(' ', RTRIM(MFR_ID), RTRIM(PRODUCT_ID), RTRIM(DESCRIPTION)) AS ConcatenatedString,  -- Конкатенація стовпців з пробілом
    LEN(CONCAT_WS(' ', RTRIM(MFR_ID), RTRIM(PRODUCT_ID), RTRIM(DESCRIPTION))) AS ConcatenatedLength  -- Підрахунок довжини сконкатенованого рядка
FROM 
    dbo.PRODUCTS
WHERE 
    PRODUCT_ID NOT LIKE '%[^0-9]%'  -- Перевірка, що PRODUCT_ID містить лише цифри
ORDER BY 
    ConcatenatedLength DESC;  -- Сортування за довжиною сконкатенованого рядка у порядку спадання


-- Задача 3. Вивести список клієнтів з найменшим кредитним лімітом.
-- Виконується маскування назви клієнта з відображенням лише перших двох і останніх двох символів.
-- Повертаються стовпці: ідентифікатор клієнта (CustomerID), назва клієнта (MaskedName), кредитний ліміт (CreditLimit).
SELECT TOP 1 WITH TIES 
    CustomerID, 
    CONCAT(LEFT(CustomerName, 2), REPLICATE('*', LEN(CustomerName) - 4), RIGHT(CustomerName, 2)) AS MaskedName,  -- Маскування назви клієнта
    CreditLimit
FROM 
    dbo.CUSTOMERS
ORDER BY 
    CreditLimit ASC;  -- Сортування за кредитним лімітом у порядку зростання для отримання найменшого кредитного ліміту
