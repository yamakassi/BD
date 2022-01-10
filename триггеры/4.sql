
/* вид тб поставки
CREATE TABLE [dbo].[Поставки](
	[Номер поставки] [int] IDENTITY(1,1) NOT NULL,
	[ID_поставщика] [int] NOT NULL,
	[Стоимость поставки] [int] NOT NULL,
	[Ед.товара] [int] NOT NULL,
	[ID_сотрудника] [int] NULL,
	[Дата поставки] [date] NULL,
	[СтоимостьЕдТовара]  AS ([Стоимость поставки]/[Ед.товара])
	)*/

	CREATE VIEW view_ВсеПоставки
    AS SELECT *
    FROM Поставки;
	/*
	GO
CREATE TRIGGER trigger_Поставки
    ON view_ВсеПоставки INSTEAD OF INSERT
    AS BEGIN
        INSERT INTO Поставки
        SELECT [Номер поставки],[ID_поставщика],[Стоимость поставки],[Ед.товара] [int],
				[ID_сотрудника],[Дата поставки]
        FROM inserted
END
*/