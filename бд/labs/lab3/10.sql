BACKUP LOG TEST_DB_LAB3 TO  myDumpDevice  WITH NAME = 'LogBackup2', SKIP, NOREWIND,  STATS = 10

use TEST_DB_LAB3
go
begin tran
	insert into testTable(testName, testInt) values('valTemp', 42);
commit
begin tran
	update testTable 
	set testName='val-1 upd' where testName='value-1'
commit
begin tran
	update testTable 
	set testName='val-2 upd' where testName='value-2'
commit
begin tran the_third
with mark 'i_am_the_third'
	update testTable 
	set testName='val-3 upd' where testName='value-3'
commit
begin tran
	update testTable 
	set testName='val-4 upd' where testName='value-4'
commit
begin tran
	update testTable 
	set testName='val-5 upd' where testName='value-5'
Commit



BACKUP LOG TEST_DB_LAB3 TO  myDumpDevice  WITH NAME = 'LogBackup3', SKIP, NOREWIND,  STATS = 10
