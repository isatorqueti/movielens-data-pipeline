CREATE OR REPLACE VIEW `your-gcp-project-ID.dados_analiticos.vw_ratings_heatmap` AS
SELECT
    EXTRACT(YEAR FROM rating_ts) AS year,
    EXTRACT(MONTH FROM rating_Ts) AS month_number,
    FORMAT_TIMESTAMP('%b', rating_ts) AS mont_name
    COUNT(rating) AS total_rating
FROM `your-gcp-project-ID.dados_analiticos.fact_ratings`
GROUP BY 1,2,3
ORDER BY 1,2