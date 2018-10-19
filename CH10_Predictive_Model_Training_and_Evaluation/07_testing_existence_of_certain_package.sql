exec sp_execute_external_script
    @language = N'R'
    , @script = N'
        OutputDataSet <- 
        as.data.frame("recommenderlab" %in% rownames(installed.packages()));'
with result sets ((PackageExists bit))