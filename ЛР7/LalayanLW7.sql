
-- Завдання 1. Запит, який повертає список працівників старше 45 років, відсортованих за віком у порядку спадання --
SELECT 
    EmployeeID, 
    EmployeeName, 
    Age, 
    Position 
FROM 
    SALESREPS
WHERE 
    Age > 45 
ORDER BY 
    Age DESC;

-- Завдання 2. Запит для отримання унікальних комбінацій ідентифікатора виробника та ідентифікатора товару за замовленнями 2008 року --
SELECT DISTINCT 
    MFR, 
    PRODUCT 
FROM 
    ORDERS
WHERE 
    YEAR(OrderDate) = 2008;

-- Завдання 3. Запит для отримання ідентифікатора працівника з найбільшою кількістю проведених замовлень, з можливістю врахування кількох працівників з однаковими результатами --
SELECT TOP 1 WITH TIES 
    REP, 
    COUNT(*) AS OrderCount 
FROM 
    ORDERS 
WHERE 
    YEAR(OrderDate) = 2008 
GROUP BY 
    REP 
ORDER BY 
    OrderCount DESC;
