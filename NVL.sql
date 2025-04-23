/*
Section: NVL
https://sqlzoo.net/wiki/NVL
*/

/*
NVL(x,y) = x if x is not NULL
NVL(x,y) = y if x is NULL
*/

--#1. 

/*
NVL can be useful when you want to replace a NULL value with some other value. 
In this example you show the name of the party for each MSP that has a party. 
For the MSP with no party (such as Canavan, Dennis) you show the string None.
*/

SELECT name, party, NVL(party,'None') AS aff
FROM msp WHERE name LIKE 'C%'


/*
Note:
The NVL and COALESCE functions in SQL are used to handle NULL values, but they differ in syntax, flexibility, and database compatibility:

1. Number of Arguments:
NVL:
Takes exactly 2 arguments.
Syntax: NVL(expression, replacement)
Example: NVL(salary, 0) → Returns salary if not NULL, otherwise 0.

COALESCE:
Takes multiple arguments (2 or more).
Syntax: COALESCE(expr1, expr2, expr3, ...)
Example: COALESCE(salary, bonus, 0) → Returns the first non-NULL value in the list.

2. Database Compatibility:
NVL: Oracle-specific (works in Oracle, Teradata, DB2, but not in MySQL, PostgreSQL, or SQL Server).
COALESCE: ANSI SQL standard, supported in all major databases (Oracle, MySQL, PostgreSQL, SQL Server, etc.).

3. Use Cases:
Use NVL for simple replacements (e.g., replacing NULL with a default value).
Use COALESCE for more complex scenarios where multiple fallback values are needed.
*/

--# Example:
-- Oracle (NVL):
SELECT NVL(commission, 0) FROM employees; -- Replaces NULL commission with 0.

-- All Databases (COALESCE):
SELECT COALESCE(commission, bonus, 0) FROM employees; -- Uses commission, else bonus, else 0.

/*
Key Difference Table:
Feature	NVL	COALESCE
Arguments	2 arguments	2+ arguments
Portability	Oracle-specific	ANSI standard (universal)
Flexibility	Limited to 2 values	Handles multiple fallbacks

When to Use Which?
Use COALESCE for cross-database compatibility or when needing multiple fallbacks.

Use NVL only in Oracle environments for simple replacements.

Also check: https://github.com/ha1yang/sqlzoo_Solution/blob/main/COALESCE.sql
*/




