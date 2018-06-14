-- table is copied to new one
SELECT * INTO HumanResources.EmpCopy FROM HumanResources.Employee

-- some columns are modified to allow null
ALTER TABLE HumanResources.EmpCopy
ALTER COLUMN VacationHours smallint NULL

ALTER TABLE HumanResources.EmpCopy
ALTER COLUMN SickLeaveHours smallint NULL

-- every 7th record has VacationHours set to NULL
UPDATE HumanResources.EmpCopy 
SET VacationHours = NULL WHERE BusinessEntityID % 7 = 0

-- every 9th record has SickLeaveHours set to NULL
UPDATE HumanResources.EmpCopy 
SET SickLeaveHours = NULL WHERE BusinessEntityID % 9 = 0