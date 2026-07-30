CREATE TABLE warehouse.category_era AS
WITH split_eras AS (
    SELECT
        category_id,
        era,
        trim(x) AS era_part
    FROM staging.categories
    CROSS JOIN LATERAL regexp_split_to_table(era, ',') x
)
SELECT
    category_id,
    era,
    (regexp_match(era_part, '\d{4}'))[1]::int AS start_year,
    CASE
        WHEN era_part ILIKE '%present%' THEN NULL
        WHEN era_part ~ '\d{4}\s*[-–]\s*\d{4}' THEN
            (regexp_match(era_part, '[-–]\s*(\d{4})'))[1]::int
        ELSE
            (regexp_match(era_part, '\d{4}'))[1]::int
    END AS end_year
FROM split_eras
ORDER BY category_id;