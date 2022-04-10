Select surname , specialization, SUM(salary) AS итог
From staff
Group by CUBE (surname,specialization)
























