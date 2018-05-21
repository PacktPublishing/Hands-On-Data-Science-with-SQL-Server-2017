INSERT Analytics.Orders 
  (OrderLineId, ProductKey, ProductName, UnitPrice, Quantity, TotalPrice)
SELECT ol.Id as OrderLineId
  , ProductKey
  , ProductName
  , UnitPrice
  , Quantity
  , TotalPrice
FROM Src.OrderLines as ol
  JOIN Src.Products as p on ol.ProductId = p.ProductKey