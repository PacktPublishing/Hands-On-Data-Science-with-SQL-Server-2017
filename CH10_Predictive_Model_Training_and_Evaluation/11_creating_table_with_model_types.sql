USE DemoModel
go
CREATE TABLE Models.ModelTypes
(
Id int not null identity
, ModelName nvarchar(50) not null
, Description nvarchar(250) not null
, CONSTRAINT pk_ModelTypes PRIMARY KEY (Id)
);