CREATE TABLE Src.OrderLines
(
Id int not null identity
, ProductId int not null
, UnitPrice dec(8,2) not null
, Quantity int not null
, TotalPrice dec(8,2) not null
, CONSTRAINT pk_OrderLines PRIMARY KEY (Id)
)