SELECT ProductKey, CHECKSUM(ProductKey, ProductName, ListPrice)
FROM Staging.Products