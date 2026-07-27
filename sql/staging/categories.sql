CREATE TABLE staging.categories AS
SELECT
	ct.category_id,
	ct.category_name,
	initcap(ct.category_group) AS category_group,
	ct.era
FROM raw.categories ct
ORDER BY ct.category_id;