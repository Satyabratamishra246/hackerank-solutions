-- You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. 
-- It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table.
-- If the End_Date of the tasks are consecutive, then they are part of the same project. Samantha is interested in finding the total number of different projects completed.
-- Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. 
-- If there is more than one project that have the same number of completion days, then order by the start date of the project.


WITH StartDates AS (
    SELECT Start_Date
    FROM Projects
    WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)
),
EndDates AS (
    SELECT End_Date
    FROM Projects
    WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)
)
SELECT 
    A.Start_Date, 
    MIN(B.End_Date) AS End_Date
FROM 
    StartDates A
    INNER JOIN EndDates B ON A.Start_Date < B.End_Date
GROUP BY 
    A.Start_Date
ORDER BY 
    DATEDIFF(DAY, A.Start_Date, MIN(B.End_Date)) ASC, 
    A.Start_Date;





