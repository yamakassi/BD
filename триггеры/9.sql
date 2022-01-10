CREATE TRIGGER triggers_Помещения
ON Помещения
FOR INSERT 
AS
 DECLARE @этаж int
 SELECT @этаж=этаж
 FROM inserted
 IF @этаж=1
  BEGIN 
   PRINT 'ОШИБКА'
   ROLLBACK TRANSACTION
  END