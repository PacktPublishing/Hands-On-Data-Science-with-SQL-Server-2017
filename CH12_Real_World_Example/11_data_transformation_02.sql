select
    contracts.PhoneId
    , iif(contracts.IsCorporate = 0, 'Private', 'Corporate') as IsCorporate
    , contracts.CitySize
    , sizes.Size
    , actions.ActionRoute
    , actions.DateAndTime
    , actions.Units
    , actions.Unit
    , actions.RecomputeUnits
from SourceData.Contracts as contracts
    join SourceData.Actions as actions on contracts.PhoneId = actions.PhoneId
    join Helpers.CitySizes as sizes on contracts.CitySize 
        between sizes.MinAmount and sizes.MaxAmount
where not (actions.Units > 1 
    and actions.Unit = 'pc' 
    and actions.UnitPrice = -1
    and actions.Subtotal != 0)
    and actions.Unit is not null