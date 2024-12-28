-- Завдання 1
SELECT DISTINCT O.MFR                               -- Унікальні виробники
FROM dbo.ORDERS O
INNER JOIN dbo.CUSTOMERS C                          -- З'єднання замовлень із клієнтами
    ON O.CUST = C.CUST_NUM                          -- З'єднання за ідентифікатором клієнта
WHERE O.ORDER_DATE BETWEEN '20080101' AND '20081231'-- Замовлення за 2008 рік
  AND C.COMPANY LIKE '%CORP%';                      -- Назва компанії містить "CORP"

-- Завдання 2
SELECT 
    C.CUST_NUM,                                      -- Ідентифікатор клієнта
    MONTH(O.ORDER_DATE) AS ORDER_MONTH,             -- Місяць замовлення
    COUNT(DISTINCT O.ORDER_NUM) AS UNIQUE_ORDERS    -- Кількість унікальних замовлень
FROM dbo.CUSTOMERS C
LEFT JOIN dbo.ORDERS O                              -- З'єднання всіх клієнтів із замовленнями
    ON C.CUST_NUM = O.CUST                          -- З'єднання за клієнтом
    AND O.ORDER_DATE BETWEEN '20080101' AND '20081231'-- Замовлення у 2008 році
WHERE C.COMPANY LIKE '%CORP%'                       -- Фільтрація компаній, що містять "CORP"
GROUP BY C.CUST_NUM, MONTH(O.ORDER_DATE)            -- Групування за клієнтом та місяцем
ORDER BY UNIQUE_ORDERS DESC;                        -- Сортування за кількістю замовлень у спадаючому порядку

-- Завдання 3
SELECT DISTINCT 
    C.CUST_NUM,                                  -- Ідентифікатор клієнта
    UPPER(C.COMPANY) AS COMPANY_NAME,           -- Назва компанії у верхньому регістрі
    P.DESCRIPTION                               -- Опис продукту
FROM dbo.CUSTOMERS C
LEFT JOIN dbo.ORDERS O                          -- З'єднання клієнтів із замовленнями
    ON C.CUST_NUM = O.CUST                      -- З'єднання за клієнтом
    AND O.ORDER_DATE BETWEEN '20080101' AND '20081231'-- Замовлення за 2008 рік
LEFT JOIN dbo.PRODUCTS P                        -- З'єднання із продуктами
    ON O.MFR = P.MFR_ID                         -- Зв'язок між виробником замовлення та продуктом
    AND O.PRODUCT = P.PRODUCT_ID                -- Зв'язок між замовленням та продуктом
WHERE C.COMPANY LIKE '%CORP%';                  -- Фільтрація клієнтів із "CORP" у назві
