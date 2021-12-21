CREATE PROC Расходы_на_скидки

@startDate date,
@endDate date,
@колвоКлиентов int OUTPUT,
@общСумма int OUTPUT
AS
SELECT @колвоКлиентов = COUNT(*), @общСумма = SUM(Стоимость*Скидка/100) 
FROM Обращения

WHERE (Обращения.[Дата принятия] BETWEEN @startDate AND @endDate) 
