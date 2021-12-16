DECLARE @Model nvarchar(50);   
SET   @Model ='HuaweiMate30PRO';

SELECT [Серийный номер],Модель,[Страна производства],Состояние
FROM Техника
WHERE Компания = (SELECT Компания
				  FROM Техника
				  GROUP BY Компания,Модель
				  HAVING Модель=@Model)
