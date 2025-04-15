
/*
Section: Using SUM, Count, MAX, DISTINCT and ORDER BY
https://sqlzoo.net/wiki/Using_SUM,_Count,_MAX,_DISTINCT_and_ORDER_BY
*/

--#1. 

/*
The total population and GDP of Europe.
*/

SELECT SUM(population) AS Total_pop, SUM(gdp) AS Total_GDP
FROM world 
WHERE continent = 'Europe'


--#2. 

/*
What are the regions?
*/

SELECT DISTINCT continent 
FROM world



--#3. 

/*
Show the name and population for each country with a population of more than 100000000. 
Show countries in descending order of population.
*/

SELECT name, population
FROM world
WHERE population > 100000000
ORDER BY population DESC


