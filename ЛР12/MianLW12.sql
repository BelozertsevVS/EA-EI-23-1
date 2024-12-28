-- Задача 1 Аналіз продажів виробників
SELECT MFR, 
    SUM(AMOUNT) AS TOTAL_SALES               -- Обчислення загальної суми продажів
FROM [dbo].[ORDERS]
WHERE YEAR(ORDER_DATE) = 2008                -- Вибірка замовлень, виконаних у 2008 році
GROUP BY MFR                                -- Групування за ідентифікатором виробника
ORDER BY MFR ASC;                           -- Сортування результатів за виробником у порядку зростання

-- Задача 2 Статистика робочого стажу працівників
SELECT 
    DATEDIFF(YEAR, HIRE_DATE, GETDATE()) AS YEARS_OF_SERVICE, -- Розрахунок років роботи працівників
    COUNT(EMPL_NUM) AS EMP_COUNT                            -- Підрахунок кількості працівників для кожного періоду
FROM [dbo].[SALESREPS]
GROUP BY DATEDIFF(YEAR, HIRE_DATE, GETDATE())               -- Групування за кількістю років роботи
ORDER BY EMP_COUNT DESC;                                    -- Сортування за кількістю працівників у спадаючому порядку

-- Задача 3 Аналіз найму працівників за періодами
SELECT 
    YEAR(HIRE_DATE) AS HIRE_YEAR,          -- Виділення року найму
    MONTH(HIRE_DATE) AS HIRE_MONTH,        -- Виділення місяця найму
    COUNT(EMPL_NUM) AS HIRED_COUNT         -- Підрахунок кількості наймів
FROM [dbo].[SALESREPS]
GROUP BY 
    YEAR(HIRE_DATE),                       -- Групування за роком
    MONTH(HIRE_DATE)                       -- Групування за місяцем
ORDER BY 
    HIRE_YEAR ASC,                         -- Сортування за роком у зростаючому порядку
    HIRE_MONTH ASC;                        -- Сортування за місяцем у зростаючому порядку

