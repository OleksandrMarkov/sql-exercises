/*
GROUP BY and HAVING

By including a GROUP BY clause functions such as
SUM and COUNT are applied to groups of items sharing values.

When you specify GROUP BY continent the result is that
you get only one row for each different value of continent.
All the other columns must be "aggregated" by one of SUM, COUNT ...

The HAVING clause allows use to filter the groups which are displayed.
The WHERE clause filters rows before the aggregation,
the HAVING clause filters after the aggregation.

If a ORDER BY clause is included we can refer to columns by their position.
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

-- For each continent show the number of countries:
SELECT continent, COUNT(name)
FROM world
GROUP BY continent

-- For each continent show the total population:
SELECT continent, SUM(population)
FROM world
GROUP BY continent

/*
WHERE and GROUP BY. The WHERE filter takes place before the aggregating function.
For each relevant continent show the number of countries
that has a population of at least 200000000.
*/
SELECT continent, COUNT(name)
FROM world
WHERE population>200000000
GROUP BY continent

/*
GROUP BY and HAVING. The HAVING clause is tested after the GROUP BY.
You can test the aggregated values with a HAVING clause.
Show the total population of those continents with
a total population of at least half a billion.
*/
SELECT continent, SUM(population)
FROM world
GROUP BY continent
HAVING SUM(population)>500000000