create schema Models authorization dbo
go

create table Models.ModelVersions
(
Id int not null identity
, CreationDate datetime2 not null constraint df_ModelVersions_CreationDate         default (sysdatetime())
, ModelStream varbinary(max) not null
, PredictedUnits nvarchar(10) not null
, constraint pk_ModelVersions primary key (Id)
)
go