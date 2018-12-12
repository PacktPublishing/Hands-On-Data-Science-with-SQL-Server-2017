MERGE Staging.Products AS sp 
USING Landing.Products AS lp
  ON sp.ProductKey = lp.ProductKey
WHEN MATCHED THEN
  UPDATE SET
    ProductName = lp.ProductName
    , ListPrice = lp.ListPrice
    , Discontinued = 0
WHEN NOT MATCHED BY TARGET THEN
  INSERT (ProductKey, ProductName, ListPrice) 
  VALUES (lp.ProductKey, lp.ProductName, lp.ListPrice)
WHEN NOT MATCHED BY SOURCE THEN
  UPDATE SET Discontinued = 1   -- this is a logical delete
                                -- when we want actual delete, 
                                -- we'll just write DELETE
;