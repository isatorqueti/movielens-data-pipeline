CREATE OR REPLACE VIEW `your-gcp-project-ID.dados_analiticos.vw_movies_kpis` AS
SELECT
    dm.movie_id,
    dm.title,
    dm.genres,
    gm.release_year,
    COUNT(fr.rating) AS total_rating,
    AVG(fr.rating) AS avg_rating,
    MIN(fr.rating_ts) AS first_rating_ts,
    MAX(fr.rating_ts) AS last_rating_ts
FROM `your-gcp-project-ID.dados_analiticos.dim_movies` AS dm
LEFT JOIN `your-gcp-project-ID.dados_analiticos.fact_ratings` AS fr
ON dm.movie_id = fr.movie_id
GROUP BY 1,2,3,4