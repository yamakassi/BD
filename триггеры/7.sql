CREATE TRIGGER Клиент_INSERT
ON  Поставки
AFTER INSERT
AS
INSERT INTO ИсторияПоставок (Id,IВ_Поставщика,ID_Сотрудника,Что_Сделано)
SELECT [Номер поставки],ID_поставщика,ID_Сотрудника, 'Добавлен поставка от ' + CONVERT(nvarchar,[Дата поставки],1) + ' и стоимостью' + [Стоимость поставки]
FROM INSERTED