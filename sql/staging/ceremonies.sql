CREATE TABLE staging.ceremonies AS
SELECT DISTINCT
	cr.ceremony_id,
	cr.ceremony_year,
	to_date(ceremony_date, 'Day, Month DD, YYYY') AS ceremony_date,
	cr.venue
FROM raw.ceremonies cr
ORDER BY cr.ceremony_id;