CREATE VIEW  [������] AS
SELECT K.�������,+K.���, K.��������,K.�������,K.email,
		O.ID_���������,
	 S.�������+' '+S.���+' '+S.�������� as ���������,S.���������
FROM ��������� as O
JOIN ���������� as S ON O.ID_c���������=S.ID_����������
JOIN ������� as K ON O.ID_�������=K.������_ID
