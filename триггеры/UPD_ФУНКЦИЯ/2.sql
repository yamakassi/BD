CREATE FUNCTION fn_�������������� 
    (@NameDet nvarchar(200))
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
		SELECT Z.[�������� ��������],Z.���������,P2.�������� as ���������,P2.[������ ����������] as ����������
		FROM �������� as Z JOIN �������� as P1 ON P1.[����� ��������]=Z.[����� ��������] JOIN ���������� as P2 ON  P1.ID_����������=P2.ID_���������� 
	where Z.[�������� ��������]=@NameDet
    RETURN
END