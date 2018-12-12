select Id, RecordStart 
from Models.ModelVersionsTemporal for system_time all
where ModelTypesId = 1
