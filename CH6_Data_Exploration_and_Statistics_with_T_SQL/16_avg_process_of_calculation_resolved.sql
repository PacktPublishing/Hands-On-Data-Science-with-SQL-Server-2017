SELECT SUM(VacationHours * 1.) / COUNT(*) AS Avg1            -- result: 43.607   
  , SUM(VacationHours * 1.) / COUNT(VacationHours) AS Avg2   -- result: 50.787
  , AVG(VacationHours * 1.) AS Avg3                          -- result: 50.787
FROM HumanResources.EmpCopy