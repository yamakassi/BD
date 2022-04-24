use master
go
create database testDB_snap
ON PRIMARY
  ( NAME='DB_Main',
    FILENAME=
       'C:\Test_DB\snap_1\fg1_file1.mdf'
	   ),
	(Name='fg1_file1',
	filename = 'C:\Test_DB\snap_1\fg1_file1.ndf'
	),
	(Name='fg1_file2',
	filename = 'C:\Test_DB\snap_1\fg1_file2.ndf'
	),
	(Name='fg2_file1',
	filename = 'C:\Test_DB\snap_1\fg2_file1.ndf'
	),
	(Name='fg2_file2',
	filename = 'C:\Test_DB\snap_1\fg2_file2.ndf'
	),
	(Name='fg3_file1',
	filename = 'C:\Test_DB\snap_1\fg3_file1.ndf'
	),
	(Name='fg3_file2',
	filename = 'C:\Test_DB\snap_1\fg3_file2.ndf'
	)
	AS SNAPSHOT OF TEST_DB_LAB3;  
GO  
