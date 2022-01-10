CREATE FUNCTION суммаПоставок(@price int,@startDate date,@endDate date)  
RETURNS int   
AS   
BEGIN  
      
	DECLARE @суммПоставок int;  

	SELECT  @суммПоставок =  SUM(Поставки.[Стоимость поставки]) 
	FROM Поставки
    JOIN Поставщики ON Поставщики.ID_Поставщика=Поставки.ID_поставщика
    WHERE (Поставки.[Дата поставки] BETWEEN @startDate AND @endDate) 
   GROUP BY  Поставщики.Название

HAVING SUM(Поставки.[Стоимость поставки])>@price

     IF (@суммПоставок IS NULL)   
        SET @суммПоставок = 0;  
    RETURN @суммПоставок;  
END;
