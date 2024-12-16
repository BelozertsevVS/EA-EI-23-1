SELECT *
FROM [dbo].[SALESREPS];

-- Вибираємо працівників старше 45 років із таблиці [dbo].[SALESREPS]
SELECT 
    EMPL_NUM AS EmployeeID,      -- Ідентифікатор працівника
    NAME AS EmployeeName,        -- Ім'я працівника
    AGE,                         -- Вік працівника
    TITLE AS Position            -- Посада працівника
FROM 
    [dbo].[SALESREPS]
WHERE 
    AGE > 45                     -- Фільтруємо тільки працівників, старших за 45 років
ORDER BY 
    AGE DESC;                    -- Сортуємо результат за віком у порядку спадання

SELECT DISTINCT 
    MFR,                        
    PRODUCT                     
FROM 
    [dbo].[ORDERS]
WHERE 
    YEAR(Order_Date) = 2008;     

-- Отримуємо працівника(-ів) із найбільшою кількістю замовлень за 2008 рік
SELECT TOP 1 WITH TIES 
    REP,                         
    COUNT(*) AS OrderCount       
FROM 
    [dbo].[ORDERS]
WHERE 
    YEAR(Order_Date) = 2008      
GROUP BY 
    REP                          
ORDER BY 
    COUNT(*) DESC;               -- Сортуємо за кількістю замовлень у порядку спадання
