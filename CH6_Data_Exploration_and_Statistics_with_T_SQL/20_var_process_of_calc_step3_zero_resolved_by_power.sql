SELECT
  POWER(VacationHours * 1. - 
  (
  SELECT
    SUM(VacationHours * 1.) / COUNT(VacationHours) AS Mean
  FROM HumanResources.EmpCopy
  ), 2) as Differences
FROM HumanResources.EmpCopy
WHERE VacationHours IS NOT NULL