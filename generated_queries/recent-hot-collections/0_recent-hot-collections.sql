WITH collectionsOrderByVisits AS (
	SELECT
		CAST(JSON_EXTRACT(query, '$.collectionId') AS SIGNED) AS collection_id,
		COUNT(*) AS visits
	FROM stats_api_requests
	WHERE
		path LIKE '/q/collection-%'
        AND finished_at > DATE_SUB(NOW(), INTERVAL 1 MONTH)
	GROUP BY collection_id
	ORDER BY visits DESC
), top10collections AS (
	SELECT c.id, c.name, cv.visits
	FROM collectionsOrderByVisits cv
	JOIN collections c ON cv.collection_id = c.id
)
SELECT *
FROM (
	SELECT
		tc.id,
		tc.name,
		tc.visits,
		ci.repo_id,
		ci.repo_name,
		ROW_NUMBER() OVER (PARTITION BY ci.collection_id ORDER BY IFNULL(ci.last_month_rank, 999999)) AS `rank`,
		ci.last_month_rank,
		ci.last_2nd_month_rank,
		(ci.last_2nd_month_rank - ci.last_month_rank) AS rank_changes,
		COUNT(*) OVER (PARTITION BY ci.collection_id) AS repos
	FROM collection_items ci
	JOIN top10collections tc ON ci.collection_id = tc.id
) sub
WHERE `rank` <= 3
ORDER BY visits DESC;
