 -- Створення денормалізованої таблиці Orders
    CREATE TABLE Orders (
        OrderID INT PRIMARY KEY,
        CustomerName NVARCHAR(100),
        ProductName NVARCHAR(100),
        ProductCategory NVARCHAR(50),
        Quantity INT,
        UnitPrice DECIMAL(10, 2),
        OrderDate DATE
    );
    
    -- Вставка даних в таблицю Orders
    INSERT INTO Orders (OrderID, CustomerName, ProductName, ProductCategory, Quantity, UnitPrice, OrderDate)
    VALUES 
    (1, 'John Doe', 'Laptop', 'Electronics', 1, 1200, '2024-01-10'),
    (2, 'Jane Smith', 'Smartphone', 'Electronics', 2, 600, '2024-01-15'),
    (3, 'John Doe', 'Laptop', 'Electronics', 1, 1200, '2024-01-18'),
    (4, 'Mike Johnson', 'Chair', 'Furniture', 4, 150, '2024-01-20'),
    (5, 'Jane Smith', 'Laptop', 'Electronics', 1, 1200, '2024-01-25'),
    (6, 'Emily Davis', 'Desk', 'Furniture', 2, 250, '2024-01-30'),
    (7, 'Mike Johnson', 'Laptop', 'Electronics', 1, 1200, '2024-02-01'),
    (8, 'John Doe', 'Desk', 'Furniture', 1, 250, '2024-02-03'),
    (9, 'Emily Davis', 'Smartphone', 'Electronics', 1, 600, '2024-02-07'),
    (10, 'Jane Smith', 'Chair', 'Furniture', 1, 150, '2024-02-10');

 -- Створення таблиці для клієнтів
    CREATE TABLE Customers (
        CustomerID INT PRIMARY KEY,
        CustomerName NVARCHAR(100)
    );
    
    -- Створення таблиці для продуктів
    CREATE TABLE Products (
        ProductID INT PRIMARY KEY,
        ProductName NVARCHAR(100),
        ProductCategory NVARCHAR(50),
        UnitPrice DECIMAL(10, 2)
    );

    -- Оновлена таблиця замовлень
    CREATE TABLE Orders_1NF (
        OrderID INT PRIMARY KEY,
        CustomerID INT,
        ProductID INT,
        Quantity INT,
        OrderDate DATE,
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
        FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
    );
    
    -- Вставка даних у нові таблиці
    INSERT INTO Customers (CustomerID, CustomerName) VALUES
    (1, 'John Doe'), (2, 'Jane Smith'), (3, 'Mike Johnson'), (4, 'Emily Davis');

    INSERT INTO Products (ProductID, ProductName, ProductCategory, UnitPrice) VALUES
    (1, 'Laptop', 'Electronics', 1200), (2, 'Smartphone', 'Electronics', 600),
    (3, 'Chair', 'Furniture', 150), (4, 'Desk', 'Furniture', 250);

    -- Вставка даних у нову таблицю замовлень
    INSERT INTO Orders_1NF (OrderID, CustomerID, ProductID, Quantity, OrderDate) VALUES
    (1, 1, 1, 1, '2024-01-10'), (2, 2, 2, 2, '2024-01-15'),
    (3, 1, 1, 1, '2024-01-18'), (4, 3, 3, 4, '2024-01-20'),
    (5, 2, 1, 1, '2024-01-25'), (6, 4, 4, 2, '2024-01-30'),
    (7, 3, 1, 1, '2024-02-01'), (8, 1, 4, 1, '2024-02-03'),
    (9, 4, 2, 1, '2024-02-07'), (10, 2, 3, 1, '2024-02-10');

  -- Вставка нового замовлення
    INSERT INTO Orders_1NF (OrderID, CustomerID, ProductID, Quantity, OrderDate)
    VALUES (11, 2, 2, 1, '2024-02-15');

    -- Оновлення кількості продуктів у замовленні
    UPDATE Orders_1NF SET Quantity = 3 WHERE OrderID = 2;

    -- Видалення замовлення
    DELETE FROM Orders_1NF WHERE OrderID = 3;
