USE DemoCust
go

CREATE SCHEMA Landing AUTHORIZATION dbo
go

CREATE TABLE Landing.Products
(
ProductKey int not null
, ProductName nvarchar(50) not null
, ListPrice dec(8, 2) not null
)

CREATE TABLE Landing.Products2
(
ProductKey int not null
, ProductName nvarchar(50) not null
, ListPrice dec(8,2) not null
)
go