exec sp_execute_external_script
    @language = N'R'
    , @script = N'
        #formula for linear regression
        formula <- Units ~ IsCorporate + Size + ActionRoute + MonthAndYear;
        actions <- InputDataSet;

        #factorization of the date
        actions$MonthAndYear <- as.Date.factor(actions$MonthAndYear);

        #divide data for training and scoring
        sample.size = 0.85 * nrow(actions);
        sample.count <- sample(seq_len(nrow(actions)), size = sample.size);
        actions.training <- actions[sample.count, ];
        actions.test <- actions[-sample.count, ];

        #model from training data
        model <- rxLinMod(formula, actions.training);
        #prediction from test data
        prediction <- rxPredict(modelObject = model, data = actions.test);

        #result of prediction back to the test data
        actions.test$PredictedValue <- prediction$Units_Pred

        #how to obtain column names from the prediction data set
        #OutputDataSet <- data.frame(colnames(prediction));

        #results of the training
        OutputDataSet <- data.frame(actions.test);

    '
    , @input_data_1 = N'select PhoneId, IsCorporate, Size, ActionRoute
            , MonthAndYear, Units, Unit, RecomputeUnits 
        from SourceData.viInputCalls where MonthAndYear > ''2017-01-01'' and Unit = ''min'''

with result sets ((PhoneId int, IsCorporate nvarchar(10), Size nvarchar(10), ActionRoute nchar(1)
    , MonthAndYear int, Units int, Unit nvarchar(10), RecomputeUnits bit, PredictedValue float))