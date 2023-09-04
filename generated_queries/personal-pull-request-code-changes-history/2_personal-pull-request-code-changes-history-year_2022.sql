SELECT
    DATE_FORMAT(created_at, '%Y-%m-01') AS event_month,
    SUM(additions) AS additions,
    SUM(deletions) AS deletions,
    SUM(additions + deletions) AS changes
FROM github_events ge
WHERE
    creator_user_id = 5086433
    AND type = 'PullRequestEvent'
    AND action = 'closed'
    AND pr_merged = true
    AND (created_at BETWEEN '2022-01-01' AND '2022-12-31')
GROUP BY 1
ORDER BY 1
;
