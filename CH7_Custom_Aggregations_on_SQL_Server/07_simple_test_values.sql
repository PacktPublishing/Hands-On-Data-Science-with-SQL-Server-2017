;with cte as
(
select * from (values (1.), (2.), (3.)) as vals(c)
)
select * from cte