USE WebStor;
/*Використала базу даних WebStore*/

SELECT 
    [EMPL_NUM] AS EmployeeID, 
    [NAME] AS EmployeeName, 
    [AGE], 
    [TITLE] AS Position
FROM 
    [WebStor].[dbo].[SALESREPS]
WHERE 
    [AGE] > 45
ORDER BY 
    [AGE] DESC;
/*Написала запит, який поверне список працівників старше 45 років.
Відсортирувала результуючий набір даних за віком (за спаданням)*/

SELECT DISTINCT 
    MFR, 
    PRODUCT
FROM 
    [dbo].[ORDERS]
WHERE 
    YEAR(Order_Date) = 2008;
/*Написала запит, який поверне список унікальних комбінацій значень ідентифікатора виробника (MFR) та ідентифікатора товару (PRODUCT), враховуючи тільки
замовлення за 2008 рік.*/


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
    OrderCount DESC;
/*Написала запит, який поверне ідентифікатор працівника ([REP]) з найбільшою кількістю проведених замовлень.*/