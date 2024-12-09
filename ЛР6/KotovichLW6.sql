CREATE TABLE Customers 
(CustomerID INT PRIMARY KEY,
CustomerName NVARCHAR(100));

CREATE TABLE Products 
(ProductID INT PRIMARY KEY,
ProductName NVARCHAR(100),
ProductCategory NVARCHAR(50),
UnitPrice DECIMAL(10, 2));

CREATE TABLE Orders 
(OrderID INT PRIMARY KEY,
CustomerID INT,
ProductID INT,
Quantity INT,
OrderDate DATE,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID));

INSERT INTO Customers (CustomerID, CustomerName) VALUES
(1, 'Ivan Malko'),
(2, 'Sergey Panchenko'),
(3, 'Anton Smirnov');

INSERT INTO Products (ProductID, ProductName, ProductCategory, UnitPrice) VALUES
(1, 'Laptop', 'Electronics', 1200.00),
(2, 'Smartphone', 'Electronics', 700.00),
(3, 'Headphones', 'Accessories', 50.00),
(4, 'Laptop Bag', 'Accessories', 30.00),
(5, 'Smartwatch', 'Wearables', 200.00),
(6, 'Tablet', 'Electronics', 400.00);

INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity, OrderDate) VALUES
(1, 1, 1, 1, '2024-10-01'),
(2, 2, 2, 2, '2024-10-02'),
(3, 1, 3, 1, '2024-10-03'),
(4, 3, 1, 1, '2024-10-04'),
(5, 2, 1, 1, '2024-10-05'),
(6, 1, 4, 1, '2024-10-06'),
(7, 3, 5, 1, '2024-10-07'),
(8, 2, 2, 1, '2024-10-08'),
(9, 1, 6, 1, '2024-10-09'),
(10, 3, 1, 2, '2024-10-10');

/*Щоб відповідати вимогам 2НФ, потрібно усунути часткові залежності, тобто всі неключові атрибути повинні залежати від усього ключа.
Аналіз часткових залежностей:
У таблиці Orders не залишилося атрибутів, які частково залежать від первинного ключа, оскільки всі дані про клієнтів і продукти тепер зберігаються в окремих таблицях.
Отже, перехід до 2НФ виконано шляхом створення окремих таблиць для клієнтів і продуктів.*/

/*У 3НФ потрібно усунути транзитивні залежності. Транзитивна залежність виникає, коли неключовий атрибут залежить від іншого неключового атрибута.
Аналіз:
У нашій структурі транзитивних залежностей немає, оскільки всі неключові атрибути (кількість, дата замовлення) безпосередньо залежать від первинного ключа OrderID.
Дані про продукти і клієнтів зберігаються окремо, тому жодних транзитивних залежностей немає.
Отже, структура таблиць вже відповідає вимогам 3НФ.*/

INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity, OrderDate)
VALUES (11, 2, 3, 1, '2024-10-12');

UPDATE Products SET UnitPrice = 750.00 WHERE ProductID = 2;

DELETE FROM Orders WHERE OrderID = 11;

/*Переваги нормалізованої структури:
Всі дані про клієнтів і продукти тепер зберігаються окремо, що полегшує їх оновлення без необхідності змінювати багато рядків в таблиці Orders.
Видалення або оновлення даних більше не призводить до втрати інформації.
Проблеми аномалій вставки, оновлення і видалення успішно вирішені.
Порівняння з денормалізованою структурою:
Денормалізована структура містила дублювання даних і підвищений ризик помилок під час оновлення інформації.
Нормалізована структура забезпечує більшу цілісність даних і зменшує ризики помилок.*/
