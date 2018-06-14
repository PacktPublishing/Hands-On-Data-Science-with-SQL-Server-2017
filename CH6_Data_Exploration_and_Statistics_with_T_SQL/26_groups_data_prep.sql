DROP TABLE IF EXISTS #src

SELECT
  c.ProductCategoryID
  , c.Name AS CategoryName
  , psc.ProductSubcategoryID
  , psc.Name AS SubcategoryName
  , p.ProductID
  , p.Name AS ProductName
  , ISNULL(p.Color, 'N/A') AS Color
  , p.ListPrice
  , p.StandardCost
INTO #src
FROM Production.ProductCategory AS c
  JOIN Production.ProductSubcategory AS psc ON c.ProductCategoryID = psc.ProductCategoryID
  JOIN Production.Product AS p on p.ProductSubcategoryID = psc.ProductSubcategoryID