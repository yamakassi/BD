select d.name,AVG(price)
from survey as s
join diagnosis as d ON s.id_diagnosis = d.id_diagnosis
group by d.name,s.id_survey
