SELECT
    DATE_FORMAT(created_at, '%Y-%m-01') AS star_month,
    COUNT(1) AS cnt
FROM github_events ge
WHERE
    actor_id = 5086433
    AND type = 'WatchEvent'
    AND action = 'started'
    AND (created_at BETWEEN '2022-01-01' AND '2022-12-31')
GROUP BY 1
ORDER BY 1