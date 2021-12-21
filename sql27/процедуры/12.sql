CREATE PROCEDURE [���-�� �������� � ������]
@price int,
@startDate date,
@endDate date 

as
SELECT  ����������.��������, SUM(��������.[��������� ��������])
FROM ��������
 JOIN ���������� ON ����������.ID_����������=��������.ID_����������
 WHERE (��������.[���� ��������] BETWEEN @startDate AND @endDate) 
GROUP BY  ����������.��������

HAVING SUM(��������.[��������� ��������])>@price
