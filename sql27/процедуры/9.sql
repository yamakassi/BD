CREATE PROCEDURE [Увольнение сотрудника]
@ID_сотрудника int
AS
DELETE Сотрудники
WHERE Сотрудники.ID_сотрудника = @ID_сотрудника
