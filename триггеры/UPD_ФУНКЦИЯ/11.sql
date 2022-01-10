CREATE TRIGGER удалПоставщиков 
ON Поставщики
FOR DELETE
AS
 IF (SELECT count(*) 
   FROM deleted)>1 
 BEGIN
  PRINT 'Нельзя удалять более одной строки'
  ROLLBACK TRANSACTION
 END