CREATE TABLE staging.movies AS
SELECT
	m.movie_id,
	m.title,
	to_date(m.release_date, 'YYYY-MM-DD') AS release_date,
	m.genres,
	m.origin_country
FROM raw.movies m
ORDER BY m.movie_id;