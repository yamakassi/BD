use master
go
create database TEST_DB_LAB3
ON PRIMARY
  ( NAME='DB_Main',
    FILENAME=
       'C:\Test_DB\fg1_file1.mdf',
    SIZE=4MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB),
filegroup db_fg1
	(Name='fg1_file1',
	filename = 'C:\Test_DB\fg1_file1.ndf',
	size=4mb,
	maxsize=20mb,
	filegrowth=1mb
	),
	(Name='fg1_file2',
	filename = 'C:\Test_DB\fg1_file2.ndf',
	size=4mb,
	maxsize=20mb,
	filegrowth=1mb
	),
filegroup db_fg2
	(Name='fg2_file1',
	filename = 'C:\Test_DB\fg2_file1.ndf',
	size=4mb,
	maxsize=20mb,
	filegrowth=1mb
	),
	(Name='fg2_file2',
	filename = 'C:\Test_DB\fg2_file2.ndf',
	size=4mb,
	maxsize=20mb,
	filegrowth=1mb
	),
filegroup db_fg3
	(Name='fg3_file1',
	filename = 'C:\Test_DB\fg3_file1.ndf',
	size=4mb,
	maxsize=20mb,
	filegrowth=1mb
	),
	(Name='fg3_file2',
	filename = 'C:\Test_DB\fg3_file2.ndf',
	size=4mb,
	maxsize=20mb,
	filegrowth=1mb
	)
LOG ON
  ( NAME='Test_DB_LOG_1',
    FILENAME =
       'C:\Test_DB\log_1.ldf',
    SIZE=1MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB),
	( NAME='Test_DB_LOG_2',
    FILENAME =
       'C:\Test_DB\log_2.ldf',
    SIZE=1MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB);
go
alter database TEST_DB_LAB3 set recovery full 
select name, recovery_model_desc
from sys.databases
where name = 'TEST_DB_LAB3'
