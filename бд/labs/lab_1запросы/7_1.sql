Select surname , specialization, SUM(salary) AS итог
From staff
Group by GROUPING SETS (surname,specialization)
