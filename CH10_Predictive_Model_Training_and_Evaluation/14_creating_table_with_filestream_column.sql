use DemoModel
go

create table Models.ModelVersions
(
Id int not null identity
, ModelTypesId int not null
, StreamId uniqueidentifier rowguidcol not null
    constraint df_ModelVersions_StreamId default(newid())
, CreationDate datetime2 not null 
    constraint df_ModelVersions__CreationDate default(sysdatetime())
, ModelStream varbinary(max) filestream
, constraint pk_ModelVersions primary key (Id)
, constraint fk_ModelVersions_ModelTypes foreign key (ModelTypesId) 
    references Models.ModelTypes (Id)
, constraint uq_ModelVersions_StreamId unique (StreamId)
);