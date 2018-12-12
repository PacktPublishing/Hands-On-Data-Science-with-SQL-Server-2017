create or alter proc Models.procPredict
    @isCorporate nvarchar(10)
    , @size nvarchar(10)
    , @actionRoute nchar(1) = N'O'
    , @monthAndYear date = '2019-01-31'
    , @predictedUnit nvarchar(10) = 'min'
as
-- TO BE CONTINUED