CREATE VIEW PublicDisease AS
SELECT DISTINCT disease
FROM disease;

GRANT SELECT ON PublicDisease to Public;