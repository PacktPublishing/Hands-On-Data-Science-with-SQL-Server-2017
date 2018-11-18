WITH newData as ( 
    SELECT * FROM (values(@isCorporate, @size, @actionRoute, (select x from @x))) 
    as t(IsCorporate, Size, ActionRoute, MonthAndYear)
)
SELECT newData.*, p.*
FROM PREDICT(MODEL = @model, DATA = newData) WITH(Units_Pred float) as p