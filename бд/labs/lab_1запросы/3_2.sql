--3.	��������� �.1, ��������� ����������� �� ������������ ���������. 


select ex_date,AVG(price) as avg_price,count(*) as count_p
from survey as s
where ex_date>'2011-11-11'
GROUP BY ex_date
