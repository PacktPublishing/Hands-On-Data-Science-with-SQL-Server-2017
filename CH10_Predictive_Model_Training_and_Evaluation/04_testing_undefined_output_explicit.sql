exec sp_execute_external_script
    @language = N'R'
    , @script = N'OutputDataSet <- as.data.frame(1+1);'
with result sets undefined