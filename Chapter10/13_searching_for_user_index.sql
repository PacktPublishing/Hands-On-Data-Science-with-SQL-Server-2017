declare @tStream varbinary(max) = 
    (select ModelStream from Models.ModelVersions where Id = 3)
declare @userId nvarchar(10) = 'u10011'
    , @userIndex int

-- this CTE will create numbered list of user ids, the row number will be used as -- an user index
;with cte as
(
select userId, row_number() over(order by userId) as rn from RatingMatrix 
)
select @userIndex = rn from cte where UserId = @userId

exec sp_execute_external_script
    @language = N'R'
    , @script = N'
        newModel <- unserialize(as.raw(stream));
    '
    , @params = N'@stream varbinary(max), @userIndex int'
    , @stream = @tStream
    , @userIndex = @userIndex