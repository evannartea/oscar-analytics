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

UPDATE staging.nominees sne
SET birthplace = CASE
	WHEN sne.nominee_id = 146 THEN 'Sándorháza, Austria-Hungary [now Romania]'
	WHEN sne.nominee_id = 228 THEN 'Drohobych, Austro-Hungarian Empire [now Ukraine]'	
	WHEN sne.nominee_id = 539 THEN 'Sucha, Galicia, Austria-Hungary [now Poland]'
	WHEN sne.nominee_id = 874 THEN 'Wiznitz, Bukovina, Austria-Hungary [now Ukraine]'
	WHEN sne.nominee_id = 1297 THEN 'Sopron, Austria-Hungary [now Hungary]'
	WHEN sne.nominee_id = 2022 THEN 'Vienna, Austria-Hungary [now Austria]'
	WHEN sne.nominee_id = 2848 THEN 'Budzanów, Austria-Hungary [now Ukraine]'
END
WHERE sne.nominee_id in (146, 228, 539, 874, 1297, 2022, 2848);