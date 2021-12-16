DECLARE @Name nvarchar(100);   
SET   @Name ='TEST1';

SELECT Z.[Название запчасти],Z.Стоимость,P2.Название as Поставщик,P2.[Откуда поставляет] as Доставлена
FROM Запчасти as Z
 JOIN Поставки as P1 ON P1.[Номер поставки]=Z.[Номер поставки]
 JOIN Поставщики as P2 ON  P1.ID_поставщика=P2.ID_поставщика 
 where Z.[Название запчасти]=@Name
ORDER BY Стоимость