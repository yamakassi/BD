--3.	��������� �.1, ��������� ����������� �� ������������ ���������. 


select ex_date,AVG(price) as avg_price,count(*) as count_p
from survey as s
GROUP BY ex_date
having COUNT(*)>2