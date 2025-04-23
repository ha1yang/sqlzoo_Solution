/*
Section: Selecting NULL values.
https://sqlzoo.net/wiki/Selecting_NULL_values.
*/

--#1. 

/*
The SELECT statement returns results from a table. 
With a WHERE clause only some rows are returned. 
This example shows the year that Athens hosted the Olympic games.
*/

SELECT code, name 
FROM party
WHERE leader IS NULL
