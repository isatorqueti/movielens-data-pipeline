CREATE OR REPLACE VIEW `your-gcp-project-ID.dados_analiticos.vw_genre_performance` AS
SELECT
    dm.genres,
    COUNT(rating) AS total_rating,
    AVG(rating) AS avg_rating
FROM `your-gcp-project-ID.dados_analiticos.fact_ratings` AS fr
LEFT JOIN `your-gcp-project-ID.dados_analiticos.dim_movies` AS dm
ON fr.movie_id = dm.movie_id
CROSS JOIN UNNEST(SPLIT(COALESCE(dm.genres, ''), '|')) AS genre
WHERE genre != ''
AND genre != '(no genres listed)'
GROUP BY 1
ORDER BY total_rating DESC, avg_rating DESC