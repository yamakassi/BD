CREATE PROCEDURE ������������

as
SELECT �������,���,��,���������
FROM ���������� as S2
WHERE �� > (SELECT AVG(��)
			FROM ����������
			WHERE ����������.���������=S2.���������)
ORDER BY �������,���