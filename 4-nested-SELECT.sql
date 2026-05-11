/* This tutorial looks at how we can use SELECT statements
 within SELECT statements to perform more complex queries.
 World table 
 name	    continent	area	population	gdp
Afghanistan	 Asia	    652230	25500100	20343000000
Albania	     Europe	    28748	2831741	    12960000000
Algeria	     Africa	    2381741	37100000	188681000000
Andorra	     Europe	    468	    78115	    3712000000
Angola	     Africa	    1246700	20609294	100990000000
...
*/

-- List each country name where the population is larger than that of 'Russia'.
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')


--Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
-- per capita GDP is the GDP divided by the population GDP/population
SELECT name
FROM world WHERE
continent = 'Europe' AND
gdp/population > (SELECT gdp/population
                  FROM world
				  WHERE name = 'United Kingdom')

				  
/*List the name and continent of countries
 in the continents containing either Argentina or Australia.
 Order by name of the country.*/
SELECT name, continent
FROM world
WHERE continent IN (SELECT continent
                    FROM world
                    WHERE name IN ( 'Argentina', 'Australia') )
ORDER BY name


/*Which country has a population that is more than United Kingdom
 but less than Germany? Show the name and the population.*/
SELECT name, population
FROM world
WHERE population > (SELECT population
                    FROM world
                    WHERE name = 'United Kingdom') AND
      population < (SELECT population
                    FROM world
                    WHERE name = 'Germany')
					
					
/* Germany (population roughly 80 million) has the largest population
 of the countries in Europe. Austria (population 8.5 million) has 11%
 of the population of Germany.
 Show the name and the population of each country in Europe.
 Show the population as a percentage of the population of Germany.
 The format should be Name, Percentage for example:

name	percentage
Albania	3%
Andorra	0%
Austria	11%
...	    ...
			*/
SELECT name,
       CONCAT(ROUND(100*population/
                                   (SELECT population FROM world
                                    WHERE name = 'Germany'))
           ,'%') AS percentage
FROM  world
WHERE continent ='Europe'
