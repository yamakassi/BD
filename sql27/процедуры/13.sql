CREATE PROCEDURE ����������_��������
    
	@idPos int,
	@sum int,
    @countProd NVARCHAR(20),
    @idEpl INT,
    @date date,
    @id INT OUTPUT
AS
    INSERT INTO ��������(ID_����������,[��������� ��������],[��.������],ID_����������,[���� ��������])
    VALUES(@idPos, @sum, @countProd,@idEpl,@date)
    SET @id = @@IDENTITY


