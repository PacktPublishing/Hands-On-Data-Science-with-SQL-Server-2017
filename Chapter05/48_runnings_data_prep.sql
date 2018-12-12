; WITH cte AS
(
SELECT YEAR(OrderDate) AS OrderYear
  , SUM(SubTotal) AS YearlySubtotal
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate)
)
SELECT * FROM cte