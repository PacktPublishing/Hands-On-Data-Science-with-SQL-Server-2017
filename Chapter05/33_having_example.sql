SELECT
  CategoryName
  , SubcategoryName
  , COUNT(*) as RecordCount
FROM #src
GROUP BY CategoryName, SubcategoryName
HAVING COUNT(*) >= 5