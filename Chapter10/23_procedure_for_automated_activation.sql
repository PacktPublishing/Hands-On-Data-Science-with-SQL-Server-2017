create proc Models.procTrainModelAsync
as
DECLARE 
    @conversation_handle uniqueidentifier
    , @msgBody xml
    , @msgType sysname;
 
receive top (1)
@conversation_handle = conversation_handle,
@msgBody = CAST(message_body AS XML),
@msgType= message_type_name
from TrainingResponseQueue
 
if @msgType = N'AsyncTrainingRequest'
begin
    end conversation @conversation_handle;
    exec Models.procTrainModel
end
go