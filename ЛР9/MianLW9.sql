-- ������ 1. ������� ��� ��� ������� � ��������� �������� �����.
-- ��������������� �������� ������� LEN ��� ��������� ������� ������� � ����.
-- ������������ �������: ������������� ��������� (MFR_ID), ������������� �������� (PRODUCT_ID), 
-- ���� �������� (DESCRIPTION) �� ������� ����� (DescriptionLength).
SELECT TOP 1 WITH TIES
    MFR_ID, 
    PRODUCT_ID, 
    DESCRIPTION, 
    LEN(DESCRIPTION) AS DescriptionLength  -- ϳ�������� ������� �����
FROM 
    dbo.PRODUCTS
ORDER BY 
    LEN(DESCRIPTION) DESC;  -- ���������� �� �������� ����� � ������� �������� ��� ��������� ��������� �����


-- ������ 2. ������� ��� ��������, ������������� ���� ���������� ���� � ����.
-- ���������� ������������ ������� MFR_ID, PRODUCT_ID �� DESCRIPTION ����� ���� �����.
-- ϳ����������� ������� ���������������� ����� ��� ��������� �����, ���������� �� ����������.
SELECT DISTINCT 
    CONCAT_WS(' ', RTRIM(MFR_ID), RTRIM(PRODUCT_ID), RTRIM(DESCRIPTION)) AS ConcatenatedString,  -- ������������ �������� � �������
    LEN(CONCAT_WS(' ', RTRIM(MFR_ID), RTRIM(PRODUCT_ID), RTRIM(DESCRIPTION))) AS ConcatenatedLength  -- ϳ�������� ������� ���������������� �����
FROM 
    dbo.PRODUCTS
WHERE 
    PRODUCT_ID NOT LIKE '%[^0-9]%'  -- ��������, �� PRODUCT_ID ������ ���� �����
ORDER BY 
    ConcatenatedLength DESC;  -- ���������� �� �������� ���������������� ����� � ������� ��������


-- ������ 3. ������� ������ �볺��� � ��������� ��������� �����.
-- ���������� ���������� ����� �볺��� � ������������ ���� ������ ���� � ������� ���� �������.
-- ������������ �������: ������������� �볺��� (CustomerID), ����� �볺��� (MaskedName), ��������� ��� (CreditLimit).
SELECT TOP 1 WITH TIES 
    CustomerID, 
    CONCAT(LEFT(CustomerName, 2), REPLICATE('*', LEN(CustomerName) - 4), RIGHT(CustomerName, 2)) AS MaskedName,  -- ���������� ����� �볺���
    CreditLimit
FROM 
    dbo.CUSTOMERS
ORDER BY 
    CreditLimit ASC;  -- ���������� �� ��������� ����� � ������� ��������� ��� ��������� ���������� ���������� ����
