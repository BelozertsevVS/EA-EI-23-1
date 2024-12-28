-- �������� 1

-- �������� ������� �������������� ��������� �� ������� ���������
SELECT DISTINCT MFR
FROM [dbo].[ORDERS]
WHERE YEAR(Order_Date) = 2008  -- ³��� ������, �� �� ���� ���������� ������� 2008
ORDER BY MFR;                 -- ���������� ���������� �� ��������������� ���������

-- �������� 2
SELECT 
    DATEDIFF(YEAR, HIRE_DATE, GETDATE()) AS YearsWorked,  -- ���������� ���� ������
    COUNT(*) AS EmployeeCount                           -- ϳ�������� ���������� ��� ������� ���� ������
FROM [dbo].[SALESREPS]
GROUP BY DATEDIFF(YEAR, HIRE_DATE, GETDATE())            -- ���������� �� ������� ���� ������
ORDER BY EmployeeCount DESC;                            -- ���������� �� ������� ���������� � ���������� �������

-- ������ 3
WITH HireStats AS (
    SELECT 
        YEAR(HIRE_DATE) AS HireYear,               -- г� �����
        MONTH(HIRE_DATE) AS HireMonth,            -- ̳���� �����
        COUNT(*) AS HiresCount                    -- ʳ������ �����
    FROM [dbo].[SALESREPS]
    GROUP BY YEAR(HIRE_DATE), MONTH(HIRE_DATE)    -- ���������� �� ����� � ������
)
SELECT HireYear, HireMonth, HiresCount
FROM HireStats
WHERE HiresCount = (SELECT MAX(HiresCount) FROM HireStats);  -- ���� ������ �� ������������ ������� �����

-- ������ 4
SELECT 
    DATEPART(WEEKDAY, ORDER_DATE) AS DayOfWeekNumber,  -- ����� ��� �����
    DATENAME(WEEKDAY, ORDER_DATE) AS DayOfWeekName,   -- ����� ��� �����
    COUNT(DISTINCT ORDER_NUM) AS UniqueOrders,        -- ʳ������ ��������� ���������
    SUM(AMOUNT) AS TotalSales,                        -- �������� ���� �������
    SUM(QTY) AS TotalQuantity                         -- �������� ������� ������� ������
FROM [dbo].[ORDERS]
WHERE MONTH(ORDER_DATE) IN (12, 1, 2)                 -- ������ ��������� � ����� �����
GROUP BY DATEPART(WEEKDAY, ORDER_DATE),               -- ���������� �� ����� �����
         DATENAME(WEEKDAY, ORDER_DATE)
ORDER BY DayOfWeekNumber;                             -- ���������� �� ������� ��� �����

