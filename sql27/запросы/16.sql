SELECT Z.[�������� ��������],Z.���������,P1.ID_���������� as ���������,P2.[������ ����������] as ����������
FROM �������� as Z
 JOIN �������� as P1 ON P1.[����� ��������]=Z.[����� ��������]
 JOIN ���������� as P2 ON  P1.ID_����������=P2.ID_���������� 
ORDER BY ����������
