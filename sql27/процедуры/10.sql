CREATE PROC �������_��_������

@startDate date,
@endDate date,
@������������� int OUTPUT,
@�������� int OUTPUT
AS
SELECT @������������� = COUNT(*), @�������� = SUM(���������*������/100) 
FROM ���������

WHERE (���������.[���� ��������] BETWEEN @startDate AND @endDate) 
