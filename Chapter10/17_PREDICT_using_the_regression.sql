DECLARE @model varbinary(max) = 
    (SELECT ModelStream from Models.ModelVersions where ModelTypesId = 3);

WITH newData as ( 
    SELECT * FROM (values('S', 'F', 1), ('S', 'F', 0)) 
    as t(MaritalStatus, Gender, TotalChildren)
)
SELECT d.*, p.*
FROM PREDICT(MODEL = @model, DATA = newData) WITH(YearlyIncome_Pred float) as p