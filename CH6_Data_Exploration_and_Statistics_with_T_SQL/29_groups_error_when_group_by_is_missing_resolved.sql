SELECT
  SubcategoryName
  , SYSDATETIME() as ResultTime
  , COUNT(*) as RecordCount
FROM #src
GROUP BY SubcategoryName