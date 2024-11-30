-- ������ 1 ����� ������� ���������

SELECT 
    MFR AS Manufacturer, -- �������� ������������� ���������
    SUM(TOTAL) AS TOTAL_SALES -- ϳ��������� �������� ���� ������� ��� ������� ���������
FROM 
    [dbo].[ORDERS]
WHERE 
    YEAR(OrderDate) = 2008 -- Գ������� ��� �� 2008 ��
GROUP BY 
    MFR -- ������� ���������� �� ��������������� ���������
ORDER BY 
    MFR ASC; -- ������� �� ���������� � ����������� �������


-- ������ 2 ���������� �������� ����� ����������

SELECT 
    DATEDIFF(YEAR, HireDate, GETDATE()) AS YEARS_OF_SERVICE, -- ��������� ������� ������ ���� ������
    COUNT(EMP_NUM) AS EMP_COUNT -- ������ ������� ���������� � ����� ���� �����
FROM 
    [dbo].[SALESREPS]
GROUP BY 
    DATEDIFF(YEAR, HireDate, GETDATE()) -- ������� ���������� �� ������� ���� �����
ORDER BY 
    EMP_COUNT DESC; -- ������� �� ������� ���������� � �������� �������


-- ������ 3 ����� ����� ���������� �� ��������

SELECT 
    YEAR(HireDate) AS HIRE_YEAR, -- �������� �� �����
    MONTH(HireDate) AS HIRE_MONTH, -- �������� ����� �����
    COUNT(EMP_NUM) AS HIRED_COUNT -- ϳ��������� ������� ����������, �������� � ��� �����
FROM 
    [dbo].[SALESREPS]
GROUP BY 
    YEAR(HireDate), MONTH(HireDate) -- ������� �� ����� � ������ �����
ORDER BY 
    HIRE_YEAR ASC, -- ������� �� ����� ����� � ����������� �������
    HIRE_MONTH ASC; -- ������� �� ������ ����� � ����������� �������

