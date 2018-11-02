select Id, CreationDate from Models.ModelVersions 
where ModelTypesId = 1
order by CreationDate desc