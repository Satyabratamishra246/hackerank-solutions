-- P(R) represents a pattern drawn by Julia in R rows.
-- Write a query to print the pattern P(20).

DECLARE @var int               -- Declare 
SELECT @var = 20               -- Initialization 
WHILE @var > 0                 -- condition 
BEGIN                          -- Begin 
PRINT replicate('* ', @var)    -- Print 
SET @var = @var - 1            -- decrement 
END;