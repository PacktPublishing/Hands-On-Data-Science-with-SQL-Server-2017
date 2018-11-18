select PhoneId
from SourceData.Contracts
group by PhoneId
having count(*) > 1

select RecordId
from SourceData.Actions
group by RecordId
having count(*) > 1