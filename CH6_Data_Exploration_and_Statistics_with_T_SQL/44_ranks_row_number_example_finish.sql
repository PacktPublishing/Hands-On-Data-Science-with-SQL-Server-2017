; WITH cte AS
(
  SELECT *, ROW_NUMBER() OVER(PARTITION BY Id ORDER BY LoadDate DESC) AS rn
  FROM ServiceTicketHistory
  WHERE LoadDate = '20180602'
)
SELECT * FROM cte WHERE rn = 1