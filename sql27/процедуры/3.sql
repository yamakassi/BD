CREATE PROCEDURE [������ ��������]
@Model nvarchar(50)   
as
SELECT [�������� �����],������,[������ ������������],���������
FROM �������
WHERE �������� = (SELECT ��������
				  FROM �������
				  GROUP BY ��������,������
				  HAVING ������=@Model)
