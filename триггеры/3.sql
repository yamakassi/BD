

GO
CREATE TRIGGER trigger_�������������������
    ON �������� AFTER UPDATE
    AS IF UPDATE (���������)
BEGIN
    DECLARE @sum_old
    FLOAT DECLARE @sum_new int

    SELECT @sum_new = (SELECT SUM(���������) FROM inserted)
    SELECT @sum_old = (SELECT SUM(p.���������)
        FROM �������� p WHERE p.ID_��������
            NOT IN (SELECT d.ID_�������� FROM deleted d))
   
    
    IF @sum_new > @sum_old * 1.5
    BEGIN
        PRINT '������ �� ���������'
        ROLLBACK TRANSACTION
    END
    ELSE
        PRINT '��������� ������� ���������'
END