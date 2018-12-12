select PhoneId, IsCorporate, Size, ActionRoute
    , MonthAndYear, Units, Unit, RecomputeUnits 
from SourceData.viInputCalls 
where MonthAndYear > '2017-01-01' and Unit = 'min'