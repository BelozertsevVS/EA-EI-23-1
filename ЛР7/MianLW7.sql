-- ��������� ������� SALESREPS
CREATE TABLE [dbo].[SALESREPS] (
    EmployeeID INT PRIMARY KEY,           -- ������������� ����������
    FirstName NVARCHAR(50),               -- ��'� ����������
    LastName NVARCHAR(50),                -- ������� ����������
    Age INT,                              -- ³� ����������
    Title NVARCHAR(50)                    -- ������ ����������
);

-- ������� ����� � ������� SALESREPS
INSERT INTO [dbo].[SALESREPS] (EmployeeID, FirstName, LastName, Age, Title) VALUES
(1, 'Ivan', 'Petrenko', 46, 'Manager'),
(2, 'Olha', 'Shevchenko', 50, 'Sales Representative'),
(3, 'Andriy', 'Kovalenko', 30, 'Sales Representative'),
(4, 'Iryna', 'Tkachenko', 48, 'Senior Sales Representative');

-- ��������� ������� ORDERS
CREATE TABLE [dbo].[ORDERS] (
    OrderID INT PRIMARY KEY,              -- ������������� ����������
    MFR NVARCHAR(10),                     -- ������������� ���������
    PRODUCT NVARCHAR(10),                 -- ������������� ������
    REP INT,                              -- ������������� ����������, �� ������� ����������
    OrderDate DATE                        -- ���� ����������
);

-- ������� ����� � ������� ORDERS
INSERT INTO [dbo].[ORDERS] (OrderID, MFR, PRODUCT, REP, OrderDate) VALUES
(1, 'M001', 'P001', 1, '2008-01-15'),
(2, 'M002', 'P002', 2, '2008-03-22'),
(3, 'M001', 'P001', 1, '2008-05-12'),
(4, 'M003', 'P003', 3, '2008-07-18'),
(5, 'M001', 'P001', 2, '2009-02-10'),
(6, 'M002', 'P002', 2, '2008-10-05'),
(7, 'M004', 'P004', 4, '2008-11-19');


-- �������� 1

SELECT EmployeeID,           -- ������������� ����������
       FirstName,            -- ��'� ����������
       LastName,             -- ������� ����������
       Age,                  -- ³� ����������
       Title                 -- ������ ����������
FROM [dbo].[SALESREPS]       -- ������� ����������
WHERE Age > 45               -- Գ����, ��� ������� ����� ��� ����������, ���� ����� 45 ����
ORDER BY Age DESC;           -- ���������� �� ���� � ������� �������� (�� ����������� �� ������������)

-- �������� 2

SELECT DISTINCT MFR,         -- ������������� ���������
                PRODUCT      -- ������������� ������
FROM [dbo].[ORDERS]          -- ������� ���������
WHERE YEAR(OrderDate) = 2008; -- Գ���� ��� ������ ���������, ��������� � 2008 ����

-- �������� 3

SELECT REP,                          -- ������������� ����������
       COUNT(*) AS OrderCount        -- ʳ������ ���������, ���������� �����������
FROM [dbo].[ORDERS]                  -- ������� ���������
WHERE YEAR(OrderDate) = 2008         -- Գ���� ��� ������ ���������, ��������� � 2008 ����
GROUP BY REP                         -- ���������� �� ��������������� ����������
ORDER BY OrderCount DESC             -- ���������� �� ������� ��������� � ������� ��������
OFFSET 0 ROWS                        -- ���������� 0 ����� (��������������� ��� ���������� ������������ WITH TIES)
FETCH NEXT 1 ROWS WITH TIES;         -- ��������� ����� � ������������ ���������, ��������� �, �� ����� ���� � ��������


