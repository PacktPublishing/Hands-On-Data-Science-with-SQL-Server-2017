select * from SourceData.Actions where Units = 96342016
select count(*) from SourceData.Actions 
where Units > 1 
    and unit = 'pc' 
    and UnitPrice = -1
    and Subtotal != 0