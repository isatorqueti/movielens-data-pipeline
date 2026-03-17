CREATE OR REPLACE VIEW `your-gcp-project-ID.dados_analiticos.vw_scatter_popularity_vs_quality` AS
SELECT
    movieId,
    title,
    genres,
    release_year,
    total_rating,
    avg_rating
FROM `your-gcp-project-ID.dados_analiticos.vw_movies_kpis`
WHERE total_rating >= 30