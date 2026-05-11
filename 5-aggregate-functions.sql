/*
Aggregate functions like SUM and COUNT take many rows
 and summarise them into a single row.


The result of a SELECT statement may contain identical rows.
We can remove these duplicates using the DISTINCT key word.


ORDER BY allows us to see the result of a SELECT in a particular order.
We may indicate ASC or DESC for ascending (smallest first, largest last)
or descending order.
If you don't use ORDER BY the results given might be in any order.
*/

/*
 World table 
 name	    continent	area	population	gdp
Afghanistan	 Asia	    652230	25500100	20343000000
Albania	     Europe	    28748	2831741	    12960000000
Algeria	     Africa	    2381741	37100000	188681000000
Andorra	     Europe	    468	    78115	    3712000000
Angola	     Africa	    1246700	20609294	100990000000
...
*/

--The total population and GDP of Europe.
SELECT SUM(population), SUM(gdp)
  FROM world
  WHERE continent = 'Europe'
  

-- What are the regions?
SELECT DISTINCT continent FROM world


/* Show the name and population for each country
 with a population of more than 100000000.
 Show countries in descending order of population. */
SELECT name, population
  FROM world
  WHERE population > 100000000
  ORDER BY population DESC
 
 
 -- Show the total population of the world.
SELECT SUM(population) FROM world


-- Give the total GDP of Africa
SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa'


-- How many countries have an area of at least 1000000
SELECT COUNT(name)
FROM world
WHERE area >= 1000000


-- What is the total population of ('Estonia', 'Latvia', 'Lithuania')
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')


/* For each continent show the continent and number of countries
 with populations of at least 10 million. */
SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent


-- List the continents that have a total population of at least 100 million.
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000
