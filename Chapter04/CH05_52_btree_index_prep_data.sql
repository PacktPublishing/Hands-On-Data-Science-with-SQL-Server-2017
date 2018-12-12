SET NOCOUNT ON
DECLARE @i int = 1
WHILE @i <= 100000
 BEGIN
  INSERT Analytics.Orders (ProductKey, ProductName, UnitPrice, Quantity)
  VALUES (ROUND(RAND() * 10 + 1, 0), N'Product ' + CAST(@i as nvarchar)
    , ROUND(RAND() * 1000 + 1, 2), ROUND(RAND() * 10 + 1, 0))
  set @i += 1
 end

UPDATE Analytics.Orders SET TotalPrice = UnitPrice * Quantity