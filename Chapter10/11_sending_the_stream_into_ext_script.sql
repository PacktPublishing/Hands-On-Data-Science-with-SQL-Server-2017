declare @tStream varbinary(max) = 
    (select ModelStream from Models.ModelVersions where Id = 3)
exec sp_execute_external_script
    @language = N'R'
    , @script = N'
        #code will be written here    
    '
    , @params = N'@stream varbinary(max)'
    , @stream = @tStream