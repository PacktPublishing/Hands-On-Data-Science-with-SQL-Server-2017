declare @stream varbinary(max) = 
    (select ModelStream from Models.ModelVersions where Id = 3)
select @stream as ModelStream