CREATE TABLE warehouse.bridge_movie_genre (
	movie_id int NOT NULL,
	genre_id int NOT NULL,
	
	PRIMARY KEY (movie_id, genre_id),
	FOREIGN KEY (movie_id) REFERENCES warehouse.dim_movie(movie_id),
	FOREIGN KEY (genre_id) REFERENCES warehouse.dim_genre(genre_id)
);

INSERT INTO warehouse.bridge_movie_genre (
	movie_id,
	genre_id
)
SELECT
	sm.movie_id,
	dg.genre_id
FROM staging.movies sm
CROSS JOIN LATERAL unnest(sm.genres::text[]) AS g(genre)
JOIN warehouse.dim_genre dg
	ON dg.genre = g.genre;