CREATE FUNCTION запчастиПоставки(@idpos AS INT)
    RETURNS TABLE AS
    RETURN
        SELECT [Дата поставки],ID_поставщика
        FROM Поставки
        WHERE ID_поставщика = @idpos
          
