CREATE OR REPLACE TABLE `your-gcp-project-ID.dados_analiticos.fact_ratings`
WITH all_ratings AS (
-- tabela user rating history
SELECT
    SAFE_CAST(NULLIF(userId, '') AS INT64) AS user_id,
    SAFE_CAST(NULLIF(movieId, '') AS INT64) AS movie_id,
    SAFE_CAST(NULLIF(NULLIF(rating, 'NA'), '') AS FLOAT64), AS rating,
    COALESCE(
		SAFE.PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S%Ez', tstamp),
		SAFE.PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', tstamp)
		) AS rating_ts,
    'user_rating_history' AS src
FROM `your-gcp-project-ID.dados_raw.user_rating_history_raw`

UNION ALL

-- tabela ratings for additional users
SELECT
    SAFE_CAST(NULLIF(userId, '') AS INT64) AS user_id,
    SAFE_CAST(NULLIF(movieId, '') AS INT64) AS movie_id,
    SAFE_CAST(NULLIF(NULLIF(rating, 'NA'), '') AS FLOAT64), AS rating,
    COALESCE(
		SAFE.PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S%Ez', tstamp),
		SAFE.PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', tstamp)
		) AS rating_ts,
    'ratings_for_additional_users' AS src
FROM `your-gcp-project-ID.dados_raw.ratings_for_additional_users_raw`

UNION ALL

--tabela belief data
SELECT
    SAFE_CAST(NULLIF(userId, '') AS INT64) AS user_id,
    SAFE_CAST(NULLIF(movieId, '') AS INT64) AS movie_id,
    SAFE_CAST(NULLIF(NULLIF(userElicitRating, 'NA'), '') AS FLOAT64) AS rating,
	COALESCE(
		SAFE.PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S%Ez', tstamp),
		SAFE.PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', tstamp)
		) AS rating_ts,
		'belief_data' AS src
FROM `your-gcp-project-ID.dados_raw.belief_raw`
WHERE isSeen = '1' AND SAFE_CAST(NULLIF(NULLIF(userElicitRating, 'NA'), '') AS FLOAT64) > 0;
)

SELECT
    user_id,
    movie_id,
    rating,
    rating_ts,
    src
FROM all_ratings
WHERE user_id IS NOT NULL
AND movie_id IS NOT NULL
AND rating IS NOT NULL
AND rating_ts IS NOT NULL;