select * from Models.ModelTypes
exec Models.procTrainModelTemporal @modelTypeId = 1
select * From Models.ModelVersionsTemporal
select * From Models.ModelVersionsTemporalHistory