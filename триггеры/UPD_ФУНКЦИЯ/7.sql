CREATE FUNCTION fn_сотрудникиПоДолжности
    (@должность nvarchar(200))
RETURNS @ЗапчПоставки TABLE 
    ( 
    Название nvarchar(80), 
    Стоимость  int, 
    Поставщик nvarchar(200), 
    Доставлена date 
    )
AS
BEGIN 
    INSERT @ЗапчПоставки 
		SELECT S.Фамилия +' ' + S.Имя + ' ' + S.Отчество as Сотрудник,S.Телефон,S.Должность,S.[Спец навыки]
		FROM Сотрудники as S
	where S.Должность=@должность
    RETURN
END
