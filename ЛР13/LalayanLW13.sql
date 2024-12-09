--- Завдання 1: Список унікальних ідентифікаторів виробників товарів (MFR) ---
SELECT DISTINCT O.MFR            -- Вибираємо унікальні ідентифікатори виробників (MFR) з таблиці PRODUCTS
FROM CUSTOMERS C                 -- З таблиці CUSTOMERS
INNER JOIN ORDERS O               -- З таблиці ORDERS
ON C.CUST_NUM = O.CUST            -- З'єднуємо за колонкою CUST (ідентифікатор клієнта) у таблицях CUSTOMERS та ORDERS
INNER JOIN PRODUCTS P             -- З таблиці PRODUCTS
ON O.PRODUCT = P.PRODUCT_ID        -- З'єднуємо за колонкою PRODUCT_ID (ідентифікатор продукту) у таблицях ORDERS та PRODUCTS
WHERE O.ORDER_DATE BETWEEN '2008-01-01' AND '2008-12-31'   -- Фільтруємо замовлення, що були здійснені з 1 січня 2008 по 31 грудня 2008
  AND C.COMPANY LIKE '%CORP%';     -- Використовуємо LIKE для фільтрації клієнтів, у назві яких є слово 'CORP'

 --- Завдання 2: Кількість унікальних замовлень за клієнтом та місяцем ---
 SELECT 
    C.CUST_NUM,  -- Ідентифікатор клієнта
    MONTH(O.ORDER_DATE) AS ORDER_MONTH,  -- Отримуємо номер місяця з дати замовлення
    COUNT(DISTINCT O.ORDER_NUM) AS UNIQUE_ORDERS  -- Обчислюємо кількість унікальних замовлень
FROM CUSTOMERS C
LEFT JOIN ORDERS O ON C.CUST_NUM = O.CUST  -- З'єднуємо замовлення з клієнтами через колонку "CUST"
WHERE (O.ORDER_DATE BETWEEN '2008-01-01' AND '2008-12-31' OR O.ORDER_DATE IS NULL)  -- Фільтрація за датою
  AND C.COMPANY LIKE '%CORP%'  -- Фільтрація за назвою компанії
GROUP BY C.CUST_NUM, MONTH(O.ORDER_DATE)  -- Групуємо результати за клієнтом та місяцем
ORDER BY UNIQUE_ORDERS DESC;  -- Відсортувати за кількістю замовлень у спадному порядку

--- Завдання 3: Список придбаних товарів ---
	SELECT 
    O.ORDER_NUM,           -- Номер замовлення
    O.ORDER_DATE,          -- Дата замовлення
    O.CUST,                -- Ідентифікатор клієнта
    O.REP,                 -- Ідентифікатор представника
    P.MFR_ID,              -- Ідентифікатор виробника з таблиці PRODUCTS
    P.DESCRIPTION,         -- Опис продукту
    O.QTY,                 -- Кількість одиниць
    P.PRICE,               -- Вартість одиниці продукту
    O.AMOUNT               -- Загальна сума замовлення
FROM 
    ORDERS O
LEFT JOIN 
    PRODUCTS P ON O.PRODUCT = P.PRODUCT_ID  -- З'єднання за PRODUCT_ID
