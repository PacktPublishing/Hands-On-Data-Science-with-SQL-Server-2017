;WITH cte AS
(
SELECT ProductID, ListPrice
  , (SELECT MIN(ListPrice) FROM Production.Product WHERE ListPrice != 0) AS MinListPrice
  , (SELECT MAX(ListPrice) FROM Production.Product WHERE ListPrice != 0) AS MaxListPrice
FROM Production.Product 
WHERE ListPrice != 0
), ctest AS
(
SELECT ProductID, ListPrice
  , (ListPrice - MinListPrice) / (MaxListPrice - MinListPrice) as NormalizedListPrice
FROM cte
)
SELECT MIN(NormalizedListPrice)
  , MAX(NormalizedListPrice)
FROM ctest