/*
Section: ROUND
https://sqlzoo.net/wiki/ROUND
*/

--#1. ROUND

/*
In this example we calculate the population in millions to one decimial place.
*/

SELECT name, ROUND(population/1000000,1)
FROM world
