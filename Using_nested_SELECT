/*
Section: Using nested SELECT
https://sqlzoo.net/wiki/Using_nested_SELECT
*/

--#1. Using SELECT in SELECT

/*
List each country in the same continent as 'Brazil'.

*/

SELECT name 
FROM world 
WHERE continent = (
   SELECT continent 
   FROM world 
   WHERE name = 'Brazil'
)

--#2. Multiple Results

/*
List each country and its continent in the same continent as 'Brazil' or 'Mexico'.
*/

SELECT name, continent 
FROM world
WHERE continent 
IN (
   SELECT continent 
   FROM world 
   WHERE name='Brazil'
   OR name='Mexico'
)



--#3. Subquery on the SELECT line

/*
Show the population of China as a multiple of the population of the United Kingdom
*/

SELECT population/(
   SELECT population 
   FROM world
   WHERE name='United Kingdom'
) AS Multiple
FROM world
WHERE name = 'China'


