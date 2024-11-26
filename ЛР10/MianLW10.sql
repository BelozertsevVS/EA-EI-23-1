-- ������ 1
-- ����� ������� ������ ��������� �������������� ���������, �� ���������� ������:

SELECT DISTINCT MFR AS ManufacturerID
FROM ORDERS
WHERE 
    (TotalAmount % 2 = 0)  -- ����� ����
    AND (OrderID % 2 != 0)  -- ������� ������� �������
ORDER BY ManufacturerID;



-- ������ 2
-- ����� ������� �������� �� ������� ������� ������� ������ � ����� �������������� ���������,
-- ���������� �� 2 �����:

SELECT 
    MFR AS ManufacturerID,
    ROUND(SUM(Quantity * Price), 2) AS TotalValue,  -- �������� ������� ������
    ROUND(AVG(Price), 2) AS AveragePrice           -- ������� ���� ������
FROM PRODUCTS
GROUP BY MFR
ORDER BY MFR;


-- ������ 3
-- ����� ������� ���������� � ��������� ���������� ������� �� ����� �� ���������,
--� ����� �������� ������, � ����� �������� ������� ���� ���������� �� ������ �����:

SELECT TOP 1 
    SalesRepID,
    ROUND(ABS(SalesTarget - CurrentSales), 2) AS SalesDifference,  -- ��������� ������
    DATEDIFF(YEAR, HireDate, GETDATE()) AS YearsAtCompany  -- ʳ������ ���� � ������
FROM SALESREPS
ORDER BY SalesDifference DESC;


