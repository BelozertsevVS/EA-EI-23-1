
SELECT 
    OFFICE,  -- Ідентифікатор офісу
    City,    -- Назва міста, де розташований офіс
    MGR      -- Ідентифікатор менеджера офісу
FROM 
    [dbo].[OFFICES]  
WHERE 
    Region = 'Eastern'  -- Умова(регіон має бути "Eastern")
    AND Target <= 350000;  -- Умова(ціль продажів не більше 350000)


SELECT 
    *  
FROM 
    dbo.ORDERS  
WHERE 
    Order_Date NOT BETWEEN '20080101' AND '20081231'  
    AND 
    (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%');  -- Умова: "A" другим символом або "0" будь-де в коді товару


SELECT 
    MFR,  
    COUNT(DISTINCT ORDER_NUM) AS Unique_Orders,  -- Кількість унікальних замовлень
    SUM(AMOUNT) AS Total_Sum  -- Загальна сума замовлень
FROM 
    dbo.ORDERS  
WHERE 
    Order_Date NOT BETWEEN '20080101' AND '20081231'  
    AND 
    (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%')  
GROUP BY 
    MFR  
ORDER BY 
    Total_Sum ASC;  


SELECT TOP 1 WITH TIES 
    MFR,  
    SUM(AMOUNT) AS Total_Sum  
FROM 
    dbo.ORDERS  
WHERE 
    Order_Date NOT BETWEEN '20080101' AND '20081231'  -- Замовлення не в 2008 році
    AND 
    (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%')  -- Умови для ідентифікатора товару
GROUP BY 
    MFR  
ORDER BY 
    Total_Sum DESC;  


SELECT TOP 1 WITH TIES 
    [REP_OFFICE],  
    COUNT(*) AS Employee_Count  -- Кількість працівників у цьому офісі
FROM 
    dbo.SALESREPS 
WHERE 
    TITLE = 'Sales Rep'  
    AND AGE IN (29, 45, 48)  -- Вік працівників(29, 45 або 48 років)
GROUP BY 
    [REP_OFFICE]  
ORDER BY 
    Employee_Count DESC;  -- Сортування за кількістю працівників 
