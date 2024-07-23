-- A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.

WITH CTE AS (
    SELECT 
        LAT_N,
        ROW_NUMBER() OVER (ORDER BY LAT_N) AS RowIndex,
        COUNT(*) OVER () AS TotalRows
    FROM STATION
)
SELECT 
    CAST(AVG(LAT_N) AS DECIMAL(10,4)) AS Median_LAT_N
FROM 
    CTE
WHERE 
    RowIndex = (TotalRows + 1) / 2
    OR RowIndex = (TotalRows + 2) / 2;