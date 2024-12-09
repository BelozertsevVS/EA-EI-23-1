SELECT DISTINCT MFR AS ManufacturerID 
FROM ORDERS
WHERE AMOUNT % 2 = 0 
  AND QTY % 2 <> 0 
ORDER BY ManufacturerID; -- Сортування за ідентифікатором виробника

SELECT 
    MFR_ID AS ManufacturerID,
    ROUND(SUM(QTY_ON_HAND * PRICE), 2) AS TotalStockValue,
    ROUND(AVG(PRICE), 2) AS AverageUnitPrice
FROM PRODUCTS
WHERE QTY_ON_HAND > 0 -- Враховувати тільки товари, які є на складі
GROUP BY MFR_ID 
ORDER BY ManufacturerID;

WITH SalesDifferenceCTE AS (
    SELECT 
        EMPL_NUM AS EmployeeID, 
        ABS(QUOTA - SALES) AS SalesDifference, 
        ROUND(DATEDIFF(YEAR, HIRE_DATE, GETDATE()), 1) AS YearsSinceHire 
    FROM SALESREPS
    WHERE SALES IS NOT NULL AND QUOTA IS NOT NULL -- Виключити записи з відсутніми даними
)
SELECT 
    EmployeeID, 
    SalesDifference, 
    YearsSinceHire
FROM SalesDifferenceCTE
WHERE SalesDifference = (SELECT MAX(SalesDifference) FROM SalesDifferenceCTE); -- Вибір максимального значення різниці