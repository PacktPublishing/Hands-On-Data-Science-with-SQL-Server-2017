create or alter proc Models.procPredict
    @isCorporate nvarchar(10)
    , @size nvarchar(10)
    , @actionRoute nchar(1) = N'O'
    , @monthAndYear date = '2019-01-31'
    , @predictedUnit nvarchar(10) = 'min'
as
declare @x table (x int)
insert @x
exec sp_execute_external_script
    @language = N'R'
    , @script = N'
        OutputDataSet <- data.frame(as.Date.factor(x));
    '
    , @params = N'@x date'
    , @x = @monthAndYear

DECLARE @model varbinary(max) = 
    (SELECT ModelStream from Models.ModelVersions where PredictedUnits = @predictedUnit
        and CreationDate = (select max(CreationDate) 
        from Models.ModelVersions where PredictedUnits = @predictedUnit)
    );

WITH newData as ( 
    SELECT * FROM (values(@isCorporate, @size, @actionRoute, (select x from @x))) 
    as t(IsCorporate, Size, ActionRoute, MonthAndYear)
)
SELECT newData.*, p.*
FROM PREDICT(MODEL = @model, DATA = newData) WITH(Units_Pred float) as p