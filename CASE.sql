/*
Section: CASE
https://sqlzoo.net/wiki/CASE
*/

/*
CASE allows you to return different values under different conditions.

If there no conditions match (and there is not ELSE) then NULL is returned.

  CASE WHEN condition1 THEN value1 
       WHEN condition2 THEN value2  
       ELSE def_value 
  END 
*/

--#1. 

SELECT 
  name, 
  population,
  CASE 
    WHEN population < 1000000 THEN 'small'
    WHEN population < 10000000 THEN 'medium'
    ELSE 'large'
  END AS size
FROM bbc
