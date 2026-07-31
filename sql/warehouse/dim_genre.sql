CREATE TABLE warehouse.dim_genre (
	genre_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	genre varchar(30)
);

INSERT INTO warehouse.dim_genre (
	genre
)
SELECT DISTINCT
	unnest(sm.genres::text[]) AS genre
FROM staging.movies sm
ORDER BY genre;