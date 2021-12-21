CREATE PROCEDURE Добавление_Поставки
    
	@idPos int,
	@sum int,
    @countProd NVARCHAR(20),
    @idEpl INT,
    @date date,
    @id INT OUTPUT
AS
    INSERT INTO Поставки(ID_поставщика,[Стоимость поставки],[Ед.товара],ID_сотрудника,[Дата поставки])
    VALUES(@idPos, @sum, @countProd,@idEpl,@date)
    SET @id = @@IDENTITY


