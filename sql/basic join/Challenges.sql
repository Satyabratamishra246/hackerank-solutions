-- Julia asked her students to create some coding challenges.
-- Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order.
-- If more than one student created the same number of challenges, then sort the result by hacker_id.
-- If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

with m as (
SELECT hackers.hacker_id, name, count(challenge_id) as c, row_number() over (partition by count(challenge_id) order by count(challenge_id)) as rnk
FROM hackers
JOIN challenges ON hackers.hacker_id=challenges.hacker_id
GROUP BY hackers.hacker_id, name
)

SELECT hacker_id, name, c
FROM m
WHERE c in (SELECT c
            FROM m
            GROUP BY c
            HAVING count(c)=1)
        OR c= (SELECT max(c) FROM m)
        
ORDER BY c desc, hacker_id;