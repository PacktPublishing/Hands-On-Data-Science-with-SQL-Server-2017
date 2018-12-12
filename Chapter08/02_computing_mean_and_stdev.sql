;WITH cte AS
(
SELECT ProductID, ListPrice
  , (SELECT AVG(ListPrice) FROM Production.Product WHERE ListPrice != 0) AS AvgListPrice
  , (SELECT STDEV(ListPrice) FROM Production.Product WHERE ListPrice != 0) AS StDevListPrice
FROM Production.Product 
WHERE ListPrice != 0
)
SELECT ProductID, ListPrice
  , (ListPrice - AvgListPrice) / StDevListPrice AS StandardizedListPrice
FROM cte