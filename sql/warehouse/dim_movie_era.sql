CREATE TABLE warehouse.dim_movie_era (
	era_id int PRIMARY KEY,
	era varchar(50),
	start_date date,
	end_date date
);

INSERT INTO warehouse.dim_movie_era (
	era_id,
	era,
	start_date,
	end_date
)
VALUES
(1, 'The Silent Era', '1894-01-01', '1927-10-05'),
(2, 'The Golden Age of Hollywood', '1927-10-06', '1967-08-12'),
(3, 'New Hollywood', '1967-08-13', '1975-06-19'),
(4, 'The Blockbuster Age of Hollywood', '1975-06-20', '9999-12-31');