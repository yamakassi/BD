


CREATE TRIGGER trigger_�����������������
ON ��������
AFTER INSERT, UPDATE
AS
DECLARE
@NDS float
set @NDS = 0.2
UPDATE ��������
SET ��������� = ��������� *(1+@NDS)
WHERE ID_�������� = (SELECT ID_�������� FROM inserted)