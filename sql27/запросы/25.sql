DECLARE @Name nvarchar(100);   
SET   @Name ='TEST1';

SELECT Z.[�������� ��������],Z.���������,P2.�������� as ���������,P2.[������ ����������] as ����������
FROM �������� as Z
 JOIN �������� as P1 ON P1.[����� ��������]=Z.[����� ��������]
 JOIN ���������� as P2 ON  P1.ID_����������=P2.ID_���������� 
 where Z.[�������� ��������]=@Name
ORDER BY ���������