CREATE FUNCTION fn_���������������������
    (@��������� nvarchar(200))
RETURNS @������������ TABLE 
    ( 
    �������� nvarchar(80), 
    ���������  int, 
    ��������� nvarchar(200), 
    ���������� date 
    )
AS
BEGIN 
    INSERT @������������ 
		SELECT S.������� +' ' + S.��� + ' ' + S.�������� as ���������,S.�������,S.���������,S.[���� ������]
		FROM ���������� as S
	where S.���������=@���������
    RETURN
END
