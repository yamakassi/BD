CREATE TRIGGER triggers_���������
ON ���������
FOR INSERT 
AS
 DECLARE @���� int
 SELECT @����=����
 FROM inserted
 IF @����=1
  BEGIN 
   PRINT '������'
   ROLLBACK TRANSACTION
  END