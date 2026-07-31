CREATE TABLE staging.movies AS
SELECT DISTINCT
	rm.movie_id,
	rm.title,
	CASE
		WHEN rm.movie_id = 3943 THEN date '1946-03-18'
		WHEN rm.movie_id = 5581 THEN date '1976-08-10'
		WHEN rm.movie_id = 6095 THEN date '1987-02-25'
		WHEN rm.movie_id = 6360 THEN date '1991-08-22'
		WHEN rm.movie_id = 7575 THEN date '2013-09-20'
		WHEN rm.movie_id = 8078 THEN date '2023-09-23'
		ELSE rm.release_date::date
	END AS release_date,
    rm.runtime,
	rm.genres,
	rm.origin_country
FROM raw.movies rm
ORDER BY rm.movie_id;