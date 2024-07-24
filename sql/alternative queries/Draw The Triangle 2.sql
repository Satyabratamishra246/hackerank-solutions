-- P(R) represents a pattern drawn by Julia in R rows.
-- Write a query to print the pattern P(20).


DECLARE @var int                  -- Declare  
SELECT @var = 1                   -- initialization  
WHILE @var <= 20                   -- Condition 
BEGIN                             -- Begin 
PRINT replicate('* ', @var)       -- Print 
SET @var = @var + 1               -- Set 
END  ;