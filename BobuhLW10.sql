SELECT DISTINCT [MFR]
FROM [dbo].[ORDERS]
WHERE  [AMOUNT] % 2 = 0
  AND  [QTY] % 2 <> 0   
ORDER BY [MFR];

SELECT 
    MFR_ID,
    CAST(SUM(QTY_ON_HAND * PRICE) AS DECIMAL(10, 2)) AS TotalStockValue,  
    CAST(AVG(PRICE) AS DECIMAL(10, 2)) AS AverageUnitPrice                
FROM [dbo].[PRODUCTS]
GROUP BY MFR_ID
ORDER BY MFR_ID;


SELECT TOP 1 WITH TIES
    EMPL_NUM,
    NAME,
    ABS(QUOTA - SALES) AS SalesDifference,  
    AGE AS YearsAtHire                      
FROM [dbo].[SALESREPS]
ORDER BY ABS(QUOTA - SALES) DESC;