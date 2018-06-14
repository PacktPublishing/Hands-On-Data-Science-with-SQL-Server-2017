SELECT SUM(VacationHours) AS SumVacationHours            -- result: 12646
  , SUM(ISNULL(VacationHours, 0)) AS SumVacationHours    -- result: also 12646
FROM HumanResources.EmpCopy