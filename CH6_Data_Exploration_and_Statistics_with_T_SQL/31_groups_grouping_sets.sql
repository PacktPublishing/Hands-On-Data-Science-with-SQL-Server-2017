SELECT
  CategoryName
  , SubcategoryName
  , COUNT(*) as RecordCOunt
FROM #src
GROUP BY GROUPING SETS
(
  (CategoryName, SubcategoryName)
  , (CategoryName)
  , ()
)