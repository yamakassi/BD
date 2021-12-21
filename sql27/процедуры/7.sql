CREATE PROC [НДФЛ сотрудника]

@id_сотрудника int,
@ФИО nvarchar(100) OUTPUT,
@подоходныйНалог money OUTPUT

AS 
WITH consts AS (SELECT 0.13 as NDFL)                     
SELECT @ФИО = Сотрудники.Фамилия + ' ' + Сотрудники.Имя + ' ' + Сотрудники.Отчество,
@подоходныйНалог = Сотрудники.ЗП * consts.NDFL
FROM Сотрудники,consts
WHERE id_сотрудника = @id_сотрудника;
