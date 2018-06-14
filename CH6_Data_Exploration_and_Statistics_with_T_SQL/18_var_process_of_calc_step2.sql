SELECT
  VacationHours - 
  (
  SELECT
    SUM(VacationHours * 1.) / COUNT(VacationHours) AS Mean
  FROM HumanResources.EmpCopy
  ) AS Differences
FROM HumanResources.EmpCopy
WHERE VacationHours IS NOT NULL