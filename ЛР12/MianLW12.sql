-- ������ 1 ����� ������� ���������
SELECT MFR, 
    SUM(AMOUNT) AS TOTAL_SALES               -- ���������� �������� ���� �������
FROM [dbo].[ORDERS]
WHERE YEAR(ORDER_DATE) = 2008                -- ������ ���������, ��������� � 2008 ����
GROUP BY MFR                                -- ���������� �� ��������������� ���������
ORDER BY MFR ASC;                           -- ���������� ���������� �� ���������� � ������� ���������

-- ������ 2 ���������� �������� ����� ����������
SELECT 
    DATEDIFF(YEAR, HIRE_DATE, GETDATE()) AS YEARS_OF_SERVICE, -- ���������� ���� ������ ����������
    COUNT(EMPL_NUM) AS EMP_COUNT                            -- ϳ�������� ������� ���������� ��� ������� ������
FROM [dbo].[SALESREPS]
GROUP BY DATEDIFF(YEAR, HIRE_DATE, GETDATE())               -- ���������� �� ������� ���� ������
ORDER BY EMP_COUNT DESC;                                    -- ���������� �� ������� ���������� � ���������� �������

-- ������ 3 ����� ����� ���������� �� ��������
SELECT 
    YEAR(HIRE_DATE) AS HIRE_YEAR,          -- �������� ���� �����
    MONTH(HIRE_DATE) AS HIRE_MONTH,        -- �������� ����� �����
    COUNT(EMPL_NUM) AS HIRED_COUNT         -- ϳ�������� ������� �����
FROM [dbo].[SALESREPS]
GROUP BY 
    YEAR(HIRE_DATE),                       -- ���������� �� �����
    MONTH(HIRE_DATE)                       -- ���������� �� ������
ORDER BY 
    HIRE_YEAR ASC,                         -- ���������� �� ����� � ����������� �������
    HIRE_MONTH ASC;                        -- ���������� �� ������ � ����������� �������

