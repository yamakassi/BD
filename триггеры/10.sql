CREATE TRIGGER triggers_ОбрСкидка
ON Обращения
FOR INSERT 
AS
 DECLARE @скидка int
 SELECT @скидка=Скидка
 FROM inserted
 IF (@скидка%10=0 and @скидка%10=5)
  BEGIN 
   PRINT 'ОШИБКА'
   ROLLBACK TRANSACTION
  END