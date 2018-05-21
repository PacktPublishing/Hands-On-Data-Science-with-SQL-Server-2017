DROP TABLE IF EXISTS #res -- temporary table used to catch what was done
CREATE TABLE #res (Id int, Discontinued bit, WhatHappens nvarchar(10))

-- common table expression is added to resolve a state of every record
;WITH cte AS
(
SELECT lp.*
  , IIF(sp.ProductKey is null, 'UPDATE', 'NONE') as DesiredAction
FROM Landing.Products AS lp
  LEFT JOIN Staging.Products as sp ON lp.ProductKey = sp.ProductKey
    AND CHECKSUM(lp.ProductKey, lp.ProductName, lp.ListPrice) = 
      CHECKSUM(sp.ProductKey, sp.ProductName, sp.ListPrice)
)
MERGE Staging.Products AS sp 
USING cte AS lp -- Landing.Products is used no more, instead the CTE is used
  ON sp.ProductKey = lp.ProductKey 
WHEN MATCHED and DesiredAction = 'UPDATE' THEN -- new condition added
  UPDATE SET
    ProductName = lp.ProductName
    , ListPrice = lp.ListPrice
    , Discontinued = 0
WHEN NOT MATCHED BY TARGET THEN -- this node remains without changes
  INSERT (ProductKey, ProductName, ListPrice) 
  VALUES (lp.ProductKey, lp.ProductName, lp.ListPrice)
WHEN NOT MATCHED BY SOURCE and sp.Discontinued = 0 THEN -- new condition added
  UPDATE SET Discontinued = 1 -- this is a logical delete
                                -- when we want actual delete, 
                                -- we'll just write DELETE
OUTPUT inserted.Id, Inserted.Discontinued, $action AS WhatHappens into #res
;

SELECT * FROM #res -- inspecting results