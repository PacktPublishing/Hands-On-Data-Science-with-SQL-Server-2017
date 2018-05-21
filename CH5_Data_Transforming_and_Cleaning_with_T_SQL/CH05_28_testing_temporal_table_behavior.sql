INSERT Src.Products (ProductName, ListPrice) 
VALUES ('My first product', 100)
WAITFOR DELAY '00:00:10'
INSERT Src.Products (ProductName, ListPrice) 
VALUES ('My second product', 110)
WAITFOR DELAY '00:00:10'
INSERT Src.Products (ProductName, ListPrice) 
VALUES ('My third product', 10)

SELECT * FROM Src.Products
SELECT * FROM Src.ProductsHistory