CREATE TABLE staging.categories AS
SELECT DISTINCT
	rct.category_id,
	rct.category_name,
	initcap(ct.category_group) AS category_group,
	rct.era
FROM raw.categories rct
ORDER BY rct.category_id;