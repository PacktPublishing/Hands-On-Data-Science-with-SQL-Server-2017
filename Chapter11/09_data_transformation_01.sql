select
    contracts.PhoneId
    , contracts.IsCorporate
    , contracts.CitySize
    , actions.ActionRoute
    , actions.DateAndTime
    , actions.Units
    , actions.Unit
    , actions.RecomputeUnits
from SourceData.Contracts as contracts
    join SourceData.Actions as actions on contracts.PhoneId = actions.PhoneId
where not (actions.Units > 1 
    and actions.Unit = 'pc' 
    and actions.UnitPrice = -1
    and actions.Subtotal != 0)
    and actions.Unit is not null