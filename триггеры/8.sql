CREATE TRIGGER Products_DELETE
ON ��������
AFTER DELETE
AS
INSERT INTO ��������������� (Id,I�_����������,ID_����������,���_�������)
SELECT [����� ��������],ID_����������,ID_����������, '������� �������� �� ' + CONVERT(nvarchar,[���� ��������],1) + ' ��������� ' +(select ��������
																												                    FROM ����������
																																	where ID_����������=D.ID_����������)
FROM DELETED as D