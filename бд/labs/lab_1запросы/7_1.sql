Select surname , specialization, SUM(salary) AS ����
From staff
Group by GROUPING SETS (surname,specialization)
