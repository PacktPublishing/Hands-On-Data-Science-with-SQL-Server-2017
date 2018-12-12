INSERT Src.OrderLines (ProductId, UnitPrice, Quantity)
VALUES (100, 10.52, 1)

SELECT * FROM Src.OrderLines

UPDATE Src.OrderLines SET Quantity = 4 WHERE ProductId = 100

SELECT * FROM Src.OrderLines