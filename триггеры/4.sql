
/* ��� �� ��������
CREATE TABLE [dbo].[��������](
	[����� ��������] [int] IDENTITY(1,1) NOT NULL,
	[ID_����������] [int] NOT NULL,
	[��������� ��������] [int] NOT NULL,
	[��.������] [int] NOT NULL,
	[ID_����������] [int] NULL,
	[���� ��������] [date] NULL,
	[�����������������]  AS ([��������� ��������]/[��.������])
	)*/

	CREATE VIEW view_�����������
    AS SELECT *
    FROM ��������;
	/*
	GO
CREATE TRIGGER trigger_��������
    ON view_����������� INSTEAD OF INSERT
    AS BEGIN
        INSERT INTO ��������
        SELECT [����� ��������],[ID_����������],[��������� ��������],[��.������] [int],
				[ID_����������],[���� ��������]
        FROM inserted
END
*/