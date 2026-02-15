/* Write your T-SQL query statement below */
SELECT 
    p.project_id, 
    CAST(ROUND(AVG(e.experience_years * 1.0), 2) AS DECIMAL(10, 2)) AS average_years
FROM Project p
INNER JOIN Employee e 
    ON p.employee_id = e.employee_id
GROUP BY p.project_id;