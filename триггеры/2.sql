USE АфанасьевИС;

/* Таблица ЛогКлиент клиент используется в качестве 
журнала логов действий в таблице Project */
GO
CREATE TABLE ЛогПоставщики (
    ID_поставщика int NULL,
    Название nvarchar(50) NULL,
    Date DATETIME NULL,
    РеквизитыСтар nvarchar(50) NULL,
    РеквизитыНовое nvarchar(50) NULL
);

GO
CREATE TRIGGER trigger_МодификКлиент
    ON Поставщики AFTER UPDATE
    AS IF UPDATE(Поставщики)
BEGIN
    DECLARE @РеквизитыСтар nvarchar(300)
    DECLARE @РеквизитыНовое nvarchar(300)
    DECLARE @ID_поставщика int
	 DECLARE @Название nvarchar(50)

    SELECT @РеквизитыСтар = (SELECT Реквизиты FROM deleted)
    SELECT @РеквизитыНовое = (SELECT Реквизиты FROM inserted)
    SELECT @ID_поставщика = (SELECT ID_поставщика FROM deleted)
    SELECT @Название = (SELECT @Название FROM deleted)

    INSERT INTO ЛогПоставщики VALUES
        (@ID_поставщика,@Название,GETDATE(),@РеквизитыСтар,@РеквизитыНовое)
END