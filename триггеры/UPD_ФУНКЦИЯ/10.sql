CREATE FUNCTION ����������������(@idpos AS INT)
    RETURNS TABLE AS
    RETURN
        SELECT [���� ��������],ID_����������
        FROM ��������
        WHERE ID_���������� = @idpos
          
