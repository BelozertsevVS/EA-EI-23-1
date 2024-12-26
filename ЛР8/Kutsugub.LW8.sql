--Задача 1. Вивести список офісів східного регіону з ціллю по продажах меншою або рівною 350000.00 --
SELECT OFFICE, CITY, MGR
FROM dbo.OFFICES
WHERE REGION = 'Eastern' AND TARGET <= 350000.00;

  -- Задача 2.1. Список замовлень, проведених не в 2008 році, на товари з ідентифікатором, що містить "A" другим символом або "0" в будь-якому місці --
SELECT *
FROM dbo.ORDERS
WHERE ORDER_DATE NOT BETWEEN '2008-01-01' AND '2008-12-31'
  AND (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%');

  -- Задача 2.2. Загальна сума замовлень за ідентифікатором виробника товарів, проведених не в 2008 році, з умовами для ідентифікатора товару --
  SELECT MFR, COUNT(DISTINCT ORDER_NUM) AS TotalOrders, SUM(AMOUNT) AS TotalAmount
FROM dbo.ORDERS
WHERE ORDER_DATE NOT BETWEEN '2008-01-01' AND '2008-12-31'
  AND (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%')
GROUP BY MFR
ORDER BY TotalAmount ASC;

-- Задача 2.3. Ідентифікатор виробника з найбільшою загальною сумою замовлень за умовами для дати та ідентифікатора товару --
SELECT TOP 1 WITH TIES MFR, SUM(AMOUNT) AS TotalAmount
FROM dbo.ORDERS
WHERE ORDER_DATE NOT BETWEEN '2008-01-01' AND '2008-12-31'
  AND (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%')
GROUP BY MFR
ORDER BY TotalAmount DESC;

-- Задача 3. Ідентифікатор офісу з найбільшою кількістю працівників на посаді "Sales Rep" віком 29, 45, або 48 років --
SELECT TOP 1 WITH TIES [REP_OFFICE], COUNT([EMPL_NUM]) AS EmployeeCount 
FROM dbo.SALESREPS 
WHERE [TITLE]= 'Sales Rep' AND Age IN (29, 45, 48) 
GROUP BY [REP_OFFICE]
ORDER BY EmployeeCount DESC;