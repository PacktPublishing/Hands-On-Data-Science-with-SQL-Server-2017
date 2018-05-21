CREATE OR ALTER VIEW Analytics.viOrders
AS
SELECT ol.Id as OrderLineId
  , ProductKey
  , ProductName
  , UnitPrice
  , Quantity
  , TotalPrice
FROM Src.OrderLines as ol
  JOIN Src.Products as p on ol.ProductId = p.ProductKey
GO