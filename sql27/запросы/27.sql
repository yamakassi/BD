DECLARE @Model nvarchar(50);   
SET   @Model ='HuaweiMate30PRO';

SELECT [�������� �����],������,[������ ������������],���������
FROM �������
WHERE �������� = (SELECT ��������
				  FROM �������
				  GROUP BY ��������,������
				  HAVING ������=@Model)
