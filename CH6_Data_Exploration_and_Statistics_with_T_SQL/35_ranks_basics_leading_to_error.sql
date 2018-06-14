SELECT
  ProductID
  , Name
  , ListPrice
  , StandardCost
  , ROW_NUMBER() OVER() AS SerialNumber
FROM Production.Product