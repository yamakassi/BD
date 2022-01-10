CREATE TRIGGER Products_DELETE
ON Поставки
AFTER DELETE
AS
INSERT INTO ИсторияПоставок (Id,IВ_Поставщика,ID_Сотрудника,Что_Сделано)
SELECT [Номер поставки],ID_поставщика,ID_Сотрудника, 'Удалена поставка от ' + CONVERT(nvarchar,[Дата поставки],1) + ' Поставщик ' +(select Название
																												                    FROM Поставщики
																																	where ID_поставщика=D.ID_поставщика)
FROM DELETED as D