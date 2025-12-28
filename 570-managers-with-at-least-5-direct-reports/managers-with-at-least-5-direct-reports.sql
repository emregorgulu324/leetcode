/* Write your T-SQL query statement below */
select e.name from (select managerId from Employee
group by managerId
having count(*)>=5
) a
inner join Employee e on e.id=a.managerId