


CREATE TRIGGER trigger_������������
ON ����������
AFTER INSERT, UPDATE
AS
DECLARE
@NDFL float
set @NDFL = 0.13
UPDATE ����������
SET �� = �� *(1-@NDFL)
WHERE ID_���������� = (SELECT ID_���������� FROM inserted)