CREATE SCHEMA Analytics AUTHORIZATION dbo

CREATE TABLE Analytics.Orders
(
OrderLineId int NOT NULL
, ProductKey int NOT NULL
, ProductName nvarchar(50) NOT NULL
, UnitPrice decimal(8, 2) NOT NULL
, Quantity int NOT NULL
, TotalPrice decimal(8, 2) NULL
, CONSTRAINT pk_Orders PRIMARY KEY (OrderLineId)
)
GO