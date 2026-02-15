/* Write your T-SQL query statement below */
select query_name,
       cast(round(avg(rating*1.0/position),2) as decimal(10,2))quality,
       cast(round(sum(case when rating <3 then 1.0 else 0 end) * 100.0/count(*), 2) as decimal(10,2))poor_query_percentage 
from Queries
group by query_name
order by query_name