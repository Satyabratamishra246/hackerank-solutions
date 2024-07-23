-- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. 
-- Your result cannot contain duplicates.

SELECT CITY FROM STATION WHERE CITY LIKE "[A,E,I,O,U]%" AND CITY LIKE "%[A,E,I,O,U]";