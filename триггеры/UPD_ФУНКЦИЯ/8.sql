CREATE FUNCTION fn_ремонтыКомпания
      (@Компания nvarchar (300))
RETURNS TABLE
AS
RETURN 
     (
     SELECT [Серийный номер],Модель,Компания,[Страна производства],Состояние
	 FROM Техника
	 WHERE Компания = @Компания

     )