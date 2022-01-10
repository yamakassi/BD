CREATE FUNCTION fn_осталосьШтук
    (@NameDet nvarchar(200))
RETURNS int   
AS   
BEGIN  
      
	DECLARE @штук int;  

	SELECT  @штук = COUNT(*) 
	FROM Запчасти
	WHERE [Название запчасти] = @NameDet

     IF (@штук IS NULL)   
        SET @штук = 0;  
    RETURN @штук;  
END;
