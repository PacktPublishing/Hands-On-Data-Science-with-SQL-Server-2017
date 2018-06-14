-- our sample
; WITH Diffs AS
(
SELECT
  POWER(VacationHours * 1. - 
  (
  SELECT
    SUM(VacationHours * 1.) / COUNT(VacationHours) AS Mean
  FROM HumanResources.EmpCopy
  ), 2) as PoweredDiff
FROM HumanResources.EmpCopy
WHERE VacationHours IS NOT NULL
)
SELECT SUM(PoweredDiff) / COUNT(PoweredDiff) AS [VARP]
  , SUM(PoweredDiff) / (COUNT(PoweredDiff) - 1) AS [VAR]
FROM Diffs

-- built-in VAR/VARP aggregates for comparison
SELECT VARP(VacationHours) AS [VARP]
  , VAR(VacationHours) AS [VAR]
FROM HumanResources.EmpCopy