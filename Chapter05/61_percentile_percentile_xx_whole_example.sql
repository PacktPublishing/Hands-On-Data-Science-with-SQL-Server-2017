-- preparing table for sample data
DROP TABLE IF EXISTS #test
CREATE TABLE #test
(
Number int
)

-- generating trivial data
DECLARE @i int = 1
WHILE @i <= 3 -- odd number of records
 BEGIN
  INSERT #test VALUES (@i)
  SET @i += 1
 END

-- observing results of PERCENTILE functions
-- and comparing it with AVG
SELECT * 
  , PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Number) OVER() as PCont
  , PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY Number) OVER() as PDisc
  , AVG(Number * 1.) OVER(
        ORDER BY Number 
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) as Average
FROM #test

-- adding one more record to have even number of records
INSERT #test VALUES (8)

-- observing results of PERCENTILE functions again
-- and comparing it with AVG
SELECT * 
  , PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Number) OVER() as PCont
  , PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY Number) OVER() as PDisc
  , AVG(Number * 1.) OVER(
        ORDER BY Number 
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) as Average
FROM #test