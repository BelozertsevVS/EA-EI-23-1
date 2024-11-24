Use WebStor;
/*Використала базу даних WebStore*/

/*Завдання 1
Написала запит, який поверне список унікальних ідентифікаторів виробників.*/
SELECT DISTINCT MFR AS ManufacturerID
FROM ORDERS
WHERE AMOUNT % 2 = 0 -- Парна сума замовлення
  AND QTY % 2 <> 0 -- Непарна кількість одиниць
ORDER BY ManufacturerID;

/*Завдання 2
Написала запит, який у розрізі ідентифікатора виробника товару поверне загальну вартість од. товару на складі та середню вартість од. товарів.*/
SELECT 
    MFR_ID AS ManufacturerID, -- Ідентифікатор виробника
    ROUND(SUM(QTY_ON_HAND * PRICE), 2) AS TotalStockValue, -- Загальна вартість товарів на складі
    ROUND(AVG(PRICE), 2) AS AverageUnitPrice -- Середня вартість одиниці товару
FROM PRODUCTS
GROUP BY MFR_ID -- Групування за ідентифікатором виробника
ORDER BY ManufacturerID; -- Сортування за ідентифікатором виробника

/*Завдання 3
Написала запит, який поверне працівника з найбільшою мат. різницею між  ціллю за продажами і сумою поточних продаж, у абсолютному вимірі, тобто необхідно взяти число за модулем. */
WITH SalesDifferenceCTE AS (
    SELECT 
        EMPL_NUM AS EmployeeID, -- Ідентифікатор працівника
        ABS(QUOTA - SALES) AS SalesDifference, -- Абсолютна різниця між квотою і продажами
        ROUND(DATEDIFF(YEAR, HIRE_DATE, GETDATE()), 2) AS YearsSinceHire -- Кількість років з моменту найму
    FROM SALESREPS
)
SELECT 
    EmployeeID, 
    SalesDifference, 
    YearsSinceHire
FROM SalesDifferenceCTE
WHERE SalesDifference = (SELECT MAX(SalesDifference) FROM SalesDifferenceCTE);
