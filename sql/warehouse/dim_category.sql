CREATE TABLE warehouse.dim_category AS
SELECT
	sct.category_id,
	sct.category_name,
	sct.category_group
FROM staging.categories sct;