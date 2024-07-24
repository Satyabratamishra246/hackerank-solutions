-- Write a query to print all prime numbers less than or equal to 1000. Print your result on a single line, and use the ampersand (&) character as your separator (instead of a space).

--For example, the output for all prime numbers <=10 would be:
-- 2&3&5&7

WITH numbers AS (
    SELECT TOP 1000 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS next_int
    FROM sys.all_objects
), prime_candidates AS (
    SELECT 
        c.next_int AS c_next_int, 
        d.next_int AS d_next_int,
        c.next_int % d.next_int AS mod_next_int
    FROM numbers c
    CROSS JOIN numbers d
), mod_counts AS (
    SELECT 
        c_next_int, 
        SUM(CASE WHEN mod_next_int = 0 THEN 1 ELSE 0 END) AS mod_count
    FROM prime_candidates
    GROUP BY c_next_int
)
SELECT STRING_AGG(CAST(c_next_int AS VARCHAR(10)), '&') AS primes
FROM mod_counts
WHERE mod_count = 2;