select DISTINCT
d.[name] as [процедура],
COUNT (s.id_survey) OVER (PARTITION BY ex_date) AS [кол-во ],
SUM(price) OVER (PARTITION BY id_staff) AS [Общая цена],
AVG(price) OVER (PARTITION BY id_staff) AS [Cредняя цена],
MAX(price) OVER (PARTITION BY id_staff) AS [Максимальная цена ],
MIN(price) OVER (PARTITION BY id_staff) AS [Минимальная цена ]
from survey as s
left join diagnosis as d on s.id_diagnosis=d.id_diagnosis
