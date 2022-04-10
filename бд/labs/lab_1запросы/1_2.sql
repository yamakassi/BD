
select id_staff,AVG(price) as avg_price,count(*) as count_p
from survey as s
GROUP BY id_staff
having COUNT(*)>2