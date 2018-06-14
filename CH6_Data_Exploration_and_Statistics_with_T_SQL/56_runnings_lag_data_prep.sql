; WITH cte AS
(
SELECT YEAR(OrderDate) AS OrderYear
  , ISNULL(SalesPersonID, 0) as SalesPersonID
  , SUM(SubTotal) AS YearlySubtotal
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate), ISNULL(SalesPersonID, 0)
)
SELECT * FROM cte
ORDER BY SalesPersonID, OrderYear