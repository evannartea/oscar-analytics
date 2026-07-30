CREATE TABLE staging.nominees AS
SELECT
	rne.nominee_id,
	rne.tmdb_person_id,
	rne.full_name,
	rne.birthday::date AS birthday,
	rne.deathday::date AS deathday,
	rne.birthplace
FROM raw.nominees rne
ORDER BY rne.full_name;