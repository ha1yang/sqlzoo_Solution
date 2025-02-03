/*
Section: SELECT .. SELECT
https://sqlzoo.net/wiki/SELECT_.._SELECT
*/

--#1. Subquery with FROM

/*
You may use a SELECT statement in the FROM line.

In this case the derived table X has columns name and gdp_per_capita. The calculated values in the inner SELECT can be used in the outer SELECT.

Notice that

the inner table is given an alias X
the first column in the inner query keeps its name
the second column in the inner query has an alias
*/

SELECT name, gdp_per_capita
FROM (
   SELECT name, gdp/population AS gdp_per_capita 
   FROM world
) X
WHERE gdp_per_capita>20000

--#2. Subquery with IN

/*
Find the countries in the same continent as Bhutan

You may use a SELECT statement in the WHERE line - this returns a list of continent.
*/

SELECT name
FROM world
WHERE continent IN (
   SELECT continent 
   FROM world 
   WHERE name='Bhutan'
)


--#3. Correlated Subquery

/*
If a value from the outer query appears in the inner query this is "correlated subquery".

Show the countries where the population is greater than 5 times the average for its region
*/
SELECT name, population
FROM world w1
WHERE population > 5 * (
    SELECT AVG(population)
    FROM world w2
    WHERE w2.continent = w1.continent
)


