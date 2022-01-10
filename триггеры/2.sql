USE �����������;

/* ������� ��������� ������ ������������ � �������� 
������� ����� �������� � ������� Project */
GO
CREATE TABLE ������������� (
    ID_���������� int NULL,
    �������� nvarchar(50) NULL,
    Date DATETIME NULL,
    ������������� nvarchar(50) NULL,
    �������������� nvarchar(50) NULL
);

GO
CREATE TRIGGER trigger_�������������
    ON ���������� AFTER UPDATE
    AS IF UPDATE(����������)
BEGIN
    DECLARE @������������� nvarchar(300)
    DECLARE @�������������� nvarchar(300)
    DECLARE @ID_���������� int
	 DECLARE @�������� nvarchar(50)

    SELECT @������������� = (SELECT ��������� FROM deleted)
    SELECT @�������������� = (SELECT ��������� FROM inserted)
    SELECT @ID_���������� = (SELECT ID_���������� FROM deleted)
    SELECT @�������� = (SELECT @�������� FROM deleted)

    INSERT INTO ������������� VALUES
        (@ID_����������,@��������,GETDATE(),@�������������,@��������������)
END