CREATE TRIGGER ��������������� 
ON ����������
FOR DELETE
AS
 IF (SELECT count(*) 
   FROM deleted)>1 
 BEGIN
  PRINT '������ ������� ����� ����� ������'
  ROLLBACK TRANSACTION
 END