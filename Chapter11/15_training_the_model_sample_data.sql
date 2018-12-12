exec sp_execute_external_script
    @language = N'R'
    , @script = N'
        actions <- InputDataSet;

        #factorization of the date
        actions$MonthAndYear <- as.Date.factor(actions$MonthAndYear);

        #divide data for training and scoring
        sample.size = 0.85 * nrow(actions);
        sample.count <- sample(seq_len(nrow(actions)), size = sample.size);
        actions.training <- actions[sample.count, ];
        actions.test <- actions[-sample.count, ];
    '
    , @input_data_1 = N'select PhoneId, IsCorporate, Size, ActionRoute
            , MonthAndYear, Units, Unit, RecomputeUnits 
        from SourceData.viInputCalls'