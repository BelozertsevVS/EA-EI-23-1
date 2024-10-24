-- Створення таблиці "SALESREPS" -- 
CREATE TABLE SALESREPS (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1), -- Ідентифікатор працівника
    EmployeeName NVARCHAR(100),               -- Ім'я працівника
    Age INT,                                  -- Вік
    Position NVARCHAR(50)                     -- Посада
);

-- Заповнення таблиці даними --
INSERT INTO SALESREPS (EmployeeName, Age, Position)
VALUES 
('John Smith', 48, 'Senior Sales Representative'),
('Anna Johnson', 42, 'Sales Representative'),
('Michael Brown', 55, 'Regional Manager'),
('Emily Davis', 50, 'Sales Consultant'),
('David Wilson', 37, 'Junior Sales Representative'),
('Sophia Taylor', 45, 'Sales Representative'),
('James Anderson', 60, 'Director of Sales'),
('Isabella Thomas', 29, 'Sales Intern'),
('Liam White', 52, 'Senior Sales Manager'),
('Olivia Harris', 47, 'Product Specialist'),
('William Martin', 34, 'Sales Associate'),
('Mia Lee', 41, 'Sales Manager'),
('Benjamin Clark', 33, 'Junior Sales Representative'),
('Lucas Lewis', 51, 'Sales Consultant'),
('Ethan Walker', 43, 'Area Sales Manager'),
('Charlotte Hall', 36, 'Sales Representative'),
('Mason Young', 38, 'Sales Executive'),
('Amelia King', 32, 'Junior Sales Manager'),
('Jacob Wright', 54, 'Key Account Manager'),
('Ella Scott', 46, 'Sales Representative'),
('Alexander Baker', 31, 'Trainee Sales Representative');

-- Створення таблиці "ORDERS" --
CREATE TABLE ORDERS (
    OrderID INT PRIMARY KEY IDENTITY(1,1),   -- Ідентифікатор замовлення
    OrderDate DATE,                          -- Дата замовлення
    MFR NVARCHAR(50),                        -- Ідентифікатор виробника
    PRODUCT NVARCHAR(50),                    -- Ідентифікатор товару
    REP INT,                                 -- Ідентифікатор працівника (співвідношення з SALESREPS)
    Quantity INT                             -- Кількість товару
);

-- Заповнення таблиці даними --
INSERT INTO [dbo].[ORDERS] (OrderDate, MFR, PRODUCT, REP, Quantity)
VALUES 
('2008-01-15', 'MFR001', 'PRD001', 1, 10),
('2008-03-22', 'MFR002', 'PRD002', 2, 15),
('2008-05-11', 'MFR003', 'PRD003', 3, 20),
('2008-06-14', 'MFR001', 'PRD001', 1, 12),
('2008-08-25', 'MFR002', 'PRD004', 2, 18),
('2008-09-30', 'MFR003', 'PRD002', 3, 25),
('2008-10-05', 'MFR001', 'PRD005', 4, 30),
('2008-12-19', 'MFR004', 'PRD006', 5, 8),
('2008-02-14', 'MFR001', 'PRD003', 4, 22);

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

--Завдання 2. Запит для отримання унікальних комбінацій ідентифікатора виробника та ідентифікатора товару за замовленнями 2008 року --
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
