
CREATE FUNCTION �����������������(@startDate date,@endDate date)  
RETURNS int   
AS   
BEGIN  
      
	DECLARE @�������� int;  

	SELECT  @�������� = SUM(���������*������/100) 
	FROM ���������
	WHERE (���������.[���� ��������] BETWEEN @startDate AND @endDate) 

     IF (@�������� IS NULL)   
        SET @�������� = 0;  
    RETURN @��������;  
END;
