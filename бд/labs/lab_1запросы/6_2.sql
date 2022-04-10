Select surname , specialization,experience, SUM(salary) AS итог
From staff
Group by CUBE (surname,specialization,experience)
























