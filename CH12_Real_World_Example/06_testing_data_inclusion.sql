select a.RecordId
    , c.PhoneId
from SourceData.Actions as a
    full join SourceData.Contracts as c on c.PhoneId = a.PhoneId
where a.RecordId is null
    or c.PhoneId is null