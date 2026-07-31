CREATE TABLE warehouse.dim_genre (
	genre_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	genres int UNIQUE
);

INSERT INTO warehouse.dim_genre (
	genres
)
SELECT DISTINCT
	unnest(sm.genres::text[]) AS genres
FROM staging.movies sm
ORDER BY genres;