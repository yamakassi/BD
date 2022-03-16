use yamakassi
/*
--служба доставки
поставки
заказы
склад
сотрудники
*/
 go
 create table patients (
  id_patient int primary key identity (1,1),
  name varchar(30) not null,
  surname varchar(30) not null,
  dob date check (dob<=getdate()),
  addres nvarchar(200) 
  
 ) 
 
 alter table patients
 add age as datediff(yy, dob, getdate())

 create table staff
 (
  id_staff int primary key identity (1,1),
  name varchar(30) not null, 
  surname varchar(30) not null,
  dob date check (dob<=getdate()),
  doe date check (doe<=getdate()) default getdate(),
  phd bit,
  specialization nvarchar(100) DEFAULT ('internist')
 )

 alter table staff
 add experience as datediff(mm, doe, getdate())
  alter table staff
 add age as datediff(yy, dob, getdate())


create table diagnosis
 (
  id_diagnosis int primary key identity (1,1),
  name varchar(80) not null,
  block varchar(40),
  class smallint check (class>0)
  )

  create table survey
 (
  id_survey int primary key identity (1,1),
  price int,
  id_patients  int,
  id_staff int,
  id_diagnosis int, 
  ex_date date default getdate()
  )

  alter table survey 
  add constraint fk_patient foreign key (id_patient) references patients(id_patient) on delete no action

   alter table survey 
  add constraint fk_diagnos foreign key (id_diagnosis) references diagnosis(id_diagnosis) on delete no action

   alter table survey 
  add constraint fk_staff foreign key (id_staff) references staff(id_staff) 

  -- ограничения
  ALTER TABLE staff  WITH CHECK ADD  CONSTRAINT ck_name CHECK  ((name like '[A-Za-zА-Яа-я]%'))
  ALTER TABLE staff  WITH CHECK ADD  CONSTRAINT ck_surname CHECK  ((surname like '[A-Za-zА-Яа-я]%'))

   ALTER TABLE patients  WITH CHECK ADD  CONSTRAINT ck_patient_name CHECK  ((name like '[A-Za-zА-Яа-я]%'))
  ALTER TABLE patients  WITH CHECK ADD  CONSTRAINT ck_patients_surname CHECK  ((surname like '[A-Za-zА-Яа-я]%'))
  ALTER TABLE patients  WITH CHECK ADD  constraint ck_addres check  (addres like '[A-Za-zА-Яа-я1-9]%')

   ALTER TABLE diagnosis  WITH CHECK ADD  CONSTRAINT ck_diagnosis_surname CHECK  ((name like '[A-Za-zА-Яа-я]%'))

   
   ALTER TABLE survey  WITH CHECK ADD  CONSTRAINT ck_survey_price CHECK  (price>(0))