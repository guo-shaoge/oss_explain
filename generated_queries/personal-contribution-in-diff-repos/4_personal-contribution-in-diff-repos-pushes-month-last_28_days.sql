SELECT
    repo_id,
    ANY_VALUE(repo_name) AS repo_name,
    COUNT(id) AS cnt,
    DATE_FORMAT(created_at, '%Y-%m-01 00:00:00') AS event_period
FROM github_events ge
WHERE
    actor_id = 5086433
    AND type = 'PushEvent' AND action = ''
    AND (created_at BETWEEN DATE_SUB(NOW(), INTERVAL 28 DAY) AND NOW())
GROUP BY repo_id, event_period
ORDER BY repo_id, event_period DESC
