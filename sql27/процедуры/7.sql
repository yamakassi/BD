CREATE PROC [���� ����������]

@id_���������� int,
@��� nvarchar(100) OUTPUT,
@��������������� money OUTPUT

AS 
WITH consts AS (SELECT 0.13 as NDFL)                     
SELECT @��� = ����������.������� + ' ' + ����������.��� + ' ' + ����������.��������,
@��������������� = ����������.�� * consts.NDFL
FROM ����������,consts
WHERE id_���������� = @id_����������;
