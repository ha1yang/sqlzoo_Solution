
/*
Section 7: More JOIN operations

https://sqlzoo.net/wiki/More_JOIN_operations
*/


--#1. 1962 movies


/*
List the films where the yr is 1962 [Show id, title]
*/

SELECT id, title
FROM movie
WHERE yr=1962





--#2. When was Citizen Kane released?

/*
Give year of 'Citizen Kane'.
*/

SELECT yr
FROM movie
WHERE title = "Citizen Kane"




--#3. Star Trek movies


/*
List all of the Star Trek movies, 
include the id, title and yr (all of these movies include the words Star Trek in the title). 
Order results by year.
*/

SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr




--#4. id for actor Glenn Close


/*
What id number does the actor 'Glenn Close' have?
*/

SELECT id
FROM actor
WHERE name = "Glenn Close"


--#5. id for Casablanca

/*
What is the id of the film 'Casablanca'
*/

SELECT id
FROM movie
WHERE title = "Casablanca"
 

--#6. Cast list for Casablanca

/*
Obtain the cast list for 'Casablanca'.

what is a cast list?
The cast list is the names of the actors who were in the movie.

Use movieid=11768, (or whatever value you got from the previous question)
*/

SELECT actor.name
FROM actor JOIN casting ON actor.id = casting.actorid
WHERE casting.movieid = 11768



--#7. Alien cast list

/*
Obtain the cast list for the film 'Alien'
*/

SELECT actor.name
FROM actor JOIN casting ON actor.id = casting.actorid
           JOIN movie ON movie.id = casting.movieid
WHERE movie.title = 'Alien'



--#8. Harrison Ford movies


/*
List the films in which 'Harrison Ford' has appeared
*/

SELECT movie.title
FROM actor JOIN casting ON actor.id = casting.actorid
           JOIN movie ON movie.id = casting.movieid
WHERE actor.name = 'Harrison Ford'


--#9. Harrison Ford as a supporting actor


/*
List the films where 'Harrison Ford' has appeared - but not in the starring role. 
[Note: the ord field of casting gives the position of the actor. 
If ord=1 then this actor is in the starring role]
*/

SELECT movie.title
FROM actor JOIN casting ON actor.id = casting.actorid
           JOIN movie ON movie.id = casting.movieid
WHERE actor.name = 'Harrison Ford' AND casting.ord <> 1

--#10. Lead actors in 1962 movies

/*
List the films together with the leading star for all 1962 films.
*/

SELECT movie.title, actor.name
FROM actor JOIN casting ON actor.id = casting.actorid
           JOIN movie ON movie.id = casting.movieid
WHERE movie.yr = '1962' AND casting.ord = 1


--#11. Busy years for Rock Hudson

/*
Which were the busiest years for 'Rock Hudson', 
show the year and the number of movies he made each year for any year in which he made more than 2 movies.
*/

SELECT yr,COUNT(title) 
FROM movie JOIN casting ON movie.id = movieid
           JOIN actor   ON actorid = actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2



--#12. Lead actor in Julie Andrews movies

/*
List the film title and the leading actor for all of the films 'Julie Andrews' played in.
*/

SELECT movie.title, actor.name
FROM actor JOIN casting ON actor.id = casting.actorid
          JOIN movie ON movie.id = casting.movieid
WHERE movie.id IN (
    SELECT actor.id FROM actor
    WHERE name='Julie Andrews')
AND casting.ord = 1

/*
OR 
/*

SELECT movie.title, actor.name
FROM movie JOIN casting ON (casting.movieid = movie.id AND ord=1)
           JOIN actor ON (casting.actorid = actor.id)
WHERE movie.id IN (
    SELECT casting.movieid FROM casting
    WHERE casting.actorid IN (
        SELECT actor.id FROM actor
        WHERE name = 'Julie Andrews'))


--#13. Actors with 15 leading roles

/*
Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
*/

SELECT actor.name
FROM actor JOIN casting ON actor.id = casting.actorid
          JOIN movie ON movie.id = casting.movieid
WHERE casting.ord = 1
GROUP BY actor.name
HAVING COUNT(movie.title) >= 15
ORDER BY actor.name

--#14. released in the year 1978

/*
List the films released in the year 1978 ordered by the number of actors in the cast, 
then by title.
*/

SELECT movie.title, COUNT(casting.actorid) as cast_size
FROM movie JOIN casting ON movie.id = casting.movieid
WHERE movie.yr = 1978
GROUP BY movie.id, movie.title
ORDER BY cast_size DESC, movie.title

--#15. with 'Art Garfunkel'

/*
List all the people who have worked with 'Art Garfunkel'.
*/

SELECT DISTINCT a.name
FROM actor a
JOIN casting c ON a.id = c.actorid
WHERE c.movieid IN (
    SELECT movieid
    FROM casting
    JOIN actor ON casting.actorid = actor.id
    WHERE actor.name = 'Art Garfunkel'
)
AND a.name != 'Art Garfunkel'

