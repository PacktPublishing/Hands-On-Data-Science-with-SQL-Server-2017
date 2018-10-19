create or alter proc Models.procTrainModelTemporal
    @modelTypeId int
as
create table #result (result varbinary(max))

insert #result
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

if exists(select * from Models.ModelVersionsTemporal where ModelTypesId = @modelTypeId)
 begin
    update Models.ModelVersionsTemporal 
    set ModelStream = (select top 1 result from #result)
    where ModelTypesId = @modelTypeId
 end
else
 begin
    insert Models.ModelVersionsTemporal (ModelTypesId, ModelStream)
    select @modelTypeId, result from #result
 end
go