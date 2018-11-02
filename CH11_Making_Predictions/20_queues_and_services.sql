-- the queue and the service to which requests for training come
create queue TrainingResponseQueue

create service TrainingResponseService 
on queue TrainingResponseQueue (AsyncTrainingContract)

-- the queue and the service from which requests for training depart
create queue TrainingRequestQueue

create service TrainingRequestService 
on queue TrainingRequestQueue