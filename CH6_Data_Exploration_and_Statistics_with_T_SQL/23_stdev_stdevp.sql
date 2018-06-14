SELECT VARP(VacationHours) AS [VARPVacation]        -- 822.874
  , VAR(VacationHours) AS [VARVacation]             -- 826.192
  , STDEVP(VacationHours) AS [STDEVPVacation]       --  28.686
  , STDEV(VacationHours) AS [STDEVVacation]         --  28.744
  , VARP(SickLeaveHours) AS [VARPSickHours]         -- 211.140
  , VAR(SickLeaveHours) AS [VARSickHours]           -- 211.962
  , STDEVP(SickLeaveHours) AS [STDEVPSickHours]     --  14.531
  , STDEV(SickLeaveHours) AS [STDEVSickHours]       --  14.559
FROM HumanResources.EmpCopy