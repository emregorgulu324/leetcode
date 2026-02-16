SELECT 
    ROUND(
        COUNT(a1.player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 
    2) AS fraction
FROM (
    -- Her oyuncunun SADECE ilk giriş tarihini buluyoruz
    SELECT player_id, MIN(event_date) AS first_login 
    FROM Activity 
    GROUP BY player_id
) a
INNER JOIN Activity a1 
    ON a.player_id = a1.player_id 
    AND DATEDIFF(a1.event_date, a.first_login) = 1;