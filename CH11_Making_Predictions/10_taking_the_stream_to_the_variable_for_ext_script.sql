declare @stream varbinary(max) = 
    (select ModelStream from Models.ModelVersions where Id = 3)