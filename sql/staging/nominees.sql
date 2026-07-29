CREATE TABLE staging.nominees AS
SELECT
	ne.nominee_id,
	ne.full_name,
	ne.birthday::date AS birthday,
	ne.deathday::date AS deathday,
	ne.birthplace
FROM raw.nominees ne
ORDER BY ne.nominee_id;