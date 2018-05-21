TRUNCATE TABLE Staging.Products
TRUNCATE TABLE Landing.Products
BULK INSERT Landing.Products
FROM 'C:\SQLDS\CSVs\products.csv'
WITH 
(
FIELDTERMINATOR =';', 
ROWTERMINATOR = '\n',
FIRSTROW = 2
)