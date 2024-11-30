-- Задача 1 Аналіз продажів виробників

SELECT 
    MFR AS Manufacturer, -- Виводимо ідентифікатор виробника
    SUM(TOTAL) AS TOTAL_SALES -- Підраховуємо загальну суму продажів для кожного виробника
FROM 
    [dbo].[ORDERS]
WHERE 
    YEAR(OrderDate) = 2008 -- Фільтруємо дані за 2008 рік
GROUP BY 
    MFR -- Групуємо результати за ідентифікатором виробника
ORDER BY 
    MFR ASC; -- Сортуємо за виробником у зростаючому порядку


-- Задача 2 Статистика робочого стажу працівників

SELECT 
    DATEDIFF(YEAR, HireDate, GETDATE()) AS YEARS_OF_SERVICE, -- Визначаємо кількість повних років роботи
    COUNT(EMP_NUM) AS EMP_COUNT -- Рахуємо кількість працівників у кожній групі стажу
FROM 
    [dbo].[SALESREPS]
GROUP BY 
    DATEDIFF(YEAR, HireDate, GETDATE()) -- Групуємо працівників за кількістю років стажу
ORDER BY 
    EMP_COUNT DESC; -- Сортуємо за кількістю працівників у спадному порядку


-- Задача 3 Аналіз найму працівників за періодами

SELECT 
    YEAR(HireDate) AS HIRE_YEAR, -- Витягуємо рік найму
    MONTH(HireDate) AS HIRE_MONTH, -- Витягуємо місяць найму
    COUNT(EMP_NUM) AS HIRED_COUNT -- Підраховуємо кількість працівників, найнятих у цей період
FROM 
    [dbo].[SALESREPS]
GROUP BY 
    YEAR(HireDate), MONTH(HireDate) -- Групуємо за роком і місяцем найму
ORDER BY 
    HIRE_YEAR ASC, -- Сортуємо за роком найму у зростаючому порядку
    HIRE_MONTH ASC; -- Сортуємо за місяцем найму у зростаючому порядку

