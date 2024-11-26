-- �������� 1 

-- ��������� ������� OFFICES
CREATE TABLE dbo.OFFICES (
    OfficeID INT PRIMARY KEY,
    City NVARCHAR(100),
    ManagerID INT,
    Region NVARCHAR(50),
    TargetSales DECIMAL(18, 2)
);

-- ��������� �������� �����
INSERT INTO dbo.OFFICES (OfficeID, City, ManagerID, Region, TargetSales)
VALUES 
(1, 'Kyiv', 101, 'East', 300000.00),
(2, 'Lviv', 102, 'West', 400000.00),
(3, 'Odessa', 103, 'East', 350000.00);


SELECT OfficeID, City, ManagerID -- ������� �������� �������: ������������� �����, ����, ���������
FROM [dbo].[OFFICES]             -- ������� ����� - ������� OFFICES
WHERE Region = 'East'            -- Գ������� ���� ����� �������� ������
  AND TargetSales <= 350000.00;  -- ������ �����: ���� ������� ����� ��� ������� 350000

  -- �������� 2.1

  -- ��������� ������� ORDERS
CREATE TABLE dbo.ORDERS (
OrderID INT PRIMARY KEY,
OrderYear INT,
ProductID NVARCHAR(50),
MFR NVARCHAR(50),
TotalAmount DECIMAL(18, 2)
);

-- ��������� �������� �����
INSERT INTO dbo.ORDERS (OrderID, OrderYear, ProductID, MFR, TotalAmount)
VALUES
(1, 2007, 'A001', 'MFR1', 500.00),
(2, 2008, 'B0A2', 'MFR2', 1000.00),
(3, 2009, 'C00B', 'MFR1', 1500.00),
(4, 2007, 'A0C3', 'MFR3', 2000.00);


SELECT *                               -- �������� �� ������� � ������� ORDERS
FROM [dbo].[ORDERS]                    -- ������� ����� - ������� ORDERS
WHERE OrderYear NOT BETWEEN 2008 AND 2008 -- ��������� ���������� �� 2008 ��
  AND (ProductID LIKE '_A%'            -- ��������� ������, �� ������ ������ - A
       OR ProductID LIKE '%0%');       -- ��� ������, �� ����� 0 � ����-����� ����

-- �������� 2.2

SELECT MFR,                              -- �������� ��������� ������
       COUNT(DISTINCT OrderID) AS UniqueOrders, -- ϳ��������� ������� ����������
       SUM(TotalAmount) AS TotalSum      -- ������ �������� ���� ���������
FROM [dbo].[ORDERS]                      -- ������� ����� - ������� ORDERS
WHERE OrderYear NOT BETWEEN 2008 AND 2008 -- ��������� ���������� �� 2008 ��
  AND (ProductID LIKE '_A%'              -- ������, �� ������ ������ - A
       OR ProductID LIKE '%0%')          -- ��� ������, �� ����� 0 � ����-����� ����
GROUP BY MFR                             -- ������� ��� �� ����������� ������
ORDER BY TotalSum ASC;                   -- ������� �� ���������� �������� ����

-- �������� 2.3

-- ��������� CTE (Common Table Expression)
;WITH CTE_Sample AS (
    -- ���������� ����� �� ���������� �� ���������� �������� ���� ���������
    SELECT 
        MFR, -- ������������� ���������
        SUM(TotalAmount) AS TotalSum -- �������� ���� ��������� ��� ������� ���������
    FROM dbo.ORDERS -- ������� ���������
    WHERE 
        -- Գ���� �� ������: ���������� ���������, ��������� � 2008 ����
        OrderYear NOT BETWEEN 2008 AND 2008
        AND 
        -- Գ���� �� ��������������� ������:
        -- ������ ������ �� ���� 'A', ��� ����-�� �� ���� ������ '0'
        (ProductID LIKE '_A%' OR ProductID LIKE '%0%')
    GROUP BY 
        MFR -- ���������� �� ����������
)
-- ������ ��������� �� ��������� ��������� ����� ���������
SELECT TOP 1 WITH TIES 
    MFR, -- ������������� ���������
    TotalSum -- �������� ���� ��������� ��� ����� ���������
FROM 
    CTE_Sample -- ��������� �� ����� ��������� CTE
ORDER BY 
    TotalSum DESC; -- ���������� �� ���������� ���� ���������


-- �������� 3

-- ��������� ������� SALESREPS
CREATE TABLE dbo.SALESREPS (
    SalesRepID INT PRIMARY KEY,  -- ������������� ���������� (���������)
    FirstName VARCHAR(50),  -- ��'� ����������
    LastName VARCHAR(50),  -- ������� ����������
    JobTitle VARCHAR(50),  -- ������
    Age INT,  -- ³�
    OfficeID INT  -- ������������� �����
);

-- ��������� ����� � ������� SALESREPS
INSERT INTO dbo.SALESREPS (SalesRepID, FirstName, LastName, JobTitle, Age, OfficeID)
VALUES
(1, 'John', 'Doe', 'Sales Rep', 29, 101),  -- ��������� 1
(2, 'Jane', 'Smith', 'Sales Rep', 45, 102),  -- ��������� 2
(3, 'Alice', 'Johnson', 'Sales Rep', 48, 101),  -- ��������� 3
(4, 'Bob', 'Brown', 'Sales Rep', 29, 103),  -- ��������� 4
(5, 'Charlie', 'Davis', 'Sales Rep', 45, 101),  -- ��������� 5
(6, 'David', 'Miller', 'Sales Rep', 48, 103);  -- ��������� 6


-- ����'������ �������� ������ � ����� ����� CTE
;WITH CTE_SalesRep AS (
    SELECT 
        OfficeID,  -- ������������� �����
        COUNT(*) AS EmployeeCount  -- ʳ������ ���������� � ������� ����
    FROM dbo.SALESREPS  -- ������� ����������
    WHERE 
        JobTitle = 'Sales Rep'  -- Գ���� �� �����
        AND Age IN (29, 45, 48)  -- ������ �� ����
    GROUP BY OfficeID  -- ���������� �� ��������������� �����
)
-- ������ ����� � ��������� ������� ����������
SELECT TOP 1 WITH TIES 
    OfficeID,  -- ������������� �����
    EmployeeCount  -- ʳ������ ���������� � ����
FROM 
    CTE_SalesRep  -- ��������� �� CTE
ORDER BY 
    EmployeeCount DESC;  -- ���������� �� ������� ���������� (�� ���������)

