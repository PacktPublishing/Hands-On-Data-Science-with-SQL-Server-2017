SELECT
  p.Name AS ProductName
  , pc.Name AS CategoryName
  , p.ListPrice
  , RANK() OVER
    (
      PARTITION BY pc.Name 
      ORDER BY ListPrice DESC
    ) AS RecordRank
  , DENSE_RANK() OVER
    (
      PARTITION BY pc.Name 
      ORDER BY ListPrice DESC
    ) AS DenseRecordRank
FROM Production.Product AS p
  JOIN Production.ProductSubcategory AS psc 
    ON p.ProductSubcategoryID = psc.ProductSubcategoryID
  JOIN Production.ProductCategory AS pc 
    ON pc.ProductCategoryID = psc.ProductCategoryID