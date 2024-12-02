-- Задача 1
-- Запит повертає список унікальних ідентифікаторів виробників, які відповідають умовам:

SELECT DISTINCT MFR AS ManufacturerID
FROM ORDERS
WHERE 
    (TotalAmount % 2 = 0)  -- парна сума
    AND (OrderID % 2 != 0)  -- непарна кількість одиниць
ORDER BY ManufacturerID;



-- Задача 2
-- Запит повертає загальну та середню вартість одиниць товарів у розрізі ідентифікаторів виробників,
-- округлених до 2 знаків:

SELECT 
    MFR AS ManufacturerID,
    ROUND(SUM(Quantity * Price), 2) AS TotalValue,  -- Загальна вартість товару
    ROUND(AVG(Price), 2) AS AveragePrice           -- Середня ціна товару
FROM PRODUCTS
GROUP BY MFR
ORDER BY MFR;


-- Задача 3
-- Запит визначає працівника з найбільшою абсолютною різницею між ціллю за продажами,
--і сумою поточних продаж, а також обчислює кількість років працівника на момент найму:

SELECT TOP 1 
    SalesRepID,
    ROUND(ABS(SalesTarget - CurrentSales), 2) AS SalesDifference,  -- Абсолютна різниця
    DATEDIFF(YEAR, HireDate, GETDATE()) AS YearsAtCompany  -- Кількість років у компанії
FROM SALESREPS
ORDER BY SalesDifference DESC;


