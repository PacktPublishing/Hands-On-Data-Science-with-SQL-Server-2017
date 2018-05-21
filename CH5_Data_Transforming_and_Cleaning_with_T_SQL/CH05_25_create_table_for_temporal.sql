USE DemoCust
GO

CREATE SCHEMA Src AUTHORIZATION dbo

CREATE TABLE Src.Products
(
ProductKey int not null identity
, ProductName nvarchar(50) not null
, ListPrice dec(8, 2) not null
, CONSTRAINT pk_Products PRIMARY KEY (ProductKey)
)
GO