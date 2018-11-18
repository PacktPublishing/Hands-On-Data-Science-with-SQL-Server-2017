select count(*)
from SourceData.Contracts
where PhoneId is null

select count(*) 
from SourceData.Actions
where RecordId is null

select count(*)
from SourceData.Actions
where Units is null