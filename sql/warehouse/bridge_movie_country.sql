CREATE TABLE warehouse.bridge_movie_country (
	movie_id int NOT NULL,
	country_id int NOT NULL,
	
	PRIMARY KEY (movie_id, country_id),
	FOREIGN KEY (movie_id) REFERENCES warehouse.dim_movie(movie_id),
	FOREIGN KEY (country_id) REFERENCES warehouse.dim_country(country_id)
);

INSERT INTO warehouse.bridge_movie_country (
	movie_id,
	country_id
)
SELECT
	sm.movie_id,
	dc.country_id
FROM staging.movies sm
CROSS JOIN LATERAL unnest(sm.origin_country::text[]) AS c(country)
JOIN warehouse.dim_country dc
	ON dc.country_code = c.country;