CREATE PROCEDURE СредЗарплата

as
SELECT Фамилия,Имя,ЗП,Должность
FROM Сотрудники as S2
WHERE ЗП > (SELECT AVG(ЗП)
			FROM Сотрудники
			WHERE Сотрудники.Должность=S2.Должность)
ORDER BY Фамилия,имя