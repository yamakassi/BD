DECLARE @OldDate date;
     
SET   @OldDate = '2016-01-01';

DELETE   FROM    Поставки
WHERE    [Дата поставки]  <= @OldDate;
