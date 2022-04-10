set implicit_transactions on --неявных транзакций (автокоммит отключен)
set transaction isolation level read uncommitted
set transaction isolation level read committed
set transaction isolation level repeatable read
set transaction isolation level serializable
set transaction isolation level snapshot
update diagnosis set block = 3 where id_diagnosis = 30
insert into diagnosis values 
('fg',3,3)
select * from diagnosis where block=3
select @@TRANCOUNT
commit
rollback