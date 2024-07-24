-- Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

--Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

SELECT sum(city.population) 
FROM city
JOIN Country ON Country.code=City.countrycode
WHERE Country.continent='Asia'
GROUP BY country.continent;
