/* Запит для отримання списку офісів східного регіону з ціллю по продажах, меншою або рівною 350000: */

SELECT 
    OFFICE, 
    City, 
    [MGR]
FROM 
    dbo.OFFICES 
WHERE 
    Region = 'East' 
    AND Target <= 350000.00;

/* Запит для отримання списку замовлень, що були проведені не в 2008 році і мають ідентифікатор товару, де другим символом є «A» або де будь-який символ — «0»: */

SELECT 
    * 
FROM 
    dbo.ORDERS 
WHERE 
    [ORDER_DATE] NOT BETWEEN '20080101' AND '20081231' 
    AND ([PRODUCT] LIKE '_A%' OR [PRODUCT] LIKE '%0%');

/* Запит для отримання загальної суми проведених замовлень по ідентифікаторам виробника товарів, де замовлення здійснено не в 2008 році, а ідентифікатор товару має другим символом «A» або містить «0»: */

SELECT 
    MFR, 
    COUNT(DISTINCT [ORDER_NUM]) AS UniqueOrdersCount, 
    SUM([AMOUNT]) AS TotalOrderAmount 
FROM 
    dbo.ORDERS 
WHERE 
    [ORDER_DATE] NOT BETWEEN '20080101' AND '20081231' 
    AND ( [PRODUCT] LIKE '_A%' OR  [PRODUCT] LIKE '%0%') 
GROUP BY 
    MFR 
ORDER BY 
    TotalOrderAmount ASC;

/* Запит для отримання ідентифікатора виробника з найбільшою загальною сумою проведених замовлень. Використовується WITH TIES, щоб врахувати випадок, коли кілька виробників мають однакову суму: */


SELECT TOP 1 WITH TIES 
    MFR, 
    SUM([AMOUNT]) AS TotalOrderAmount 
FROM 
    dbo.ORDERS 
WHERE 
     [ORDER_DATE] NOT BETWEEN '20080101' AND '20081231' 
    AND ( [PRODUCT] LIKE '_A%' OR [PRODUCT] LIKE '%0%') 
GROUP BY 
    MFR 
ORDER BY 
    TotalOrderAmount DESC;

/* Запит для отримання ідентифікатора офісу з найбільшою кількістю працівників на посаді Sales Rep, віком 29, 45 або 48 років. Використовується WITH TIES, щоб врахувати офіси з однаковою кількістю працівників: */

SELECT TOP 1 WITH TIES 
    [REP_OFFICE], 
    COUNT([EMPL_NUM]) AS EmployeeCount 
FROM 
    dbo.SALESREPS 
WHERE 
     [TITLE]= 'Sales Rep' 
    AND Age IN (29, 45, 48) 
GROUP BY 
    [REP_OFFICE]
ORDER BY 
    EmployeeCount DESC;