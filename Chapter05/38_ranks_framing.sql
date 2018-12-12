SELECT
  p.Name AS ProductName
  , pc.Name AS CategoryName
  , ROW_NUMBER() OVER
    (
      PARTITION BY pc.Name 
      ORDER BY p.Name
    ) AS RecordNumber
FROM Production.Product AS p
  JOIN Production.ProductSubcategory AS psc 
    ON p.ProductSubcategoryID = psc.ProductSubcategoryID
  JOIN Production.ProductCategory AS pc 
    ON pc.ProductCategoryID = psc.ProductCategoryID