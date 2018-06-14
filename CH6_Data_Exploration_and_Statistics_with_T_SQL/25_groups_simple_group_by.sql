; WITH Src AS
(
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
FROM Production.ProductCategory AS c
  JOIN Production.ProductSubcategory AS psc ON c.ProductCategoryID = psc.ProductCategoryID
  JOIN Production.Product AS p on p.ProductSubcategoryID = psc.ProductSubcategoryID
)
SELECT SubcategoryName
  , COUNT(*) AS ProductCount
FROM Src
GROUP BY SubcategoryName