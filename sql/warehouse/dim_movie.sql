CREATE TABLE warehouse.dim_movie (
	movie_id int PRIMARY KEY,
	title varchar(250),
	release_date date,
	runtime int,
	era_id int,
	
	FOREIGN KEY (era_id) REFERENCES warehouse.dim_movie_era(era_id)
);

INSERT INTO warehouse.dim_movie (
	movie_id,
	title,
	release_date,
	runtime,
	era_id
)
SELECT
	sm.movie_id,
	sm.title,
	sm.release_date,
	sm.runtime,
	me.era_id
FROM staging.movies sm
JOIN warehouse.dim_movie_era me
	ON sm.release_date
		BETWEEN me.start_date AND me.end_date;