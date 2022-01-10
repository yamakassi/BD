


CREATE TRIGGER trigger_СотрудникиЗп
ON Сотрудники
AFTER INSERT, UPDATE
AS
DECLARE
@NDFL float
set @NDFL = 0.13
UPDATE Сотрудники
SET ЗП = ЗП *(1-@NDFL)
WHERE ID_сотрудника = (SELECT ID_сотрудника FROM inserted)