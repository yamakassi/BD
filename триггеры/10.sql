CREATE TRIGGER triggers_���������
ON ���������
FOR INSERT 
AS
 DECLARE @������ int
 SELECT @������=������
 FROM inserted
 IF (@������%10=0 and @������%10=5)
  BEGIN 
   PRINT '������'
   ROLLBACK TRANSACTION
  END