/*Використовую базу даних WebStor*/
Use WebStor;

SELECT * FROM dbo.OFFICES

/*Задача 1
Написала запит, який поверне список офісів східного регіону з ціллю по продажах менше або рівної 350000.00.*/
SELECT OFFICE, CITY, MGR
FROM [dbo].[OFFICES]
WHERE REGION = 'East' AND TARGET <= 350000.00;

/*Задача 2.1
Написала запит, що повертає список замовлень, які були проведені не в 2008 році.*/
  SELECT *
FROM dbo.ORDERS
WHERE ORDER_DATE NOT BETWEEN '20080101' AND '20081231'
  AND (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%');

 /*Задача 2.2
 Написала запит, що повертає загальну суму проведених замовлень по ідент. виробника товарів (MFR),
які були проведені не в 2008 році.*/
 SELECT MFR, COUNT(DISTINCT ORDER_NUM) AS TotalOrders, SUM(AMOUNT) AS TotalAmount
FROM dbo.ORDERS
WHERE ORDER_DATE NOT BETWEEN '20080101' AND '20081231'
  AND (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%')
GROUP BY MFR
ORDER BY TotalAmount ASC;

/*Задача 2.3
Написала запит, що повертає ідент. виробника з найбільшою загальною сумою проведених замовлень.*/
SELECT TOP 1 WITH TIES MFR, SUM(AMOUNT) AS TotalAmount
FROM dbo.ORDERS
WHERE ORDER_DATE NOT BETWEEN '20080101' AND '20081231'
  AND (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%')
GROUP BY MFR
ORDER BY TotalAmount DESC;

/*Задача 3
Напишіть запит, який поверне ідент. офісу з найбільшою кількістю працівників.*/
SELECT TOP 1 WITH TIES [REP_OFFICE], COUNT([EMPL_NUM]) AS EmployeeCount 
FROM dbo.SALESREPS 
WHERE [TITLE]= 'Sales Rep' AND Age IN (29, 45, 48) 
GROUP BY [REP_OFFICE]
ORDER BY EmployeeCount DESC;