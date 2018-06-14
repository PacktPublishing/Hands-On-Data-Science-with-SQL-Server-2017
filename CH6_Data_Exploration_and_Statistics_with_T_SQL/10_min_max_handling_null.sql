SELECT 
  MIN(ISNULL(VacationHours, 0)) as MinVacationHours
  , MAX(ISNULL(VacationHours, 0)) as MaxVacationHours
FROM HumanResources.EmpCopy