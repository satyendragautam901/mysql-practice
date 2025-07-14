create database Activity;
use Activity;

CREATE TABLE Activity (
    user_id INT,
    session_id INT,
    activity_date DATE,
    activity_type ENUM('open_session', 'end_session', 'scroll_down', 'send_message')
);
INSERT INTO Activity (user_id, session_id, activity_date, activity_type)
VALUES 
(1, 1, '2019-07-20', 'open_session'),
(1, 1, '2019-07-20', 'scroll_down'),
(1, 1, '2019-07-20', 'end_session'),
(2, 4, '2019-07-20', 'open_session'),
(2, 4, '2019-07-21', 'send_message'),
(2, 4, '2019-07-21', 'end_session'),
(3, 2, '2019-07-21', 'open_session'),
(3, 2, '2019-07-21', 'send_message'),
(3, 2, '2019-07-21', 'end_session'),
(4, 3, '2019-06-25', 'open_session'),
(4, 3, '2019-06-25', 'end_session');

-- users activity for 30 day

select activity_date as day, count(distinct user_id) as users from Activity where activity_date between '2019-06-28' and '2019-07-27' group by activity_date;

-- using recursive if for a day no users then show 0.
-- Generate all 30 days using a recursive CTE

-- Yeh part ek "virtual table" banata hai jisme 30 rows honge, ek ek date badhte hue
WITH RECURSIVE Dates AS (
    SELECT DATE('2019-06-28') AS day        -- Start from this date

    UNION ALL
		-- interal call for day+1
    SELECT DATE_ADD(day, INTERVAL 1 DAY)    -- Add +1 day every time
    FROM Dates
    WHERE day < '2019-07-27'                -- Stop when we reach the final day
)

-- count activity of users
SELECT 
    d.day,
    COUNT(DISTINCT a.user_id) AS active_users
FROM Dates d
LEFT JOIN Activity a
    ON d.day = a.activity_date
GROUP BY d.day;


