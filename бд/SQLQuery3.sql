ext select
trans
backup/restore
sequrity
programming
triggers, functions
cursors 
optimization: indexing...
partitioning 
ext select 2 
distr trans 
replication
...

create database INPIT
on primary 
(name = 'f1', filename = 'C:\temp\input_f1.mdf', size = 15Mb, maxsize = 150Mb, filegrowth =5Mb),
(name = 'f2', filename = 'C:\temp\input_f2.ndf', size = 15Mb, maxsize = 150Mb, filegrowth =5Mb),
filegroup fg1
(name = 'f3', filename = 'C:\temp\input_f3.ndf', size = 15Mb, maxsize = 150Mb, filegrowth =5Mb),
(name = 'f4', filename = 'C:\temp\input_f4.ndf', size = 15Mb, maxsize = 150Mb, filegrowth =5Mb),
(name = 'f5', filename = 'C:\temp\input_f5.ndf', size = 15Mb, maxsize = 150Mb, filegrowth =5Mb)
log on 
(name = 'lf1', filename = 'C:\temp\input_lf1.ldf', size = 15Mb, maxsize = 150Mb, filegrowth =5Mb),
(name = 'lf2', filename = 'C:\temp\input_lf2.ldf', size = 15Mb, maxsize = 150Mb, filegrowth =5Mb)
 
 use inpit
 go
 create table students
 (
  id_student int primary key identity (1,1),
  name varchar(30) not null,
  surname varchar(30) not null,
  dob date check (dob<=getdate()),
  doe date check (doe<=getdate()) default getdate()
 ) on fg1
 
 alter table students
 add age as datediff(yy, dob, getdate())

 create table senseis
 (
  id_sensei int primary key identity (1,1),
  name varchar(30) not null,
  surname varchar(30) not null,
  dob date check (dob<=getdate()),
  doe date check (doe<=getdate()) default getdate(),
  phd bit
 )

 alter table senseis
 add experience as datediff(mm, doe, getdate())
  alter table senseis
 add age as datediff(yy, dob, getdate())


create table subjects
 (
  id_subject int primary key identity (1,1),
  name varchar(30) not null,
  points smallint,
  constraint ch_points check (points>0),
  hours smallint check (hours>40)
  )

  create table exams
 (
  id_exam int primary key identity (1,1),
  mark tinyint,
  id_student  int,
  id_sensei int,
  id_subject int, 
  ex_date date default getdate()
  )

  alter table exams 
  add constraint fk_st foreign key (id_student) references students(id_student) on delete cascade --set null set default no action

   alter table exams 
  add constraint fk_subj foreign key (id_subject) references subjects(id_subject) on delete no action

   alter table exams 
  add constraint fk_sens foreign key (id_sensei) references senseis(id_sensei) 


  select * from students
  select * from senseis
  select * from subjects
  select * from exams

  sp_help students
  sp_helptext 
  select * from sys.syscomments
  select * from sys.tables
  select * from sys.columns

   

  insert into subjects values ('Databases Extended',7,108)
  insert into subjects (points, name, hours) values (5,'Databases Fundamentals',160)

  insert into subjects 
  select 'Math', 10, 256
  union all
  select 'Physics', 4, 108
  union all
  select 'History', 2, 60

  commit

  -----------------------
  select * from students
  select * from senseis
  select * from subjects
  select * from exams

  update subjects set name='Old History'/*,....*/ where id_subject = 6
  delete from subjects where id_subject = 8
  truncate table subjects


  select * from students
  select * from senseis
  select * from subjects
  select * from exams

  null - ?? 0 ?? '' 

  declare @x varchar(20)
  declare @age int = 19
  set @x='Denis'
  print 'Hello, ' + @x + ' '+cast(@age as varchar(30)) +' years old'
  --NULL propagation!!!!!!!!!!!

  declare @price float = 3121342
  declare @discount float = 0.05
  declare @quantity int = 1
  select @quantity*@price*(1-isnull(@discount,0))

  is null - ???????? ?? ??????? 
  is null - ??? ?? isnull

  declare @code int = 589
  select case @code 
  when 64 then 'saratov'
  when 63 then 'samara'
  when 05 then 'dagestan'
  when 58 then 'penza'
  else  'too far'
  end 



  insert into students (name, surname, dob, doe)
  select '' , ??????? collate Cyrillic_General_CS_AS, ????_????????, ????_??????  from mifst11_true_db.dbo.??????????
  select max(age) from students

  delete students
  commit


  select 'Physics' , 4, 108
  union
  select 'Economics' , 3, 110
  union
  select 'Biology' , 5, 120
  union all
  select name, points, hours from subjects

  (select 'Physics' , 4, 108
  union
  select 'Economics' , 3, 110
  union
  select 'Biology' , 5, 120)
  except
  select name, points, hours from subjects

  (select 'Physics' , 4, 108
  union
  select 'Economics' , 3, 110
  union
  select 'Biology' , 5, 120)
  intersect
  select name, points, hours from subjects



  select * from students
  select * from senseis
  select * from subjects
  select * from exams

  insert into exams values
  (3, 47,null,1,default),
  (4, 50,null,3,'10/10/10'),
  (3, 56,null,4,'7/11/21'),
  (3, 45,null,4,'02/02/22'),
  (3, 45,null,3,'04/05/16'),
  (3, 49,null,4,'03/08/18') 

    insert into exams values
  (4, 48,3,1,default),
  (2, 51,4,3,'10/10/10'),
  (2, 52,4,4,'7/11/20'),
  (4, 47,3,4,'06/02/20'),
  (3, 50,4,3,'12/05/18'),
  (3, 49,5,4,'03/03/19') 

  update exams set mark= mark+1 where id_exam>3

  set dateformat dmy -- ? ????? ??????? ?????? ????? ????

  delete senseis --!!!!!!!
  
  insert senseis values ('Alexey','Kuzmin','07/08/1985', '01/09/2007', 1)
  insert senseis values ('Alexander','Ermakov','24/08/1985', '01/09/2007', 1)
  insert senseis values ('Kulakova','Katerina','24/08/1990', '01/09/2012', 0)
  insert senseis values ('Alexander','Brovko','31/08/1970', '01/09/2005', 2)
  insert senseis values ('Kumova','Svetlana','5/08/1981', '01/09/2004', 1)


  select * from exams inner join students on exams.id_student = students.id_student
  select * from exams left outer join students on exams.id_student = students.id_student
  select * from exams right outer join students on exams.id_student = students.id_student
  select * from exams full outer join students on exams.id_student = students.id_student

  alter table students add headboy int foreign key references students(id_student)

  select * from students
  select * from senseis
  select * from subjects
  select * from exams

  select '? ???????? ?? ??????? ' + sts.surname + ' ???????? ====> ' + hds.surname 
  from students sts left join students hds on sts.headboy = hds.id_student

  select '? ???????? ?? ??????? ' , sts.surname , ' ???????? ====> ' , hds.surname 
  from students sts left join students hds on sts.headboy = hds.id_student

  select * from exams inner join students on 5>3 --????????????

  select * from exams natural join students using (id_student) --?? ? MSSQL

  declare @a float
  select @a = avg(age) from students
  print @a 
  select * from  students where age > @a
  --delete from  students where age > @a

  
  select * from  students where age > (select avg(age) from students) --????????? 

  select * from students 
  where not exists (select * from exams where exams.id_student = students.id_student) --????????? ??????????????? 

    select   avg(age) from students
	select   var(age) from students
	select  headboy, avg(age) from students group by headboy
	select * from students

	min max sum count(*) count(st2), count(distinct st2), avg, var.... userdefined


	select  st.headboy, hb.surname,  avg(st.age) [avg age], count(*) [cnt] 
	from students st join students hb on hb.id_student = st.headboy
	group by st.headboy, hb.surname

	0-18 = 1, 19-35 = 2, 36-55 = 3, 55-inf = 4

	declare @x int = 57
	print case when @x between 0 and 18 then 1 when @x between 19 and 35 then 2 
	when @x between 36 and 55 then 3 else 4 end  
	
	select  st.headboy, hb.surname, case when st.age between 0 and 18 then 1 when st.age between 19 and 35 then 2 
	when st.age between 36 and 55 then 3 else 4 end as age_cat,  avg(st.age) [avg age], count(*) [cnt] 
	from students st join students hb on hb.id_student = st.headboy
	group by st.headboy, hb.surname, /*age_cat ??????!!!*/case when st.age between 0 and 18 then 1 when st.age between 19 and 35 then 2 
	when st.age between 36 and 55 then 3 else 4 end

	select  st.headboy, hb.surname, case when st.age between 0 and 18 then 1 when st.age between 19 and 35 then 2 
	when st.age between 36 and 55 then 3 else 4 end as age_cat,  avg(st.age) [avg age], count(*) [cnt] 
	from students st join students hb on hb.id_student = st.headboy
	where st.id_student between 47 and 69 -- ?????????? ??????? ?? group by
	group by st.headboy, hb.surname, /*age_cat ??????!!!*/case when st.age between 0 and 18 then 1 when st.age between 19 and 35 then 2 
	when st.age between 36 and 55 then 3 else 4 end
	having count(*) > 2 --?????????? ????? ????? group by

	select * from exams left join students on exams.id_student = students.id_student
	left join senseis on exams.id_sensei = senseis.id_sensei
	left join subjects on subjects.id_subject = exams.id_subject


	select ex_date, mark, students.surname as st, senseis.surname as sens, subjects.name as sbj, subjects.points 
	from exams left join students on exams.id_student = students.id_student
	left join senseis on exams.id_sensei = senseis.id_sensei
	left join subjects on subjects.id_subject = exams.id_subject


	select ex_date, mark, students.surname as st, senseis.surname as sens, subjects.name as sbj, subjects.points 
	from exams left join students on exams.id_student = students.id_student
	left join senseis on exams.id_sensei = senseis.id_sensei
	left join subjects on subjects.id_subject = exams.id_subject


	select count(*) cnt, min(ex_date) firstdate, avg(mark) avg_mark, senseis.surname as sens, subjects.name as sbj 
	from exams left join students on exams.id_student = students.id_student
	left join senseis on exams.id_sensei = senseis.id_sensei
	left join subjects on subjects.id_subject = exams.id_subject
	group by senseis.surname, subjects.name --???????? ?????? ??-?? ???????????? ???????  
  
    select count(*) cnt, min(ex_date) firstdate, round(avg(cast(mark as float)),2) avg_mark, senseis.surname as sens, subjects.name as sbj 
	from exams left join students on exams.id_student = students.id_student
	left join senseis on exams.id_sensei = senseis.id_sensei
	left join subjects on subjects.id_subject = exams.id_subject
	group by rollup(senseis.surname, subjects.name)


	select count(*) cnt, min(ex_date) firstdate, round(avg(cast(mark as float)),2) avg_mark, senseis.surname as sens, subjects.name as sbj 
	from exams left join students on exams.id_student = students.id_student
	left join senseis on exams.id_sensei = senseis.id_sensei
	left join subjects on subjects.id_subject = exams.id_subject
	group by cube(senseis.surname, subjects.name)
    
	select count(*) cnt, min(ex_date) firstdate, round(avg(cast(mark as float)),2) avg_mark, senseis.surname as sens, subjects.name as sbj 
	from exams left join students on exams.id_student = students.id_student
	left join senseis on exams.id_sensei = senseis.id_sensei
	left join subjects on subjects.id_subject = exams.id_subject
	group by grouping sets(senseis.surname, subjects.name)

	select count(*) cnt, min(ex_date) firstdate, round(avg(cast(mark as float)),2) avg_mark, senseis.surname as sens, subjects.name as sbj 
	from exams left join students on exams.id_student = students.id_student
	left join senseis on exams.id_sensei = senseis.id_sensei
	left join subjects on subjects.id_subject = exams.id_subject
	group by grouping sets((),(),(),senseis.surname, subjects.name, (senseis.surname, subjects.name))
	
	

	rollup:
	a b c 
	a b 
	a
	-
	cube:
	a b c 
	a b 
	a 
	b c 
	c
	-
   grouping sets 
   -
   a b 
   b a 
   c a 
   a c b


	select count(*) cnt, min(ex_date) firstdate, round(avg(cast(mark as float)),2) avg_mark, 
	grouping(senseis.surname), senseis.surname as sens, grouping (subjects.name) ,subjects.name as sbj 
	from exams left join students on exams.id_student = students.id_student
	left join senseis on exams.id_sensei = senseis.id_sensei
	left join subjects on subjects.id_subject = exams.id_subject
	group by rollup(senseis.surname, subjects.name)


	select count(*) cnt, min(ex_date) firstdate, 
	round(avg(cast(mark as float)),2) avg_mark, 
	grouping(senseis.surname), 
	isnull(senseis.surname, case grouping(senseis.surname) when 0 then '?? ??????' else '??? ???????' end) as sens, 
	grouping (subjects.name) ,
	isnull(subjects.name, case grouping(subjects.name) when 0 then '?? ??????' else '??? ????????' end)	as sbl
	
	from exams left join students on exams.id_student = students.id_student
	left join senseis on exams.id_sensei = senseis.id_sensei
	left join subjects on subjects.id_subject = exams.id_subject
	group by rollup(senseis.surname, subjects.name)


  select * from students
  select * from senseis
  select * from subjects
  select * from exams
