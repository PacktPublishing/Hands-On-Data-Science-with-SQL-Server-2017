USE DemoCust
go

CREATE SCHEMA Config AUTHORIZATION dbo

CREATE TABLE Config.HighWatermark
(
TableName nvarchar(255) not null CONSTRAINT pk_HighWatermark PRIMARY KEY
, LastLoad datetime2 null
)
INSERT Config.HighWatermark (TableName) VALUES ('Src.Products')