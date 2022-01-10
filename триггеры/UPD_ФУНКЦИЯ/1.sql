CREATE FUNCTION fn_ремонтыМодели
      (@Модель nvarchar (300))
RETURNS TABLE
AS
RETURN 
     (
     SELECT [Серийный номер],Модель,[Страна производства],Состояние
	 FROM Техника
	 WHERE Модель = @Модель

     )