  merge staff st
  using (select name, surname,dob from patients) as pr
  on (pr.dob = st.dob)
  when matched then
  update set st.name= pr.name
  when not matched then
  insert (name, surname,dob) values (pr.name, pr.surname,dob);