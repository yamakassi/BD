select d.name, s.price,s.id_staff, COUNT(*) as countR
from survey as s
join diagnosis as d ON s.id_diagnosis = d.id_diagnosis
group by  d.name,s.price,s.id_staff with ROLLUP