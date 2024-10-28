/* Список працівників старше 45 років з таблиці [dbo].[SALESREPS], відсортованих за віком у порядку спадання: */

SELECT 
    [NAME],  -- Ім'я працівника
    [AGE],           -- Вік
    [HIRE_DATE]    -- Дата взяття 
FROM 
    [dbo].[SALESREPS]
WHERE 
    Age > 45
ORDER BY 
    Age DESC;

/* Запит для отримання унікальних комбінацій ідентифікатора виробника (MFR) та ідентифікатора товару (PRODUCT) за замовленнями 2008 року з таблиці [dbo].[ORDERS]: */

SELECT DISTINCT 
    MFR,           -- Ідентифікатор виробника
    PRODUCT        -- Ідентифікатор товару
FROM 
    [dbo].[ORDERS]
WHERE 
    YEAR(OrderDate) = 2008;


/* Запит, який повертає ідентифікатор працівника з найбільшою кількістю проведених замовлень за 2008 рік, з урахуванням можливості однакової кількості замовлень у кількох працівників: */


SELECT TOP 1 WITH TIES 
    REP AS EmployeeID,          -- Ідентифікатор працівника
    COUNT(*) AS OrderCount       -- Кількість проведених замовлень
FROM 
    [dbo].[ORDERS]
WHERE 
    YEAR(OrderDate) = 2008
GROUP BY 
    REP
ORDER BY 
    COUNT(*) DESC;


