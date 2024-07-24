-- The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score.
-- If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of 0 from your result.

with main_table as (
SELECT h.hacker_id as h_id,h.name as n,s.challenge_id as s_id,max(s.score) as max_score
FROM Hackers h
JOIN Submissions s ON s.hacker_id=h.hacker_id
GROUP BY h.hacker_id,h.name,s.challenge_id
    )
SELECT h_id,n, sum(max_score) as total_score
FROM main_table
GROUP BY h_id,n
HAVING sum(max_score)>0
ORDER BY total_score desc,h_id;