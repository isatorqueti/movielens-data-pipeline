CREATE OR REPLACE EXTERNAL TABLE `your-gcp-project-ID.dados_raw.movies_raw`
(
    movieId STRING,
    title STRING,
    genres STRING

)
OPTIONS (
    format = 'CSV',
    uris = ['gs://your-gcs-bucket/bronze/movies.csv']
);

CREATE OR REPLACE EXTERNAL TABLE `your-gcp-project-ID.dados_raw.movie_elicitation_set_raw`
(
    movieId STRING,
    month_idx STRING, 
    source STRING,
    tstamp STRING
)
OPTIONS (
    format = 'CSV',
    uris = ['gs://your-gcs-bucket/bronze/movie_elicitation_set.csv']
);

CREATE OR REPLACE EXTERNAL TABLE `your-gcp-project-ID.dados_raw.belief_data_raw`
(
    userId STRING,
    movieId STRING,
    isSeen STRING,
    watchDate STRING,
    userElicitRating STRING,
    userPredictRating STRING,
    userCertainty STRING,
    tstamp STRING,
    month_idx STRING,
    source STRING,
    systemPredictRating STRING
)
OPTIONS (
    format = 'CSV',
    uris = ['gs://your-gcs-bucket/bronze/belief_data.csv']
);

CREATE OR REPLACE EXTERNAL TABLE `your-gcp-project-ID.dados_raw.user_rating_history_raw`
(
    userId STRING,
    movieId STRING,
    rating STRING,
    timestamp STRING
)
OPTIONS (
    format = 'CSV',
    uris = ['gs://your-gcs-bucket/bronze/user_rating_history.csv']
);

CREATE OR REPLACE EXTERNAL TABLE `your-gcp-project-ID.dados_raw.ratings_for_additional_users_raw`
(
    userId STRING,
    movieId STRING,
    rating STRING,
    timestamp STRING
)
OPTIONS (
    format = 'CSV',
    uris = ['gs://your-gcs-bucket/bronze/ratings_for_additional_users.csv']
);

CREATE OR REPLACE EXTERNAL TABLE `your-gcp-project-ID.dados_raw.user_recommendation_history_raw`
(
    userId STRING,
    tstamp STRING,
    movieId STRING,
    predictedRating STRING
)
OPTIONS (
    format = 'CSV',
    uris = ['gs://your-gcs-bucket/bronze/user_recommendation_history.csv']
);