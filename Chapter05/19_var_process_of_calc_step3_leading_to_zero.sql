; WITH Diffs AS
(
SELECT
  VacationHours * 1. - 
  (
  SELECT
    SUM(VacationHours * 1.) / COUNT(VacationHours) AS Mean
  FROM HumanResources.EmpCopy
  ) as Differences
FROM HumanResources.EmpCopy
WHERE VacationHours IS NOT NULL
)
SELECT SUM(Differences) FROM Diffs