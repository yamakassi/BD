CREATE FUNCTION колќбрвƒень(@день date)  
RETURNS int   
AS   
BEGIN  
    DECLARE @число int;  
    SELECT @число = COUNT(p.ID_обращени€)   
    FROM ќбращени€ as p   
    WHERE p.[ƒата прин€ти€] = @день   
         
     IF (@число IS NULL)   
        SET @число = 0;  
    RETURN @число;  
END;