declare @x table (x int)
insert @x
exec sp_execute_external_script
    @language = N'R'
    , @script = N'
        OutputDataSet <- data.frame(as.Date.factor(theDate));
    '
    , @params = N'@theDate date'
    , @theDate = @monthAndYear