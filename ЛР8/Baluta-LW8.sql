﻿SELECT OFFICE, City, MGR
FROM [dbo].[OFFICES]
WHERE Region = 'Eastern' AND Target <= 350000;

SELECT 
    *  
FROM 
    dbo.ORDERS  
WHERE 
    Order_Date NOT BETWEEN '20080101' AND '20081231'  
    AND 
    (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%');  

SELECT 
    MFR,  
    COUNT(DISTINCT ORDER_NUM) AS Unique_Orders,  
    SUM(AMOUNT) AS Total_Sum  
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
    Order_Date NOT BETWEEN '20080101' AND '20081231'  
    AND 
    (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%')  
GROUP BY 
    MFR  
ORDER BY 
    Total_Sum DESC;  

SELECT TOP 1 WITH TIES 
    [REP_OFFICE],  
    COUNT(*) AS Employee_Count  
FROM 
    dbo.SALESREPS 
WHERE 
    TITLE = 'Sales Rep'  
    AND AGE IN (29, 45, 48)  
GROUP BY 
    [REP_OFFICE]  
ORDER BY 
    Employee_Count DESC; 