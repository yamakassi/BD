CREATE PROC Определенное_производство_Компании

@company nvarchar(100),
@country nvarchar(100)

AS
SELECT [Серийный номер],Модель,[Страна производства],Состояние
FROM Техника
WHERE [Страна производства] =@country and Компания=@company
