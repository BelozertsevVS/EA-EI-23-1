-- �������� 1

-- �������� ������� �������������� ��������� �� ������� ���������
SELECT DISTINCT ManufacturerID
FROM [dbo].[ORDERS]
-- Գ������� ���� � ����������, �� ���� ������� � 2008 ����
WHERE YEAR(OrderDate) = 2008
-- ������� ���������� �� ��������������� ��������� � ����������� �������
ORDER BY ManufacturerID ASC;


-- �������� 2

-- ���������� ������� ������������� ���� ��� ������� ����������
SELECT DATEDIFF(YEAR, HireDate, GETDATE()) AS YearsWorked, 
       -- ϳ��������� ������� ���������� ��� ������� �������������� ������
       COUNT(*) AS EmployeeCount
FROM [dbo].[SALESREPS]
-- ������� ���������� �� ������� ������������� ����
GROUP BY DATEDIFF(YEAR, HireDate, GETDATE())
-- ������� ��������� �� ������� ���������� � �������� �������
ORDER BY EmployeeCount DESC;


-- ������ 3

-- ��������� �� �� ����� �� ��������� ������� �������� ����������
SELECT YEAR(HireDate) AS HireYear,       -- �������� �� �����
       MONTH(HireDate) AS HireMonth,    -- �������� ����� �����
       COUNT(*) AS EmployeeCount        -- ϳ��������� ������� ����������
FROM [dbo].[SALESREPS]
-- ������� ��� �� ����� �� ������ �����
GROUP BY YEAR(HireDate), MONTH(HireDate)
-- Գ������� ���� � ������, �� ������� �������� ���������� ������� ���������
HAVING COUNT(*) = (
    SELECT MAX(EmployeeCount)           -- ϳ������ ��� ���������� ������������� ��������
    FROM (
        SELECT COUNT(*) AS EmployeeCount
        FROM [dbo].[SALESREPS]
        GROUP BY YEAR(HireDate), MONTH(HireDate)
    ) AS SubQuery
)
-- ������� ��������� �� ����� �� ������ �����
ORDER BY HireYear, HireMonth;


-- ������ 4

-- �������� ���������� �� ����� ����� ��� ������� ������
SELECT DATEPART(WEEKDAY, OrderDate) AS WeekdayNumber, -- ����� ��� �����
       DATENAME(WEEKDAY, OrderDate) AS WeekdayName,   -- ����� ��� �����
       COUNT(DISTINCT OrderID) AS TotalOrders,        -- ʳ������ ��������� ���������
       SUM(TotalAmount) AS TotalSales,                -- �������� ���� �������
       SUM(TotalQuantity) AS TotalUnitsSold           -- �������� ������� �������� ������� ������
FROM [dbo].[ORDERS]
-- Գ������� ���, ���������� ���� ����� �����: �������, �����, �����
WHERE MONTH(OrderDate) IN (12, 1, 2)
-- ������� ���������� �� ������� � ������ ��� �����
GROUP BY DATEPART(WEEKDAY, OrderDate), DATENAME(WEEKDAY, OrderDate)
-- ������� �� ������� ��� ����� � ����������� �������
ORDER BY WeekdayNumber ASC;


