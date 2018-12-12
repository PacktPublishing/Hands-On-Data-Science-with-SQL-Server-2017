-- confusing condition added to the HAVING clause
SELECT
  CategoryName
  , SubcategoryName
  , COUNT(*) as RecordCount
FROM #src
GROUP BY CategoryName, SubcategoryName
HAVING COUNT(*) >= 5 AND CategoryName != 'Clothing'

-- clearly writen query filtering records on right places
SELECT
  CategoryName
  , SubcategoryName
  , COUNT(*) as RecordCount
FROM #src
WHERE CategoryName != 'Clothing'
GROUP BY CategoryName, SubcategoryName
HAVING COUNT(*) >= 5