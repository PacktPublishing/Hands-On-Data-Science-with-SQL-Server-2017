; WITH cte AS
(
SELECT YEAR(OrderDate) AS OrderYear
  , SUM(SubTotal) AS YearlySubtotal
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate)
)
SELECT * 
  , SUM(YearlySubtotal) OVER
  (
    ORDER BY OrderYear
    ROWS BETWEEN UNBOUNDED FOLLOWING AND CURRENT ROW
  ) AS RunningSubtotal
FROM cte