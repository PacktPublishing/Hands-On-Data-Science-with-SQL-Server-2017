create table Models.ModelVersionsTemporal
(
Id int not null identity
, ModelTypesId int not null
, ModelStream varbinary(max)
, RecordStart datetime2 generated always as row start
, RecordEnd datetime2 generated always as row end
, period for system_time (RecordStart, RecordEnd)
, constraint pk_ModelVersionsTemporal primary key (Id)
, constraint fk_ModelVersionsTemporal_ModelTypes foreign key (ModelTypesId) 
    references Models.ModelTypes (Id)
)
with
(system_versioning = on (history_table = Models.ModelVersionsTemporalHistory))