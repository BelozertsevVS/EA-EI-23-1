-- Створення таблиці SALESREPS
CREATE TABLE [dbo].[SALESREPS] (
    EmployeeID INT PRIMARY KEY,           -- Ідентифікатор працівника
    FirstName NVARCHAR(50),               -- Ім'я працівника
    LastName NVARCHAR(50),                -- Прізвище працівника
    Age INT,                              -- Вік працівника
    Title NVARCHAR(50)                    -- Посада працівника
);

-- Вставка даних у таблицю SALESREPS
INSERT INTO [dbo].[SALESREPS] (EmployeeID, FirstName, LastName, Age, Title) VALUES
(1, 'Ivan', 'Petrenko', 46, 'Manager'),
(2, 'Olha', 'Shevchenko', 50, 'Sales Representative'),
(3, 'Andriy', 'Kovalenko', 30, 'Sales Representative'),
(4, 'Iryna', 'Tkachenko', 48, 'Senior Sales Representative');

-- Створення таблиці ORDERS
CREATE TABLE [dbo].[ORDERS] (
    OrderID INT PRIMARY KEY,              -- Ідентифікатор замовлення
    MFR NVARCHAR(10),                     -- Ідентифікатор виробника
    PRODUCT NVARCHAR(10),                 -- Ідентифікатор товару
    REP INT,                              -- Ідентифікатор працівника, що здійснив замовлення
    OrderDate DATE                        -- Дата замовлення
);

-- Вставка даних у таблицю ORDERS
INSERT INTO [dbo].[ORDERS] (OrderID, MFR, PRODUCT, REP, OrderDate) VALUES
(1, 'M001', 'P001', 1, '2008-01-15'),
(2, 'M002', 'P002', 2, '2008-03-22'),
(3, 'M001', 'P001', 1, '2008-05-12'),
(4, 'M003', 'P003', 3, '2008-07-18'),
(5, 'M001', 'P001', 2, '2009-02-10'),
(6, 'M002', 'P002', 2, '2008-10-05'),
(7, 'M004', 'P004', 4, '2008-11-19');


-- Завдання 1

SELECT EmployeeID,           -- Ідентифікатор працівника
       FirstName,            -- Ім'я працівника
       LastName,             -- Прізвище працівника
       Age,                  -- Вік працівника
       Title                 -- Посада працівника
FROM [dbo].[SALESREPS]       -- Таблиця працівників
WHERE Age > 45               -- Фільтр, щоб вибрати тільки тих працівників, яким більше 45 років
ORDER BY Age DESC;           -- Сортування за віком у порядку спадання (від найстаршого до наймолодшого)

-- Завдання 2

SELECT DISTINCT MFR,         -- Ідентифікатор виробника
                PRODUCT      -- Ідентифікатор товару
FROM [dbo].[ORDERS]          -- Таблиця замовлень
WHERE YEAR(OrderDate) = 2008; -- Фільтр для вибору замовлень, зроблених у 2008 році

-- Завдання 3

SELECT REP,                          -- Ідентифікатор працівника
       COUNT(*) AS OrderCount        -- Кількість замовлень, проведених працівником
FROM [dbo].[ORDERS]                  -- Таблиця замовлень
WHERE YEAR(OrderDate) = 2008         -- Фільтр для вибору замовлень, зроблених у 2008 році
GROUP BY REP                         -- Групування за ідентифікатором працівника
ORDER BY OrderCount DESC             -- Сортування за кількістю замовлень у порядку спадання
OFFSET 0 ROWS                        -- Пропустити 0 рядків (використовується для коректного застосування WITH TIES)
FETCH NEXT 1 ROWS WITH TIES;         -- Повернути рядки з максимальним значенням, включаючи ті, що мають таке ж значення


