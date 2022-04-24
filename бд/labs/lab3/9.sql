use TEST_DB_LAB3
delete from testTable where testId>3;
select * from testTable

USE master
BACKUP LOG Test_DB_LAB3 TO  DISK = 'C:\Test_DB\test_DB_LogBackup.bak' WITH NAME = 'LogBackup', NORECOVERY, STATS = 5;
RESTORE DATABASE Test_DB_LAB3 FROM  myDumpDevice WITH  FILE = 1,  NORECOVERY,   STATS = 5
RESTORE DATABASE Test_DB_LAB3 FROM  myDumpDevice WITH  FILE = 2, STATS=5

GO

SELECT TOP (1000) *
  FROM testTable

backup database TEST_DB_LAB3
to myDumpDevice
with
	name='DbBackDif', DIFFERENTIAL, STATS=10;

	    FILENAME=
       'C:\Test_DB\fg1_file1.mdf',
    SIZE=4MB,
