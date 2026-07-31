CREATE TABLE warehouse.dim_country (
	country_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	country_code char(2) NOT NULL
);

INSERT INTO warehouse.dim_country (
	country_code
)
SELECT DISTINCT
	unnest(sm.origin_country::text[]) AS country_code
FROM staging.movies sm
ORDER BY country_code;