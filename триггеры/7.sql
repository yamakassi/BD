CREATE TRIGGER ������_INSERT
ON  ��������
AFTER INSERT
AS
INSERT INTO ��������������� (Id,I�_����������,ID_����������,���_�������)
SELECT [����� ��������],ID_����������,ID_����������, '�������� �������� �� ' + CONVERT(nvarchar,[���� ��������],1) + ' � ����������' + [��������� ��������]
FROM INSERTED