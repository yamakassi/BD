Select surname , specialization, SUM(salary) AS ����
From staff
Group by CUBE (surname,specialization)
























