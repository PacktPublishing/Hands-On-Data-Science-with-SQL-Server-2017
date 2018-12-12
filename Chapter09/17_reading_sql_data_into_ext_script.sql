exec sp_execute_external_script
    @language = N'R'
    , @script = N'
        OutputDataSet <- InputDataSet
    '
    , @input_data_1 = N'select * from RatingMatrix'