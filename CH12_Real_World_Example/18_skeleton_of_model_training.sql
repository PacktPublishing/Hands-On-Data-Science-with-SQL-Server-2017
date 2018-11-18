create table #models
(
ModelStream varbinary(max)
, PredictedUnits nvarchar(10) null 
)

insert #models (ModelStream)
exec sp_execute_external_script @language = N'R'
    , @script = N'        #shortened here    '
    , @input_data_1 = @sqlMin

update #models set PredictedUnits = 'min'

insert #models (ModelStream)
exec sp_execute_external_script @language = N'R'
    , @script = N'        #shortened here    '
    , @input_data_1 = @sqlPc

update #models set PredictedUnits = 'pc' where PredictedUnits is null