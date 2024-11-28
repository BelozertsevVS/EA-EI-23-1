--- Завдання 1. Аналіз продажів виробників ---
SELECT MFR AS Manufacturer, 
       SUM(AMOUNT) AS Total_Sales
FROM ORDERS
WHERE YEAR(ORDER_DATE) = 2008
GROUP BY MFR
ORDER BY MFR;

--- Завдання 2. Статистика робочого стажу працівників ---
SELECT DATEDIFF(YEAR, HIRE_DATE, GETDATE()) AS Years_Of_Service, 
       COUNT(*) AS Employee_Count
FROM SALESREPS
GROUP BY DATEDIFF(YEAR, HIRE_DATE, GETDATE())
ORDER BY Employee_Count DESC;

--- Завдання 3. Аналіз найму працівників за періодами ---
SELECT YEAR(HIRE_DATE) AS Hire_Year, 
       MONTH(HIRE_DATE) AS Hire_Month, 
       COUNT(*) AS Hired_Count
FROM SALESREPS
GROUP BY YEAR(HIRE_DATE), MONTH(HIRE_DATE)
ORDER BY Hire_Year, Hire_Month;
