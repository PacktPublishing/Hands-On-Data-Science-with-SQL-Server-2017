SELECT SUM(VacationHours) / COUNT(*) AS Avg1            -- result: 43
  , SUM(VacationHours) / COUNT(VacationHours) AS Avg2   -- result: 50
  , AVG(VacationHours) AS Avg3                          -- result: 50
FROM HumanResources.EmpCopy