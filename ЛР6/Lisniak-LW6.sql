CREATE DATABASE WebStore3;
GO
USE WebStore3;
GO

CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) NOT NULL,
    Phone NVARCHAR(20),
    Address NVARCHAR(255)
);

CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(100) NOT NULL,
    ProductCategory NVARCHAR(50) NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL
);

CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    Subtotal AS (Quantity * UnitPrice) PERSISTED,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers (CustomerName, Email, Phone, Address)
VALUES 
('Ivan Petrov', 'ivan.petrov@example.com', '123-456-7890', '123 Main St, Kyiv'),
('Anna Ivanova', 'anna.ivanova@example.com', '987-654-3210', '456 Oak St, Lviv'),
('Olga Smirnova', 'olga.smirnova@example.com', '567-890-1234', '789 Pine St, Odesa');

INSERT INTO Products (ProductName, ProductCategory, UnitPrice, StockQuantity)
VALUES 
('Laptop', 'Electronics', 1200.00, 10),
('Smartphone', 'Electronics', 800.00, 20),
('Headphones', 'Accessories', 50.00, 50),
('Chair', 'Furniture', 100.00, 15),
('Desk', 'Furniture', 300.00, 5);

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES 
(1, '2024-12-01', NULL),
(2, '2024-12-02', NULL),
(3, '2024-12-03', NULL);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES 
(1, 1, 1, 1200.00),
(1, 3, 2, 50.00),
(2, 2, 2, 800.00),
(3, 4, 4, 100.00);

UPDATE Orders
SET TotalAmount = (
    SELECT SUM(Subtotal) 
    FROM OrderDetails 
    WHERE OrderDetails.OrderID = Orders.OrderID
);

SELECT 
    o.OrderID,
    c.CustomerName,
    o.OrderDate,
    p.ProductName,
    od.Quantity,
    od.UnitPrice,
    od.Subtotal
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID;

DECLARE @OrderID INT;

-- Створення замовлення
INSERT INTO Orders (CustomerID, OrderDate)
VALUES (1, GETDATE());

-- Отримання ідентифікатора нового замовлення
SET @OrderID = SCOPE_IDENTITY();

-- Додавання деталей до замовлення
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES 
(@OrderID, 1, 1, 1200.00),
(@OrderID, 3, 1, 50.00);

