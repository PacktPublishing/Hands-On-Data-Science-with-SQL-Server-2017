USE DemoCust
go

CREATE SCHEMA Staging AUTHORIZATION dbo
go

CREATE TABLE Staging.Products
(
Id int not null IDENTITY
, ProductKey int not null
, ProductName nvarchar(50) not null
, ListPrice dec(8, 2) not null
, Discontinued bit not null CONSTRAINT df_Products_Discontinued DEFAULT(0)
, CONSTRAINT pk_Products PRIMARY KEY (Id)
, CONSTRAINT uq_Products_ProductKey UNIQUE (ProductKey)
)
go