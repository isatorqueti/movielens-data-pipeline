CREATE OR REPLACE VIEW `your-gcp-project-ID.dados_analiticos.vw_user_activity` AS
SELECT
    user_id,
    COUNT(movie_id) AS total_rating,
    COUNT(DISTINCT movie_id) AS distinct_movies_rated,
    AVG(rating) AS avg_rating,
    MIN(rating) AS first_rating,
    MAX(rating) AS last_rating
FROM `your-gcp-project-ID.dados_analiticos.fact_ratings`
GROUP BY 1
ORDER BY total_rating DESC, avg_rating DESC