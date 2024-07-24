-- Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge.
-- Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

SELECT s.hacker_id,h.name
FROM submissions s
JOIN challenges c ON c.challenge_id=s.challenge_id
JOIN difficulty d ON d.difficulty_level=c.difficulty_level
JOIN hackers h ON h.hacker_id=s.hacker_id
WHERE s.score=d.score AND d.difficulty_level=c.difficulty_level
GROUP BY s.hacker_id,h.name
HAVING count(s.challenge_id)>1
ORDER BY count(s.challenge_id) desc, s.hacker_id;