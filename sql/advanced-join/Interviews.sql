-- Samantha interviews many candidates from different colleges using coding challenges and contests.
-- Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id. 
-- Exclude the contest from the result if all four sums are 0.
-- Note: A specific contest can be used to screen candidates at more than one college, but each college only holds 1 screening contest.


WITH Sub_stats_cte as
(
select challenge_id, SUM(total_Submissions) as total_submissions, SUM(total_accepted_Submissions) as total_accepted_submissions 
from Submission_Stats group by challenge_id 
), View_stats_cte as
(
select challenge_id, SUM(total_views) as total_views, SUM(total_unique_views) as total_unique_views 
from View_Stats group by challenge_id 
)
SELECT con.contest_id, con.hacker_id, con.name, ISNULL(SUM(total_submissions),0) total_submissions, 
ISNULL(SUM(total_accepted_submissions),0) total_accepted_submissions,
ISNULL(SUM(total_views),0) total_views, ISNULL(SUM(total_unique_views),0) total_unique_views
FROM Contests con
inner join Colleges col on con.contest_id = col.contest_id
inner join Challenges ch on col.college_id = ch.college_id
LEFT JOIN Sub_stats_cte c1 ON ch.challenge_id = c1.challenge_id 
LEFT JOIN View_stats_cte c2 ON ch.challenge_id = c2.challenge_id
GROUP BY con.contest_id, con.hacker_id, con.name
HAVING SUM(total_submissions)>0
OR SUM(total_accepted_submissions)>0
OR SUM(total_views)>0
OR SUM(total_unique_views)>0
ORDER BY contest_id;




