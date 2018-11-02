declare @stream varbinary(max) = 
(select ModelStream 
from Models.ModelVersionsTemporal 
    for system_time as of '2018-10-18 17:48:10.0080001'
where ModelTypesId = 1)

select @stream as ModelStream