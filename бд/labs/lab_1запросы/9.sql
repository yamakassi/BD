Select surname,
	ISNULL(CAST(specialization as nvarchar(50)),
		case when GROUPING(specialization)=1 and  GROUPING(surname)=0
			then 'vse' else 'neizvestno' end) as specialization,
			sum(salary) as count,
			GROUPING(surname) as group_name,
			grouping(specialization) as grroup
from staff
group by rollup (id_staff,surname, specialization)
