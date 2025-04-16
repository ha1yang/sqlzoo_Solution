/*
Section: Get to the point
https://sqlzoo.net/wiki/Get_to_the_point
*/

--#1. Joining two tables


/*
Join casting and actor on actorid/id
The result of the below gives one row for every element of the casting table which relates to John Hurt. 
In addition to the actorid we have the name of the actor involved.
*/


SELECT * 
FROM casting JOIN actor ON casting.actorid=actor.id
WHERE actor.name='John Hurt'


--#2. Joining three tables

/*
The it makes sense to join the above table with the movie table. 
The obvious field to join on is the movieid field.
Join casting and actor on actorid/id

The result now again has one row for every element of the casting table, this time we get details of the movies as well as the name of the actor.

Notice that in some cases we refer to a field using just the field name (e.g. actorid) 
and sometimes we preceed the field name with the table name (e.g. casting.actorid). 
You must include the table name if the field names are not unique.
*/


SELECT * 
FROM movie JOIN casting ON movie.id=movieid
           JOIN actor   ON actorid=actor.id
WHERE actor.name='John Hurt'

