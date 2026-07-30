CREATE TABLE staging.ceremonies AS
SELECT DISTINCT
	rcr.ceremony_id,
	rcr.ceremony_year,
	to_date(ceremony_date, 'Day, Month DD, YYYY') AS ceremony_date,
	rcr.venue
FROM raw.ceremonies rcr
ORDER BY rcr.ceremony_id;