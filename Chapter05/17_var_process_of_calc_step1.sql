SELECT
  SUM(VacationHours * 1.) / COUNT(VacationHours) AS Mean
FROM HumanResources.EmpCopy