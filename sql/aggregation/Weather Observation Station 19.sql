-- Query the Euclidean Distance between points p1 and p2 and format your answer to display 4 decimal digits.

SELECT CAST(sqrt(power(max(LAT_N) - min(LAT_N), 2) + power(max(LONG_W) - min(LONG_W), 2)) AS DECIMAL (10,4))
FROM STATION;