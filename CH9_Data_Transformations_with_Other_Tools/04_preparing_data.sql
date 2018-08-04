SELECT ProductID, ListPrice
  , (SELECT MIN(ListPrice) FROM Production.Product WHERE ListPrice != 0) AS MinListPrice
  , (SELECT MAX(ListPrice) FROM Production.Product WHERE ListPrice != 0) AS MaxListPrice
FROM Production.Product 
WHERE ListPrice != 0