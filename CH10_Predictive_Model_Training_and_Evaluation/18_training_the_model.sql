exec sp_execute_external_script
    @language = N'R'
    , @script = N'
        #import needed library
        library("recommenderlab");
        #make the first column as a row names in further matrix
        rownames(InputDataSet) <- InputDataSet[,1];
        InputDataSet[,1] <- NULL;
        #create object realRating Matrix
        matrix <- as(InputDataSet, "realRatingMatrix");
        #create the model
        model <- Recommender(matrix, method="UBCF");
        #serialize the model and return it back to a caller
        OutputDataSet <- as.data.frame(serialize(model, NULL));
    '
    , @input_data_1 = N'select * from RatingMatrix'