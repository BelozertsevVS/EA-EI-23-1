-- �������� 1
SELECT DISTINCT O.MFR                               -- ������� ���������
FROM dbo.ORDERS O
INNER JOIN dbo.CUSTOMERS C                          -- �'������� ��������� �� �볺�����
    ON O.CUST = C.CUST_NUM                          -- �'������� �� ��������������� �볺���
WHERE O.ORDER_DATE BETWEEN '20080101' AND '20081231'-- ���������� �� 2008 ��
  AND C.COMPANY LIKE '%CORP%';                      -- ����� ������ ������ "CORP"

-- �������� 2
SELECT 
    C.CUST_NUM,                                      -- ������������� �볺���
    MONTH(O.ORDER_DATE) AS ORDER_MONTH,             -- ̳���� ����������
    COUNT(DISTINCT O.ORDER_NUM) AS UNIQUE_ORDERS    -- ʳ������ ��������� ���������
FROM dbo.CUSTOMERS C
LEFT JOIN dbo.ORDERS O                              -- �'������� ��� �볺��� �� ������������
    ON C.CUST_NUM = O.CUST                          -- �'������� �� �볺����
    AND O.ORDER_DATE BETWEEN '20080101' AND '20081231'-- ���������� � 2008 ����
WHERE C.COMPANY LIKE '%CORP%'                       -- Գ�������� �������, �� ������ "CORP"
GROUP BY C.CUST_NUM, MONTH(O.ORDER_DATE)            -- ���������� �� �볺���� �� ������
ORDER BY UNIQUE_ORDERS DESC;                        -- ���������� �� ������� ��������� � ���������� �������

-- �������� 3
SELECT DISTINCT 
    C.CUST_NUM,                                  -- ������������� �볺���
    UPPER(C.COMPANY) AS COMPANY_NAME,           -- ����� ������ � ��������� ������
    P.DESCRIPTION                               -- ���� ��������
FROM dbo.CUSTOMERS C
LEFT JOIN dbo.ORDERS O                          -- �'������� �볺��� �� ������������
    ON C.CUST_NUM = O.CUST                      -- �'������� �� �볺����
    AND O.ORDER_DATE BETWEEN '20080101' AND '20081231'-- ���������� �� 2008 ��
LEFT JOIN dbo.PRODUCTS P                        -- �'������� �� ����������
    ON O.MFR = P.MFR_ID                         -- ��'���� �� ���������� ���������� �� ���������
    AND O.PRODUCT = P.PRODUCT_ID                -- ��'���� �� ����������� �� ���������
WHERE C.COMPANY LIKE '%CORP%';                  -- Գ�������� �볺��� �� "CORP" � ����
