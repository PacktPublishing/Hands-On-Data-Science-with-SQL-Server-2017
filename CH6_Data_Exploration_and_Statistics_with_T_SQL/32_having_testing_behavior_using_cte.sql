; WITH cte AS
(
SELECT
  CategoryName
  , SubcategoryName
  , COUNT(*) as RecordCount
FROM #src
GROUP BY CategoryName, SubcategoryName
)
SELECT * FROM cte WHERE RecordCount >= 5