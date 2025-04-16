/*
Section: Old JOIN Tutorial
https://sqlzoo.net/wiki/Old_JOIN_Tutorial#The_Table_Tennis_Olympics_Database
*/

--#1. 

/*
Show the athelete (who) and the country name for medal winners in 2000.

ttms(games,color,who,country)
country(id,name)   
*/

SELECT who, country.name
FROM ttms JOIN country ON (ttms.country = country.id)
WHERE games = 2000


--#2. 

/*
Show the who and the color of the medal for the medal winners from 'Sweden'.

ttms(games,color,who,country)
country(id,name)
*/

SELECT ttms.who, ttms.color
FROM ttms JOIN country ON (ttms.country = country.id)
WHERE country.name = 'Sweden'



--#3.

/*
Show the years in which 'China' won a 'gold' medal.


ttms(games,color,who,country)
country(id,name)   
*/

SELECT ttms.games
FROM ttms JOIN country ON (ttms.country = country.id)
WHERE country.name = 'China' AND ttms.color = 'gold'

--#4.

/*
Show who won medals in the 'Barcelona' games.


ttws(games,color,who,country)
games(yr,city,country)   
*/

SELECT ttws.who
FROM ttws JOIN games ON (ttws.games = games.yr)
WHERE games.city = 'Barcelona'


--#5.

/*
Show which city 'Jing Chen' won medals. Show the city and the medal color.

ttws(games,color,who,country)
games(yr,city,country)   
*/

SELECT games.city, ttws.color
FROM ttws JOIN games ON (ttws.games = games.yr)
WHERE who = 'Jing Chen'

--#6.

/*
Show who won the gold medal and the city.


ttws(games,color,who,country)
games(yr,city,country)   
*/

SELECT ttws.who, games.city
FROM ttws JOIN games ON (ttws.games = games.yr)
WHERE ttws.color = 'gold'

--#7.

/*
Show the games and color of the medal won by the team that includes 'Yan Sen'.

ttmd(games,color,team,country)
team(id,,name) 
*/

SELECT ttmd.games, ttmd.color
FROM ttmd JOIN team ON (ttmd.team = team.id)
WHERE team.name = 'Yan Sen'

--#8.

/*
Show the 'gold' medal winners in 2004.


ttmd(games,color,team,country)
team(id,,name)  
*/

SELECT team.name
FROM ttmd JOIN team ON (ttmd.team = team.id)
WHERE ttmd.games = 2004 AND ttmd.color = 'gold'


--#9.

/*
Show the name of each medal winner country 'FRA'.


ttmd(games,color,team,country)
team(id,,name)   
*/

SELECT team.name
FROM ttmd JOIN team ON (ttmd.team = team.id)
WHERE ttmd.country = 'FRA'

