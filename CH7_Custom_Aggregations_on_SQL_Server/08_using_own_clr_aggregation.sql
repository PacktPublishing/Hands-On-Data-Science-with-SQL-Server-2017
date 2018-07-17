declare @nThMoment int = 3
;with cte as
(
select * from (values (1.), (2.), (3.)) as vals(c)
)
select dbo.STAT_MOMENT(c, @nThMoment) from cte
go

declare @nThMoment int = 3
;with cte as
(
select * from (values (1.), (.5), (2.), (3.)) as vals(c)
)
select dbo.STAT_MOMENT(c, @nThMoment) from cte
go