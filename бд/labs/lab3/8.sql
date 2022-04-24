use TEST_DB_LAB3
select TOP(150) * from testTable
declare @i int=101;
while @i>0
begin
	set @i=@i-1; 
	update testTable
	set testName = 'value'+cast(@i*(-1) as nvarchar)
	where testId = @i;
End


backup database TEST_DB_LAB3
to myDumpDevice
with
	name='DbBackDif', DIFFERENTIAL, STATS=10;

