CREATE PROC ������������_������������_��������

@company nvarchar(100),
@country nvarchar(100)

AS
SELECT [�������� �����],������,[������ ������������],���������
FROM �������
WHERE [������ ������������] =@country and ��������=@company
