UPDATE Src.OrderLines
SET Quantity = 3
  , TotalPrice = UnitPrice * 3
WHERE Id = 1