Select surname , specialization,experience, SUM(salary) AS итог
From staff
Group by GROUPING SETS (surname,specialization,experience)
























