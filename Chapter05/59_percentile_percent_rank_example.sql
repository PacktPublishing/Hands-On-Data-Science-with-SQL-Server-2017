SELECT StudentName
    , Score
    , PERCENT_RANK() OVER (ORDER BY Score) as PercentRank
FROM TestResults
ORDER BY 3 DESC