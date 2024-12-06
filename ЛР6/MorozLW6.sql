CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(50),
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    OrderDate DATE
);





INSERT INTO Orders (OrderID, CustomerName, ProductName, ProductCategory, Quantity, UnitPrice, OrderDate)
VALUES 
(1, 'Alice', 'Laptop', 'Electronics', 1, 1200.00, '2024-01-01'),
(2, 'Bob', 'Laptop', 'Electronics', 2, 1200.00, '2024-01-02'),
(3, 'Alice', 'Mouse', 'Accessories', 3, 25.00, '2024-01-03'),
(4, 'Charlie', 'Laptop', 'Electronics', 1, 1200.00, '2024-01-04'),
(5, 'Alice', 'Keyboard', 'Accessories', 1, 75.00, '2024-01-05'),
(6, 'Bob', 'Headphones', 'Accessories', 2, 100.00, '2024-01-06'),
(7, 'Charlie', 'Monitor', 'Electronics', 1, 300.00, '2024-01-07'),
(8, 'Alice', 'Laptop', 'Electronics', 1, 1200.00, '2024-01-08'),
(9, 'Bob', 'Monitor', 'Electronics', 2, 300.00, '2024-01-09'),
(10, 'Charlie', 'Mouse', 'Accessories', 5, 25.00, '2024-01-10');




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





INSERT INTO Customers (CustomerID, CustomerName)
VALUES (1, 'Alice'), (2, 'Bob'), (3, 'Charlie');




INSERT INTO Products (ProductID, ProductName, ProductCategory, UnitPrice)
VALUES 
(1, 'Laptop', 'Electronics', 1200.00),
(2, 'Mouse', 'Accessories', 25.00),
(3, 'Keyboard', 'Accessories', 75.00),
(4, 'Headphones', 'Accessories', 100.00),
(5, 'Monitor', 'Electronics', 300.00);



INSERT INTO Orders (OrderID,CustomerID,ProductID,Quantity,OrderDate)
VALUES 
(1, 1, 1, 1, '2024-01-01'),
(2, 2, 1, 2, '2024-01-02'),
(3, 1, 2, 3, '2024-01-03'),
(4, 3, 1, 1, '2024-01-04'),
(5, 1, 3, 1, '2024-01-05'),
(6, 2, 4, 2, '2024-01-06'),
(7, 3, 5, 1, '2024-01-07'),
(8, 1, 1, 1, '2024-01-08'),
(9, 2, 5, 2, '2024-01-09'),
(10, 3, 2, 5, '2024-01-10');








CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);







INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES 
(1, 1, 1, 1),
(2, 2, 1, 2),
(3, 3, 2, 3),
(4, 4, 1, 1),
(5, 5, 3, 1),
(6, 6, 4, 2),
(7, 7, 5, 1),
(8, 8, 1, 1),
(9, 9, 5, 2),
(10, 10, 2, 5);








CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);






ALTER TABLE Products ADD CategoryID INT;
ALTER TABLE Products ADD FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);







INSERT INTO Categories (CategoryID, CategoryName)
VALUES (1, 'Electronics'), (2, 'Accessories');





UPDATE Products SET CategoryID = 1 WHERE ProductCategory = 'Electronics';
UPDATE Products SET CategoryID = 2 WHERE ProductCategory = 'Accessories';






