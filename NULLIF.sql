/*
Section: NULLIF
https://sqlzoo.net/wiki/NULLIF
*/



/*
   NULLIF(x,y) = NULL if x=y
   NULLIF(x,y) = x if x != y    
*/



--#1. 

/*
NULLIF can be used to replace a specific value with NULL. 
In this example the party Lab is replaced with NULL.
*/



SELECT name, party, NULLIF(party,'Lab') AS aff
FROM msp 
WHERE name LIKE 'C%'
