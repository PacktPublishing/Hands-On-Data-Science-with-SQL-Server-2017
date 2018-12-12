DECLARE @missingProductsCount int
  , @incorrectProductsCount int
  , @missingErrMessage nvarchar(200) = N'Some products are unknown in Order             Lines'
  , @incorrectErrMessage nvarchar(200) = N'Some products have unknown quantity or         unit price'

SELECT @missingProductsCount = COUNT(*)
FROM Src.OrderLines as ol
WHERE 
    NOT EXISTS(SELECT * FROM Src.Products as p WHERE p.ProductKey = ol.ProductId)

IF @missingProductsCount > 0
 BEGIN
  SET @missingErrMessage = REPLACE(@missingErrMessage, 'Some',                         @missingProductsCount);
  THROW 60000, @missingErrMessage, 1;
 END

SELECT @incorrectProductsCount = COUNT(*)
FROM Src.OrderLines
WHERE UnitPrice IS NULL OR Quantity IS NULL

IF @incorrectProductsCount > 0
 BEGIN
  SET @incorrectErrMessage = REPLACE(@incorrectErrMessage, 'Some',                     @incorrectProductsCount);
  THROW 60001, @incorrectErrMessage , 1;
 END