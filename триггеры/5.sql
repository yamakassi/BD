


CREATE TRIGGER trigger_ЗапчастиСтоимость
ON Запчасти
AFTER INSERT, UPDATE
AS
DECLARE
@NDS float
set @NDS = 0.2
UPDATE Запчасти
SET Стоимость = Стоимость *(1+@NDS)
WHERE ID_запчасти = (SELECT ID_запчасти FROM inserted)