CREATE OR REPLACE VIEW `your-gcp-project-ID.dados_analiticos.vw_top_movies` AS
SELECT
    movie_id,
    title,
    genres,
    release_year,
    total_rating,
    ROUND(avg_rating, 2) AS avg_rating
FROM `your-gcp-project-ID.dados_analiticos.vw_movies_kpis`
WHERE total_rating >= 30
ORDER BY avg_rating DESC
LIMIT 10