
CREATE FUNCTION заплоченоналогов(@id_сотрудника int)  
RETURNS int   
AS   
BEGIN  
    DECLARE @налогЗаплочено int;  

	SELECT 	 @налогЗаплочено=s.ЗП *0.13
	FROM Сотрудники as s
	WHERE id_сотрудника = @id_сотрудника;

     IF (@налогЗаплочено IS NULL)   
        SET @налогЗаплочено = 0;  
    RETURN @налогЗаплочено;  
END;