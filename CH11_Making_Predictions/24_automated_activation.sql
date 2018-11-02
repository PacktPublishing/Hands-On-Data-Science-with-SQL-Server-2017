alter queue TrainingResponseQueue
    with activation
    ( 
      status = on,
      procedure_name = Models.procTrainModelAsync,
      max_queue_readers = 1,
      execute as self
    )
go