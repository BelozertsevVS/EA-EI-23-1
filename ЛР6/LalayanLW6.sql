
-- ЧАСТИНА 1: Денормалізована таблиця Orders

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(100),
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    OrderDate DATE
);

INSERT INTO Orders (OrderID, CustomerName, ProductName, ProductCategory, Quantity, UnitPrice, OrderDate)
VALUES
(1, 'John Doe', 'Milk', 'Dairy', 10, 1.50, '2024-10-01'),
(2, 'Jane Smith', 'Cheese', 'Dairy', 5, 3.00, '2024-10-02'),
(3, 'John Doe', 'Bread', 'Bakery', 7, 1.20, '2024-10-03'),
(4, 'Jane Smith', 'Butter', 'Dairy', 3, 2.50, '2024-10-04'),
(5, 'Alice Johnson', 'Milk', 'Dairy', 8, 1.50, '2024-10-05'),
(6, 'Bob Brown', 'Yogurt', 'Dairy', 12, 0.90, '2024-10-06'),
(7, 'Alice Johnson', 'Bread', 'Bakery', 6, 1.20, '2024-10-07'),
(8, 'Bob Brown', 'Cheese', 'Dairy', 4, 3.00, '2024-10-08'),
(9, 'John Doe', 'Yogurt', 'Dairy', 5, 0.90, '2024-10-09'),
(10, 'Jane Smith', 'Bread', 'Bakery', 10, 1.20, '2024-10-10');

-- ЧАСТИНА 2: Нормалізація до 1НФ

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(100),
    UnitPrice DECIMAL(10, 2)
);

CREATE TABLE Orders_1NF (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers (CustomerID, CustomerName)
VALUES (1, 'John Doe'), (2, 'Jane Smith'), (3, 'Alice Johnson'), (4, 'Bob Brown');

INSERT INTO Products (ProductID, ProductName, ProductCategory, UnitPrice)
VALUES
(1, 'Milk', 'Dairy', 1.50),
(2, 'Cheese', 'Dairy', 3.00),
(3, 'Bread', 'Bakery', 1.20),
(4, 'Butter', 'Dairy', 2.50),
(5, 'Yogurt', 'Dairy', 0.90);

INSERT INTO Orders_1NF (OrderID, CustomerID, ProductID, Quantity, OrderDate)
VALUES
(1, 1, 1, 10, '2024-10-01'),
(2, 2, 2, 5, '2024-10-02'),
(3, 1, 3, 7, '2024-10-03'),
(4, 2, 4, 3, '2024-10-04'),
(5, 3, 1, 8, '2024-10-05'),
(6, 4, 5, 12, '2024-10-06'),
(7, 3, 3, 6, '2024-10-07'),
(8, 4, 2, 4, '2024-10-08'),
(9, 1, 5, 5, '2024-10-09'),
(10, 2, 3, 10, '2024-10-10');

-- Приклад запитів для тестування

INSERT INTO Orders_1NF (OrderID, CustomerID, ProductID, Quantity, OrderDate)
VALUES (11, 1, 1, 15, '2024-10-11');

UPDATE Products SET UnitPrice = 1.60 WHERE ProductID = 1;

DELETE FROM Orders_1NF WHERE OrderID = 11;
