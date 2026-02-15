/* Write your T-SQL query statement below */
select contest_id, cast(round(count(u.user_id)*100.0/(select count(*) from Users),2) as decimal(10,4)) as "percentage" from Users u 
inner join Register r on u.user_id=r.user_id
group by contest_id 
order by "percentage" desc, contest_id asc