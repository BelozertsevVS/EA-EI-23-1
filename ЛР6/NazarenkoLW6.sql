/*Створення денормалізованої таблиці*/
CREATE TABLE Orders (    
OrderID INT PRIMARY KEY,   
CustomerName VARCHAR(255),   
ProductName VARCHAR(255),    
ProductCategory VARCHAR(255),    
Quantity INT,    
UnitPrice DECIMAL(10, 2),    
OrderDate DATE);

/*Вставка записів у денормалізовану таблицю*/
INSERT INTO Orders (OrderID, CustomerName, ProductName, ProductCategory, Quantity, UnitPrice, OrderDate)
VALUES
(1, 'John Doe', 'Laptop', 'Electronics', 1, 1000.00, '2024-10-01'),
(2, 'Jane Smith', 'Laptop', 'Electronics', 2, 1000.00, '2024-10-02'),
(3, 'John Doe', 'Mouse', 'Accessories', 3, 25.00, '2024-10-03'),
(4, 'John Doe', 'Keyboard', 'Accessories', 1, 50.00, '2024-10-04'),
(5, 'Jane Smith', 'Headphones', 'Accessories', 1, 100.00, '2024-10-05'),
(6, 'John Doe', 'Laptop', 'Electronics', 1, 1000.00, '2024-10-06'),
(7, 'Mike Johnson', 'Monitor', 'Electronics', 1, 300.00, '2024-10-07'),
(8, 'Mike Johnson', 'Mouse', 'Accessories', 2, 25.00, '2024-10-08'),
(9, 'John Doe', 'Monitor', 'Electronics', 1, 300.00, '2024-10-09'),
(10, 'Jane Smith', 'Mouse', 'Accessories', 1, 25.00, '2024-10-10');

/*Для забезпечення унікальності та атомарності, таблицю потрібно перебудувати так, щоб уникнути повторюваних груп даних*/
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

/*Вставка записів*/
INSERT INTO Customers (CustomerID, CustomerName)
VALUES
(1, 'John Doe'),
(2, 'Jane Smith'),
(3, 'Mike Johnson');


INTO Customers (CustomerID, CustomerName)
VALUES
(1, 'John Doe'),
(2, 'Jane Smith'),
(3, 'Mike Johnson');


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    ProductCategory VARCHAR(255),
    UnitPrice DECIMAL(10, 2)
);

/*Вставка записів*/
INSERT INTO Products (ProductID, ProductName, ProductCategory, UnitPrice)
VALUES(1, 'Laptop', 'Electronics', 1000.00),
(2, 'Mouse', 'Accessories', 25.00),
(3, 'Keyboard', 'Accessories', 50.00),
(4, 'Headphones', 'Accessories', 100.00),
(5, 'Monitor', 'Electronics', 300.00);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

/*Вставка записів*/
INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity, OrderDate)
VALUES(1, 1, 1, 1, '2024-10-01'),
(2, 2, 1, 2, '2024-10-02'),
(3, 1, 2, 3, '2024-10-03'),
(4, 1, 3, 1, '2024-10-04'),
(5, 2, 4, 1, '2024-10-05'),
(6, 1, 1, 1, '2024-10-06'),
(7, 3, 5, 1, '2024-10-07'),
(8, 3, 2, 2, '2024-10-08'),
(9, 1, 5, 1, '2024-10-09'),
(10, 2, 2, 1, '2024-10-10');


CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255)
);

/*Вставка записів*/
INSERT INTO Categories (CategoryID, CategoryName)
VALUES
(1, 'Electronics'),
(2, 'Accessories');

/*Оновлення таблиці Products*/
ALTER TABLE Products
ADD CategoryID INT;

UPDATE Products
SET CategoryID = CASE
    WHEN ProductCategory = 'Electronics' THEN 1
    WHEN ProductCategory = 'Accessories' THEN 2
END;

ALTER TABLE Products DROP COLUMN ProductCategory;

ALTER TABLE Products
ADD FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

/*Вставка даних*/
INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity, OrderDate)
VALUES (11, 2, 3, 2, '2024-10-11');

/*Оновлення даних*/
UPDATE Products
SET UnitPrice = 1100.00
WHERE ProductID = 1;

/*Видалення даних*/
DELETE FROM Orders
WHERE OrderID = 11;

