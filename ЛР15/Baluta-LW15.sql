SELECT MFR, Product
FROM (
    SELECT MFR, Product, ROW_NUMBER() OVER (PARTITION BY MFR, Product ORDER BY MFR) AS RowNum
    FROM [dbo].[ORDERS]
) AS Subquery
WHERE RowNum = 1;

SELECT MFR, Product, OrderCount
FROM (
    SELECT MFR, Product, COUNT(*) AS OrderCount, ROW_NUMBER() OVER (PARTITION BY MFR, Product ORDER BY COUNT(*) DESC) AS RowNum
    FROM [dbo].[ORDERS]
    GROUP BY MFR, Product
) AS Subquery
WHERE OrderCount > 1;

SELECT Title, NAME, Hire_Date, ExperienceYears
FROM (
    SELECT Title, NAME, Hire_Date, DATEDIFF(YEAR, Hire_Date, GETDATE()) AS ExperienceYears, DENSE_RANK() OVER (PARTITION BY Title ORDER BY DATEDIFF(YEAR, Hire_Date, GETDATE()) DESC) AS Rank
    FROM [dbo].[SALESREPS]
) AS Subquery
WHERE Rank = 1;