
/*
Section 4: SUM and COUNT

https://sqlzoo.net/wiki/SUM_and_COUNT
*/


--#1. Total world population

/*
Show the total population of the world.

world(name, continent, area, population, gdp)
*/

SELECT SUM(population)
FROM world




--#2. List of continents
/*
List all the continents - just once each.
*/

SELECT DISTINCT(continent) 
FROM world

/*
OR
*/

SELECT DISTINCT continent
FROM world


--#3. GDP of Africa

/*
Give the total GDP of Africa

*/

SELECT SUM(gdp) 
FROM world
WHERE continent = 'Africa'


--#4. Count the big countries

/*
How many countries have an area of at least 1000000
*/

SELECT COUNT(name)
FROM world
WHERE area > 1000000



--#5. Baltic states population

/*
What is the total population of ('Estonia', 'Latvia', 'Lithuania')
*/

SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')
 

--#6. Counting the countries of each continent
/*
For each continent show the continent and number of countries.
*/

/*
NOTE: 
Comparing to #2. List of continents
When you're just listing the continents once each without any aggregation, 
"
SELECT DISTINCT(continent) FROM world 
"
works perfectly.
The difference is that in the original query, you're trying to do two things at once:

List each continent once (using DISTINCT)
Count countries for each continent (using COUNT)

When you're combining an aggregate function like COUNT with non-aggregated columns, PostgreSQL requires you to use GROUP BY instead of DISTINCT. This is because PostgreSQL needs to know how to group the records before performing the count.
So while:
"
SELECT DISTINCT(continent) FROM world
"
works fine for just listing continents,
For counting countries per continent, you need:
"
SELECT continent, COUNT(name) 
FROM world
GROUP BY continent
"
The GROUP BY approach is designed specifically for these aggregate operations, 
where you want to organize data into groups and then perform calculations on each group.
*/

SELECT continent, COUNT(name)
FROM world
GROUP BY continent


--#7.Counting big countries in each continent

/*
For each continent show the continent and number of countries with populations of at least 10 million.
*/

SELECT continent, COUNT(name)
FROM world
WHERE population > 10000000
GROUP BY continent



--#8. Counting big continents

/*
List the continents that have a total population of at least 100 million.

The HAVING clause is designed to filter groups based on aggregate conditions, not on individual row values.
The key difference is using WHERE instead of HAVING. 
The WHERE clause filters individual rows before they're grouped, 
while HAVING filters groups after aggregation. 
Since you want to count countries that individually have populations ≥ 10 million, 
you need to use WHERE.
*/

SELECT continent 
FROM world
GROUP BY continent
HAVING sum(population) > 100000000

