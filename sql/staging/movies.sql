CREATE TABLE staging.movies AS
SELECT DISTINCT
	rm.movie_id,
	rm.title,
	rm.release_date::date AS release_date,
    rm.runtime,
	rm.genres,
	rm.origin_country
FROM raw.movies rm
ORDER BY rm.movie_id;