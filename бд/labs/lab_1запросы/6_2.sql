Select surname , specialization,experience, SUM(salary) AS ����
From staff
Group by CUBE (surname,specialization,experience)
























