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
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
  ) AS WholeSubtotal
  , 100 * YearlySubtotal / SUM(YearlySubtotal) OVER
  (
    ORDER BY OrderYear
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
  ) AS PercentOfWhole
FROM cte
ORDER BY OrderYear