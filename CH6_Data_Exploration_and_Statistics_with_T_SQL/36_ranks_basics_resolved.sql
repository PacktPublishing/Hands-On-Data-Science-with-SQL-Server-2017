SELECT
  ProductID
  , Name
  , ListPrice
  , StandardCost
  , ROW_NUMBER() OVER(ORDER BY Name) AS SerialNumber
FROM Production.Product