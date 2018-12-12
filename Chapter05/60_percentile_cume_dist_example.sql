SELECT StudentName
  , Score
  , CUME_DIST() OVER (ORDER BY Score) as CumeDist
FROM TestResults
ORDER BY 3 DESC