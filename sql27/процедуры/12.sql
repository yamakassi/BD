CREATE PROCEDURE [Кол-во поставок в период]
@price int,
@startDate date,
@endDate date 

as
SELECT  Поставщики.Название, SUM(Поставки.[Стоимость поставки])
FROM Поставки
 JOIN Поставщики ON Поставщики.ID_Поставщика=Поставки.ID_поставщика
 WHERE (Поставки.[Дата поставки] BETWEEN @startDate AND @endDate) 
GROUP BY  Поставщики.Название

HAVING SUM(Поставки.[Стоимость поставки])>@price
