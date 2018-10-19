exec sp_execute_external_script
    @language = N'R'
    , @script = N'OutputDataSet <- as.data.frame(installed.packages());'
with result sets undefined