delete from testTable where testId < 500

select TOP(500) * from testTable

USE master;  
RESTORE DATABASE TEST_DB_LAB3 from   
DATABASE_SNAPSHOT = 'testDB_snap'; 
use  TEST_DB_LAB3;
select TOP(1000) * from testTable
