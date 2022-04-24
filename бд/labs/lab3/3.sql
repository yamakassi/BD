USE TEST_DB_LAB3
GO
EXEC sp_addumpdevice 'disk', 'myDumpDevice', 'C:\Test_DB\myDevice.bak' ;  
GO  
