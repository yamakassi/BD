
CREATE FUNCTION ����������������(@id_���������� int)  
RETURNS int   
AS   
BEGIN  
    DECLARE @�������������� int;  

	SELECT 	 @��������������=s.�� *0.13
	FROM ���������� as s
	WHERE id_���������� = @id_����������;

     IF (@�������������� IS NULL)   
        SET @�������������� = 0;  
    RETURN @��������������;  
END;