

GO
CREATE TRIGGER trigger_ОбновлениеСтоимости
    ON Запчасти AFTER UPDATE
    AS IF UPDATE (Стоимость)
BEGIN
    DECLARE @sum_old
    FLOAT DECLARE @sum_new int

    SELECT @sum_new = (SELECT SUM(Стоимость) FROM inserted)
    SELECT @sum_old = (SELECT SUM(p.Стоимость)
        FROM Запчасти p WHERE p.ID_запчасти
            NOT IN (SELECT d.ID_запчасти FROM deleted d))
   
    
    IF @sum_new > @sum_old * 1.5
    BEGIN
        PRINT 'Бюджет не изменился'
        ROLLBACK TRANSACTION
    END
    ELSE
        PRINT 'Изменение бюджета выполнено'
END