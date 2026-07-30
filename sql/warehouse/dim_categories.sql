CREATE TABLE warehouse.dim_categories AS
SELECT
	sct.category_id,
	sct.category_name,
	sct.category_group
FROM staging.categories sct;