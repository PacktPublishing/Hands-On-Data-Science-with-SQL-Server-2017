declare @nThMoment int = 3
-- calculation using T-SQL
;with cte as
(
select * from (values (1.), (.5), (2.), (3.)) as vals(c)
) , cte2
as
(
select
  power(c - (select AVG(c) from cte), @nThMoment) as pwr
from cte
)
select sum(pwr) / (select count(*) from cte2)
from cte2

-- calculation using dbo.STAT_MOMENT custom aggregation
;with cte as
(
select * from (values (1.), (.5), (2.), (3.)) as vals(c)
)
select dbo.STAT_MOMENT(c, @nThMoment) from cte