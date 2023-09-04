SELECT
    DAYOFWEEK(created_at) - 1 AS dayofweek,
    HOUR(created_at) AS hour,
    COUNT(1) AS pushes
FROM github_events
WHERE
    repo_id IN (41986369)
    AND type = 'PushEvent'
    AND action = ''
    
GROUP BY dayofweek, hour
ORDER BY dayofweek, hour
;
