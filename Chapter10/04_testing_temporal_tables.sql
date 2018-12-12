select Id, RecordStart from Models.ModelVersionsTemporal 
where ModelTypesId = 1

select Id, RecordStart from Models.ModelVersionsTemporalHistory
where ModelTypesId = 1
