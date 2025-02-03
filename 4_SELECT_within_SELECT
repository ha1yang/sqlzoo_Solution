
/*
Section 4: SELECT within SELECT Tutorial
https://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial
*/


--#1. Bigger than Russia
/*
List each country name where the population is larger than that of 'Russia'.

world(name, continent, area, population, gdp)
*/

SELECT name 
FROM world
WHERE population > (
   SELECT population 
   FROM world
   WHERE name='Russia'
)



--#2. Richer than UK
/*
Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
*/

SELECT name
FROM world
WHERE continent = 'Europe'
AND gdp / population > (
   SELECT gdp / population
   FROM world
   WHERE name = 'United Kingdom'
);


--#3. Neighbours of Argentina and Australia
/*
List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
*/

SELECT name, continent
FROM world
WHERE continent IN (
   SELECT continent
   FROM world
   WHERE name IN ('Argentina', 'Australia')
)
ORDER BY name;


--#4. Between Canada and Poland
/*
Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.
*/

SELECT name, population
FROM world
WHERE population > (
   SELECT population
   FROM world
   WHERE name = 'United Kingdom'
)
AND population < (
   SELECT population
   FROM world
   WHERE name = 'Germany'
);

--#5. Percentages of Germany
/*
Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.

Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

The format should be Name, Percentage for example:

name	percentage
Albania	3%
Andorra	0%
Austria	11%
...	...
*/

SELECT name, CONCAT(ROUND((population::numeric / (
   SELECT population 
   FROM world 
   WHERE name = 'Germany')) * 100), '%'
) AS percentage
FROM world
WHERE continent = 'Europe';
 

--#6. Bigger than every country in Europe
/*
Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
*/

SELECT name
FROM world
WHERE GDP > ALL(
   SELECT GDP
   FROM world
   WHERE GDP > 0 AND continent = 'Europe'
) 

--#7.Largest in each continent
/*
Find the largest country (by area) in each continent, show the continent, the name and the area:

The above example is known as a correlated or synchronized sub-query.

Using correlated subqueries
A correlated subquery works like a nested loop: the subquery only has access to rows related to a single record at a time in the outer query. The technique relies on table aliases to identify two different uses of the same table, one in the outer query and the other in the subquery.

One way to interpret the line in the WHERE clause that references the two table is “… where the correlated values are the same”.

In the example provided, you would say “select the country details from world where the population is greater than or equal to the population of all countries where the continent is the same”.
*/

SELECT continent, name, area 
FROM world x
WHERE area >= ALL (
   SELECT area FROM world y
   WHERE y.continent = x.continent AND area > 0
) ORDER by name ASC



--#8. First country of each continent (alphabetically)
/*
List each continent and the name of the country that comes first alphabetically.
*/

SELECT continent, MIN(name) AS name
FROM world
GROUP BY continent
ORDER BY name ASC;

--Another way

SELECT continent, name
FROM world x
WHERE name <= ALL(SELECT name FROM world y WHERE y.continent = x.continent)


--#9. Difficult Questions That Utilize Techniques Not Covered In Prior Sections
/*
Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
*/

SELECT name, continent, population 
FROM world
WHERE continent IN (
   SELECT continent 
   FROM world x
   WHERE 25000000 >= ALL (
      SELECT population 
      FROM world y
      WHERE y.continent = x.continent
))

--#10. Three time bigger
/*
Some countries have populations more than three times that of all of their neighbours (in the same continent). Give the countries and continents.
*/

SELECT name, continent 
FROM world x 
WHERE population::numeric/3 >= ALL
    (SELECT population
     FROM world y
     WHERE y.continent=x.continent
     AND x.name != y.name)
