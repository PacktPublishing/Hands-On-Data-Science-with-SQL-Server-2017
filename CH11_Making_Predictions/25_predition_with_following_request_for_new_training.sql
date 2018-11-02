declare @tStream varbinary(max) = 
    (select ModelStream from Models.ModelVersions where Id = 3)
declare @userId nvarchar(10) = 'u10011'
    , @userIndex int

;with cte as
(
select userId, row_number() over(order by userId) as rn from RatingMatrix 
)
select @userIndex = rn from cte where UserId = @userId

exec sp_execute_external_script
    @language = N'R'
    , @script = N'
        library(recommenderlab);

        #adjusts the data for the model one more time
        rownames(InputDataSet) <- InputDataSet[,1];
        InputDataSet[,1] <- NULL;
        matrix <- as(InputDataSet, "realRatingMatrix");
        
        #takes trained predictive model
        newModel <- unserialize(as.raw(stream));
        #create an matrix of user indexes
        newData <- matrix[userIndex,];

        #PREDICTION
        user <- predict(newModel, newData, n=movieCount, type="topNList");

        #list of predicted movies (their indexes)
        result <- c(as(user, "list"));
        #transforms indexes to movie IDs
        movieIndexes <- as.integer(unlist(result, use.names=FALSE));

        #movie IDs back to an user -> result of the script
        OutputDataSet <- as.data.frame(colnames(InputDataSet)[movieIndexes]);
    '
    , @input_data_1 = N'select * from RatingMatrix'
    , @params = N'@stream varbinary(max), @userIndex int, @movieCount int'
    , @stream = @tStream
    , @userIndex = @userIndex
    , @movieCount = 5

-- request for the retraining
declare @conversation_handle uniqueidentifier;

-- dialog is started between two services
begin dialog conversation @conversation_handle
from service TrainingRequestService
to service 'TrainingResponseService'
on contract AsyncTrainingContract
with encryption = off;

-- message is sent to the new conversation
send on conversation @conversation_handle
message type AsyncTrainingRequest('<TrainingRequest/>'