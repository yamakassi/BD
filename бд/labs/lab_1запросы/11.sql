select DISTINCT
d.[name] as [���������],
COUNT (s.id_survey) OVER (PARTITION BY ex_date) AS [���-�� ],
SUM(price) OVER (PARTITION BY id_staff) AS [����� ����],
AVG(price) OVER (PARTITION BY id_staff) AS [C������ ����],
MAX(price) OVER (PARTITION BY id_staff) AS [������������ ���� ],
MIN(price) OVER (PARTITION BY id_staff) AS [����������� ���� ]
from survey as s
left join diagnosis as d on s.id_diagnosis=d.id_diagnosis
