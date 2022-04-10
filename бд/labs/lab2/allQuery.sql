
set implicit_transactions on --������� ���������� (���������� ��������)
 set implicit_transactions off --��������� ����������
set transaction isolation level read uncommitted
set transaction isolation level read committed
set transaction isolation level repeatable read
set transaction isolation level serializable
set transaction isolation level snapshot


begin tran 
rollback 
commit

select @@trancount


SET XACT_ABORT ON
DECLARE @name1 nvarchar(100) = 'kirril',
		@name2 nvarchar(100) = null;
BEGIN TRANSACTION
select * from patients
update patients set name = @name1 where id_patient = 4

update patients set name = @name2 where id_patient = 5
COMMIT TRANSACTION
select * from patients
<!--�2==����� ���������� 1) ������ ����� ���������� � ����� ������ ���������� � ���������-->
SET IMPLICIT_TRANSACTIONS OFF
PRINT @@TRANCOUNT

BEGIN TRANSACTION
PRINT @@TRANCOUNT
select * from diagnosis
insert into diagnosis values 
('migren',4,1)
PRINT @@TRANCOUNT


DELETE FROM diagnosis 
WHERE [name] ='spod'
PRINT @@TRANCOUNT

COMMIT TRANSACTION
PRINT @@TRANCOUNT
select * from diagnosis

<!--�2==����� ���������� 2) ����� ���������� � ������� ������ ����������-->

SET IMPLICIT_TRANSACTIONS ON
select @@TRANCOUNT

BEGIN TRANSACTION
select @@TRANCOUNT
select * from diagnosis
insert into diagnosis values 
('migren wrc',4,1)
select @@TRANCOUNT


DELETE FROM diagnosis 
WHERE [name] ='yazva'
select @@TRANCOUNT 

COMMIT TRANSACTION
select @@TRANCOUNT
select * from diagnosis
<!--�2==�� ����� ���������� 1)	������� ���������� � ����� ������ ����������-->
SET IMPLICIT_TRANSACTIONS OFF
select @@TRANCOUNT

select * from diagnosis
insert into diagnosis values 
('sqlvitoz',4,1)
select @@TRANCOUNT


DELETE FROM diagnosis 
WHERE [name] ='migren'
select @@TRANCOUNT


PRINT @@TRANCOUNT
select * from diagnosis
<!--�2==�� ����� ���������� 2) ������� ���������� � ������� ������ ����������-->
SET IMPLICIT_TRANSACTIONS on
select @@TRANCOUNT


select * from diagnosis
insert into diagnosis values 
('sqlvitoz 2',3,2)
select @@TRANCOUNT


DELETE FROM diagnosis 
WHERE [name] ='gangren'
select @@TRANCOUNT

COMMIT TRANSACTION
PRINT @@TRANCOUNT
select * from diagnosis
<!--�2==����  ���������� 1) -->
select * from diagnosis
insert into diagnosis values 
('fibroz2',6,5)
select @@TRANCOUNT


DELETE FROM diagnosis 
WHERE [id_diagnosis] =28
select @@TRANCOUNT
select * from diagnosis
<!--�2==����  ���������� 2) -->

select @@TRANCOUNT
BEGIN TRANSACTION
select @@TRANCOUNT

select * from diagnosis
insert into diagnosis values 
('rtg',3,4)
select @@TRANCOUNT


DELETE FROM diagnosis 
WHERE [name] ='fibroz2'
select @@TRANCOUNT

COMMIT TRANSACTION
PRINT @@TRANCOUNT
select * from diagnosis

<!---�3 -->
set implicit_transactions on --������� ���������� (���������� ��������)
set transaction isolation level read uncommitted
set transaction isolation level read committed
set transaction isolation level repeatable read
set transaction isolation level serializable
set transaction isolation level snapshot
update diagnosis set name = 'CSharpizm' where id_diagnosis = 30

select * from diagnosis where block=3
select @@TRANCOUNT
commit
rollback


<!---#3 �4 -->
set implicit_transactions on --������� ���������� (���������� ��������)
set transaction isolation level read uncommitted
set transaction isolation level read committed
set transaction isolation level repeatable read
set transaction isolation level serializable
set transaction isolation level snapshot
update patients set name = 'jame' where id_patient = 1
select * from patients
update patients set name = 'kirril' where id_patient = 8
select @@TRANCOUNT
commit

alter database yamakassi set read_committed_snapshot off 

<!---�5 -->
update patients set name = 'ilya' where id_patient = 8
select * from sys.dm_tran_locks
commit
<!--6 -->
 update �������� set [���� ��������] = '12-12-2021' where [����� ��������] = 8
 select @@TRANCOUNT
update [LINKEDSERVERNAME].[yamakassi].[dbo].patients set name = 'ilya' where id_patient = 8
select @@TRANCOUNT
commit
select @@TRANCOUNT
