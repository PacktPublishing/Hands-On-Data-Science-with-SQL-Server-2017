SELECT
  p.Name AS ProductName
  , pc.Name AS CategoryName
  , p.ListPrice
  , NTILE(3) OVER
    (
      PARTITION BY pc.Name 
      ORDER BY ListPrice DESC
    ) AS Section
FROM Production.Product AS p
  JOIN Production.ProductSubcategory AS psc 
    ON p.ProductSubcategoryID = psc.ProductSubcategoryID
  JOIN Production.ProductCategory AS pc 
    ON pc.ProductCategoryID = psc.ProductCategoryID