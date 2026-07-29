CREATE TABLE staging.nominations AS
SELECT DISTINCT
	n.nomination_id,
	n.category_id,
	n.ceremony_id,
	n.movie_id,
	n.nominee_id,
	n.is_song,
	n.winner
FROM raw.nominations n
ORDER BY n.ceremony_id DESC, n.nomination_id DESC;