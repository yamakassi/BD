CREATE FUNCTION �������������(@price int,@startDate date,@endDate date)  
RETURNS int   
AS   
BEGIN  
      
	DECLARE @������������ int;  

	SELECT  @������������ =  SUM(��������.[��������� ��������]) 
	FROM ��������
    JOIN ���������� ON ����������.ID_����������=��������.ID_����������
    WHERE (��������.[���� ��������] BETWEEN @startDate AND @endDate) 
   GROUP BY  ����������.��������

HAVING SUM(��������.[��������� ��������])>@price

     IF (@������������ IS NULL)   
        SET @������������ = 0;  
    RETURN @������������;  
END;
