create table testTable(
	testId int not null Identity(1,1) primary key,
	testName nvarchar(50) not null,
	testInt int
)
on db_fg1;

set implicit_transactions 
use TEST_DB_LAB3
go
declare @i int =0;
while @i <= 200000

begin
	set @i=@i + 1;
	insert into testTable(testName, testInt) values('test'+cast(@i as nvarchar(15)), @i);
End
commit
select count(*)
from testTable
