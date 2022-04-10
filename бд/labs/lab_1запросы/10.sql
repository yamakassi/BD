Select surname,name,[salary],
ROW_NUMBER() OVER (ORDER BY [salary]) as row_number ,
RANK() OVER (ORDER BY [salary]) as RANK ,
DENSE_RANK() OVER (ORDER BY [salary]) as DENSE_RANK,
NTILE(5) OVER (ORDER BY [salary]) as NTILE 

from staff
