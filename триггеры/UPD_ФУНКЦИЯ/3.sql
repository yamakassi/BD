CREATE FUNCTION �����������(@���� date)  
RETURNS int   
AS   
BEGIN  
    DECLARE @����� int;  
    SELECT @����� = COUNT(p.ID_���������)   
    FROM ��������� as p   
    WHERE p.[���� ��������] = @����   
         
     IF (@����� IS NULL)   
        SET @����� = 0;  
    RETURN @�����;  
END;