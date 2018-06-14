; WITH cte AS
(
SELECT YEAR(OrderDate) AS OrderYear
  , ISNULL(SalesPersonID, 0) as SalesPersonID
  , SUM(SubTotal) AS YearlySubtotal
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate), ISNULL(SalesPersonID, 0)
)
SELECT * 
  , LAG(YearlySubtotal, 1, NULL) OVER 
  (
    PARTITION BY SalesPersonID 
    ORDER BY OrderYear
  ) AS PreviousYearlySubtotal
FROM cte
ORDER BY SalesPersonID, OrderYear