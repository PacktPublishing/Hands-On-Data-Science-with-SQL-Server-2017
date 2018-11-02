-- unique identifier of the conversation
declare @conversation_handle uniqueidentifier;

-- dialog is started between two services
begin dialog conversation @conversation_handle
from service TrainingRequestService
to service 'TrainingResponseService'
on contract AsyncTrainingContract
with encryption = off;

-- message is sent to the new conversation
send on conversation @conversation_handle
message type AsyncTrainingRequest('<TrainingRequest/>');