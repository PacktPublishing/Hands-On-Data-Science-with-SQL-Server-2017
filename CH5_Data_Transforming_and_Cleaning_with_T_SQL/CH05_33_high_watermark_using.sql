TRUNCATE TABLE Landing.Products

DECLARE @start datetime2 = 
  (SELECT LastLoad FROM Config.HighWatermark WHERE TableName = 'Src.Products')
DECLARE @end datetime2 = SYSUTCDATETIME()

INSERT Landing.Products (ProductKey, ProductName, ListPrice)
SELECT ProductKey, ProductName, ListPrice
FROM Src.Products
WHERE @start <= ValidFrom OR @start IS NULL

UPDATE Config.HighWatermark SET LastLoad = @end WHERE TableName = 'Src.Products'