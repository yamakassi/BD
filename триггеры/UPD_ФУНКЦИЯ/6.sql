CREATE FUNCTION fn_������������
    (@NameDet nvarchar(200))
RETURNS int   
AS   
BEGIN  
      
	DECLARE @���� int;  

	SELECT  @���� = COUNT(*) 
	FROM ��������
	WHERE [�������� ��������] = @NameDet

     IF (@���� IS NULL)   
        SET @���� = 0;  
    RETURN @����;  
END;
