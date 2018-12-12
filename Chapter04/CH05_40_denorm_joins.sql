SELECT * 
FROM Src.OrderLines as ol
  JOIN Src.Products as p on ol.ProductId = p.ProductKey