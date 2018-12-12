select * from Models.ModelTypes
exec Models.procTrainModel @modelTypeId = 1
select * From Models.ModelVersions