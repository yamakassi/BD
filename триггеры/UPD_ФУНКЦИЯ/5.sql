
CREATE FUNCTION потраченоЌа—кидки(@startDate date,@endDate date)  
RETURNS int   
AS   
BEGIN  
      
	DECLARE @общ—умма int;  

	SELECT  @общ—умма = SUM(—тоимость*—кидка/100) 
	FROM ќбращени€
	WHERE (ќбращени€.[ƒата прин€ти€] BETWEEN @startDate AND @endDate) 

     IF (@общ—умма IS NULL)   
        SET @общ—умма = 0;  
    RETURN @общ—умма;  
END;
