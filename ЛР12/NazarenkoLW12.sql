Use WebStor;
/*Використала базу даних WebStor*/

/*Завдання 1
Створила SQL-запит, який агрегує загальну суму продажів по кожному виробнику за 2008 рік*/
SELECT 
    MFR AS ManufacturerID,
    SUM(AMOUNT) AS TotalSales
FROM 
    ORDERS
WHERE 
    YEAR(ORDER_DATE) = 2008
GROUP BY 
    MFR
ORDER BY 
    MFR ASC;

/*Завдання 2
Визначила кількість працівників залежно від стажу*/
SELECT 
    DATEDIFF(YEAR, HIRE_DATE, GETDATE()) AS YearsOfService,
    COUNT(EMPL_NUM) AS EmployeeCount
FROM 
    SALESREPS
GROUP BY 
    DATEDIFF(YEAR, HIRE_DATE, GETDATE())
ORDER BY 
    EmployeeCount DESC;

/*Завдання 3
Проаналізувала найм працівників за роками та місяцями*/
SELECT     
YEAR(HIRE_DATE) AS HireYear,    
MONTH(HIRE_DATE) AS HireMonth,    
COUNT(EMPL_NUM) AS HiredCount
FROM     
SALESREPS
GROUP BY     YEAR(HIRE_DATE),
MONTH(HIRE_DATE)ORDER BY     
HireYear ASC, HireMonth ASC;

