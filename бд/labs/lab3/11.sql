use TEST_DB_LAB3
delete from testTable where testId>1;
select * from testTable
use master
go
BACKUP LOG TEST_DB_LAB3 TO  DISK = 'C:\Test_DB\LogBackup.bak' 
	WITH NAME = 'LogBackup', NORECOVERY ,  STATS = 5;
RESTORE DATABASE TEST_DB_LAB3 FROM  myDumpDevice WITH  FILE = 1,  NORECOVERY,    STATS = 5
RESTORE DATABASE TEST_DB_LAB3 FROM  myDumpDevice WITH  FILE = 2,  NORECOVERY,    STATS = 5
RESTORE LOG TEST_DB_LAB3 FROM  myDumpDevice WITH  FILE = 3,  NORECOVERY,    STATS = 5
RESTORE LOG TEST_DB_LAB3 FROM  myDumpDevice WITH  FILE = 4,  STATS = 5

GO
use TEST_DB_LAB3
SELECT TOP (1000) *
  FROM testTable
