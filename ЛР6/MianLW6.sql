CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(50),
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    OrderDate DATE
);

-- Вставка даних з повтореннями для демонстрації проблем
INSERT INTO Orders (OrderID, CustomerName, ProductName, ProductCategory, Quantity, UnitPrice, OrderDate) VALUES
(1, 'Ivanov', 'Laptop', 'Electronics', 1, 1200.00, '2024-11-01'),
(2, 'Petrov', 'Phone', 'Electronics', 2, 600.00, '2024-11-02'),
(3, 'Ivanov', 'Laptop', 'Electronics', 1, 1200.00, '2024-11-03'),
(4, 'Sidorov', 'Tablet', 'Electronics', 1, 300.00, '2024-11-04'),
(5, 'Petrov', 'Laptop', 'Electronics', 1, 1200.00, '2024-11-05');

-- Неможливість додати новий продукт без відповідної інформації про замовлення.
-- Зміна категорії продукту (наприклад, 'Laptop') потребує оновлення всіх записів.
-- Видалення останнього запису замовлення для клієнта може призвести до втрати інформації про клієнта.

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(50),
    UnitPrice DECIMAL(10, 2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Вставка даних у нормалізовані таблиці
INSERT INTO Customers (CustomerID, CustomerName) VALUES (1, 'Ivanov'), (2, 'Petrov'), (3, 'Sidorov');

INSERT INTO Products (ProductID, ProductName, ProductCategory, UnitPrice) VALUES
(1, 'Laptop', 'Electronics', 1200.00),
(2, 'Phone', 'Electronics', 600.00),
(3, 'Tablet', 'Electronics', 300.00);

INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity, OrderDate) VALUES
(1, 1, 1, 1, '2024-11-01'),
(2, 2, 2, 2, '2024-11-02'),
(3, 1, 1, 1, '2024-11-03'),
(4, 3, 3, 1, '2024-11-04'),
(5, 2, 1, 1, '2024-11-05');

-- Вставка нового продукту без дублювання клієнтської інформації
INSERT INTO Products (ProductID, ProductName, ProductCategory, UnitPrice) VALUES (4, 'Monitor', 'Electronics', 400.00);

-- Оновлення ціни продукту
UPDATE Products SET UnitPrice = 1250.00 WHERE ProductName = 'Laptop';

-- Видалення замовлення без втрати інформації про клієнта:
DELETE FROM Orders WHERE OrderID = 1;

-- Нормалізована структура забезпечує більшу гнучкість, зменшує дублювання та усуває аномалії даних, що покращує цілісність даних.


