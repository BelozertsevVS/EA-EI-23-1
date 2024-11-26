-- Завдання 1 

-- Створення таблиці OFFICES
CREATE TABLE dbo.OFFICES (
    OfficeID INT PRIMARY KEY,
    City NVARCHAR(100),
    ManagerID INT,
    Region NVARCHAR(50),
    TargetSales DECIMAL(18, 2)
);

-- Додавання тестових даних
INSERT INTO dbo.OFFICES (OfficeID, City, ManagerID, Region, TargetSales)
VALUES 
(1, 'Kyiv', 101, 'East', 300000.00),
(2, 'Lviv', 102, 'West', 400000.00),
(3, 'Odessa', 103, 'East', 350000.00);


SELECT OfficeID, City, ManagerID -- Обираємо необхідні колонки: ідентифікатор офісу, місто, менеджера
FROM [dbo].[OFFICES]             -- Джерело даних - таблиця OFFICES
WHERE Region = 'East'            -- Фільтруємо лише офіси східного регіону
  AND TargetSales <= 350000.00;  -- Додаємо умову: ціль продажів менше або дорівнює 350000

  -- Завдання 2.1

  -- Створення таблиці ORDERS
CREATE TABLE dbo.ORDERS (
OrderID INT PRIMARY KEY,
OrderYear INT,
ProductID NVARCHAR(50),
MFR NVARCHAR(50),
TotalAmount DECIMAL(18, 2)
);

-- Додавання тестових даних
INSERT INTO dbo.ORDERS (OrderID, OrderYear, ProductID, MFR, TotalAmount)
VALUES
(1, 2007, 'A001', 'MFR1', 500.00),
(2, 2008, 'B0A2', 'MFR2', 1000.00),
(3, 2009, 'C00B', 'MFR1', 1500.00),
(4, 2007, 'A0C3', 'MFR3', 2000.00);


SELECT *                               -- Вибираємо всі колонки з таблиці ORDERS
FROM [dbo].[ORDERS]                    -- Джерело даних - таблиця ORDERS
WHERE OrderYear NOT BETWEEN 2008 AND 2008 -- Виключаємо замовлення за 2008 рік
  AND (ProductID LIKE '_A%'            -- Знаходимо товари, де другий символ - A
       OR ProductID LIKE '%0%');       -- Або товари, які мають 0 в будь-якому місці

-- Завдання 2.2

SELECT MFR,                              -- Вибираємо виробника товару
       COUNT(DISTINCT OrderID) AS UniqueOrders, -- Підраховуємо унікальні замовлення
       SUM(TotalAmount) AS TotalSum      -- Рахуємо загальну суму замовлень
FROM [dbo].[ORDERS]                      -- Джерело даних - таблиця ORDERS
WHERE OrderYear NOT BETWEEN 2008 AND 2008 -- Виключаємо замовлення за 2008 рік
  AND (ProductID LIKE '_A%'              -- Товари, де другий символ - A
       OR ProductID LIKE '%0%')          -- Або товари, які мають 0 в будь-якому місці
GROUP BY MFR                             -- Групуємо дані за виробниками товарів
ORDER BY TotalSum ASC;                   -- Сортуємо за зростанням загальної суми

-- Завдання 2.3

-- Створення CTE (Common Table Expression)
;WITH CTE_Sample AS (
    -- Групування даних за виробником та обчислення загальної суми замовлень
    SELECT 
        MFR, -- Ідентифікатор виробника
        SUM(TotalAmount) AS TotalSum -- Загальна сума замовлень для кожного виробника
    FROM dbo.ORDERS -- Таблиця замовлень
    WHERE 
        -- Фільтр за роками: виключення замовлень, зроблених у 2008 році
        OrderYear NOT BETWEEN 2008 AND 2008
        AND 
        -- Фільтр за ідентифікатором товару:
        -- Другий символ має бути 'A', або будь-де має бути символ '0'
        (ProductID LIKE '_A%' OR ProductID LIKE '%0%')
    GROUP BY 
        MFR -- Групування за виробником
)
-- Вибірка виробників із найбільшою загальною сумою замовлень
SELECT TOP 1 WITH TIES 
    MFR, -- Ідентифікатор виробника
    TotalSum -- Загальна сума замовлень для цього виробника
FROM 
    CTE_Sample -- Посилання на раніше створений CTE
ORDER BY 
    TotalSum DESC; -- Сортування за зменшенням суми замовлень


-- Завдання 3

-- Створення таблиці SALESREPS
CREATE TABLE dbo.SALESREPS (
    SalesRepID INT PRIMARY KEY,  -- Ідентифікатор працівника (унікальний)
    FirstName VARCHAR(50),  -- Ім'я працівника
    LastName VARCHAR(50),  -- Прізвище працівника
    JobTitle VARCHAR(50),  -- Посада
    Age INT,  -- Вік
    OfficeID INT  -- Ідентифікатор офісу
);

-- Додавання даних в таблицю SALESREPS
INSERT INTO dbo.SALESREPS (SalesRepID, FirstName, LastName, JobTitle, Age, OfficeID)
VALUES
(1, 'John', 'Doe', 'Sales Rep', 29, 101),  -- Працівник 1
(2, 'Jane', 'Smith', 'Sales Rep', 45, 102),  -- Працівник 2
(3, 'Alice', 'Johnson', 'Sales Rep', 48, 101),  -- Працівник 3
(4, 'Bob', 'Brown', 'Sales Rep', 29, 103),  -- Працівник 4
(5, 'Charlie', 'Davis', 'Sales Rep', 45, 101),  -- Працівник 5
(6, 'David', 'Miller', 'Sales Rep', 48, 103);  -- Працівник 6


-- Обов'язково поставте крапку з комою перед CTE
;WITH CTE_SalesRep AS (
    SELECT 
        OfficeID,  -- Ідентифікатор офісу
        COUNT(*) AS EmployeeCount  -- Кількість працівників в кожному офісі
    FROM dbo.SALESREPS  -- Таблиця працівників
    WHERE 
        JobTitle = 'Sales Rep'  -- Фільтр по посаді
        AND Age IN (29, 45, 48)  -- Вибірка за віком
    GROUP BY OfficeID  -- Групування за ідентифікатором офісу
)
-- Вибірка офісів з найбільшою кількістю працівників
SELECT TOP 1 WITH TIES 
    OfficeID,  -- Ідентифікатор офісу
    EmployeeCount  -- Кількість працівників в офісі
FROM 
    CTE_SalesRep  -- Посилання на CTE
ORDER BY 
    EmployeeCount DESC;  -- Сортування за кількістю працівників (по зменшенню)

