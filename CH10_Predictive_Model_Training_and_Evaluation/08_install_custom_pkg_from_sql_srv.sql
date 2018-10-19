exec sp_execute_external_script
    @language = N'R'
    , @script = N'install.packages("recommenderlab");'

-- this will return an error