Select surname , specialization,experience, SUM(salary) AS ����
From staff
Group by GROUPING SETS (surname,specialization,experience)
























