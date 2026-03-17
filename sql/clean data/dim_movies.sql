CREATE OR REPLACE TABLE `your-gcp-project-ID.dados_analiticos.dim_movies`
SELECT
    SAFE_CAST(movieId AS INT64) AS movie_id,
    CAST(TRIM(regexp_replace(CAST(title AS STRING), r'\((\d{4})\)$|\d{4}$', '')) AS STRING) AS title,
    CAST(genres AS STRING) AS genres,
    SAFE_CAST(regexp_extract(CAST(title AS STRING), r'\((\d{4})\)$|\d{4}$') AS INT64) AS release_year
FROM `your-gcp-project-ID.dados_raw.movies_raw`