CREATE FUNCTION fn_���������������
      (@�������� nvarchar (300))
RETURNS TABLE
AS
RETURN 
     (
     SELECT [�������� �����],������,��������,[������ ������������],���������
	 FROM �������
	 WHERE �������� = @��������

     )