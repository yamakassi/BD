select id_staff,d.name,AVG(price) as avg_price,count(*) as count_p
from survey as s
JOIN diagnosis  as d on d.id_diagnosis=s.id_diagnosis
GROUP BY id_staff,d.name
having COUNT(*)>0