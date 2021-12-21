CREATE PROCEDURE [Удаление старых поставок]
 @OldDate date
as
DELETE   FROM    Поставки
WHERE    [Дата поставки]  <= @OldDate;
