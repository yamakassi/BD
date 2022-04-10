with recurs_fn(senseiID, id_staff, LastName, Level_) as 
(
    select senseiID, id_staff, surname, 0 as Level_
    from staff 
    where senseiID is null
    union all
    select e.senseiID, e.id_staff, e.surname, Level_ + 1
    from staff as e
        inner join recurs_fn AS d
        on e.senseiID = d.id_staff 
)	
select Level_, 
		(select surname  from staff em where em.id_staff=recFn.senseiID) as [Начальник],
		(select surname  from staff em where em.id_staff=recFn.id_staff ) 

from recurs_fn recFn
order by recFn.senseiID;
