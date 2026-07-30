CREATE TABLE staging.nominations AS
SELECT DISTINCT
	rn.nomination_id,
	rn.category_id,
	rn.ceremony_id,
	rn.movie_id,
	rn.nominee_id,
	rn.is_song,
	rn.winner
FROM raw.nominations rn
ORDER BY rn.ceremony_id DESC, rn.nomination_id DESC;