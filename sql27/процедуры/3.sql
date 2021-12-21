CREATE PROCEDURE [Модели компании]
@Model nvarchar(50)   
as
SELECT [Серийный номер],Модель,[Страна производства],Состояние
FROM Техника
WHERE Компания = (SELECT Компания
				  FROM Техника
				  GROUP BY Компания,Модель
				  HAVING Модель=@Model)
