CREATE TABLE warehouse.dim_nominee AS
SELECT
	sne.*,
	cm.country_code AS birth_country_code
FROM staging.nominees sne
LEFT JOIN warehouse.birth_country_mapping cm
	ON regexp_replace(
	    trim(reverse(split_part(reverse(sne.birthplace), ',', 1))),
	    '[\[\]\(\)\.]',
	    '',
	    'g'
	) = cm.raw_birth_country
ORDER BY sne.full_name;