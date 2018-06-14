; WITH cte AS
(
SELECT YEAR(OrderDate) AS OrderYear
  , SUM(SubTotal) AS YearlySubtotal
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate)
)
SELECT * 
  , (SELECT SUM(YearlySubtotal) FROM cte) AS WholeSubtotal
FROM cte
ORDER BY OrderYear

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
FROM cte
ORDER BY OrderYear