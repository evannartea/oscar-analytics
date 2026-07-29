CREATE TABLE staging.movies AS
SELECT 
	m.movie_id,
	m.title,
	m.release_date::date AS release_date,
    m.runtime,
	trim(m.genres,'{}') AS genres,
	trim(m.origin_country,'{}') AS origin_country
FROM raw.movies m
ORDER BY m.movie_id;